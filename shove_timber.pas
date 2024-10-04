
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

unit shove_timber;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type

  { Tshove_timber_form }

  Tshove_timber_form = class(TForm)
    add_bonus_button: TButton;
    backward_button: TButton;
    blue_corner_panel: TPanel;
    colour_panel: TPanel;
    colour_patch: TImage;
    crab_left_button: TButton;
    crab_panel: TPanel;
    crab_right_button: TButton;
    data_button: TButton;
    drop_button: TBitBtn;
    extra_fine_label: TLabel;
    extra_fine_radio: TRadioButton;
    far_flange_checkbox: TCheckBox;
    fine_label: TLabel;
    fine_radio: TRadioButton;
    forward_button: TButton;
    heave_chairs_button: TButton;
    help_button: TButton;
    hide_all_button: TButton;
    hide_button: TButton;
    hide_outline_button: TButton;
    hide_panel: TPanel;
    how_panel: TPanel;
    inches_radio_button: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lengthen_button: TButton;
    length_panel: TPanel;
    mf_snibs_checkbox: TCheckBox;
    mf_web_checkbox: TCheckBox;
    mm_radio_button: TRadioButton;
    mn_snibs_checkbox: TCheckBox;
    mn_web_checkbox: TCheckBox;
    modify_timber_colour_speedbutton: TSpeedButton;
    mouse_along_button: TButton;
    mouse_crab_button: TButton;
    mouse_groupbox: TGroupBox;
    mouse_length_button: TButton;
    mouse_throw_button: TButton;
    mouse_twist_button: TButton;
    mouse_width_button: TButton;
    ms_flange_checkbox: TCheckBox;
    narrow_button: TButton;
    near_flange_checkbox: TCheckBox;
    normal_label: TLabel;
    normal_radio: TRadioButton;
    number_panel: TPanel;
    ocol_shape: TShape;
    omit_all_button: TButton;
    omit_button: TButton;
    back_panel: TPanel;
    readout_label: TLabel;
    reset_button: TButton;
    restore_all_button: TButton;
    restore_button: TButton;
    retain_shoves_on_make_checkbox: TCheckBox;
    retain_shoves_on_mint_checkbox: TCheckBox;
    rolled_in_groupbox: TGroupBox;
    rolled_in_rails_only_radio_button: TRadioButton;
    rolled_in_sleepered_radio_button: TRadioButton;
    Shape1: TShape;
    shorten_button: TButton;
    show_all_blue_checkbox: TCheckBox;
    show_timber_details_button: TButton;
    size_updown: TUpDown;
    sleepering_length_label: TLabel;
    snib_link_far_checkbox: TCheckBox;
    snib_link_near_checkbox: TCheckBox;
    spare_checkbox: TCheckBox;
    tcol_shape: TShape;
    tf_snibs_checkbox: TCheckBox;
    tf_web_checkbox: TCheckBox;
    throw_panel: TPanel;
    timbering_length_label: TLabel;
    tn_snibs_checkbox: TCheckBox;
    tn_web_checkbox: TCheckBox;
    ts_flange_checkbox: TCheckBox;
    twist_acw_button: TButton;
    twist_cw_button: TButton;
    twist_origin_button: TButton;
    twist_panel: TPanel;
    widen_button: TButton;
    width_panel: TPanel;
    xtb_panel: TPanel;
    zero_button: TButton;
    procedure mf_web_checkboxClick(Sender: TObject);
    procedure mn_web_checkboxClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure colour_panelClick(Sender: TObject);
    procedure hide_buttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure omit_buttonClick(Sender: TObject);
    procedure restore_buttonClick(Sender: TObject);
    procedure restore_all_buttonClick(Sender: TObject);
    procedure mouse_along_buttonClick(Sender: TObject);
    procedure mouse_throw_buttonClick(Sender: TObject);
    procedure how_panelClick(Sender: TObject);
    procedure tf_web_checkboxClick(Sender: TObject);
    procedure tn_web_checkboxClick(Sender: TObject);
    procedure widen_buttonClick(Sender: TObject);
    procedure lengthen_buttonClick(Sender: TObject);
    procedure shorten_buttonClick(Sender: TObject);
    procedure narrow_buttonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure drop_buttonClick(Sender: TObject);
    procedure data_buttonClick(Sender: TObject);
    procedure twist_cw_buttonClick(Sender: TObject);
    procedure twist_acw_buttonClick(Sender: TObject);
    procedure normal_radioClick(Sender: TObject);
    procedure fine_radioClick(Sender: TObject);
    procedure extra_fine_radioClick(Sender: TObject);
    procedure backward_buttonClick(Sender: TObject);
    procedure forward_buttonClick(Sender: TObject);
    procedure show_all_blue_checkboxClick(Sender: TObject);
    procedure zero_buttonClick(Sender: TObject);
    procedure xtb_panelClick(Sender: TObject);
    procedure length_panelClick(Sender: TObject);
    procedure twist_panelClick(Sender: TObject);
    procedure throw_panelClick(Sender: TObject);
    procedure width_panelClick(Sender: TObject);
    procedure mouse_length_buttonClick(Sender: TObject);
    procedure mouse_width_buttonClick(Sender: TObject);
    procedure mouse_twist_buttonClick(Sender: TObject);
    procedure twist_origin_buttonClick(Sender: TObject);
    procedure add_bonus_buttonClick(Sender: TObject);
    procedure reset_buttonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure crab_left_buttonClick(Sender: TObject);
    procedure crab_right_buttonClick(Sender: TObject);
    procedure crab_panelClick(Sender: TObject);
    procedure mouse_crab_buttonClick(Sender: TObject);
    procedure mm_radio_buttonClick(Sender: TObject);
    procedure inches_radio_buttonClick(Sender: TObject);
    procedure omit_all_buttonClick(Sender: TObject);
    procedure retain_shoves_on_mint_checkboxClick(Sender: TObject);
    procedure retain_shoves_on_make_checkboxClick(Sender: TObject);
    procedure rolled_in_rails_only_radio_buttonClick(Sender: TObject);
    procedure rolled_in_sleepered_radio_buttonClick(Sender: TObject);
    procedure modify_timber_colour_speedbuttonClick(Sender: TObject);
    procedure tcol_shapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure show_timber_details_buttonClick(Sender: TObject);
    procedure ms_flange_checkboxClick(Sender: TObject);
    procedure ts_flange_checkboxClick(Sender: TObject);
    procedure far_flange_checkboxClick(Sender: TObject);
    procedure near_flange_checkboxClick(Sender: TObject);
    procedure spare_checkboxClick(Sender: TObject);
    procedure hide_outline_buttonClick(Sender: TObject);
    procedure heave_chairs_buttonClick(Sender: TObject);
    procedure hide_all_buttonClick(Sender: TObject);
    procedure tn_snibs_checkboxClick(Sender: TObject);
    procedure mn_snibs_checkboxClick(Sender: TObject);
    procedure tf_snibs_checkboxClick(Sender: TObject);
    procedure mf_snibs_checkboxClick(Sender: TObject);
    procedure snib_link_near_checkboxClick(Sender: TObject);
    procedure snib_link_far_checkboxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shove_timber_form: Tshove_timber_form;

  //----------------------

  show_shove_fs:boolean=False;       // True = show dims in full-size inches.
  show_origin_k:boolean=False;       // True = show timber twist from template datum.

  saved_timber_numbers_flag:boolean=False;

  procedure shove_buttons(able:boolean; omit_code,index:integer);    // enable/disable timber shove buttons.

  procedure shove_xtb_panel_click;
  procedure shove_throw_panel_click;
  procedure shove_twist_panel_click;
  procedure shove_crab_panel_click;
  procedure shove_length_panel_click;
  procedure shove_width_panel_click;

  function any_heaving_shoves(index:integer):boolean;     // 244a  any 3D chair heaving or snibs set?
//__________________________________________________________________________________

implementation

{$BOOLEVAL ON}


uses
  control_room, pad_unit, colour_unit, alert_unit, help_sheet, math_unit,
  enter_timber, bgkeeps_unit, entry_sheet, shoved_colour_unit,
  heave_chairs;

{$R *.lfm}
//_______________________________________________________________________________________________

