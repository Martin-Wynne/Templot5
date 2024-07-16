
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

unit lib_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  StdCtrls, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls;

type
  Tlib_form = class(TForm)
    hide_panel: TPanel;
    hide_button: TButton;
    lib_listbox: TListBox;
    datestamp_label: TLabel;
    empty_label: TLabel;
    group_to_library_button: TButton;
    store_control_button: TButton;
    lib_label: TLabel;
    count_label: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure hide_buttonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lib_listboxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure lib_listboxMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure store_control_buttonClick(Sender: TObject);
    procedure lib_listboxClick(Sender: TObject);
    procedure group_to_library_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  lib_form: Tlib_form;

implementation

{$R *.lfm}

uses
  pad_unit,keep_select,math_unit;


//______________________________________________________________________________

procedure Tlib_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(lib_form);

  AutoScroll:=False;
  
  ClientWidth:=200;
  ClientHeight:=696;

end;
//______________________________________________________________________________

procedure Tlib_form.hide_buttonClick(Sender: TObject);

begin
  Hide;
end;
//______________________________________________________________________________

procedure lib_resize;

begin
  with lib_form do begin

    hide_panel.Left:=Clientwidth-hide_panel.Width;
    hide_panel.Top:=ClientHeight-hide_panel.Height-datestamp_label.Height;

    store_control_button.Top:=hide_panel.Top-store_control_button.Height-datestamp_label.Height;

    group_to_library_button.Top:=store_control_button.Top-group_to_library_button.Height-datestamp_label.Height;

    lib_label.Top:=group_to_library_button.Top-lib_label.Height;

    count_label.Top:=hide_panel.Top;

    lib_listbox.Width:=ClientWidth;
    lib_listbox.Height:=lib_label.Top-datestamp_label.Height;

    lib_listbox.ItemHeight:=Round(lib_listbox.Width/2)+6+Canvas.TextHeight('A')*3 DIV 2;     // allow for spacing around bitmap + text below it

  end;//with

  current_state(-1);  // to update bitmaps
end;
//______________________________________________________________________________

procedure Tlib_form.FormResize(Sender: TObject);

begin
  lib_resize;
end;
//______________________________________________________________________________

procedure Tlib_form.FormShow(Sender: TObject);

begin
  lib_listbox.Visible:=(any_library>0);
end;
//______________________________________________________________________________

function create_rect(x1,y1,x2,y2:integer):TRect;

begin
  RESULT:=Rect(x1,y1,x2,y2);
end;
//______________________________________________________________________________

procedure Tlib_form.lib_listboxDrawItem(Control:TWinControl; Index:Integer; Rect:TRect; State:TOwnerDrawState);

var
  lib_rect,copy_rect,border_rect:TRect;
  lib_w,lib_h:integer;

begin
  with lib_listbox do begin

    lib_w:=Tlib_item(Items.Objects[Index]).bitmap.Width;
    lib_h:=Tlib_item(Items.Objects[Index]).bitmap.Height;

    with Canvas do begin
      Brush.Style:=bsSolid;
      Pen.Width:=1;

      if (odSelected in State)=True
         then Brush.Color:=$00FF8000   // soft blue
         else Brush.Color:=lib_listbox.Color;

      FillRect(create_rect(Rect.Left,Rect.Top,Rect.Right,Rect.Bottom));    //  this clears the item rectangle (old focus marks)

      lib_rect:=create_rect(0,0,lib_w,lib_h);

      copy_rect:=create_rect(Rect.Left+4, Rect.Top+4, Rect.Left+4+lib_w, Rect.Top+4+lib_h);
    border_rect:=create_rect(Rect.Left+3, Rect.Top+3, Rect.Left+6+lib_w, Rect.Top+6+lib_h);

      Brush.Color:=clWhite;

      if (odSelected in State)=True
         then Pen.Color:=$00FF8000   // soft blue
         else Pen.Color:=clGray;

      Pen.Style:=psSolid;

      Rectangle(border_rect);

      Brush.Color:=lib_listbox.Color;
      CopyMode:=cmSrcCopy;
      CopyRect(copy_rect,Tlib_item(Items.Objects[Index]).bitmap.Canvas,lib_rect);

      if (odSelected in State)=True
         then begin
                Brush.Color:=$00FF8000;   // soft blue
                Font.Color:=clWhite;
              end
         else begin
                Brush.Color:=lib_listbox.Color;
                Font.Color:=clBlack;
              end;

      TextOut(Rect.Left+12, Rect.Top+8+lib_h, Items.Strings[Index]);

      if (odFocused in State)=True then DrawFocusRect(Rect);   // repeat XOR to remove focus rectangle

    end;
  end;
