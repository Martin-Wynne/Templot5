
(*
================================================================================

    This file is part of OpenTemplot2024, a computer program for the design of model railway track.
    Copyright (C) 2024  Martin Wynne.  email: martin@85a.uk

    This program is free software: you may redistribute it and/or modify
    it under the terms of the GNU General Public Licence as published by
    the Free Software Foundation, either version 3 of the Licence, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public Licence for more details.

    You should have received a copy of the GNU General Public Licence
    along with this program. See the file: licence.txt

    Or if not, refer to the web site: https://www.gnu.org/licenses/

================================================================================

   This file was saved from Delphi5

   This file was derived from Templot2 version 244d

*)

unit math2_unit;

   //  0.93.a  maths unit for make diamond-crossing at intersection   mod 228a
   // and extend to meet  213b
   // and tangential link 223c
   // and make Y-symm  227a

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  StdCtrls, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, MaskEdit, FileCtrl, Math,

  pad_unit;

type
  Tintersect_result=record
                      angle:extended;
                      code:integer;
                    end;

var
  intersect_cancel_clicked:boolean=False;    // 227a

  function do_notch_on_intersection(making_diamond,move_notch:boolean; rail_offset_control,rail_offset_bgnd:integer; top_str,next_str:string):boolean;

  procedure make_diamond_crossing_at_intersection;

  function notch_on_intersection(move_notch:boolean; control_rail_offset,bgnd_rail_offset:integer):integer;
  function get_circle_intersections(x1,y1,r1, x2,y2,r2:extended; var qx1,qy1,k1_r1,k1_r2, qx2,qy2,k2_r1,k2_r2:extended):integer;

  function check_if_inside_4_corners(p,corner1,corner2,corner3,corner4:Tpex):boolean;

  function check_if_control_template_on_screen:boolean;

  function extend_to_boundary(index,boundary:integer; grow,ignore_error:boolean):boolean;  // 213b

  procedure make_tangential_link;  // 223c

  function peg_on_intersection(index,bgnd_rail,control_rail:integer; bgnd_peg,allow_pegging,making_diamond:boolean):Tintersect_result;   // 228a

  procedure make_symm_y_turnout(len:integer); // 227a    0=short, 1=long, -1=very short

  function force_symmetry(click:boolean; limit_rad:extended):boolean;   // 227a   set curviform and adjust radii to equal


implementation

uses
  control_room, math_unit, info_unit, keep_select, bgkeeps_unit, shove_timber, alert_unit, help_sheet, grid_unit, rail_options_unit, wait_message, gaps_unit, intersect_unit;

var
  dummy:extended=0;

  tangential_help_str:string;

  which_one:integer=1;       // which_one = +1 or -1 to select which intersection
  xing_angle:extended=0;     // radians

  x_for_notch:extended=0;
  y_for_notch:extended=0;

  fail_code:integer=0;

  saved_rad,saved_radx,saved_rady:extended;     // 226c

//______________________________________________________________________________

function check_if_control_template_on_screen:boolean;

  // return True if any part of the control template enclosing rectangle will be on the screen (central 80%).
  // part of intersection selector for the user.

var
  ctx_max:extended;
  ctx_min:extended;

  cty_max:extended;
  cty_min:extended;

  scx_max:extended;
  scx_min:extended;

  scy_max:extended;
  scy_min:extended;

begin
  RESULT:=False;  // init

    // 80% screen corners around intersection...

  scx_max:=x_for_notch+screenx/2.5;
  scx_min:=x_for_notch-screenx/2.5;

  scy_max:=y_for_notch+screeny/2.5;
  scy_min:=y_for_notch-screeny/2.5;

    // control template extents in 1/100th mm, convert to mm ...

  ctx_max:=xy_max[0]/100;              // top right corner
  cty_max:=y_datum+(xy_max[1]/100);

  ctx_min:=xy_min[0]/100;              // bottom left corner
  cty_min:=y_datum+xy_min[1]/100;




  if ctx_max<scx_min then EXIT;    // control template entirely to left of screen

  if ctx_min>scx_max then EXIT;    // control template entirely to right of screen

  if cty_max<scy_min then EXIT;    // control template entirely below screen

  if cty_min>scy_max then EXIT;    // control template entirely above screen

  RESULT:=True;  // must be some overlap of rectangles
end;
//______________________________________________________________________________

function calc_radial_angle(xc,yc,x,y:extended):extended;

  // return all positive angles (acw), so we can do arithmetic on them easily

var
  k:extended;

begin
  RESULT:=0;          // init
  k:=0;

  if ABS(x-xc)<minfp
     then begin
            if y>=yc                   // north from centre
               then RESULT:=Pi/2
               else RESULT:=Pi+Pi/2;   // south from centre
            EXIT;
          end;

  if ABS(y-yc)<minfp
     then begin
            if x>=xc              // east from centre
               then RESULT:=0
               else RESULT:=Pi;   // west from centre
            EXIT;
          end;

  k:=ARCTAN(ABS(y-yc)/ABS(x-xc));

  RESULT:=k; // north-east

  if (x>xc) and (y<yc) then RESULT:=Pi*2-k;  // south-east
  if (x<xc) and (y>yc) then RESULT:=Pi-k;    // north-west
  if (x<xc) and (y<yc) then RESULT:=Pi+k;    // south-west
end;
//______________________________________________________________________________

function check_if_inside_4_corners(p,corner1,corner2,corner3,corner4:Tpex):boolean;

  // return True if p is inside 4-sided polygon

  // (maths works for higher-sided polygon)

var
  corners:array[0..3] of Tpex;
  n,i:integer;
  ydiff:extended;

begin
  RESULT:=False;    // init...
  corners[0]:=corner1;
  corners[1]:=corner2;
  corners[2]:=corner3;
  corners[3]:=corner4;

    // find intersections of horizontal line stretching to the right of p with any side...

  try
    n:=3;                         // any two different corners...
    for i:=0 to 3 do begin

      if ((p.y>corners[i].y) and (p.y<corners[n].y)) or ((p.y>corners[n].y) and (p.y<corners[i].y))
         then begin
                ydiff:=corners[n].y-corners[i].y;
                if ABS(ydiff)<minfp then CONTINUE; // prevent div zero - horizontal side can't intersect

                if p.x<((corners[n].x-corners[i].x)*(p.y-corners[i].y)/ydiff+corners[i].x)    // intersection?

                   then RESULT:= NOT RESULT;  // needs an odd number of intersections for p to be inside
              end;

      n:=i;   // do all 4 sides
    end;

  except
    RESULT:=False;
  end;//try

end;
//______________________________________________________________________________

function notch_on_intersection(move_notch:boolean; control_rail_offset,bgnd_rail_offset:integer):integer;

   // return code:
   // 2 = OK, two usable intersections
   // 1 = OK, but only one intersection is usable, which_one ignored
   // 0 = OK, but neither intersection is usable
   // -1 = FAIL, one circle is completely outside the other
   // -2 = FAIL, one circle is completely inside the other
   // -3 = FAIL, circles are identical copies
   // -4 = FAIL, calculation exception
   // -5 = FAIL, transition template
   // -6 = FAIL, slew template
   // -7 = FAIL, invalid control template

   // returns also the angle difference at the notch

   // move_notch=False means here for calcs only, no visual change

var
  saved_control:Ttemplate_info;

  new_notch_data:Tnotch;

  x1,y1,r1:extended;
  x2,y2,r2:extended;
  xi,yi,xj,yj:extended;

  k1_i,k1_j,k2_i,k2_j:extended;

  k:extended;

begin
  RESULT:=0-4;               // default fail init.

  xing_angle:=0;
  x_for_notch:=0;
  y_for_notch:=0;

  with new_notch_data do begin
    notch_x:=0;
    notch_y:=0;
    notch_k:=0;
  end;//with

  if (clicked_keep_index<0) or (clicked_keep_index>(keeps_list.Count-1)) or (keeps_list.Count<1) then EXIT;

  if check_control_template_is_valid('intersection')=False
     then begin
            RESULT:=0-7;
            EXIT;  // zero length
          end;

  if spiral=True
     then begin
            RESULT:=0-5;
            EXIT;
          end;

   if slewing=True
       then begin
              RESULT:=0-6;
              EXIT;
            end;

        // save the control ...

  saved_control:=hold_the_control;  // 227a

  try    // finally
    try  // except

              // get data for current control template ...

      gocalc(0,0);

      x1:=rad1_orgx;
      y1:=rad1_orgy;
      r1:=ABS(nomrad)+control_rail_offset*g/2;

          // now get the background template, and repeat...

      list_position:=clicked_keep_index;              // make it current in the keeps box.
      copy_keep_to_current(False,False,True,False);   // copy to pad.

          // get data for the bgnd template ...

      gocalc(0,0);

      if check_control_template_is_valid('intersection')=False
         then begin
                RESULT:=0-7;
                EXIT;  // zero length
              end;

      if spiral=True
         then begin
                RESULT:=0-5;
                EXIT;
              end;

       if slewing=True
           then begin
                  RESULT:=0-6;
                  EXIT;
                end;

      x2:=rad1_orgx;
      y2:=rad1_orgy;
      r2:=ABS(nomrad)+bgnd_rail_offset*g/2;   // (bgnd template may be n.g. but is now the control)

           // 226c used in make diamond-crossing at intersection...

      saved_rad:=ABS(nomrad);
      saved_radx:=x2;
      saved_rady:=y2;

           // 226c end

      RESULT:=get_circle_intersections(x1,y1,r1, x2,y2,r2, xi,yi,k1_i,k2_i, xj,yj,k1_j,k2_j);

      if RESULT<1 then EXIT;  // no usable intersections

      if which_one=1         // if RESULT=1 both of these are the same...
         then begin
                with new_notch_data do begin
                  notch_x:=xi;
                  notch_y:=yi;
                  notch_k:=k1_i-Pi/2;  // align with control template
                end;//with

                k:=ABS(k1_i-k2_i);        // angle difference
              end
         else begin
                with new_notch_data do begin
                  notch_x:=xj;
                  notch_y:=yj;
                  notch_k:=k1_j-Pi/2;  // align with control template
                end;//with

                k:=ABS(k1_j-k2_j);        // angle difference
              end;


            // return data (globals) ...

      if k>Pi then k:=Pi*2-k;        // adjust angle ..
      if k>(Pi/2) then k:=Pi-k;

      xing_angle:=ABS(k);

      x_for_notch:=new_notch_data.notch_x;
      y_for_notch:=new_notch_data.notch_y;

      if move_notch=True
         then begin
                pad_form.notch_unlinked_from_current_menu_entry.Click;    // cancel any moving the notch in mouse actions.

                new_notch(new_notch_data,True);      // new data, and link group if wanted.

                redraw_pad(True,False);       // no need to put this change in rollback register on redraw.
              end;

    except
      RESULT:=0-4;
      EXIT;
    end;//try

  finally
    unhold_the_control(saved_control);   // 227a    restore the original control
  end;//try
end;
//______________________________________________________________________________

function get_circle_intersections(x1,y1,r1, x2,y2,r2:extended; var qx1,qy1,k1_r1,k1_r2, qx2,qy2,k2_r1,k2_r2:extended):integer;

   // return code:
   // 2 = OK, two usable intersections
   // 1 = OK, but only one intersection is usable
   // 0 = OK, but neither intersection is usable
   // -1 = FAIL, one circle is completely outside the other
   // -2 = FAIL, one circle is completely inside the other
   // -3 = FAIL, circles are identical copies
   // -4 = FAIL, calculation exception

   // return intersections at q1 and q2   // k is radial angle to intersection, not rail angle.

   // derived from public-domain code by Tim Voght

var
  a,dx,dy,d,h,rx,ry,xp,yp:extended;

  limit_dim:extended;

begin
  RESULT:=2;  // init good result

  // fail inits for returned vars ...

  qx1:=0;
  qy1:=0;

  qy2:=0;
  qx2:=0;

  k1_r1:=0;
  k1_r2:=0;

  k2_r1:=0;
  k2_r2:=0;

  r1:=ABS(r1);  // prevent exceptions
  r2:=ABS(r2);

  if (r1<scale) or (r2<scale)  // sensible limits
     then begin
            RESULT:=0-4;
            EXIT;
          end;

  try

    if (x1=x2) and (y1=y2) and (r1=r2)
       then begin
              RESULT:=0-3;   // circles identical
              EXIT;
            end;

         // X and Y distances between the circle centres..

    dx:=x2-x1;
    dy:=y2-y1;

    d:=SQRT(SQR(dy)+SQR(dx));    // diagonal distance between the centres

    if d>(r1+r2)       // no intersection, gap between circles
       then begin
              if (d-(r1+r2))<1E-9   // if by tiny amount, adjust r2 in the calcs. 1E-9 arbitrary. templates not changed.
                 then begin
                        r2:=r2+1E-9;
                        RESULT:=1;    // only one intersect
                      end
                 else begin
                        RESULT:=0-1;
                        EXIT;        // circles do not intersect
                      end;
            end
       else begin
              if d<ABS(r1-r2)   // one within other
                 then begin
                        if (ABS(r1-r2)-d)<1E-9   // if by tiny amount, adjust r2 in the calcs. 1E-9 arbitrary. templates not changed.
                           then begin
                                  if r2>r1 then r2:=r2-1E-9
                                           else r2:=r2+1E-9;
                                  RESULT:=1;
                                end
                           else begin
                                  RESULT:=0-2;
                                  EXIT;        // one circle is contained in the other
                                end;
                      end;
            end;

          // xp,yp is the point where the line through the circle intersection points
          // crosses the line between the circle centres ...

    a:=(SQR(r1)-SQR(r2)+SQR(d))/2/d;    // distance point 0 to point 2


    xp:=x1+(dx*a/d);  // coordinates of point p
    yp:=y1+(dy*a/d);

         // get the distance from point p to either of the intersection points ...


    if (SQR(r1)-SQR(a))<=0    // no neg
       then h:=0
       else h:=SQRT(SQR(r1)-SQR(a));

         // get the offsets of the intersection points from point 2 ...

    rx:=0-dy*h/d;
    ry:=dx*h/d;

        // return the intersection points q ...

    qx1:=xp+rx;    // 1st intersect..
    qy1:=yp+ry;

    qy2:=yp-ry;    // 2nd intersect..
    qx2:=xp-rx;

    if (ABS(qx1-qx2)<1E-4) and (ABS(qy1-qy2)<1E-4) then RESULT:=1;  // coincident, effectively only one intersection. 1E-4 arbitrary.

    limit_dim:=max_rad_test/10;  // arbitrary screen limit for sensible display

    if  ( (ABS(qx1)>limit_dim) or (ABS(qy1)>limit_dim) )
    and ( (ABS(qx2)>limit_dim) or (ABS(qy2)>limit_dim) )   // neither can sensibly be displayed
        then begin
               RESULT:=0;
               EXIT;
             end;

    if (ABS(qx1)>limit_dim) or (ABS(qy1)>limit_dim)   // q1 can't sensibly be displayed
       then begin
              RESULT:=1;
              qx1:=qx2;    // so duplicate q2
              qy1:=qy2;
            end;

    if (ABS(qx2)>limit_dim) or (ABS(qy2)>limit_dim)   // q2 can't sensibly be displayed
       then begin
              RESULT:=1;
              qx2:=qx1;    // so duplicate q1
              qy2:=qy1;
            end;

           // radial angles from centres ...

    k1_r1:=calc_radial_angle(x1,y1,qx1,qy1);     // to 1st intersect..
    k1_r2:=calc_radial_angle(x2,y2,qx1,qy1);

    k2_r1:=calc_radial_angle(x1,y1,qx2,qy2);     // to 2nd intersect..
    k2_r2:=calc_radial_angle(x2,y2,qx2,qy2);

  except
    RESULT:=0-4;
    EXIT;
  end;//try
