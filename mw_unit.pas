
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

unit mw_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  Tmw_form = class(TForm)
    mw_image: TImage;
    procedure FormCreate(Sender: TObject);
    procedure mw_imageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mw_form: Tmw_form;

implementation

uses pad_unit;

{$R *.lfm}

//______________________________________________________________________________

procedure Tmw_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(mw_form);

  AutoScroll:=False;

  ClientWidth:=100;
  ClientHeight:=118;
end;
//______________________________________________________________________________

procedure Tmw_form.mw_imageClick(Sender: TObject);

begin
  mw_form.Hide;
end;
//______________________________________________________________________________

end.
