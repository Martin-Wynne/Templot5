
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

   This file was derived from Templot2 version 244e

*)

unit rail_options_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  Trail_options_form = class(TForm)
    top_label: TLabel;
    turnout_groupbox: TGroupBox;
    xing_joints_groupbox: TGroupBox;
    turnout_road_check_rail_checkbox: TCheckBox;
    turnout_road_crossing_rail_checkbox: TCheckBox;
    crossing_vee_checkbox: TCheckBox;
    main_road_crossing_rail_checkbox: TCheckBox;
    main_road_check_rail_checkbox: TCheckBox;
    main_road_stock_rail_checkbox: TCheckBox;
    wing_rail_joints_checkbox: TCheckBox;
    vee_rail_joints_checkbox: TCheckBox;
    plain_track_groupbox: TGroupBox;
    plain_track_ts_rail_checkbox: TCheckBox;
    plain_track_ms_rail_checkbox: TCheckBox;
    turnout_road_stock_rail_checkbox: TCheckBox;
    restore_all_button: TButton;
    help_button: TButton;
    blue_corner_panel: TPanel;
    size_updown: TUpDown;
    colour_panel: TPanel;
    colour_patch: TImage;
    help_shape: TShape;
    hide_panel: TPanel;
    hide_button: TButton;
    k_ms_check_rail_checkbox: TCheckBox;
    k_ds_check_rail_checkbox: TCheckBox;
    invert_rails_button: TButton;
    ts_exit_stock_rail_joint_checkbox: TCheckBox;
    ms_exit_stock_rail_joint_checkbox: TCheckBox;
    plain_track_ts_rail_joints_checkbox: TCheckBox;
    plain_track_ms_rail_joints_checkbox: TCheckBox;
    joints_top_label: TLabel;
    set_all_exit_joints_button: TButton;
    Label2: TLabel;
    Label3: TLabel;
    ts_stock_radio: TRadioButton;
    ts_vee_radio: TRadioButton;
    ms_vee_radio: TRadioButton;
    ms_stock_radio: TRadioButton;
    slide_button: TButton;
    set_at_marker_button: TButton;
    reset_joint_button: TButton;
    switch_joints_groupbox: TGroupBox;
    switch_front_joints_checkbox: TCheckBox;
    switch_rail_joints_checkbox: TCheckBox;
    switch_stock_rail_joints_checkbox: TCheckBox;
    k_crossing_joints_checkbox: TCheckBox;
    reset_all_exit_joints_button: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure switch_front_joints_checkboxClick(Sender: TObject);
    procedure help_buttonClick(Sender: TObject);
    procedure restore_all_buttonClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure colour_panelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure hide_buttonClick(Sender: TObject);
    procedure invert_rails_buttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure slide_buttonClick(Sender: TObject);
    procedure set_at_marker_buttonClick(Sender: TObject);
    procedure reset_joint_buttonClick(Sender: TObject);
    procedure set_all_exit_joints_buttonClick(Sender: TObject);
    procedure reset_all_exit_joints_buttonClick(Sender: TObject);
    procedure ts_stock_radioClick(Sender: TObject);
    procedure ts_vee_radioClick(Sender: TObject);
    procedure ms_vee_radioClick(Sender: TObject);
    procedure ms_stock_radioClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rail_options_form: Trail_options_form;

  procedure update_rail_settings;  // 206b  update all the checkboxes (called from compile_info on pad)

  procedure apply_rail_settings;   // 243a


implementation

{$BOOLEVAL ON}


uses
  pad_unit, help_sheet, colour_unit, math_unit, entry_sheet, bgkeeps_unit;

{$R *.lfm}

var
  form_showing:boolean=False;

//______________________________________________________________

procedure update_rail_settings;  // 206b  update all the checkboxes (called from compile_info on pad)