const
    shovetimb_help_str:string='green_panel_begintree.gif These help notes are longer than most -- you may prefer to print them out. Click the `0PRINT`1 button above.green_panel_end'

  +'|      `0Shoving  Timbers  and  Sleepers`9'

  +'||Templot normally draws templates with the timbers of the correct sizes and in positions based on full-size railway practice, or in accordance with your size and spacing settings.'
  +'||The SHOVE functions permit you to change the position, alignment and size of individual timbers and sleepers within the control template, or to omit them from the template.'

  +'||"Timbers" are normally used for pointwork (switches, crossings and turnouts). The standard timber size for British standard-gauge railways is 12 inches wide by 6 inches thick. In Templot their numbers are prefixed S, T or X.'
  +'||"Sleepers" are normally used for plain track. The standard sleeper size for British standard-gauge railways is 10 inches wide by 5 inches thick. In Templot their numbers are prefixed A, B, E, J, N or R.'
  +'||The length of timbers varies as required to support the rails. Sleepers are normally of a standard fixed length,'
  +' typically 9ft in the pre-grouping era and 8ft 6ins later. Sleepers can be shortened, but it is not usual for them to be longer than this; a timber would be used instead.'
  +' For more information, see the help notes for the REAL > TIMBERING > TIMBERING DATA... menu item.'

  +'||You can shove or omit as many sleepers and timbers as you wish, or add additional "bonus timbers" to a template.'
  +'||Some of the reasons you might want to do this are these:'
  +'||Timbers may be shoved along the track to increase the space for point-rodding runs, etc.'
  +'||Timbers may be shoved along and/or twisted slightly to avoid conflicts where tracks come together in crossovers, junctions, etc.'
  +'||A minimum timber spacing of 2ft (centre-to-centre) is needed for rail joints and fishplates.'
  +'||Lengthened timbers can be used to support hand point-lever boxes, ground signals and detection devices, etc.'
  +'||Wider than standard timbers are sometimes used when this is necessary to accommodate chairs or baseplates which are offset or set at an angle.'
  +'||In the pre-grouping era, some railways used 12 inch wide timbers in place of standard sleepers adjacent to the rail joints in plain track.'

  +'||Timbers might be omitted over level (grade) crossings, inspection pits, inside engine sheds, etc., or where longitudinal baulk timbers (waybeams) are used (on the deck of girder bridges, over coal drops, etc.).'
  +'||Frequently at crossovers and junctions adjacent running lines are carried on long timbers across both tracks. This can be done by omitting timbers on one template, and extending the'
  +' length of the timbers on the adjoining template accordingly.'

  +'||When a short stubby turnout for narrow-gauge or industrial sidings is required, it is sometimes difficult to find a timber spacing setting (in the REAL > TIMBERING > TIMBERING DATA... menu item) which gives the required result.'
  +' It is often easier to leave the pre-set spacing and shove timbers manually to the required positions.'

  +'||There are also some purely model reasons for shoving timbers - to avoid baseboard joints, for example, or to clear point-motor linkages.'

  +'||In addition to the normal use for these shove timber functions, bonus "timbers" can be added to a template and heavily modified to represent a trackside structure such as a goods shed, cattle dock, coal bins, buffer stop, etc.'

  +'||Handy Hint :'
  +'|Do not begin shoving timbers until you are sure that the track plan is finalised.'
  +' Shoving individual timbers is a slow process, and changing the size or alignment of a template nearly always means that a new timbering layout is needed.'

  +'||            Using  the  Shove  Timber  Functions :'

  +'||To change the size or position of a timber ("shove" it), the timber or sleeper which you want to shove must first be selected.'
  +'||There are two ways to do this. The easiest and quickest is to click on the NUMBER of the required timber (not the timber itself).'
  +' The timber numbers will be highlighted as the mouse moves over them, and the timber selected for shoving shows in red.'

  +'||Sometimes it is not possible to click the timber number, for example when zoomed a long way in or out, or when one number is obscured by another,'
  +' so the timber to be shoved can also be selected by entering its number directly.'
  +' Click the blue down-arrow button to show an additional window, and enter the timber number in the box,'
  +' or select a previously shoved timber from the drop-down list. Then click the OK button.'

  +'||When a timber has been selected you can shove it, i.e. change its size and/or position. First try doing this using the buttons:'

  +'||Clicking the FORWARD button causes the selected timber to be moved forwards along the track centre-line by 1 inch (scale) with each click. The forward direction is away from the CTRL-0 datum end of the template.'
  +'||Clicking the BACKWARD button causes the selected timber to be moved backwards along the track centre-line by 1 inch (scale) with each click. The backward direction is towards the CTRL-0 datum end of the template.'

  +'||Clicking the ACW button causes the selected timber to be twisted by 1 degree anticlockwise with each click.'
  +'||Clicking the CW button causes the selected timber to be twisted by 1 degree clockwise with each click.'

  +'||Clicking the CRAB-RIGHT button causes the selected timber to be moved sideways by 1 inch (scale) with each click. The crab-right direction is away from the CTRL-0 datum end of the template.'
  +'||Clicking the CRAB-LEFT button causes the selected timber to be moved sideways by 1 inch (scale) with each click. The crab-left direction is towards the CTRL-0 datum end of the template.'
  +'||N.B. Unlike FORWARD and BACKWARD moves, CRAB moves apply after any twisting. If the timber has not been twisted or EQUALIZED, it is better to use FORWARD or BACKWARD instead.'

  +'||Clicking the LENGTHEN button causes the selected timber to be lengthened by 6 inches (scale) with each click.'
  +'||Clicking the SHORTEN button causes the selected timber to be shortened by 6 inches (scale) with each click.'

  +'||Changes in length normally take place at the turnout-side end of the timber only, so that a timber can easily be extended across double tracks.'
  +' If the SHIFT key is held down on the keyboard, the change in length will instead take place at the main-side end of the timber only.'

  +'||To throw a timber endways without changing its length, alternately lengthen it at one end and shorten it at the other.'

  +'||Clicking the WIDEN button causes the selected timber to be widened by 2 inches (scale) with each click.'
  +' So a standard 10 inch wide sleeper can be converted to a 12 inch wide timber with a single click.'

  +'||Clicking the NARROW button causes the selected timber to be narrowed by 2 inches (scale) with each click.'
  +' So a standard 12 inch wide timber can be converted to a 10 inch wide sleeper with a single click.'

  +'||To restore a shoved timber to its normal size and position, select it and then click the RESTORE TIMBER button.'

  +'||To remove a selected timber from the template, click the OMIT TIMBER button. Timbers which have been omitted retain their numbers, so that they can be selected for RESTORE TIMBER by clicking on the number.'

  +'||It is usually quicker to "click" the buttons by using the underlined accelerator keys shown on them. To quickly lengthen a timber for example, just keep pressing or hold down the L key on the keyboard.'

  +'||Now also try shoving timbers using the mouse actions. Select a timber by clicking on its number, and then click one of the ALONG, THROW, CRAB, TWIST, LENGTH or WIDTH mouse action buttons.'
  +' To get a more precise response from the mouse, change the RESPONSE RATE option settings,'
  +' or use the arrow keys on the number-pad to move the mouse pointer slowly (not the normal arrow keys - NUMLOCK must be on - see the ACTION > ? MOUSE ACTIONS HELP menu item).'

  +'||If the SHOW ALL SHOVED TIMBERS option box is ticked, all the timbers in the control template which have been shoved from their normal size or position will be shown in blue.'

  +'||Ocasionally a need arises for an additional timber. A "bonus" timber can be added to the template by clicking the ADD BONUS TIMBER button. You can add as many bonus timbers as you wish.'
  +' Each one will appear initially as a plain track sleeper at the CTRL-1 rail joint position. It can then be shoved to the desired size and position in the usual way.'
  +' To remove added bonus timbers, click the REAL > TIMBERING > BONUS TIMBERS > menu items.'

  +'||The RESTORE ALL button restores all the shoved timbers on the control template to their normal size and position.'

  +'||To change the size or spacings of ALL of the timbers, you should not use these shove timber functions, but select instead the REAL > TIMBERING >TIMBERING DATA...,'
  +' or the REAL > PLAIN TRACK OPTIONS > RAIL LENGTHS AND SLEEPER SPACINGS... menu items.'
  +'||To omit ALL of the timbers, you should not use these shove timber functions, but select instead the REAL > TIMBERING > NO TIMBERING menu option.'

  +'||The read-out panels show the current dimension to the centre of the selected timber, its length, width and other dimensions. By clicking these panels you can set these dimensions directly.'
  +'||By clicking the ZERO button you can set a zero datum on a selected timber for the centre dimensions, which makes it easy to check or set timber-to-timber spacings.'

  +' Click the RESET ZERO button to reset the timber centre dimensions to be from the template rail-end. For a turnout, this button additionally toggles between using the CTRL-0 rail end and the CTRL-1 stock rail joint positions as the zero datum.'
  +' For plain track this button additionally toggles between using the CTRL-0 rail end position and the first rail joint (which may have been rolled-in from the CTRL-1 rail end) as the zero datum.'

  +'||You can swap between having these dimensions shown and set in model sizes (in mm) or full-size prototype sizes (in inches) by clicking the MODEL MM or FULL-SIZE INCHES option buttons.'

  +'||There are two options for the way the twist angle is shown and set. If the dimension is shown suffixed by a ''¬'' symbol, the angle is measured from the normal square-on position across the rails.'
  +' If the dimension is shown suffixed by a ''÷'' symbol, the angle is measured from the CTRL-0 template datum. For a straight template there is no difference between these two options.'
  +' For a curved template, these options can be toggled by clicking the ¬ / ÷ button.'

  +'||If you prefer to shove timbers by entering the shove data directly, click the DATA... button.'

  +'||Handy Hints :'

  +'||Do not begin shoving timbers until you are sure that the track plan is finalised.'
  +' Shoving individual timbers is a slow process, and changing the size or alignment of a template nearly always means that a new timbering layout is needed.'

  +'||Clicking the timber number works only while the SHOVE TIMBER window is showing (REAL > SHOVE TIMBERS menu item, or SHIFT-F10), and the shove functions work only on the CONTROL TEMPLATE.'
  +' If the timbers to be shoved are part of a background template, you must first make it the control template. For notes on how to do this, click the HELP > YOUR TEMPLATE STORAGE BOX menu item.'

  +'||While the SHOVE TIMBER window is showing and the control template is not hidden, it is not possible to get the pop-up menu for a background template simply by clicking on it.'
  +' Instead, hold down the SHIFT key and click the template''s NAME LABEL, or first hide the control template (HOME key).'

  +'||Make a note of the underlined accelerator keys shown on the buttons. Then you can resize the form much smaller to avoid obstructing the drawing and still be able to use the buttons by pressing keys on the keyboard.'
  +'||For example, to widen a timber you can simply press the W key.'

  +'||For a useful list of all the timbers currently shoved on this template, click the blue down-arrow button, and then the down-arrow for the drop-down list.'

  +'||Do not switch off TIMBER CENTRE-LINES in the GENERATOR menu while shoving timbers.'
  +'||Using the shove timber functions is confusing if an excessive amount of timber randomizing is in force. Select the REAL > TIMBERING menu items to cancel randomizing while shoving timbers.'

  +'|----------------------------------------------------'
  +'||N.B. Selecting the SHOVE TIMBERS function has ensured that timber centre-lines and numbers are switched on in the GENERATOR menu while the SHOVE TIMBERS function is in use.'
  +'||The timber infill is also shown on the trackpad for the control template. If you do not want this while shoving,'
  +' select the TRACKPAD > TRACKPAD CONTROL TEMPLATE OPTIONS > TIMBER INFILL > NONE menu item.'

  +'||Using the mouse actions for shoving will also enable the FULL MOUSE DRAW screen refresh option so that you can see the timbers being shoved.'
  +' You may want to revert to the skeleton draw option when you have finished shoving timbers. To do this select the ACTION > MOUSE ACTION OPTIONS > SKELETON MOUSE DRAW menu item or SHIFT+CTRL-F12, or just press the ; (semi-colon) key.'

  +'||Bonus timbers are not affected by any blanking of turnout templates and unlike ordinary timbers they can be shoved into the blanked area.'
  +'||Bonus timbers and plain track sleepers can be shoved out beyond the CTRL-0 template datum end position if necessary.'
  +'||To shove an ordinary turnout timber out beyond the CTRL-0 datum end of a turnout template, it is first necessary to apply sufficient negative blanking to accommodate the shove.'
  +' This can be done by moving the fixing peg out as far as needed (CTRL-F8 mouse action), and then clicking the DO > BLANK UP TO PEG menu item.';

