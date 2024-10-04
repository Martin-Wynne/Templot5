
(*
================================================================================

    This file is part of OpenTemplot2024, a computer program for the design of model railway track.
    Copyright (C) 2024  Martin Wynne and OpenTemplot contributors.    email: martin@85a.uk

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

   This file was derived from Templot2 version 244e

*)

unit brick_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type

  { Tbrick_form }

  Tbrick_form = class(TForm)
   store_marker_colour_button: TButton;
   Label1: TLabel;
   show_labels_checkbox: TCheckBox;
   store_marker_colour_panel: TPanel;
   store_using_marker_colour_checkbox: TCheckBox;
   zoom_to_brick_button: TButton;
   bricklaying_checkbox: TCheckBox;
   bgnd_chairs_checkbox: TCheckBox;
   do_dxf_button: TButton;
   store_shift_multi_button: TButton;
   shrink_gauge_checkbox: TCheckBox;
   blanking_button: TButton;
   multi_settings_button: TButton;
   shrink_switch_button: TButton;
   isolate_v_xing_button: TButton;
   isolate_k_xing_button: TButton;
   l1_fill_checkbox: TCheckBox;
   shrink_more_checkbox: TCheckBox;
   procedure show_labels_checkboxClick(Sender: TObject);
   procedure zoom_to_brick_buttonClick(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure do_dxf_buttonClick(Sender: TObject);
   procedure store_marker_colour_panelClick(Sender: TObject);
   procedure store_shift_multi_buttonClick(Sender: TObject);
   procedure bricklaying_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   procedure blanking_buttonClick(Sender: TObject);
   procedure multi_settings_buttonClick(Sender: TObject);
   procedure shrink_switch_buttonClick(Sender: TObject);
   procedure isolate_k_xing_buttonClick(Sender: TObject);
   procedure isolate_v_xing_buttonClick(Sender: TObject);
   procedure bgnd_chairs_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 private
   { Private declarations }
 public
   { Public declarations }
 end;

var
  brick_form: Tbrick_form;

  heel_blankingx:extended=0;
  heel_lengthx:extended=0;

  xing_blankingx:extended=0;
  xing_lengthx:extended=0;

implementation

{$R *.lfm}

uses
  control_room,pad_unit,math_unit,keep_select,dxf_unit,colour_unit,chairs_unit,entry_sheet,rail_options_unit,
  bgkeeps_unit;

//______________________________________________________________________________

procedure Tbrick_form.FormCreate(Sender: TObject);    // 235b

begin
  pad_form.InsertControl(brick_form);

  ClientWidth:=570;
  ClientHeight:=152;

  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Tbrick_form.zoom_to_brick_buttonClick(Sender: TObject);

begin
  if keeps_list.Count<1 then EXIT;

  pad_view_fit_bgnd(2,store_marker_colour_panel.Color);   // 2=brick only
end;
//______________________________________________________________________________

procedure Tbrick_form.show_labels_checkboxClick(Sender: TObject);

begin
  redraw(True);
end;
//______________________________________________________________________________

procedure Tbrick_form.bgnd_chairs_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  bgkeeps_form.chair_outlines_checkbox.Checked:=brick_form.bgnd_chairs_checkbox.Checked;    // 244d    keep in sync

  redraw(True);
end;
//______________________________________________________________________________

procedure Tbrick_form.do_dxf_buttonClick(Sender: TObject);

begin
  export_templates_dxf;        // go export a DXF/STL file
end;
//______________________________________________________________________________

procedure Tbrick_form.store_marker_colour_panelClick(Sender: TObject);

var
  old:TColor;

begin
  old:=brick_form.store_marker_colour_panel.Color;
  brick_form.store_marker_colour_panel.Color:=get_colour('choose  a marker  colour  to  be  used  when  storing  background  templates',brick_form.store_marker_colour_panel.Color);
  if brick_form.store_marker_colour_panel.Color<>old
     then begin
            brick_form.store_using_marker_colour_checkbox.Checked:=True;                     // colour changed, assume she wants to use it
            dxf_form.marker_colour_panel.Color:=brick_form.store_marker_colour_panel.Color;  // assume it's for a timbering brick
          end;
end;
//______________________________________________________________________________

procedure Tbrick_form.bricklaying_checkboxMouseUp(Sender: TObject; Button:TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  timbering_brick:=bricklaying_checkbox.Checked;
  inherited_use_marker:=bricklaying_checkbox.Checked;                 // no marker colour
  dxf_form.brick_option_radio.Checked:=bricklaying_checkbox.Checked;  // 241c
end;
//______________________________________________________________________________

procedure Tbrick_form.store_shift_multi_buttonClick(Sender: TObject);

var
  n:integer;
  save_gauge_pi:extended;

  save_timber_len:extended;

  gauge_shrunk,save_drive:boolean;

begin
  cancel_adjusts(False);

  keep_form.alert_on_store_menu_entry.Checked:=False;

  gauge_shrunk:=False;             // init..
  save_drive:=switch_drive_flag;

  save_gauge_pi:=cpi.gauge_pi;   // init..
  save_timber_len:=cpi.tb_pi;

  if (plain_track=True) and (shrink_gauge_checkbox.Checked=True)
     then begin
            guide_marks:=False;

            if shrink_more_checkbox.Checked=True  // for doing loose jaws only
               then begin
                      cpi.gauge_pi:=inscale/2;      // 1/2" gauge
                      cpi.tb_pi:=15*inscale;
                    end
               else begin

                      multi_settings_button.Click;   // 244f

                      if use_all_bridge_chairs=True
                         then begin
                                cpi.gauge_pi:=(_2d_data.L1_chair_inlong*2+shrink_gauge_spacing)*inscale;
                                cpi.tb_pi:=(_2d_data.L1_chair_outlong*2+_2d_data.L1_chair_inlong*2+shrink_gauge_spacing+2)*inscale;   // 1" extra each end
                              end
                         else begin
                                cpi.gauge_pi:=(_2d_data.S1_chair_inlong*2+shrink_gauge_spacing)*inscale;
                                cpi.tb_pi:=(_2d_data.S1_chair_outlong*2+_2d_data.S1_chair_inlong*2+shrink_gauge_spacing+2)*inscale;   // 1" extra each end
                              end;
                    end;
            get_cpi;
            redraw(False);    // init

            gauge_shrunk:=True;
          end;

  if (plain_track=False) and (turnoutx<(toex+24*inscale)) and (shrink_gauge_checkbox.Checked=True)         // for P chairs or MS CC chairs on J1
     then begin
            guide_marks:=False;
            switch_drive_flag:=False;

            cpi.gauge_pi:=(_2d_data.P_chair_inlong*2+shrink_gauge_spacing*2.5)*inscale;
            cpi.tb_pi:=(_2d_data.P_chair_outlong*2+_2d_data.P_chair_inlong*2+shrink_gauge_spacing*2.5+4)*inscale;   // 2" extra each end

            get_cpi;
            redraw(False);    // init

            gauge_shrunk:=True;
          end;

  if (plain_track=False) and (turnoutx>=(toex+24*inscale)) and (shrink_gauge_checkbox.Checked=True)
     then show_modal_message('gauge change invalid -- turnout template must be shortened to single timber at switch');

  for n:=0 to (Trunc(shift_store_count*4/scale)-1) do begin

    pad_form.store_and_background_menu_entry.Click;
    redraw(False);

    xshift:=xshift+shift_store_x*inscale;
    redraw(False);

  end;//next

  xshift:=xshift+shift_store_x*inscale;   // move away 1 space more
  redraw(False);

  if gauge_shrunk=True
     then begin
            switch_drive_flag:=save_drive;
            guide_marks:=pad_form.guide_marks_menu_entry.Checked;
            cpi.gauge_pi:=save_gauge_pi;
            cpi.tb_pi:=save_timber_len;
            get_cpi;
            redraw(False);
          end;
end;
//______________________________________________________________________________

procedure Tbrick_form.blanking_buttonClick(Sender: TObject);

begin
  pad_form.adjust_blanking_length_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tbrick_form.multi_settings_buttonClick(Sender: TObject);

const
  str1:string='    `0Store and Shift Multi - count`9'
  +'||Enter the number of times to store and then shift the control template as a background template.'
  +'||The default number is 15 in 4mm/ft scale. This is the number of new background templates which will be created.'
  +'||Ensure that the control template is located in a clear area of the trackpad before using this function';


  str2:string='    `0Store and Shift Multi by X`9'
  +'||Enter a dimension in mm for the amount to shift the control template in the X direction each time.'
  +'||Enter a positive or negative dimension to shift forward or back.'
  +'||The default dimension is the scale equivalent of 15 inches backwards.';

  str:string='please refer to Templot Club user forum';


var
  n:integer;
  od:Toutdim;

begin
     putdim(str1,0,'number  of  new  background  templates',Trunc(shift_store_count*4/scale),True,True,True,False);   // no neg, no pre-set, no zero.
     putdim(str2,1,'shift  each  new  template  by',shift_store_x*inscale,False,True,True,False);                     // neg ok, no pre-set, no zero.
  n:=putdim(str,1,'shrink  gauge  for  multi  -  spacing',shrink_gauge_spacing*inscale,True,True,True,False);         // no neg, no pre-set, no zero, don't terminate on zero.

    if n<>2 then EXIT;
    if getdims('store  and  shift  multi','',pad_form,n,od)=True
       then begin
              shift_store_count:=od[0]*scale/4;
              shift_store_x:=od[1]/inscale;
              shrink_gauge_spacing:=od[2]/inscale;
              redraw(True);
            end;
end;
//______________________________________________________________________________

procedure Tbrick_form.shrink_switch_buttonClick(Sender: TObject);   // 243a

var
  save_startx:extended;
  save_turnoutx:extended;

  save_timber_len:extended;

  save_drive:boolean;

  shift_x,y_mod:extended;

begin
  cancel_adjusts(False);

  if exp_chairing=False
     then begin
            show_modal_message('invalid request -- the control template is not set for experimental chairing');
            EXIT;
          end;

  if (plain_track=True) or (half_diamond=True)
     then begin
            show_modal_message('invalid request -- the control template is not a turnout template');
            EXIT;
          end;

  if (heel_blankingx=0) or (heel_lengthx=0)
      then begin
            show_modal_message('invalid request -- the control template does not contain a fully chaired REA switch');
            EXIT;
          end;

  keep_form.alert_on_store_menu_entry.Checked:=False;

             // init..

  shift_x:=13;   // 13" in case includes rail joint

  y_mod:=24;     // 24" gauge reduction.

  guide_marks:=False;

  save_drive:=switch_drive_flag;
  save_turnoutx:=turnoutx;
  save_timber_len:=cpi.tb_pi;

  track_centre_lines_flag:=False;

  pad_form.bg_crosshatched_timber_infill_menu_entry.Click;

  main_road_crossing_rail_flag:=False;
  turnout_road_crossing_rail_flag:=False;

  cpi.tb_pi:=18*inscale; // 18" arbitrary
  get_cpi;

  startx:=heel_blankingx;
  turnoutx:=heel_lengthx;
  turnout_i:=1;                         // length locked at turnoutx.
  turnout_road_stock_rail_flag:=False;
  main_road_stock_rail_flag:=True;

  do_railedges;
  redraw(False);

  pad_form.store_and_background_menu_entry.Click;    // main road block chairs

  if l1_fill_checkbox.Checked=True
     then begin

            xshift:=xshift+(shift_x*inscale);        // -2" in case includes rail joint
            use_all_bridge_chairs:=True;
            redraw(False);

            pad_form.store_and_background_menu_entry.Click;   // main road L1 chairs

            turnout_road_stock_rail_flag:=True;
            main_road_stock_rail_flag:=False;

            yshift:=yshift-(g-(y_mod*inscale));//*hand_i;     // shift towards main road

            do_railedges;
            redraw(False);

            pad_form.store_and_background_menu_entry.Click;    // turnout road L1 chairs

            use_all_bridge_chairs:=False;
            xshift:=xshift-(shift_x*inscale);

          end
     else begin
            yshift:=yshift-(g-(y_mod*inscale));//*hand_i;      // shift towards main road

            turnout_road_stock_rail_flag:=True;
            main_road_stock_rail_flag:=False;
          end;

  do_railedges;
  redraw(False);

  pad_form.store_and_background_menu_entry.Click;    // turnout road block chairs

     // restore ...

  track_centre_lines_flag:=True;

  yshift:=yshift+(g-(y_mod*inscale));//*hand_i;
  switch_drive_flag:=save_drive;
  startx:=0;
  turnoutx:=save_turnoutx;
  guide_marks:=pad_form.guide_marks_menu_entry.Checked;
  cpi.tb_pi:=save_timber_len;

  main_road_stock_rail_flag:=True;
  turnout_road_stock_rail_flag:=True;

  main_road_crossing_rail_flag:=True;
  turnout_road_crossing_rail_flag:=True;

  get_cpi;

  do_railedges;
  redraw(False);

  pad_form.hide_control_template_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tbrick_form.isolate_v_xing_buttonClick(Sender: TObject);

var
  save_startx:extended;
  save_turnoutx:extended;

  save_drive:boolean;


begin
  cancel_adjusts(False);

  if exp_chairing=False
     then begin
            show_modal_message('invalid request -- the control template is not set for experimental chairing');
            EXIT;
          end;

  if plain_track=True
     then begin
            show_modal_message('invalid request -- the control template is a plain track template');
            EXIT;
          end;

  if (xing_blankingx=0) or (xing_lengthx=0)
      then begin
            show_modal_message('invalid request -- the control template does not contain a fully chaired V-crossing');
            EXIT;
          end;

  keep_form.alert_on_store_menu_entry.Checked:=False;

             // init..

  guide_marks:=False;

  save_drive:=switch_drive_flag;
  save_turnoutx:=turnoutx;

  track_centre_lines_flag:=False;

  startx:=xing_blankingx;
  turnoutx:=xing_lengthx;
  turnout_i:=1;                         // length locked at turnoutx.

  turnout_road_stock_rail_flag:=False;
  main_road_stock_rail_flag:=False;

  main_road_check_rail_flag:=False;
  turnout_road_check_rail_flag:=False;

  do_railedges;
  redraw(False);

  pad_form.store_and_background_menu_entry.Click;    // main road block chairs

     // restore ...

  track_centre_lines_flag:=True;

  switch_drive_flag:=save_drive;
  startx:=0;
  turnoutx:=save_turnoutx;

  guide_marks:=pad_form.guide_marks_menu_entry.Checked;

  main_road_stock_rail_flag:=True;
  turnout_road_stock_rail_flag:=True;

  main_road_check_rail_flag:=True;
  turnout_road_check_rail_flag:=True;

  do_railedges;
  redraw(False);

  pad_form.hide_control_template_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tbrick_form.isolate_k_xing_buttonClick(Sender: TObject);

begin
  show_modal_message('nyi -- K-crossings are not yet supported for experimental chairing');
end;
//______________________________________________________________________________


end.