end;
//______________________________________________________________________________

function do_notch_on_intersection(making_diamond,move_notch:boolean; rail_offset_control,rail_offset_bgnd:integer; top_str,next_str:string):boolean;

  // rail offsets from centre-line: 0=none, 1=outer, -1=inner

  // return True if the notch is now on an intersection

             // 0.93.a
const
  notch_intersection_help_str:string='php/109    `0Notch on Intersection`9';

var
  i,code:integer;

  angle_str,hd_str:string;

  target_showing:boolean;

  temp:extended;

begin
  RESULT:=False;  // init
  which_one:=1;   // init

  i:=0;           // keep compiler happy
  target_showing:=False;

  code:=notch_on_intersection(move_notch,rail_offset_control,rail_offset_bgnd);

  if code=2        // 2 intersections found. Show firstly the one with the control template on screen.
     then begin
            if check_if_control_template_on_screen=False
               then begin
                      which_one:=0-1;
                      code:=notch_on_intersection(move_notch,rail_offset_control,rail_offset_bgnd);  // code shouldn't change.
                    end;
          end;

  if ABS(xing_angle-Pi/2)<1E-2          // 2 decimal places shown.
     then angle_str:='90 degrees'
     else if ABS(xing_angle)<1E-2
             then angle_str:='0'
             else begin
                    temp:=TAN(xing_angle);
                    if ABS(temp)>minfp then angle_str:=round_str(xing_angle*180/Pi,2)+' degrees ( 1: '+round_str(1/temp,2)+'  RAM )'
                                       else angle_str:='0';
                  end;

  case code of

     -7: EXIT; // invalid zero-length template -- already alerted in notch_on_intersection()

     -6: i:=alert(6,'php/109    notch  on  intersection',
                   top_str+'Sorry, this function is not available because one or both templates contains a slew.'
                  +'||If the intersection is not within the slewing zone, try again after using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.'
                  +'||If the intersection is within the slewing zone, you may be able to perform this operation manually by moving the fixing peg along the rails (`0CTRL+F8`2 mouse action).',
                   '','','','more  information','cancel','',4);

     -5: i:=alert(6,'php/109    notch  on  intersection',
                   top_str+'Sorry, this function is not available because one or both templates contains a transition curve.'
                  +'||If the intersection is not within the transition zone, try again after using the TOOLS > MAKE SPLIT > menu options accordingly.'
                  +'||If the intersection is within the transition zone, you may be able to perform this operation manually by moving the fixing peg along the rails (CTRL+F8 mouse action).',
                   '','','','more  information','cancel','',4);

     -4: alert(2,'php/109    notch  on  intersection',
               top_str+'Sorry, the intersect calculations have failed to produce a result',
               '','','','','cancel','',0);

     -3: i:=alert(6,'php/109    notch  on  intersection',
               top_str+'There is no intersection because the control template and background template are both on the same alignment.',
               '','','','more  information','cancel','',4);

  -2,-1: i:=alert(6,'php/109    notch  on  intersection',
               top_str+'The control template does not intersect the background template.',
               '','','','more  information','cancel','',4);

      0: i:=alert(3,'php/109    notch  on  intersection',
               top_str+'The template intersections are too far off-screen to be usable.',
               '','','','more  information','cancel','',4);

      1: begin                              // only one usable intersect. one or both straight templates, or very large radius

           target_showing:=pad_form.show_zoom_target_menu_entry.Checked;
           pad_form.show_zoom_target_menu_entry.Checked:=True;             // show the zooming ring at centre

           pad_form.pad_on_notch_menu_entry.Click;   // centre on it
           redraw_pad(False,False);                  // and show it

           if making_diamond=True   // called from make_diamond_crossing
              then begin
                     pad_form.show_zoom_target_menu_entry.Checked:=target_showing;  // reset
                     RESULT:=True;                                                 
                   end
              else begin
                     repeat

                       with alert_box do begin          // 205d
                         left_panbutton.Visible:=True;
                         right_panbutton.Visible:=True;
                         down_panbutton.Visible:=True;
                         up_panbutton.Visible:=True;
                       end;//with

                       alert_option2a_click_code:=1;    // zoom in   205d
                       alert_option2b_click_code:=2;    // zoom out

                       i:=alert(3,'php/109    notch  on  intersection',
                               top_str+next_str+'There is only one usable intersection, now shown by the position of the notch at the centre of the trackpad.'
                              +'||The intersection angle is  '+angle_str+'.| ',
                               '','_2a_+  zoom in_2b_-  zoom out','','more  information','cancel  -  reset  notch','continue',4);

                       if i=4 then alert_help(0,notch_intersection_help_str,'');

                     until i>4;

                     pad_form.show_zoom_target_menu_entry.Checked:=target_showing;  // reset

                     if i=5 then begin
                                   pad_form.reset_notch_menu_entry.Click;
                                   EXIT;
                                 end;

                     if i=6 then RESULT:=True;
                   end;
         end;

      2: begin     // normal result, 2 curved templates ...

           target_showing:=pad_form.show_zoom_target_menu_entry.Checked;
           pad_form.show_zoom_target_menu_entry.Checked:=True;             // show the zooming ring at centre

           pad_form.pad_on_notch_menu_entry.Click;   // centre on it
           redraw_pad(False,False);                  // and show it

           repeat

              with alert_box do begin          // 205d
                left_panbutton.Visible:=True;
                right_panbutton.Visible:=True;
                down_panbutton.Visible:=True;
                up_panbutton.Visible:=True;
              end;//with

              alert_option2a_click_code:=1;    // zoom in   205d
              alert_option2b_click_code:=2;    // zoom out

              if making_diamond=True
                 then begin
                        i:=alert(7,'php/109    make  diamond - crossing  at  intersection',
                                   'This function uses the pegging notch.'
                                  +'||There are two places where the templates intersect, or would intersect if sufficiently extended in length. Templot needs to know which intersection is the one you want.'
                                  +'||If the place now shown by the position of the notch (ringed in yellow) is not the place where you want to make a diamond-crossing, please click|TRY OTHER INTERSECTION.'
                                  +'||If the trackpad appears to be blank or you do not understand what you are seeing, please click|TRY OTHER INTERSECTION.'
                                  +'||For some explanations and diagrams, please click|MORE INFORMATION.'
                                  +'||The intersection angle is  '+angle_str+'.',
                                   '','_2a_+  zoom in_2b_-  zoom out','more  information','try  other  intersection','cancel  diamond - crossing   -   reset  notch      ','continue   -   make  diamond - crossing  at  notch    ',3);
                      end
                 else begin
                        i:=alert(4,'php/109    notch  on  intersection',
                                   'There are two places where the templates intersect, or would intersect if sufficiently extended in length.'
                                  +'||Is the notch on the required intersection, now showing at the centre of the trackpad?'
                                  +'||The intersection angle is  '+angle_str+'.| ',
                                   '','_2a_+  zoom in_2b_-  zoom out','more  information','no  -  try  other  intersection  instead','cancel  -  reset  notch','yes  -  continue',3);
                      end;

              case i of
                     3: alert_help(0,notch_intersection_help_str,'');

                     4: begin
                          which_one:=0-which_one;
                          notch_on_intersection(move_notch,rail_offset_control,rail_offset_bgnd);  // don't need result, same dims as before
                          pad_form.pad_on_notch_menu_entry.Click;   // centre on it
                          redraw_pad(False,False);                  // and show it
                        end;

                     5: begin
                          pad_form.reset_notch_menu_entry.Click;
                          pad_form.show_zoom_target_menu_entry.Checked:=target_showing;   // reset
                          EXIT;
                        end;

                     6: RESULT:=True;

              end;//case
           until i=6;

           pad_form.show_zoom_target_menu_entry.Checked:=target_showing;   // reset

         end;

    else run_error(40);
  end;//case
  if i=4 then help(0,notch_intersection_help_str,'');

     // extra ...

  if (RESULT=True) and (plain_track=False) and (move_notch=True)
  and (rail_offset_control<>0) and (rail_offset_bgnd<>0) and (ABS(TAN(xing_angle))>minfp)
     then begin
            if 1/ABS(TAN(xing_angle))<1.5 then EXIT;

            if half_diamond=True
               then hd_str:='half-diamond'
               else hd_str:='turnout';

            repeat

              with alert_box do begin          // 205d
                left_panbutton.Visible:=True;
                right_panbutton.Visible:=True;
                down_panbutton.Visible:=True;
                up_panbutton.Visible:=True;
              end;//with

              alert_option2a_click_code:=1;    // zoom in   205d
              alert_option2b_click_code:=2;    // zoom out

              i:=alert(3,'php/111    notch  now  on  rail  intersection',
                         'The pegging notch is now on the requested rail intersection.'
                        +'||Do you want to set the '+hd_str+' in the control template to a V-crossing angle of '+angle_str
                        +' and peg the V-crossing onto the notch?'
                        +'||The fixing peg will be moved to the FP position (`0CTRL-4`2).'
                        +'||The turnout-road exit will be set to a minimum (`0GEOMETRY > TURNOUT-ROAD EXIT LENGTH >`1 menu options).'
                        +'||Select the `0CURVIFORM`z option below unless both tracks are straight or curved to the same radius in the same direction.'
                        +'||rp.gif This function will work correctly only if the '+hd_str+' in the control template has been previously set to the required hand and is facing in the required direction.'
                        +'  It may be necessary to rotate the '+hd_str+' by 180 degrees after pegging. Click the `0GEOMETRY > SHIFT/ROTATE > ROTATE 180 DEGREES`1 menu item.',
                         '','_2a_+  zoom in_2b_-  zoom out','more  information','yes  please  -  with  REGULAR  V - crossing','no  thanks','yes  please  -  with  CURVIFORM  V - crossing',3);

              if i=3 then alert_help(0,notch_intersection_help_str,'');

              if i=5 then EXIT;

            until i>3;

            k3n:=1/ABS(TAN(xing_angle));

            if i=4 then xing_type_i:=0
                   else xing_type_i:=1;

            turnout_road_i:=3;        // set minimum length to minimize mis-match

            gocalc(0,0);

            if peg_code<>4  // not already on main side peg angle.
               then pad_form.peg_on_fp_menu_entry.Click;

            gocalc(0,0);

            shift_onto_notch(False,False);

            redraw_pad(True,True);
          end;
end;
//______________________________________________________________________________

procedure make_diamond_crossing_at_intersection;   // 226c re-write...

    // 228a mods