var
  saved_info_panel:integer=0;

  saved_timber_centres_flag:boolean=False;
  saved_timber_outlines_flag:boolean=True;

  saved_timb_infill_style:integer=3;
  saved_gen_infill:boolean=True;

  window_scaling:boolean=False;      // flag - otherwise ScrollInView on resize prevents form rescaling properly.

  setting_shove_checkboxes:boolean=False;

//________________________________________________________________________________________

procedure Tshove_timber_form.size_updownClick(Sender: TObject; Button: TUDBtnType);

begin
  window_scaling:=True;        // otherwise ScrollInView on resize prevents form rescaling properly.

  if size_updown.Position>size_updown.Tag       // ! position goes up, size goes down.
     then ScaleBy(9,10);                        // scale the form contents down.

  if size_updown.Position<size_updown.Tag
     then ScaleBy(10,9);                        // scale the form contents up.

// sc 25/07/24
//  ClientHeight:=VertScrollBar.Range;            // allow 4 pixel right margin.
//  ClientWidth:=HorzScrollBar.Range+4;           // don't need bottom margin - datestamp label provides this.
//  ClientHeight:=VertScrollBar.Range;            // do this twice, as each affects the other.
//

  size_updown.Tag:=size_updown.Position;        // and save for the next click.

  window_scaling:=False;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.colour_panelClick(Sender: TObject);

begin
  Color:=get_colour('choose  a  new  colour  for  the  shove  timbers  dialog',Color);
  Show;             // ensure form doesn't get hidden.
  BringToFront;
end;
//________________________________________________________________________________________

procedure Tshove_timber_form.hide_buttonClick(Sender: TObject);

begin
  Close;
end;
//_________________________________________________________________________________________

procedure Tshove_timber_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(shove_timber_form);
  ClientWidth:=780;
  ClientHeight:=302;
  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure shove_buttons(able:boolean; omit_code,index:integer);    // enable/disable timber shove buttons.

var
  enable_restore:boolean;

begin
  if exp_chairing=False then heave_chairs_form.Hide;  // 244a

  with shove_timber_form do begin

    retain_shoves_on_mint_checkbox.Checked:=retain_shoves_on_mint;
    retain_shoves_on_make_checkbox.Checked:=retain_shoves_on_make;

    if able=True
       then begin
              Caption:='      shove   timber / sleeper  '+current_shove_str;
              if omit_code=-1 then Caption:=Caption+'  ( omitted )';
              number_panel.Caption:=current_shove_str;

              heave_chairs_button.Caption:='heave  chairs  on  '+current_shove_str+' ...';

              heave_form_update(omit_code);
            end
       else begin
              xtb_panel.Caption:='';
              length_panel.Caption:='';
              width_panel.Caption:='';
              throw_panel.Caption:='';
              twist_panel.Caption:='';
              crab_panel.Caption:='';
              Caption:='      shove   timber / sleeper';
              number_panel.Caption:='';

              heave_chairs_button.Caption:='heave  chairs ...';

              heave_form_reset_all(True);        // 244a       True=no timber selected

            end;

    if (index>-1) and (index<Length(current_shoved_timbers))  //current_shove_list.Count)
       then begin

              setting_shove_checkboxes:=True;

              with current_shoved_timbers[index] do begin

                with shove_data do begin

                 // msb hide outline , - , - , spare , TS end flange , MS end flange , FAR side flange , NEAR side flange  lsb

                near_flange_checkbox.Checked:=((sv_option_bits AND $01)=0);   // bit off = normal, checked
                 far_flange_checkbox.Checked:=((sv_option_bits AND $02)=0);   // bit off = normal, checked
                  ms_flange_checkbox.Checked:=((sv_option_bits AND $04)=0);   // bit off = normal, checked
                  ts_flange_checkbox.Checked:=((sv_option_bits AND $08)=0);   // bit off = normal, checked

                     spare_checkbox.Checked:=((sv_option_bits AND $10)<>0);  // bit on = checked


                tn_snibs_checkbox.Checked:= NOT (snibs_data.omit_tsn_snibs=True);     // 244a ...
                tf_snibs_checkbox.Checked:= NOT (snibs_data.omit_tsf_snibs=True);
                mn_snibs_checkbox.Checked:= NOT (snibs_data.omit_msn_snibs=True);
                mf_snibs_checkbox.Checked:= NOT (snibs_data.omit_msf_snibs=True);

                snib_link_near_checkbox.Checked:=snibs_data.add_near_link;
                snib_link_far_checkbox.Checked:=snibs_data.add_far_link;


                tn_web_checkbox.Checked:= NOT (webs_data.omit_tsn_web=True);     // 555a ...
                tf_web_checkbox.Checked:= NOT (webs_data.omit_tsf_web=True);
                mn_web_checkbox.Checked:= NOT (webs_data.omit_msn_web=True);
                mf_web_checkbox.Checked:= NOT (webs_data.omit_msf_web=True);

                setting_shove_checkboxes:=False;


                       // this timber either omitted or both selected AND has been shoved?

                enable_restore:=(omit_code=-1)
                             OR ( (
                                        (sv_x<>0)       // xtb modifier.
                                     OR (sv_k<>0)       // angle modifier.
                                     OR (sv_o<>0)       // offset modifier (near end).
                                     OR (sv_l<>0)       // length modifier (far end).
                                     OR (sv_w<>0)       // width modifier (per side).
                                     OR (sv_c<>0)       // crab modifier.  0.78.c  01-02-03.

                                     OR (sv_use_tcol=True)   // 226a   using modified colours
                                     OR (sv_use_ocol=True)   // 226a

                                     OR (sv_bgnd=True)       // 226a   also use tcol for bgnd templates on pad
                                     OR (sv_export=True)     // 226a   also use ocol for exported images

                                     OR (sv_option_bits<>0)

                                     OR (any_heaving_shoves(index)=True)      // 244a  any 3D chair heaving or snibs set?

                                   ) AND (sv_code>0)    // 0=empty slot, -1=omit this timber,  1=shove this timber.
                                );


                end;//with shove data
              end;//with shoved timber
            end
       else enable_restore:=False;

    restore_button.Enabled:=enable_restore;                          // selected timber has been shoved.

    restore_all_button.Enabled:=(Length(current_shoved_timbers)>0);  // 0.95.a was >1     // there are others in list.

    zero_button.Enabled:=able;
    twist_origin_button.Enabled:=able;
    reset_button.Enabled:=able;

    if omit_code=-1 then able:=False;    // don't enable these if it's omitted.

    omit_button.Enabled:=able;
    hide_outline_button.Enabled:=able;   // 233a
    widen_button.Enabled:=able;
    narrow_button.Enabled:=able;
    lengthen_button.Enabled:=able;
    shorten_button.Enabled:=able;

    mouse_along_button.Enabled:=able;
    mouse_throw_button.Enabled:=able;
    mouse_length_button.Enabled:=able;
    mouse_crab_button.Enabled:=able;
    mouse_width_button.Enabled:=able;
    mouse_twist_button.Enabled:=able;

    twist_cw_button.Enabled:=able;
    crab_left_button.Enabled:=able;
    crab_right_button.Enabled:=able;
    twist_acw_button.Enabled:=able;
    forward_button.Enabled:=able;
    backward_button.Enabled:=able;

    xtb_panel.Enabled:=able;
    length_panel.Enabled:=able;
    width_panel.Enabled:=able;
    throw_panel.Enabled:=able;
    twist_panel.Enabled:=able;
    crab_panel.Enabled:=able;
    readout_label.Visible:=able;

    data_button.Enabled:=able;

    modify_timber_colour_speedbutton.Enabled:=able;  // 226a

    tcol_shape.Visible:=False;  // init
    ocol_shape.Visible:=False;  // init

    if (able=True) and (index>-1) and (index<Length(current_shoved_timbers))
       then begin
              with current_shoved_timbers[index].shove_data do begin

                if (sv_option_bits AND $40)<>0    // 232c sv_col_has_been_set=True
                   then begin
                          tcol_shape.Brush.Color:=sv_tcol;
                          tcol_shape.Visible:=True;

                          ocol_shape.Brush.Color:=sv_ocol;
                          ocol_shape.Visible:=True;
                        end;

              end;//with
            end;

  end;//with
