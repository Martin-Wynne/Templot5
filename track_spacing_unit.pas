
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

unit track_spacing_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Htmlview, HtmlGlobals;

type

  { Ttrack_spacing_form }

  Ttrack_spacing_form = class(TForm)
    datestamp_label: TLabel;
    header_label: TLabel;
    Label10: TLabel;
    prefs_checkbox: TCheckBox;
    top_label: TLabel;
    uk_panel: TPanel;
    html_pane: THTMLViewer;
    updown_panel: TPanel;
    less_toolbutton: TSpeedButton;
    more_toolbutton: TSpeedButton;
    bottom_button: TSpeedButton;
    slider_bar_shape: TShape;
    _6ft_label: TLabel;
    Shape13: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    _7ft_label: TLabel;
    _8ft_label: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape12: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    _9ft_label: TLabel;
    _10ft_label: TLabel;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    _11ft_label: TLabel;
    Shape25: TShape;
    _12ft_label: TLabel;
    slider_pointer: TLabel;
    other_way_button: TButton;
    info_panel: TPanel;
    sub_label: TLabel;
    way_label: TLabel;
    Label9: TLabel;
    way_panel: TPanel;
    ok_panel: TPanel;
    ok_button: TButton;
    cancel_panel: TPanel;
    cancel_button: TButton;
    mouse_timer: TTimer;
    Label1: TLabel;
    info_button: TButton;
    other_panel: TPanel;
    Label2: TLabel;
    mm_button: TButton;
    inches_button: TButton;
    no_change_button: TButton;
    no_change_label: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape26: TShape;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bottom_buttonClick(Sender: TObject);
    procedure HotSpotClick(Sender: TObject; const SRC: ThtString; var Handled: Boolean);
    procedure less_toolbuttonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure less_toolbuttonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure more_toolbuttonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure more_toolbuttonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure inches_buttonClick(Sender: TObject);
    procedure mm_buttonClick(Sender: TObject);
    procedure ok_buttonClick(Sender: TObject);
    procedure _6ft_labelMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure updown_panelMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure _6ft_labelClick(Sender: TObject);
    procedure _7ft_labelClick(Sender: TObject);
    procedure _8ft_labelClick(Sender: TObject);
    procedure _9ft_labelClick(Sender: TObject);
    procedure _10ft_labelClick(Sender: TObject);
    procedure _11ft_labelClick(Sender: TObject);
    procedure _12ft_labelClick(Sender: TObject);
    procedure prefs_checkboxClick(Sender: TObject);
    procedure cancel_panelClick(Sender: TObject);
    procedure info_buttonClick(Sender: TObject);
    procedure mouse_timerTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure slider_pointerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
    procedure slider_pointerMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure other_way_buttonClick(Sender: TObject);
    procedure Shape26MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure no_change_labelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  track_spacing_form: Ttrack_spacing_form;

  way_spacings_top_str:string='adjacent track spacing';
  way_spacings_cancel_str:string='cancel';

  procedure less_spacing;    // for timer..
  procedure more_spacing;

  function do_way_spacings(making:boolean; side:integer):boolean;

implementation

uses
  control_room,pad_unit,math_unit,help_sheet,entry_sheet,bgkeeps_unit;

{$R *.lfm}

var
  side_code:integer=1;    // 1=TS,  -1=MS
  slider_pos:integer=0;   // slider position 0-72, 73 positions
  sp:extended=0;
  side_str:string='TS';
  ok_str:string='continue';

  procedure slider_moved;forward;
  procedure other_adjacent_centres(model_mm:boolean);forward;

//______________________________________________________________________________

function get_centres_info:string;

