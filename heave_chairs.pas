
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

   This file was derived from Templot2 version 244d

*)

unit heave_chairs;    // called from the shove-timbers

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, chair_frame_unit;

type

  { Theave_chairs_form }

  Theave_chairs_form = class(TForm)
   customized_label4: TLabel;
   customized_label3: TLabel;
   customized_label2: TLabel;
   customized_label1: TLabel;
   omitted_label4: TLabel;
   omitted_label3: TLabel;
   omitted_label2: TLabel;
   omitted_label1: TLabel;
   restore_button: TButton;
    chair_family3_label: TLabel;
    chair_family2_label: TLabel;
    chair_family1_label: TLabel;
    chair_radio3: TRadioButton;
    chair_radio2: TRadioButton;
    chair_radio1: TRadioButton;
    clip_radio: TRadioButton;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    omit_key4_checkbox: TCheckBox;
    export_checkbox1: TCheckBox;
    export_checkbox2: TCheckBox;
    frame_label: TLabel;
    include_checkbox0: TCheckBox;
    include_checkbox1: TCheckBox;
    include_checkbox2: TCheckBox;
    omit_key3_checkbox: TCheckBox;
    omit_key2_checkbox: TCheckBox;
    omit_key1_checkbox: TCheckBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    chair_family4_label: TLabel;
    chair_proto_label: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    loose_checkbox0: TCheckBox;
    chair_proto_combo: TComboBox;
    plug_panel: TPanel;
    press_radio: TRadioButton;
    cot_radio: TRadioButton;
    plug_unlocked_radio: TRadioButton;
    chair_radio4: TRadioButton;
    rail_numbers_image: TImage;
    Label1: TLabel;
    rail4_groupbox: TGroupBox;
    rail4_combo: TComboBox;
    flip_key4_checkbox: TCheckBox;
    Label3: TLabel;
    rail3_groupbox: TGroupBox;
    rail3_combo: TComboBox;
    flip_key3_checkbox: TCheckBox;
    rail2_groupbox: TGroupBox;
    rail2_combo: TComboBox;
    flip_key2_checkbox: TCheckBox;
    rail1_groupbox: TGroupBox;
    rail1_combo: TComboBox;
    flip_key1_checkbox: TCheckBox;
    rail_highlight_shape: TShape;
    snap_radio: TRadioButton;
    StaticText1: TStaticText;
    top_label: TLabel;
    omit4_checkbox: TCheckBox;
    omit3_checkbox: TCheckBox;
    omit2_checkbox: TCheckBox;
    omit1_checkbox: TCheckBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Label2: TLabel;
    Label4: TLabel;
    hide_panel: TPanel;
    hide_button: TButton;
    sc4_size_button: TButton;
    sc3_size_button: TButton;
    sc2_size_button: TButton;
    sc1_size_button: TButton;
    rail4_big_number_label: TLabel;
    rail3_big_number_label: TLabel;
    rail2_big_number_label: TLabel;
    rail1_big_number_label: TLabel;
    customize_panel: TPanel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    frame_main_rail: Tchair_frame;
    frame_2nd_rail: Tchair_frame;
    chair4_type_label: TLabel;
    chair3_type_label: TLabel;
    chair2_type_label: TLabel;
    chair1_type_label: TLabel;
    frame_3rd_rail: Tchair_frame;
    rail_label: TLabel;
    frame_4th_rail: Tchair_frame;
    change4_checkbox: TCheckBox;
    change3_checkbox: TCheckBox;
    change2_checkbox: TCheckBox;
    change1_checkbox: TCheckBox;
    normal_ch_label4: TLabel;
    normal_ch_label3: TLabel;
    normal_ch_label2: TLabel;
    normal_ch_label1: TLabel;
    Label12: TLabel;
    procedure chair_family_labelClick(Sender: TObject);
    procedure chair_radio1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chair_radio2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chair_radio3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chair_radio4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure hide_buttonClick(Sender: TObject);
    procedure omit_key1_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure omit_key2_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure omit_key3_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure omit_key4_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure rail1_comboChange(Sender: TObject);
    procedure rail2_comboChange(Sender: TObject);
    procedure rail3_comboChange(Sender: TObject);
    procedure rail4_comboChange(Sender: TObject);
    procedure restore_buttonClick(Sender: TObject);
    
    procedure sc4_size_buttonClick(Sender: TObject);
    procedure sc3_size_buttonClick(Sender: TObject);
    procedure sc2_size_buttonClick(Sender: TObject);
    procedure sc1_size_buttonClick(Sender: TObject);

    procedure omit4_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure omit3_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure omit2_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure omit1_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
    procedure change4_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure change3_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure change2_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure change1_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure plug_unlocked_radioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  heave_chairs_form: Theave_chairs_form;

  heave_selected_rail:integer=0;
  heave_selected_tb_str:string='';

  function get_chair_str(chair_code:integer):string;                  // 244a
  function get_cclr_chair_str(rail_code,chair_code:integer):string;   // 555a  // MW 04-08-2024

  procedure heave_form_reset_all(no_timber_selected:boolean);         // 244a
  procedure heave_form_update(omit_code:integer);

  procedure do_chair_selected(rail:integer);

  procedure heave_form_set_customized_jaws;     // MouseUp from chair_frame_unit

//______________________________________________________________________________

implementation

