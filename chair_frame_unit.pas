
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

   This file was derived from Templot2 version 244d

*)

unit chair_frame_unit;{$MODE Delphi}

{$ALIGN OFF}

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  Tchair_frame = class(TFrame)
    loose_checkbox0: TCheckBox;
    export_checkbox1: TCheckBox;
    export_checkbox2: TCheckBox;
    include_checkbox1: TCheckBox;
    include_checkbox0: TCheckBox;
    frame_label: TLabel;
    Label1: TLabel;
    include_checkbox2: TCheckBox;
    procedure include_checkbox0MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.lfm}

uses
  chairs_unit;

//______________________________________________________________________________

procedure Tchair_frame.include_checkbox0MouseDown(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  // all checkboxes ...

begin
  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

end.
