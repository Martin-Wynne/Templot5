
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

================================================================================

  ResampleFilters: array[0..6] of record
    Name: string;	// Filter name
    Filter: TFilterProc;// Filter implementation
    Width: Single;	// Suggested sampling width/radius
  end = (
    (Name: 'Box';	Filter: BoxFilter;	Width: 0.5),
    (Name: 'Triangle';	Filter: TriangleFilter;	Width: 1.0),
    (Name: 'Hermite';	Filter: HermiteFilter;	Width: 1.0),
    (Name: 'Bell';	Filter: BellFilter;	Width: 1.5),
    (Name: 'B-Spline';	Filter: SplineFilter;	Width: 2.0),
    (Name: 'Lanczos3';	Filter: Lanczos3Filter;	Width: 3.0),
    (Name: 'Mitchell';	Filter: MitchellFilter;	Width: 2.0)
    );
*)


unit map_clarity_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type

  { Tmap_clarity_form }

  Tmap_clarity_form = class(TForm)
    go_button: TButton;
    Label1: TLabel;
    interpolation_panel: Tpanel;
    Label10: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    two_tone_panel: Tpanel;
    map_list_label: TLabel;
    map_name_listbox: TListBox;
    GroupBox4: TGroupBox;
    res_x2_radio: TRadioButton;
    res_x3_radio: TRadioButton;
    res_x4_radio: TRadioButton;
    GroupBox5: TGroupBox;
    triangle_radio: TRadioButton;
    mitchell_radio: TRadioButton;
    spline_radio: TRadioButton;
    threshold_trackbar: TTrackBar;
    threshold_panel: TPanel;
    threshold_label: TLabel;
    colour1_label: TLabel;
    high_colour_panel: TPanel;
    high_colour_button: TButton;
    colour2_label: TLabel;
    low_colour_panel: TPanel;
    low_colour_button: TButton;
    function_panel: Tpanel;
    datestamp_label: TLabel;
    undo_button: TButton;
    reset_button: TButton;
    selected_image_radio: TRadioButton;
    all_tiled_map_radio: TRadioButton;
    interpolation_only_radio: TRadioButton;
    two_tone_only_radio: TRadioButton;
    interpolation_first_radio: TRadioButton;
    two_tone_first_radio: TRadioButton;
    threshold_position_label: TLabel;
    low_contrast_radio: TRadioButton;
    negative_radio: TRadioButton;
    match_trackpad_colour_button: TButton;
    match_trackpad_grid_button: TButton;
    Label2: TLabel;
    bgnd_shapes_button: TButton;
    Label3: TLabel;
    Shape1: TShape;
    help_button: TButton;
    low_contrast_panel: Tpanel;
    black_radio: TRadioButton;
    dark_grey_radio: TRadioButton;
    medium_grey_radio: TRadioButton;
    light_grey_radio: TRadioButton;
    white_radio: TRadioButton;
    Label4: TLabel;
    progress_bar: TProgressBar;
    Label5: TLabel;
    Label6: TLabel;
    help_shape: TShape;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure high_colour_buttonClick(Sender: TObject);
    procedure low_colour_buttonClick(Sender: TObject);
    procedure threshold_trackbarChange(Sender: TObject);
    procedure threshold_trackbarEnter(Sender: TObject);
    procedure match_trackpad_colour_buttonClick(Sender: TObject);
    procedure bgnd_shapes_buttonClick(Sender: TObject);
    procedure go_buttonClick(Sender: TObject);
    procedure undo_buttonClick(Sender: TObject);
    procedure help_buttonClick(Sender: TObject);
    procedure match_trackpad_grid_buttonClick(Sender: TObject);
    procedure reset_buttonClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure map_name_listboxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  map_clarity_form: Tmap_clarity_form;

implementation

uses
  bgnd_unit, colour_unit, pad_unit, alert_unit, math_unit, {OT2024 resample,} control_room, wait_message;

{$R *.lfm}

//______________________________________________________________________________


procedure clear_rotated_bitmap(i:integer);  // 234e  if image has been modified, will need to recreate the rotated bitmap (done in print_unit)

begin
  with bgnd_form.bgnd_shapes_listbox.Items do begin

    if Count<1 then EXIT;   // ???

    if (i<0) or (i>Count-1) then EXIT;  // ???

    with Tbgshape(Objects[i]) do begin

      if bgnd_shape.shape_code<>-1 then EXIT;   // ???

      if bgnd_shape.picture_is_metafile=True then EXIT;  // ???

      if bgimage.image_shape.rotated_bitmap.Empty=True then EXIT;  // nothing to clear

      bgimage.image_shape.rotated_bitmap.Width:=0;      // clear it..
      bgimage.image_shape.rotated_bitmap.Height:=0;

    end;//with
  end;//with
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.FormShow(Sender: TObject);

var
  n:integer;
  list_str,found_str:string;

begin
      // fill list with existing maps ...

  map_name_listbox.Items.Clear;

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count<1 then EXIT;   // no shapes ???

    for n:=0 to Count-1 do begin

      if Pos('map::',Strings[n])=1
         then begin
                found_str:=Strings[n];
                list_str:=Trim(Copy(found_str,6,15));

                if map_name_listbox.Items.IndexOf(list_str)=-1
                   then map_name_listbox.Items.Add(list_str);

              end;
    end;//next
  end;//with

  if map_name_listbox.Items.Count>0 then map_name_listbox.ItemIndex:=0;  // select topmost

end;
//______________________________________________________________________________

procedure Tmap_clarity_form.FormCreate(Sender: TObject);