uses
  pad_unit, math_unit, shove_timber, entry_sheet, bgkeeps_unit;

{$R *.lfm}

var
  customizing_rail:integer=0;  // for rails 1..4

//______________________________________________________________________________

procedure Theave_chairs_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(heave_chairs_form);

  ClientWidth:=1120;
  ClientHeight:=674;

  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Theave_chairs_form.chair_family_labelClick(Sender: TObject);

begin
  chair_proto_combo.Visible:=True;
  chair_proto_label.Visible:=True;
end;
//______________________________________________________________________________

procedure do_chair_selected(rail:integer);

var
  n:integer;

begin
  if (rail<1) or (rail>4) then EXIT;     // ???

  heave_selected_rail:=rail;                  // 556b for selected chair label
  heave_selected_tb_str:=current_shove_str;

  heave_form_reset_all(False);   // init   reset all   False=timber number showing

  with heave_chairs_form do begin

    customize_panel.Enabled:=True;

    case rail of
      1: rail_highlight_shape.Top:=rail1_groupbox.Top+rail_highlight_shape.Left-rail1_groupbox.Left;  // default -8, allow for scaling..
      2: rail_highlight_shape.Top:=rail2_groupbox.Top+rail_highlight_shape.Left-rail2_groupbox.Left;
      3: rail_highlight_shape.Top:=rail3_groupbox.Top+rail_highlight_shape.Left-rail3_groupbox.Left;
      4: rail_highlight_shape.Top:=rail4_groupbox.Top+rail_highlight_shape.Left-rail4_groupbox.Left;
    end;//case

    rail_highlight_shape.Visible:=True;

    case rail of
      1: chair_radio1.Checked:=True;    // in case called from click on label..
      2: chair_radio2.Checked:=True;
      3: chair_radio3.Checked:=True;
      4: chair_radio4.Checked:=True;
    end;//case

    //rail1_groupbox.Enabled:=False;  // init..
    //rail2_groupbox.Enabled:=False;
    //rail3_groupbox.Enabled:=False;
    //rail4_groupbox.Enabled:=False;

    case rail of
      1: rail1_groupbox.Enabled:=True;
      2: rail2_groupbox.Enabled:=True;
      3: rail3_groupbox.Enabled:=True;
      4: rail4_groupbox.Enabled:=True;
    end;//case

    customizing_rail:=rail;

    rail_label.Caption:='on  timber  '+current_shove_str+'  rail  '+IntToStr(rail);

    n:=find_shove(current_shove_str,False);
    if (n>=0) and (n<Length(current_shoved_timbers))     // valid existing shoved slot
       then begin
              with current_shoved_timbers[n].heave_rail_chairs[rail] do begin

                if hv_jaws=True
                   then begin;

                           // jaw options...

                         frame_main_rail.include_checkbox0.Checked:=hv_jaw_options[0][0];     // include inner jaw
                         frame_main_rail.include_checkbox1.Checked:=hv_jaw_options[0][1];     // include outer jaw

                         frame_main_rail.loose_checkbox0.Checked:=hv_jaw_options[0][2];       // outer jaw is loose

                         frame_main_rail.export_checkbox1.Checked:=hv_jaw_options[0][3];      // export loose jaw only
                         frame_main_rail.export_checkbox2.Checked:=hv_jaw_options[0][4];      // export rail seat

                         frame_main_rail.include_checkbox2.Checked:=hv_jaw_options[0][5];     // include key on outer jaw


                         frame_2nd_rail.include_checkbox0.Checked:=hv_jaw_options[1][0];     // include inner jaw
                         frame_2nd_rail.include_checkbox1.Checked:=hv_jaw_options[1][1];     // include outer jaw

                         frame_2nd_rail.loose_checkbox0.Checked:=hv_jaw_options[1][2];       // outer jaw is loose

                         frame_2nd_rail.export_checkbox1.Checked:=hv_jaw_options[1][3];      // export loose jaw only
                         frame_2nd_rail.export_checkbox2.Checked:=hv_jaw_options[1][4];      // export rail seat

                         frame_2nd_rail.include_checkbox2.Checked:=hv_jaw_options[1][5];     // include key on outer jaw

                        end;

                  // plug options...

                case hv_plug of   // 0=no change, 1=force clip-fit  2=force snap-fit  3=force press-fit  4=force COT (no plug)

                  0: plug_unlocked_radio.Checked:=True;
                  1: clip_radio.Checked:=True;
                  2: snap_radio.Checked:=True;
                  3: press_radio.Checked:=True;
                  4: cot_radio.Checked:=True;

                end;//case

              end;//with

              rail_label.Caption:='on  timber  '+current_shove_str+'  rail  '+IntToStr(rail);
            end;

  end;//with form

  redraw(True);   // 556b to show changed selected chair label
end;
//______________________________________________________________________________

procedure Theave_chairs_form.chair_radio1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  do_chair_selected(1);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.chair_radio2MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  do_chair_selected(2);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.chair_radio3MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  do_chair_selected(3);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.chair_radio4MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  do_chair_selected(4);
end;
//______________________________________________________________________________

function get_chair_str(chair_code:integer):string;        // 243b

var
  chair_str:string;

