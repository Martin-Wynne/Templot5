
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

unit intersect_unit;   // 227a

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls;

type

  { Tintersect_form }

  Tintersect_form = class(TForm)
    control_panel: Tpanel;
    control4_radio: TRadioButton;
    control3_radio: TRadioButton;
    control2_radio: TRadioButton;
    control1_radio: TRadioButton;
    control25_radio: TRadioButton;
    control24_radio: TRadioButton;
    bgnd_panel: Tpanel;
    bgnd4_radio: TRadioButton;
    bgnd3_radio: TRadioButton;
    bgnd2_radio: TRadioButton;
    bgnd1_radio: TRadioButton;
    bgnd25_radio: TRadioButton;
    bgnd24_radio: TRadioButton;
    find_intersect_button: TButton;
    hide_panel: TPanel;
    hide_button: TButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    progress_bar: TProgressBar;
    cancel_button: TButton;
    bgnd_move_peg_checkbox: TCheckBox;
    expert_panel: Tpanel;
    adjust_rad_checkbox: TCheckBox;
    angle_label: TLabel;
    angle_button: TButton;
    result_static: TStaticText;
    Label2: TLabel;
    help_shape: TShape;
    help_button: TButton;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure find_intersect_buttonClick(Sender: TObject);
    procedure cancel_buttonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure hide_buttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure angle_buttonClick(Sender: TObject);
    procedure help_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  intersect_form: Tintersect_form;

implementation

uses
  math,control_room, pad_unit, math_unit, math2_unit, keep_select, bgkeeps_unit, entry_sheet;

{$R *.lfm}

var
  xingn_target:extended=7.0;     // RAM units  1:7 default

//______________________________________________________________________________

procedure Tintersect_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(intersect_form);

  AutoScroll:=False;

  ClientWidth:=620;
  ClientHeight:=420;

  Font.Size:=8;
end;
//______________________________________________________________________________

procedure Tintersect_form.find_intersect_buttonClick(Sender: TObject);

var
  index,bgnd_rail,control_rail:integer;
  xingk,xingn,xingk1,start_diff1,start_diff2:extended;
  curv,curv_start,curv_mod,dummy:extended;
  flatten:boolean;

              //////////////////////////////////////////////////////////////////

              function unit_angle_str(ram_kn:extended):string;

              var
                clm_kn:extended;

              begin        //  calc CLM unit angle...
                try
                  if ram_kn>minfp then clm_kn:=1/2/TAN(ARCTAN(1/ram_kn)/2)
                                  else clm_kn:=0;                       // ??? kn zero or neg ???

                  RESULT:='1:'+FormatFloat('#.000',ram_kn)+' RAM  ( 1:'+FormatFloat('#.000',clm_kn)+' CLM )';
                except
                  RESULT:='';
                end;//try
              end;
              //////////////////////////////////////////////////////////////////