end;
//______________________________________________________________________________

procedure Tshove_timber_form.FormShow(Sender: TObject);

begin

  with pad_form do begin
    if timber_centres_menu_entry.Checked=False then timber_centres_menu_entry.Click;  // must have the centre-lines for timber selection to work (toggle).
    if timber_numbers_menu_entry.Checked=False then timber_numbers_menu_entry.Click;  // need the numbers (toggle).

    saved_gen_infill:=timbering_infill;
    if timbering_infill=False then timbering_infill_menu_entry.Click;  // put timbering infill on in generator.

    saved_timb_infill_style:=pad_timb_infill_style;
    if pad_timb_infill_style=0 then solid_timbering_infill_menu_entry.Click;


    saved_timber_centres_flag:=current_timber_centres_menu_entry.Checked;
    saved_timber_numbers_flag:=current_timber_numbers_menu_entry.Checked;
    saved_timber_outlines_flag:=current_timber_outlines_menu_entry.Checked;

    current_timber_centres_menu_entry.Checked:=True;
    current_timber_numbers_menu_entry.Checked:=True;
    current_timber_outlines_menu_entry.Checked:=True;

  end;//with

  current_shove_str:='';
  shovetimbx:=0;
  shovetimbx_zero:=0;
  shove_buttons(False,0,-1);

  show_and_redraw(True,False);   // in case hidden (when idle, no rollback).
end;
//_______________________________________________________________________________________

procedure Tshove_timber_form.omit_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))       // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=-1;    // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_x:=0;        // xtb modifier.
              sv_k:=0;        // angle modifier.
              sv_o:=0;        // offset modifier (near end).
              sv_l:=0;        // length modifier (far end).
              sv_w:=0;        // width modifier (per side).
              sv_c:=0;        // crab modifier.

              sv_use_tcol:=False;      // 226a  no modified colours
              sv_use_ocol:=False;      // 226a

              sv_bgnd:=False;          // 226a   also use tcol for bgnd templates on pad
              sv_export:=False;        // 226a   also use ocol for exported images

              sv_option_bits:=0;

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;

            shove_buttons(True,-1,n);
            cancel_adjusts(False);        // can't continue to adjust it.
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.tn_snibs_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              snibs_data.omit_tsn_snibs:= NOT tn_snibs_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.mn_snibs_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              snibs_data.omit_msn_snibs:= NOT mn_snibs_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.tf_snibs_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              snibs_data.omit_tsf_snibs:= NOT tf_snibs_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.mf_snibs_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              snibs_data.omit_msf_snibs:= NOT mf_snibs_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.snib_link_near_checkboxClick(Sender: TObject);   //244a

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              snibs_data.add_near_link:=snib_link_near_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.snib_link_far_checkboxClick(Sender: TObject);   //244a

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              snibs_data.add_far_link:=snib_link_far_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.tf_web_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              webs_data.omit_tsf_web:= NOT tf_web_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.tn_web_checkboxClick(Sender: TObject);

var
    n:integer;

  begin
    if setting_shove_checkboxes=True then EXIT;

    n:=find_shove(current_shove_str,True);
    if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
       then begin
              with current_shoved_timbers[n] do begin

                shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

                webs_data.omit_tsn_web:= NOT tn_web_checkbox.Checked;
              end;//with

              current_shoved_timbers[n].sv_str:=current_shove_str;
              shove_buttons(True,0,n);
              show_and_redraw(True,True);
            end;
  end;
//______________________________________________________________________________

procedure Tshove_timber_form.mn_web_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              webs_data.omit_msn_web:= NOT mn_web_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.mf_web_checkboxClick(Sender: TObject);

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              webs_data.omit_msf_web:= NOT mf_web_checkbox.Checked;
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.near_flange_checkboxClick(Sender: TObject);     // 229b

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

              if near_flange_checkbox.Checked=True then sv_option_bits:=(sv_option_bits AND $FE)   // bit off, normal
                                                   else sv_option_bits:=(sv_option_bits OR $01);   // bit on, flange omitted
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.far_flange_checkboxClick(Sender: TObject);    // 229b

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

              if far_flange_checkbox.Checked=True then sv_option_bits:=(sv_option_bits AND $FD)   // bit off, normal
                                                  else sv_option_bits:=(sv_option_bits OR $02);   // bit on, flange omitted
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.ms_flange_checkboxClick(Sender: TObject);     // 229b

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

              if ms_flange_checkbox.Checked=True then sv_option_bits:=(sv_option_bits AND $FB)   // bit off, normal
                                                 else sv_option_bits:=(sv_option_bits OR $04);   // bit on, flange omitted
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.ts_flange_checkboxClick(Sender: TObject);     // 229b

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

              if ts_flange_checkbox.Checked=True then sv_option_bits:=(sv_option_bits AND $F7)   // bit off, normal
                                                 else sv_option_bits:=(sv_option_bits OR $08);   // bit on, flange omitted
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.spare_checkboxClick(Sender: TObject);      // 229b

var
  n:integer;

begin
  if setting_shove_checkboxes=True then EXIT;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

              if spare_checkbox.Checked=True then sv_option_bits:=(sv_option_bits OR $10)     // bit on, checked
                                             else sv_option_bits:=(sv_option_bits AND $EF);   // bit off, unchecked
            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.widen_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_w:=sv_w+inscale;   // widen each side of timber by 1 inch (timber now 2 inches wider).

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//_________________________________________________________________________________________

procedure Tshove_timber_form.narrow_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_w:=sv_w-inscale;   // narrow each side of timber by 1 inch (timber now 2 inches narrower).

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//___________________________________________________________________________________________

procedure Tshove_timber_form.lengthen_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                         // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_l:=sv_l+scale/2;                 // lengthen timber by 6 inches.

              if GetKeyState(VK_SHIFT)<0          // shift key down = msb set...
                 then begin
                        sv_o:=sv_o-scale/2        // shove back by same amount to lengthen main side.
                      end;

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.shorten_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                         // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_l:=sv_l-scale/2;                 // shorten timber by 6 inches.

              if GetKeyState(VK_SHIFT)<0          // shift key down = msb set...
                 then begin
                        sv_o:=sv_o+scale/2        // shove over by same amount to shorten main side.
                      end;

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.twist_cw_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))  // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                 // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_k:=sv_k-Pi/180*hand_i;   // clockwise 1 degree.

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//________________________________________________________________________________________

procedure Tshove_timber_form.twist_acw_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                 // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_k:=sv_k+Pi/180*hand_i;   // anti-clockwise 1 degree.

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//___________________________________________________________________________________________

procedure Tshove_timber_form.backward_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                 // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_x:=sv_x-inscale;         // back 1" scale.

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________________

procedure Tshove_timber_form.forward_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))  // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                 // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_x:=sv_x+inscale;         // forward 1" scale.

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//____________________________________________________________________________________

procedure Tshove_timber_form.crab_left_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))  // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                 // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_c:=sv_c-inscale;         // crab back 1" scale.

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//_____________________________________________________________________________________

procedure Tshove_timber_form.crab_right_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))       // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;                 // 0=empty slot, -1=omit this timber,  1=shove this timber.
              sv_c:=sv_c+inscale;         // crab forward 1" scale.

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________________

procedure Tshove_timber_form.restore_buttonClick(Sender: TObject);

var
  i,n,r,w,o:integer;