begin
  chair_str:='';  // init

  case chair_code of

     -2: chair_str:=' ';    // space, was omitted chair
     -1: chair_str:='none';
      0: chair_str:='';     // invalid
      1: chair_str:='S1';
      2: chair_str:='P';
      3: chair_str:='L1CC';
      4: chair_str:='none';
      5: chair_str:='L1';
      6: chair_str:='M1';
      7: chair_str:='S1J';
      8: chair_str:='S1O';
      9: chair_str:='S1N';
      10: chair_str:='SC';
      11: chair_str:='1P..2P';
      12: chair_str:='3P..11P';
      13: chair_str:='none';
      14: chair_str:='CCL/R';
      15: chair_str:='CC';
      16: chair_str:='CCR/L';
      17: chair_str:='SS';
      18: chair_str:='MS';
      19: chair_str:='L1CCL/R';
      20: chair_str:='L1CCR/L';
      21: chair_str:='ZY';
      22: chair_str:='XN';
      23: chair_str:='XA';
      24: chair_str:='AA';
      25: chair_str:='AB';
      26: chair_str:='BB/BC';
      27: chair_str:='CD/DD';
      28: chair_str:='EF';
  29..39: chair_str:='none';
      40: chair_str:='SDP';
      41: chair_str:='SDS';
  42..49: chair_str:='none';
      50: chair_str:='PW';
      51: chair_str:='PWL';
      52: chair_str:='PWR';
  53..97: chair_str:='none';
      98: chair_str:='FG'; //dummy chair  rail foot groove
      99: chair_str:='RG'; //dummy chair  rail head groove

    else chair_str:='none';

  end;//case

  RESULT:=chair_str;
end;
//______________________________________________________________________________

function get_chair_code_from_combo(rail:integer):integer;

var
  n:integer;

begin
  RESULT:=0;  // init

  with heave_chairs_form do case rail of

                                   1: n:=rail1_combo.ItemIndex;
                                   2: n:=rail2_combo.ItemIndex;
                                   3: n:=rail3_combo.ItemIndex;
                                   4: n:=rail4_combo.ItemIndex;

                                 else n:=-1;

                            end;//case

  case n of     // chair codes ...

     -1: RESULT:=0;

      0: RESULT:=1;     // S1
      1: RESULT:=7;     // S1J
      2: RESULT:=5;     // L1
      3: RESULT:=6;     // M1
      4: RESULT:=14;    // CCL/R
      5: RESULT:=15;    // CC
      6: RESULT:=16;    // CCR/L
      7: RESULT:=8;     // S1O
      8: RESULT:=9;     // S1N
      9: RESULT:=19;    // L1CCL/R
     10: RESULT:=3;     // L1CC
     11: RESULT:=20;    // L1CCR/L
     12: RESULT:=50;    // PW
     13: RESULT:=51;    // PWL
     14: RESULT:=52;    // PWR
     15: RESULT:=17;    // SS
     16: RESULT:=18;    // MS
     17: RESULT:=2;     // P
     18: RESULT:=40;    // SDP
     19: RESULT:=41;    // SDS
     20: RESULT:=10;    // SC

    else RESULT:=0;

  end;//case

end;
//______________________________________________________________________________

function get_itemindex_for_combos(ch_code:integer):integer;

begin
  RESULT:=-1;

  case ch_code of

 // chair code,  ItemIndex ...

       0: RESULT:=-1;    // normal chair, no change

       1: RESULT:=0;     // S1
       7: RESULT:=1;     // S1J
       5: RESULT:=2;     // L1
       6: RESULT:=3;     // M1
      14: RESULT:=4;     // CCL/R
      15: RESULT:=5;     // CC
      16: RESULT:=6;     // CCR/L
       8: RESULT:=7;     // S1O
       9: RESULT:=8;     // S1N
      19: RESULT:=9;     // L1CCL/R
       3: RESULT:=10;    // L1CC
      20: RESULT:=11;    // L1CCR/L
      50: RESULT:=12;    // PW
      51: RESULT:=13;    // PWL
      52: RESULT:=14;    // PWR
      17: RESULT:=15;    // SS
      18: RESULT:=16;    // MS
       2: RESULT:=17;    // P
      40: RESULT:=18;    // SDP
      41: RESULT:=19;    // SDS
      10: RESULT:=20;    // SC

    else  RESULT:=-1;

  end;//case
end;
//______________________________________________________________________________

procedure Theave_chairs_form.hide_buttonClick(Sender: TObject);

begin
  Hide;
end;
//______________________________________________________________________________

procedure sc_size_button_click(r:integer);

var
  outlong,inlong,halfwide:extended;
  i:integer;

                  //////////////////////////////////////////////////////////////

                  procedure get_sc_size;    // 244a

                  const
                    str:string='Enter the full-size dimension in inches.||Enter zero to use the default SC dimension.||Please refer to the Templot Club user forum for more explanation.';

                  var
                    n:integer;
                    od:Toutdim;

                    r_str:string;

                  begin
                    r_str:=IntToStr(r);

                       putdim(str,2,'timber  '+current_shove_str+'  :  SC  chair  on  rail  '+r_str+'  -  outer  length',outlong,False,True,False,False);   // inches, negative ok, no preset, zero ok, don't terminate on zero.
                       putdim(str,2,'timber  '+current_shove_str+'  :  SC  chair  on  rail  '+r_str+'  -  inner  length',inlong, False,True,False,False);   // inches, negative ok, no preset, zero ok, don't terminate on zero.
                    n:=putdim(str,2,'timber  '+current_shove_str+'  :  SC  chair  on  rail  '+r_str+'  -  width',halfwide*2,     False,True,False,False);   // inches, negative ok, no preset, zero ok, don't terminate on zero.

                    if n<>2 then EXIT;

                    if getdims('timber  '+current_shove_str+'  :  SC  chair  on  rail  '+r_str+'  outline  dimensions ...','',heave_chairs_form,n,od)=True
                       then begin
                              outlong:=od[0];
                              inlong:=od[1];
                              halfwide:=od[2]/2;

                              if (outlong<>0) or (inlong<>0) or (halfwide<>0)
                                 then begin
                                        current_shoved_timbers[i].shove_data.sv_code:=1;      // 0=empty slot, -1=omit this timber,  1=shove this timber.
                                        current_shoved_timbers[i].sv_str:=current_shove_str;
                                      end;
                            end;
                  end;
                  //////////////////////////////////////////////////////////////