begin RESULT:='        `0adjacent  track  spacing`9'

  +'||Every template in Templot has its own settings for the spacing of adjacent tracks on each side, measured centre-to-centre.'
  +'||The settings normally propagate from one template to the next as you create a track plan from the control template. Until you change them, that is.'
  +' Bear in mind when copying a background template back into the control template that its spacing settings may differ from the previous templates.'

  +'||Different spacing dimensions can be set for the tracks on each side of the template.'

  +'|| &nbsp; &nbsp; <img src="'+exe_str+'internal\hlp\ts_ms_indications.png">'

  +'||TS is "turnout-side", i.e. the same side as the hand of the template. The diverging side of a turnout.'
  +'||MS is "main-side", i.e. the opposite side from the hand of the template. The straight-ahead side of a turnout.'

  +'||rp.gif  Keep in mind that the term "main-side" refers to the physical side of the template, and not the designation of the running lines, if any.'

  +'||For a half-diamond template, the "turnout-side" becomes the "diagonal-side" (DS), although this difference terminology is purely cosmetic and may not appear in all cases.'

  +'||For a plain track template, there is a flag on the `0CTRL-1`2 end marker to indicate the main side (MS).'

  +'||For UK standard-gauge practice the minimum spacing on straight track should normally give a 6ft WAY between the inner rails, that means 11ft 2in (134in) minimum centre-to-centre spacing for standard-gauge running lines.'
  +'||Where there are sharp curves or superelevation, this distance must be increased to allow for vehicle overhang.'

  +'||The `0utils > dummy vehicle`1 functions can be used to determine the required clearance on such curves, in conjunction with the `0ACTION > MOUSE ACTIONS: CONTROL/GEOMETRY > ADJUST ADJACENT TRACK CENTRES`1 mouse actions.'

  +'||The minimum spacing should also be increased when using the `0TOOLS > MAKE DOUBLE-TRACK`1 functions on a transition curve, as it is not mathematically possible to create an exact uniformly spaced adjacent track on a transition curve.'

  +'||For straight track in sidings and marshalling yards, tracks are sometimes spaced closer than 6ft WAY to save space, down to not less than 5ft WAY.'

  +'||If you are using a reduced track gauge such as 00 or EM these centre-to-centre spacings <U>remain the same</U>. The actual WAY dimension measured between the inner rails increases accordingly.'

  +'||Where the adjacent track forms a loop or siding alongside a running line, the spacing should normally be increased by 4ft to 10ft WAY i.e. 15ft 2in (182in) centres for UK tracks.'
  +' This is to provide a space for signal posts and other obstructions, and to ensure the safety of shunting staff.'

  +'||Where there are more than two running lines, such as slow lines alongside main lines, the spacings should normally alternate between 6ft WAY and 10ft WAY so that no track has another track spaced at 6ft WAY on both sides.'

  +'||Changes made here will be reset if a new gauge/scale setting is selected. Many model railway gauge standards incorporate overscale nominal spacings to allow for the use of sharp curves.';
end;
//______________________________________________________________________________

function do_way_spacings(making:boolean; side:integer):boolean;

   // show spacings dialog

var
  modal_result:TModalResult;

begin
  if (no_spacings_confirm=True) and (making=true)
     then begin
            RESULT:=True;
            EXIT;
          end
     else RESULT:=False;  // init

  side_code:=side;  // global   

  with track_spacing_form do begin

    if making=True
       then ok_str{ok_panel.Caption}:='  continue   '
       else ok_str{ok_panel.Caption}:='  set   ';

    ok_panel.Caption:=ok_str;    

    if side=1   // TS
       then begin
              sp:=cpi.trtscent_pi;

              header_label.Caption:='set  adjacent  track  spacing  -  Turnout - Side  ( TS ) ';
              sub_label.Caption:='TS tracks at';
              no_change_label.Caption:='TS no change :';
              side_str:='TS';
            end
       else begin  // -1  MS
              sp:=cpi.trmscent_pi;

              header_label.Caption:='set  adjacent  track  spacing  -  Main - Side  ( MS )';
              sub_label.Caption:='MS tracks at';
              no_change_label.Caption:='MS no change :';
              side_str:='MS';
            end;

    slider_pos:=Round(sp/inscale)-134;

    prefs_checkbox.Visible:=making;

    top_label.Caption:=way_spacings_top_str;
    cancel_panel.Caption:=way_spacings_cancel_str;

    no_change_button.Caption:='keep  '+round_str(sp,2)+' mm';

    slider_pointer.Left:=Round(slider_pos*(updown_panel.Width-slider_pointer.Width)/72);

  end;//with

  slider_moved;

  modal_result:=do_show_modal(track_spacing_form);

  if modal_result=mrCancel then EXIT;

  if modal_result=mrRetry
     then begin
            other_adjacent_centres(False);  // False = other setting in prototype inches
            RESULT:=True;
          end;

  if modal_result=mrAbort
     then begin
            other_adjacent_centres(True);   // other setting in model mm
            RESULT:=True;
          end;

  if modal_result=mrOk
     then begin
            RESULT:=True;   // TS spacing set by form, or unchanged

            redraw(True);   // for peg positions, info panel
          end;
          
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.FormCreate(Sender: TObject);

