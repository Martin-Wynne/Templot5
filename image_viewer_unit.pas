
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

unit image_viewer_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ShellApi, Clipbrd,
  ExtCtrls, StdCtrls, Menus;

type
  Timage_viewer_form = class(TForm)
    viewer_image: TImage;
    menu_bar: TMainMenu;
    options_menu: TMenuItem;
    open_containing_folder_menu_entry: TMenuItem;
    copy_image_menu_entry: TMenuItem;
    close_menu_entry: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    copy_file_location_menu_entry: TMenuItem;
    N3: TMenuItem;
    copy_file_name_menu_entry: TMenuItem;
    use_your_viewer_menu_entry: TMenuItem;
    delete_image_menu_entry: TMenuItem;
    N4: TMenuItem;
    image_size_menu_entry: TMenuItem;
    N5: TMenuItem;
    datestamp_label: TLabel;
    ok_menu: TMenuItem;
    cancel_menu: TMenuItem;
    procedure open_containing_folder_menu_entryClick(Sender: TObject);
    procedure copy_image_menu_entryClick(Sender: TObject);
    procedure copy_file_location_menu_entryClick(Sender: TObject);
    procedure close_menu_entryClick(Sender: TObject);
    procedure copy_file_name_menu_entryClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure use_your_viewer_menu_entryClick(Sender: TObject);
    procedure delete_image_menu_entryClick(Sender: TObject);
    procedure options_menuClick(Sender: TObject);
    procedure image_size_menu_entryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ok_menuClick(Sender: TObject);
    procedure cancel_menuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  image_viewer_form: Timage_viewer_form;

  procedure show_an_image_file(file_str:string);

implementation

{$R *.lfm}

uses
  control_room, alert_unit, math_unit;

var
  image_file_str:string='';

//______________________________________________________________________________

procedure show_an_image_file(file_str:string);

begin
  try
    image_viewer_form.viewer_image.Picture.LoadFromFile(file_str);
  except
    show_modal_message('Sorry, unable to display the image.');
    EXIT;
  end;//try

  show_modal_message('The image will be displayed full size. You may need to scroll the viewer to see anything.');

  image_file_str:=file_str;

  image_viewer_form.Caption:='    image:  '+file_str;

  with image_viewer_form do begin

    cancel_menu.Visible:=False;  // used for scanned picture shapes
    options_menu.Visible:=True;  // hidden for scanned picture shapes

  end;//with

  do_show_modal(image_viewer_form);
end;
//______________________________________________________________________________

procedure Timage_viewer_form.open_containing_folder_menu_entryClick(Sender: TObject);

var
  folder_str:string;

begin
  folder_str:=ExtractFilePath(image_file_str);

  if ShellExecute(0,'explore',PChar(folder_str),nil,nil,SW_SHOWNORMAL)<=32
     then show_modal_message('Sorry, unable to open the folder.')
     else external_window_showing:=True;

end;
//______________________________________________________________________________

procedure Timage_viewer_form.copy_image_menu_entryClick(Sender: TObject);

begin
  try
    Clipboard.Assign(viewer_image.Picture.Graphic);
  except
    show_modal_message('Sorry, unable to copy this image to the Windows clipboard.');
    EXIT;
  end;

  show_modal_message('The image has been copied to the Windows clipboard.'
              +#13+#13+'It can now be pasted into any graphics program.');
end;
//______________________________________________________________________________

procedure Timage_viewer_form.copy_file_location_menu_entryClick(Sender:TObject);

begin
  Clipboard.AsText:=image_file_str;
end;
//______________________________________________________________________________

procedure Timage_viewer_form.close_menu_entryClick(Sender: TObject);

begin
  ModalResult:=mrCancel;
end;
//______________________________________________________________________________

procedure Timage_viewer_form.copy_file_name_menu_entryClick(Sender:TObject);

begin
  Clipboard.AsText:=ExtractFileName(image_file_str);
end;
//______________________________________________________________________________

procedure Timage_viewer_form.FormKeyPress(Sender:TObject; var Key:Char);

begin
  if Key=Chr(27)
     then begin
            Key:=Chr(0);
            ModalResult:=mrCancel;
          end;

end;
//______________________________________________________________________________

procedure Timage_viewer_form.use_your_viewer_menu_entryClick(Sender:TObject);

begin
  if ShellExecute(0,'open',PChar(image_file_str),nil,nil,SW_SHOWNORMAL)<=32
     then show_modal_message('Sorry, unable to display the image in your viewer.')
     else begin
            external_window_showing:=True;
            ModalResult:=mrCancel;
          end;
end;
//______________________________________________________________________________

procedure Timage_viewer_form.delete_image_menu_entryClick(Sender:TObject);

begin
  if alert(7,'      delete  image ?',
            'You are about to delete this image file.'
           +'||This can not be undone.',
             '','','','','cancel','delete  image',0)=5
     then EXIT;

  if DeleteFile(image_file_str)=False
     then show_modal_message('Sorry, unable to delete '+image_file_str)
     else ModalResult:=mrCancel;
end;
//______________________________________________________________________________

procedure Timage_viewer_form.options_menuClick(Sender:TObject);

begin
  image_size_menu_entry.Caption:='image  size :  '+IntToStr(viewer_image.Width)+' x '+IntToStr(viewer_image.Height);
end;
//______________________________________________________________________________

procedure Timage_viewer_form.image_size_menu_entryClick(Sender: TObject);

begin
  show_modal_message('This image is '+IntToStr(viewer_image.Width)+' x '+IntToStr(viewer_image.Height)+' pixels.');
end;
//______________________________________________________________________________

procedure Timage_viewer_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=1000;
  ClientHeight:=650;
  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Timage_viewer_form.ok_menuClick(Sender: TObject);

begin
  ModalResult:=mrOk;
end;
//______________________________________________________________________________

procedure Timage_viewer_form.cancel_menuClick(Sender: TObject);

begin
  ModalResult:=mrCancel;
end;
//______________________________________________________________________________

end.  