begin
  i:=find_shove(current_shove_str,True);               // new slot if necessary
  if (i>=0) and (i<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[i].heave_rail_chairs[r] do begin

              outlong:=hv_sc_outlong;        // custom SC chair dims
              inlong:=hv_sc_inlong;
              halfwide:=hv_sc_halfwide;

              get_sc_size;

              hv_sc_outlong:=outlong;        // custom SC chair dims
              hv_sc_inlong:=inlong;
              hv_sc_halfwide:=halfwide;

            end;//with

            current_shoved_timbers[i].shove_data.sv_code:=1;         // 0=empty slot, -1=omit this timber,  1=shove this timber.

            current_shoved_timbers[i].sv_str:=current_shove_str;

            shove_buttons(True,0,i);
            show_and_redraw(True,True);

          end;
end;
//______________________________________________________________________________

procedure Theave_chairs_form.sc4_size_buttonClick(Sender: TObject);

begin
  if rail4_combo.ItemIndex<>20 then begin show_modal_message('invalid: SC chair not selected'); EXIT; end;

  sc_size_button_click(4);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.sc3_size_buttonClick(Sender: TObject);

begin
  if rail3_combo.ItemIndex<>20 then begin show_modal_message('invalid: SC chair not selected'); EXIT; end;

  sc_size_button_click(3);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.sc2_size_buttonClick(Sender: TObject);

begin
  if rail2_combo.ItemIndex<>20 then begin show_modal_message('invalid: SC chair not selected'); EXIT; end;

  sc_size_button_click(2);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.sc1_size_buttonClick(Sender: TObject);

begin
  if rail1_combo.ItemIndex<>20 then begin show_modal_message('invalid: SC chair not selected'); EXIT; end;

  sc_size_button_click(1);
end;
//______________________________________________________________________________

procedure heave_form_reset_all(no_timber_selected:boolean);        // 244a

begin
  with heave_chairs_form do begin

    if no_timber_selected=True
       then begin
              Caption:='      heave  chairs  on  timber';
              top_label.Caption:='heave  chairs  on  timber';
            end;

    rail_label.Caption:='';

    chair_radio4.Checked:=False;
    chair_radio3.Checked:=False;
    chair_radio2.Checked:=False;
    chair_radio1.Checked:=False;

    rail_highlight_shape.Visible:=False;        // yellow bgnd

    omit4_checkbox.Checked:=False;
    omit3_checkbox.Checked:=False;
    omit2_checkbox.Checked:=False;
    omit1_checkbox.Checked:=False;

    flip_key4_checkbox.Checked:=False;
    flip_key3_checkbox.Checked:=False;
    flip_key2_checkbox.Checked:=False;
    flip_key1_checkbox.Checked:=False;

    change4_checkbox.Checked:=False;
    change3_checkbox.Checked:=False;
    change2_checkbox.Checked:=False;
    change1_checkbox.Checked:=False;

    rail4_combo.ItemIndex:=-1;
    rail3_combo.ItemIndex:=-1;
    rail2_combo.ItemIndex:=-1;
    rail1_combo.ItemIndex:=-1;

    rail4_groupbox.Color:=$00FFFCF0;
    rail3_groupbox.Color:=$00FFFCF0;
    rail2_groupbox.Color:=$00FFFCF0;
    rail1_groupbox.Color:=$00FFFCF0;

    rail4_groupbox.Visible:=True;
    rail3_groupbox.Visible:=True;
    rail2_groupbox.Visible:=True;
    rail1_groupbox.Visible:=True;

    //rail4_groupbox.Enabled:=False;
    //rail3_groupbox.Enabled:=False;
    //rail2_groupbox.Enabled:=False;
    //rail1_groupbox.Enabled:=False;


        // main running rail...

    frame_main_rail.include_checkbox0.Checked:=False;     // include inner jaw
    frame_main_rail.include_checkbox1.Checked:=False;     // include outer jaw

    frame_main_rail.loose_checkbox0.Checked:=False;       // outer jaw is loose

    frame_main_rail.export_checkbox1.Checked:=False;      // export loose jaw only
    frame_main_rail.export_checkbox2.Checked:=False;      // export rail seat

    frame_main_rail.include_checkbox2.Checked:=False;     // include key on outer jaw


        // 2nd rail...

    frame_2nd_rail.include_checkbox0.Checked:=False;     // include inner jaw
    frame_2nd_rail.include_checkbox1.Checked:=False;     // include outer jaw

    frame_2nd_rail.loose_checkbox0.Checked:=False;       // outer jaw is loose

    frame_2nd_rail.export_checkbox1.Checked:=False;      // export loose jaw only
    frame_2nd_rail.export_checkbox2.Checked:=False;      // export rail seat

    frame_2nd_rail.include_checkbox2.Checked:=False;     // include key on outer jaw

    plug_unlocked_radio.Checked:=True;

    customize_panel.Enabled:=False;

  end;//with

end;
//______________________________________________________________________________

procedure Theave_chairs_form.restore_buttonClick(Sender: TObject);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,False);              // new not needed
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n].heave_rail_chairs[customizing_rail] do begin
              hv_jaws:=False;
              hv_plug:=0;
            end;//with

            shove_buttons(True,0,n);
          end;