begin
  AutoScroll:=False;

  ClientWidth:=560;
  ClientHeight:=764;
end;
//______________________________________________________________________________

procedure set_slider;

begin
  with track_spacing_form do slider_pointer.Left:=Round(slider_pos*(updown_panel.Width-slider_pointer.Width)/72);
end;
//______________________________________________________________________________

procedure more_spacing;

begin
  INC(slider_pos);

  if slider_pos>72 then slider_pos:=72;

  set_slider;  // to next step position

  slider_moved;    // set the spacing
end;
//______________________________________________________________________________

procedure less_spacing;

begin
  DEC(slider_pos);

  if slider_pos<0 then slider_pos:=0;

  set_slider;  // to previous step position

  slider_moved;    // set the spacing
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.slider_pointerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  n:integer;
  mpsx,mpsy:integer;
  sp:TPoint;

begin
  if Shift=[ssLeft]   // mouse down ?  prepare to drag slider...
     then begin
            with slider_pointer do begin

              Font.Color:=clRed;

              sp.X:=Left+(Width div 2);
              sp.Y:=Top+(Height div 2);

              mpsx:=updown_panel.ClientToScreen(sp).X;
              mpsy:=updown_panel.ClientToScreen(sp).Y;

            end;//with

            SetCursorPos(mpsx,mpsy);
          end;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.slider_pointerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

var
  mps:TPoint;
  n,slider_left:integer;

begin
  if Shift=[ssLeft]   // mouse down ?
     then begin

            if mouse_timer.Enabled=True then EXIT;     // 226f 10ms wait     prevent too rapid for CPU

            if GetCursorPos(mps)=False then begin mps.X:=0; mps.Y:=0; end;     // make the slider track the mouse..

            slider_left:=(updown_panel.ScreenToClient(mps)).X-(slider_pointer.Width div 2);
            if slider_left<0 then slider_left:=0;
            if slider_left>(updown_panel.Width-slider_pointer.Width) then slider_left:=updown_panel.Width-slider_pointer.Width;

            slider_pointer.Left:=slider_left;

            slider_pos:=Round(slider_left*72/(updown_panel.Width-slider_pointer.Width));

            slider_moved;

            mouse_timer.Enabled:=True;  // 226f
          end;

end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.bottom_buttonClick(Sender: TObject);

begin
  slider_pos:=0;
  slider_pointer.Left:=0;

  slider_moved;
end;

procedure Ttrack_spacing_form.HotSpotClick(Sender: TObject; const SRC: ThtString; var Handled: Boolean);

begin
  do_html_hotspot(SRC);
end;

//______________________________________________________________________________

procedure Ttrack_spacing_form.less_toolbuttonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

     // do first change here, then via timer if held down
begin
  less_toolbutton.Tag:=1;
  Application.ProcessMessages;                       // to show button down or quick back up.
  if less_toolbutton.Tag<>0 then less_spacing;
end;
//__________________

procedure Ttrack_spacing_form.less_toolbuttonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  less_toolbutton.Tag:=0;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.more_toolbuttonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

     // do first change here, then via timer if held down
begin
  more_toolbutton.Tag:=1;
  Application.ProcessMessages;                       // to show button down or quick back up.
  if more_toolbutton.Tag<>0 then more_spacing;