begin
  index:=find_intersect_button.Tag;    // set on pop-up menu click

  if (index<0) or (index>(keeps_list.Count-1)) or (keeps_list.Count<1) then EXIT;   // ???

  if bgnd1_radio.Checked=True
     then bgnd_rail:=1
     else if bgnd2_radio.Checked=True
             then bgnd_rail:=2
             else if bgnd3_radio.Checked=True
                     then bgnd_rail:=3
                     else if bgnd4_radio.Checked=True
                             then bgnd_rail:=4
                             else if bgnd25_radio.Checked=True
                                     then bgnd_rail:=25
                                     else bgnd_rail:=24;

  if control1_radio.Checked=True
     then control_rail:=1
     else if control2_radio.Checked=True
             then control_rail:=2
             else if control3_radio.Checked=True
                     then control_rail:=3
                     else if control4_radio.Checked=True
                             then control_rail:=4
                             else if control25_radio.Checked=True
                                     then control_rail:=25
                                     else control_rail:=24;

  if (plain_track=True) and ((control_rail=2) or (control_rail=3) or (control_rail=25))
     then begin
            show_modal_message('invalid request: The control template is plain track.'+#13+#13+'The selected turnout-road rails or centre-line do not exist.'
                               +#13+#13+'For plain track templates use the main-road settings only - rails 1. and 4.');
            EXIT;  // leave form showing
          end;

  if (Ttemplate(keeps_list.Objects[index]).bgnd_plain_track=True) and ((bgnd_rail=2) or (bgnd_rail=3) or (bgnd_rail=25))
     then begin
            show_modal_message('invalid request: The background template is plain track.'+#13+#13+'The selected turnout-road rails or centre-line do not exist.'
                               +#13+#13+'For plain track templates use the main-road settings only - rails 1. and 4.');
            EXIT;  // leave form showing
          end;

  try
    if check_control_template_is_valid('intersection')=False then EXIT;

    if turnoutx<0.1    // 0.1 arbitrary minimum
       then begin
              show_modal_message('invalid request: The control template is too short for this function.');
              EXIT;
            end;

    if Ttemplate(keeps_list.Objects[index]).bgnd_turnoutx<0.1       // 0.1 arbitrary minimum
         then begin
                show_modal_message('invalid request: The background template is too short for this function.');
                EXIT;
              end;

    if adjust_rad_checkbox.Checked=True   // cancel it if invalid ...
       then begin
              if spiral=True
                 then begin
                        show_modal_message('invalid request: It is not possible to adjust the radius'+#13+'because the control template contains a transition curve.');
                        adjust_rad_checkbox.Checked:=False;
                      end;

              if slewing=True
                 then begin
                        show_modal_message('invalid request: It is not possible to adjust the radius'+#13+'because the control template contains a slew.');
                        adjust_rad_checkbox.Checked:=False;
                      end;
            end;

    if adjust_rad_checkbox.Checked=False    // normal find intersection with messages ..
       then begin
              intersect_cancel_clicked:=False;
              intersect_form.progress_bar.Position:=0;
              xingk:=peg_on_intersection(index,bgnd_rail,control_rail,bgnd_move_peg_checkbox.Checked,True,False).angle;  // math2_unit
            end

          // expert - adjust radius to required intersection angle first ...

       else begin

                 // try first intersect ..

              intersect_cancel_clicked:=False;
              intersect_form.progress_bar.Position:=0;
              xingk:=peg_on_intersection(index,bgnd_rail,control_rail,bgnd_move_peg_checkbox.Checked,False,False).angle;  // math2_unit

              if xingk<minfp   // fail result
                 then EXIT;

              xingn:=1/TAN(xingk);

              xingk1:=xingk;

              start_diff1:=ABS(xingn_target-xingn);

              if ABS(start_diff1)>0.0002   // arbitrary     // not done already?
                 then begin
                        flatten:=(xingn_target>xingn);

                        curv:=scale/nomrad;     // curvature in 1/proto-feet

                        if ABS(curv)<minfp then curv:=scale/max_rad;  // no div zero

                        curv_start:=curv;

                        kform_now:=kform;
                        docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs.

                        curv:=curv+0.000005;  // increase curving a fraction and repeat..       arbitrary

                        if ABS(curv)<minfp then curv:=scale/max_rad;  // no div zero

                        nomrad:=scale/curv;

                        if ABS(nomrad)<(g*3) then EXIT;   //  min rad is g*2

                        peg_curve;

                        intersect_cancel_clicked:=False;
                        intersect_form.progress_bar.Position:=0;
                        xingk:=peg_on_intersection(index,bgnd_rail,control_rail,bgnd_move_peg_checkbox.Checked,False,False).angle;  // math2_unit

                        if xingk<minfp   // fail result
                           then EXIT;

                        xingn:=1/TAN(xingk);

                        if ABS(xingk1-xingk)<0.000001     // rads arbitrary
                           then begin
                                  show_modal_message('invalid request: It is not possible to reach the target intersection angle by adjusting the radius.'
                                                    +#13+#13+'The most likely reason is that the peg on the control template is already on an intersection'
                                                    +#13+'or is very close to one.'
                                                    +#13+#13+'Move the peg to a position further away from the required intersection, and try again.');
                                  EXIT;
                                end;

                        start_diff2:=ABS(xingn_target-xingn);

                        if start_diff2<start_diff1
                           then curv_mod:=0.00005      // going in right direction     arbitrary
                           else curv_mod:=0-0.00005;   // reverse direction

                        curv:=curv_start;    // back to start
                        nomrad:=scale/curv;

                        if ABS(nomrad)<(g*3) then EXIT;   //  min rad is g*2

                        gocalc(0,0);

                        repeat
                          if intersect_cancel_clicked=True then BREAK;

                          kform_now:=kform;
                          docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg data for peg_curve calcs.

                          curv:=curv+curv_mod;

                          if ABS(curv)<minfp then curv:=scale/max_rad;  // no div zero

                          nomrad:=scale/curv;

                          if ABS(nomrad)<(g*3) then BREAK;  //  min rad is g*2

                          peg_curve;

                          redraw(False);   // show it happening

                          intersect_cancel_clicked:=False;
                          intersect_form.progress_bar.Position:=0;
                          xingk:=peg_on_intersection(index,bgnd_rail,control_rail,bgnd_move_peg_checkbox.Checked,False,False).angle;  // math2_unit

                          if xingk<minfp   // fail result
                             then EXIT;

                          xingn:=1/TAN(xingk);

                          result_static.Caption:=unit_angle_str(xingn)+#13+'radius : '+rad_str(nomrad,2)+' mm';

                        if ((xingn>xingn_target) and (flatten=True)) or ((xingn<xingn_target) and (flatten=False))  // gone too far
                           then begin
                                  curv_mod:=0-curv_mod/5;  // reverse direction
                                  flatten:= NOT flatten;
                                end;

                        until ABS(xingn-xingn_target)<0.0002;   // arbitrary
                      end
                 else result_static.Caption:=unit_angle_str(xingn)+#13+'radius : '+rad_str(nomrad,2)+' mm';

                // got radius and angle -- now allow pegging and messages..

              intersect_cancel_clicked:=False;
              intersect_form.progress_bar.Position:=0;
              xingk:=peg_on_intersection(index,bgnd_rail,control_rail,bgnd_move_peg_checkbox.Checked,True,False).angle;  // math2_unit

            end;

  finally
    intersect_form.progress_bar.Position:=0;
    redraw(True);            // all done
  end;//try
end;
//______________________________________________________________________________

procedure Tintersect_form.cancel_buttonClick(Sender: TObject);

begin
  intersect_cancel_clicked:=True;
end;
//______________________________________________________________________________

procedure Tintersect_form.FormClose(Sender:TObject; var Action: TCloseAction);

begin
  intersect_cancel_clicked:=True;
end;
//______________________________________________________________________________

procedure Tintersect_form.hide_buttonClick(Sender: TObject);

begin
  intersect_cancel_clicked:=True;
  Hide;
end;
//______________________________________________________________________________

procedure Tintersect_form.FormShow(Sender: TObject);

var
  index:integer;

begin
  index:=find_intersect_button.Tag;    // set on pop-up menu click

  if (index<0) or (index>(keeps_list.Count-1)) or (keeps_list.Count<1) then EXIT;   // ???

  if Ttemplate(keeps_list.Objects[index]).bgnd_plain_track=True       // bgnd template
     then begin
            bgnd1_radio.Caption:='1.  running  rail  ( MS )';
            bgnd4_radio.Caption:='4.  running  rail  ( TS )';
            bgnd24_radio.Caption:='centre-line  of  plain  track';

            bgnd2_radio.Enabled:=False;
            bgnd3_radio.Enabled:=False;
            bgnd25_radio.Enabled:=False;
          end
     else begin
            bgnd1_radio.Caption:='1.  main-road         stock  rail';
            bgnd4_radio.Caption:='4.  turnout-road    stock  rail';
            bgnd24_radio.Caption:='centre-line  of  main  road';

            bgnd2_radio.Enabled:=True;
            bgnd3_radio.Enabled:=True;
            bgnd25_radio.Enabled:=True;
          end;

  if plain_track=True    // control template
     then begin
            control1_radio.Caption:='1.  running  rail  ( MS )';
            control4_radio.Caption:='4.  running  rail  ( TS )';
            control24_radio.Caption:='centre-line  of  plain  track';

            control2_radio.Enabled:=False;
            control3_radio.Enabled:=False;
            control25_radio.Enabled:=False;
          end
     else begin
            control1_radio.Caption:='1.  main-road         stock  rail';
            control4_radio.Caption:='4.  turnout-road    stock  rail';
            control24_radio.Caption:='centre-line  of  main  road';

            control2_radio.Enabled:=True;
            control3_radio.Enabled:=True;
            control25_radio.Enabled:=True;
          end;

  angle_label.Caption:='1:'+round_str(xingn_target,2)+' RAM  (1:'+round_str((1/2/TAN(ARCTAN(1/xingn_target)/2)),2)+' CLM)';

  result_static.Caption:='';
end;
//______________________________________________________________________________

procedure Tintersect_form.angle_buttonClick(Sender: TObject);

const
  target_help_str:string='This function adjusts the curving radius in the control template to intersect at the target angle.'
                        +' Ensure the fixing peg on the control template is in a suitable position for the curving.'
                        +'||This function could be very slow and might fail. Save your work first.'
                        +'||Enter the target angle in RAM units (to enter a CLM angle, use the q letter prefix.)';

var
  n:integer;
  od:Toutdim;

begin

  n:=putdim(target_help_str,0,'target  intersection  angle  1: ',xingn_target,True,True,True,False);   // no neg, no preset, no zero, don't terminate on zero.
  if n<>0 then EXIT;

  if getdims('expert :  target  intersection  angle','',intersect_form,n,od)=True
     then begin
            xingn_target:=od[0];

            adjust_rad_checkbox.Checked:=True;  // assume he wants it
          end;

  angle_label.Caption:='1:'+round_str(xingn_target,2)+' RAM  (1:'+round_str((1/2/TAN(ARCTAN(1/xingn_target)/2)),2)+' CLM)';
end;
//______________________________________________________________________________

procedure Tintersect_form.help_buttonClick(Sender: TObject);

begin
  go_to_templot_companion_page('find_intersection.php');
end;
//______________________________________________________________________________

end.