begin
  form_showing:=False;   // needed to prevent these changes generating a click on the boxes.

  with rail_options_form do begin

    if half_diamond=False
       then begin
              turnout_groupbox.Caption:=' turnout  rails :  ';
              turnout_road_stock_rail_checkbox.Caption:='turnout-road  stock  rail';
              turnout_road_check_rail_checkbox.Caption:='turnout-road  check  rail';
              turnout_road_crossing_rail_checkbox.Caption:='turnout-road  crossing  rail';
            end
       else begin
              turnout_groupbox.Caption:=' half-diamond  rails :  ';
              turnout_road_stock_rail_checkbox.Caption:='diagonal-road  stock  rail';
              turnout_road_check_rail_checkbox.Caption:='diagonal-road  check  rail';
              turnout_road_crossing_rail_checkbox.Caption:='diagonal-road  crossing  rail';
            end;

    plain_track_ms_rail_checkbox.Enabled:=plain_track;      
    plain_track_ts_rail_checkbox.Enabled:=plain_track;

    turnout_road_stock_rail_checkbox.Enabled:= NOT plain_track;
    turnout_road_check_rail_checkbox.Enabled:= NOT plain_track;
    turnout_road_crossing_rail_checkbox.Enabled:= NOT plain_track;
    crossing_vee_checkbox.Enabled:= NOT plain_track;
    main_road_crossing_rail_checkbox.Enabled:= NOT plain_track;
    main_road_check_rail_checkbox.Enabled:= NOT plain_track;
    main_road_stock_rail_checkbox.Enabled:= NOT plain_track;

    switch_front_joints_checkbox.Enabled:=(NOT plain_track) and (NOT half_diamond);
    switch_rail_joints_checkbox.Enabled:=(NOT plain_track) and (NOT half_diamond);
    switch_stock_rail_joints_checkbox.Enabled:=(NOT plain_track) and (NOT half_diamond);

    wing_rail_joints_checkbox.Enabled:= NOT plain_track;
    vee_rail_joints_checkbox.Enabled:= NOT plain_track;

    ts_exit_stock_rail_joint_checkbox.Enabled:= NOT plain_track;    // 227a
    ms_exit_stock_rail_joint_checkbox.Enabled:= NOT plain_track;    // 227a

    joints_top_label.Visible:= NOT plain_track;  // 227a

    ts_stock_radio.Enabled:= NOT plain_track;    // 227a
    ms_stock_radio.Enabled:= NOT plain_track;    // 227a
    ts_vee_radio.Enabled:= NOT plain_track;      // 227a
    ms_vee_radio.Enabled:= NOT plain_track;      // 227a

    slide_button.Enabled:= NOT plain_track;     // 227a
    set_at_marker_button.Enabled:= NOT plain_track;    // 227a
    reset_joint_button.Enabled:= NOT plain_track;   // 227a

    set_all_exit_joints_button.Enabled:= NOT plain_track;    // 227a
    reset_all_exit_joints_button.Enabled:= NOT plain_track;  // 227a

    k_crossing_joints_checkbox.Enabled:= (plain_track=False) and (half_diamond=True);

    k_ds_check_rail_checkbox.Enabled:= (plain_track=False) and (half_diamond=True);
    k_ms_check_rail_checkbox.Enabled:= (plain_track=False) and (half_diamond=True);

    //-------


    plain_track_ts_rail_joints_checkbox.Checked:= NOT omit_tspt_marks;    // 227a  also for turnout approach and exit track..
    plain_track_ms_rail_joints_checkbox.Checked:= NOT omit_mspt_marks;    // 227a

    switch_front_joints_checkbox.Checked:= NOT omit_swfj_marks;
    switch_rail_joints_checkbox.Checked:= NOT omit_swrj_marks;
    switch_stock_rail_joints_checkbox.Checked:= NOT omit_skj_marks;
    wing_rail_joints_checkbox.Checked:= NOT omit_wj_marks;
    vee_rail_joints_checkbox.Checked:= NOT omit_vj_marks;

    ts_exit_stock_rail_joint_checkbox.Checked:= NOT omit_tsxj_marks;    // 227a
    ms_exit_stock_rail_joint_checkbox.Checked:= NOT omit_msxj_marks;    // 227a

    k_crossing_joints_checkbox.Checked:= NOT omit_kx_marks;

    turnout_road_stock_rail_checkbox.Checked:=turnout_road_stock_rail_flag;
    turnout_road_check_rail_checkbox.Checked:=turnout_road_check_rail_flag;
    turnout_road_crossing_rail_checkbox.Checked:=turnout_road_crossing_rail_flag;
    crossing_vee_checkbox.Checked:=crossing_vee_flag;
    main_road_stock_rail_checkbox.Checked:=main_road_stock_rail_flag;
    main_road_check_rail_checkbox.Checked:=main_road_check_rail_flag;
    main_road_crossing_rail_checkbox.Checked:=main_road_crossing_rail_flag;

    plain_track_ts_rail_checkbox.Checked:=turnout_road_stock_rail_flag;
    plain_track_ms_rail_checkbox.Checked:=main_road_stock_rail_flag;

    k_ds_check_rail_checkbox.Checked:=k_diagonal_side_check_rail_flag;
    k_ms_check_rail_checkbox.Checked:=k_main_side_check_rail_flag;

  end;//with form

  form_showing:=True;