begin
  cancel_adjusts(False);

  repeat
    n:=find_shove(current_shove_str,False);             // don't create it if not present.
    if (n>=0) and (n<Length(current_shoved_timbers))    // valid slot.
       then begin
              with current_shoved_timbers[n].shove_data do begin

                        // !!! no need to do this if we are about to free it, but just for elegance...

                sv_code:=0;     // 0=empty slot, -1=omit this timber,  1=shove this timber.
                sv_x:=0;        // xtb modifier.
                sv_k:=0;        // angle modifier.
                sv_o:=0;        // offset modifier (near end).
                sv_l:=0;        // length modifier (far end).
                sv_w:=0;        // width modifier (per side).
                sv_c:=0;        // crab modifier.

                sv_use_tcol:=False;      // 226a  no modified colours
                sv_use_ocol:=False;      // 226a

                sv_bgnd:=False;          // 226a   also use tcol for bgnd templates on pad
                sv_export:=False;        // 226a   also use ocol for exported images

                sv_option_bits:=0;

              end;//with

              with current_shoved_timbers[n] do begin

                for r:=1 to 4 do begin    // rails

                  with heave_rail_chairs[r] do begin

                      hv_omit:=False;           // chair on rail
                      hv_ch:=0;                 // modified chair code

                      hv_sc_outlong:=0;         // custom SC chair dims ..
                      hv_sc_inlong:=0;
                      hv_sc_halfwide:=0;

                      hv_flip:=False;           // key flipped
                      hv_omit_key:=False;       // key omitted    // 556 MW

                      hv_jaws:=False;           // jaws customized
                      hv_plug:=0;               // plug customized   0=no change, 1=force clip-fit  2=force snap-fit  3=force press-fit

                      for w:=0 to HIGH(hv_jaw_options) do begin       // 0..3    4 rails in customized chair
                        for i:=0 to HIGH(hv_jaw_options[w]) do begin  // 0..5    6 options per jaw  Tjaw_option

                          hv_jaw_options[w][i]:=False;
                        end;
                      end;

                  end;//with

                end;//next


              end;//with

              with current_shoved_timbers[n].snibs_data do begin

                omit_tsn_snibs:=False;
                omit_tsf_snibs:=False;
                omit_msn_snibs:=False;
                omit_msf_snibs:=False;

                add_near_link:=False;
                add_far_link:=False;

              end;//with

              with current_shoved_timbers[n].webs_data do begin    // 555a

                omit_tsn_web:=False;
                omit_tsf_web:=False;
                omit_msn_web:=False;
                omit_msf_web:=False;

              end;//with

              shove_delete(n,current_shoved_timbers);
            end;
  until n<0;        // might be in more than one slot, so don't BREAK.

  tn_snibs_checkbox.Checked:=True;
  tf_snibs_checkbox.Checked:=True;
  mn_snibs_checkbox.Checked:=True;
  mf_snibs_checkbox.Checked:=True;

  snib_link_near_checkbox.Checked:=False;
  snib_link_far_checkbox.Checked:=False;

  ts_flange_checkbox.Checked:=True;
  ms_flange_checkbox.Checked:=True;
  near_flange_checkbox.Checked:=True;
  far_flange_checkbox.Checked:=True;

  heave_form_reset_all(True);     // True = no timber selected

  shove_buttons(True,1,-1);
  show_and_redraw(True,True);
end;
//______________________________________________________________________________

procedure Tshove_timber_form.restore_all_buttonClick(Sender: TObject);

begin
  if alert(7,'    restore  all  timbers',
             'You are about to restore any shoved or omitted timbers on this template to their normal size, position and 3-D chairing.'
            +'||This will delete all existing shove-timber data and chair-heaving data for this template.'
            +'||Any bonus timbers which have been added and shoved will be restored to their normal size and starting position, but will remain on the template.'
            +' To remove bonus timbers from the template, click the REAL > TIMBERING > BONUS TIMBERS > REMOVE menu items.',
             '','','','','cancel  restore   -   no  changes','O K',0)=5 then EXIT;
  Show;
  BringToFront;
  cancel_adjusts(False);

  clear_shovedata;

  shove_buttons(True,0,-1);
  show_and_redraw(True,True);
end;
//______________________________________________________________________________

procedure Tshove_timber_form.mouse_along_buttonClick(Sender: TObject);

begin
  shove_along_mouse_action;
end;
//____________________________________________________________________________________

procedure Tshove_timber_form.mouse_throw_buttonClick(Sender: TObject);

begin
  shove_throw_mouse_action;
end;
//______________________________________________________________________________________

procedure Tshove_timber_form.mouse_crab_buttonClick(Sender: TObject);

begin
  shove_crab_mouse_action;
end;
//_____________________________________________________________________________________

procedure Tshove_timber_form.mouse_length_buttonClick(Sender: TObject);

begin
  shove_length_mouse_action;
end;
//______________________________________________________________________________________

procedure Tshove_timber_form.mouse_width_buttonClick(Sender: TObject);

begin
  shove_width_mouse_action; 
end;
//______________________________________________________________________________________

procedure Tshove_timber_form.mouse_twist_buttonClick(Sender: TObject);

begin
  shove_twist_mouse_action;
end;
//______________________________________________________________________________________

procedure Tshove_timber_form.how_panelClick(Sender: TObject);

begin
  help(0,shovetimb_help_str,'');
end;

//__________________________________________________________________________________________

procedure Tshove_timber_form.drop_buttonClick(Sender: TObject);

                   // he wants to enter the timber number...
begin
  cancel_adjusts(False);
  enter_timber_form.Show;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  heave_chairs_form.Close;     // 242a

  delete_null_shove_entries;   // tidy the list.

  current_shove_str:='';       // 242a

  enter_timber_form.Close;

  if Showing=True    // (might be called when not showing) first restore pad settings we found onShow.
     then begin

            with pad_form do begin

              if saved_timber_centres_flag=False then current_timber_centres_menu_entry.Checked:=False;
              if saved_timber_numbers_flag=False then current_timber_numbers_menu_entry.Checked:=False;
              if saved_timber_outlines_flag=False then current_timber_outlines_menu_entry.Checked:=False;

              if (saved_gen_infill=False) and (timbering_infill=True) then timbering_infill_menu_entry.Click;  // generator setting restored.

              case saved_timb_infill_style of
                    0: no_timbering_infill_menu_entry.Click;
                    1: hatched_timbering_infill_menu_entry.Click;
                    2: crosshatched_timbering_infill_menu_entry.Click;
                    3: solid_timbering_infill_menu_entry.Click;
                    4: blank_timbering_infill_menu_entry.Click;
              end;//case

            end;//with

            cancel_adjusts(False);
            show_and_redraw(True,False);
          end;
end;
//________________________________________________________________________________________

procedure Tshove_timber_form.data_buttonClick(Sender: TObject);

const
  mod_str:string='||Enter a dimension by which the normal size and position of this timber should be modified.'
  +'||To return this timber to its normal size and position, enter 0 (zero).'
  +'||Handy hints:'
  +'||It is usually much easier to position a timber by using the buttons and mouse actions, instead of direct entry of data here.'
  +'||These dimensions are relative to the normal size and position of the timber, not the present size and position if it has been shoved previously.'
  +'||Instead of these relative dimensions, you can enter the actual timber centre dimension, timber length, width or twist angle, by clicking the relevant read-out panel.';