end;
//______________________________________________________________________________

procedure set_changed_chair_code_for_rail(r:integer);

var
  n:integer;
  new_ch:integer;

begin
  new_ch:=get_chair_code_from_combo(r);

  if new_ch>0
     then begin

            n:=find_shove(current_shove_str,True);               // new if needed
            if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
               then begin
                      with current_shoved_timbers[n] do begin

                        shove_data.sv_code:=1;                                       // 0=empty slot, -1=omit this timber,  1=shove this timber.
                        heave_rail_chairs[r].hv_ch:=new_ch;

                        sv_str:=current_shove_str;

                      end;//with

                      shove_buttons(True,0,n);
                      show_and_redraw(True,True);
                    end;

          end;
end;
//______________________________________________________________________________

procedure reset_normal_chair_code_for_rail(r:integer);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,False);                           // new not needed, reverting to default if any
  if (n>=0) and (n<Length(current_shoved_timbers))                  // valid slot.
     then current_shoved_timbers[n].heave_rail_chairs[r].hv_ch:=0;  // no chair change

  shove_buttons(True,0,n);
  show_and_redraw(True,True);
end;
//______________________________________________________________________________

procedure omit_key_for_rail(r:integer);   // 556 MW

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);               // new if needed
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;                                       // 0=empty slot, -1=omit this timber,  1=shove this timber.

              heave_rail_chairs[r].hv_omit_key:=True;   // omit key

              sv_str:=current_shove_str;

              redraw(False);  // sets labels

            end;//with

            shove_buttons(True,0,n);
          end;
end;
//______________________________________________________________________________

procedure reset_omitted_key_for_rail(r:integer);   // 556 MW

var
  n:integer;

begin
  n:=find_shove(current_shove_str,False);                   // new slot not needed
  if (n>=0) and (n<Length(current_shoved_timbers))          // valid slot.
     then begin
            current_shoved_timbers[n].heave_rail_chairs[r].hv_omit_key:=False;

            redraw(False);       // sets labels

            shove_buttons(True,0,n);
          end;
end;
//______________________________________________________________________________

procedure omit_chair_for_rail(r:integer);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,True);               // new if needed
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;                                       // 0=empty slot, -1=omit this timber,  1=shove this timber.

              heave_rail_chairs[r].hv_omit:=True;       // omit it
              heave_rail_chairs[r].hv_ch:=0;            // cancel any chair change

              sv_str:=current_shove_str;

              redraw(False);  // sets labels

            end;//with

            shove_buttons(True,0,n);
          end;
end;
//______________________________________________________________________________

procedure reset_omitted_chair_for_rail(r:integer);

var
  n:integer;

begin
  n:=find_shove(current_shove_str,False);                   // new slot not needed
  if (n>=0) and (n<Length(current_shoved_timbers))          // valid slot.
     then begin
            current_shoved_timbers[n].heave_rail_chairs[r].hv_omit:=False;

            redraw(False);       // sets labels

            shove_buttons(True,0,n);
          end;
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit_key4_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit_key4_checkbox.Checked=True
     then omit_key_for_rail(4)
     else reset_omitted_key_for_rail(14);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit_key3_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit_key3_checkbox.Checked=True
     then omit_key_for_rail(3)
     else reset_omitted_key_for_rail(3);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit_key2_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit_key2_checkbox.Checked=True
     then omit_key_for_rail(2)
     else reset_omitted_key_for_rail(2);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit_key1_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit_key1_checkbox.Checked=True
     then omit_key_for_rail(1)
     else reset_omitted_key_for_rail(1);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit4_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit4_checkbox.Checked=True
     then omit_chair_for_rail(4)
     else reset_omitted_chair_for_rail(4);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit3_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit3_checkbox.Checked=True
     then omit_chair_for_rail(3)
     else reset_omitted_chair_for_rail(3);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit2_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit2_checkbox.Checked=True
     then omit_chair_for_rail(2)
     else reset_omitted_chair_for_rail(2);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.omit1_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if omit1_checkbox.Checked=True
     then omit_chair_for_rail(1)
     else reset_omitted_chair_for_rail(1);
end;
//______________________________________________________________________________

procedure heave_form_update(omit_code:integer);    // called from shove_timber

var
  n,r:integer;
  not_omitted:boolean;