end;
//________________________________________________________________

procedure apply_rail_settings;

var
  cancel_diff:boolean;

begin
  if form_showing=False then EXIT;

  with rail_options_form do begin

    omit_tspt_marks:= NOT plain_track_ts_rail_joints_checkbox.Checked;   // 227a
    omit_mspt_marks:= NOT plain_track_ms_rail_joints_checkbox.Checked;   // 227a

    omit_swfj_marks:= NOT switch_front_joints_checkbox.Checked;
    omit_swrj_marks:= NOT switch_rail_joints_checkbox.Checked;
    omit_skj_marks:= NOT switch_stock_rail_joints_checkbox.Checked;
    omit_wj_marks:= NOT wing_rail_joints_checkbox.Checked;
    omit_vj_marks:= NOT vee_rail_joints_checkbox.Checked;

    omit_tsxj_marks:= NOT ts_exit_stock_rail_joint_checkbox.Checked;    // 227a
    omit_msxj_marks:= NOT ms_exit_stock_rail_joint_checkbox.Checked;    // 227a

    omit_kx_marks:= NOT k_crossing_joints_checkbox.Checked;

    if plain_track=True       // mods 0.94.a
       then begin
              turnout_road_stock_rail_flag:=plain_track_ts_rail_checkbox.Checked;
              main_road_stock_rail_flag:=plain_track_ms_rail_checkbox.Checked;
            end
       else begin
              turnout_road_stock_rail_flag:=turnout_road_stock_rail_checkbox.Checked;
              main_road_stock_rail_flag:=main_road_stock_rail_checkbox.Checked;
            end;

    turnout_road_check_rail_flag:=turnout_road_check_rail_checkbox.Checked;
    turnout_road_crossing_rail_flag:=turnout_road_crossing_rail_checkbox.Checked;

    crossing_vee_flag:=crossing_vee_checkbox.Checked;

    main_road_check_rail_flag:=main_road_check_rail_checkbox.Checked;
    main_road_crossing_rail_flag:=main_road_crossing_rail_checkbox.Checked;

    k_diagonal_side_check_rail_flag:=k_ds_check_rail_checkbox.Checked;
    k_main_side_check_rail_flag:=k_ms_check_rail_checkbox.Checked;

  end;//with

  cancel_diff:=False;  // init

  case current_diff_code of   // 0.94.a  check rail diffs ...

    501,502: cancel_diff:= NOT main_road_check_rail_flag;          // MS1 MS2
        503: cancel_diff:= NOT turnout_road_crossing_rail_flag;    // MS3
    504,505: cancel_diff:= NOT turnout_road_check_rail_flag;       // TS1 TS2
        506: cancel_diff:= NOT main_road_crossing_rail_flag;       // TS3
        507: cancel_diff:= NOT k_main_side_check_rail_flag;        // MS4
        508: cancel_diff:= NOT k_diagonal_side_check_rail_flag;    // DS4

  end;//case

  if cancel_diff=True then current_diff_code:=0;    // no longer a check rail to adjust.

  do_railedges;
  redraw_pad(True,True);