begin
  AutoScroll:=False;

  ClientWidth:=860;
  ClientHeight:=408;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.high_colour_buttonClick(Sender: TObject);

var
  colour:TColor;

begin
  colour:=high_colour_panel.Color;

    colour:=get_colour('choose  the  high  colour  for  2-tone  reduction',colour);

    high_colour_panel.Color:=colour;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.low_colour_buttonClick(Sender: TObject);

var
  colour:TColor;

begin
  colour:=low_colour_panel.Color;

    colour:=get_colour('choose  the  low  colour  for  2-tone  reduction',colour);

    low_colour_panel.Color:=colour;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.threshold_trackbarChange(Sender: TObject);

var
  canv:TControlCanvas;
  focus_rect:TRect;

  red,green,blue:integer;

begin
  canv:=TControlCanvas.Create;
  canv.Control:=threshold_trackbar;

  canv.pen.Color:=two_tone_panel.Color;
  canv.Brush.Style:=bsClear;

  focus_rect:=Rect(0,0,threshold_trackbar.Width,threshold_trackbar.Height);

  canv.Rectangle(focus_rect);   // remove it focus rectangle.

  canv.Free;


  threshold_position_label.Caption:=IntToStr(threshold_trackbar.Position);

  red:=threshold_trackbar.Position;
  green:=red;
  blue:=red;

  threshold_panel.Color:=(blue*$10000)+(green*$100)+red;

end;
//______________________________________________________________________________

procedure Tmap_clarity_form.threshold_trackbarEnter(Sender: TObject);

var
  canv:TControlCanvas;
  focus_rect:TRect;

begin
  canv:=TControlCanvas.Create;
  canv.Control:=threshold_trackbar;

  canv.pen.Color:=two_tone_panel.Color;
  canv.Brush.Style:=bsClear;

  focus_rect:=Rect(0,0,threshold_trackbar.Width,threshold_trackbar.Height);

  canv.Rectangle(focus_rect);   // remove it focus rectangle.

  canv.Free;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.match_trackpad_colour_buttonClick(Sender: TObject);

begin
  high_colour_panel.Color:=paper_colour;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.match_trackpad_grid_buttonClick(Sender: TObject);

begin
  low_colour_panel.Color:=grid_colour;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.bgnd_shapes_buttonClick(Sender: TObject);

begin
  selected_image_radio.Checked:=True;
  do_bgnd(False);                        // False = show new shape tab
end;
//______________________________________________________________________________

function make_negative_image(n:integer; alerts:boolean):boolean;

var
  inrow,incol,outrow,outcol:integer;

  inwidth,inheight:integer;

  pixel_colour:TColor;

  saved_screen_cursor:TCursor;

  meta_str:string;