begin
  redraw(False);  // update chair visibility

  with heave_chairs_form do begin

    rail_label.Caption:='';                  // nothing selected yet..
    rail_highlight_shape.Visible:=False;
    customize_panel.Enabled:=False;

    if omit_code=-1     // timber omitted
       then begin
              Caption:=heave_chairs_form.Caption+'  ( omitted )';
              top_label.Caption:='timber  '+current_shove_str+'  is  omitted';

              rail4_groupbox.Visible:=False;
              rail3_groupbox.Visible:=False;
              rail2_groupbox.Visible:=False;
              rail1_groupbox.Visible:=False;

              chair_radio4.Enabled:=False;
              chair_radio3.Enabled:=False;
              chair_radio2.Enabled:=False;
              chair_radio1.Enabled:=False;

              chair_radio4.Checked:=False;
              chair_radio3.Checked:=False;
              chair_radio2.Checked:=False;
              chair_radio1.Checked:=False;

              rail4_big_number_label.Enabled:=False;
              rail3_big_number_label.Enabled:=False;
              rail2_big_number_label.Enabled:=False;
              rail1_big_number_label.Enabled:=False;


              EXIT;
            end;

    chair_radio4.Enabled:=rail4_groupbox.Visible;   // may be switched off in calculate_chairs_on_rails (math_unit)...
    chair_radio3.Enabled:=rail3_groupbox.Visible;
    chair_radio2.Enabled:=rail2_groupbox.Visible;
    chair_radio1.Enabled:=rail1_groupbox.Visible;

    rail4_big_number_label.Enabled:=rail4_groupbox.Visible;
    rail3_big_number_label.Enabled:=rail3_groupbox.Visible;
    rail2_big_number_label.Enabled:=rail2_groupbox.Visible;
    rail1_big_number_label.Enabled:=rail1_groupbox.Visible;

    //rail4_groupbox.Enabled:=False;    // init..
    //rail3_groupbox.Enabled:=False;
    //rail2_groupbox.Enabled:=False;
    //rail1_groupbox.Enabled:=False;

    customized_label4.Visible:=False;
    customized_label3.Visible:=False;
    customized_label2.Visible:=False;
    customized_label1.Visible:=False;

    Caption:='      heave  chairs  on  timber  '+current_shove_str+'  . . .';
    top_label.Caption:='heave  chairs  on  timber  '+current_shove_str;

    n:=find_shove(current_shove_str,False);
    if (n>=0) and (n<Length(current_shoved_timbers))     // valid existing shoved slot
       then begin
              with current_shoved_timbers[n] do begin

                if (customizing_rail>0) and (customizing_rail<5)
                   then begin
                          for r:=1 to 4 do customize_panel.Enabled:=customize_panel.Enabled or (heave_rail_chairs[r].hv_jaws) or (heave_rail_chairs[r].hv_plug<>0);

                          customized_label4.Visible:=((heave_rail_chairs[4].hv_jaws) or (heave_rail_chairs[4].hv_plug<>0)) and (heave_rail_chairs[4].hv_omit=False);
                          customized_label3.Visible:=((heave_rail_chairs[3].hv_jaws) or (heave_rail_chairs[3].hv_plug<>0)) and (heave_rail_chairs[3].hv_omit=False);
                          customized_label2.Visible:=((heave_rail_chairs[2].hv_jaws) or (heave_rail_chairs[2].hv_plug<>0)) and (heave_rail_chairs[2].hv_omit=False);
                          customized_label1.Visible:=((heave_rail_chairs[1].hv_jaws) or (heave_rail_chairs[1].hv_plug<>0)) and (heave_rail_chairs[1].hv_omit=False);
                        end;

                omit4_checkbox.Checked:=heave_rail_chairs[4].hv_omit;
                omitted_label4.Visible:=heave_rail_chairs[4].hv_omit;  // 556b

                not_omitted:=(heave_rail_chairs[4].hv_omit=False);  // 556b...

                sc4_size_button.Visible:=not_omitted;
                omit_key4_checkbox.Visible:=not_omitted;
                flip_key4_checkbox.Visible:=not_omitted;
                chair_family4_label.Visible:=not_omitted;
                rail4_combo.Visible:=not_omitted;
                change4_checkbox.Visible:=not_omitted;
                chair4_type_label.Visible:=not_omitted;
                normal_ch_label4.Visible:=not_omitted;

                if heave_rail_chairs[4].hv_omit=True
                   then rail4_groupbox.Color:=$00F1E3D8
                   else if heave_rail_chairs[4].hv_ch<>0
                           then rail4_groupbox.Color:=$00B8FFB8
                           else rail4_groupbox.Color:=$00FFFCF0;


                omit3_checkbox.Checked:=heave_rail_chairs[3].hv_omit;
                omitted_label3.Visible:=heave_rail_chairs[3].hv_omit;  // 556b

                not_omitted:=(heave_rail_chairs[3].hv_omit=False);  // 556b...

                sc3_size_button.Visible:=not_omitted;
                omit_key3_checkbox.Visible:=not_omitted;
                flip_key3_checkbox.Visible:=not_omitted;
                chair_family3_label.Visible:=not_omitted;
                rail3_combo.Visible:=not_omitted;
                change3_checkbox.Visible:=not_omitted;
                chair3_type_label.Visible:=not_omitted;
                normal_ch_label3.Visible:=not_omitted;

                if heave_rail_chairs[3].hv_omit=True
                   then rail3_groupbox.Color:=$00F1E3D8
                   else if heave_rail_chairs[3].hv_ch<>0
                           then rail3_groupbox.Color:=$00B8FFB8
                           else rail3_groupbox.Color:=$00FFFCF0;


                omit2_checkbox.Checked:=heave_rail_chairs[2].hv_omit;
                omitted_label2.Visible:=heave_rail_chairs[2].hv_omit;  // 556b

                not_omitted:=(heave_rail_chairs[2].hv_omit=False);  // 556b...

                sc2_size_button.Visible:=not_omitted;
                omit_key2_checkbox.Visible:=not_omitted;
                flip_key2_checkbox.Visible:=not_omitted;
                chair_family2_label.Visible:=not_omitted;
                rail2_combo.Visible:=not_omitted;
                change2_checkbox.Visible:=not_omitted;
                chair2_type_label.Visible:=not_omitted;
                normal_ch_label2.Visible:=not_omitted;

                if heave_rail_chairs[2].hv_omit=True
                   then rail2_groupbox.Color:=$00F1E3D8
                   else if heave_rail_chairs[2].hv_ch<>0
                           then rail2_groupbox.Color:=$00B8FFB8
                           else rail2_groupbox.Color:=$00FFFCF0;


                omit1_checkbox.Checked:=heave_rail_chairs[1].hv_omit;
                omitted_label1.Visible:=heave_rail_chairs[1].hv_omit;  // 556b

                not_omitted:=(heave_rail_chairs[1].hv_omit=False);  // 556b...

                sc1_size_button.Visible:=not_omitted;
                omit_key1_checkbox.Visible:=not_omitted;
                flip_key1_checkbox.Visible:=not_omitted;
                chair_family1_label.Visible:=not_omitted;
                rail1_combo.Visible:=not_omitted;
                change1_checkbox.Visible:=not_omitted;
                chair1_type_label.Visible:=not_omitted;
                normal_ch_label1.Visible:=not_omitted;

                if heave_rail_chairs[1].hv_omit=True
                   then rail1_groupbox.Color:=$00F1E3D8
                   else if heave_rail_chairs[1].hv_ch<>0
                           then rail1_groupbox.Color:=$00B8FFB8
                           else rail1_groupbox.Color:=$00FFFCF0;


                change4_checkbox.Checked:=(heave_rail_chairs[4].hv_ch<>0) and (heave_rail_chairs[4].hv_omit=False);
                change3_checkbox.Checked:=(heave_rail_chairs[3].hv_ch<>0) and (heave_rail_chairs[3].hv_omit=False);
                change2_checkbox.Checked:=(heave_rail_chairs[2].hv_ch<>0) and (heave_rail_chairs[2].hv_omit=False);
                change1_checkbox.Checked:=(heave_rail_chairs[1].hv_ch<>0) and (heave_rail_chairs[1].hv_omit=False);


                if heave_rail_chairs[4].hv_omit=True
                   then rail4_combo.ItemIndex:=-1
                   else rail4_combo.ItemIndex:=get_itemindex_for_combos(heave_rail_chairs[4].hv_ch);

                if heave_rail_chairs[3].hv_omit=True
                   then rail3_combo.ItemIndex:=-1
                   else rail3_combo.ItemIndex:=get_itemindex_for_combos(heave_rail_chairs[3].hv_ch);

                if heave_rail_chairs[2].hv_omit=True
                   then rail2_combo.ItemIndex:=-1
                   else rail2_combo.ItemIndex:=get_itemindex_for_combos(heave_rail_chairs[2].hv_ch);

                if heave_rail_chairs[1].hv_omit=True
                   then rail1_combo.ItemIndex:=-1
                   else rail1_combo.ItemIndex:=get_itemindex_for_combos(heave_rail_chairs[1].hv_ch);

                omit_key4_checkbox.Checked:=heave_rail_chairs[4].hv_omit_key;     // // 556 MW...
                omit_key3_checkbox.Checked:=heave_rail_chairs[3].hv_omit_key;
                omit_key2_checkbox.Checked:=heave_rail_chairs[2].hv_omit_key;
                omit_key1_checkbox.Checked:=heave_rail_chairs[1].hv_omit_key;

              end;//with

          end
     else begin    // timber not shoved

            change4_checkbox.Checked:=False;
            omit4_checkbox.Checked:=False;
            rail4_groupbox.Color:=$00FFFCF0;

            change3_checkbox.Checked:=False;
            omit3_checkbox.Checked:=False;
            rail3_groupbox.Color:=$00FFFCF0;

            change2_checkbox.Checked:=False;
            omit2_checkbox.Checked:=False;
            rail2_groupbox.Color:=$00FFFCF0;

            change1_checkbox.Checked:=False;
            omit1_checkbox.Checked:=False;
            rail1_groupbox.Color:=$00FFFCF0;

            rail4_combo.ItemIndex:=-1;
            rail3_combo.ItemIndex:=-1;
            rail2_combo.ItemIndex:=-1;
            rail1_combo.ItemIndex:=-1;

            omit_key4_checkbox.Checked:=False;
            omit_key3_checkbox.Checked:=False;
            omit_key2_checkbox.Checked:=False;
            omit_key1_checkbox.Checked:=False;

          end;

  end;//with form