end;
//_________________________________________________________________

procedure Trail_options_form.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  apply_rail_settings;
  form_showing:=False;
end;
//__________________________________________________________________

procedure Trail_options_form.switch_front_joints_checkboxClick(Sender:TObject);

   // common to all checkbox clicks...

begin
  if form_showing=False then EXIT;   // 0.94.a

  apply_rail_settings;
end;
//_____________________________________________________________________

procedure Trail_options_form.help_buttonClick(Sender: TObject);

const
  rail_options_help_str:string='    `0Omit  Individual  Rails  and  Joints`9'
  +'||Untick these boxes to omit individual rails or rail-joint marks from the control template.'
  +'||These options are intended for use when overlaying partial templates. To remove all the rails click instead the `0REAL > RAILS > NO RAILS`1 menu item.'
  +'||To change the settings for plain-track joint marks, click the `0REAL > PLAIN TRACK OPTIONS > RAIL-JOINT MARKS >`1 menu options.'
  +'||Click the `0RESTORE ALL`1 button to restore all rails and joint marks omitted here. (This will have no effect if `0REAL > RAILS > NO RAILS`1 has been selected.)';

begin
  help(0,rail_options_help_str,'');
end;
//__________________________________________________________________________________________

procedure Trail_options_form.restore_all_buttonClick(Sender: TObject);

begin
  form_showing:=False;   // needed to prevent these changes generating a click on the boxes.

  plain_track_ts_rail_joints_checkbox.Checked:=True;    // 227a
  plain_track_ms_rail_joints_checkbox.Checked:=True;    // 227a

  switch_front_joints_checkbox.Checked:=True;
  switch_rail_joints_checkbox.Checked:=True;
  switch_stock_rail_joints_checkbox.Checked:=True;
  wing_rail_joints_checkbox.Checked:=True;
  vee_rail_joints_checkbox.Checked:=True;

  ts_exit_stock_rail_joint_checkbox.Checked:=True;    // 227a
  ms_exit_stock_rail_joint_checkbox.Checked:=True;    // 227a

  k_crossing_joints_checkbox.Checked:=True;

  turnout_road_stock_rail_checkbox.Checked:=True;
  turnout_road_check_rail_checkbox.Checked:=True;
  turnout_road_crossing_rail_checkbox.Checked:=True;
  crossing_vee_checkbox.Checked:=True;
  main_road_stock_rail_checkbox.Checked:=True;
  main_road_check_rail_checkbox.Checked:=True;
  main_road_crossing_rail_checkbox.Checked:=True;

  plain_track_ts_rail_checkbox.Checked:=True;
  plain_track_ms_rail_checkbox.Checked:=True;

  k_ds_check_rail_checkbox.Checked:=True;
  k_ms_check_rail_checkbox.Checked:=True;

  form_showing:=True;

  apply_rail_settings;
end;
//____________________________________________________________________________________

procedure Trail_options_form.size_updownClick(Sender:TObject; Button:TUDBtnType);

begin
  if size_updown.Position>size_updown.Tag                          // ! position goes up, size goes down.
     then ScaleBy(9,10);                                           // scale the form contents down.

  if size_updown.Position<size_updown.Tag
     then ScaleBy(10,9);                                           // scale the form contents up.

  ClientHeight:=VertScrollBar.Range;                               // allow 4 pixel right margin.
  ClientWidth:=HorzScrollBar.Range+4;                              // don't need bottom margin - datestamp label provides this.
  ClientHeight:=VertScrollBar.Range;                               // do this twice, as each affects the other.

  size_updown.Tag:=size_updown.Position;                           // and save for the next click.
end;
//__________________________________________________________________________________________

procedure Trail_options_form.colour_panelClick(Sender: TObject);

begin
  Color:=get_colour('choose  a  new  window  colour  for  the  rail  options',Color);
end;
//__________________________________________________________________________________________

