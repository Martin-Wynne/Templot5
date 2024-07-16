
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

unit bitmap_viewer_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Math,
  StdCtrls, ExtCtrls, ComCtrls;

type
  Tbitmap_viewer_form = class(TForm)
    zoom_trackbar: TTrackBar;
    Label1: TLabel;
    close_panel: TPanel;
    close_button: TButton;
    dot_for_dot_checkbox: TCheckBox;
    Label2: TLabel;
    preview_scrollbox: TScrollBox;
    bitmap_image: TImage;
    Label3: TLabel;
    Label4: TLabel;
    print_panel: TPanel;
    print_button: TButton;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure zoom_trackbarChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dot_for_dot_checkboxClick(Sender: TObject);
    procedure close_panelClick(Sender: TObject);
    procedure print_panelClick(Sender: TObject);
    procedure preview_scrollboxMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure preview_scrollboxMouseUp(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X,Y:Integer);
    procedure preview_scrollboxMouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bitmap_viewer_form: Tbitmap_viewer_form;

  preview_image_aspect_ratio:extended=0.75;
  preview_image_default_height:integer=650;

  dot_for_dot_width:integer=4800;
  dot_for_dot_height:integer=7000;

implementation

{$R *.lfm}

var
  pos_down_x:integer=0;
  pos_down_y:integer=0;

  mouse_down_x:integer=0;
  mouse_down_y:integer=0;
  mouse_is_down:boolean=False;

//______________________________________________________________________________

procedure Tbitmap_viewer_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=600;
  ClientHeight:=728;
  AutoScroll:=False;

  DoubleBuffered:=True;
  preview_scrollbox.DoubleBuffered:=True;
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.FormResize(Sender: TObject);

begin
  preview_scrollbox.Height:=ClientHeight-preview_scrollbox.Top;
  preview_scrollbox.Width:=ClientWidth;

  close_panel.Left:=ClientWidth-100;
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.zoom_trackbarChange(Sender: TObject);

var
  zoom_power:extended;

begin
  zoom_power:=15-zoom_trackbar.Position;     // in reverse to fix mouse wheel direction

  bitmap_image.Height:=Round(preview_image_default_height*POWER(1.2,zoom_power));     // 1.2 arbitrary = +/-20% per step
  bitmap_image.Width:=Round(bitmap_image.Height*preview_image_aspect_ratio);
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.FormActivate(Sender: TObject);

begin
  if zoom_trackbar.Enabled=True then zoom_trackbar.SetFocus;  // for the mouse wheel
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.dot_for_dot_checkboxClick(Sender: TObject);

begin
  if dot_for_dot_checkbox.Tag=1 then EXIT;
  
  if dot_for_dot_checkbox.Checked
     then begin
            zoom_trackbar.Enabled:=False;
            bitmap_image.Height:=dot_for_dot_height;
            bitmap_image.Width:=dot_for_dot_width;
          end
     else begin
            zoom_trackbar.Enabled:=True;
            zoom_trackbar.SetFocus;  // for the mouse wheel
          end;
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.close_panelClick(Sender: TObject);

begin
  ModalResult:=mrNo;
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.print_panelClick(Sender: TObject);

begin
  ModalResult:=mryes;
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.preview_scrollboxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  mouse_down_x:=X;
  mouse_down_y:=Y;
  mouse_is_down:=True;

  pos_down_x:=preview_scrollbox.HorzScrollBar.Position;
  pos_down_y:=preview_scrollbox.VertScrollBar.Position;
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.preview_scrollboxMouseUp(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  mouse_is_down:=False;
  if zoom_trackbar.Enabled=True then zoom_trackbar.SetFocus;  // for the mouse wheel
end;
//______________________________________________________________________________

procedure Tbitmap_viewer_form.preview_scrollboxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

begin
  if mouse_is_down=True
     then begin
            preview_scrollbox.HorzScrollBar.Position:=pos_down_x+mouse_down_x-X;
            preview_scrollbox.VertScrollBar.Position:=pos_down_y+mouse_down_y-Y;
          end;
end;
//______________________________________________________________________________

end.
