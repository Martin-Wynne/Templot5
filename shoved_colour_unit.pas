
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

unit shoved_colour_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  Tshoved_colour_form = class(TForm)
    replace_fill_colour_label: TLabel;
    replace_style_label: TLabel;
    shoved_trackpad_style_combo: TComboBox;
    shoved_trackpad_colour_panel: TPanel;
    shoved_trackpad_colour_button: TButton;
    Label1: TLabel;
    Label2: TLabel;
    shoved_output_style_combo: TComboBox;
    shoved_output_colour_panel: TPanel;
    shoved_output_colour_button: TButton;
    top_label: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    datestamp_label: TLabel;
    Shape2: TShape;
    ok_panel: TPanel;
    ok_button: TButton;
    use_on_trackpad_checkbox: TCheckBox;
    Label4: TLabel;
    use_on_output_checkbox: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    cancel_panel: TPanel;
    cancel_button: TButton;
    also_export_checkbox: TCheckBox;
    colour_defaults_button: TButton;
    also_bgnd_checkbox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure shoved_trackpad_colour_buttonClick(Sender: TObject);
    procedure shoved_output_colour_buttonClick(Sender: TObject);
    procedure ok_buttonClick(Sender: TObject);
    procedure cancel_buttonClick(Sender: TObject);
    procedure colour_defaults_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  shoved_colour_form: Tshoved_colour_form;

implementation

{$R *.lfm}

uses
  math_unit, colour_unit;

//______________________________________________________________________________

procedure Tshoved_colour_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=430;
  ClientHeight:=368;

  AutoScroll:=False;
end;
//______________________________________________________________________________

procedure Tshoved_colour_form.shoved_trackpad_colour_buttonClick(Sender:TObject);

begin
  shoved_trackpad_colour_panel.Color:=get_colour('choose  a  modified  infill  colour  for  this  timber  on  the  trackpad',shoved_trackpad_colour_panel.Color);
end;
//______________________________________________________________________________

procedure Tshoved_colour_form.shoved_output_colour_buttonClick(Sender:TObject);

begin
  shoved_output_colour_panel.Color:=get_colour('choose  a  modified  infill  colour  for  this  timber  in  print  and  PDF  output',shoved_output_colour_panel.Color);
end;
//______________________________________________________________________________

procedure Tshoved_colour_form.ok_buttonClick(Sender: TObject);

begin
  ModalResult:=mrOK;
end;
//______________________________________________________________________________

procedure Tshoved_colour_form.cancel_buttonClick(Sender: TObject);

begin
  ModalResult:=mrCancel;
end;
//______________________________________________________________________________

procedure Tshoved_colour_form.colour_defaults_buttonClick(Sender: TObject);

begin
  default_shoved_tcol:=shoved_trackpad_colour_panel.Color;
  default_shoved_trackpad:=use_on_trackpad_checkbox.Checked;       // 226b
  default_shoved_bgnd:=also_bgnd_checkbox.Checked;                 // 226b

  if (shoved_trackpad_style_combo.ItemIndex>-1) and (shoved_trackpad_style_combo.ItemIndex<8)
     then default_shoved_tcol_infill:=shoved_trackpad_style_combo.ItemIndex;

  default_shoved_ocol:=shoved_output_colour_panel.Color;
  default_shoved_output:=use_on_output_checkbox.Checked;          // 226b
  default_shoved_export:=also_export_checkbox.Checked;            // 226b

  if (shoved_output_style_combo.ItemIndex>-1) and (shoved_output_style_combo.ItemIndex<8)
     then default_shoved_ocol_infill:=shoved_output_style_combo.ItemIndex;
end;
//______________________________________________________________________________

end.