procedure Trail_options_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(rail_options_form);
  ClientWidth:=780;
  ClientHeight:=440;
  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Trail_options_form.hide_buttonClick(Sender: TObject);

begin
  Hide;
end;
//______________________________________________________________________________

procedure Trail_options_form.invert_rails_buttonClick(Sender: TObject);  // 0.94.a

begin
  form_showing:=False;   // needed to prevent these changes generating a click on the boxes.

  if plain_track=False
     then begin
            turnout_road_stock_rail_checkbox.Checked:=    NOT turnout_road_stock_rail_checkbox.Checked;

            turnout_road_check_rail_checkbox.Checked:=    NOT turnout_road_check_rail_checkbox.Checked;
            turnout_road_crossing_rail_checkbox.Checked:= NOT turnout_road_crossing_rail_checkbox.Checked;
            crossing_vee_checkbox.Checked:=               NOT crossing_vee_checkbox.Checked;

            main_road_stock_rail_checkbox.Checked:=       NOT main_road_stock_rail_checkbox.Checked;
            main_road_check_rail_checkbox.Checked:=       NOT main_road_check_rail_checkbox.Checked;
            main_road_crossing_rail_checkbox.Checked:=    NOT main_road_crossing_rail_checkbox.Checked;
          end
     else begin
            plain_track_ts_rail_checkbox.Checked:= NOT plain_track_ts_rail_checkbox.Checked;
            plain_track_ms_rail_checkbox.Checked:= NOT plain_track_ms_rail_checkbox.Checked;
          end;

  if half_diamond=True
     then begin
            k_ds_check_rail_checkbox.Checked:= NOT k_ds_check_rail_checkbox.Checked;
            k_ms_check_rail_checkbox.Checked:= NOT k_ms_check_rail_checkbox.Checked;
          end;

  form_showing:=True;

  apply_rail_settings;
end;
//______________________________________________________________________________

procedure Trail_options_form.FormShow(Sender: TObject);

begin
  update_rail_settings;       // 206b
end;
//______________________________________________________________________________

procedure Trail_options_form.ts_stock_radioClick(Sender: TObject);

begin
  locator_rail:=4;
  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.ts_vee_radioClick(Sender: TObject);

begin
  locator_rail:=2;
  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.ms_vee_radioClick(Sender: TObject);

begin
  locator_rail:=3;
  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.ms_stock_radioClick(Sender: TObject);

begin
  locator_rail:=1;
  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.slide_buttonClick(Sender: TObject);    // 227a

begin
  if ts_stock_radio.Checked=True
     then begin
            locatorx:=tvjp_stockjx;  // on existing joint
            locator_rail:=4;
          end;

  if ts_vee_radio.Checked=True
     then begin
            locatorx:=tvjp_veejx;  // on existing joint
            locator_rail:=2;
          end;

  if ms_vee_radio.Checked=True
     then begin
            locatorx:=mvjp_veejx;  // on existing joint
            locator_rail:=3;
          end;

  if ms_stock_radio.Checked=True
     then begin
            locatorx:=mvjp_stockjx;  // on existing joint
            locator_rail:=1;
          end;

  pad_form.show_locator_menu_entry.Checked:=True;
  pad_form.move_locator_menu_entry.Click;
  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.set_at_marker_buttonClick(Sender: TObject);  // 227a

