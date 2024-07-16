
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

unit slider_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tsliders_form = class(TForm)
    Label72: TLabel;
    slider2_edit: TEdit;
    slider3_edit: TEdit;
    slider4_edit: TEdit;
    slider5_edit: TEdit;
    slider1_edit: TEdit;
    datestamp_label: TLabel;
    ok_button: TButton;
    cancel_button: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sliders_form: Tsliders_form;

implementation

{$R *.lfm}

procedure Tsliders_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=400;
  ClientHeight:=124;

  AutoScroll:=False;
end;
//______________________________________________________________________________

end.