end;
//______________________________________________________________________________

procedure Theave_chairs_form.rail4_comboChange(Sender: TObject);

begin
  if rail4_combo.ItemIndex<>-1
     then set_changed_chair_code_for_rail(4);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.rail3_comboChange(Sender: TObject);

begin
  if rail3_combo.ItemIndex<>-1
     then set_changed_chair_code_for_rail(3);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.rail2_comboChange(Sender: TObject);

begin
  if rail2_combo.ItemIndex<>-1
     then set_changed_chair_code_for_rail(2);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.rail1_comboChange(Sender: TObject);

begin
  if rail1_combo.ItemIndex<>-1
     then set_changed_chair_code_for_rail(1);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.change4_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if change4_checkbox.Checked=False
     then reset_normal_chair_code_for_rail(4);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.change3_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if change3_checkbox.Checked=False
     then reset_normal_chair_code_for_rail(3);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.change2_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if change2_checkbox.Checked=False
     then reset_normal_chair_code_for_rail(2);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.change1_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if change1_checkbox.Checked=False
     then reset_normal_chair_code_for_rail(1);
end;
//______________________________________________________________________________

procedure Theave_chairs_form.plug_unlocked_radioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  n:integer;

begin
  if (customizing_rail<1) or (customizing_rail>4) then EXIT;    // no valid rail

  n:=find_shove(current_shove_str,True);               // new if needed
  if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
     then begin
            with current_shoved_timbers[n] do begin

              shove_data.sv_code:=1;     // 0=empty slot, -1=omit this timber,  1=shove this timber.

              with heave_rail_chairs[customizing_rail] do begin

                if Sender=cot_radio
                   then hv_plug:=4                     // 0=normal 1=force clip-fit  2=force snap-fit  3=force press-fit  4=force COT (no plug)
                   else if Sender=clip_radio
                           then hv_plug:=1
                           else if Sender=snap_radio
                                   then hv_plug:=2
                                   else if Sender=press_radio
                                           then hv_plug:=3
                                           else hv_plug:=0;     // plug_unlocked_radio clicked

              end;//with

              sv_str:=current_shove_str;

            end;//with

            redraw(False);       // update calcs

            shove_buttons(True,0,n);
          end;
