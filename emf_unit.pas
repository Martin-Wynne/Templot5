
(*
================================================================================

    This file is part of OpenTemplot2024, a computer program for the design of model railway track.
    Copyright (C) 2024  Martin Wynne and OpenTemplot contributors   email: martin@85a.uk

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

*)

unit emf_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, EditBtn, Messages;

type

  { Temf_form }

  Temf_form = class(TForm)
    ok_button: TButton;
    procedure ok_buttonClick(Sender: TObject);
  private

  public

  end;//class


  Temf=record                           // 555a       MW 12-AUG-2024
         emf_bytes:array of byte;       // emf in memory

         emf_width_100mm:double;        // frame size in 1/100ths mm
         emf_height_100mm:double;

         emf_width_dots:integer;
         emf_height_dots:integer;
       end;

  Temf_set=record
             emf_canvas:TCanvas;
             emf_DC:HDC;
             emf_width_dots:integer;
             emf_height_dots:integer;
             emf_valid:boolean;
           end;

var
  emf_form: Temf_form;

  emf_in_memory:Temf;

  function begin_mem_emf(dpi,width_dots,height_dots:integer):Temf_set;       // 555a  MW 14-AUG-2024

  function finish_play_emf(play_bitmap:TBitmap; emf_set:Temf_set):boolean;   // 555a  MW 15-AUG-2024

implementation

{$R *.lfm}

  { Temf_form }

uses
  math_unit, bitmap_viewer_unit;


//______________________________________________________________________________

procedure Temf_form.ok_buttonClick(Sender: TObject);

begin
  Close;
end;
//______________________________________________________________________________

function begin_mem_emf(dpi,width_dots,height_dots:integer):Temf_set;   // 555a  MW 14-AUG-2024

var
  horz_factor,vert_factor:double;
  ref_DC:HDC;
  emf_rect:TRect;

begin
  RESULT.emf_canvas:=TCanvas.Create;

  ref_DC:=GetDC(0);  // screen

  horz_factor:=GetDeviceCaps(ref_DC,HORZSIZE)*100/GetDeviceCaps(ref_DC,HORZRES);
  vert_factor:=GetDeviceCaps(ref_DC,VERTSIZE)*100/GetDeviceCaps(ref_DC,VERTRES);

  emf_rect:=Rect(0,0,Round(width_dots*horz_factor),Round(height_dots*vert_factor));      // 1/100ths mm

  RESULT.emf_DC:=CreateEnhMetaFile(ref_DC,nil,@emf_rect,nil);   // memory-based metafile

  ReleaseDC(0,ref_DC);

  if RESULT.emf_DC=0
     then begin
            RESULT.emf_canvas.Free;
            RESULT.emf_valid:=False;
            show_modal_message('Sorry, an error occurred in creating the EMF metafile.');
            EXIT;
        end;

  RESULT.emf_canvas.Handle:=RESULT.emf_DC;
  RESULT.emf_canvas.Font.PixelsPerInch:=dpi;
  RESULT.emf_width_dots:=width_dots;
  RESULT.emf_height_dots:=height_dots;
  RESULT.emf_valid:=True;
end;
//______________________________________________________________________________

function finish_play_emf(play_bitmap:TBitmap; emf_set:Temf_set):boolean;     // 555a  MW 15-AUG-2024

var
  closed_DC:HDC;

begin
  RESULT:=False;  // init

  with emf_set do begin

    if emf_valid=False then EXIT;  // ???

    closed_DC:=CloseEnhMetaFile(emf_DC);

    try
      if closed_DC=0
        then begin
               show_modal_message('Sorry, an error occurred in closing the EMF metafile.');
               EXIT;
             end;

      with play_bitmap do begin

        Width:=emf_width_dots;
        Height:=emf_height_dots;

        with Canvas do begin     // blank the picture area first...
          Brush.Color:=clWhite;
          Brush.Style:=bsSolid;
          FillRect(Rect(0,0,emf_width_dots,emf_height_dots));
        end;//with

        if PlayEnhMetaFile(Canvas.Handle, closed_DC, Rect(0,0,emf_width_dots,emf_height_dots))=False
           then begin
                  show_modal_message('Sorry, unable to display the EMF image.');
                  EXIT;
                end;

      end;//with

      RESULT:=True;

    finally
      DeleteEnhMetaFile(closed_DC);
      emf_canvas.Free;
    end;
  end;//with
end;
//______________________________________________________________________________


end.