end;
//__________________

procedure Ttrack_spacing_form.more_toolbuttonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  more_toolbutton.Tag:=0;
end;
//______________________________________________________________________________

procedure slider_moved;

var
  way,way_ft,way_ins:extended;
  
  ft_str,ins_str:string;
  way_str,sp_str:string;
  margin1_str,margin2_str:string;

begin
  with track_spacing_form do begin
    way:=72+slider_pos;             // whole inches

    sp:=(way+62)*inscale;  // new centres spacing

    way_ft:=ABS(way/12);

    ft_str:=IntToStr(do_truncx(way_ft))+'ft';

    way_ins:=do_fracx(way_ft)*12;

    ins_str:='-'+IntToStr(Round(way_ins))+'in';

    way_str:='|  '+IntToStr(Round(way))+' in';

    if do_truncx(way_ft)<10
       then margin1_str:='    '
       else margin1_str:='  ';

    if Round(way_ins)<10
       then margin2_str:='   '
       else margin2_str:=' ';


    way_panel.Caption:=margin1_str+ft_str+ins_str+margin2_str+way_str;

    sp_str:='<P STYLE="FONT-SIZE:15px; MARGIN-TOP:0PX;">For UK standard-gauge tracks at your current scale <B>'+FormatFloat('0.##',scale)+'</B>mm/ft, this <B>'+IntToStr(Round(way))+' inches</B> way between the rails makes these <B>'+side_str+'</B> adjacent track centres:</P>'
           +'<P STYLE="FONT-SIZE:19px; FONT-FAMILY:''Trebuchet MS'';"><B>&nbsp;'+side_str+' CENTRES :</B> &nbsp; prototype: <A HREF="adj_centres_inches.85a">'+FormatFloat('0.##',sp/inscale)+' inches</A>'
           +'&nbsp; &nbsp; model: <A HREF="adj_centres_mm.85a">'+FormatFloat('0.##',sp)+' mm</A></P>'
           +'<P STYLE="FONT-SIZE:14px; MARGIN-TOP:16PX;">Use the <A HREF="online_ref920.85a">dummy vehicle</A> to check sufficient running clearance on sharp curves.</P>';

    html_pane.LoadFromString(sp_str);

    ok_panel.Caption:=ok_str+FormatFloat('0.##',sp)+' mm';

  end;//with
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.inches_buttonClick(Sender: TObject);

begin
  ModalResult:=mrRetry;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.mm_buttonClick(Sender: TObject);

begin
  ModalResult:=mrAbort;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.ok_buttonClick(Sender: TObject);

begin
  if side_code=1
     then cpi.trtscent_pi:=sp   // new TS spacing
     else cpi.trmscent_pi:=sp;  // new MS spacing

  ModalResult:=mrOk;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form._6ft_labelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

begin
  TLabel(Sender).Font.Color:=clRed;
end;
//______________________________________________________________________________

procedure restore_blue;

begin
  with track_spacing_form do begin
    _6ft_label.Font.Color:=clBlue;
    _7ft_label.Font.Color:=clBlue;
    _8ft_label.Font.Color:=clBlue;
    _9ft_label.Font.Color:=clBlue;
    _10ft_label.Font.Color:=clBlue;
    _11ft_label.Font.Color:=clBlue;
    _12ft_label.Font.Color:=clBlue;
  end;//with
end;
//______________________________________________________________________________

procedure labels_click(position:integer);

begin
  restore_blue;
  slider_pos:=position;
  set_slider;
  slider_moved;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.updown_panelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

begin
  restore_blue;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form._6ft_labelClick(Sender: TObject);

begin
  labels_click(0);
end;
//___________________

procedure Ttrack_spacing_form._7ft_labelClick(Sender: TObject);

begin
  labels_click(12);
end;
//___________________

procedure Ttrack_spacing_form._8ft_labelClick(Sender: TObject);

begin
  labels_click(24);
end;
//___________________

procedure Ttrack_spacing_form._9ft_labelClick(Sender: TObject);

begin
  labels_click(36);