var
  was_turnout:boolean;
  was_half_diamond:boolean;
  was_xorg:extended;
  was_mvjpx:extended;
  was_minendx:extended;
  was_turnoutx:extended;

  saved_control:Ttemplate_info;

  k3n1,k3n2:extended;

  k_angle:extended;

  info_showing:boolean;

  short_angle_help_str:string;

      //////////////////////////////////////////////////////////////////////////

      function diamond_calcs:boolean;  // 226c re-write...

         // 228a now plain track only

      var
        temp_control:Ttemplate_info;

        dist0,dist9,xing_size:extended;

        no_split:boolean;
        no_split_str,split6_str,split4_str:string;

        i,stored:integer;

        v1_turnoutx,v2_turnoutx:extended;

        org_cenx,org_ceny:extended;

        min_match:extended;

        thdpx1,thdpx2:extended;

        hdkn1:extended;

        iii:integer;

        intersect_result:Tintersect_result;


                            //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                            function convert_to_unit_angle(k:extended):extended;

                            begin
                              try
                                RESULT:=ABS(1/TAN(k));
                              except
                                RESULT:=0;
                              end;//try
                            end;
                            //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                            function test_thdp_fit:extended;    // 226c

                                    // generated THDP to original curve centre, return difference from radius
                            var
                              thd_loc_x,thd_loc_y:extended;
                              thd_on_pad_x,thd_on_pad_y:extended;
                              dummy1,dummy2:extended;
                            begin
                              gocalc(0,0);

                              try
                                docurving(True,True,thdpx,aq25offset(thdpx,dummy1),thd_loc_x,thd_loc_y,dummy1,dummy2);  // curve and transform THDP to get position on pad.

                                thd_on_pad_x:=thd_loc_x;
                                thd_on_pad_y:=thd_loc_y*hand_i+y_datum;

                                RESULT:=ABS(SQRT(SQR(thd_on_pad_x-saved_radx)+SQR(thd_on_pad_y-saved_rady))-saved_rad);
                              except
                                RESULT:=maxfp;
                              end;//try
                            end;
                            //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                            function adjust_k3n:boolean;     // 226c adjust k3n until THDP closest fit to original curve ...

                                     // 228a mods

                            var
                              k3n_mod:extended;
                              k3n_calc:extended;
                              k3n_org:extended;
                              proximity:extended;
                              proximity_old:extended;

                            begin
                              RESULT:=False;  // init

                              k3n_org:=k3n;        // in case fail

                              k3n_calc:=0.3;       // init
                              k3n_mod:=0.25;       // init

                              proximity_old:=50000;  // init very large start

                              try
                                repeat

                                  k3n_calc:=k3n_calc+k3n_mod;                      // first run 0.55
                                  if (k3n_calc>100) or (k3n_calc<0.3) then EXIT;   // failed, out of range

                                  k3n:=k3n_calc;

                                  proximity:=test_thdp_fit;

                                  if proximity=maxfp then EXIT;  // failed

                                  if proximity>proximity_old         // gone past the closest fit
                                     then k3n_mod:=0-k3n_mod/10;     // creep back again

                                  proximity_old:=proximity;

                                until (ABS(proximity)<0.0001) or (ABS(k3n_mod)<0.000001);      // arbitrary precision (needed for good fit)

                                if ABS(proximity)<0.002 then RESULT:=True;   // arbitrary 1/500th mm

                              finally
                                if (RESULT=True) and (k3n_calc<200) and (k3n_calc>0.3)    // arbitrary
                                   then k3n:=k3n_calc
                                   else begin
                                          k3n:=k3n_org;    // restore if no usable success
                                          RESULT:=False;
                                        end;

                                gocalc(0,0);
                              end;

                            end;
                            //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      begin
        RESULT:=False;  // init
        fail_code:=0;   // ok
        min_match:=0.001;   // arbitrary radial match

        info_showing:=info_form.Showing;

        wait_form.waiting_label.Caption:='fitting half-diamonds...';
        wait_form.waiting_label.Width:=wait_form.Canvas.TextWidth(wait_form.waiting_label.Caption);  // 205b bug fix for Wine

        wait_form.wait_progressbar.Visible:=False;
        info_form.Hide;                              // prevent flickering results
        wait_form.Show;

        Screen.Cursor:=crHourGlass;
        Application.ProcessMessages;

        try

          org_cenx:=rad1_orgx;     // radial centre for control template - half-diamonds must match
          org_ceny:=rad1_orgy;

          intersect_cancel_clicked:=False;     // 236b bug-fix
          intersect_result:=peg_on_intersection(clicked_keep_index,24,24,False,False,True);

          if intersect_result.code=-2
             then begin
                    fail_code:=-2;    // templates not overlaid?
                    EXIT;
                  end;

          k_angle:=intersect_result.angle;   // 228a       24=MS centre-line

          if k_angle<1E-5
             then begin
                    fail_code:=-1;    // tangential or near
                    EXIT;
                  end;

          hdkn:=convert_to_unit_angle(k_angle);

          if hdkn<0.5     // 228a
            then begin
                   fail_code:=1;     // too short
                   EXIT;
                 end;

          if hdkn>80      // 228a
            then begin
                   fail_code:=2;    // too long or infinite
                   EXIT;
                 end;

          k3n:=hdkn;

          insert_half_diamond;

          if (Ttemplate(keeps_list.Objects[clicked_keep_index]).bgnd_is_straight=True) and (ABS(nomrad)>=max_rad_test)   // all straight

             then xing_type_i:=0        // regular crossings
             else xing_type_i:=1;       // default to curviform crossings
             
          turnout_road_i:=2;    // adjustable

          hd_vcheck_rails:=0;     // normal check rails
          hd_timbers:=0;          // normal timber lengths

          if retain_shoves_on_make=False then clear_shovedata;  // clear any shoved timbers.
          if retain_diffs_on_make=False then clear_check_diffs; // 0.94.a clear any check rail diffs

          if gaps_form.symbols_retain_on_make_checkbox.Checked=False    // 227a
             then begin
                    delete_all_symbols;
                  end;

          turnoutx:=mvjpx+60*scale;   // arbitrary template length  -- 60ft beyond vee joint
          turnout_i:=1;               // length locked at turnoutx.

          gocalc(0,0);

            // find first half-diamond ...

          pad_form.reset_peg_menu_entry.Click;   // to CTRL-0
          shift_onto_notch(False,False);         // notch is already on centre

          gocalc(0,0);

          repeat
            if ABS(nomrad)>=max_rad_test then BREAK;  // 228b bug fix for straight template, ignore curving

            if (ABS(org_cenx-rad1_orgx)<min_match) and (ABS(org_ceny-rad1_orgy)<min_match)  // radial centre for existing control - half-diamonds must match
               then BREAK;

            invert_curving;      // try opposite curving
            gocalc(0,0);

            if (ABS(org_cenx-rad1_orgx)<min_match) and (ABS(org_ceny-rad1_orgy)<min_match)  // radial centre for existing control - half-diamonds must match
               then BREAK;

            fail_code:=3;
            EXIT;                // rad centre not found

          until 0=0;  // once only


          if adjust_k3n=False      // fit THDP to background curve
             then begin

                    invert_handing;

                    if adjust_k3n=False
                       then begin
                              fail_code:=4;     // can't find a fit
                              EXIT;
                            end;
                  end;

          gocalc(0,0);

          turnout_road_endx:=thdpx;  // set adjustable exit rails at THDP  (xorg=0 for half_diamond)
          gocalc(0,0);

          thdpx1:=ABS(thdpx);  // for later fits
          k3n1:=k3n;           // and info..
          hdkn1:=hdkn;

          store_and_background(False,False);      // store 1st one

          rotate_turnout(Pi,True);   // rotate 180 degrees and adjust...
          gocalc(0,0);

          invert_curving;

          if adjust_k3n=False      // fit THDP to background curve
             then begin
                    fail_code:=5;        // can't find a fit, remove 1st template
                    EXIT;
                  end;

           gocalc(0,0);

          turnout_road_endx:=thdpx;  // set adjustable exit rails at THDP  (xorg=0 for half_diamond)
          gocalc(0,0);

          thdpx2:=ABS(thdpx);  // for later fits
          k3n2:=k3n;           // and info

          store_and_background(False,False);      // store 2nd one

           // diamond-crossing done...

          Screen.Cursor:=crDefault;
          wait_form.Hide;
          if info_showing=True then info_form.Show;

         show_and_redraw(False,True);       // might be hidden (allow rollback)

           // calculate (straight-line) distances from centre (on notch) to the ends of the background template...

         with Ttemplate(keeps_list.Objects[clicked_keep_index]).snap_peg_positions do begin

           dist0:=SQRT(SQR(notchx-ctrl_0_pos.notch_x)+SQR(notchy-ctrl_0_pos.notch_y));
           dist9:=SQRT(SQR(notchx-ctrl_9_pos.notch_x)+SQR(notchy-ctrl_9_pos.notch_y));

         end;//with

         xing_size:=MAX(thdpx1,thdpx2)-30*inscale;    // from centre, allow at least 6ft-6in from blunt nose (THDP is 9ft from blunt nose along MS)

         if (dist0<xing_size) and (dist9<xing_size)   // can't split if both ends are too close or within diamond-crossing
            then begin
                   no_split:=True;
                   no_split_str:='||The original background template is positioned such that it cannot be extended or split automatically.'
                                +'||It is likely that you intend to delete it. If not it will be necessary to split and/or extend it to the diamond-crossing manually.';
                   split6_str:='yes  -  continue';
                   split4_str:='';
                 end
            else begin
                   no_split:=False;
                   no_split_str:='||And do you now want the original background template to be split and/or extended to fit ?';
                   split6_str:='yes  -  split / extend  background  template  to  fit';
                   split4_str:='yes  -  but  leave  background  template  unchanged';
                 end;

         i:=alert(4,'    make  diamond-crossing  at  intersection',
                 '||Is this the required diamond-crossing ?'
                +'||The K-crossing angle is :||    '+ram_clm_str(hdkn1)
                +'||The V-crossing angles are :||    '+ram_clm_str(k3n1)+'|    '+ram_clm_str(k3n2)
                +no_split_str,
                 '','','',split4_str,'no  -  cancel  diamond-crossing',split6_str,0);

         if i=5 then begin
                       list_position:=keeps_list.Count-1;   // delete last two half-diamond templates, without alerts..
                       delete_keep(False,False);

                       Application.ProcessMessages;

                       list_position:=keeps_list.Count-1;
                       delete_keep(False,False);

                       EXIT;
                     end;

         if i=4 then no_split:=True;

          // diamond-crossing done, now delete original bgnd template to the control and split it onto TVJP positions...

         if (no_split=False) and (keeps_list.Count>1)     // need at least the 2 new half-diamonds
           then begin

                  delete_to_current_popup_entry_click(True);     // true = no alerts

                  pad_form.reset_peg_menu_entry.Click;   // to CTRL-0
                  gocalc(0,0);

                  was_xorg:=xorg;
                  was_mvjpx:=mvjpx;
                  was_minendx:=xorg+min_main_road_endx;
                  was_turnoutx:=turnoutx;

                  was_turnout:=(NOT plain_track) and (NOT half_diamond);
                  was_half_diamond:=(NOT plain_track) and half_diamond;

                  if plain_track=False then pad_form.convert_to_plain_track_menu_entry.Click;

                  gocalc(0,0);

                    // save it for later ..

                  temp_control:=hold_the_control;  // 227a

                  gocalc(0,0);

                  stored:=0;

                  if dist0>=xing_size    // ok to do this end...
                     then repeat
                                  // try extending from nothing to v1...

                            xorg:=0.1;         // set template length very short
                            turnoutx:=xorg;
                            turnout_i:=1;      // length locked at new turnoutx.

                            gocalc(0,0);

                            if extend_to_boundary(keeps_list.Count-2,630,True,False)=False then BREAK;   // v1  at THDP   (True is ignored, False=don't ignore errors)

                            gocalc(0,0);

                            v1_turnoutx:=turnoutx;

                                        // try extending from nothing to v2...

                            xorg:=0.1;         // set template length very short
                            turnoutx:=xorg;
                            turnout_i:=1;      // length locked at new turnoutx.

                            gocalc(0,0);

                            if extend_to_boundary(keeps_list.Count-1,630,True,False)=False then BREAK;   // v2  at  THDP   (True is ignored, False=don't ignore errors)

                            gocalc(0,0);

                            v2_turnoutx:=turnoutx;

                            if v1_turnoutx<v2_turnoutx     // revert to v1
                               then begin

                                      xorg:=0.1;         // set template length very short
                                      turnoutx:=xorg;
                                      turnout_i:=1;      // length locked at new turnoutx.

                                      gocalc(0,0);

                                      if extend_to_boundary(keeps_list.Count-2,630,True,False)=False then BREAK;   // v1  at THDP  (True is ignored, False=don't ignore errors)

                                      gocalc(0,0);

                                    end;

                                    // replace turnout or half_diamond...

                            if was_minendx<turnoutx   // at unswapped end? and if room for it...
                               then begin
                                      if was_turnout=True
                                         then begin
                                                insert_turnout;
                                                gocalc(0,0);
                                                xorg:=was_xorg;
                                                gocalc(0,0);
                                              end;

                                      if was_half_diamond=True
                                         then begin
                                                insert_half_diamond;
                                                gocalc(0,0);
                                              end;
                                    end;

                            store_and_background(False,False);

                            stored:=1;

                          until 0=0; // once only

                  unhold_the_control(temp_control);   // 227a        True = retrieve data from

                  swap_end_for_end;    // and swap ends
                  gocalc(0,0);

                     // and repeat for opposite end

                  if dist9>=xing_size    // ok to do opposite end...
                     then repeat

                            pad_form.reset_peg_menu_entry.Click;   // to CTRL-0
                            gocalc(0,0);

                                    // try extending from nothing to v1...

                            xorg:=0.1;         // set template length very short
                            turnoutx:=xorg;
                            turnout_i:=1;      // length locked at new turnoutx.

                            gocalc(0,0);

                            if extend_to_boundary(keeps_list.Count-2-stored,630,True,False)=False then BREAK;   // v1  at THDP   (True is ignored, False=don't ignore errors)

                            gocalc(0,0);

                            v1_turnoutx:=turnoutx;

                                        // try extending from nothing to v2...

                            xorg:=0.1;         // set template length very short
                            turnoutx:=xorg;
                            turnout_i:=1;      // length locked at new turnoutx.

                            gocalc(0,0);

                            if extend_to_boundary(keeps_list.Count-1-stored,630,True,False)=False then BREAK;   // v2  at THDP   (True is ignored, False=don't ignore errors)

                            gocalc(0,0);

                            v2_turnoutx:=turnoutx;

                            if v1_turnoutx<v2_turnoutx     // revert to v1
                               then begin

                                      xorg:=0.1;         // set template length very short
                                      turnoutx:=xorg;
                                      turnout_i:=1;      // length locked at new turnoutx.

                                      gocalc(0,0);

                                      if extend_to_boundary(keeps_list.Count-2-stored,630,True,False)=False then BREAK;   // v1  at THDP   (True is ignored, False=don't ignore errors)

                                      gocalc(0,0);

                                    end;

                            swap_end_for_end;      // facing original way again
                            gocalc(0,0);

                            pad_form.reset_peg_menu_entry.Click;   // to CTRL-0
                            gocalc(0,0);

                                    // replace turnout (diamond is in original approach track)...

                            if (was_turnout=True) and (turnoutx>(was_turnoutx-was_xorg))
                               then begin
                                      insert_turnout;
                                      gocalc(0,0);
                                      xorg:=turnoutx-(was_turnoutx-was_xorg);
                                      gocalc(0,0);
                                    end;

                            store_and_background(False,False);

                            stored:=stored+1;

                          until 0=0;  // once only

                  unhold_the_control(temp_control);   // 227a

                  if stored=0       // bgnd template was not replaced
                     then begin
                            store_and_background(False,False);  // put it back

                            fail_code:=6;   // diamond ok but no fit
                          end;

                end;  // splitting



          default_template;      // a short straight plain track template

          yshift:=yshift-10*g*hand_i;      // move it down the pad arbitrary
          gocalc(0,0);

          save_done:=False;
          backup_wanted:=True;

          if (fail_code=0) or (fail_code=6) then RESULT:=True;

        finally
          Screen.Cursor:=crDefault;
          wait_form.Hide;
          if info_showing=True then info_form.Show;

        end;//try

      end;
      //////////////////////////////////////////////////////////////////////////

