
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

unit colour_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  Tcolour_form = class(TForm)
    colour_label: TLabel;
    font_dialog: TFontDialog;
    colour_dialog: TColorDialog;
    procedure FormCreate(Sender:TObject);
    procedure colour_dialogShow(Sender: TObject);
    procedure font_dialogShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  colour_form: Tcolour_form;

  colour_dialog_caption_str:string='';
  font_dialog_caption_str:string='';

  function get_colour(str:string; colour:TColor):TColor;                  //  get a new colour.
  function get_font(str:string; fon:TFont; more_colours:boolean):TFont;   //  get a new font.

//__________________________________________________________________________________________

implementation

{$BOOLEVAL ON}


{$R *.lfm}

uses
  pad_unit, alert_unit, control_room, math_unit;

//________________________________________________________________________________________

function get_colour(str:string; colour:TColor):TColor;     //  get a new colour.

begin
  with colour_form do begin
    Caption:='    Templot  colours ...';
    colour_label.Caption:='  '+str+' ...';
    colour_form.colour_dialog.Color:=colour;
    Show;
    BringToFront;

    colour_dialog_caption_str:=str;

    showing_dialog:=True;        // 212a Wine bug

    if colour_form.colour_dialog.Execute=True then RESULT:=colour_form.colour_dialog.Color
                                              else RESULT:=colour;

    showing_dialog:=False;

    Hide;
  end;//with
  show_and_redraw(True,False);    // no rollback.

end;
//_________________________________________________________________________________________

function get_font(str:string; fon:TFont; more_colours:boolean):TFont;    //  get a new font.

begin
    with colour_form do begin
      Caption:='    Templot  fonts  and  text  colours ...';
      colour_label.Caption:='  '+str+' ...';
      font_dialog.Font.Assign(fon);
      Show;
      BringToFront;

      font_dialog_caption_str:=str;

      showing_dialog:=True;   // 212a Wine bug

      if font_dialog.Execute=True then RESULT:=font_dialog.Font
                                  else begin
                                         showing_dialog:=False;

                                         RESULT:=fon;
                                         Hide;
                                         EXIT;
                                       end;

      showing_dialog:=False;

      Hide;
    end;//with

    if (no_extra_colours_msg_pref=False) and (more_colours=True) and (hi_color=True)
       then begin
              alert_box.preferences_checkbox.Checked:=False;
              alert_box.preferences_checkbox.Show;

              if alert(4,'    more  font  colours ...',
                           '||||Would you prefer a wider choice of colours for this font?',
                           '','','','','no  thanks','yes  please',0)=6
                  then RESULT.Color:=get_colour(str,RESULT.Color);

              no_extra_colours_msg_pref:=alert_box.preferences_checkbox.Checked;
              alert_box.preferences_checkbox.Hide;
            end;
end;
//______________________________________________________________________________

procedure Tcolour_form.FormCreate(Sender: TObject);

 // custom colours are set in colour_dialog properties

begin
  ClientWidth:=900;
  ClientHeight:=36;
  AutoScroll:=False;
end;
//______________________________________________________________________________

procedure Tcolour_form.colour_dialogShow(Sender: TObject);

var
  new_name_str:string;   // must be locals

begin
  new_name_str:='    '+colour_dialog_caption_str;

  if colour_dialog.Handle<>0
     then SetWindowText(colour_dialog.Handle,PChar(new_name_str));
end;
//______________________________________________________________________________

procedure Tcolour_form.font_dialogShow(Sender: TObject);

var
  new_name_str:string;   // must be locals

begin
  new_name_str:='    '+font_dialog_caption_str;

  if font_dialog.Handle<>0
     then SetWindowText(font_dialog.Handle,PChar(new_name_str));
end;
//______________________________________________________________________________

end.

