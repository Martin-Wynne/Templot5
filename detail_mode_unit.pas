
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

unit detail_mode_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type

  { Tdetail_mode_form }

  Tdetail_mode_form = class(TForm)
    Label1: TLabel;
    marker_colours_radio: TRadioButton;
    normal_colours_radio: TRadioButton;
    normal_radio: TRadioButton;
    no_platforms_radio: TRadioButton;
    thickcl_radio: TRadioButton;
    thickcl_panel: Tpanel;
    line_thickness_button: TButton;
    ok_panel: TPanel;
    ok_button: TButton;
    datestamp_label: TLabel;
    more_info_button: TButton;
    procedure ok_buttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure normal_radioClick(Sender: TObject);
    procedure thickcl_radioClick(Sender: TObject);
    procedure line_thickness_buttonClick(Sender: TObject);
    procedure more_info_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  detail_mode_form: Tdetail_mode_form;

implementation

uses
  print_settings_unit,pad_unit,math_unit,control_room,entry_sheet,help_sheet;

{$R *.lfm}

//______________________________________________________________________________

procedure Tdetail_mode_form.ok_buttonClick(Sender: TObject);

begin
  Hide;
  pad_form.printed_element_options_menu_entry.Click;     // 226c show the options form
end;
//______________________________________________________________________________

procedure Tdetail_mode_form.FormCreate(Sender: TObject);

begin
  AutoScroll:=False;

  ClientWidth:=372;
  ClientHeight:=256;
end;
//______________________________________________________________________________

procedure Tdetail_mode_form.normal_radioClick(Sender: TObject);

begin
  thickcl_panel.Enabled:=False;

  with print_settings_form do begin

    output_centrelines_checkbox.Checked:=True;

      // 226c ...

    output_rails_checkbox.Checked:=True;
    output_fb_foot_lines_checkbox.Checked:=True;
    output_radial_ends_checkbox.Checked:=True;
    output_switch_labels_checkbox.Checked:=True;
    output_xing_labels_checkbox.Checked:=True;
    output_rail_joints_checkbox.Checked:=True;
    output_guide_marks_checkbox.Checked:=True;
    output_switch_drive_checkbox.Checked:=True;

    output_timbering_checkbox.Checked:=True;
    output_timber_centres_checkbox.Checked:=True;
    output_timber_numbers_checkbox.Checked:=True;
    output_timber_extensions_checkbox.Checked:=True;
    output_timb_id_prefix_checkbox.Checked:=True;

  end;//with

  pad_form.normal_printed_lines_menu_entry.Click;   // radio item

end;
//______________________________________________________________________________

procedure Tdetail_mode_form.thickcl_radioClick(Sender: TObject);

begin
  thickcl_panel.Enabled:=True;

  with print_settings_form do begin

    output_centrelines_checkbox.Checked:=True;

      // 226c ...

    output_rails_checkbox.Checked:=False;
    output_fb_foot_lines_checkbox.Checked:=False;
    output_radial_ends_checkbox.Checked:=False;
    output_switch_labels_checkbox.Checked:=False;
    output_xing_labels_checkbox.Checked:=False;
    output_chairs_checkbox.Checked:=False;
    output_rail_joints_checkbox.Checked:=False;
    output_guide_marks_checkbox.Checked:=False;
    output_switch_drive_checkbox.Checked:=False;

    output_timbering_checkbox.Checked:=False;
    output_timber_centres_checkbox.Checked:=False;
    output_timber_numbers_checkbox.Checked:=False;
    output_timber_extensions_checkbox.Checked:=False;
    output_timb_id_prefix_checkbox.Checked:=False;

  end;//with

  if line_thickness_button.Tag=0
     then begin
            printcl_thick:=g;    // set centre-line thickness to match track gauge.
            pad_form.set_line_thicknesses_menu_entry.Checked:=True;   // radio item.
          end;
end;
//______________________________________________________________________________

procedure Tdetail_mode_form.line_thickness_buttonClick(Sender: TObject);

const
  thick_str:string='Enter the thickness (width) of the track centre-lines in the output, im mm.';

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim(thick_str,1,'track  centre-line  thickness',printcl_thick,True,True,True,False);     // no neg, no preset, no zero, don't terminate on zero.
  if n<>0 then EXIT;
  if getdims('output  track  centre-line  thickness','',detail_mode_form,n,od)=True
     then begin
            printcl_thick:=od[0];

            pad_form.set_line_thicknesses_menu_entry.Checked:=True;   // radio item.

            line_thickness_button.Tag:=1;  // don't use default gauge size
          end;
end;
//______________________________________________________________________________

procedure Tdetail_mode_form.more_info_buttonClick(Sender: TObject);

begin
  more_info(1050);     // detail-mode options
end;
//______________________________________________________________________________

end.    
