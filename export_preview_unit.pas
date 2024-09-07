
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

unit export_preview_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Texport_preview_form = class(TForm)
    preview_3d_edit: TEdit;
    preview_2d_edit: TEdit;
    ok_button: TButton;
    Label1: TLabel;
    Label2: TLabel;
    date_stamp_label: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    download_3d_button: TButton;
    download_2d_button: TButton;
    procedure FormCreate(Sender: TObject);
    procedure download_3d_buttonClick(Sender: TObject);
    procedure download_2d_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  export_preview_form: Texport_preview_form;

implementation

{$R *.lfm}

uses
  control_room;

//______________________________________________________________________________

procedure Texport_preview_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=980;
  ClientHeight:=650;
end;
//______________________________________________________________________________

procedure Texport_preview_form.download_3d_buttonClick(Sender: TObject);

begin
  go_to_url('https://www.3d-tool.com/en-cad-viewer-download.htm#freeviewer');
end;
//______________________________________________________________________________

procedure Texport_preview_form.download_2d_buttonClick(Sender: TObject);

begin
  go_to_url('https://inkscape.org/release/');
end;
//______________________________________________________________________________


end.