begin
  RESULT:=False;  // init

  with bgnd_form.bgnd_shapes_listbox do begin
    with Items do begin

      if (Count<1) or (n<0) or (n>(Count-1)) then EXIT;

      with Tbgshape(Objects[n]) do begin

        if (bgnd_shape.shape_code<>-1)                // not a picture shape.
        or (bgnd_shape.shape_name=empty_picture_str)
        or (bgimage=nil)                              // no existing bitmap.
           then begin
                  show_modal_message('error: '+bgnd_shape.shape_name+' : no image content to convert'+#13+#13+'Select a picture shape in the list.');
                  EXIT;
                end;

        if alerts=True
           then begin

                  if alert(4,'    convert  to  negative  image ?',

                       'This function will convert the image in the selected picture shape:||'
                       +bgnd_shape.shape_name
                     +'||to a negative image.'
                     +'||This can be helpful when working over a background map so that it does not become too distracting and allows the track templates to be clearly seen.'
                     +'||This negative function can be reversed by repeating it.'
                     +'||On large images conversion may take some time to complete.'
                     +'||Do you want to proceed with the negative conversion?',
                      '','','','','cancel  conversion','yes  -  continue',0)=5 then EXIT;

                end;

             // first convert matafile to bitmap if necessary ...
(* OT2024
        if bgnd_shape.picture_is_metafile=True
           then begin
                  if alerts=True
                     then begin

                            if  (bgimage.image_shape.image_metafile.Width>4800)    // arbitrary
                            and (bgimage.image_shape.image_metafile.Height>3600)   // arbitrary
                                then meta_str:='||This picture shape is a large image. Conversion may be slow.'
                                else meta_str:='';


                            if alert(4,'    convert  metafile ?',
                                 'The selected picture shape||'
                                 +bgnd_shape.shape_name
                                +'||contains a metafile image (EMF file). Metafile (vector) images can be zoomed without becoming fuzzy, pixelated or blocky.'
                                +'||Converting this picture shape to a negative image will convert it to a conventional bitmap image (as in a scanned image).'
                                +'||Bitmap images can become fuzzy, pixelated or blocky when zoomed.'
                                +meta_str
                                +'||Do you want to proceed with the negative conversion?',
                                 '','','','','cancel  conversion','continue  -  convert  picture  shape',0)=5
                               then EXIT;
                          end;

                  try
                    with bgimage.image_shape do begin

                      image_bitmap.Width:=image_metafile.Width;
                      image_bitmap.Height:=image_metafile.Height;

                      with image_bitmap.Canvas do begin     // first blank the picture area...
                        Brush.Color:=clWhite;
                        Brush.Style:=bsSolid;
                        FillRect(Rect(0,0,image_bitmap.Width,image_bitmap.Height));

                        Draw(0,0,image_metafile);      // draw the metafile on it
                      end;//with

                    end;//with
                  except
                    show_modal_message('error - unable to convert matafile to bitmap');
                    EXIT;
                  end;//try

                  bgnd_shape.picture_is_metafile:=False;
                end;

*)

           // convert to 24-bit colour if necessary ...

        if bgimage.image_shape.image_bitmap.PixelFormat<>pf24bit
           then begin
                  try
                    bgimage.image_shape.image_bitmap.PixelFormat:=pf24bit;
                  except
                    show_modal_message('Sorry, unable to convert image: '+bgnd_shape.shape_name);
                    EXIT;
                  end;//try
                end;


        saved_screen_cursor:=Screen.Cursor;
        Screen.Cursor:=crHourglass;

        with bgimage.image_shape do begin

          if undo_bitmap=nil then undo_bitmap:=TBitmap.Create;

          undo_bitmap.Assign(image_bitmap);    // save for undo

          inwidth:=image_bitmap.Width;
          inheight:=image_bitmap.Height;

          map_clarity_form.progress_bar.Max:=inheight;
          map_clarity_form.progress_bar.Position:=0;

          for inrow:=0 to do_truncx(inheight-1) do begin
            for incol:=0 to do_truncx(inwidth-1) do begin
              pixel_colour:=image_bitmap.Canvas.Pixels[incol,inrow];

              pixel_colour:=pixel_colour XOR $00FFFFFF;    // negative image

              image_bitmap.Canvas.Pixels[incol,inrow]:=pixel_colour;

            end;//for

            map_clarity_form.progress_bar.Position:=inrow;
            Application.ProcessMessages;
          end;//for

        end;//with image

        Screen.Cursor:=saved_screen_cursor;
        map_clarity_form.progress_bar.Position:=0; // reset
        Application.ProcessMessages;

      end;//with shape
    end;//with items
  end;//with listbox

  RESULT:=True;

  clear_rotated_bitmap(n);   // 234e

  shapes_saved:=False;          // need a resave.
  shapes_current_state;
  redraw_pad(True,False);
end;
//______________________________________________________________________________

function make_low_contrast_image(n,shade_code:integer; alerts:boolean):boolean;

var
  m:integer;

  bias:integer;

  red,green,blue:integer;

  inrow,incol,outrow,outcol:integer;

  inwidth,inheight:integer;

  pixel_colour:TColor;

  saved_screen_cursor:TCursor;

  meta_str:string;

  new_shape:Tbgnd_shape;

begin
  RESULT:=False;  // init

  with bgnd_form.bgnd_shapes_listbox do begin

    with Items do begin

      if (Count<1) or (n<0) or (n>(Count-1)) then EXIT;

      with Tbgshape(Objects[n]) do begin

        if (bgnd_shape.shape_code<>-1)                // not a picture shape.
        or (bgnd_shape.shape_name=empty_picture_str)
        or (bgimage=nil)                              // no existing bitmap.
           then begin
                  show_modal_message('error: '+bgnd_shape.shape_name+' : no image content to convert'+#13+#13+'Select a picture shape in the list.');
                  EXIT;
                end;
      end;//with

      if alerts=True      // doing a selected image, make duplicate as backup...
         then begin
                with Tbgshape(Objects[n]) do begin

                  new_shape:=bgnd_shape;

                  new_shape.shape_name:='* '+bgnd_shape.shape_name;
                  new_shape.hide_bits:=bgnd_shape.hide_bits OR $01;       // toggle bit on, hide shape

                  m:=n;
                  InsertObject(n,new_shape.shape_name,Tbgshape.Create);   // inserted at lower index
                  n:=n+1;                                                 // first picture shape

                  Tbgshape(Objects[m]).bgnd_shape:=new_shape;             // put data in list.

                end;// with

                with Tbgshape(Objects[m]) do begin       // copy existing data

                  bgimage:=Tbgimage.Create;     // create new image.

                  with bgimage.image_shape do begin

                    image_bitmap:=TBitmap.Create;
                    rotated_bitmap:=TBitmap.Create;
(* OT2024
                    image_metafile:=TMetafile.Create;
                    rotated_metafile:=TMetafile.Create;

                    rotated_picture:=TPicture.Create;


                    image_bitmap.Assign(Tbgshape(Items.Objects[n]).bgimage.image_shape.image_bitmap);
                    rotated_bitmap.Assign(Tbgshape(Items.Objects[n]).bgimage.image_shape.rotated_bitmap);

                    image_metafile.Assign(Tbgshape(Items.Objects[n]).bgimage.image_shape.image_metafile);
                    rotated_metafile.Assign(Tbgshape(Items.Objects[n]).bgimage.image_shape.rotated_metafile);

                    rotated_picture.Assign(Tbgshape(Items.Objects[n]).bgimage.image_shape.rotated_picture);

*)
                  end;//with
                end;//with

                shapes_current_state;
              end;

      with Tbgshape(Objects[n]) do begin

             // first convert matafile to bitmap if necessary ...
(* OT2024
        if bgnd_shape.picture_is_metafile=True
           then begin
                  if alerts=True
                     then begin
                            if  (bgimage.image_shape.image_metafile.Width>4800)    // arbitrary
                            and (bgimage.image_shape.image_metafile.Height>3600)   // arbitrary
                                then meta_str:='||This picture shape is a large image. Conversion may be slow.'
                                else meta_str:='';

                            if alert(4,'    convert  metafile ?',
                                 'The selected picture shape||'
                                 +bgnd_shape.shape_name
                                +'||contains a metafile image (EMF file). Metafile (vector) images can be zoomed without becoming fuzzy, pixelated or blocky.'
                                +'||Converting this picture shape to low-contrast will convert it to a conventional bitmap image (as in a scanned image).'
                                +'||Bitmap images can become fuzzy, pixelated or blocky when zoomed.'
                                +meta_str
                                +'||Do you want to proceed with the low-contrast conversion?',
                                 '','','','','cancel  conversion','continue  -  convert  picture  shape',0)=5
                               then EXIT;
                          end;
                  try
                    with bgimage.image_shape do begin

                      image_bitmap.Width:=image_metafile.Width;
                      image_bitmap.Height:=image_metafile.Height;

                      with image_bitmap.Canvas do begin     // first blank the picture area...
                        Brush.Color:=clWhite;
                        Brush.Style:=bsSolid;
                        FillRect(Rect(0,0,image_bitmap.Width,image_bitmap.Height));

                        Draw(0,0,image_metafile);      // draw the metafile on it
                      end;//with

                    end;//with
                  except
                    show_modal_message('error - unable to convert matafile to bitmap');
                    EXIT;
                  end;//try

                  bgnd_shape.picture_is_metafile:=False;
                end;
*)

           // convert to 24-bit colour if necessary ...

        if bgimage.image_shape.image_bitmap.PixelFormat<>pf24bit
           then begin
                  try
                    bgimage.image_shape.image_bitmap.PixelFormat:=pf24bit;
                  except
                    show_modal_message('Sorry, unable to convert image: '+bgnd_shape.shape_name);
                    EXIT;
                  end;//try
                end;


        saved_screen_cursor:=Screen.Cursor;
        Screen.Cursor:=crHourglass;

        with bgimage.image_shape do begin

          if undo_bitmap=nil then undo_bitmap:=TBitmap.Create;

          undo_bitmap.Assign(image_bitmap);    // save for undo

          inwidth:=image_bitmap.Width;
          inheight:=image_bitmap.Height;

          map_clarity_form.progress_bar.Max:=inheight;
          map_clarity_form.progress_bar.Position:=0;

          for inrow:=0 to do_truncx(inheight-1) do begin
            for incol:=0 to do_truncx(inwidth-1) do begin
              pixel_colour:=image_bitmap.Canvas.Pixels[incol,inrow];

                // extract colours ...

              red:=(pixel_colour AND $000000FF);
              green:=(pixel_colour AND $0000FF00) div $100;
              blue:=(pixel_colour AND $00FF0000) div $10000;

              case shade_code of

                1: bias:=0;    // black

                2: bias:=41;   // dark grey

                3: bias:=84;   // medium grey

                4: bias:=127;  // light grey

                5: bias:=170;  // white

                else bias:=0;  // keep compiler happy

              end;//case

              red:=bias+(red DIV 3);       // 3 arbitrary  = 0..85
              green:=bias+(green DIV 3);
              blue:=bias+(blue DIV 3);

              if red>255 then red:=255;
              if green>255 then green:=255;
              if blue>255 then blue:=255;

              pixel_colour:=(blue*$10000)+(green*$100)+red;

              image_bitmap.Canvas.Pixels[incol,inrow]:=pixel_colour;

            end;//for

            map_clarity_form.progress_bar.Position:=inrow;
            Application.ProcessMessages;
          end;//for

        end;//with image

        Screen.Cursor:=saved_screen_cursor;
        map_clarity_form.progress_bar.Position:=0; // reset
        Application.ProcessMessages;

      end;//with shape
    end;//with items
  end;//with listbox

  RESULT:=True;

  clear_rotated_bitmap(n);   // 234e

  shapes_saved:=False;          // need a resave.
  shapes_current_state;
  redraw_pad(True,False);
end;
//______________________________________________________________________________

function make_2_tone_image(n,threshold:integer; hi_colour,lo_colour:TColor; alerts:boolean):boolean;

var
  inrow,incol,outrow,outcol:integer;

  inwidth,inheight:integer;

  red,green,blue,grey:integer;

  pixel_colour:TColor;

  saved_screen_cursor:TCursor;

  meta_str:string;

begin
  RESULT:=False;  // init

  with bgnd_form.bgnd_shapes_listbox do begin
    with Items do begin

      if (Count<1) or (n<0) or (n>(Count-1)) then EXIT;

      with Tbgshape(Objects[n]) do begin

        if (bgnd_shape.shape_code<>-1)                // not a picture shape.
        or (bgnd_shape.shape_name=empty_picture_str)
        or (bgimage=nil)                              // no existing bitmap.
           then begin
                  show_modal_message('error: '+bgnd_shape.shape_name+' : no image content to convert'+#13+#13+'Select a picture shape in the list.');
                  EXIT;
                end;

        if alerts=True
           then begin

                  if alert(4,'    convert  to  2-tone  image ?',

                       'This function will convert the image in the selected picture shape:||'
                       +bgnd_shape.shape_name
                     +'||to a 2-tone image.'
                     +'||This can be helpful when working over a background map so that the map features can be clearly seen.'
                     +'||On large images conversion may take some time to complete.'
                     +'||Do you want to proceed with the 2-tone conversion?',
                      '','','','','cancel  conversion','yes  -  continue',0)=5 then EXIT;

                end;

             // first convert matafile to bitmap if necessary ...
(* OT2024
        if bgnd_shape.picture_is_metafile=True
           then begin
                  if alerts=True
                     then begin

                            if  (bgimage.image_shape.image_metafile.Width>4800)    // arbitrary
                            and (bgimage.image_shape.image_metafile.Height>3600)   // arbitrary
                                then meta_str:='||This picture shape is a large image. Conversion may be slow.'
                                else meta_str:='';

                            if alert(4,'    convert  metafile ?',
                                 'The selected picture shape||'
                                 +bgnd_shape.shape_name
                                +'||contains a metafile image (EMF file). Metafile (vector) images can be zoomed without becoming fuzzy, pixelated or blocky.'
                                +'||Converting this picture shape to a 2-tone image will convert it to a conventional bitmap image (as in a scanned image).'
                                +'||Bitmap images can become fuzzy, pixelated or blocky when zoomed.'
                                +meta_str
                                +'||Do you want to proceed with the 2-tone conversion?',
                                 '','','','','cancel  conversion','continue  -  convert  picture  shape',0)=5
                               then EXIT;
                          end;

                  try
                    with bgimage.image_shape do begin

                      image_bitmap.Width:=image_metafile.Width;
                      image_bitmap.Height:=image_metafile.Height;

                      with image_bitmap.Canvas do begin     // first blank the picture area...
                        Brush.Color:=clWhite;
                        Brush.Style:=bsSolid;
                        FillRect(Rect(0,0,image_bitmap.Width,image_bitmap.Height));

                        Draw(0,0,image_metafile);      // draw the metafile on it
                      end;//with

                    end;//with
                  except
                    show_modal_message('error - unable to convert matafile to bitmap');
                    EXIT;
                  end;//try

                  bgnd_shape.picture_is_metafile:=False;
                end;

*)

           // convert to 24-bit colour if necessary ...

        if bgimage.image_shape.image_bitmap.PixelFormat<>pf24bit
           then begin
                  try
                    bgimage.image_shape.image_bitmap.PixelFormat:=pf24bit;
                  except
                    show_modal_message('Sorry, unable to convert image: '+bgnd_shape.shape_name);
                    EXIT;
                  end;//try
                end;


        saved_screen_cursor:=Screen.Cursor;
        Screen.Cursor:=crHourglass;

        with bgimage.image_shape do begin

          if undo_bitmap=nil then undo_bitmap:=TBitmap.Create;

          undo_bitmap.Assign(image_bitmap);    // save for undo

          inwidth:=image_bitmap.Width;
          inheight:=image_bitmap.Height;

          map_clarity_form.progress_bar.Max:=inheight;
          map_clarity_form.progress_bar.Position:=0;

          for inrow:=0 to do_truncx(inheight-1) do begin
            for incol:=0 to do_truncx(inwidth-1) do begin
              pixel_colour:=image_bitmap.Canvas.Pixels[incol,inrow];

                              // extract colours ...

              red:=(pixel_colour AND $000000FF);
              green:=(pixel_colour AND $0000FF00) div $100;
              blue:=(pixel_colour AND $00FF0000) div $10000;

              grey:=(red+green+blue) DIV 3;

              if grey<threshold
                 then image_bitmap.Canvas.Pixels[incol,inrow]:=lo_colour
                 else image_bitmap.Canvas.Pixels[incol,inrow]:=hi_colour;

            end;//for

            map_clarity_form.progress_bar.Position:=inrow;
            Application.ProcessMessages;
          end;//for

        end;//with image

        Screen.Cursor:=saved_screen_cursor;
        map_clarity_form.progress_bar.Position:=0; // reset
        Application.ProcessMessages;

      end;//with shape
    end;//with items
  end;//with listbox

  RESULT:=True;

  clear_rotated_bitmap(n);   // 234e

  shapes_saved:=False;          // need a resave.
  shapes_current_state;
  redraw_pad(True,False);
end;
//______________________________________________________________________________

function make_interpolated_image(n,filter_index,zoom_size:integer; alerts:boolean):boolean;

var
  new_bmp:TBitmap;
  meta_str:string;

begin
  RESULT:=False;  // init

  with bgnd_form.bgnd_shapes_listbox do begin
    with Items do begin

      if (Count<1) or (n<0) or (n>(Count-1)) then EXIT;

      with Tbgshape(Objects[n]) do begin

        if (bgnd_shape.shape_code<>-1)                // not a picture shape.
        or (bgnd_shape.shape_name=empty_picture_str)
        or (bgimage=nil)                              // no existing bitmap.
           then begin
                  show_modal_message('error: '+bgnd_shape.shape_name+' : no image content to convert'+#13+#13+'Select a picture shape in the list.');
                  EXIT;
                end;

            // first convert matafile to bitmap if necessary ...
(* OT2024

        if bgnd_shape.picture_is_metafile=True
           then begin
                  if alerts=True
                     then begin

                            if  (bgimage.image_shape.image_metafile.Width>4800)    // arbitrary
                            and (bgimage.image_shape.image_metafile.Height>3600)   // arbitrary
                                then meta_str:='||This picture shape is a large image. Conversion may be slow.'
                                else meta_str:='';

                            if alert(4,'    convert  metafile ?',
                                 'The selected picture shape||'
                                 +bgnd_shape.shape_name
                                +'||contains a metafile image (EMF file). Metafile (vector) images can be zoomed without becoming fuzzy, pixelated or blocky.'
                                +'||Converting this picture shape to a 2-tone image will convert it to a conventional bitmap image (as in a scanned image).'
                                +'||Bitmap images can become fuzzy, pixelated or blocky when zoomed.'
                                +meta_str
                                +'||Do you want to proceed with the 2-tone conversion?',
                                 '','','','','cancel  conversion','continue  -  convert  picture  shape',0)=5
                               then EXIT;
                          end;

                  try
                    with bgimage.image_shape do begin

                      image_bitmap.Width:=image_metafile.Width;
                      image_bitmap.Height:=image_metafile.Height;

                      with image_bitmap.Canvas do begin     // first blank the picture area...
                        Brush.Color:=clWhite;
                        Brush.Style:=bsSolid;
                        FillRect(Rect(0,0,image_bitmap.Width,image_bitmap.Height));

                        Draw(0,0,image_metafile);      // draw the metafile on it
                      end;//with

                    end;//with
                  except
                    show_modal_message('error - unable to convert matafile to bitmap');
                    EXIT;
                  end;//try

                  bgnd_shape.picture_is_metafile:=False;
                end;

*)

           // convert to 24-bit colour if necessary ...

        if bgimage.image_shape.image_bitmap.PixelFormat<>pf24bit
           then begin
                  try
                    bgimage.image_shape.image_bitmap.PixelFormat:=pf24bit;
                  except
                    show_modal_message('Sorry, unable to convert image: '+bgnd_shape.shape_name);
                    EXIT;
                  end;//try
                end;

        with bgimage.image_shape do begin

          if undo_bitmap=nil then undo_bitmap:=TBitmap.Create;

          undo_bitmap.Assign(image_bitmap);    // save for undo

          new_bmp:=TBitmap.Create;

          new_bmp.Width:=zoom_size;
          new_bmp.Height:=zoom_size;

          if (new_bmp.Width<image_bitmap.Width) or (new_bmp.Height<image_bitmap.Height)
          then begin
                 showmessage('error: downscaling not supported: '+IntToStr(image_bitmap.Width)+'x'+IntToStr(image_bitmap.Height)+' > '+IntToStr(new_bmp.Width)+'x'+IntToStr(new_bmp.Height));
                 new_bmp.Free;
                 EXIT;
               end;

// OT2024          stretch_bitmap(image_bitmap,new_bmp,ResampleFilters[filter_index].Filter, ResampleFilters[filter_index].Width);     // also steps the progress bar

          image_bitmap.Assign(new_bmp);   // replace the shape image

          image_width:=new_bmp.Width;     // update the shape info
          image_height:=new_bmp.Height;

          new_bmp.Free;
        end;//with

      end;//with shape
    end;//with items
  end;//with listbox

  map_clarity_form.progress_bar.Position:=0; // reset
  Application.ProcessMessages;

  RESULT:=True;

  clear_rotated_bitmap(n);   // 234e

  shapes_saved:=False;          // need a resave.
  shapes_current_state;
  redraw_pad(True,False);
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.go_buttonClick(Sender: TObject);

var
  n:integer;
  all:boolean;
                ////////////////////////////////////////////////////////////////

                function find_map:string;

                var
                  n:integer;

                begin
                  with map_name_listbox do begin
                    n:=ItemIndex;
                    if (n<0) or (n>(Items.Count-1))
                       then begin
                              RESULT:='';
                              show_modal_message('error: select a map in the list of tiled maps');
                            end
                       else RESULT:=Items.Strings[n];
                  end;//with
                end;
                ////////////////////////////////////////////////////////////////

                procedure do_interpolation;

                  //option_bits:byte;   // msb  map tile, has_been_interpolated , has_been_2_toned , has_been_low_contrast , has_been_negative ,     , pre_227a , don't allow sync    lsb
                  //                              $80         $40                    $20                 $10                      $08            $04       $02       $01

                var
                  n:integer;
                  map_str,map_list_str:string;

                  filter,zoom:integer;

                begin
                  zoom:=512;                                     // 2*256
                  if res_x3_radio.Checked=True then zoom:=768;   // 3*256
                  if res_x4_radio.Checked=True then zoom:=1024;  // 4*256

                  filter:=1;                                      // Triangle
                  if mitchell_radio.Checked=True then filter:=6;  // Mitchell
                  if spline_radio.Checked=True then filter:=4;    // B-Spline


                  if selected_image_radio.Checked=True
                     then begin
                            if bgnd_form.bgnd_shapes_listbox.Items.Count<1 then EXIT;  // no shapes

                            n:=bgnd_form.bgnd_shapes_listbox.ItemIndex;
                            if n<0 then EXIT;                             // no shape selected

                            with Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[n]) do begin

                              if  (bgnd_shape.shape_code=-1)              // a picture shape
                              and (bgimage<>nil)                          // bitmap exists
                              and ((bgnd_shape.option_bits AND $80)<>0)   // msb=1  a tile
                              and ((bgnd_shape.option_bits AND $40)=0)    // not previously done
                                  then begin
                                         make_interpolated_image(n,filter,zoom,True);            // True = show alerts
                                         bgnd_shape.option_bits:=bgnd_shape.option_bits OR $40;  // mark as done
                                       end
                                  else EXIT;

                            end;//with
                          end
                     else begin
                            map_list_str:=find_map;
                            if map_list_str='' then EXIT;

                            with bgnd_form.bgnd_shapes_listbox.Items do begin
                              if Count<1 then EXIT;                              // no shapes ???


                              wait_form.cancel_button.Visible:=False;
                              wait_form.wait_progressbar.Max:=Count;
                              wait_form.wait_progressbar.Min:=0;
                              wait_form.wait_progressbar.Position:=0;
                              wait_form.wait_progressbar.Step:=1;
                              wait_form.wait_progressbar.Visible:=True;

                              wait_form.waiting_label.Caption:='converting  image           ...';
                              wait_form.waiting_label.Width:=wait_form.Canvas.TextWidth(wait_form.waiting_label.Caption);  // 205b bug fix for Wine

                              wait_form.Show;

                              Application.ProcessMessages;  // allow some repaints before we start.

                              Screen.Cursor:=crHourglass;

                              for n:=0 to Count-1 do begin

                                wait_form.waiting_label.Caption:='converting  image  '+IntToStr(n+1)+' ...';
                                wait_form.wait_progressbar.StepIt;
                                Application.ProcessMessages;

                                with Tbgshape(Objects[n]).bgnd_shape do begin

                                  map_str:=Copy(shape_name,1,22);   // map::Bewdleyabcdefgh0T

                                  if POS(map_list_str,map_str)>0                // this map?
                                     then if check_if_tile(n,map_str)=True      // a tile?
                                             then if (option_bits AND $40)=0    // not previously done ?
                                                     then begin
// OT2024                                                   make_interpolated_image(n,filter,zoom,False);  // False = no alerts
                                                            option_bits:=option_bits OR $40;               // mark as done
                                                            redraw(False);                                 // show the change
                                                          end;
                                end;//with
                              end;//next

                              Screen.Cursor:=crDefault;

                              wait_form.wait_progressbar.Visible:=False;
                              wait_form.Hide;

                            end;//with
                          end;

                end;
                ////////////////////////////////////////////////////////////////

                procedure do_two_tone;

                                  //option_bits:byte;   // msb  map tile, has_been_interpolated , has_been_2_toned , has_been_low_contrast , has_been_negative ,     , pre_227a , don't allow sync    lsb
                                  //                              $80         $40                    $20                 $10                      $08            $04       $02       $01
                var
                  n:integer;
                  map_str,map_list_str:string;

                begin
                  if selected_image_radio.Checked=True
                     then make_2_tone_image(bgnd_form.bgnd_shapes_listbox.ItemIndex,threshold_trackbar.Position,high_colour_panel.Color,low_colour_panel.Color,True) // True = show alerts
                     else begin
                            map_list_str:=find_map;
                            if map_list_str='' then EXIT;

                            with bgnd_form.bgnd_shapes_listbox.Items do begin
                              if Count<1 then EXIT;                              // no shapes ???

                              for n:=0 to Count-1 do begin

                                with Tbgshape(Objects[n]).bgnd_shape do begin

                                  map_str:=Copy(shape_name,1,22);   // map::Bewdleyabcdefgh0T

                                  if POS(map_list_str,map_str)>0                // this map?
                                     then if check_if_tile(n,map_str)=True      // a tile?
                                             then if (option_bits AND $20)=0    // not previously done ?
                                                     then begin
                                                            make_2_tone_image(n,threshold_trackbar.Position,high_colour_panel.Color,low_colour_panel.Color,False);     // False = no alerts
                                                            option_bits:=option_bits OR $20;  // mark as done
                                                            redraw(False);                    // show the change
                                                          end;
                                end;//with
                              end;//next

                            end;//with
                          end;

                end;
                ////////////////////////////////////////////////////////////////

                procedure do_low_contrast;


                  //option_bits:byte;   // msb  map tile, has_been_interpolated , has_been_2_toned , has_been_low_contrast , has_been_negative ,     , pre_227a , don't allow sync    lsb
                                        //        $80         $40                    $20                 $10                      $08            $04       $02       $01

                var
                  n,grey_code:integer;
                  map_str,map_list_str:string;

                begin
                  grey_code:=0;  // keep compiler happy

                  if black_radio.Checked=True then grey_code:=1;       // black

                  if dark_grey_radio.Checked=True then grey_code:=2;   // dark grey

                  if medium_grey_radio.Checked=True then grey_code:=3; // medium grey

                  if light_grey_radio.Checked=True then grey_code:=4;  // light grey

                  if white_radio.Checked=True then grey_code:=5;       // white

                  if selected_image_radio.Checked=True
                     then make_low_contrast_image(bgnd_form.bgnd_shapes_listbox.ItemIndex,grey_code,True)  // True = show alerts
                     else begin
                            map_list_str:=find_map;
                            if map_list_str='' then EXIT;

                            with bgnd_form.bgnd_shapes_listbox.Items do begin
                              if Count<1 then EXIT;                              // no shapes ???

                              for n:=0 to Count-1 do begin

                                with Tbgshape(Objects[n]).bgnd_shape do begin

                                  map_str:=Copy(shape_name,1,22);   // map::Bewdleyabcdefgh0T

                                  if POS(map_list_str,map_str)>0                // this map?
                                     then if check_if_tile(n,map_str)=True      // a tile?
                                             then if (option_bits AND $10)=0    // not previously done ?
                                                     then begin
                                                            make_low_contrast_image(n,grey_code,False); // False = no alerts
                                                            option_bits:=option_bits OR $10;            // mark as done
                                                            redraw(False);                              // show the change
                                                          end;
                                end;//with
                              end;//next

                            end;//with
                          end;

                end;
                ////////////////////////////////////////////////////////////////

                procedure do_negative;

                  //option_bits:byte;   // msb  map tile, has_been_interpolated , has_been_2_toned , has_been_low_contrast , has_been_negative ,     , pre_227a , don't allow sync    lsb
                                        //        $80         $40                    $20                 $10                      $08            $04       $02       $01


                var
                  n:integer;
                  map_str,map_list_str:string;

                begin

                  if selected_image_radio.Checked=True
                     then make_negative_image(bgnd_form.bgnd_shapes_listbox.ItemIndex,True)  // True = show alerts
                     else begin
                            map_list_str:=find_map;
                            if map_list_str='' then EXIT;

                            with bgnd_form.bgnd_shapes_listbox.Items do begin
                              if Count<1 then EXIT;                              // no shapes ???

                              for n:=0 to Count-1 do begin

                                with Tbgshape(Objects[n]).bgnd_shape do begin

                                  map_str:=Copy(shape_name,1,22);   // map::Bewdleyabcdefgh0T

                                  if POS(map_list_str,map_str)>0                // this map?
                                     then if check_if_tile(n,map_str)=True      // a tile?
                                             then if (option_bits AND $08)=0    // not previously done ?
                                                     then begin
                                                            make_negative_image(n,False);     // False = no alerts
                                                            option_bits:=option_bits OR $08;  // mark as done
                                                            redraw(False);                    // show the change
                                                          end;
                                end;//with
                              end;//next

                            end;//with
                          end;

                end;
                ////////////////////////////////////////////////////////////////

begin
  if interpolation_only_radio.Checked=True
     then do_interpolation;

  if two_tone_only_radio.Checked=True
     then do_two_tone;

  if interpolation_first_radio.Checked=True
     then begin
            do_interpolation;
            do_two_tone;
          end;

  if two_tone_first_radio.Checked=True
     then begin
            do_two_tone;
            do_interpolation;
          end;

  if low_contrast_radio.Checked=True
     then do_low_contrast;

  if negative_radio.Checked=True
     then do_negative;

end;
//______________________________________________________________________________

procedure Tmap_clarity_form.undo_buttonClick(Sender: TObject);

var
  n:integer;
  map_list_str,map_str:string;
  bits:byte;

begin
  if selected_image_radio.Checked=True
     then begin
            with bgnd_form.bgnd_shapes_listbox do begin

              n:=ItemIndex;

              if (Items.Count<1) or (n<0) or (n>(Items.Count-1)) then EXIT;

              with Tbgshape(Items.Objects[n]) do begin

                if (bgnd_shape.shape_code<>-1)                // not a picture shape.
                or (bgnd_shape.shape_name=empty_picture_str)
                or (bgimage=nil)                              // no existing bitmap.
                   then begin
                          show_modal_message('error: '+bgnd_shape.shape_name+' : not a picture shape image'+#13+#13+'Select a picture shape in the list.');
                          EXIT;
                        end;

                if bgimage.image_shape.undo_bitmap=nil    // no undo bitmap
                   then begin
                          show_modal_message('error: '+bgnd_shape.shape_name+' : no undo information'+#13+#13+'Select a picture shape which has been converted.');
                          EXIT;
                        end;

                bgimage.image_shape.image_bitmap.Assign(bgimage.image_shape.undo_bitmap);    // restore

              end;//with shape
            end;//with list

          end
     else begin
            //option_bits:byte;   // msb  map tile, has_been_interpolated , has_been_2_toned , has_been_low_contrast , has_been_negative ,          ,  pre_227a   , don't allow sync    lsb
                                  //      $80  7F    $40   BF               $20   DF            $10     EF               $08  F7          $04  FB      $02  FD       $01  FE

            // assume radio unchanged...

            bits:=$FF;   // keep compiler happy

            if interpolation_only_radio.Checked=True
               then bits:=$BF;

            if two_tone_only_radio.Checked=True
               then bits:=$DF;

            if interpolation_first_radio.Checked=True
               then bits:=$9F;

            if two_tone_first_radio.Checked=True
               then bits:=$9F;

            if low_contrast_radio.Checked=True
               then bits:=$EF;

            if negative_radio.Checked=True
               then bits:=$F7;

            with map_name_listbox do begin
              n:=ItemIndex;
              if (n<0) or (n>(Items.Count-1))
                 then begin
                        show_modal_message('error: select a converted map in the list of tiled maps');
                        EXIT;
                      end;
              map_list_str:=Items.Strings[n];
            end;//with

            with bgnd_form.bgnd_shapes_listbox.Items do begin
              if Count<1 then EXIT;                              // no shapes ???

              for n:=0 to Count-1 do begin

                with Tbgshape(Objects[n]) do begin

                  if (bgnd_shape.shape_code<>-1)                // not a picture shape.
                  or (bgnd_shape.shape_name=empty_picture_str)
                  or (bgimage=nil)                              // no existing bitmap.
                     then CONTINUE;

                  map_str:=Copy(bgnd_shape.shape_name,1,22);   // map::Bewdleyabcdefgh0T

                  if POS(map_list_str,map_str)>0                           // this map?
                     then if check_if_tile(n,map_str)=True                 // a tile?
                             then if bgimage.image_shape.undo_bitmap<>nil  // undo bitmap
                                     then begin
                                            bgimage.image_shape.image_bitmap.Assign(bgimage.image_shape.undo_bitmap);    // restore
                                            bgnd_shape.option_bits:=bgnd_shape.option_bits AND bits;      // mark no longer done   (assume radio unchanged)
                                            redraw(False);                                                // show the change
                                           end;
                end;//with shape
              end;//next shape
            end;//with list

          end;

  shapes_saved:=False;          // need a resave
  shapes_current_state;
  redraw_pad(True,False);
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.help_buttonClick(Sender: TObject);

begin
  go_to_templot_companion_page('map_clarity.php');
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.reset_buttonClick(Sender: TObject);

begin
  res_x3_radio.Checked:=True;
  triangle_radio.Checked:=True;
  medium_grey_radio.Checked:=True;
  interpolation_first_radio.Checked:=True;
  threshold_trackbar.Position:=160;
  selected_image_radio.Checked:=True;
  high_colour_panel.Color:=$00D0E8F8;
  low_colour_panel.Color:=$007088A0;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.Label2Click(Sender: TObject);

begin
  selected_image_radio.Checked:=True;
end;
//______________________________________________________________________________

procedure Tmap_clarity_form.map_name_listboxClick(Sender: TObject);

begin
  all_tiled_map_radio.Checked:=True;
end;
//______________________________________________________________________________

end.   