begin

  if (clicked_keep_index<0) or (clicked_keep_index>(keeps_list.Count-1)) or (keeps_list.Count<1) then EXIT;

  if plain_track=False
     then begin
            if alert(6,'php/110    make  diamond - crossing  at  intersection',
                      'Sorry, this function is not available because the control template is not plain track.'
                     +'||Try again after using the `0TEMPLATE > CONVERT TO PLAIN TRACK`1 menu function, or split off the approach and/or exit tracks using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.',
                      '','','','more  information  online','cancel','',4)=4
               then go_to_templot_companion_page('find_intersection.php');
            EXIT;
          end;

  if slewing=True
     then begin
            if alert(6,'php/110    make  diamond - crossing  at  intersection',
                      'Sorry, this function is not available because the control template contains a slew.'
                     +'||If the intersection is not within the slewing zone, try again after using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.'
                     +'||If the intersection is within the slewing zone, you may be able to perform this operation manually using the `0PEG/ALIGN TOOLS > FIND INTERSECTION...`1 function.',
                      '','','','more  information  online','cancel','',4)=4
               then go_to_templot_companion_page('find_intersection.php');
            EXIT;
          end;

  if spiral=True
     then begin
            if alert(6,'php/110    make  diamond - crossing  at  intersection',
                      'Sorry, this function is not available because the control template contains a transition curve.'
                     +'||If the intersection is not within the transition zone, try again after using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.'
                     +'||If the intersection is within the transition zone, you may be able to perform this operation manually using the `0PEG/ALIGN TOOLS > FIND INTERSECTION...`1 function.',
                      '','','','more  information  online','cancel','',4)=4
               then go_to_templot_companion_page('find_intersection.php');
            EXIT;
          end;

  pad_form.make_control_popup_entry.Click;  // swap to the background
  gocalc(0,0);                              // ensure calcs done

  if plain_track=False
     then begin
            if alert(6,'php/110    make  diamond - crossing  at  intersection',
                      'Sorry, this function is not available because the background template is not plain track.'
                     +'||Try again after making it the control template and using the `0TEMPLATE > CONVERT TO PLAIN TRACK`1 menu function,'
                     +' or split off the approach and/or exit tracks using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.',
                      '','','','more  information  online','cancel','',4)=4
               then go_to_templot_companion_page('find_intersection.php');

            clicked_keep_index:=keeps_list.Count-1;
            pad_form.make_control_popup_entry.Click;  // swap back again

            EXIT;
          end;

  if slewing=True
     then begin
            if alert(6,'php/110    make  diamond - crossing  at  intersection',
                      'Sorry, this function is not available because the background template contains a slew.'
                     +'||If the intersection is not within the slewing zone, try again after making it the control template and using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.'
                     +'||If the intersection is within the slewing zone, you may be able to perform this operation manually using the `0PEG/ALIGN TOOLS > FIND INTERSECTION...`1 function.',
                      '','','','more  information  online','cancel','',4)=4
               then go_to_templot_companion_page('find_intersection.php');

            clicked_keep_index:=keeps_list.Count-1;
            pad_form.make_control_popup_entry.Click;  // swap back again

            EXIT;
          end;

  if spiral=True
     then begin
            if alert(6,'php/110    make  diamond - crossing  at  intersection',
                      'Sorry, this function is not available because the background template contains a transition curve.'
                     +'||If the intersection is not within the transition zone, try again after making it the control template and using the `0TOOLS > MAKE SPLIT >`1 menu options accordingly.'
                     +'||If the intersection is within the transition zone, you may be able to perform this operation manually using the `0PEG/ALIGN TOOLS > FIND INTERSECTION...`1 function.',
                      '','','','more  information  online','cancel','',4)=4
               then go_to_templot_companion_page('find_intersection.php');

            clicked_keep_index:=keeps_list.Count-1;
            pad_form.make_control_popup_entry.Click;  // swap back again

            EXIT;
          end;

  saved_rad:=ABS(nomrad);    // bgnd rad centres..
  saved_radx:=rad1_orgx;
  saved_rady:=rad1_orgy;

  clicked_keep_index:=keeps_list.Count-1;
  pad_form.make_control_popup_entry.Click;  // swap back again
  gocalc(0,0);                              // ensure calcs done

  clicked_keep_index:=keeps_list.Count-1;   // restore for later

  saved_control:=hold_the_control;  // 227a

  if diamond_calcs=True // 228a
     then begin
            show_and_redraw(False,True);       // might be hidden (allow rollback)

            if fail_code=6
               then begin
                      if alert(2,'php/110    make  diamond - crossing  at  intersection',
                               'It was not possible to extend/split the background template to fit.'
                               +'||It is probably possible to do that manually.',
                               '','','','more  information  online','OK','',4)=4
                         then go_to_templot_companion_page('find_intersection.php');
                    end;

            if (k3n1<1.5) or (k3n2<1.5)
               then begin
                      short_angle_help_str:='    `0Short-angle  V-crossings`9'
                                         +'||This diamond-crossing contains a short V-crossing angle of|    1:'+FormatFloat('0.##',MIN(k3n1,k3n2))
                                         +'||Such short-angle diamond-crossings are not unusual, but prototype designs vary a lot.'

                                         +'||For templates with very short V-crossing angles,|`0curviform`3 V-crossings are not possible and are replaced with|`0generic`3 V-crossings and a minimum diagonal-side exit.'

                                         +'||For all templates with short crossing angles, Templot has insufficient prototype information to lay out the timbers and some customizing is likely to be needed to match your prototype designs.'
                                         +' Click the `0REAL > TIMBERING > TIMBERING DATA...`1 and `0REAL > SHOVE TIMBERS`1 menu items. Add and adjust `0bonus`1 timbers to fill any gaps as necessary,'
                                         +' or click the `0REAL > TIMBERING > SHORT-ANGLE TIMBERING > CONFLICTED`1 menu option to have multiple overlapped timbers which will need adjustment.'

                                         +'||It is likely that the check rails will also need adjustment - click the `0real > adjust check rails...`1 menu item.'
                                         +'||Also for very short crossing angles, some of the `0tools`1 menu functions may fail to produce a satisfactory result.'
                                         +'|| • If you are seeing this message while using partial templates to create complex formations, you can probably ignore it.';

                      help(0,short_angle_help_str,'');
                    end;
          end
     else begin       // no good...

            unhold_the_control(saved_control);   // 227a   // failed to find diamond-crossing, so restore the original control template

            redraw(False);

            case fail_code of

                  -2: begin
                        if alert(6,'php/110    make  diamond - crossing  at  intersection',
                                 'Sorry it is not possible to make a diamond-crossing.'                                         // 228a
                                +'||For this function the intersection must be within both existing template lengths.'
                                +'||In other words, the desired intersection position must be visible on the overlaid templates. You may need to lengthen one or both templates.',
                                 '','','','more  information  online','cancel','',4)=4
                           then go_to_templot_companion_page('find_intersection.php');
                      end;


                  -1: begin
                        if alert(6,'php/110    make  diamond - crossing  at  intersection',
                                 'The templates are tangential at the intersection.'      // 228a
                                +'||Sorry, a diamond-crossing is not possible.',          // 228a
                                 '','','','more  information  online','cancel','',4)=4
                           then go_to_templot_companion_page('find_intersection.php');
                      end;

                   1: begin
                        if alert(6,'php/110    make  diamond - crossing  at  intersection',
                                 'One or more of the crossing angles would be shorter than 1:0.5'      // 228a
                                +'||Sorry, crossings shorter than 1:0.5 are not supported in Templot.' // 228a
                                +'||On the prototype such short crossings are not be made from standard track components. They are specially designed and constructed, and designs vary.'
                                +'||For a model, you can create the basis of a template by overlaying plain tracks. Construction details from your chosen prototype can then be marked on the printed template.| ',
                                 '','','','more  information  online','cancel','',4)=4
                           then go_to_templot_companion_page('find_intersection.php');
                      end;

                   2: begin
                        if alert(6,'php/110    make  diamond - crossing  at  intersection',
                                 'One or more of the crossing angles would be longer than 1:80'           // 228a
                                +'||Sorry, such extremely long crossings are not supported in Templot.',  // 228a
                                 '','','','more  information  online','cancel','',4)=4
                           then go_to_templot_companion_page('find_intersection.php');
                      end;


                 3,4: begin
                        if alert(2,'php/110    make  diamond - crossing  at  intersection',
                                 'Sorry, it is not possible to fit a diamond-crossing to these tracks.',
                                 '','','','more  information  online','cancel','',4)=4
                         then go_to_templot_companion_page('find_intersection.php');
                      end;

                   5: begin
                        if alert(2,'php/110    make  diamond - crossing  at  intersection',
                                 'Sorry, it is not possible to fit a diamond-crossing to these tracks.',
                                 '','','','more  information  online','cancel','',4)=4
                           then go_to_templot_companion_page('find_intersection.php');

                        list_position:=keeps_list.Count-1;   // delete 1st one
                        delete_keep(False,False);
                      end;

            end;//case

            show_and_redraw(False,True);       // might be hidden (allow rollback)
          end;
end;
//______________________________________________________________________________

function extend_to_boundary(index,boundary:integer; grow,ignore_error:boolean):boolean;  // 213b           // ignore_error 226c

  // this function requires an index (bgnd template).

  // boundary = 0, 6, 9, for CTRL-0, 6, 9, on bgnd template
  //          = 240 for TMINP
  //          = 241 for TEXITP

  //          = 260 for MMINP    217a
  //          = 261 for MEXITP   217a

  //          = 600 for TOLP

  //          = 630 for THDP  // 226c

  //          =-1 for nearest

  // control template CTRL-0 , CTRL-9  only, to extend it

  // grow ignored if boundary not -1.  True=extend template  False=shorten template

const
  try_manual_str:string=#13+#13+'Try adjusting the control template manually.';

var
  end0,end9,new_end:Tnotch;

  bgnd_x,bgnd_y:extended;

  nearest_diag:extended;

  i,which_end,which_boundary:integer;

  mod_dir:integer;      // 1=extend, -1=shorten
  arc_length:extended;  // change in template length needed
  arc_rad:extended;

  x_diff,y_diff,k_diff:extended;

  was_end_swapped:boolean;

  old_xorg,old_turnoutx:extended;

  bg_pt,bg_hd,bg_rp:boolean;

  diag0,diag9:extended;

  temp:extended;

  been_here_before:integer;

  grow_str:string;


