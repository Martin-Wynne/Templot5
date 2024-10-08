
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

unit print_now_box;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tprint_now_form = class(TForm)
    print_hint_label: TLabel;
    print_data_sent_label: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    more_info_button: TButton;
    dont_show_again_checkbox: TCheckBox;
    Label3: TLabel;
    datestamp_label: TLabel;
    procedure print_hint_labelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  print_now_form: Tprint_now_form;

implementation

uses pad_unit;

{$R *.lfm}

//______________________________________________________________________________

procedure Tprint_now_form.print_hint_labelClick(Sender: TObject);

begin
  pad_form.print_help_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tprint_now_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=470;
  ClientHeight:=240;
end;
//______________________________________________________________________________

end.
