
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

unit search_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tsearch_form = class(TForm)
    search_terms_edit: TEdit;
    Label1: TLabel;
    google_button: TButton;
    full_button: TButton;
    club_database_button: TButton;
    Label2: TLabel;
    Label3: TLabel;
    go_to_club_button: TButton;
    companion_button: TButton;
    procedure FormCreate(Sender: TObject);
    procedure go_to_club_buttonClick(Sender: TObject);
    procedure google_buttonClick(Sender: TObject);
    procedure full_buttonClick(Sender: TObject);
    procedure club_database_buttonClick(Sender: TObject);
    procedure companion_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  search_form: Tsearch_form;

implementation

{$R *.lfm}

uses
  ShellAPI, control_room, pad_unit, alert_unit;

//______________________________________________________________________________  

procedure Tsearch_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=816;
  ClientHeight:=326;
end;
//______________________________________________________________________________

procedure Tsearch_form.go_to_club_buttonClick(Sender: TObject);

begin
  go_to_templot_club;
end;
//______________________________________________________________________________

procedure Tsearch_form.google_buttonClick(Sender: TObject);

var
  url_str:string;

begin
  url_str:='https://www.google.com/search?q='+search_terms_edit.Text+' site%3A85a.uk/templot/';

  if ShellExecute(0,'open',PChar(url_str),nil,nil,SW_SHOWNORMAL)<=32
     then begin
            alert(2,'    connection  failed',
                    'Sorry, unable to open your browser window and connect to the Google web site.',
                    '','','','','','continue',0);
          end;
end;
//______________________________________________________________________________

procedure Tsearch_form.full_buttonClick(Sender: TObject);

var
  url_str:string;

begin
  url_str:='https://85a.uk/templot/search/search.php?zoom_sort=0&zoom_xml=0&zoom_query='+search_terms_edit.Text+'&zoom_per_page=20&zoom_and=1';

  if ShellExecute(0,'open',PChar(url_str),nil,nil,SW_SHOWNORMAL)<=32
     then begin
            alert(2,'    connection  failed',
                    'Sorry, unable to open your browser window and connect to the Templot web site.',
                    '','','','','','continue',0);
          end;
end;
//______________________________________________________________________________

procedure Tsearch_form.club_database_buttonClick(Sender: TObject);

var
  url_str:string;

begin
  url_str:='https://85a.uk/templot/club/index.php?search/&q='+search_terms_edit.Text+'&o=date';

  if ShellExecute(0,'open',PChar(url_str),nil,nil,SW_SHOWNORMAL)<=32
     then begin
            alert(2,'    connection  failed',
                    'Sorry, unable to open your browser window and connect to the Templot web site.',
                    '','','','','','continue',0);
          end;
end;
//______________________________________________________________________________

procedure Tsearch_form.companion_buttonClick(Sender: TObject);

begin
  go_to_templot_companion;
end;
//______________________________________________________________________________

end.