end;
//______________________________________________________________________________

procedure Tlib_form.lib_listboxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);      // highlight on hover

var
  n:integer;
  lib_w,lib_h:integer;

begin
  with lib_listbox do begin

    for n:=0 to (Height DIV ItemHeight)-1 do begin

      lib_w:=Tlib_item(Items.Objects[0]).bitmap.Width;          // all same size
      lib_h:=Tlib_item(Items.Objects[0]).bitmap.Height;

      if (Y>ItemHeight*n+3) and (Y<ItemHeight*n+3+lib_h) and (X<lib_w+3)
         then begin
                if Canvas.Pixels[3,ItemHeight*n+3]=$00FF8000 then BREAK;  // already highlighted or selected

                Repaint; // remove previous highlighting

                Application.ProcessMessages;

                with Canvas do begin

                  Pen.Width:=2;
                  Pen.Color:=$00FF8000;   // soft blue

                  Brush.Style:=bsClear;

                  Rectangle(create_rect(3,ItemHeight*n+3,lib_w+6,ItemHeight*n+lib_h+6));

                end;//with

                BREAK;
              end;
    end;//next
  end;//with
end;
//______________________________________________________________________________

procedure Tlib_form.FormDeactivate(Sender: TObject);

begin
  if Showing=True then lib_listbox.Repaint;
end;
//______________________________________________________________________________

procedure Tlib_form.store_control_buttonClick(Sender: TObject);

begin
  if check_control_template_is_valid('store')=False then EXIT;  // zero length
  store_unused(True,False);       // library_template,control_template_on_save

  lib_form.lib_listbox.Visible:=(any_library>0);           // 227a
end;
//______________________________________________________________________________

procedure Tlib_form.lib_listboxClick(Sender: TObject);

var
  i:integer;
  new_notch_data:Tnotch;

begin
  with lib_listbox do begin
    i:=ItemIndex;
    if (i<0) or (i>(Items.Count-1)) then EXIT;

    list_position:=Tlib_item(Items.Objects[i]).list_index;
  end;//with

  cancel_adjusts(False);

  keep_form.copy_to_control_radiobutton.Checked:=True;

  copy_keep_to_current(False,False,True,False);    // on_reload, bgnd_options, name_options, mint_from

  gocalc(0,0);

  pad_form.notch_under_peg_menu_entry.Click;   // to get peg angle

    // move notch to screen centre, don't change angle ...

  with new_notch_data do begin
    notch_x:=zoom_offsetx+screenx/2;
    notch_y:=zoom_offsety+screeny/2;
    notch_k:=notch_angle;
  end;//with
  new_notch(new_notch_data,True);

  pad_form.shift_current_onto_notch_menu_entry.Click;

  pad_form.cycle_notch_menu_entry.Click;  // restore it..
  pad_form.cycle_notch_menu_entry.Click;

  show_and_redraw(True,True);   // in case curent hidden.
end;
//______________________________________________________________________________

procedure Tlib_form.group_to_library_buttonClick(Sender: TObject);

begin
  create_copied_group(True,False);     // library, unused

  lib_form.lib_listbox.Visible:=(any_library>0);           // 227a
end;
//______________________________________________________________________________

end.