begin
  if ts_stock_radio.Checked=True
     then begin
            if locator_rail<>4
               then begin
                      show_modal_message('the locator is not on the TS stock rail');
                      EXIT;
                    end;

            cpi.ts_joint_offset_pi:=(locatorx-tvjp_stocknx)/inscale;  // TS stock rail joint offset
          end;


  if ts_vee_radio.Checked=True
     then begin
            if locator_rail<>2
               then begin
                      show_modal_message('the locator is not on the TS vee rail');
                      EXIT;
                    end;

            cpi.tv_joint_offset_pi:=(locatorx-tvjp_veenx)/inscale;  // TS vee rail joint offset
          end;

  if ms_vee_radio.Checked=True
     then begin
            if locator_rail<>3
               then begin
                      show_modal_message('the locator is not on the MS vee rail');
                      EXIT;
                    end;

            cpi.mv_joint_offset_pi:=(locatorx-mvjp_nx)/inscale;  // MS vee rail joint offset
          end;

  if ms_stock_radio.Checked=True
     then begin
            if locator_rail<>1
               then begin
                      show_modal_message('the locator is not on the MS stock rail');
                      EXIT;
                    end;

            cpi.ms_joint_offset_pi:=(locatorx-mvjp_nx)/inscale;  // MS stock rail joint offset
          end;


  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.reset_joint_buttonClick(Sender: TObject);    // 227a

begin

  if ts_stock_radio.Checked=True
     then cpi.ts_joint_offset_pi:=0;

  if ts_vee_radio.Checked=True
     then cpi.tv_joint_offset_pi:=0;

  if ms_vee_radio.Checked=True
     then cpi.mv_joint_offset_pi:=0;

  if ms_stock_radio.Checked=True
     then cpi.ms_joint_offset_pi:=0;

  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.set_all_exit_joints_buttonClick(Sender: TObject);

const
  help_joints_str:string='     `0Set  rail-joint  offset  at  exit`9'
                  +'||Enter a dimension in full-size inches for the distance the exit rail-joint is displaced from its normal position which is set at `0real > V-crossing options > customize V-crossing > vee rail...`z menu item.'
                  +'||These offsets are measured positive forwards away from the|V-crossing. Distances back towards the V-crossing should be entered negative.'
                  +'||On the turnout-side (TS) the dimensions are measured parallel with the main-side (MS), not along the rail.'
                  +'||rp.gif Moving the vee-rail joints will modify the <B>TVJP</B> and <B>MVJP</B> peg positions, and affect branch tracks and splits. Moving the stock-rail joints has no effect on the peg positions.'
                  +'||green_panel_begin tree.gif  Moving the exit rail-joint positions does not affect the|V-crossing timbering, which will need to be shoved to match.'
                  +'||For most purposes, it is easier to modify the joint positions using the mouse actions and buttons on the dialog at|`0DO > OMIT RAILS / SET JOINT MARKS..`1 menu item.green_panel_end';
var
  n:integer;
  od:Toutdim;

begin
       putdim(help_joints_str,2,'TS  stock-rail  exit-joint  offset  ( full-size inches )',cpi.ts_joint_offset_pi,False,True,False,False);  // negative ok, no preset, zero ok, don't terminate on zero.

       putdim(help_joints_str,2,'TS  vee-rail  exit-joint  offset  ( full-size inches )',cpi.tv_joint_offset_pi,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.
       putdim(help_joints_str,2,'MS  vee-rail  exit-joint  offset  ( full-size inches )',cpi.mv_joint_offset_pi,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.

    n:=putdim(help_joints_str,2,'MS  stock-rail  exit-joint  offset  ( full-size inches )',cpi.ms_joint_offset_pi,False,True,False,False);  // negative ok, no preset, zero ok, don't terminate on zero.

    if n<>3 then EXIT;
    if getdims('set  rail-joint  offsets  at  exit ...','',pad_form,n,od)=True
       then begin
              cpi.ts_joint_offset_pi:=od[0];
              cpi.tv_joint_offset_pi:=od[1];
              cpi.mv_joint_offset_pi:=od[2];
              cpi.ms_joint_offset_pi:=od[3];
            end;
    redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.reset_all_exit_joints_buttonClick(Sender: TObject);

begin
  cpi.ts_joint_offset_pi:=0;
  cpi.tv_joint_offset_pi:=0;
  cpi.mv_joint_offset_pi:=0;
  cpi.ms_joint_offset_pi:=0;

  redraw(True);
end;
//______________________________________________________________________________

procedure Trail_options_form.FormHide(Sender: TObject);

begin
  pad_form.show_locator_menu_entry.Checked:=False;
  redraw(True);
end;
//______________________________________________________________________________

end.