end;
//______________________________________________________________________________

procedure heave_form_set_customized_jaws;       // called from MouseUp in chair_frame_unit

var
  n:integer;

begin
  if (customizing_rail<1) or (customizing_rail>4) then EXIT;    // no valid rail

    with heave_chairs_form do begin

    n:=find_shove(current_shove_str,True);               // new if needed
    if (n>=0) and (n<Length(current_shoved_timbers))     // valid slot.
       then begin
              with current_shoved_timbers[n] do begin

                shove_data.sv_code:=1;                     // 0=empty slot, -1=omit this timber,  1=shove this timber.

                with heave_rail_chairs[customizing_rail] do begin

                  hv_jaws:=True;         // chair customized

                          // main running rail...

                  hv_jaw_options[0][0]:=frame_main_rail.include_checkbox0.Checked;     // include inner jaw
                  hv_jaw_options[0][1]:=frame_main_rail.include_checkbox1.Checked;     // include outer jaw

                  hv_jaw_options[0][2]:=frame_main_rail.loose_checkbox0.Checked;       // outer jaw is loose

                  hv_jaw_options[0][3]:=frame_main_rail.export_checkbox1.Checked;      // export loose jaw only
                  hv_jaw_options[0][4]:=frame_main_rail.export_checkbox2.Checked;      // export rail seat

                  hv_jaw_options[0][5]:=frame_main_rail.include_checkbox2.Checked;     // include key on outer jaw


                  hv_jaw_options[1][0]:=frame_2nd_rail.include_checkbox0.Checked;     // include inner jaw
                  hv_jaw_options[1][1]:=frame_2nd_rail.include_checkbox1.Checked;     // include outer jaw

                  hv_jaw_options[1][2]:=frame_2nd_rail.loose_checkbox0.Checked;       // outer jaw is loose

                  hv_jaw_options[1][3]:=frame_2nd_rail.export_checkbox1.Checked;      // export loose jaw only
                  hv_jaw_options[1][4]:=frame_2nd_rail.export_checkbox2.Checked;      // export rail seat

                  hv_jaw_options[1][5]:=frame_2nd_rail.include_checkbox2.Checked;     // include key on outer jaw

                        //  hv_jaw_options[2..3] other rails in chair nyi

                end;//with

                sv_str:=current_shove_str;

              end;//with

              redraw(False);             // update labels

              shove_buttons(True,0,n);

              do_chair_selected(customizing_rail);   // in case reset
            end;

  end;//with form
end;
//______________________________________________________________________________

function get_cclr_chair_str(rail_code,chair_code:integer):string;   // 555a  // MW 04-08-2024

       // modify CCL/CCR strings

begin
  RESULT:=get_chair_str(chair_code);


  if (rail_code=1) or (rail_code=2)
     then begin
            if chair_code=14          // over-ride check flare-in from "CCL/R"
               then case hand_i of
                      1: RESULT:='CCL';
                     -1: RESULT:='CCR';
                    end;

            if chair_code=16          // over-ride check flare-out from "CCR/L"
               then case hand_i of
                      1: RESULT:='CCR';
                     -1: RESULT:='CCL';
                    end;
          end
     else begin                       // rails 3, 4
            if chair_code=14          // over-ride check flare-in from "CCL/R"
               then case hand_i of
                      1: RESULT:='CCR';
                     -1: RESULT:='CCL';
                    end;

            if chair_code=16          // over-ride check flare-out from "CCR/L"
               then case hand_i of
                      1: RESULT:='CCL';
                     -1: RESULT:='CCR';
                    end;
          end;
end;
//______________________________________________________________________________

end.