end;
//___________________

procedure Ttrack_spacing_form._10ft_labelClick(Sender: TObject);

begin
  labels_click(48);
end;
//___________________

procedure Ttrack_spacing_form._11ft_labelClick(Sender: TObject);

begin
  labels_click(60);
end;
//___________________

procedure Ttrack_spacing_form._12ft_labelClick(Sender: TObject);

begin
  labels_click(72);
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.prefs_checkboxClick(Sender: TObject);

begin
  no_spacings_confirm:=prefs_checkbox.Checked;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.cancel_panelClick(Sender: TObject);

begin
  ModalResult:=mrCancel;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.info_buttonClick(Sender: TObject);

const
  spacing_help_str:string='php/130           `0set adjacent track spacing`9'

  +'||`0for TS (turnout-side) or MS (main-side) tracks`9'

  +'||green_panel_begin tree.gif  For more explanation, diagrams and videos, click the           `0more information online`1 link above.green_panel_end'

  +'|Use this dialog to set the WAY dimension for the track spacing on the control template.'
  +'||The WAY dimension is measured between the inner rails of double-track, and is the usual prototype method for specifying track spacings.'
  +'||This dialog will convert the prototype WAY dimension to the required track centre-to-centre dimension at your current scale.'
  +'||Press or hold down the keyboard arrow keys, or click the blue <SPAN STYLE="COLOR:BLUE;">ft</SPAN> numbers, or drag the slider, or click or hold down the arrow buttons to set the desired prototype WAY to the nearest whole inch.'

  +'||If you wish to set a WAY dimension in whole inches outside the limits of the slider, click the `0other...`1 button.'

  +'||If you wish to use a centre-to-centre spacing which can''t be set using this dialog, click the `0set other centres:`1 buttons, or click the blue CENTRES dimensions showing.'

  +'||If you wish to retain the existing centre-to-centre spacing, click the `0no change : keep`1 button to close the dialog and continue without making any changes.<HR>';

begin
  help(0,spacing_help_str+get_centres_info,'');

  html_pane.SetFocus;  // 226f   to receive arrow keys  (in KeyPreview)
end;
//______________________________________________________________________________

procedure other_adjacent_centres(model_mm:boolean);

var
  help_cent_str:string;
  n:integer;
  od:Toutdim;
  dummy:extended;