label
  999;

                            ////////////////////////////////////////////////////

                            procedure show_not_needed;

                            begin
                              show_modal_message(grow_str+'No adjustment to the control template appears to be needed to meet the background template.'
                                                 +#13+#13+'If this is not the case, try adjusting the control template manually.');

                            end;
                            ////////////////////////////////////////////////////

                            function get_nearest_diag:integer;   // update nearest and return which end of control

                            var
                              diag:extended;

                            begin
                              RESULT:=0-1; // init no change to nearest

                              temp:=SQR(bgnd_x-end0.notch_x)+SQR(bgnd_y-end0.notch_y);  // SQRT protection
                              if temp>minfp then diag:=SQRT(temp)
                                            else EXIT;                                  // ???

                              if nearest_diag>diag
                                 then begin
                                        nearest_diag:=diag;
                                        RESULT:=0;            // at CTRL-0
                                      end;

                              temp:=SQR(bgnd_x-end9.notch_x)+SQR(bgnd_y-end9.notch_y);  // SQRT protection
                              if temp>minfp then diag:=SQRT(temp)
                                            else EXIT;                                  // ???

                              if nearest_diag>diag
                                 then begin
                                        nearest_diag:=diag;
                                        RESULT:=9;            // at CTRL-9
                                      end;
                            end;
                            ////////////////////////////////////////////////////

begin
  RESULT:=False;  // init

  grow_str:='';  // init

  if boundary=-1
     then begin
            if grow=True
               then grow_str:='Extending the control template to meet --'+#13+#13
               else grow_str:='Shortening the control template to meet --'+#13+#13;
          end;

  bg_pt:=Ttemplate(keeps_list.Objects[index]).bgnd_plain_track;
  bg_hd:=Ttemplate(keeps_list.Objects[index]).bgnd_half_diamond;
  bg_rp:=Ttemplate(keeps_list.Objects[index]).bgnd_retpar;        // parallel crossing

  was_end_swapped:=False;  // init
  been_here_before:=0;     // init

  arc_length:=0;           // keep compiler happy...
  //long_diag:=0;

  end0.notch_x:=0;
  end0.notch_y:=0;
  end0.notch_k:=0;

  diag0:=0;
  diag9:=0;

  old_xorg:=xorg;          // init for error exit ..
  old_turnoutx:=turnoutx;  // init

  mod_dir:=1;              // init   1=extend  -1=shorten


  with Ttemplate(keeps_list.Objects[index]).boundary_info do begin

    try

      999:

      repeat    // come back and try again after changing the control template

        if been_here_before>20    // protect against endless loop   20 arbitrary
           then begin             // undo and exit
                  arc_length:=0;  // for finally

                  turnoutx:=old_turnoutx;
                  xorg:=old_xorg;

                  if boundary=-1
                     then show_modal_message(grow_str+'Sorry, unable to find a matching MS (main-side) boundary on the selected background template.'+try_manual_str)
                     else show_modal_message('Sorry, unable to find the required boundary on the selected background template.'+try_manual_str);
                  EXIT;
                end;
        INC(been_here_before);

        nearest_diag:=max_rad;  // init   abs between control template and bgnd template
        which_end:=-1;          // init   control template  0 or 9
        which_boundary:=-1;     // init   bgnd template 0 or 9 or 241 or 261 or 600
        arc_rad:=0;             // init   radius at boundary
        arc_length:=0;          // init   abs value of change needed

          // control template end positions...

        if half_diamond=False then end0:=calc_snap_peg_data(0);   // ctrl-0

        end9:=calc_snap_peg_data(11);  // ctrl-9

          // boundary positions, angles, and diagonal across boundaries
          // recorded at copy_keep_to_background() in keep_select unit

        case boundary of

            -1: begin   // nearest MS

                  if grow=True             // grow ignored if boundary not -1 (nearest)
                     then mod_dir:=1       // extend
                     else mod_dir:=-1;     // shorten

                       // find which MS boundary loc is nearest on bgnd template ...

                       // CTRL-0 ...

                  if bg_hd=False    // not CTRL-0 for half-diamond
                     then begin

                            bgnd_x:=loc_0.notch_x;   // using a Tnotch type, no relevance to actual notch
                            bgnd_y:=loc_0.notch_y;

                            i:=get_nearest_diag;
                            if i<>-1
                               then begin
                                      which_end:=i;          // which end of the control template is closest to a bgnd boundary.  =0 or =9
                                      which_boundary:=0;     // which boundary on bgnd template. =0 or =6 or =9
                                    end;
                          end;


                       // CTRL-9 ...

                  bgnd_x:=loc_9.notch_x;
                  bgnd_y:=loc_9.notch_y;

                  i:=get_nearest_diag;
                  if i<>-1
                     then begin
                            which_end:=i;        // which end of the control template is closest to a bgnd boundary.   =0 or =9
                            which_boundary:=9;   // which boundary on bgnd template. =0 or =9
                          end;

                  if (which_end=-1) or (which_boundary=-1) or (nearest_diag>(g*250))  // 250 arbitrary limit
                     then begin
                            show_modal_message(grow_str+'Sorry, unable to find a near boundary on the selected background template.'+try_manual_str);
                            EXIT;
                          end;

                  if which_end=0
                     then begin
                            swap_end_for_end;   // we can modify at nearer CTRL-9 end only. far CTRL-0 datum end stays fixed.
                            gocalc(0,0);

                            was_end_swapped:= NOT was_end_swapped;  // might be coming back here

                            CONTINUE;           // start again
                          end;

                  diag9:=nearest_diag;   // which_end=9

                  if which_boundary=0
                     then begin
                            temp:=SQR(loc_0.notch_x-end0.notch_x)+SQR(loc_0.notch_x-end0.notch_y);  // SQRT protection
                            if temp>minfp then diag0:=SQRT(temp)
                                          else begin
                                                 show_not_needed;
                                                 RESULT:=True;      // 226c
                                                 EXIT;
                                               end;
                          end
                     else begin   // which_boundary=9
                            temp:=SQR(loc_9.notch_x-end0.notch_x)+SQR(loc_9.notch_x-end0.notch_y);  // SQRT protection
                            if temp>minfp then diag0:=SQRT(temp)
                                          else begin
                                                 show_not_needed;
                                                 RESULT:=True;
                                                 EXIT;
                                               end;
                          end;

                end;// nearest MS

             0: if bg_hd=False    // not CTRL-0 for half-diamond    menu should be disabled!
                   then begin
                          temp:=SQR(loc_0.notch_x-end0.notch_x)+SQR(loc_0.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_0.notch_x-end9.notch_x)+SQR(loc_0.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          which_boundary:=0;
                        end
                   else EXIT;

             6: if bg_pt=False    // not CTRL-6 for plain track    menu should be disabled!
                   then begin
                          temp:=SQR(loc_6.notch_x-end0.notch_x)+SQR(loc_6.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_6.notch_x-end9.notch_x)+SQR(loc_6.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else  begin
                                                show_not_needed;
                                                RESULT:=True;
                                                EXIT;
                                              end;

                          which_boundary:=6;

                        end
                   else EXIT;

             9: begin
                  temp:=SQR(loc_9.notch_x-end0.notch_x)+SQR(loc_9.notch_y-end0.notch_y);  // SQRT protection
                  if temp>minfp then diag0:=SQRT(temp)
                                else begin
                                       show_not_needed;
                                       RESULT:=True;
                                       EXIT;
                                     end;

                  temp:=SQR(loc_9.notch_x-end9.notch_x)+SQR(loc_9.notch_y-end9.notch_y);  // SQRT protection
                  if temp>minfp then diag9:=SQRT(temp)
                                else begin
                                       show_not_needed;
                                       RESULT:=True;
                                       EXIT;
                                     end;

                  which_boundary:=9;
                end;

           240: if bg_pt=False    // not TMINP for plain track    menu should be disabled!
                   then begin
                          temp:=SQR(loc_240.notch_x-end0.notch_x)+SQR(loc_240.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_240.notch_x-end9.notch_x)+SQR(loc_240.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          which_boundary:=240;

                        end
                   else EXIT;

           241: if bg_pt=False    // not TEXITP for plain track    menu should be disabled!
                   then begin
                          temp:=SQR(loc_241.notch_x-end0.notch_x)+SQR(loc_241.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_241.notch_x-end9.notch_x)+SQR(loc_241.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          which_boundary:=241;

                        end
                   else EXIT;

           260: if bg_pt=False    // not MMINP for plain track    menu should be disabled!       217a
                   then begin
                          temp:=SQR(loc_260.notch_x-end0.notch_x)+SQR(loc_260.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_260.notch_x-end9.notch_x)+SQR(loc_260.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          which_boundary:=260;

                        end
                   else EXIT;

           261: if bg_pt=False    // not MEXITP for plain track    menu should be disabled!         217a
                   then begin
                          temp:=SQR(loc_261.notch_x-end0.notch_x)+SQR(loc_261.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_261.notch_x-end9.notch_x)+SQR(loc_261.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          which_boundary:=261;

                        end
                   else EXIT;



           600: if (bg_pt=False) and (bg_rp=True)    // TOLP on parallel crossing
                   then begin
                          temp:=SQR(loc_600.notch_x-end0.notch_x)+SQR(loc_600.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_600.notch_x-end9.notch_x)+SQR(loc_600.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          which_boundary:=600;

                        end
                   else EXIT;

           630: if bg_pt=False    // not THDP for plain track
                   then begin
                          temp:=SQR(loc_630.notch_x-end0.notch_x)+SQR(loc_630.notch_y-end0.notch_y);  // SQRT protection
                          if temp>minfp then diag0:=SQRT(temp)
                                        else begin
                                               show_not_needed;
                                               RESULT:=True;
                                               EXIT;
                                             end;

                          temp:=SQR(loc_630.notch_x-end9.notch_x)+SQR(loc_630.notch_y-end9.notch_y);  // SQRT protection
                          if temp>minfp then diag9:=SQRT(temp)
                                        else  begin
                                                show_not_needed;
                                                RESULT:=True;
                                                EXIT;
                                              end;

                          which_boundary:=630;

                        end
                   else EXIT;

        end;//case

        if diag9>diag0
           then begin
                  swap_end_for_end;   // we can modify at nearer CTRL-9 end only. far CTRL-0 datum end stays fixed.
                  gocalc(0,0);

                  was_end_swapped:= NOT was_end_swapped;  // might be coming back here

                  CONTINUE;           // start again
                end;


        startx:=0;     // cancel any blanking

        if spiral=True
           then begin
                  if turnoutx<os
                     then begin
                            arc_rad:=ABS(nomrad1);
                          end
                     else if turnoutx>(os+tst)
                             then begin
                                    arc_rad:=ABS(nomrad2);
                                  end
                             else begin   // move boundary out of transition zone

                                    turnoutx:=os+tst+g/10;    // g/10 arbitrary

                                    if plain_track=True then xorg:=turnoutx;

                                    gocalc(0,0);

                                         // now repeat from the top...

                                    CONTINUE;
                                  end;
                end
           else begin
                  arc_rad:=ABS(nomrad);
                end;

      until arc_rad<>0;

      if ABS((diag9/2)/arc_rad)>0.98    // more than 90 degs?  ARCSIN protection
         then begin
                show_modal_message(grow_str+'Sorry, the control template is too far from the background template.'
                   +#13+#13+'Please extend the control template and then try again.');
                EXIT;
              end;

      arc_length:=mod_dir*2*ARCSIN((diag9/2)/arc_rad)*arc_rad;

      if ABS(arc_length)<0.001    // 0.001mm arbitrary
         then begin
                show_not_needed;
                RESULT:=True;
                EXIT;
              end;

         // now ready to modify the control template - extend or shorten the template to fit...

      turnoutx:=turnoutx+arc_length;

      if turnoutx>turnoutx_max
         then begin

                if (boundary<>-1) and (mod_dir=1)    // try shortening instead
                   then begin
                          turnoutx:=turnoutx-arc_length;  // undo change
                          mod_dir:=-1;
                          goto 999;
                        end;

                                 // undo and exit
                arc_length:=0;   // for finally

                turnoutx:=old_turnoutx;
                xorg:=old_xorg;

                show_modal_message(grow_str+'Sorry, the control template would exceed the maximum template length.'+try_manual_str);
                EXIT;
              end;


      if plain_track=True
         then begin
                if turnoutx<0
                   then begin
                                                    // undo and exit
                          arc_length:=0;            // for finally

                          turnoutx:=old_turnoutx;
                          xorg:=old_xorg;

                          show_modal_message(grow_str+'Sorry, the length of the control template would be too short.'+try_manual_str);
                          EXIT;
                        end;
                xorg:=turnoutx;     // plain track
              end
         else begin                 // turnout
                if turnoutx<xorg
                   then begin
                                              // undo and exit
                          arc_length:=0;      // for finally

                          turnoutx:=old_turnoutx;
                          xorg:=old_xorg;

                          show_modal_message(grow_str+'Sorry, the length of the control template would be too short.'
                             +#13+#13+'Try adjusting the control template manually or converting to plain track.');
                          EXIT;
                        end;
              end;

      gocalc(0,0);    // calc new template

      new_end:=calc_snap_peg_data(11);  // 11 = CTRL-9 on control template

      case which_boundary of

       0: begin
            x_diff:=ABS(loc_0.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_0.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_0.notch_k-new_end.notch_k);
          end;

       6: begin
            x_diff:=ABS(loc_6.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_6.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_6.notch_k-new_end.notch_k);
          end;

       9: begin
            x_diff:=ABS(loc_9.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_9.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_9.notch_k-new_end.notch_k);
          end;

     240: begin
            x_diff:=ABS(loc_240.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_240.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_240.notch_k-new_end.notch_k);
          end;

     241: begin
            x_diff:=ABS(loc_241.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_241.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_241.notch_k-new_end.notch_k);
          end;

     260: begin                                             // 217a
            x_diff:=ABS(loc_260.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_260.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_260.notch_k-new_end.notch_k);
          end;

     261: begin                                             // 217a
            x_diff:=ABS(loc_261.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_261.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_261.notch_k-new_end.notch_k);
          end;

     600: begin
            x_diff:=ABS(loc_600.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_600.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_600.notch_k-new_end.notch_k);
          end;

     630: begin                                             // 226c
            x_diff:=ABS(loc_630.notch_x-new_end.notch_x);
            y_diff:=ABS(loc_630.notch_y-new_end.notch_y);
            k_diff:=ABS(loc_630.notch_k-new_end.notch_k);
          end;

     else begin                     // ???
            arc_length:=0;          // for finally
            turnoutx:=old_turnoutx;
            xorg:=old_xorg;

            show_modal_message(grow_str+'Sorry, an error occurred.'
               +#13+#13+'Please try adjusting the control template manually instead.');
            EXIT;
          end;

      end;//case

      while k_diff>(Pi/2) do k_diff:=k_diff-Pi;    // more than 90, subtract 180 degrees.

      if (ABS(x_diff)>(scale/20))    // arbitrary from experiments 1/20ft = 0.6in  = 0.2mm at 4mm/ft.
      or (ABS(y_diff)>(scale/20))
      or (ABS(k_diff)>0.025)          // radians  arbitrary from experiments = 1.43 degrees
         then begin

                 if (boundary<>-1) and (mod_dir=1)    // try shortening instead
                    then begin
                           turnoutx:=turnoutx-arc_length;  // undo change
                           mod_dir:=-1;
                           goto 999;
                         end;

                arc_length:=0;          // for finally
                turnoutx:=old_turnoutx;
                xorg:=old_xorg;

                if boundary=-1
                   then show_modal_message(grow_str+'Sorry, unable to find a matching MS (main-side) boundary on the selected background template.'+try_manual_str)
                   else show_modal_message('The control template does not align with the background template at that boundary.'+try_manual_str);
                EXIT;
              end;

      // mods 226c ...

      if ignore_error=False   // 226c
         then begin

                if (ABS(x_diff)>(scale/80))    // mm  arbitrary from experiments
                or (ABS(y_diff)>(scale/80))
                or (ABS(k_diff)>0.01)          // radians  arbitrary from experiments   =  0.57 degrees
                   then begin

                   if alert(4,'php/203    extend / shorten  the  control  template  to  meet',
                             'Small error found:'
                             +'||If extended the control template will not align perfectly with the background template, but may be acceptable for use.'
                             +'||The discrepancies will be:|'
                             +'|on X: '+round_str(ABS(x_diff),3)+' mm'
                             +'|on Y: '+round_str(ABS(y_diff),3)+' mm'
                             +'|on angle: '+round_str(ABS(k_diff*180/Pi),3)+' degrees'
                             +'||It is likely that there is a small error in the alignments which could be corrected.'
                             +'||Do you want to continue uncorrected?',
                              '','','','continue  anyway','cancel','',0)=5
                      then begin
                             arc_length:=0;          // for finally
                             turnoutx:=old_turnoutx;
                             xorg:=old_xorg;
                             EXIT;
                           end;
                        end;
              end;

      RESULT:=True;

    finally
      if was_end_swapped=True
         then begin
                swap_end_for_end;            // swap it back for him

                if (plain_track=False) and (half_diamond=False) and (arc_length<>0)
                   then begin
                          xorg:=xorg+arc_length;    // extension was on turnout approach track
                          if xorg<0 then xorg:=0;
                          if xorg>turnoutx then xorg:=turnoutx;
                        end;

                gocalc(0,0);
              end;

    end;//finally

  end;//with Ttemplate
end;
//______________________________________________________________________________

function do_tangential(bgnd_loc:integer):boolean;     // 223c

     // 05/08/2019   bgnd_loc : 15=at 1st radius, 16=at 2nd radius.

var
  peg1x:extended;
  peg1y:extended;

  bgnd_orgx:extended;
  bgnd_orgy:extended;
  bgnd_rad:extended;

  bgnd_ctrl0x,bgnd_ctrl0y:extended;
  bgnd_ctrl1x,bgnd_ctrl1y:extended;

  chord,x_tangency,y_tangency:extended;

  saved_control:Ttemplate_info;

  i,end_code:integer;

  trim_bgnd,bgnd_is_plain_track,was_converted,spanning:boolean;

  diag_tangency_bg0,diag_tangency_bg1:extended;
  diag_newpeg_bg0,diag_newpeg_bg1:extended;

  newpeg1x,newpeg1y:extended;

  saved_offset_x,saved_offset_y,saved_width_x:extended;

  result_count:integer;
  way:boolean;

                          //////////////////////////////////////////////////////

                          procedure zoom_back;

                          begin
                             zoom_offsetx:=saved_offset_x;
                             zoom_offsety:=saved_offset_y;
                             screenx:=saved_width_x;

                             show_and_redraw(False,False);
                          end;
                          //////////////////////////////////////////////////////

                          procedure error_restore;

                          begin
                            unhold_the_control(saved_control);

                            zoom_back;
                          end;
                          //////////////////////////////////////////////////////

                          function get_tangential(short_way:boolean):boolean;

                          var
                            qx1,qy1,k1_r1,k1_r2, qx2,qy2,k2_r1,k2_r2:extended;
                            half_chord,theta:extended;
                            rad_factor,discrepancy:extended;

                            temp,dummy:extended;

                            ix_code:integer;

                          begin
                            RESULT:=False;  // init

                            wait_cancel_clicked:=False;
                            wait_form.cancel_button.Visible:=True;
                            wait_form.waiting_label.Caption:='calculating  tangential  radius ...';
                            wait_form.waiting_label.Width:=wait_form.Canvas.TextWidth(wait_form.waiting_label.Caption);  // 205b bug fix for Wine
                            wait_form.wait_progressbar.Visible:=False;
                            wait_form.Show;

                            try
                              ix_code:=0; // keep compiler happy

                              kform_now:=kform;
                              docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs

                              nomrad:=g/10;   // start at very small rad

                              peg_curve;      //  keep it on peg..
                              gocalc(0,0);

                              rad_factor:=0.1;  // start at 10% arbitrary

                              repeat

                                repeat    // increase radius until get 2 intersections ...

                                  kform_now:=kform;
                                  docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs

                                  if nomrad>0
                                     then nomrad:=nomrad*(1+rad_factor)   // increase rad
                                     else nomrad:=nomrad/(1+rad_factor);  // or reduce negative rad to find intersections

                                  if nomrad>max_rad                       // swap sides if gone past straight
                                     then nomrad:=0-max_rad;

                                  peg_curve;      //  keep it on peg..
                                  gocalc(0,0);

                                  ix_code:=get_circle_intersections(rad1_orgx,rad1_orgy,ABS(nomrad), bgnd_orgx,bgnd_orgy,bgnd_rad, qx1,qy1,k1_r1,k1_r2, qx2,qy2,k2_r1,k2_r2);

                                  Application.ProcessMessages;
                                  if wait_cancel_clicked=True then EXIT;

                                until ix_code=2;

                                discrepancy:=SQRT(SQR(qx1-qx2)+SQR(qy1-qy2));   // between intersections

                                if discrepancy<0.0005 then BREAK;

                                if rad_factor<5E-19      // reached arbirary limit
                                   then BREAK;           // so accept whatever intersections we have got

                                try
                                  temp:=rad_factor;
                                  if temp<1E-17                 // arbitrary
                                     then rad_factor:=temp/2
                                     else rad_factor:=temp/10;
                                except
                                  show_modal_message('error1: calcs failed at radius factor');
                                  EXIT;
                                end;//try

                                repeat    // now reduce radius until no intersections ...

                                  kform_now:=kform;
                                  docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs

                                  if nomrad>0
                                     then nomrad:=nomrad/(1+rad_factor)   // reduce rad to lose intersections
                                     else nomrad:=nomrad*(1+rad_factor);  // or increase negative rad to lose intersections

                                  if ABS(nomrad)<1E-9     // arbitrary
                                     then begin
                                            show_modal_message('Sorry, unable to finish the calculations.'
                                               +#13+#13+'Is the fixing peg too close to or on the background template?');
                                            EXIT;
                                          end;

                                  peg_curve;      //  keep it on peg..
                                  gocalc(0,0);

                                  ix_code:=get_circle_intersections(rad1_orgx,rad1_orgy,ABS(nomrad), bgnd_orgx,bgnd_orgy,bgnd_rad, qx1,qy1,k1_r1,k1_r2, qx2,qy2,k2_r1,k2_r2);

                                  Application.ProcessMessages;
                                  if wait_cancel_clicked=True then EXIT;

                                until ix_code<>2;

                                try
                                  temp:=rad_factor;
                                  if temp<1E-17                 // arbitrary
                                     then rad_factor:=temp/2
                                     else rad_factor:=temp/10;
                                except
                                  show_modal_message('error3: calcs failed at radius factor');
                                  EXIT;
                                end;//try

                                Application.ProcessMessages;
                                if wait_cancel_clicked=True then EXIT;

                              until 0<>0;

                              x_tangency:=(qx1+qx2)/2;
                              y_tangency:=(qy1+qy2)/2;

                              chord:=SQRT(SQR(x_tangency-peg1x)+SQR(y_tangency-peg1y));

                              half_chord:=chord/2;

                              try
                                theta:=ARCSIN(half_chord/nomrad);
                              except
                                show_modal_message('error4 calcs failed at arcsin');
                                EXIT;
                              end;//try

                              if short_way=True                              // set overall length
                                 then turnoutx:=nomrad*theta*2               // short way round
                                 else turnoutx:=nomrad*(Pi*2-theta*2);       // long way round

                              if turnoutx>turnoutx_max then turnoutx:=turnoutx_max;
                              if turnoutx<0 then turnoutx:=0;
                              xorg:=turnoutx;                   // and ensure xorg matches for plain track.

                              turnout_i:=1;                     // length locked at new turnoutx.

                              RESULT:=True;

                            finally
                              wait_form.Hide;
                              wait_cancel_clicked:=False;
                              wait_form.cancel_button.Visible:=False;
                            end;//try
                          end;
                          //////////////////////////////////////////////////////


begin
  RESULT:=False;  // default init.

  saved_offset_x:=zoom_offsetx;       // for zoom_back..
  saved_offset_y:=zoom_offsety;
  saved_width_x:=screenx;

  trim_bgnd:=False;   // keep compiler happy.

  saved_control:=hold_the_control;  // 227a

  try
      // first get the background template data ...

    list_position:=clicked_keep_index;              // make it current in the keeps box.
    copy_keep_to_current(False,False,True,False);   // copy to the control.
    gocalc(0,0);

    bgnd_is_plain_track:=plain_track;  // for trimming

    if peg_rail<>8
       then begin
              peg_rail:=8;    // peg must be on main-road centre-line.
              peg_code:=20;   // flag gocalc to use peg_rail.
              gocalc(0,0);
            end;

    if spiral=True
       then begin

              if (bgnd_loc=15) or (bgnd_loc=16)           // move peg to trans start or trans length
                 then begin
                        peg_code:=bgnd_loc;
                        gocalc(0,0);
                      end;

              fix_radius(clrad_at_x(pegx),False);         // set nomrad from centre-line radius at peg.
              gocalc(0,0);

            end;

    if nomrad<0 then invert_handing;        // ensure radius is positive
    gocalc(0,0);

    bgnd_orgx:=rad1_orgx;       // bgnd rad and centres on pad..
    bgnd_orgy:=rad1_orgy;
    bgnd_rad:=nomrad;

      // ---------

      // discard the copied background template

    unhold_the_control(saved_control);   // 227a

    gocalc(0,0);

    if peg_rail<>8
       then begin
              peg_rail:=8;    // peg must be on main-road centre-line.
              peg_code:=20;   // flag gocalc to use peg_rail.
              gocalc(0,0);
            end;

    peg1x:=pegx_on_pad;                     // control template peg position on pad..
    peg1y:=pegy_on_pad*hand_i+y_datum;

    result_count:=1;  // init
    way:=True;        // init short way round

    if get_tangential(way)=False  // do calcs
       then begin
              error_restore;
              EXIT;
            end;

    if ABS(nomrad)<(g*2)        // radius too small?
       then begin
              invert_handing;
              gocalc(0,0);

              if get_tangential(way)=False  // do calcs again
                 then begin
                        error_restore;
                        EXIT;
                      end;
            end;


    show_and_redraw(True,True);

    repeat
      i:=alert(4,'php/160        make  simple  link',
                 '`0        Is this the required link track ?`9'
                +'||If not, or the result is confusing or unclear, click|`0no - try next result`1 below.'
                +'||There are 4 possible results.'
                +'||(If no result is the expected link track, cancel this and ensure that the fixing peg on the guide template is not at the end nearest the selected backgound template.)',
                 'more  information  and  help','zoom  to  see','zoom  back','no  -  try  next  result','cancel  simple  link','yes  -  continue',1);
      case i of
             1: alert_help(0,tangential_help_str,'');

             2: zoom_fit_control_template;

             3: zoom_back;

             4: begin
                  INC(result_count);  // no good, try again

                  if result_count>4
                     then begin
                            result_count:=0;  // back to the beginning
                            way:=True;
                          end;

                  invert_handing;
                  gocalc(0,0);

                  if result_count>2
                     then way:=False;   // try long way round

                  if get_tangential(way)=False  // do calcs
                     then begin
                            error_restore;
                            EXIT;
                          end;

                  show_and_redraw(True,True);
                end;

             5: begin
                  error_restore;
                  EXIT;
                end;

             6: begin
                  trim_bgnd:=True;
                  RESULT:=True;          // RESULT applies only to the making of the tangential curve
                end;

      end;//case

    until (i>4);

      //-----------------------------------

    if ABS(nomrad)>max_rad_test
       then begin
              pad_form.straight_template_menu_entry.Click;
              redraw(False);
            end;

      // got curve, now to trim the background template to fit ...

    if bgnd_is_plain_track=False
       then begin
              repeat
                i:=alert(4,'php/160        make  simple  link',
                           'The background template is not plain track.'
                          +'||Do you want the background template to be modified to fit ?'
                          +'||The result may need some further adjustment to the pointwork.',
                           '','','more  information','no  - don''t  modify  the  background  template','cancel  simple  link','yes  -  modify  the  background  template  to  fit',3);
                case i of
                       3: alert_help(0,tangential_help_str,'');

                       4: trim_bgnd:=False;

                       5: begin
                            error_restore;
                            EXIT;
                          end;

                       6: trim_bgnd:=True;

                end;//case
              until i<>3;
            end;

       // trim the background template ...

    was_converted:=False;     // init

    if trim_bgnd=True
       then begin

                  // first move the peg on the tangential template a fraction ...

              peg_code:=1;        // to CTRL-1
              gocalc(0,0);

              pegx:=pegx+scale;  // move forward 1ft scale
              peg_code:=-1;      // flag gocalc to leave peg as is.
              gocalc(0,0);

              newpeg1x:=pegx_on_pad;                     // peg position on pad..
              newpeg1y:=pegy_on_pad*hand_i+y_datum;

              peg_code:=0;        // restore to CTRL-0
              gocalc(0,0);

              //-------------

              pad_form.make_control_popup_entry.Click;   // swap to the background

              clicked_keep_index:=keeps_list.Count-1;    // tangential curve last added
              gocalc(0,0);

              if plain_track=False
                 then begin
                        rail_options_form.restore_all_button.Click;
                        pt_convert(True);  // show it
                        gocalc(0,0);
                        was_converted:=True;
                      end;

                  // get end locations ...

              peg_code:=0;    // CTRL-0
              gocalc(0,0);
              bgnd_ctrl0x:=pegx_on_pad;
              bgnd_ctrl0y:=pegy_on_pad*hand_i+y_datum;

              peg_code:=1;    // CTRL-1
              gocalc(0,0);
              bgnd_ctrl1x:=pegx_on_pad;
              bgnd_ctrl1y:=pegy_on_pad*hand_i+y_datum;

                  // get the diagonals...

              diag_tangency_bg0:=SQRT(SQR(x_tangency-bgnd_ctrl0x)+SQR(y_tangency-bgnd_ctrl0y));    // tangency point to each end of template..
              diag_tangency_bg1:=SQRT(SQR(x_tangency-bgnd_ctrl1x)+SQR(y_tangency-bgnd_ctrl1y));

              diag_newpeg_bg0:=SQRT(SQR(newpeg1x-bgnd_ctrl0x)+SQR(newpeg1y-bgnd_ctrl0y));          // new peg position to each end of bgnd template..
              diag_newpeg_bg1:=SQRT(SQR(newpeg1x-bgnd_ctrl1x)+SQR(newpeg1y-bgnd_ctrl1y));

              peg_code:=0;    // reset back to CTRL-0
              gocalc(0,0);

              end_code:=-1;     // init
              spanning:=False;

              repeat

                if (diag_newpeg_bg0<diag_tangency_bg0) and (diag_newpeg_bg1>diag_tangency_bg1)    // spanning tangency
                   then begin end_code:=0; spanning:=True; BREAK; end;                            // trim to CTRL-0 end

                if (diag_newpeg_bg1<diag_tangency_bg1) and (diag_newpeg_bg0>diag_tangency_bg0)    // spanning tangency
                   then begin end_code:=1; spanning:=True; BREAK; end;                            // trim to CTRL-1 end

                if (diag_newpeg_bg0<diag_tangency_bg0) and (diag_tangency_bg0<diag_tangency_bg1)  // clear of tangency forward
                   then begin end_code:=0; BREAK; end;                                            // trim to CTRL-0 end

                if (diag_newpeg_bg1<diag_tangency_bg1) and (diag_tangency_bg1<diag_tangency_bg0)  // clear of tangency forward
                   then end_code:=1;                                                              // trim to CTRL-1 end

              until 0=0;


              if end_code=-1
                 then begin
                        show_modal_message('Sorry, unable to determine which end of the'
                             +#13+'background template to modify to fit.'
                         +#13+#13+'It can be modified manually using the'
                             +#13+'"extend to meet" functions.');

                        pad_form.make_control_popup_entry.Click;   // swap back

                        clicked_keep_index:=keeps_list.Count-1;    // bgnd_template now last added
                        gocalc(0,0);
                      end
                 else begin

                        if end_code=1
                           then begin
                                  swap_end_for_end;
                                  gocalc(0,0);
                                end;

                        peg_code:=0;    // peg on CTRL-0
                        gocalc(0,0);

                        if spanning=True
                           then begin
                                  if end_code=1
                                     then turnoutx:=diag_newpeg_bg1
                                     else turnoutx:=diag_newpeg_bg0;    //  start short of tangency

                                  xorg:=turnoutx;      //  and ensure xorg matches for plain track
                                  turnout_i:=1;        // length locked at new turnoutx.
                                  gocalc(0,0);
                                end;

                        extend_to_boundary(clicked_keep_index,9,True,False);   // 9 = at CTRL-9 on tangential   True ignored   False = don't ignore errors
                        gocalc(0,0);

                        if (spanning=False) and (was_converted=False)
                           then begin
                                  swap_end_for_end;
                                  gocalc(0,0);

                                  peg_code:=1;
                                  gocalc(0,0);
                                end;

                        if (end_code=1) and (was_converted=True)    // revert hand and direction
                           then begin
                                  swap_end_for_end;
                                  gocalc(0,0);
                                end;

                        if  was_converted=True
                            then begin
                                   insert_turnout;
                                   gocalc(0,0);

                                   if end_code=0
                                      then begin
                                             peg_code:=11;    // to new boundary at CTRL-9
                                             gocalc(0,0);
                                           end;
                                 end;
                      end;

            end;

  finally

      // belt & braces ...

    wait_form.Hide;
    wait_cancel_clicked:=False;
    wait_form.cancel_button.Visible:=False;
  end;//try
end;
//______________________________________________________________________________

procedure make_tangential_link;  // 223c

  // set control template radius tangential with background template

var
  i:integer;

  bgnd_loc:integer;  // bgnd transition  0=no, 15=at 1st radius, 16=at 2nd radius.

  saved_control:Ttemplate_info;  // 227a

  split_stored:integer;

begin
  if (clicked_keep_index<0) or (clicked_keep_index>(keeps_list.Count-1)) or (keeps_list.Count<1) then EXIT;

  splitting_for_tangential:=True;

  tangential_help_str:='php/160`0                        Make  Simple  Link`9'
  +'||"Simple" means making a tangential alignment at the template boundaries, similar to the result when clipping together items of set-track.'

  +'||A simple link like this creates an abrupt change of radius at the template boundary, suitable only for low speeds.'
  +' When a smooth flowing connection is needed for fast running lines, it is better to use the `0make transition link`1 function instead.'
  +'||For more explanation, diagrams and videos,|click `0more information online`a above.'

  +'||This simple link function creates a template linking from the current peg position on the control template, to make a tangential join with the selected background template, and modifies the background template to fit.'
  +'||Before using this function, it is necessary to help Templot by creating a dummy "guide" template. The guide template should lead towards the required background template, with its fixing peg at the opposite end, like this:'

  +'||<IMG SRC="'+exe_str+'internal\hlp\make_simple1_476x136.png">'

  +'|Such a guide template might typically be the result of using the `0tools > make branch track`1 function, as above.'

  +'||The peg position is important, but the length and radius of the guide template do not matter. It is helpful to curve it towards the background template, so that you can see roughly how the link track is likely to fit.'

  +'||Select the required background template, and then click the|`0PEG / ALIGN TOOLS > make simple link`z item on its menu.'
  +'|The result will be:'

  +'||<IMG SRC="'+exe_str+'internal\hlp\make_simple2_476x136.png">'

  +'|The link track template has been created and stored, and the background template has been modified to fit. A fresh length of plain track is available in the control template ready for further track design work.';



  if Ttemplate(keeps_list.Objects[clicked_keep_index]).template_info.keep_dims.box_dims1.align_info.slewing_flag=True
     then begin
            alert(6,'php/160        make  simple  link',
                    'The selected background template contains a slew.'
                   +'||It is not possible to make a simple link from a slewed template.'
                   +'||If a slew is needed, it should be applied after creating the simple link.',
                    '','','','','cancel  simple  link','',0);
            EXIT;
          end;

  split_stored:=-1;  // init

  try

    saved_control:=hold_the_control;  // 227a

    pad_form.convert_to_plain_track_menu_entry.Click;     // ignore any pointwork
    gocalc(0,0);

    if (pegx>minfp) and (pegx<(turnoutx-minfp))         // split needed first
       then begin
              i:=keeps_list.Count;

              pad_form.make_split_at_peg_menu_entry.Click;

              if keeps_list.Count>i then split_stored:=keeps_list.Count-1;

              if (peg_code=1) or (peg_code=11)    // peg at CTRL-1  or CTRL-9
                 then begin
                        peg_code:=0;
                        gocalc(0,0);
                        swap_end_for_end;
                        gocalc(0,0);
                      end;
            end;

      // only the peg position and angle is relevant, clear all else to straight plain track ...

    pad_form.disable_slewing_menu_entry.Click;
    gocalc(0,0);

    pad_form.straight_template_menu_entry.Click;
    gocalc(0,0);

    if (peg_code=1) or (peg_code=11)    // peg at CTRL-1, swap ends ..
       then begin
              peg_code:=0;
              gocalc(0,0);
              swap_end_for_end;      // peg location on pad restored
              gocalc(0,0);
            end;

    bgnd_loc:=0;   // init

    if Ttemplate(keeps_list.Objects[clicked_keep_index]).template_info.keep_dims.box_dims1.align_info.trans_flag=True
       then begin
              repeat
                i:=alert(4,'php/160        make  simple  link',
                           'Make simple tangential link function.'
                          +'||The selected background template contains a transition curve.'
                          +'||This function is able to find a tangency point within the 1st or 2nd radius sections only. It cannot find a tangency point within the transition zone.'
                          +'||Bear this in mind and that the result will be unusable if the tangency point is calculated to lie within the transition zone.'
                          +' Adjust the control template to lie close to the intended link curve to avoid this.'
                          +'||Where on the background template do you want the simple link to be tangential ?',
                           '','more  information','background  template :    on  the  1st  radius','background  template :    on  the  2nd  radius','cancel  simple  link','',2);
                case i of

                  2: alert_help(0,tangential_help_str,'');

                  3: bgnd_loc:=15;     // peg code for trans start

                  4: bgnd_loc:=16;     // peg code for trans length

                  else EXIT;

                end;//case

              until i<>2;
            end;

            //-----------

    if do_tangential(bgnd_loc)=False      // do it
       then begin
                   // no result ...

              unhold_the_control(saved_control);

              if split_stored<>-1
                 then begin
                        list_position:=split_stored;
                        delete_keep(False,False);
                      end;
            end
       else begin

                   // good result ...

              store_and_background(False,False);   // store the modified bgnd template

              unhold_the_control(saved_control);   // 227a  True,True=  free lists, restore data

              gocalc(0,0);

              default_template;      // a short straight plain track template

              yshift:=yshift-10*g*hand_i;      // move it down the pad arbitrary
              gocalc(0,0);

              save_done:=False;
              backup_wanted:=True;
            end;

  finally
    splitting_for_tangential:=False;    // reset

    clicked_keep_index:=-1;             // so can popup again.
    show_and_redraw(True,True);
  end;//try
end;
//______________________________________________________________________________

function peg_on_intersection(index,bgnd_rail,control_rail:integer; bgnd_peg,allow_pegging,making_diamond:boolean):Tintersect_result;   // 228a

   // return intersection angle,  negative=error

   // allow_pegging = of control template, and messages

var
  saved_control:Ttemplate_info;

  angle_str:string;

  bgnd_keep:Ttemplate_info;

  cx,bx,cy,by,found_cx,found_bx:extended;    // pegx on control, bgnd

  padcx,padcy,padbx,padby:extended;

  proximity:extended;
  nearest_proximity:extended;
  master_proximity:extended;

  k,kc,kb,kn,xing_angle:extended;

  inc_cx,inc_bx,end_cx,end_bx:extended;

  cx_restart,bx_restart:extended;

  temp,dummy1,dummy2:extended;

  i,n,iii,error:integer;

  intersect_found:boolean;


begin
  RESULT.angle:=-1;                // default fail init.
  RESULT.code:=0;
  intersect_found:=False;


  proximity:=0;                 // init and keep compiler happy...
  nearest_proximity:=5000000;   // init huge
  master_proximity:=5000000;    // init huge
  bx:=0;
  by:=0;
  cx:=0;
  cy:=0;

  k:=0;
  kb:=0;
  kc:=0;

  error:=0;
  found_cx:=0;
  found_bx:=0;
  end_bx:=0;
  end_cx:=0;
  bx_restart:=0;
  cx_restart:=0;
  padcx:=0;
  padcy:=0;
  padbx:=0;
  padby:=0;



  inc_cx:=MIN(g,turnoutx/5);     // at least 5 steps along it
  cx:=0-inc_cx*2;                // start in front of template
  end_cx:=turnoutx+inc_cx*2;     // end beyond it

  cx_restart:=cx;

        // save the control ...

  saved_control:=hold_the_control;  // 227a

  bgnd_keep:=Ttemplate(keeps_list.Objects[index]).template_info;    // get bgnd

  try
    copy_keep(bgnd_keep);    // get the bgnd template             //copy_keep_to_current(False,False,True,False);   // copy to pad.
    gocalc(0,0);

    inc_bx:=MIN(g,turnoutx/5);     // at least 5 steps along it
    bx:=0-inc_bx*3;                // start well in front of template
    end_bx:=turnoutx+inc_bx*3;     // end well beyond it

    bx_restart:=bx;


    for n:=0 to 12 do begin      //  step reductions      12 arbitrary, should break before

      Application.ProcessMessages;
      if intersect_cancel_clicked=True then EXIT;

      intersect_form.progress_bar.Position:=n+1;

      master_proximity:=5000000;    // init huge

      bx:=bx_restart;

      repeat      // step along background template

        Application.ProcessMessages;
        if intersect_cancel_clicked=True then EXIT;

        copy_keep(bgnd_keep);   // bgnd again
        gocalc(0,0);

        try
          normalize_transforms;

          case bgnd_rail of

            1: begin by:=0; k:=0; end;    // main stock rail

            2: by:=aq2offset(bx,k);       // turnout crossing rail

            3: begin by:=g; k:=0; end;    // main road crossing rail

            4: by:=aq3offset(bx,k);       // turnout stock rail

           24: begin by:=g/2; k:=0; end;  // main centre line

           25: by:=aq25offset(bx,k);      // turnout centre-line

          end;//case

          docurving(True,True,bx,by,padbx,temp,dummy1,dummy2);
          padby:=temp*hand_i+y_datum;

        except
          error:=1;  // calc fail
          EXIT;
        end;//try

           // find nearest on control at this bx ...

        unhold_the_control(saved_control);   // 227a

           // control again

        gocalc(0,0);

        cx:=cx_restart;               // restart
        nearest_proximity:=5000000;   // init huge

        repeat      // step as far as nearest so far

          Application.ProcessMessages;
          if intersect_cancel_clicked=True then EXIT;

          try
            normalize_transforms;

            case control_rail of

              1: begin cy:=0; k:=0; end;    // main stock rail

              2: cy:=aq2offset(cx,k);       // turnout crossing rail

              3: begin cy:=g; k:=0; end;    // main road crossing rail

              4: cy:=aq3offset(cx,k);       // turnout stock rail

             24: begin cy:=g/2; k:=0; end;  // main centre line

             25: cy:=aq25offset(cx,k);      // turnout centre-line

            end;//case

            docurving(True,True,cx,cy,padcx,temp,dummy1,dummy2);
            padcy:=temp*hand_i+y_datum;

          except
            error:=2;    // calc fail
            EXIT;
          end;//try

          try
            proximity:=SQRT(SQR(padbx-padcx)+SQR(padby-padcy));
          except
            error:=3;   // calc fail
            EXIT;
          end;//try

          if proximity<nearest_proximity    // getting nearer
             then begin
                    nearest_proximity:=proximity;
                    cx:=cx+inc_cx;                  // keep going
                  end
             else BREAK;   // gone past nearest

        until cx>end_cx;   // no likely intersection if get here

           // see if nearest is nearer than previous bx ...

        if nearest_proximity<master_proximity
           then begin
                  master_proximity:=nearest_proximity;     // yes

                  found_cx:=cx-inc_cx;       // update recorded positions
                  found_bx:=bx;

                end;

        bx:=bx+inc_bx;    // try next bx

      until bx>end_bx;


      cx_restart:=found_cx-inc_cx*2;   // restart 2 steps back on the control

      bx_restart:=found_bx-inc_bx*3;   // restart 3 steps back on the bgnd

      end_bx:=found_bx+inc_bx*3;       // finish 3 steps beyond on the bgnd (saves time)

      inc_cx:=inc_cx/5;
      inc_bx:=inc_bx/5;


      if master_proximity<0.0005    // mm arbitrary
         then begin
                intersect_found:=True;
                BREAK;
              end;

    end;//next n

  finally

    if intersect_found=False
       then begin
              if error<>0
                 then show_modal_message('error: Sorry, the calculations failed on error '+IntToStr(error)+'.')
                 else begin
                        if intersect_cancel_clicked=False
                           then if making_diamond=True
                                   then RESULT.code:=-2
                                   else show_modal_message('fail: Sorry it was not possible to find an intersection.'
                                                   +#13+#13+'For this function the intersection must be within both existing template lengths.'
                                                   +#13+'In other words, the desired intersection position must be visible on the overlaid templates.'
                                                   +#13+'You may need to lengthen one or both templates.'
                                                   +#13+#13+'Check also that you have specified the correct rails.'
                                                   +#13+#13+'If the radius is being adjusted, check that the fixing peg is in a suitable position'
                                                   +#13+'to permit the target intersection angle.')

                           else show_modal_message('The find intersection function was cancelled.');
                      end;
            end
       else begin
              Application.ProcessMessages;
              if intersect_cancel_clicked=False
                 then begin
                          // get pad angle at intersect (put peg on it, notch under, get notch angle) ...

                        copy_keep(bgnd_keep); // bgnd again

                        gocalc(0,0);

                        case bgnd_rail of

                          1: pad_form.peg_on_rail1_menu_entry.Click;    // main stock rail

                          2: pad_form.peg_on_rail2_menu_entry.Click;    // turnout crossing rail

                          3: pad_form.peg_on_rail3_menu_entry.Click;    // main road crossing rail

                          4: pad_form.peg_on_rail4_menu_entry.Click;    // turnout stock rail

                         24: pad_form.peg_on_rail8_menu_entry.Click;    // main centre line

                         25: pad_form.peg_on_rail9_menu_entry.Click;    // turnout centre-line

                        end;//case

                        gocalc(0,0);

                        pegx:=found_bx;

                        gocalc(0,0);

                        pad_form.notch_under_peg_menu_entry.Click;

                        kb:=notch_angle;

                        if bgnd_peg=True   // wants peg moved to it
                           then begin
                                  redraw(False);    // generate

                                  list_position:=index;
                                  delete_keep(False,False);  // delete it (no alerts)

                                  store_and_background(False,False);      // store with moved peg
                                  list_position:=keeps_list.Count-1;      // make current in box
                                end;
                      end;
            end;

    unhold_the_control(saved_control);

    redraw(False);

       // move the peg on it, then notch, and get notch angle...

    Application.ProcessMessages;

    if (intersect_cancel_clicked=False) and (intersect_found=True)
       then begin
              case control_rail of

                1: pad_form.peg_on_rail1_menu_entry.Click;    // main stock rail / plain track MS

                2: pad_form.peg_on_rail2_menu_entry.Click;    // turnout crossing rail

                3: pad_form.peg_on_rail3_menu_entry.Click;    // main road crossing rail

                4: pad_form.peg_on_rail4_menu_entry.Click;    // turnout stock rail / plain track TS

               24: pad_form.peg_on_rail8_menu_entry.Click;    // main centre line   / plain track

               25: pad_form.peg_on_rail9_menu_entry.Click;    // turnout centre-line

              end;//case

              gocalc(0,0);

              pegx:=found_cx;

              gocalc(0,0);

              pad_form.notch_under_peg_menu_entry.Click;

              kc:=notch_angle;

              if allow_pegging=True
                 then begin
                        redraw(False);
                      end
                 else gocalc(0,0);


              k:=kc-kb;

              while k>Pi/2 do k:=k-Pi;          // force k into range +/- 90 degs..
              while k<(0-Pi/2) do k:=k+Pi;

              xing_angle:=ABS(k);

              RESULT.angle:=xing_angle;

              if allow_pegging=True
                 then begin
                                       // put half-diamond on notch at intersection angle? ..

                        if xing_angle<1E-5  // 1:INF
                           then show_modal_message('info: A template cannot be pegged onto the notch because the crossing angle would be infinitely large.')
                           else begin
                                  if ABS(xing_angle-Pi/2)<1E-2          // 2 decimal places shown.
                                     then angle_str:='90 degrees'
                                     else if xing_angle<1E-2
                                             then angle_str:='0'
                                             else begin
                                                    temp:=TAN(xing_angle);
                                                    if ABS(temp)>minfp then angle_str:=round_str(xing_angle*180/Pi,2)+' degrees, '+ram_clm_str(1/temp)     //( 1: '+round_str(1/temp,2)+'  RAM )'
                                                                       else angle_str:='0';
                                                  end;

                                  kn:=1/TAN(xing_angle);

                                  if kn<0.5
                                     then show_modal_message('info: A template cannot be pegged onto the notch because the crossing angle would be shorter than 1:0.5')
                                     else begin

                                            with alert_box do begin          // 205d
                                              left_panbutton.Visible:=True;
                                              right_panbutton.Visible:=True;
                                              down_panbutton.Visible:=True;
                                              up_panbutton.Visible:=True;
                                            end;//with

                                            alert_option2a_click_code:=1;    // zoom in   205d
                                            alert_option2b_click_code:=2;    // zoom out

                                            i:=alert(4,'php/118    notch  now  on  intersection',
                                                       'The notch is now on the requested intersection.'
                                                      +'||Do you want to make a new control template having a crossing angle of '+angle_str+' and peg it onto the notch ?'
                                                      +'||A half-diamond template will be created, but it is easily converted to a turnout if wanted at `0TEMPLATE > CONVERT HALF-DIAMOND TO TURNOUT`1 menu item.'
                                                      +'||The diagonal-road exit length will be set to minimum, see `0GEOMETRY > DIAGONAL-ROAD EXIT LENGTH >`1 menu options.'
                                                      +'||The existing control template alignment will be preserved, but to align the rails after pegging it may be necessary to rotate the template by 180 degrees.'
                                                      +' Click the `0GEOMETRY > SHIFT/ROTATE > ROTATE 180 DEGREES`1 menu item.'
                                                      +'||And/or it may be necessary to invert the curving.|Click the `0GEOMETRY > INVERT CURVING`1 menu item.'
                                                      +'||And/or it may be necessary to swap the handing.|Click the `0TEMPLATE > SWAP HAND`1 menu item.'
                                                      +'||And/or it may be necessary to mirror the template.|Click the `0GEOMETRY > MIRROR TEMPLATE`1 menu item.'
                                                      +'||To align it to the background template, adjust the K-crossing angle using the `0F10`2 mouse action, and/or the V-crossing angle using the `0F9`2 mouse action.'
                                                      +'||For more information click `0more information online`1 above.',
                                                       '','_2a_+  zoom in_2b_-  zoom out','yes  please  -  match  K-crossing','yes  please  -  match  V-crossing','','no  thanks',0);

                                            if i<>6
                                               then begin

                                                      store_and_background(False,False);      // store existing (with moved peg)
                                                      list_position:=keeps_list.Count-1;      // make current in box

                                                      if slewing=True then pad_form.disable_slewing_menu_entry.Click;  // cancel any slewing

                                                      if spiral=True then pad_form.constant_radius_menu_entry.Click;   // cancel any transition

                                                      if plain_track=True
                                                         then insert_half_diamond;

                                                      if half_diamond=False
                                                         then convert_to_regular_half_diamond;

                                                      xing_type_i:=1;        // set curviform regardless

                                                      turnout_road_i:=3;     // set minimum exits to minimize mis-match..

                                                      turnout_i:=1;

                                                      if i=3          // K-crossings...
                                                         then begin
                                                                hdkn:=1/ABS(TAN(xing_angle));
                                                                gocalc(0,0);

                                                                if (bgnd_rail>23) and (control_rail>23)      // centre-line intersection
                                                                   then pad_form.reset_peg_menu_entry.Click  // CTRL-0
                                                                   else begin
                                                                            case control_rail of    // peg on rail at toe...

                                                                              1: pad_form.peg_on_kp1_menu_entry.Click;

                                                                              2: pad_form.peg_on_kp2_menu_entry.Click;

                                                                              3: pad_form.peg_on_kp3_menu_entry.Click;

                                                                              4: pad_form.peg_on_kp4_menu_entry.Click;

                                                                             24: if peg_code<>2 then pad_form.peg_on_tp_menu_entry.Click       // 1 click sets 2
                                                                                                else begin
                                                                                                       pad_form.peg_on_tp_menu_entry.Click;    // 2 clicks needed if already on 2
                                                                                                       pad_form.peg_on_tp_menu_entry.Click;
                                                                                                     end;

                                                                             25: if peg_code=2 then pad_form.peg_on_tp_menu_entry.Click       // 1 click swaps to 22
                                                                                               else begin
                                                                                                      pad_form.peg_on_tp_menu_entry.Click;    // 2 clicks needed if not already on 2
                                                                                                      pad_form.peg_on_tp_menu_entry.Click;
                                                                                                    end;

                                                                            end;//case

                                                                        end;
                                                              end;


                                                      if i=4        // V-crossings..
                                                         then begin
                                                                k3n:=1/ABS(TAN(xing_angle));
                                                                gocalc(0,0);

                                                                if peg_code<>4                                 // not already on main side peg angle.
                                                                   then pad_form.peg_on_fp_menu_entry.Click;
                                                              end;

                                                      gocalc(0,0);

                                                      shift_onto_notch(False,False);

                                                    end;
                                          end;
                                end;

                      end
                 else begin
                        unhold_the_control(saved_control);
                      end;

            end;

    redraw(True);
    
  end;//finally
end;
//______________________________________________________________________________

function force_symmetry(click:boolean; limit_rad:extended):boolean;   // 227a   set curviform and adjust radii to equal

var
  rad_factor,temp,dummy:extended;

  saved_control:Ttemplate_info;  // 227a

  r_str:string;

begin
  RESULT:=False;  // init

  if plain_track=True
     then begin
            show_modal_message('invalid request - the control template is not a turnout or half-diamond');
            EXIT;
          end;

  if (half_diamond=True) and (ABS(hdkn)-ABS(k3n)<(0-minfp))
     then begin
            show_modal_message('invalid request - the K-crossing angle is shorter than the V-crossing angle, symmetry is not possible');
            EXIT;
          end;

  saved_control:=hold_the_control;  // retain original for later restore

  if (half_diamond=True) and (ABS(hdkn)-ABS(k3n)<minfp)
     then pad_form.straight_template_menu_entry.Click  // regular half-diamond must be straight if symmetrical
     else begin
            if xing_type_i<>1
               then pad_form.curviform_crossing_menu_entry.Click;    // to curviform

            kform_now:=kform;
            docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs

            nomrad:=0-g*5;   // start at very small rad (contraflexure)

            peg_curve;     //  keep it on peg..
            gocalc(0,0);

            if ABS(nomrad)>ABS(radius_for_obtain)
               then begin
                      unhold_the_control(saved_control);          // 227a  True,True=  free lists, restore data
                      show_modal_message('error: something went wrong');
                      EXIT;
                    end;

            rad_factor:=0.1;  // start at 10% arbitrary

            repeat

              repeat    // increase radius until diagonal rad is smaller..

                kform_now:=kform;
                docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs

                nomrad:=nomrad*(1+rad_factor);  // increase rad

                if ABS(nomrad)>limit_rad   // safety
                   then begin
                          unhold_the_control(saved_control);          // 227a  True,True=  free lists, restore data
                          show_modal_message('error: something went wrong');
                          EXIT;
                        end;

                peg_curve;      //  keep it on peg..
                gocalc(0,0);

                if ABS(nomrad)>ABS(radius_for_obtain)
                   then BREAK;

              until 0<>0;

              rad_factor:=rad_factor/10;

              repeat    // now reduce radius back ...

                kform_now:=kform;
                docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs

                nomrad:=nomrad/(1+rad_factor);  // reduce rad

                if ABS(nomrad)<(g*4)   // safety
                   then begin
                          unhold_the_control(saved_control);          // 227a  True,True=  free lists, restore data
                          show_modal_message('error: something went wrong');
                          EXIT;
                        end;

                peg_curve;      //  keep it on peg..
                gocalc(0,0);

                if ABS(nomrad)<ABS(radius_for_obtain)
                   then BREAK;

              until 0<>0;

              rad_factor:=rad_factor/10;

              if rad_factor<1E-8      // reached arbitrary limit
                 then BREAK;          // so accept whatever we have got

            until 0<>0;      // increase rad again

          end;

  if click=True   // menu item clicked
     then begin
            redraw(False);   // show it

            if ABS(nomrad)<max_rad_test
               then r_str:=round_str(ABS(nomrad),0)+' mm ( '+round_str(ABS(nomrad)/25.4,1)+'" )'
               else r_str:='straight';

            show_modal_message('now symmetrical at curving radius: '+r_str);
          end;

  RESULT:=True;
end;
//______________________________________________________________________________

procedure make_symm_y_turnout(len:integer); // 227a    0=short, 1=long, -1=very short

var
  org_k1n:extended;

  saved_control:Ttemplate_info;  // 227a

  approach_stored:boolean;

  r_str:string;

begin

  if plain_track=True
     then begin
            show_modal_message('invalid request - the control template is not a turnout');
            EXIT;
          end;

  if slewing=True
     then begin
            show_modal_message('invalid request - the control template is slewed');
            EXIT;
          end;

  saved_control:=hold_the_control;  // retain original for later restore

  approach_stored:=False;  // init

  if xorg>0          // has approach track, split and save it
     then begin
            if make_separate_approach(False)=True    // False=no alerts
               then begin
                      approach_stored:=True;
                      clicked_keep_index:=keeps_list.Count-1;    // last one stored
                      pad_form.make_control_popup_entry.Click;   // get turnout back
                      gocalc(0,0);
                    end;
          end;

  if half_diamond=True    // need a turnout to start from
     then begin
            convert_to_turnout;
            gocalc(0,0);
          end;

  org_k1n:=k1n; // switch deflection angle

  pad_form.peg_on_joint_end_menu_entry.Click;   // to CTRL-1 switch front

  gocalc(0,0);

  pad_form.straight_template_menu_entry.Click;    // make it straight

  gocalc(0,0);

  pad_form.peg_on_tp_menu_entry.Click;    // peg on CTRL-2 toe

  gocalc(0,0);

  pad_form.notch_under_peg_menu_entry.Click;  // and notch under

  pad_form.snap_to_peg_menu_entry.Click;   // and shorten to form the switch front

  gocalc(0,0);

  store_and_background(False,False);      // store switch front

  auto_diamond:=0;   // ensure switch diamond at any sensible switch size

  convert_to_regular_half_diamond;

  gocalc(0,0);

  pad_form.curviform_crossing_menu_entry.Click;    // must be curviform

  gocalc(0,0);

  case len of
      0:  begin                  // very short
            hdkn:=org_k1n*2/3;
            k3n:=Round(k3n)/2;   // unit half sizes
          end;

       1: begin                     // short
            hdkn:=org_k1n*3/4;
            k3n:=Round(k3n*4/3)/2;  // unit half sizes
          end;

       2: begin
            hdkn:=org_k1n;          // normal
            k3n:=Round(k3n*2)/2;    // unit half sizes
          end;

       3: begin                    // long
            hdkn:=org_k1n*2;
            k3n:=Round(k3n*5/4);  // unit whole sizes
          end;

     else hdkn:=org_k1n;      // normal
  end;//case

  hdkn:=Round(hdkn);   // K-angle unit whole sizes only

  if hdkn<k3n then hdkn:=k3n;  // short limit is straight

  gocalc(0,0);

  turnoutx:=mvjpx;           // set the length
  turnout_i:=1;              // length locked at turnoutx.
  hd_switch_timbering:=True;

  gocalc(0,0);

  pad_form.peg_on_split_deflection_menu_entry.Click;

  gocalc(0,0);

  shift_onto_notch(False,True);   // True=minimum rotation

  pad_form.reset_notch_menu_entry.Click;

  gocalc(0,0);

  if force_symmetry(False,max_rad)=False     // now make it symmetrical
     then begin                                                   // failed
            unhold_the_control(saved_control);          // 227a  True,True=  free lists, restore data
            redraw(True);
            EXIT;
          end;

  redraw(False);  // show it

  if ABS(nomrad)<max_rad_test
     then r_str:=round_str(ABS(nomrad),0)+' mm ( '+round_str(ABS(nomrad)/25.4,1)+'" )'
     else r_str:='straight';

  if alert(4,'php/114    make  improvised  Y-turnout',
             'Is this the required Y-turnout ?'
            +'||The curving radius is '+r_str,
             '','','','','no  -  cancel  Y-turnout','yes  -  continue',0)=5
     then begin
            list_position:=keeps_list.Count-1;
            delete_keep(False,False);           // delete switch front template (no alerts)

            if approach_stored=True
               then begin
                      list_position:=keeps_list.Count-1;
                      delete_keep(False,False);             // delete stored approach template (no alerts)
                    end;

            unhold_the_control(saved_control);          // 227a  True,True=  free lists, restore data
            redraw(False);                                        // show it

            pad_form.make_y_turnout_menu_entry.Click;   // try again    (recursive)

            EXIT;
          end;

  redraw_pad(True,True);    // for rollback
end;
//______________________________________________________________________________

end.