var
  n,i:integer;
  od:Toutdim;
  help_str:string;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            help_str:='    Data for Shoving Timber '+current_shove_str+mod_str;

            current_shoved_timbers[n].sv_str:=current_shove_str;

            with current_shoved_timbers[n].shove_data do begin

              putdim(help_str,1,                     'shove  timber  along  by',sv_x,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              putdim(help_str,3,                            'twist  timber  by',sv_k*180/Pi*hand_i,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              putdim(help_str,1,                   'crab  timber  sideways  by',sv_c,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              putdim(help_str,1,                   'throw  timber  endways  by',sv_o,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              putdim(help_str,1,      'lengthen / shorten  timber  by  ( +/- )',sv_l,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
           i:=putdim(help_str,1,'widen / narrow  timber  by  ( +/- per  side )',sv_w,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.

              if i<>5 then EXIT;
              if getdims('shoving  timber  '+current_shove_str,'',pad_form,i,od)=True
                 then begin
                        sv_x:=od[0];
                        sv_k:=od[1]*Pi/180*hand_i;
                        sv_c:=od[2];
                        sv_o:=od[3];
                        sv_l:=od[4];
                        sv_w:=od[5];

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.normal_radioClick(Sender: TObject);

begin
  shove_mouse_factor:=2.0;    // arbitrary.
end;
//__________________________

procedure Tshove_timber_form.fine_radioClick(Sender: TObject);

begin
  shove_mouse_factor:=6.0;    // arbitrary.
end;
//___________________________

procedure Tshove_timber_form.extra_fine_radioClick(Sender: TObject);

begin
  shove_mouse_factor:=20.0;   // arbitrary.
end;
//_________________________________________________________________________________________

procedure Tshove_timber_form.show_all_blue_checkboxClick(Sender: TObject);

begin
  show_and_redraw(True,False);
end;
//____________________________________________________________________________________________

procedure Tshove_timber_form.mm_radio_buttonClick(Sender: TObject);

begin
  show_shove_fs:=False;
  show_and_redraw(True,False);
end;
//_________________________________

procedure Tshove_timber_form.inches_radio_buttonClick(Sender: TObject);

begin
  show_shove_fs:=True;
  show_and_redraw(True,False);
end;
//____________________________________________________________________________________________

procedure Tshove_timber_form.twist_origin_buttonClick(Sender: TObject);

begin
  show_origin_k:= NOT show_origin_k;
  if show_origin_k=True
     then begin
            twist_origin_button.Caption:='¬';
            twist_origin_button.Hint:=' show  or  set  twist  angle  from  square-on ';
          end
     else begin
            twist_origin_button.Caption:='÷';
            twist_origin_button.Hint:=' show  or  set  twist  angle  from  template  datum ';
          end;

  show_and_redraw(True,False);
end;
//____________________________________________________________________________________________

procedure Tshove_timber_form.zero_buttonClick(Sender: TObject);

begin
  shovetimbx_zero:=shovetimbx;     // set zero datum for centre read-out on timber.
  show_and_redraw(True,False);
end;
//___________________________________________________________________________________________

procedure Tshove_timber_form.reset_buttonClick(Sender: TObject);

begin
  if shovetimbx_zero=0    // already on datum?
     then begin                                   // yes, toggle to rail-joint.
            if plain_track=False
               then shovetimbx_zero:=xorg                                               // Ctrl-1 for a turnout.
               else shovetimbx_zero:=turnoutx-tb_roll_percent*railen[pt_i]*inscale/100; // rolled rail joint for plain track.
          end
     else shovetimbx_zero:=0;     // reset on Ctrl-0 datum for centre read-out.
  show_and_redraw(True,False);
end;
//___________________________________________________________________________________________

procedure Tshove_timber_form.xtb_panelClick(Sender: TObject);

begin
  shove_xtb_panel_click;
end;
//_________________________________

procedure shove_xtb_panel_click;

const
  mod_str:string='||Enter a new centre dimension for this timber.'
  +'||If you have previously clicked the ZERO button to set a zero datum for the timber centres, this dimension will be from that datum position.'
  +'||If you have not previously set a zero datum for the timber centres, or you have previously clicked the RESET ZERO button, this dimension will be from the CTRL-0 template datum.'
  +'||Handy hints:'
  +'||You can change between using model sizes (in mm) and full-size prototype dimensions (in inches) by clicking the MODEL MM or FULL-SIZE INCHES option buttons.'
  +'||To enter shove data relative to the normal position of this timber, cancel this and click the DATA... button instead.'
  +'||It is usually much easier to position a timber by using the buttons and mouse actions, instead of direct entry of data here.';

var
  n,i:integer;
  od:Toutdim;
  fs_convert:extended;
  fs_str:string;
  fs_code:integer;

begin
  if show_shove_fs=True
     then begin
            fs_convert:=inscale;
            fs_str:='  ( full  size  inches )  ';
            fs_code:=2;
          end
     else begin
            fs_convert:=1;
            fs_str:='  ( model  mm )  ';
            fs_code:=1;
          end;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))                               // valid slot.
     then begin
            current_shoved_timbers[n].sv_str:=current_shove_str;
            with current_shoved_timbers[n].shove_data do begin

              i:=putdim('    Set Centre of Timber '+current_shove_str+mod_str,fs_code,'timber  '+current_shove_str+'  centre'+fs_str,(shovetimbx-shovetimbx_zero)/fs_convert,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              if i<>0 then EXIT;

              if getdims('timber  '+current_shove_str+'  centre  dimension','',pad_form,i,od)=True
                 then begin
                        sv_x:=sv_x+(od[0]*fs_convert-shovetimbx+shovetimbx_zero);    // modify shove data.

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.length_panelClick(Sender: TObject);

begin
  shove_length_panel_click;
end;
//_________________________________

procedure shove_length_panel_click;

const
  mod_str:string='||Enter a new length for this timber.'
  +'||Handy hints:'
  +'||You can change between using model sizes (in mm) and full-size prototype dimensions (in inches) by clicking the MODEL MM or FULL-SIZE INCHES option buttons.'
  +'||To enter shove data relative to the normal length of this timber, cancel this and click the DATA... button instead.'
  +'||It is usually much easier to lengthen or shorten a timber by using the buttons and mouse actions, instead of direct entry of data here.';

var
  n,i:integer;
  od:Toutdim;
  fs_convert:extended;
  fs_str:string;
  fs_code:integer;

begin
  if show_shove_fs=True
     then begin
            fs_convert:=inscale;
            fs_str:='  ( full  size  inches )  ';
            fs_code:=2;
          end
     else begin
            fs_convert:=1;
            fs_str:='  ( model  mm )  ';
            fs_code:=1;
          end;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            current_shoved_timbers[n].sv_str:=current_shove_str;
            with current_shoved_timbers[n].shove_data do begin

              i:=putdim('    Set Length of Timber '+current_shove_str+mod_str,fs_code,'timber  '+current_shove_str+'  length'+fs_str,shovetimb_len/fs_convert,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              if i<>0 then EXIT;

              if getdims('timber  '+current_shove_str+'  length','',pad_form,i,od)=True
                 then begin
                        sv_l:=sv_l+(od[0]*fs_convert-shovetimb_len);    // modify shove data.

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//________________________________________________________________________________________

procedure Tshove_timber_form.crab_panelClick(Sender: TObject);

begin
  shove_crab_panel_click;
end;
//_________________________________

procedure shove_crab_panel_click;

const
  mod_str:string='||Enter a dimension for the amount by which this timber is to be shoved sideways after any twisting.'
  +'||N.B If this timber has not been twisted, i.e. it is SQUARE-ON to the main road, the effect of a crab sideways shove will be visually the same as shoving its centre ALONG.'
  +' However, any crab sideways shove will not be reflected in the CENTRE read-out for this timber, nor in setting a ZERO datum on it.'
  +' To avoid confusion, it is recommended that crab shoves should only be applied to timbers which have been twisted or are EQUALIZED.'
  +' To shove SQUARE-ON timbers sideways, instead use the ALONG mouse action or the FORWARD and BACKWARD buttons, or click the CENTRE read-out.'
  +'||Handy hints:'
  +'||You can change between using model sizes (in mm) and full-size prototype dimensions (in inches) by clicking the MODEL MM or FULL-SIZE INCHES option buttons.'
  +'||It is usually much easier to shove a timber by using the buttons and mouse actions, instead of direct entry of data here.';

var
  n,i:integer;
  od:Toutdim;
  fs_convert:extended;
  fs_str:string;
  fs_code:integer;

begin
  if show_shove_fs=True
     then begin
            fs_convert:=inscale;
            fs_str:=' ( full  size  inches ) ';
            fs_code:=2;
          end
     else begin
            fs_convert:=1;
            fs_str:=' ( model  mm ) ';
            fs_code:=1;
          end;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            current_shoved_timbers[n].sv_str:=current_shove_str;
            with current_shoved_timbers[n].shove_data do begin

              i:=putdim('    Set Crab Sideways Shove for Timber '+current_shove_str+mod_str,fs_code,'timber '+current_shove_str+' crab sideways shove'+fs_str,shovetimb_crab/fs_convert,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              if i<>0 then EXIT;

              if getdims('timber  '+current_shove_str+'  crab  sideways  shove','',pad_form,i,od)=True
                 then begin
                        sv_c:=sv_c+(od[0]*fs_convert-shovetimb_crab);    // modify shove data.

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//_________________________________________________________________________________________

procedure Tshove_timber_form.width_panelClick(Sender: TObject);

begin
  shove_width_panel_click;
end;
//_________________________________

procedure shove_width_panel_click;

const
  mod_str:string='||Enter a new width for this timber.'
  +'||Handy hints:'
  +'||You can change between using model sizes (in mm) and full-size prototype dimensions (in inches) by clicking the MODEL MM or FULL-SIZE INCHES option buttons.'
  +'||To enter shove data relative to the normal width of this timber, cancel this and click the DATA... button instead.'
  +'||It is usually much easier to widen or narrow a timber by using the buttons and mouse actions, instead of direct entry of data here.';

var
  n,i:integer;
  od:Toutdim;
  fs_convert:extended;
  fs_str:string;
  fs_code:integer;

begin
  if show_shove_fs=True
     then begin
            fs_convert:=inscale;
            fs_str:='  ( full  size  inches )  ';
            fs_code:=2;
          end
     else begin
            fs_convert:=1;
            fs_str:='  ( model  mm )  ';
            fs_code:=1;
          end;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))            // valid slot.
     then begin
            current_shoved_timbers[n].sv_str:=current_shove_str;
            with current_shoved_timbers[n].shove_data do begin

              i:=putdim('    Set Width of Timber '+current_shove_str+mod_str,fs_code,'timber  '+current_shove_str+'  width'+fs_str,shovetimb_wide/fs_convert,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              if i<>0 then EXIT;

              if getdims('timber  '+current_shove_str+'  width','',pad_form,i,od)=True
                 then begin
                        sv_w:=sv_w+(od[0]*fs_convert-shovetimb_wide)/2;    // modify shove data (/2 because sv_w is per side).

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//_________________________________________________________________________________________

procedure Tshove_timber_form.twist_panelClick(Sender: TObject);

begin
  shove_twist_panel_click;
end;
//_________________________________

procedure shove_twist_panel_click;

const
  mod_str1:string='||Enter a new twist angle in degrees for this timber.'

  +'||There are two options for the way the twist angle is shown and set. If the dimension is shown suffixed by a ''¬'' symbol, the angle is measured from the normal square-on position across the rails.'
  +' If the dimension is shown suffixed by a ''÷'' symbol, the angle is measured from the CTRL-0 template datum. For a straight template there is no difference between these two options.'
  +' For a curved template, these options can be toggled by clicking the ¬ / ÷ button.';

  mod_str_sq:string='This means that:'
  +'||Positive angles rotate the timber anti-clockwise from a square-on position across the rails.'
  +'||Negative angles rotate the timber clockwise from a square-on position across the rails.'
  +'||Entering a zero twist angle will set the timber square to the rails (turnout main road).';

  mod_str_0:string='This means that:'
  +'||Positive angles rotate the timber anti-clockwise from the template datum.'
  +'||Negative angles rotate the timber clockwise from the template datum.'
  +'||Entering a zero twist angle will set the timber square to the track centre-line at the template datum (CTRL-0 peg position).';

  mod_str2:string='||Handy hints:'
  +'|To enter the twist angle as a unit angle instead of degrees, prefix it with a letter n. For example, entering "n8" will set a twist angle of 1:8, "n-20" will set a twist angle of [-1:20].'
  +'||To enter shove data relative to the normal twist angle for this timber, cancel this and click the DATA... button instead.'
  +'||It is usually much easier to rotate a timber by using the buttons and mouse action, instead of direct entry of data here.';

var
  n,i:integer;
  od:Toutdim;
  opt_str:string;
  code_str:string;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))         // valid slot.
     then begin
            if show_origin_k=True
               then begin
                      opt_str:='||The current option setting is "÷ from template datum". '+mod_str_0;
                      code_str:='( from  datum  ÷ )';
                    end
               else begin
                      opt_str:='||The current option setting is "¬ from square-on". '+mod_str_sq;
                      code_str:='( from  square  ¬ )';
                    end;

            current_shoved_timbers[n].sv_str:=current_shove_str;
            with current_shoved_timbers[n].shove_data do begin

              i:=putdim('    Set Twist Angle for Timber '+current_shove_str+mod_str1+opt_str+mod_str2,3,'timber  '+current_shove_str+'  twist  angle  '+code_str,shovetimb_keq*180/Pi,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate.
              if i<>0 then EXIT;

              if getdims('timber  '+current_shove_str+'  twist  angle','',pad_form,i,od)=True
                 then begin
                        sv_k:=sv_k+(od[0]*Pi/180-shovetimb_keq)*hand_i;    // modify shove data.

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//__________________________________________________________________________________________

procedure Tshove_timber_form.throw_panelClick(Sender: TObject);

begin
  shove_throw_panel_click;
end;
//_________________________________

procedure shove_throw_panel_click;

const
  mod_str:string='||Enter a dimension for the amount by which this timber is to be thrown endways after any twisting.'
  +'||N.B If this timber has been twisted to lie parallel to the rails, i.e. twisted 90 degress from SQUARE-ON, the effect of a endwways throw will be visually the same as shoving its centre ALONG.'
  +' However, any endways throw will not be reflected in the CENTRE read-out for this timber, nor in setting a ZERO datum on it.'
  +' To avoid confusion, it is recommended that end throws should not be applied to timbers which have been so twisted.'
  +' To shove such timbers endways, instead use the ALONG mouse action or the FORWARD and BACKWARD buttons, or click the CENTRE read-out.'
  +'||Handy hints:'
  +'||You can change between using model sizes (in mm) and full-size prototype dimensions (in inches) by clicking the MODEL MM or FULL-SIZE INCHES option buttons.'
  +'||It may be easier to throw a timber endways by lengthening it at one end and then shortening it at the other using the buttons (hold down the SHIFT key to modify the numbered end), or by using the THROW mouse action,'
  +' instead of direct entry of data here.';

var
  n,i:integer;
  od:Toutdim;
  fs_convert:extended;
  fs_str:string;
  fs_code:integer;

begin
  if show_shove_fs=True
     then begin
            fs_convert:=inscale;
            fs_str:=' ( full  size  inches ) ';
            fs_code:=2;
          end
     else begin
            fs_convert:=1;
            fs_str:=' ( model  mm ) ';
            fs_code:=1;
          end;

  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))        // valid slot.
     then begin
            current_shoved_timbers[n].sv_str:=current_shove_str;
            with current_shoved_timbers[n].shove_data do begin

              i:=putdim('    Set Endways Throw for Timber '+current_shove_str+mod_str,fs_code,'timber '+current_shove_str+' endways  throw'+fs_str,shovetimb_throw/fs_convert,False,True,False,False); // neg ok, no preset, 0 ok, don't terminate on zero.
              if i<>0 then EXIT;

              if getdims('timber  '+current_shove_str+'  endways  throw','',pad_form,i,od)=True
                 then begin
                        sv_o:=sv_o+(od[0]*fs_convert-shovetimb_throw);    // modify shove data.

                        sv_code:=1;                 // might previously have been be omitted.
                        shove_buttons(True,1,n);
                        show_and_redraw(True,True);
                      end;
            end;//with
          end;
end;
//____________________________________________________________________________________________

procedure Tshove_timber_form.add_bonus_buttonClick(Sender: TObject);

var
  n:integer;

begin
  cancel_adjusts(False);
  pad_form.add_bonus_timber_menu_entry.Click;
  show_and_redraw(False,True);                 // force a redraw to create the added timber.

  if bontimb<1 then EXIT;     // ???

  current_shove_str:='B'+IntToStr(bontimb);

  n:=find_shove(current_shove_str,True);              // find it or create an empty slot.
  if (n>=0) and (n<Length(current_shoved_timbers))    // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin
              if sv_code=0              // new slot.
                 then begin
                        sv_code:=1;                                           // flag to shove this timber.
                        current_shoved_timbers[n].sv_str:=current_shove_str;  // and add it to list.
                      end;
              shove_buttons(True,sv_code,n);
            end;//with
          end;
  show_and_redraw(True,False);
end;
//________________________________________________________________________________________

procedure Tshove_timber_form.FormResize(Sender: TObject);

begin
  if (Showing=True) and (initdone_flag=True) and (window_scaling=False) then ScrollInView(hide_panel);
end;
//______________________________________________________________________________

procedure Tshove_timber_form.hide_outline_buttonClick(Sender: TObject);      // 232a

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].shove_data do begin

              sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

              sv_option_bits:=(sv_option_bits XOR $80);  // msb on   outline hidden / toggled

            end;//with

            current_shoved_timbers[n].sv_str:=current_shove_str;
            shove_buttons(True,0,n);
            show_and_redraw(True,True);
          end;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.hide_all_buttonClick(Sender: TObject);   // 235a

var
  i,n:integer;

  code:integer;
  ptr_1st:^Tmark;         // pointer to a Tmark record..
  markmax:integer;
  num_str,tbnum_str:string;

begin
  if marks_list_ptr=nil then EXIT;        // pointer to marks list not valid.

  markmax:=intarray_max(marks_list_ptr);  // max index for the present list.

  if mark_index>markmax then mark_index:=markmax;  // ??? shouldn't be.

  tbnum_str:=timb_numbers_str;      // the full string of timber numbering for the control template.

  n:=0;                        // keep compiler happy.
  num_str:=current_shove_str;  // keep compiler happy.

  for i:=0 to (mark_index-1) do begin     // (mark_index is always the next free slot)
    try
      ptr_1st:=Pointer(intarray_get(marks_list_ptr,i));  // pointer to the next Tmark record.
      if ptr_1st=nil then EXIT;

      code:=ptr_1st^.code;

      if code<>99 then CONTINUE;   // we are only looking for timber number entries.

      num_str:=timb_num_strip(extract_tbnumber_str(tbnum_str));   // get next timber numbering string from the acummulated string.

      if num_str='' then CONTINUE;

      n:=find_shove(num_str,True);                       // find it or create an empty slot.
      if (n>=0) and (n<Length(current_shoved_timbers))   // valid slot.
         then begin
                with current_shoved_timbers[n].shove_data do begin

                  sv_code:=1;           // 0=empty slot, -1=omit this timber,  1=shove this timber.

                  sv_option_bits:=(sv_option_bits OR $80);  // msb on   outline hidden

                end;//with

                current_shoved_timbers[n].sv_str:=num_str;  // and add it to list.
              end
         else CONTINUE;
    except
      CONTINUE;
    end;//try
  end;//next i

  current_shove_str:=num_str;   // last one hidden.
  shove_buttons(True,0,n);
  cancel_adjusts(False);        // can't continue to adjust it.
  show_and_redraw(True,True);
end;
//______________________________________________________________________________

procedure Tshove_timber_form.omit_all_buttonClick(Sender: TObject);

var
  i,n:integer;

  code:integer;
  ptr_1st:^Tmark;         // pointer to a Tmark record..
  markmax:integer;
  num_str,tbnum_str:string;

begin
  if marks_list_ptr=nil then EXIT;        // pointer to marks list not valid.

  if omit_all_msg_pref=False
     then begin

            alert_box.preferences_checkbox.Checked:=False;       //%%%%
            alert_box.preferences_checkbox.Show;

            i:=alert(7,'    omit  all  timbers',
               'You are about to omit all the timbers and/or sleepers on this template.'
              +'||This function is intended to be used when required before any other timber shoving is done. This function is used to omit many unwanted timbers before restoring the fewer individual timbers which are actually wanted.'
              +' To create a template without any timbers, cancel this and click instead the REAL > TIMBERING > NO TIMBERING menu item.'
              +'||Any previously shoved timbers will first be restored to their normal size and position, and then omitted.'
              +' If omitted timbers are subsequently restored, they will therefore reappear at their normal size and position.'
              +'||Any bonus timbers which have been added and shoved will also be first restored to their normal size and starting position.'
              +' To completely remove bonus timbers from the template, click the REAL > TIMBERING > BONUS TIMBERS > REMOVE menu items.',
                '','','','','cancel  omit','O K',0);


            omit_all_msg_pref:=alert_box.preferences_checkbox.Checked;    //%%%%
            alert_box.preferences_checkbox.Hide;

            if i=5 then EXIT;
          end;

  markmax:=intarray_max(marks_list_ptr);  // max index for the present list.

  if mark_index>markmax then mark_index:=markmax;  // ??? shouldn't be.

  tbnum_str:=timb_numbers_str;      // the full string of timber numbering for the control template.

  n:=0;                        // keep compiler happy.
  num_str:=current_shove_str;  // keep compiler happy.

  for i:=0 to (mark_index-1) do begin     // (mark_index is always the next free slot)
    try
      ptr_1st:=Pointer(intarray_get(marks_list_ptr,i));  // pointer to the next Tmark record.
      if ptr_1st=nil then EXIT;

      code:=ptr_1st^.code;

      if code<>99 then CONTINUE;   // we are only looking for timber number entries.

      num_str:=timb_num_strip(extract_tbnumber_str(tbnum_str));   // get next timber numbering string from the acummulated string.

      if num_str='' then CONTINUE;

      n:=find_shove(num_str,True);                       // find it or create an empty slot.
      if (n>=0) and (n<Length(current_shoved_timbers))   // valid slot.
         then begin
                with current_shoved_timbers[n].shove_data do begin

                  sv_code:=-1;    // 0=empty slot, -1=omit this timber,  1=shove this timber.
                  sv_x:=0;        // xtb modifier.
                  sv_k:=0;        // angle modifier.
                  sv_o:=0;        // offset modifier (near end).
                  sv_l:=0;        // length modifier (far end).
                  sv_w:=0;        // width modifier (per side).
                  sv_c:=0;        // crab modifier.

                  sv_use_tcol:=False;      // 226a  no modified colours
                  sv_use_ocol:=False;      // 226a

                  sv_bgnd:=False;          // 226a   also use tcol for bgnd templates on pad
                  sv_export:=False;        // 226a   also use ocol for exported images

                  sv_option_bits:=0;

                end;//with

                current_shoved_timbers[n].sv_str:=num_str;  // and add it to list.
              end
         else CONTINUE;
    except
      CONTINUE;
    end;//try
  end;//next i

  current_shove_str:=num_str;   // last one omitted.
  shove_buttons(True,-1,n);
  cancel_adjusts(False);        // can't continue to adjust it.
  show_and_redraw(True,True);
end;
//_________________________________________________________________________________________

procedure Tshove_timber_form.retain_shoves_on_mint_checkboxClick(Sender:TObject); // 0.94.a

begin
  retain_shoves_on_mint:=retain_shoves_on_mint_checkbox.Checked;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.retain_shoves_on_make_checkboxClick(Sender:TObject); // 0.94a

begin
  retain_shoves_on_make:=retain_shoves_on_make_checkbox.Checked;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.rolled_in_rails_only_radio_buttonClick(Sender: TObject);    // 223c

begin
  rolled_in_sleepered:=False;
  show_and_redraw(True,True);
end;
//______________________________________________________________________________

procedure Tshove_timber_form.rolled_in_sleepered_radio_buttonClick(Sender: TObject);    // 223c

begin
  rolled_in_sleepered:=True;
  show_and_redraw(True,True);
end;
//______________________________________________________________________________

procedure Tshove_timber_form.modify_timber_colour_speedbuttonClick(Sender:TObject);

  // 226a ...

var
  n:integer;

begin
  delete_null_shove_entries;    // first remove any unshoved entries.

  n:=find_shove(current_shove_str,True);                          // find or create slot
  if (n<0) or (n>(Length(current_shoved_timbers)-1))then EXIT;    // no valid slot

  shoved_colour_form.Caption:='      modify  infill  colour  on   timber  '+current_shove_str+' ...';
  shoved_colour_form.top_label.Caption:='show  timber  '+current_shove_str+'  in  these  colours :';

  with current_shoved_timbers[n].shove_data do begin
    with shoved_colour_form do begin

      shoved_trackpad_style_combo.ItemIndex:=sv_tcol_infill;   // trackpad infill code
      shoved_output_style_combo.ItemIndex:=sv_ocol_infill;     // output infill code

      shoved_trackpad_colour_panel.Color:=sv_tcol;  // trackpad colour
      shoved_output_colour_panel.Color:=sv_ocol;    // trackpad colour

      if (sv_option_bits AND $40)=0     // not been to this timber before    232c
         then begin
                use_on_trackpad_checkbox.Checked:=default_shoved_trackpad;    // 226b
                use_on_output_checkbox.Checked:=default_shoved_output;        // 226b
                also_bgnd_checkbox.Checked:=default_shoved_bgnd;              // 226b for bgnd templates on pad
                also_export_checkbox.Checked:=default_shoved_export;          // 226b for exported images
              end
         else begin
                use_on_trackpad_checkbox.Checked:=sv_use_tcol;   // as previous setting for this timber
                use_on_output_checkbox.Checked:=sv_use_ocol;
                also_bgnd_checkbox.Checked:=sv_bgnd;         // 226a also use tcol for bgnd templates on pad
                also_export_checkbox.Checked:=sv_export;     // 226a also use ocol for exported images
              end;

      if do_show_modal(shoved_colour_form)=mrOK  // get the data
         then begin
                sv_code:=1;    // 0=empty slot, -1=omit this timber,  1=shove this timber.

                if (shoved_trackpad_style_combo.ItemIndex>-1) and (shoved_trackpad_style_combo.ItemIndex<8)
                   then sv_tcol_infill:=shoved_trackpad_style_combo.ItemIndex   // trackpad infill code
                   else sv_tcol_infill:=0;                                      // ???

                if (shoved_output_style_combo.ItemIndex>-1) and (shoved_output_style_combo.ItemIndex<8)
                   then sv_ocol_infill:=shoved_output_style_combo.ItemIndex     // output infill code
                   else sv_ocol_infill:=0;                                      // ???

                sv_tcol:=shoved_trackpad_colour_panel.Color;  // trackpad colour
                sv_ocol:=shoved_output_colour_panel.Color;    // output colour

                sv_use_tcol:=use_on_trackpad_checkbox.Checked;
                sv_use_ocol:=use_on_output_checkbox.Checked;

                sv_bgnd:=also_bgnd_checkbox.Checked;          // 226a also use tcol for bgnd templates on pad
                sv_export:=also_export_checkbox.Checked;      // 226a also use ocol for exported images

                sv_option_bits:=(sv_option_bits OR $40);      // 232c  sv_col_has_been_set:=True;   // for next time here if any

                current_shoved_timbers[n].sv_str:=current_shove_str;
                shove_buttons(True,0,n);
                show_and_redraw(True,True);
              end;

    end;//with
  end;//with
end;
//______________________________________________________________________________

procedure Tshove_timber_form.tcol_shapeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);  // 226a

  // also ocol_shape

begin
  modify_timber_colour_speedbutton.Click;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.show_timber_details_buttonClick(Sender: TObject);   // 227a

begin
  pad_form.show_timber_totals_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tshove_timber_form.heave_chairs_buttonClick(Sender: TObject);

var
  n:integer;

begin
  if exp_chairing=False
     then begin
            show_modal_message('invalid: experimental chairing is not set for the control template');
            EXIT;
          end;

  if current_shove_str=''
     then begin
            show_modal_message('invalid: no timber has been selected - click on a timber number first');
            EXIT;
          end;

  //heave_chairs_form.Left:=shove_timber_form.Left+shove_timber_form.Width+60;      // 60 arbitrary
  //heave_chairs_form.Top:=shove_timber_form.Top;

  heave_chairs_form.Show;

  redraw(False);  // needed to update captions on visible form

  n:=find_shove(current_shove_str,False);
  if (n>=0) and (n<Length(current_shoved_timbers))       // valid slot.
     then begin
            if current_shoved_timbers[n].shove_data.sv_code=-1    // -1=omit this timber
               then heave_form_update(-1)
               else heave_form_update(1);
          end
     else heave_form_update(1);

end;
//______________________________________________________________________________

function any_heaving_shoves(index:integer):boolean;     // 244a  any 3D chair heaving or snibs or webs set?

var
  r:integer;

begin
  with current_shoved_timbers[index] do begin

    with snibs_data do begin

      RESULT:=False

      OR omit_tsn_snibs  // TS near
      OR omit_tsf_snibs  // TS far
      OR omit_msn_snibs  // MS near
      OR omit_msf_snibs  // MS far

      OR add_near_link
      OR add_far_link;

    end;// with

    with webs_data do begin      // 555a

      RESULT:=RESULT

      OR omit_tsn_web   // TS near
      OR omit_tsf_web   // TS far
      OR omit_msn_web   // MS near
      OR omit_msf_web;  // MS far

    end;// with

    for r:=1 to 4 do begin    // rails

      with heave_rail_chairs[r] do begin

        RESULT:=RESULT

        OR hv_omit           // chair on rail
        OR (hv_ch<>0)        // modified chair code
        OR hv_flip           // key flipped
        OR hv_omit_key       // key omitted        // 556 MW
        OR hv_jaws           // jaws customized
        OR (hv_plug<>0)      // plug customized   0=no change, 1=force clip-fit  2=force snap-fit  3=force press-fit

        OR (hv_sc_outlong<>0)    // SC dims modified..
        OR (hv_sc_inlong<>0)
        OR (hv_sc_halfwide<>0)

        ;

      end;//with

    end;//next

  end;//with

end;
//______________________________________________________________________________


end.