begin
  help_cent_str:='php/130    `0Set  adjacent  track  spacing`9';

  if model_mm=True
     then help_cent_str:=help_cent_str+'||Enter the centre-to-centre distance in <U>model mm </U> to the adjacent track.'
                                      +'||If preferred, prototype dimensions (in inches) can be entered instead of model dimemsions, by using the P conversion factor.'
                                      +' For example, to enter prototype track centres of 134 inches, enter <SPAN STYLE="COLOR:BLUE;">p134</SPAN>.'

     else help_cent_str:=help_cent_str+'||Enter the centre-to-centre distance in <U>full-size prototype inches</U> to the adjacent track.'
                                      +'||If preferred, model dimensions (in mm) can be entered instead of full-size prototype dimemsions, by using the S conversion factor.'
                                      +' For example, to enter model track centres of 50mm, enter <SPAN STYLE="COLOR:BLUE;">s50</SPAN>.';

  help_cent_str:=help_cent_str+'||For more about conversion factors, click the `0? HELP`1 button.<HR>';

  help_cent_str:=help_cent_str+get_centres_info;

  if model_mm=True      // 224a
     then begin
               putdim(help_cent_str,1,'adjacent  track  centres  TS  ( turnout side )',cpi.trtscent_pi,False,False,True,False);   // neg ok, preset ok, no zero, don't terminate on zero.
            n:=putdim(help_cent_str,1,'adjacent  track  centres  MS  ( main side )',cpi.trmscent_pi,False,False,True,False);      // neg ok, preset ok, no zero, don't terminate on zero.
            if n<>1 then EXIT;
            if getdims('adjacent  track  centre-to-centre  spacings','',pad_form,n,od)=True
               then begin
                      if od[0]=def_req then od[0]:=134*inscale;
                      if od[1]=def_req then od[1]:=134*inscale;

                      cpi.trtscent_pi:=od[0];
                      cpi.trmscent_pi:=od[1];
                    end
               else EXIT;
          end
     else begin
               putdim(help_cent_str,2,'adjacent  track  centres  TS  ( turnout side )',cpi.trtscent_pi/inscale,False,False,True,False);   // neg ok, preset ok, no zero, don't terminate on zero.
            n:=putdim(help_cent_str,2,'adjacent  track  centres  MS  ( main side )',cpi.trmscent_pi/inscale,False,False,True,False);      // neg ok, preset ok, no zero, don't terminate on zero.
            if n<>1 then EXIT;
            if getdims('adjacent  track  centre-to-centre  spacings','',pad_form,n,od)=True
               then begin
                      if od[0]=def_req then od[0]:=134;    // bug-fix 215d
                      if od[1]=def_req then od[1]:=134;    // bug-fix 215d

                      cpi.trtscent_pi:=od[0]*inscale;
                      cpi.trmscent_pi:=od[1]*inscale;
                    end
               else EXIT;
          end;

  if (xing_type_i<1) and (retpar_i=1) and (xing_ret_i=0)       // parallel crossing with return curve centres as adjacent track.
     then begin
            cpi.retcent_pi:=cpi.trtscent_pi; //  set new return curve centres.

            get_cpi;            //  use the new values.

            kform_now:=kform;
            arm_angle_now:=arm_angle;
            docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg position on pad and curving angle.

            gocalc(0,0);       //  recalc to get new pegx, pegy, arm_angle.

            peg_curve;         //  adjust shifts and rotates for current peg position.
            gocalc(0,0);       //  get new arm_angle (peg might be on return curve).

            rotate_turnout(arm_angle_now-arm_angle,True);  // re-align to previous angle and redraw.
          end
     else begin
            get_cpi;            //  use the new values.

            kform_now:=kform;
            docurving(True,True,pegx,pegy,now_peg_x,now_peg_y,now_peg_k,dummy);    // save current peg position on pad and curving angle.

            gocalc(0,0);       //  recalc to get new pegx, pegy.
            peg_curve;         //  adjust shifts and rotates for current peg position.
            redraw(True);
          end;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.mouse_timerTimer(Sender: TObject);   // 226f

begin
  mouse_timer.Enabled:=False;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);     // 226f

begin
  if (Key=VK_LEFT) or (Key=VK_DOWN) then begin less_spacing; Key:=0; end;
  if (Key=VK_RIGHT) or (Key=VK_UP) then begin more_spacing; Key:=0; end;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.FormActivate(Sender: TObject);

begin
  html_pane.SetFocus;  // 226f   to receive arrow keys  (in KeyPreview)
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.other_way_buttonClick(Sender: TObject);     // 233c

const
  str:string='    `0double - track  way  between  rails`9'
            +'||Enter the required prototype distance between the rails in whole full-size inches.'
            +'||For running lines this should not be less than 72 inches (6ft way).'
            +'||For slow lines, goods loops and sidings alongside running lines, the usual prototype requirement is 120 inches (10ft way) unless space constraints prevent it.'
            +'||For straight track in sidings and marshalling yards the tracks are sometimes closed up to not less than 60 inches (5ft way).';
var
  n:integer;
  od:Toutdim;

begin
  n:=putdim(str,2,'way  between  rails  ( full - size  inches )',slider_pos+72,True,True,True,False);   // no neg, no preset, no zero, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('double - track  way  between  rails ...','',track_spacing_form,n,od)=True
     then begin
            slider_pos:=Round(od[0])-72;
            set_slider;
            slider_moved;
          end;

  html_pane.SetFocus;  // for arrow keys
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.Shape26MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  Modalresult:=mrOk;
end;
//______________________________________________________________________________

procedure Ttrack_spacing_form.no_change_labelClick(Sender: TObject);

begin
  Modalresult:=mrOk;
end;
//______________________________________________________________________________

end.
