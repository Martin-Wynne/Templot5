
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

   This file was saved from Lazarus3.4

   This file was derived from Templot2 version 245a

*)

(*
"""
================================================================================
	Changes applied
================================================================================
	SC 12-SEP-2024 556
		Add draw chair outlines option.
		Add draw chair labels option.
		Add omit S1 chair labels option.
	sc 12-sep-2024 556.


 SC 22-SEP-2024 556
  print_chair_label_font
 sc 22-sep-2024 556.

 SC 29-SEP-2024 556
  fix SC background chair outline bug
 sc 29-sep-2024 556
================================================================================
"""
*)


unit pdf_laz_unit;

{$MODE Delphi}

{$ALIGN OFF}

   // create EMF page metafiles for external PDF creator

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type

  { Tpdf_laz_form }

  Tpdf_laz_form = class(TForm)
    page_panel: TPanel;
    blue_corner_panel: TPanel;
    how_panel: TPanel;
    size_updown: TUpDown;
    colour_panel: TPanel;
    colour_patch: TImage;
    datestamp_label: TLabel;
    omit_all_panel: TPanel;
    omit_all_button: TButton;
    all_panel: TPanel;
    all_button: TButton;
    next_row_button: TButton;
    omit_panel: TPanel;
    print_panel: TPanel;
    omit_page_button: TButton;
    ok_button: TButton;
    header_label: TLabel;
    page_label: TLabel;
    font_button: TButton;
    origin_label: TLabel;
    printer_label: TLabel;
    row_progressbar: TProgressBar;
    help_button: TButton;
    help_shape: TShape;
    pdf_save_dialog: TSaveDialog;
    black_edges_checkbox: TCheckBox;
    picture_borders_checkbox: TCheckBox;
    include_pictures_checkbox: TCheckBox;
    detail_mode_radiobutton: TRadioButton;
    diagram_mode_radiobutton: TRadioButton;
    include_sketchboard_items_checkbox: TCheckBox;
    row_label: TLabel;
    page_ident_checkbox: TCheckBox;
    Label1: TLabel;
    ident_prefix_edit: TEdit;
    Label2: TLabel;
    page_listbox: TListBox;
    symbols_checkbox: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colour_panelClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure omit_all_buttonClick(Sender: TObject);
    procedure omit_page_buttonClick(Sender: TObject);
    procedure ok_buttonClick(Sender: TObject);
    procedure all_buttonClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure how_panelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure banner_fill_checkboxClick(Sender: TObject);
    procedure next_row_buttonClick(Sender: TObject);
    procedure font_buttonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure black_edges_checkboxClick(Sender: TObject);
    procedure detail_mode_radiobuttonClick(Sender: TObject);
    procedure diagram_mode_radiobuttonClick(Sender: TObject);
    procedure page_listboxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pdf_laz_form: Tpdf_laz_form;
  

  function pdf_laz_draw:integer;     // draw control template or entire pad on the output

  procedure do_external_pdf(count:integer);  // call external pdf_creator

//______________________________________________________________________________

implementation

{$BOOLEVAL ON}


{$R *.lfm}

uses
  ShellAPI, Printers, calibration_unit, preview_unit, control_room, pad_unit,
  alert_unit, keep_select, math_unit, gauge_unit, info_unit, colour_unit,
  bgnd_unit, bgkeeps_unit, help_sheet, stay_visible_unit, panning_unit, xml_unit,
  shove_timber, grid_unit, edit_memo_unit, print_settings_unit, print_unit,
  entry_sheet, export_unit, rail_options_unit, platform_unit, check_diffs_unit,
  heave_chairs,                     // 556 SC 11-SEP-2024
  data_memo_unit, trackbed_unit, make_slip_unit, detail_mode_unit, brick_unit;

type                               // 227a
  Tsheet_id=class(TObject)
              across:integer;
              down:integer;
            end;

const
  pdf_help_str:string='    Export  PDF  Pages'
  +'||Behind this PDF PAGES window you can see the layout of pages comprising your drawing. Drag and resize this window as necessary to get a clear view.'
  +' (It is often useful to have resized the trackpad window beforehand to less than the full screen.)'
  +'||The tracks are drawn in skeleton form with rails only, but will output fully detailed according to your current settings in the GENERATOR and OUTPUT menus.'
  +' The rails are shown in different colours for the control template and background templates, the latter being shown as single rail-edges only.'
  +'||( The TOP of the pages corresponds to the LEFT MARGIN on the screen, so selecting between upright (portrait) and sideways (landscape) paper orientation might at first seem confusing.'
  +' In most cases the pre-set upright (portrait) setting gives the best fit on the pages.)'

  +'||If EXPORT CONTROL TEMPLATE was selected only pages containing it will be output, along with any background items which happen to be on them.'
  +'||If EXPORT TRACK PLAN was selected, all the pages needed to contain any background templates will be output.'

  +'||To enlarge or reduce the scale of the templates, or change the colours or line thicknesses, select the various OUTPUT menu items.'
  +' The page layout shown here (and on the trackpad) will change to reflect the new size.'

  +'||You can choose to output any or all of the pages shown:'
  +'||To create all the pages click the CREATE ALL REMAINING PAGES bar.'
  +'||To create individual page(s), click on the page list or click the OMIT PAGE button until the NEXT PAGE display shows the page you require. Then click the CREATE PAGE button.'
  +'||To cancel any further output, click the OMIT ALL REMAINING PAGES bar or press the F12 or Esc keys.'

  +'||To omit all the pages in a row, or the remaining pages in the current row, click the NEXT ROW button.'
  +'||Continue clicking the OMIT PAGE, CREATE PAGE and NEXT ROW buttons as required. If no more pages are required click the OMIT ALL REMAINING PAGES bar. To output'
  +' all the remaining pages click the CREATE ALL REMAINING PAGES bar.'
  +'||green_panel_begin  tree.gif  To run rapidly through the pages of a large plan you can repeatedly select the OMIT PAGE, CREATE PAGE or NEXT ROW buttons by using the accelerator keys marked on the buttons'
  +' (i.e. hold down the O key on the keyboard to omit a run of pages, the C key to create a run of pages, or the N key to omit several rows of pages).green_panel_end'
  +'|To change the font used for the page labels on the preview screen click the FONT... button.'

  +'||If the page margins do not conveniently fit the paper size or grid spacings being used, the trim margins can be changed. Return to the trackpad (F12) and then click the OUTPUT > TRIM MARGINS > ? TRIM MARGINS HELP menu item for more information.'
  +'||If the drawing is not conveniently placed between the page margins, the page origin can be moved. Return to the trackpad (F12) and then click either the OUTPUT > PAGE ORIENTATION / ORIGIN > SET PAGE ORIGIN... menu item'
  +' to enter the new page origin position directly, or the ACTION > MOUSE ACTIONS:PAD > MOVE PAGE ORIGIN menu item (SHIFT+CTRL-F10) to move the page origin with the mouse.'
  +'||Likewise if you output an entire track plan at a reduced size, the output size can be changed by mouse action to achieve a convenient fit to the pages. Click the ACTION > MOUSE ACTIONS:PAD > ADJUST PRINT SIZE menu item.'
  +' The page outlines on the trackpad will change accordingly.'

  +'||If BLACK RAIL-EDGES is ticked, all rail edges will be output in black regardless of any other colour or grey-shade settings which you may have made.'
  +'||This option is useful when you output the background templates in their mapping or marker colours, or in a single non-black colour ( OUTPUT > OUTPUT CLOLOURs AND STYLES > ALL TEMPLATES IN A SINGLE COLOUR menu item),'
  +' but you want to retain a full black for the rail edge lines.'

  +'||Templot ignores any empty (blank) pages and outputs only the pages of your drawing which actually contain track.'

  +'||Line thicknesses (line widths) can be set separately using the OUTPUT > LINE THICKNESS menu items.'


  +'||For some additional notes about colour options, click the ABOUT MAPPING COLOURS button below.';


  picture_help_str:string='      Printing  Background  Picture  Shapes'
  +'||The background picture shapes are intended mainly for use on the screen. It is recommended that you normally print them as rectangle outlines only on your track templates.'
  +'||Including large bitmap images in the printed pages may significantly increase printing time, and is not supported on all printers.'

  +'||If possible the STRETCH option should be used to print them. However, this is a Windows function which may fail at high magnifications of the original image, and is not available on some printers.'

  +' If you are using Windows NT, 2000 or XP, see also the PROGRAM > EXPERT > GRAPHICS LIMITS > ? GRAPHICS LIMITS - HELP menu item on the PROGRAM PANEL window.'

  +'||The DOTS option will work at all magnifications and on most printers, but is extremely slow, and should be regarded as a last resort. It is significantly faster for images scanned in black and white only.'
  +' In many cases the DOTS method will work better if you change the printer spooler setting to RAW data (see below).'

  +'||For the STRETCH method, if the TRANSPARENT option is set for a picture shape (in the BACKGROUND SHAPES window) it will be printed with underlying detail showing through (if the printer supports raster functions).'
  +' Otherwise underlying detail will be covered over, including the grid lines and page trim margins.'
  +' To avoid this, ensure that the GRID IN FRONT tickbox is selected.'

  +'||For the DOTS method the TRANSPARENT option does not apply and is ignored. However, any white areas of the image will always be printed as transparent.'

  +'||Both methods adjust the intensity of the image according to the current PRINT INTENSITY setting.'

  +'||Printing large bitmaps makes great demands on your system''s memory and resources. Don''t have more picture shapes on the trackpad than you need,'
  +' and keep bitmap files as small as possible by cropping off unwanted areas or by scanning at a lower resolution or in grey-scale instead of colour.'
  +' Close any other applications which you have running. If lengthy disk drive activity takes place - please be patient.'
  +' If you experience problems, quit Templot, restart Windows, restart Templot and try again.'

  +'||Printing performance may also be improved by changing from EMF to RAW data, or by printing directly to the printer instead of via the Windows spooler.'
  +' To make these changes, from the Windows taskbar click Start > Settings > Printers > select printer > File menu > Properties > Details tab > Spool Settings, or consult Windows Help and your printer documentation for further details.'

  +'||If problems persist, restart Templot and print background picture shapes as outlines only.'

  +'||N.B. PLEASE BE AWARE that printing scanned images may require the permission of the copyright owner.'

  +'||For more information about using Background Shapes and bitmap images, click MORE ABOUT PICTURE SHAPES below.';

var
  button_clicked:boolean=False;
  banner_changed:boolean=False;
  output_in_progress:boolean=False;
  index_sheet_wanted:boolean=False;

  info_was_showing:boolean=False;
  panning_was_showing:boolean=False;
  shove_was_showing:boolean=False;
  spacing_was_showing:boolean=False;

  rail_options_was_showing:boolean=False;
  platform_was_showing:boolean=False;
  trackbed_was_showing:boolean=False;
  check_diffs_was_showing:boolean=False;
  data_child_was_showing:boolean=False;
  stay_visible_was_showing:boolean=False;
  brick_was_showing:boolean=False; //235b

  form_scaling:boolean=False;

  printgrid_wide:integer=1;      // dots line thickness default.
  printpicborder_wide:integer=1; // dots.

  printmargin_wide:integer=3;    // dots.
  printshape_wide:integer=2;     // dots.
  printrail_wide:integer=2;      // dots.
  printtimber_wide:integer=2;    // dots.
  printmark_wide:integer=2;      // dots.

  printcl_wide:integer=1;        // dots.  track centre-line  0.79.a

  his_pdf_file_name_str:string='';

  shove_list_index:integer=-1;                   // 226a
  shove_infill_colour:integer=clWhite;           // 226a colour for output
  shove_infill_style:integer=0;                  // 226a style code 0=solid
  shove_modify_this_timber_infill:boolean=False; // 226a

  sheet_down:integer;             // 227a now global  current sheet index.
  sheet_across:integer;           // 227a now global  ditto

  //------------

  on_canvas:TCanvas;

  emf_file_str:string='';       // 555a
  pdf_file_name_str:string='';  // 555a

  yd:extended;                   // SC 12-SEP-2024

  procedure pdf_laz_bgnd(grid_left,grid_top:extended);forward;        // print background items.

  procedure pdf_laz_bgnd_shapes(grid_left,grid_top:extended);forward; // print all background shapes.

  procedure pdf_rotate_bitmap(i:integer);forward;     // rotate bitmap for picture shape.

  function pdf_laz_draw_symbols(canv:TCanvas; symbols:Tsymbols; symbol_type,layer:integer; grid_left,grid_top,ypd:extended):boolean;forward;  // ypd 227c

//_______________________________________________________________________________________

procedure do_external_pdf(count:integer);     // call external PDF creator

var
  n,i:integer;
  str,pdf_size_str,app_str,folder_str:string;

begin

  app_str:=exe_str+'internal\pdf\pdf_creator.exe';

  if ShellExecute(0,'open',PChar(app_str),nil,nil,SW_SHOWNORMAL)<=32
     then begin
            show_modal_message('Sorry, unable to start the PDF Creator.');
            EXIT;
          end;

  n:=0;
  Screen.Cursor:=crHourGlass;

  repeat                // wait for PDF creator
    Sleep(1000);
    INC(n);
    if n>120            // 2 minutes safety exit
       then begin
              show_modal_message('error: unable to create PDF file');
              Screen.Cursor:=crDefault;
              EXIT;
             end;

  until (FileExists(exe_str+'internal\pdf\emf_data.xml')=False) and (FileExists(pdf_file_name_str)=True);    // creator deletes data file to signal completion

  Screen.Cursor:=crDefault;

  if (pdf_height_mm>3000) or (pdf_width_mm>3000)
     then pdf_size_str:='|||<TABLE><TR><TD VALIGN="TOP">rp.gif&nbsp;</TD><TD>green_panel_begintree.gif   Large PDF page sizes:'
                       +'||If the PDF file does not display properly in Adobe Reader the most likely reason is that the page size exceeds the limit for Adobe Reader.'
                       +'||Other free PDF reader programs are available which will display and print much larger page sizes.'
                       +' For more information and download links, click <A HREF="alert_online.85a">more information online</A> .'
                       +'green_panel_end</TD></TR></TABLE>'
     else pdf_size_str:='';

  if count>1
     then str:='s'
     else str:='';


  i:=alert(2,'php/260   PDF  file  created',
             'The PDF file was created successfully ('+IntToStr(count)+' page'+str+'):'
            +'||`0'+pdf_file_name_str+'`f'
            +'||Click <A HREF="alert_3.85a">open PDF file</A> to open the file in your PDF reader.'
            +pdf_size_str,
             '','','open  PDF  file','open  the  containing  folder','','continue',0);

  if i=3
     then begin
            folder_str:=pdf_file_name_str;

            if ShellExecute(0,'open',PChar(folder_str),nil,nil,SW_SHOWNORMAL)<=32
               then ShowMessage('Sorry, unable to open the file.')
               else external_window_showing:=True;
          end;

  if i=4
     then begin
            folder_str:=ExtractFilePath(pdf_file_name_str);

            if ShellExecute(0,'explore',PChar(folder_str),nil,nil,SW_SHOWNORMAL)<=32
               then ShowMessage('Sorry, unable to open the folder.')
               else external_window_showing:=True;
          end;
end;
//______________________________________________________________________________


procedure disable_buttons;

begin
  with pdf_laz_form do begin

    omit_page_button.Enabled:=False;
    next_row_button.Enabled:=False;
    ok_button.Enabled:=False;
    all_button.Enabled:=False;
    page_listbox.Enabled:=False;      // 227a
    all_panel.Enabled:=False;

  end;//with
end;
//___________________________________________________________________________________

procedure enable_buttons(next_row_enabled:boolean);

begin
  with pdf_laz_form do begin

    omit_all_button.Enabled:=True;
    omit_page_button.Enabled:=True;
    next_row_button.Enabled:=next_row_enabled;

    ok_button.Enabled:=True;
    all_button.Enabled:=True;

    omit_all_panel.Enabled:=True;
    all_panel.Enabled:=True;

    page_listbox.Enabled:=True;   // 227a

  end;//with
end;
//___________________________________________________________________________________

function calc_intensity(colour:integer):integer;

var
  red,green,blue,av:integer;    // colour components (0-255).

begin
  RESULT:=colour;  // default init

  if colour=clWhite then EXIT;

  if (pdf_black_white=True) or (colour=virtual_black_colour)
     then begin
            RESULT:=clBlack;
            EXIT;
          end;

  if pdf_grey_shade=True     // average to a grey..
     then begin
            try
              red:=(colour AND $000000FF);
              green:=(colour AND $0000FF00) div $100;
              blue:=(colour AND $00FF0000) div $10000;

              av:=(red+green+blue) div 3;

              red:=av;
              green:=av;
              blue:=av;

              RESULT:=(blue*$10000)+(green*$100)+red;

            except
              RESULT:=clGray;
            end;//try
          end;

end;
//____________________________________________________________________________________

procedure print_colours_setup;  // set grey shades and/or black/white.

begin

  if pdf_black_white=True
     then begin
            print_railedge_colour:=clBlack;

            printcurail_colour:=clBlack;
            printbgrail_colour:=clBlack;

            printtimber_colour:=clBlack;

            printrail_infill_colour_cu:=clWhite;      // !!! used for solid infill.
            printrail_infill_colour_bg:=clWhite;      // !!! used for solid infill.
            printrail_infill_colour_bk:=clWhite;      // SC 01-OCT-2024 556 // !!! used for solid infill.

            printtimber_infill_colour:=clBlack;       // !!! only used for hatched infill.
            printgrid_colour:=clBlack;
            printmargin_colour:=clBlack;
            printguide_colour:=clBlack;
            printjoint_colour:=clBlack;
            printalign_colour:=clBlack;

            print_labels_font.Color:=clBlack;
            print_timber_numbers_font.Color:=clBlack;

            printshape_colour:=clBlack;
            printbg_single_colour:=clBlack;

            printplat_edge_colour:=clBlack;    // platform edges
            printplat_infill_colour:=clBlack;  // platform infill

            sb_track_bgnd_colour:=clWhite; // 206a
            sb_diagram_colour:=clWhite;    // 209c

          end
     else begin

                     //  calc grey shades if wanted...

            if pdf_laz_form.black_edges_checkbox.Checked=True
               then print_railedge_colour:=clBlack
               else print_railedge_colour:=calc_intensity(save_prc);

            printcurail_colour:=print_railedge_colour;
            printbgrail_colour:=print_railedge_colour;

            printtimber_colour:=calc_intensity(save_ptc);

            printrail_infill_colour_cu:=calc_intensity(save_priccu);
            printrail_infill_colour_bg:=calc_intensity(save_pricbg);

            printrail_infill_colour_bk:=calc_intensity(save_pricbk);       // SC 01-OCT-2024 556  rail infill brick override

            printtimber_infill_colour:=calc_intensity(save_ptic);
            printgrid_colour:=calc_intensity(save_grc);
            printmargin_colour:=calc_intensity(save_pmc);
            printguide_colour:=calc_intensity(save_pgc);
            printjoint_colour:=calc_intensity(save_pjc);
            printalign_colour:=calc_intensity(save_pac);

            print_labels_font.Color:=calc_intensity(save_fc);
            print_timber_numbers_font.Color:=calc_intensity(save_tnfc);

            print_corner_page_numbers_font.Color:=calc_intensity(save_cpnfc);     // 0.93.a added

            printshape_colour:=calc_intensity(save_psc);
            printbg_single_colour:=calc_intensity(save_pbg);

            printplat_edge_colour:=calc_intensity(save_priplatedge);   // platform edges
            printplat_infill_colour:=calc_intensity(save_priplatfill); // platform infill

            sb_track_bgnd_colour:=calc_intensity(save_sb_track_bgnd);  // 206a
            sb_diagram_colour:=calc_intensity(save_sb_diagram_col);    // 209c
			
            printchair_infill_colour:=calc_intensity(save_pcic);		// SC 13-SEP-2024 556
            printchair_label_infill_colour:=calc_intensity(save_plic);		// SC 13-SEP-2024 556
			
          end;
end;
//__________________________________________________________________________________________

procedure print_line_thickness_setup;

var
  av_dpi:extended;

                 ///////////////////////////////////////////////

                 function calc_thick(mm_thick:extended; adjust:boolean):integer;  // calc line thickness in dots.

                 var
                   line_dots:extended;

                 begin
                   line_dots:=mm_thick*av_dpi/25.4;
                   if (adjust=True) and (pad_form.adjust_line_thickness_menu_entry.Checked=True) then line_dots:=line_dots*out_factor;

                   RESULT:=Round(line_dots);
                   if RESULT<1 then RESULT:=1;
                 end;
                 ///////////////////////////////////////////////

begin
  av_dpi:=(nom_width_dpi+nom_length_dpi)/2;

     printgrid_wide:=calc_thick(  printgrid_thick,False);  // don't reduce line thickness for scaled output - the paper size is still the same.
   printmargin_wide:=calc_thick(printmargin_thick,False);  // ditto.

        printshape_wide:=calc_thick(    printshape_thick,True);
    printpicborder_wide:=calc_thick(printpicborder_thick,True);
         printrail_wide:=calc_thick(     printrail_thick,True);
       printtimber_wide:=calc_thick(   printtimber_thick,True);
           printcl_wide:=calc_thick(       printcl_thick,True);    // 0.79.a
         printmark_wide:=calc_thick(     printmark_thick,True);

end;
//__________________________________________________________________________________________

procedure make_pdf_preview_screenshot;   // 238b

var
  create_png:TPortableNetworkGraphic;

  date_str,file_str:string;       // including path

  screen_rect:TRect;   // 238b
  page_map_bmp:TBitmap;


begin
  screen_rect.Top:=0;
  screen_rect.Left:=0;
  screen_rect.Right:=pad_form.ClientWidth;
  screen_rect.Bottom:=pad_form.ClientHeight;

  file_str:=exe_str+'PDF-PAGEMAP-RECORD-FILES\pdf_pagemap'+FormatDateTime('_yyyy_mm_dd_hhmm_ss',Date+Time)+'.png';

  date_str:=' '+DateToStr(Date)+'  '+TimeToStr(Time)+' ';

  page_map_bmp:=TBitmap.Create;     // 238b
  create_png:=TPortableNetworkGraphic.Create;

  try
    try
      page_map_bmp.Width:=pad_form.ClientWidth;
      page_map_bmp.Height:=pad_form.ClientHeight;

      page_map_bmp.Canvas.CopyMode:=cmSrcCopy;
      page_map_bmp.Canvas.CopyRect(screen_rect,offdraw_bmp.Canvas,screen_rect);

      with page_map_bmp.Canvas do begin

           // add date...   238b

        Font.Assign(set_font('Courier New',12,[],clBlack));

        Brush.Color:=clWhite;
        Brush.Style:=bsSolid;

        TextOut(0,0,date_str);

      end;//with

      create_png.Assign(page_map_bmp);
      create_png.SaveToFile(file_str);
    except
      ShowMessage('Sorry, an error occurred in creating the page-map record file.'
                  +#13+#13+'This doesn''t prevent a PDF file being created.');
    end;//try

  finally
    page_map_bmp.Free;    // 238b
    create_png.Free;
  end;//try
end;
//______________________________________________________________________________

procedure text_out(canv:TCanvas; textoutX,textoutY:integer; str:string);

          // wPDF bug  --  blank text backgrounds
var
  text_rect:TRect;

begin

  with canv do begin

    text_rect.Left:=textoutX;
    text_rect.Top:=textoutY;
    text_rect.Right:=textoutX+TextWidth(str);
    text_rect.Bottom:=textoutY+TextHeight(str);

    // SC 15-SEP-2024 556
    //Brush.Color:=clWhite;
    //Brush.Style:=bsSolid;
    //FillRect(text_rect);

    Brush.Style:=bsClear;
    // sc 15-sep-2024 556

    TextOut(textoutX,textoutY,str);

  end;//with

end;
//______________________________________________________________________________

function pdf_laz_draw:integer;     // draw control template or entire pad on an EMF output canvas.

     // n.b. this code tries to draw the complete output on every sheet,
     // and relies on the system to crop it to the current page rectangle.

     // return number of pages in the PDF

var
  infill_points:array[0..3] of TPoint;   // array of corners for infilled timbers.

  gridx, gridy, now_gridx, now_gridy:extended;
  grid_label:extended;

  down:integer;
  across:integer;

  max_sheet_across:integer;       // highest used.

  max_sheet_down:array[0..sheet_across_c] of integer;  // 0.93.a keep track of highest non-empty page in each row.

  gridco:integer;
  grid_now_dots:integer;

  i, aq, rail, now, now_max, dots_index, mark_code:integer;

  w_dots, l_dots, w_dots1, l_dots1, w_dots2, l_dots2:integer;

  w1,l1,w2,l2,wmid,lmid:integer;

  n:integer; // 227a

  nn:integer;   // SC 12-SEP-2024 556

  all_pages:boolean;              // False = print one page at a time.
  page_count:integer;
  row_count:integer;

  page_num_str:string;
  page_str, top_str, bottom_str:string;
  xing_str:string;
  button_str:string;
  pgco_str:string;
  stry:integer;

  p1,p2,p3,p4:Tpoint;
  radcen_arm:extended;

  move_to, line_to: TPoint;

  l_dims_valid:boolean;
  w_dims_valid:boolean;

  banner_top_done:boolean;

  x_dots, y_dots:integer;
  bangrid_dots:integer;

  pen_width:integer;

  p:array[0..27] of TPoint;          // SC 12-SEP-2024

  ptr_1st,ptr_2nd:^Tmark;          // pointers to a Tmark record.   ###

  ptr_3rd:^Tmark;                   // SC 12-SEP-2024


  markmax:integer;

  fontsize:extended;
  num_str, tbnum_str:string;

  grid_str:string;
  grid_label_str:string;

  folder_str:string;

  switch_label_str:string;  // 206b

  all_pages_origin_str,this_page_begin_str,this_page_end_str:string;  // 208g

  last_file_str:string;  // 214a

  ident_left,ident_top,wm_shift:integer;  // 214a

  preview_record_file_made:boolean;   // 214b

  file_str:string;  // 217b

  ident_margin:integer;  // 225d ..
  ident_str:string;

  page_counter:integer;

  meta_DC_handle:HDC;          // for EMF metafile   555a


              //////////////////////////////////////////////////////////////////

              procedure post_emf_data(emf_count:integer);

              var
               xml_doc:TNativeXml;

               data_node:TXmlNode;

                    //==========================================================

                    function create_named_node(parent_node:TXmlNode; name_str:string):TXmlNode;

                    begin
                      RESULT:=TXmlNode.CreateName(xml_doc,name_str);
                      parent_node.NodeAdd(RESULT);
                    end;
                    //==========================================================

              begin

                xml_doc:=TNativeXml.CreateName('EMF');

                xml_doc.UseFullNodes:=True;
                xml_doc.XmlFormat:=xfReadable;      // insert CRLF after each node

                xml_doc.WriteOnDefault:=True;       // ignore defaults and always write anyway
                xml_doc.FloatSignificantDigits:=9;  // sig digs in floats

                data_node:=create_named_node(xml_doc.Root,'DATA');

                   // write out the data...

                with data_node do begin

                  WriteInteger('emf_count',emf_count,0);
                  WriteInteger('pdf_width_dots',pdf_width_dots,0);
                  WriteInteger('pdf_height_dots',pdf_height_dots,0);
                  WriteInteger('pdf_width_dpi',pdf_width_dpi,0);
                  WriteInteger('pdf_height_dpi',pdf_height_dpi,0);

                  WriteString('pdf_file_name',pdf_file_name_str,'');

                end;//with node

                xml_doc.SaveToFile(exe_str+'internal\pdf\emf_data.xml');

                xml_doc.Free;
              end;

              //////////////////////////////////////////////////////////////////

              function begin_page:boolean;    // 555a start a fresh page

              var
                horz_factor,vert_factor:double;
                meta_rect:TRect;
                meta_ref_DC:HDC;     // for EMF metafile   555a

              begin
                RESULT:=False;  // init

                output_in_progress:=True;

                pdf_laz_form.page_panel.Caption:='preparing  page   '+button_str+'  ...';

                on_canvas:=TCanvas.Create;

                meta_ref_DC:=GetDC(0);  // screen

                horz_factor:=GetDeviceCaps(meta_ref_DC,HORZSIZE)*100/GetDeviceCaps(meta_ref_DC,HORZRES);
                vert_factor:=GetDeviceCaps(meta_ref_DC,VERTSIZE)*100/GetDeviceCaps(meta_ref_DC,VERTRES);

                meta_rect:=Rect(0,0,Round(pdf_width_dots*horz_factor),Round(pdf_height_dots*vert_factor));

                emf_file_str:=exe_str+'internal\pdf\emf_for_pdf_page_'+IntToStr(page_counter)+'.emf';

                DeleteFile(emf_file_str);  // if previous exists

                meta_dc_handle:=CreateEnhMetaFile(meta_ref_DC,PChar(emf_file_str),@meta_rect,nil);

                if meta_dc_handle=0
                   then begin
                          output_in_progress:=False;
                          on_canvas.Free;
                          ReleaseDC(0,meta_ref_DC);
                          show_modal_message('Sorry, an error occurred in creating the transfer metafile.');
                          EXIT;
                        end;

                on_canvas.Handle:=meta_dc_handle;

                on_canvas.Font.PixelsPerInch:=pdf_width_dpi;   // match PDF

                ReleaseDC(0,meta_ref_DC);

                RESULT:=True;
              end;
              //////////////////////////////////////////////////////////////////

              function end_page:boolean;    // 555a end current page and save EMF

              var
                memory_meta_dc:HDC;

              begin
                RESULT:=False;  // init

                try
                  memory_meta_dc:=CloseEnhMetaFile(meta_dc_handle);

                  if memory_meta_dc=0
                     then begin
                            show_modal_message('Sorry, an error occurred in saving the transfer metafile.');
                            EXIT;
                          end;

                  post_emf_data(page_counter);   // update the data file

                  INC(page_counter); // for next page

                  RESULT:=True;
                finally
                  DeleteEnhMetaFile(memory_meta_dc);
                  DeleteEnhMetaFile(meta_dc_handle);

                  on_canvas.Free;

                  output_in_progress:=False;
                end;//try
              end;
              //////////////////////////////////////////////////////////////////

              procedure draw_marks(grid_left,grid_top:extended; rail_joints_now,numbers_now:boolean);

                // if rail_joints_now=True draw only the rail joints, otherwise omit them.
                // if numbers_now=True draw only the timber numbers, otherwise omit them.   // 226d
                // !!! NOT BOTH TRUE AT SAME TIME

              var
                i:integer;
                n:integer;           // SC 12-SEP-2024 556
                n_max:integer;       // SC 12-SEP-2024 556
                dummy_i:integer;     // SC 12-SEP-2024 556
                infill_points:array[0..34] of TPoint;    // 28 (0-27) points for chair outlines with radiused corners
                                                         // then 4 points (29..31) for plinth rectangle, +3 spares       221a

                s:string;  // 208a

                list_chair_code:integer;   // MW 03-08-2024  555a
                chair_label_str:string;
                font_height,half_stringwidth,half_stringheight:integer;


              begin


                markmax:=intarray_max(marks_list_ptr);  // max index for the present list.

                if mark_index>markmax then mark_index:=markmax;  // ??? shouldn't be.

                tbnum_str:=timb_numbers_str;      // the full string of timber numbering for the control template.

                with on_canvas do begin

                  Font.PixelsPerInch:=pdf_width_dpi;   // match PDF

                  for i:=0 to (mark_index-1) do begin   // (mark_index is always the next free slot)

                    ptr_1st:=Pointer(intarray_get(marks_list_ptr,i));  // pointer to the next Tmark record.
                    if ptr_1st=nil then BREAK;

                    mark_code:=ptr_1st^.code;              // check this mark wanted.

                    if mark_code=0 then CONTINUE;     // ignore mark entries with code zero (might be the second or third of a multi-mark entry, e.g. for timber infill).

                    if mark_code=-123 then CONTINUE;  // 235b  offsets for 3-D DXF

                    if print_settings_form.output_rail_joints_checkbox.Checked=False    // 223d
                       then begin
                              case mark_code of
                                 6: CONTINUE;     // rail joints not wanted.
                              end;//case
                            end;

                            // overwrite rail joints on rails  / timber numbers on platforms ...

                    if rail_joints_now=(mark_code<>6) then CONTINUE;  // do only the rail joints if rail_joints_now=True and ignore them otherwise.

                    if numbers_now=(mark_code<>99) then CONTINUE;     // 226d do only the timber numbers if numbers_now=True and ignore them otherwise.

                    if print_settings_form.output_timbering_checkbox.Checked=False
                       then begin
                              case mark_code of
                                 3,4,5,14,33,44,54,55,93,95,99,203,233,293: CONTINUE;     // no timbering wanted.
                              end;//case
                            end;

                    if print_settings_form.output_timber_centres_checkbox.Checked=False    // 223d
                       then begin
                              case mark_code of
                                 4,14,44,54: CONTINUE;     // timber centre-lines not wanted.
                              end;//case
                            end;

                    if print_settings_form.output_guide_marks_checkbox.Checked=False    // 223d
                       then begin
                              case mark_code of
                                 1: CONTINUE;     // guide marks not wanted.
                              end;//case
                            end;

                    if print_settings_form.output_switch_drive_checkbox.Checked=False    // 223d
                       then begin
                              case mark_code of
                                 101: CONTINUE;     // switch drive not wanted.
                              end;//case
                            end;

                   if print_settings_form.output_chairs_checkbox.Checked=False
                       then begin
                              case mark_code of
                                 480..499: CONTINUE;     // no chair outlines wanted  221a
                              end;//case
                            end;

                    if print_settings_form.output_radial_ends_checkbox.Checked=False
                       then begin
                              case mark_code of
                                 2,7: CONTINUE;     // no radial ends wanted  206a
                              end;//case
                            end;

                    if print_settings_form.output_switch_labels_checkbox.Checked=False
                       then begin
                              case mark_code of
                                 600,601..605: CONTINUE;     // no long marks or switch labels wanted  206b
                              end;//case
                            end;

                    if print_settings_form.output_xing_labels_checkbox.Checked=False
                       then begin
                              case mark_code of
                                 700..703: CONTINUE;     // no long marks or crossing labels wanted  211b
                              end;//case
                            end;

                    // SC 12-SEP-2024 556
                    // include chair outline codes
                    if ((mark_code=203) or (mark_code=233) or (mark_code=293) or (mark_code=484) or (mark_code=485) or (mark_code=487) or (mark_code=493) or (mark_code=494) or (mark_code=497)) and (i<(mark_index-1))      // timber infill, chair outlines
                       then begin
                              ptr_2nd:=Pointer(intarray_get(marks_list_ptr,i+1));        // pointer to the second infill Tmark record.
                              if ptr_2nd=nil then BREAK;

                              p1:=ptr_1st^.p1;              // x1,y1 in  1/100ths mm
                              p2:=ptr_1st^.p2;              // x2,y2 in  1/100ths mm
                              p3:=ptr_2nd^.p1;              // x3,y3 in  1/100ths mm
                              p4:=ptr_2nd^.p2;              // x4,y4 in  1/100ths mm
                            end
                       else ptr_2nd:=nil;    // keep compiler happy.

                    // SC 12-SEP-2024 556
                    // chair outline extra marks
                    if (mark_code=484) or (mark_code=485) or (mark_code=493) or (mark_code=494) or (mark_code=497)    // another 12 marks for radiused corners
		                     then begin
                              n:=0;
	                             nn:=2;

	                             repeat
                                ptr_3rd:=Pointer(intarray_get(marks_list_ptr,i+nn));        // pointer to the next infill Tmark record.
	                               if ptr_3rd=nil then EXIT;

			                             p[n]:=ptr_3rd^.p1;       // 1/100ths mm
				                            p[n+1]:=ptr_3rd^.p2;     // 1/100ths mm

				                            INC(n);   //+2
				                            INC(n);
				                            INC(nn);  //+1

	                             until n>26;     // was 22
		                          end;

	                   p1:=ptr_1st^.p1;              // x1,y1 in  1/100ths mm

                    if ( (mark_code>0) and (mark_code<200) and (mark_code<>8) and (mark_code<>9) and (mark_code<>10) ) // ignore peg, rad centres, timber selector and peg arms, plain track start, label.
                    or (mark_code=600) or (mark_code=700)  // 206b 211b overwrite switch marks on output
                       then begin

                              if ((mark_code=5) or (mark_code=55) or (mark_code=95) or (mark_code=600) or (mark_code=700)) and (out_factor<>1.0) then CONTINUE;   // reduced ends are meaningless if not full-size. 206b 600 added - 211b 700 added

                              p1:=ptr_1st^.p1;              // x1,y1 in  1/100ths mm

                              if mark_code<>99
                                 then begin
                                        p2:=ptr_1st^.p2;    // x2,y2 in  1/100ths mm

                                        Brush.Color:=clWhite;  // 0.93.a gaps in dotted lines.
                                        Brush.Style:=bsClear;
                                        TextOut(0,0,'');

                                        if pdf_black_white=True
                                           then Pen.Color:=clBlack
                                           else case mark_code of
                                       1,101,600,700: Pen.Color:=printguide_colour;  // guide marks.  switch drive  206b 600 added, 211b 700 added
                                                   2: Pen.Color:=printalign_colour;  // rad end marks.
                                             3,33,93: Pen.Color:=printtimber_colour; // timber outlines.
                                                   6: Pen.Color:=printjoint_colour;  // rail joint marks.
                                                   7: Pen.Color:=printalign_colour;         // transition/slewing ends.
                                                 else Pen.Color:=calc_intensity(clBlack);   // thin dotted lines in black only.
                                                end;//case

                                        Pen.Mode:=pmCopy;
                                        Pen.Width:=1;
                                        Pen.Style:=psSolid; // default init.

                                        case mark_code of
                                           1,101: Pen.Width:=printmark_wide;    // guide marks. switch drive
                                               2: Pen.Width:=printmark_wide;    // rad end marks.
                                         3,33,93: Pen.Width:=printtimber_wide;  // timber outlines.

                                            4,44: Pen.Style:=psDash;            // timber centre-lines.

                                         5,55,95: Pen.Style:=psDot;             // timber reduced ends.

                                               6: Pen.Width:=printmark_wide;    // rail joint marks.
                                               7: Pen.Width:=printmark_wide;    // transition ends.

                                           14,54: Pen.Width:=printrail_wide;    // timber centre-lines with rail centre-lines (for rivet locations?).

                                         600,700: Pen.Width:=printrail_wide + printrail_wide div 2;    //  206b 211b long marks

                                             else Pen.Width:=1;

                                        end;//case
                                                     // over-rides...

                                        if Pen.Width<1 then Pen.Width:=1;
                                        if Pen.Style<>psSolid then Pen.Width:=1;   // delphi bug? (patterns only work for lines 1 dot wide.)

                                        move_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                        line_to.X:=Round((p2.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        line_to.Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;
                                        if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                                      end

                                 else begin    // code 99...

                                        if  ( (pad_form.print_timber_numbering_menu_entry.Checked=True) or ((out_factor>0.99) and (pad_form.numbering_fullsize_only_menu_entry.Checked=True)) )

                                        and (print_settings_form.output_timber_numbers_checkbox.Checked=True)   // 223d

                                           then begin

                                                  move_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;     // 208a use the screen number position p1 for the control template (no ID number).
                                                  move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                                  num_str:=extract_tbnumber_str(tbnum_str); // get next timber numbering string from the acummulated string.
                                                  if num_str='' then CONTINUE;              // no string available??

                                                  if  (pad_form.timber_numbering_on_plain_track_menu_entry.Checked=False)   // 208a
                                                  and (num_str<>'A1')
                                                     then begin
                                                            s:=Copy(num_str,1,1);

                                                            if (s='A') or (s='E') or (s='R') or (s='N')    // not wanted on plain track,
                                                               then CONTINUE;
                                                          end;

                                                  if check_limit(False,False,move_to)=True
                                                     then begin
                                                            Font.Assign(print_timber_numbers_font);

                                                            if pad_form.scale_timber_numbering_menu_entry.Checked=True
                                                               then begin
                                                                      fontsize:=Font.Size*out_factor;
                                                                      if fontsize<4 then CONTINUE;      // minimum to be legible.
                                                                      Font.Size:=Round(fontsize);
                                                                    end;

                                                            Brush.Color:=clWhite;
                                                            Brush.Style:=bsClear;   // 226d  was solid
                                                            TextOut(0,0,'');

                                                            text_out(on_canvas, move_to.X-(TextWidth(num_str) div 2),
                                                                                move_to.Y-(TextHeight(num_str) div 2),
                                                                                ' '+num_str+' ');

                                                            Font.Assign(print_labels_font);      // reset for grid labels
                                                          end;
                                                end;
                                      end;
                            end
                       else begin   // other codes...

                              if ( (mark_code=-2) or (mark_code=-3) )  and {(pad_form.print_radial_centres_menu_entry.Checked=True)}  // 0.82.b
                                 (print_settings_form.output_radial_centres_checkbox.Checked=True)

                                         // draw curving rad centres...

                                 then begin
                                        Pen.Width:=printmark_wide;  // guide marks.

                                        if Pen.Width<1 then Pen.Width:=1;

                                        Pen.Style:=psSolid;
                                        Pen.Mode:=pmCopy;
                                        Pen.Color:=calc_intensity(clBlack);

                                        p1:=ptr_1st^.p1;        // x1,y1 in  1/100ths mm
                                        radcen_arm:=400*scale;  // 4ft scale arbitrary (scale is for control template).

                                        move_to.X:=Round((p1.Y+radcen_arm+ypd-grid_left)*scaw_out)+page_left_dots;      // mark centre widthwise.
                                        move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                        line_to.X:=Round((p1.Y-radcen_arm+ypd-grid_left)*scaw_out)+page_left_dots;
                                        line_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;
                                        if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                                        move_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;                 // mark centre lengthwise
                                        move_to.Y:=Round((p1.X+radcen_arm-grid_top)*scal_out)+page_top_dots;

                                        line_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        line_to.Y:=Round((p1.X-radcen_arm-grid_top)*scal_out)+page_top_dots;
                                        if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                      end;

                              // SC 12-SEP-2024 556
                              // if ((mark_code=203) or (mark_code=233) or (mark_code=293))  and (ptr_2nd<>nil)        // timber infill...
                                                                                        // SC 12-SEP-2024 556 add chair outlines
                              if ((mark_code=203) or (mark_code=233) or (mark_code=293) or (mark_code=484) or (mark_code=485) or (mark_code=487) or (mark_code=493) or (mark_code=494) or (mark_code=497)) and (ptr_2nd<>nil)        // timber infill...
                                 then begin
                                        infill_points[0].X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        infill_points[0].Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                        infill_points[1].X:=Round((p2.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        infill_points[1].Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;

                                        infill_points[2].X:=Round((p3.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        infill_points[2].Y:=Round((p3.X-grid_top)*scal_out)+page_top_dots;

                                        infill_points[3].X:=Round((p4.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                        infill_points[3].Y:=Round((p4.X-grid_top)*scal_out)+page_top_dots;

                                        // SC 12-SEP-2024 556 chair outline marks
                                        if (mark_code=484) or (mark_code=485) or (mark_code=493) or (mark_code=494) or (mark_code=497)         // 221a  chair outlines
                                           then begin
                                                  for n:=0 to 27 do begin               // 221a  was 23
                                                    infill_points[n+4].X:=Round(limits(h_minint,h_maxint,(p[n].Y+ypd-grid_left)*scaw_out,dummy_i))+page_left_dots;
                                                    infill_points[n+4].Y:=Round(limits(h_minint,h_maxint,(p[n].X-grid_top)*scal_out,dummy_i))+page_top_dots;
                                                    end;   //next
                                                end;
                                        // sc 12-SEP-2024 556 chair outline marks

                                        if (check_limits(infill_points[0],infill_points[1])=True) and (check_limits(infill_points[2],infill_points[3])=True)
                                           then begin
                                                  Pen.Width:=1;
                                                  Pen.Style:=psSolid;
                                                  Pen.Mode:=pmCopy;

                                                  Pen.Color:=clWhite;  // so no overdrawing of timber outlines.

                                                  if pdf_black_white=True
                                                     then Brush.Color:=clBlack
                                                     else Brush.Color:=printtimber_infill_colour;

                                                      // 0.95.a  PDF bug-fix...

                                                  case print_timb_infill_style of
                                                                  0: CONTINUE;                         // no infill

                                                                  1: begin                             // hatched infill
                                                                       if Brush.Color=clBlack then Brush.Color:=virtual_black_colour; // PDF bug fix -- hatching won't work if black
                                                                       Brush.Style:=bsFDiagonal;                                      // Forward diagonal for the foreground (control template).
                                                                     end;

                                                                  2: begin                             // cross-hatched infill
                                                                       if Brush.Color=clBlack then Brush.Color:=virtual_black_colour;
                                                                       Brush.Style:=bsDiagCross;
                                                                     end;

                                                                  3: if pdf_black_white=True           // solid infill
                                                                        then begin
                                                                               if Brush.Color=clBlack then Brush.Color:=virtual_black_colour;
                                                                               Brush.Style:=bsFDiagonal;  // for printing black and white.
                                                                             end
                                                                        else Brush.Style:=bsSolid;

                                                                  4: begin                             // blank infill.
                                                                       Brush.Style:=bsSolid;
                                                                       Brush.Color:=clWhite;   // overide.
                                                                     end;
                                                                else CONTINUE;
                                                  end;//case

                                                  // SC 12-SEP-2024 556 start
                                                     // chair outline overides...

                                                  if (mark_code=484) or (mark_code=485) or (mark_code=493) or (mark_code=494) or (mark_code=497)        // chair outlines
                                                     then begin
                                                            Pen.Color:=timber_colour;
                                                            Brush.Color:=printchair_infill_colour;	// SC 13-SEP-2024 556
                                                            Brush.Style:=bsSolid;
                                                            end;

                                                     // 241c switch-drive rib ..

                                                  if mark_code=487
                                                     then begin
                                                            Pen.Color:=clBlack;
                                                            Brush.Color:=$00D0D0E0;
                                                            Brush.Style:=bsDiagCross;
                                                            end;


                                                  // Polygon(infill_points);

                                                  if (mark_code=484) or (mark_code=485) or (mark_code=493) or (mark_code=494) or (mark_code=497)
                                                     then Polygon(Slice(infill_points,28))      // chair outline with radiused corners
                                                     else Polygon(Slice(infill_points,4));      // timber infill, chair with square corners
                                                  // sc 12-SEP-2024 556 end

                                                end;
                                      end;

                              //  SC 11-SEP-2024    556
                              if (mark_code>=461) and (mark_code<=478) and (brick_form.show_labels_checkbox.Checked=True)    // MW 03-08-2024  555a
                                 then begin
                                      list_chair_code:=ptr_1st^.dxf_chair_code;    // MW 03-08-2024  555a
                                      chair_label_str:=get_chair_str(list_chair_code);

                                      if list_chair_code=14      // over-ride check flare-in from "CCL/R"
                                         then case mark_code of
                                              461: chair_label_str:='CCL';     // MS LH TEMPLATE - TS RH TEMPLATE
                                              471: chair_label_str:='CCR';     // TS LH TEMPLATE - MS RH TEMPLATE
                                         end;

                                      if list_chair_code=16      // over-ride check flare-out from "CCR/L"
                                         then case mark_code of
                                              461: chair_label_str:='CCR';     // MS LH TEMPLATE - TS RH TEMPLATE
                                              471: chair_label_str:='CCL';     // TS LH TEMPLATE - MS RH TEMPLATE
                                         end;

                                      p1:=ptr_1st^.p1;    // x1,y1 in  1/100ths mm
                                      p2:=ptr_1st^.p2;    // x2,y2 in  1/100ths mm

                                      move_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;     // 208a use the screen number position p1 for the control template (no ID number).
                                      move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                      if check_limit(False,False,move_to)=True
                                         then begin

                                                Font.Assign(print_chair_labels_font);  // 556  8 init

                                                Font.Height:=0-Round(3.5*inscale*100*scal_out);   // 556 3.5" high text arbitrary

                                                half_stringwidth:=TextWidth(chair_label_str) div 2;
                                                half_stringheight:=TextHeight(chair_label_str) div 2;

						                                          Brush.Style:=bsSolid;
                                                Brush.Color:=printchair_label_infill_colour;	// SC 13-SEP-2024 556

                                                Font.Color:=clBlack;

                                                Pen.Width:=1;       // draw the rectangle first...
                                                Pen.Mode:=pmCopy;
                                                Pen.Style:=psSolid;
                                                Pen.Color:=Font.Color;

                                                RoundRect(move_to.X-half_stringwidth-Round(ABS(Font.Height/2)), move_to.Y-half_stringheight-2, move_to.X+half_stringwidth+Round(ABS(Font.Height/2)), move_to.Y+half_stringheight+2, Round(ABS(Font.Height/2.5)), Round(ABS(Font.Height/2.5)) );   // font/2 padding, font/2.5 corner rads, arbitrary

                                                Text_Out(on_canvas,move_to.X-half_stringwidth, move_to.Y-half_stringheight, chair_label_str);
                                                Font.Assign(print_labels_font);      // reset for grid labels
                                              end;

                                    end;
                              // sc 11-sep-2024

                              case mark_code of     // switch labels 206b

                       601..605,701..703: begin

                                            if out_factor<>1.0 then CONTINUE;     // on full size prints only

                                            p1:=ptr_1st^.p1;              // x1,y1 in  1/100ths mm

                                            move_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                            move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                            if check_limit(False,False,move_to)=True
                                               then begin
                                                      Font.Assign(print_timber_numbers_font);

                                                      Font.Style:=[fsBold,fsItalic];
                                                      Font.Color:=printguide_colour;

                                                      if scale>3 then Font.Size:=Font.Size+1; // a bit bigger above 3mm/ft

                                                      Brush.Style:=bsSolid;
                                                      Brush.Color:=clWhite;

                                                      case mark_code of
                                                            601: switch_label_str:='tips';
                                                            602: switch_label_str:='set (bend)';
                                                            603: switch_label_str:='planing';
                                                            604: switch_label_str:='stock gauge';
                                                            605: switch_label_str:='joggles';

                                                            701: switch_label_str:='intersection FP';
                                                            702: switch_label_str:='blunt nose';
                                                            703: switch_label_str:='blunt tips';

                                                            else switch_label_str:='';
                                                      end;//case

                                                      text_out(on_canvas, move_to.X-(TextWidth(switch_label_str) div 2),  // div 2 allows for rotation of template
                                                                          move_to.Y-(TextHeight(switch_label_str) div 2),
                                                                          ' '+switch_label_str+' ');

                                                      Font.Assign(print_labels_font);      // reset for grid labels
                                                    end;

                                          end;

                              end;//case

                            end;
                  end;//next mark i

                          // finally overdraw timber infill for shoved colours  226a

                  if (rail_joints_now=False) and (numbers_now=False) and (Length(current_shoved_timbers)>0) and (no_timbering=False)   // 227d
                 and (timber_fill_overdraw_generated=True)                                                                             // 227d
                     then begin
                            for i:=0 to Length(current_shoved_timbers)-1 do begin

                              with current_shoved_timbers[i] do begin

                                if (shove_data.sv_option_bits AND $40)=0 then CONTINUE;     // 232c  if shove_data.sv_col_has_been_set=False   no modified infill

                                if shoved_mod_infill.shoved_number_str='' then CONTINUE;  // 227e timber didn't get drawn

                                with shoved_mod_infill do begin

                                if (shove_data.sv_use_ocol=True) and (black_white=False) {and (impact<1)} // overdraw previous infill on output
                                   then begin

                                          infill_points[0].X:=Round((current_shoved_corners.p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                          infill_points[0].Y:=Round((current_shoved_corners.p1.X-grid_top)*scal_out)+page_top_dots;

                                          infill_points[1].X:=Round((current_shoved_corners.p2.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                          infill_points[1].Y:=Round((current_shoved_corners.p2.X-grid_top)*scal_out)+page_top_dots;

                                          infill_points[2].X:=Round((current_shoved_corners.p3.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                          infill_points[2].Y:=Round((current_shoved_corners.p3.X-grid_top)*scal_out)+page_top_dots;

                                          infill_points[3].X:=Round((current_shoved_corners.p4.Y+ypd-grid_left)*scaw_out)+page_left_dots;
                                          infill_points[3].Y:=Round((current_shoved_corners.p4.X-grid_top)*scal_out)+page_top_dots;

                                          if (check_limits(infill_points[0],infill_points[1])=True) and (check_limits(infill_points[2],infill_points[3])=True)
                                             then begin
                                                    Pen.Width:=printtimber_wide;
                                                    Pen.Style:=psSolid;
                                                    Pen.Mode:=pmCopy;
                                                    Pen.Color:=printtimber_colour;

                                                    Brush.Color:=shove_data.sv_ocol;

                                                    case shove_data.sv_ocol_infill of

                                                        0: Brush.Style:=bsSolid;
                                                        1: begin Brush.Color:=clWhite; Brush.Style:=bsSolid; end;  // blank style
                                                        2: Brush.Style:=bsHorizontal;
                                                        3: Brush.Style:=bsVertical;
                                                        4: Brush.Style:=bsFDiagonal;
                                                        5: Brush.Style:=bsBDiagonal;
                                                        6: Brush.Style:=bsCross;
                                                        7: Brush.Style:=bsDiagCross;
                                                      else Brush.Style:=bsSolid;

                                                    end;//case

                                                    Polygon(Slice(infill_points,4));   // number of points, not index

                                                  end;//ckeck limits
                                        end;//use ocol

                                end;
                              end;//with
                            end;//next

                          end;//if any

                  // 226a end

                end;//with on_canvas

              end;
              ///////////////////////////////

              function get_w_dots(q,n:integer):integer;

              begin
                with sheet[sheet_down,sheet_across] do begin // (grid_left)
                  RESULT:=Round((outoflist(q,n,1)+ypd-grid_left)*scaw_out)+page_left_dots;
                end;//with
                w_dims_valid:=check_draw_dim_w(RESULT);
              end;
              ////////////////////////////

              function get_l_dots(q,n:integer):integer;

              begin
                with sheet[sheet_down,sheet_across] do begin // (grid_top)
                  RESULT:=Round((outoflist(q,n,0)-grid_top)*scal_out)+page_top_dots;
                end;//with
                l_dims_valid:=check_draw_dim_l(RESULT);
              end;
              ////////////////////////////

              procedure draw_outline_railedge(aq,pencol:integer);

              var
                now:integer;

              begin
                if ( (plain_track=False) or (aq=0) or (aq=8) or (aq=3) or (aq=11) or ((aq>15) and (aq<24)) ) and (aqyn[aq]=True)

                   then begin
                          with on_canvas do begin
                            Pen.Color:=pencol;
                            Pen.Mode:=pmCopy;
                            Pen.Style:=psSolid;

                            move_to.X:=get_w_dots(aq,0); move_to.Y:=get_l_dots(aq,0);
                            for now:=1 to nlmax_array[aq] do begin
                              line_to.X:=get_w_dots(aq,now); line_to.Y:=get_l_dots(aq,now);
                              if check_limits(move_to, line_to)=True
                                 then begin
                                        MoveTo(move_to.X, move_to.Y);
                                        LineTo(line_to.X, line_to.Y);
                                      end;
                              move_to:=line_to;
                            end;//for
                          end;//with Canvas
                        end;
              end;
              ////////////////////////////

              procedure draw_fill_rail(outer_add:integer);    // draw a complete filled rail.

              const
                dots_max_c=xy_pts_c*2;

              var
                dots:array[0..dots_max_c] of TPoint;     // array of points for filled polygon mode.

                  //    (xy_pts_c=3000;)
                  //   3000 points for each side of rail. if incx is 18" scale (SQRT 9ft scale in 4mm = SQRT(36) =6 mm),
                  //   template max is 4500' scale length.
                  //   ( = 18000 mm or 59ft approx in 4 mm scale).
                  //   ( = 66 A4 sheets long if straight turnout - but normally less for curved turnout).

                  // N.B. huge standard Pascal array is used instead of dynamic integer arrays,
                  // because needed for the Polygon function.

                  // total memory = 6000*8 bytes = 48kb.

                now, start, now_max:integer;
                edge_started:boolean;
                mid_dots_index:integer;
                edge_colour, blanking_colour:integer;


                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                  procedure modify_rail_end(start_index,stop_index,edge,blank:integer);

                                  var
                                    saved_pen_width:integer;    // 206b

                                  begin

                                    if (start_index>=0) and (start_index<=dots_index) and (stop_index>=0) and (stop_index<=dots_index)
                                       then begin
                                              move_to:=dots[start_index];
                                              line_to:=dots[stop_index];

                                              if check_limits(move_to, line_to)=True
                                                 then begin
                                                        with on_canvas do begin

                                                          saved_pen_width:=Pen.Width; // 206b

                                                          if Brush.Style<>bsSolid then Pen.Width:=saved_pen_width+3;    // 206b  PDF bug, needs a wider line to ensure full blanking if hatched fill

                                                          Pen.Color:=blank;                // first blank across..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(line_to.X, line_to.Y);

                                                          Pen.Width:=saved_pen_width;      // 206b restore original width

                                                          Pen.Color:=edge;                 // then restore the corner points..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(move_to.X, move_to.Y);

                                                          MoveTo(line_to.X, line_to.Y);
                                                          LineTo(line_to.X, line_to.Y);

                                                        end;//with
                                                      end;
                                            end;
                                  end;
                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


              begin
                with on_canvas do begin

                  if (rail=16) or (rail=20)   // 0.93.a platforms
                     then Pen.Color:=printplat_edge_colour
                     else Pen.Color:=printcurail_colour;         //  1 = virtual black. Bug in HP driver if black (0) specified.

                  Pen.Mode:=pmCopy;
                  Pen.Style:=psSolid;

                  aq:=rail;  // gauge-faces.

                  if ( (plain_track=False) or (aq=0) or (aq=3) or ((aq>15) and (aq<24)) )

                         // if plain track, stock rails and adjacent tracks only.

                     then begin
                            if (aqyn[aq]=False) or (aqyn[aq+outer_add]=False)  // data not for both edges?
                               then begin
                                      if aqyn[aq]=True then draw_outline_railedge(aq,Pen.Color);
                                      if aqyn[aq+outer_add]=True then draw_outline_railedge(aq+outer_add,Pen.Color);
                                      EXIT;
                                    end;

                            now_max:=nlmax_array[aq];

                            if gaunt=False    // 0.93.a normal turnout.
                               then begin                            

                                      case aq of
                                           1: begin
                                                start:=list_planing_mark_aq1;  // start from end of planing - no infill in planing.

                                                if (start<0) or (start>now_max) then EXIT;  // ???
                                              end;

                                           2: begin                         // ditto
                                                start:=list_planing_mark_aq2;

                                                if (start<0) or (start>now_max) then EXIT;  // ???
                                              end;

                                         else start:=0;                   // whole list.
                                      end;//case

                                    end
                               else start:=0;  // 0.93.a gaunt template, no planing. 0.81 09-Jul-2005


                            dots_index:=0-1;                    // first increment is to zero.

                            edge_started:=False;
                            for now:=start to now_max do
                              begin
                                x_dots:=get_w_dots(aq,now);
                                y_dots:=get_l_dots(aq,now);
                                if (w_dims_valid=True) and (l_dims_valid=True)
                                   then begin
                                          edge_started:=True;

                                          Inc(dots_index);
                                          if dots_index>dots_max_c then dots_index:=dots_max_c;

                                          dots[dots_index].X:=x_dots;
                                          dots[dots_index].Y:=y_dots;
                                        end
                                   else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                              end;//next now

                            mid_dots_index:=dots_index;

                            aq:=rail+outer_add;             // outer-edges.

                            now_max:=nlmax_array[aq];

                            edge_started:=False;
                            for now:=now_max downto 0 do
                              begin
                                x_dots:=get_w_dots(aq,now);
                                y_dots:=get_l_dots(aq,now);
                                if (w_dims_valid=True) and (l_dims_valid=True)
                                   then begin
                                          edge_started:=True;

                                          Inc(dots_index);
                                          if dots_index>dots_max_c then dots_index:=dots_max_c;

                                          dots[dots_index].X:=x_dots;
                                          dots[dots_index].Y:=y_dots;
                                        end
                                   else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                              end;//next now

                            if pdf_black_white=True
                               then begin
                                      Brush.Style:=bsSolid;               // solid infill white.
                                      Brush.Color:=clWhite;
                                    end
                               else begin
                                      if (rail=16) or (rail=20)   // 0.93.a platforms
                                         then begin
                                                Brush.Color:=printplat_infill_colour;

                                                case print_platform_infill_style of
                                                        0: begin Brush.Style:=bsClear; TextOut(0,0,''); end;
                                                        1: Brush.Style:=bsBDiagonal;    // hatched. backward diagonal (forward diagonal on control template timbers).
                                                        2: Brush.Style:=bsDiagCross;

                                                        3: if mapping_colours_print<0          // solid.
                                                              then Brush.Style:=bsBDiagonal    // impact printer or plotter, or printing black and white or in a single colour.
                                                              else Brush.Style:=bsSolid;

                                                      else begin                         // 4 = blank.
                                                             Brush.Style:=bsSolid;
                                                             Brush.Color:=clWhite;       // overide.
                                                           end;

                                                end;//case
                                              end
                                         else begin
                                                if ((draw_ts_trackbed_cess_edge=True) and (rail=18))
                                                or ((draw_ms_trackbed_cess_edge=True) and (rail=22))   // 215a
                                                   then begin
                                                          Brush.Color:=sb_track_bgnd_colour; // cess use same colour as track background
                                                          Brush.Style:=bsFDiagonal;
                                                        end
                                                   else begin   // normal rails...

                                                          Brush.Color:=printrail_infill_colour_cu;

                                                          case rail_infill_i of
                                                                1: Brush.Style:=bsBDiagonal;   // hatched
                                                                2: Brush.Style:=bsSolid;       // solid
                                                                3: Brush.Style:=bsDiagCross;   // cross_hatched
                                                                4: begin                       // blank
                                                                     Brush.Style:=bsSolid;
                                                                     Brush.Color:=clWhite;
                                                                   end;
                                                              else Brush.Style:=bsSolid;       // ??? solid
                                                          end;//case

                                                        end;
                                              end;
                                    end;

                            if dots_index>2
                               then begin
                                      Polygon(Slice(dots,dots_index+1));   // +1, number of points, not index.  must have 4 points.

                                      edge_colour:=Pen.Color;  // existing rail edges.

                                      if Brush.Style=bsSolid
                                         then blanking_colour:=Brush.Color;       // infill colour.

                                            // remove polygon line across end of planing (not for fixed-diamond)..
                                            // (for gaunt template this removes the polygon line across the rail end)

                                      if ((half_diamond=False) or (fixed_diamond=False)) and ((rail=1) or (rail=2)) then modify_rail_end(0,dots_index,edge_colour,blanking_colour);

                                            // remove polygon lines across stock rail ends...
                                            // and trackbed ends  206b

                                      if (rail=0) or (rail=3) or (rail=18) or (rail=22)   // 18,22 added 206b
                                         then begin
                                                modify_rail_end(0,dots_index,edge_colour,blanking_colour);  // toe or approach end.

                                                modify_rail_end(mid_dots_index,mid_dots_index+1,edge_colour,blanking_colour);  // exit end.
                                              end;

                                      if adjacent_edges=True  // platforms
                                       then begin

                                                   // 0.93.a blank platform rear edges ...

                                              if (rail=16) and (draw_ts_platform=True) and (draw_ts_platform_rear_edge=False)   // 0.93.a TS platform start
                                                 then draw_outline_railedge(16,blanking_colour);    // blank rear edge

                                              if (rail=20) and (draw_ms_platform=True) and (draw_ms_platform_rear_edge=False)   // 0.93.a TS platform start
                                                 then draw_outline_railedge(20,blanking_colour);    // blank rear edge

                                                   // 0.93.a blank platform ends ...

                                              if (rail=16) and (draw_ts_platform=True) and (draw_ts_platform_start_edge=False)   // 0.93.a TS platform start
                                                 then modify_rail_end(0,dots_index,edge_colour,blanking_colour);

                                              if (rail=16) and (draw_ts_platform=True) and (draw_ts_platform_end_edge=False)     // 0.93.a TS platform end
                                                 then modify_rail_end(mid_dots_index,mid_dots_index+1,edge_colour,blanking_colour);

                                              if (rail=20) and (draw_ms_platform=True) and (draw_ms_platform_start_edge=False)   // 0.93.a MS platform start
                                                 then modify_rail_end(0,dots_index,edge_colour,blanking_colour);

                                              if (rail=20) and (draw_ms_platform=True) and (draw_ms_platform_end_edge=False)     // 0.93.a MS platform end
                                                 then modify_rail_end(mid_dots_index,mid_dots_index+1,edge_colour,blanking_colour);

                                            end;


                                      if (rail=26) or (rail=28)
                                         then begin
                                                modify_rail_end(0,dots_index,edge_colour,blanking_colour);  // centre of K-crossing check rails.
                                              end;

                                    end;
                          end;
                end;//with
              end;
              //////////////////////////////////

              procedure draw_fill_vee;    // do complete vee in one go ...

              const
                dots_max_c=xy_pts_c*2;

              var
                dots:array[0..dots_max_c] of TPoint;     // array of points for filled polygon mode.

                  //    (xy_pts_c=3000;)
                  //   3000 points for each side of rail. if incx is 18" scale (SQRT 9ft scale in 4mm = SQRT(36) =6 mm),
                  //   template max is 4500' scale length.
                  //   ( = 18000 mm or 59ft approx in 4 mm scale).
                  //   ( = 66 A4 sheets long if straight turnout - but normally less for curved turnout).

                  // N.B. huge standard Pascal array is used instead of our own dynamic integer arrays,
                  // because needed for the Polygon function.

                  // total memory = 6000*8 bytes = 48kb.

                now:integer;
                edge_started:boolean;
                dots_index:integer;
                x_dots,y_dots:integer;
                aq:integer;
                point_mid_dots_index, splice_mid_dots_index:integer;
                edge_colour, blanking_colour:integer;

                              //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                              procedure modify_vee_end(start_index,stop_index,edge,blank:integer);

                              begin

                                if (start_index>=0) and (start_index<=dots_index) and (stop_index>=0) and (stop_index<=dots_index)
                                   then begin
                                          move_to:=dots[start_index];
                                          line_to:=dots[stop_index];

                                          if check_limits(move_to, line_to)=True
                                             then begin
                                                    with on_canvas do begin
                                                      Pen.Color:=blank;                // first blank across..
                                                      MoveTo(move_to.X, move_to.Y);
                                                      LineTo(line_to.X, line_to.Y);

                                                      Pen.Color:=edge;                 // then restore the corner points..
                                                      MoveTo(move_to.X, move_to.Y);
                                                      LineTo(move_to.X, move_to.Y);

                                                      MoveTo(line_to.X, line_to.Y);
                                                      LineTo(line_to.X, line_to.Y);
                                                    end;//with
                                                  end;
                                        end;
                              end;
                              //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


              begin
                if plain_track=True then EXIT;   // not if plain track.

                if (aqyn[4]=False) or (aqyn[5]=False) or (aqyn[12]=False) or (aqyn[13]=False)            // not enough data for filled vee.
                or (nlmax_array[4]=0) or (nlmax_array[5]=0) or (nlmax_array[12]=0) or (nlmax_array[13]=0)
                   then begin
                          if aqyn[4]=True then draw_outline_railedge(4,printcurail_colour);       // draw outline vee...
                          if aqyn[5]=True then draw_outline_railedge(5,printcurail_colour);
                          if aqyn[12]=True then draw_outline_railedge(12,printcurail_colour);
                          if aqyn[13]=True then draw_outline_railedge(13,printcurail_colour);
                        end
                   else begin
                          dots_index:=0-1;   // first increment is to zero.

                          aq:=4;
                          edge_started:=False;
                          for now:=0 to nlmax_array[aq] do    // vee main-side, gauge_face, start from the tip.
                            begin
                              x_dots:=get_w_dots(aq,now);
                              y_dots:=get_l_dots(aq,now);
                              if (w_dims_valid=True) and (l_dims_valid=True)
                                 then begin
                                        edge_started:=True;

                                        Inc(dots_index);
                                        if dots_index>dots_max_c then dots_index:=dots_max_c;

                                        dots[dots_index].X:=x_dots;
                                        dots[dots_index].Y:=y_dots;
                                      end
                                 else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                            end;//next now

                          point_mid_dots_index:=dots_index;

                          aq:=12;
                          edge_started:=False;
                          for now:=nlmax_array[aq] downto 0 do  // back along outer-edge.
                            begin
                              x_dots:=get_w_dots(aq,now);
                              y_dots:=get_l_dots(aq,now);
                              if (w_dims_valid=True) and (l_dims_valid=True)
                                 then begin
                                        edge_started:=True;

                                        Inc(dots_index);
                                        if dots_index>dots_max_c then dots_index:=dots_max_c;

                                        dots[dots_index].X:=x_dots;
                                        dots[dots_index].Y:=y_dots;
                                      end
                                 else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                            end;//next now

                          aq:=13;
                          edge_started:=False;
                          for now:=0 to nlmax_array[aq] do    // and then turnout side outer edge.
                            begin
                              x_dots:=get_w_dots(aq,now);
                              y_dots:=get_l_dots(aq,now);
                              if (w_dims_valid=True) and (l_dims_valid=True)
                                 then begin
                                        edge_started:=True;

                                        Inc(dots_index);
                                        if dots_index>dots_max_c then dots_index:=dots_max_c;

                                        dots[dots_index].X:=x_dots;
                                        dots[dots_index].Y:=y_dots;
                                      end
                                 else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                            end;//next now

                          splice_mid_dots_index:=dots_index;

                          aq:=5;
                          edge_started:=False;
                          for now:=nlmax_array[aq] downto 0 do  // and back along the gauge face to the tip.
                            begin
                              x_dots:=get_w_dots(aq,now);
                              y_dots:=get_l_dots(aq,now);
                              if (w_dims_valid=True) and (l_dims_valid=True)
                                 then begin
                                        edge_started:=True;

                                        Inc(dots_index);
                                        if dots_index>dots_max_c then dots_index:=dots_max_c;

                                        dots[dots_index].X:=x_dots;
                                        dots[dots_index].Y:=y_dots;
                                      end
                                 else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                            end;//next now

                          with on_canvas do begin

                            Pen.Color:=printcurail_colour;         //  1 = virtual black. Bug in HP driver if black (0) specified.
                                                                   //  (but not on "econofast" print !).
                            Pen.Mode:=pmCopy;
                            Pen.Style:=psSolid;

                            Brush.Color:=printrail_infill_colour_cu;

                            if {(}pdf_black_white=True  {) or (impact>0)}
                               then begin
                                      Brush.Style:=bsSolid;              // solid infill white.
                                      Brush.Color:=clWhite;
                                    end
                               else case rail_infill_i of
                                          1: Brush.Style:=bsBDiagonal;   // hatched
                                          2: Brush.Style:=bsSolid;       // solid
                                          3: Brush.Style:=bsDiagCross;   // cross_hatched
                                          4: begin                       // blank
                                               Brush.Style:=bsSolid;
                                               Brush.Color:=clWhite;
                                             end;
                                        else Brush.Style:=bsSolid;       // solid
                                    end;//case

                            if dots_index>4
                               then begin
                                      Polygon(Slice(dots,dots_index+1));   // +1, number of points, not index.  must have at least 5 points.

                                      edge_colour:=Pen.Color;  // existing rail edges.

                                      if Brush.Style=bsSolid then blanking_colour:=Brush.Color   // infill colour.
                                                             else blanking_colour:=clWhite;

                                            // remove polygon lines across vee rail ends...

                                      modify_vee_end(point_mid_dots_index,point_mid_dots_index+1,edge_colour,blanking_colour); // point rail end.

                                      modify_vee_end(splice_mid_dots_index,splice_mid_dots_index+1,edge_colour,blanking_colour); // splice rail end.
                                    end;

                          end;//with Canvas
                        end;
              end;
              //////////////////////////////////////////////////////////////////

              procedure mark_end(aq1, aq1end, aq2, aq2end:integer);      // make a rail end mark

              begin
                if (endmarks_yn[aq1,aq1end]=True) and (endmarks_yn[aq2,aq2end]=True)
                   then begin
                          p1:=endmarks[aq1,aq1end];
                          p2:=endmarks[aq2,aq2end];


                          with sheet[sheet_down,sheet_across] do begin
                            move_to.X:=Round((p1.Y+ypd-grid_left)*scaw_out)+page_left_dots;  move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;
                            line_to.X:=Round((p2.Y+ypd-grid_left)*scaw_out)+page_left_dots;  line_to.Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;
                          end;//with

                          with on_canvas do begin
                            Pen.Color:=printcurail_colour;         //  1 = virtual black. Bug in HP driver if black (0) specified.
                                                                   //  (but not on "econofast" print !).
                            Pen.Mode:=pmCopy;
                            Pen.Style:=psSolid;

                            if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                          end;//with
                        end;
              end;
              //////////////////////////////////////////////////////////////////

              procedure outline_railends;       // draw the rail ends in outline mode.

              begin
                if (plain_track=False)
                   then begin                     // mark rail-ends...

                          mark_end(1,1,9,1);    // turnout rail wing rail finish.
                          mark_end(2,1,10,1);   // main rail wing rail finish.

                          mark_end(6,0,14,0);   // main side check rail start.
                          mark_end(6,1,14,1);   // main side check rail finish.

                          mark_end(7,0,15,0);   // turnout side check rail start.
                          mark_end(7,1,15,1);   // turnout side check rail finish.

                          mark_end(4,0,5,0);    // blunt nose.

                          if (half_diamond=True) and (fixed_diamond=True)     // planed faced of point rails for a fixed-diamond.
                             then begin
                                    mark_end(1,0,9,0);
                                    mark_end(2,0,10,0);

                                    mark_end(26,1,27,1);     // MS K-crossing check rails.
                                    mark_end(28,1,29,1);     // DS K-crossing check rails.
                                  end;
                        end;
              end;
              ///////////////////////////////////////////////////////////////////

              procedure pdf_shapes_and_sketchboard_items(grid_left,grid_top:extended);    // 206e

              begin
                pdf_laz_bgnd_shapes(grid_left,grid_top);    // output all background shapes
              end;
              //////////////////////////////////////////////////////////////////

begin
  RESULT:=0;         // init
  page_counter:=1;   // init first page

  with pdf_laz_form.pdf_save_dialog do begin

    if his_pdf_file_name_str<>'' then InitialDir:=ExtractFilePath(his_pdf_file_name_str)
                                 else InitialDir:=exe_str+'PDF-FILES\';

    FileName:=remove_invalid_str(Copy(Trim(box_project_title_str),1,fname_trunc)+'_pages_'+FormatDateTime('yyyy_mm_dd_hhmm_ss',Date+Time))+'.pdf';
    Title:='    save  PDF  file  as ...';

    if Execute=False then EXIT;

    his_pdf_file_name_str:=FileName;        // so we can use the same folder next time.

      // invalid entered chars removed by dialog

    file_str:=ExtractFilePath(FileName)+lower_case_filename(ExtractFileName(FileName));   // to underscores and lower case

    if FileExists(file_str)=True    // 217b
       then begin
              if DeleteFile(file_str)=False
                 then begin
                        ShowMessage('Error:'+#13+#13+'The PDF file "'+ExtractFileName(file_str)+'" cannot be created '
                                    +#13+'because a file having the same name is currently in use '
                                    +#13+'by another program, possibly your PDF reader program. '
                                    +#13+#13+'Please close that program and then try again. '
                                    +#13+#13+'Or use a different file name (recommended). ');
                        EXIT;
                      end;
            end;

    pdf_file_name_str:=file_str;

  end;//with

  diagram_partials_omitted:=False;  // init  226c

  print_colours_setup;    // first set up the colours.

  preview_record_file_made:=False;   // 214b  init

  pdf_laz_form.all_panel.Caption:='create  all  pages       ';       // init 223d
  pdf_laz_form.omit_all_panel.Caption:='cancel            F12';      // init 223d

try
  print_busy:=True;    // lock-out the loop while printing.

  output_in_progress:=False;  // init

  if calcs_done_and_valid=False then redraw(False);    //  first do a direct redraw if nec to ensure valid calcs.
  if calcs_done_and_valid=False then EXIT;             //  calcs still not valid.

  if print_preview(False,True,0)=False  // calc the sheet sizes from the printer and preview the output.
     then EXIT;                         // (also gets ypd y datum offset).

  print_line_thickness_setup;  // needs the dpi via print_preview.  mod 0.73.a 12-9-01.

  gridx:=grid_spacex*100;  //gridsizex*2540;   // grid line spacings. in 1/100th mm.  (any output scaling is done later).
  gridy:=grid_spacey*100;  //gridsizey*2540;

  while gridx*out_factor<500 do gridx:=gridx*2;      // 5 mm closest grid spacing permitted down the page.
  while gridy*out_factor<1000 do gridy:=gridy*2;     // 10 mm ditto across page to allow for labels.

  all_pages:=False;        // init for one page at a time.

  slow_run:=0;                                            // cancel any slow-running.
  control_room_form.run_slow_menu_entry.Checked:=False;

  with pdf_laz_form.page_listbox.Items do begin                            // 227a init
    if Count>0 then for n:=0 to Count-1 do Tsheet_id(Objects[n]).Free;
    Clear;
  end;//with

  banner_top_done:=False;

  page_count:=0;

           // check every sheet for any content, all 858 sheets (26*33)...

  max_sheet_across:=0;  // init

  for across:=0 to sheet_across_c do begin

    max_sheet_down[across]:=0;  // 0.93.a  init

    for down:=0 to sheet_down_c do begin              // every sheet in row.

      if sheet[down,across].empty=True then CONTINUE;

      Inc(page_count);

      max_sheet_across:=across;  // keep track of highest non-empty page row.

      max_sheet_down[across]:=down;  // 0.93.a keep track of highest non-empty page in each row.

      page_num_str:=Chr(across+97)+'/'+IntToStr(down+1);

      n:=pdf_laz_form.page_listbox.Items.AddObject(' '+page_num_str,Tsheet_id.Create);

      Tsheet_id(pdf_laz_form.page_listbox.Items.Objects[n]).across:=across;
      Tsheet_id(pdf_laz_form.page_listbox.Items.Objects[n]).down:=down;

    end;//next down
  end;//next across

  if page_count<1 then page_count:=1;    // how did that happen?

  if page_count>1 then pgco_str:=''+IntToStr(page_count)+'  PDF  pages'
                  else pgco_str:='one  PDF  page';

  with pdf_laz_form do begin

    if print_entire_pad_flag=True
       then begin
              if print_group_only_flag=True
                 then header_label.Caption:='export group templates only     scaled at : '+round_str(out_factor*100,2)+' %'
                 else header_label.Caption:='export background templates     scaled at : '+round_str(out_factor*100,2)+' %';
            end
       else header_label.Caption:=Trim(gauge_str)+'  '+round_str(scale,2)+' mm/ft     scaled at : '+round_str(out_factor*100,2)+' %';

    page_label.Caption:=pgco_str;

    origin_label.Caption:='page origin :  X = '+round_str(print_pages_top_origin,2)+' mm    Y = '+round_str(print_pages_left_origin,2)+' mm';

  end;//with
  //---------------------------------------------------

  pdf_laz_form.row_progressbar.Max:=pdf_laz_form.page_listbox.Items.Count-1;   // 227a
  pdf_laz_form.row_progressbar.Position:=0;

    // 227a  allow CONTINUE and going back in page_listbox...

  sheet_across:=-1;  // 227a init

  while sheet_across<(max_sheet_across) do begin

    INC(sheet_across);

    sheet_down:=-1;

    while sheet_down<(sheet_down_c) do begin

      INC(sheet_down);

      with sheet[sheet_down,sheet_across] do begin

        if empty=True then CONTINUE;

        case xing_type_i of
                  0: xing_str:=' regular V-crossing';
                  1: xing_str:=' curviform V-crossing';
                 -1: xing_str:=' generic V-crossing';
                else xing_str:='';
        end;//case

        page_num_str:=Chr(sheet_across+97)+'/'+IntToStr(sheet_down+1);


        page_str:=' page  '+page_num_str+'  ';

        if print_entire_pad_flag=True
           then bottom_str:=' of  '+IntToStr(page_count)+'  pages for  '+box_project_title_str
           else begin
                  bottom_str:=' ref :  '+current_name_str+'    '+info_form.gauge_label.Caption;

                  if plain_track=False then bottom_str:=bottom_str+xing_str;

                  if (ABS(nomrad)<max_rad_test) or (spiral=True)
                     then begin
                            if spiral=False then bottom_str:=bottom_str+'    curved onto '+round_str(nomrad,0)+' mm radius'
                                            else bottom_str:=bottom_str+'    spiral transition curve';
                          end
                     else bottom_str:=bottom_str+'    straight (no curving)';
                end;

        if out_factor<>1 then bottom_str:=bottom_str+'    scaled at '+round_str(out_factor*100,2)+' %';   // page number and scaling.

        bottom_str:=bottom_str+'    '+DateToStr(Date)+'  '+TimeToStr(Time);

        top_str:=' TEMPLOT  v:'+round_str(program_version/100,2)+version_build+'  85a.uk/templot  This drawing contains design elements and data (c) Martin Wynne and OpenTemplot contributors.';
        if box_project_title_str<>'' then top_str:=top_str+'   Project : '+box_project_title_str;

        button_str:=Chr(sheet_across+97)+'/'+IntToStr(sheet_down+1);
        pdf_laz_form.page_panel.Caption:='next  page  is   '+button_str;
        pdf_laz_form.ok_button.Caption:='&create  page  '+button_str;
        pdf_laz_form.omit_page_button.Caption:='&omit  page  '+button_str;

        pdf_laz_form.page_listbox.ItemIndex:=pdf_laz_form.page_listbox.Items.IndexOf(' '+button_str);  // 227a

        pdf_laz_form.row_progressbar.Position:=pdf_laz_form.page_listbox.ItemIndex;                    // 227a

        if all_pages=False
           then begin
                  button_clicked:=False;
                  banner_changed:=False;
                  enable_buttons(sheet_across<max_sheet_across);
                  pdf_laz_form.Show;//Modal;
                  pdf_laz_form.BringToFront;

                  if Application.Terminated=False then Application.ProcessMessages; // otherwise first red outline doesn't show properly.
                  outline_in_red(sheet_down,sheet_across); // show which sheet we mean.

                  repeat
                    if Application.Terminated=False then Application.ProcessMessages
                                                    else BREAK;
                    Sleep(100);                // 227b
                  until button_clicked=True;

                  disable_buttons;

                  if Application.Terminated=False then Application.ProcessMessages;

                  case pdf_laz_form.ModalResult of

                    mrIgnore: begin
                                pdf_laz_form.all_panel.Caption:='create  all  remaining  pages     ';     // 223d
                                CONTINUE;     // omit page - do next down
                              end;

                     mrRetry: begin
                                pdf_laz_form.all_panel.Caption:='create  all  remaining  pages     ';     // 223d
                                BREAK;        // omit row - do next across
                              end;

                        mrOk: begin
                                pdf_laz_form.page_panel.Caption:='preparing  page   '+button_str+'  ...';

                                pdf_laz_form.omit_all_panel.Caption:='omit  all  remaining  pages    F12     ';  // 223d

                                if preview_record_file_made=False   // 214b   first page only
                                   then begin
                                          make_pdf_preview_screenshot;
                                          preview_record_file_made:=True;
                                        end;

                                if output_in_progress=True
                                   then begin
                                          if end_page=False
                                             then EXIT
                                             else RESULT:=RESULT+1;
                                        end;

                                if begin_page=False then EXIT;
                              end;

                    mrCancel: begin
                                if output_in_progress=True  // finish page and omit all remaining
                                   then begin
                                          if end_page=False
                                              then EXIT
                                              else RESULT:=RESULT+1;
                                        end;
                                EXIT;
                              end;

                       mrYes: begin
                                all_pages:=True;

                                pdf_laz_form.page_panel.Caption:='preparing  pages';

                                if preview_record_file_made=False   // 214b   first page only
                                   then begin
                                          make_pdf_preview_screenshot;
                                          preview_record_file_made:=True;
                                        end;

                                if output_in_progress=True
                                   then begin
                                          if end_page=False
                                             then EXIT
                                             else RESULT:=RESULT+1;
                                         end;

                                if begin_page=False then EXIT;
                              end;

                         else run_error(31);
                  end;//case
                end
           else begin      // all pages

                  if Application.Terminated=False then Application.ProcessMessages;

                  if pdf_laz_form.ModalResult=mrCancel   // he's aborted all pages on F12 or Esc
                     then begin
                            if output_in_progress=True   // finish page and omit all remaining
                               then begin
                                      if end_page=False
                                         then EXIT
                                         else RESULT:=RESULT+1;
                                    end;
                            EXIT;
                          end;

                  if preview_record_file_made=False   // 214b   first page only
                     then begin
                            make_pdf_preview_screenshot;
                            preview_record_file_made:=True;
                          end;

                  if output_in_progress=True
                     then begin
                            if end_page=False
                               then EXIT
                               else RESULT:=RESULT+1;
                          end;

                  if begin_page=False then EXIT;
                end;

        with on_canvas do begin

          Font.Assign(print_labels_font);         // for labels

          Brush.Color:=clWhite;
          Brush.Style:=bsSolid;

          FillRect(Rect(0,0,printer_width_indexmax_dots,printer_length_indexmax_dots)); //  this clears the canvas  (pdf_width_dots-1)


          TextOut(0,0,'');      // !!! Delphi bug? This seems to be necessary before dotted lines will draw properly.
                                // TextOut obviously initialises some background mask property which I have been unable
                                // to find or set any other way.


          if (pdf_laz_form.page_ident_checkbox.Checked=True) and (page_count>3)  // 214a show large page ident if many pages
             then begin
                    ident_margin:=Round(nom_width_dpi/10);    // /10   arbitrary

                    if pdf_laz_form.ident_prefix_edit.Text<>''
                       then ident_str:=Trim(pdf_laz_form.ident_prefix_edit.Text)+':'+page_num_str  // 225d
                       else ident_str:=page_num_str;

                    Brush.Style:=bsClear;
                    TextOut(0,0,'');

                    Font.Name:='Courier New';
                    Font.Height:=0-ABS((page_left_dots-page_right_dots)*9 div 23);  // 9/23 trial and error for this font up to z/99

                    if Font.Height>-6 then Font.Height:=-6;   //  smallest sensible  (Height is negative)

                    while (TextWidth(ident_str)+ident_margin*4)>(page_right_dots-page_left_dots) do begin   // reduce to fit if long prefix     *4 arbitrary
                      Font.Height:=Font.Height+1;
                      if Font.Height>-7 then BREAK;
                    end;//while

                    if pdf_black_white=True
                       then begin
                              wm_shift:=1;             // watermark outline shift
                              Font.Color:=clBlack;
                            end
                       else begin
                              wm_shift:=Round(nom_width_dpi/30);   // watermark outline shift /30 arbitrary
                              Font.Color:=$00D0D0D0;               // pale-ish grey
                            end;

                    ident_left:=page_left_dots+(ident_margin+page_right_dots-page_left_dots-TextWidth(ident_str)) div 2;    // extra margin for neatness
                    ident_top:=page_top_dots+(page_bottom_dots-page_top_dots+Font.Height) div 2;

                    TextOut(ident_left-wm_shift,ident_top-wm_shift,ident_str);
                    TextOut(ident_left+wm_shift,ident_top-wm_shift,ident_str);
                    TextOut(ident_left-wm_shift,ident_top+wm_shift,ident_str);
                    TextOut(ident_left+wm_shift,ident_top+wm_shift,ident_str);

                    Font.Color:=clWhite;
                    TextOut(ident_left,ident_top,ident_str);    // ink saving, make watermark outline

                    Brush.Style:=bsSolid;  // reset..
                    Font.Color:=clBlack;
                  end;

          if bgnd_form.output_grid_in_front_checkbox.Checked=True            // do shapes and sb first
             then pdf_shapes_and_sketchboard_items(grid_left,grid_top);      // 206e

          Brush.Color:=clWhite;  // 206e moved here
          Brush.Style:=bsSolid;

              Font.Assign(print_labels_font);

              if printgrid_i=1
                 then begin
                        case grid_labels_code_i of
                                          1: grid_str:='feet';     //  labels in feet.
                                          2: grid_str:='inches';   //  labels in inches.
                                          3: grid_str:='proto-feet'; //  labels in prototype feet.
                                          4: grid_str:='cm';       //  labels in cm.
                                          6: grid_str:='mm';       //  labels in mm.
                                        else run_error(213);
                        end;//case

                        Pen.Color:=printgrid_colour;           // for grid lines.
                        Pen.Mode:=pmCopy;
                        Pen.Cosmetic:=False;
                        Pen.EndCap:=pecFlat;

                        if pad_form.printed_grid_dotted_menu_entry.Checked=True
                           then begin
                                  Brush.Color:=clWhite;  // 0.93.a gaps in dotted lines.
                                  Brush.Style:=bsSolid;

                                  Pen.Style:=psDot;
                                  Pen.Style:=psSolid;

                                  pen_width:=1;         // must be 1 for dots.
                                end
                           else begin
                                  Pen.Style:=psSolid;
                                  pen_width:=printgrid_wide;
                                  if pen_width<1 then pen_width:=1;
                                end;

                           //  draw horizontal grid lines (across width)...

                        if print_pages_top_origin<>0
                           then now_gridx:=0-gridx
                           else now_gridx:=0;        //  init grid lines. no need for first line (gets overwritten by trim margins).

                        repeat
                          now_gridx:=now_gridx+gridx;
                          grid_now_dots:=Round((now_gridx-grid_top)*scal_out)+page_top_dots;
                          if grid_now_dots<0 then CONTINUE;

                          if (now_gridx=0) and (Pen.Style=psSolid)
                             then Pen.Width:=pen_width+2    // thicker datum line (only appears if page origin is negative).
                             else Pen.Width:=pen_width;

                          move_to.X:=left_blanking_dots;          move_to.Y:=grid_now_dots;
                          line_to.X:=printer_width_indexmax_dots; line_to.Y:=grid_now_dots;
                          if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                          case grid_labels_code_i of
                                            1: grid_label:=now_gridx/30480;       //  labels in feet.
                                            2: grid_label:=now_gridx/2540;        //  labels in inches.
                                            3: grid_label:=now_gridx/(100*scale); //  labels in prototype feet.
                                            4: grid_label:=now_gridx/1000;        //  labels in cm.
                                            6: grid_label:=now_gridx/100;         //  labels in mm.
                                          else begin
                                                 grid_label:=0;   // keep the compiler happy.
                                                 run_error(223);
                                               end;
                          end;//case

                          grid_label_str:=FormatFloat('0.###',grid_label);

                          text_out(on_canvas,left_blanking_dots,grid_now_dots-(TextHeight('A') div 2),grid_label_str+' '); //  add labels.

                        until grid_now_dots>page_bottom_dots;

                               //  draw vertical grid lines (down length)...

                        if print_pages_left_origin<>0
                           then now_gridy:=0-gridy
                           else now_gridy:=0;        //  init grid lines. no need for first line (gets overwritten by trim margin).

                        repeat
                          now_gridy:=now_gridy+gridy;
                          grid_now_dots:=Round((now_gridy-grid_left)*scaw_out)+page_left_dots;
                          if grid_now_dots<0 then CONTINUE;

                          if (now_gridy=0) and (Pen.Style=psSolid)
                             then Pen.Width:=pen_width+2    // thicker datum line (appears only if page origin is negative).
                             else Pen.Width:=pen_width;

                          move_to.X:=grid_now_dots; move_to.Y:=top_blanking_dots;
                          line_to.X:=grid_now_dots; line_to.Y:=printer_length_indexmax_dots;
                          if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                          case grid_labels_code_i of
                                            1: grid_label:=now_gridy/30480;       //  labels in feet.
                                            2: grid_label:=now_gridy/2540;        //  labels in inches.
                                            3: grid_label:=now_gridy/(100*scale); //  labels in prototype feet.
                                            4: grid_label:=now_gridy/1000;        //  labels in cm.
                                            6: grid_label:=now_gridy/100;         //  labels in mm.
                                          else begin
                                                 grid_label:=0;   // keep the compiler happy.
                                                 run_error(224);
                                               end;
                          end;//case

                          grid_label_str:=FormatFloat('0.###',grid_label);

                          text_out(on_canvas,grid_now_dots-(TextWidth(grid_label_str) div 2),page_top_dots-(printmargin_wide div 2)-halfmm_dots-TextHeight('A'),grid_label_str); //  add labels.

                        until grid_now_dots>page_right_dots;

                                  // finally add the units string...

                        text_out(on_canvas,left_blanking_dots,page_top_dots-(printmargin_wide div 2)-halfmm_dots-TextHeight('A'),grid_str);  // add the units string.

                        Pen.Style:=psSolid;  // reset in case of dotted.
                      end;

                      // grid finished.

                  //----------------------------------------

              if bgnd_form.output_grid_in_front_checkbox.Checked=False         // now do shapes and sb over the grid
                 then pdf_shapes_and_sketchboard_items(grid_left,grid_top);    // 206e

              pdf_laz_bgnd(grid_left,grid_top);       // now print any background templates.


                     //  control template - draw timbers and all marks except rail joints...

              if  (print_entire_pad_flag=False) // control template
              and (output_diagram_mode=False)   // 0.93.a  no control template if diagram mode
              and (turnoutx>0)                  // not if invalidated

                     // 0.93.a if printing background templates in Quick mode, the control template has been put on the background

                 then begin
                        if marks_list_ptr=nil then BREAK;       // pointer to marks list not valid, exit all sheets.

                        draw_marks(grid_left,grid_top,False,False);   // print all the background timbering and marks except rail joints and timber numbers.

                        if pad_form.timber_numbering_over_platforms_menu_entry.Checked=False
                           then draw_marks(grid_left,grid_top,False,True);                   // 226d and again to do the timber numbers now if wanted under platforms

                             // add dropper symbols under rails..

                        pdf_laz_draw_symbols(on_canvas,current_symbols,0,1,grid_left,grid_top,ypd);  // 227c draw the 0=droppers over timbers   1=first layer

                            // rails and track centre-lines...

                        if ( (print_settings_form.output_centrelines_checkbox.Checked=True) and (dummy_template=False) )       // 212a
                        or ( (print_settings_form.output_bgnd_shapes_checkbox.Checked=True) and (dummy_template=True) )

                           then begin
                                  Brush.Color:=clWhite;  // 0.93.a gaps in dotted lines.
                                  Brush.Style:=bsClear;
                                  TextOut(0,0,'');

                                  Pen.Mode:=pmCopy;

                                  if dummy_template=True   // 212a
                                     then begin
                                            Pen.Style:=psSolid;
                                            Pen.Color:=printshape_colour;

                                            Pen.Width:=printshape_wide;

                                            if Pen.Width<1 then Pen.Width:=1;
                                          end
                                     else begin
                                            Pen.Color:=printcurail_colour;

                                            Pen.Width:=printcl_wide;

                                            if Pen.Width<1 then Pen.Width:=1;

                                            Pen.Style:=psSolid;
                                          end;
                                end;

                        if print_settings_form.output_centrelines_checkbox.Checked=True
                           then begin
                                  Brush.Color:=clWhite;  // 0.93.a gaps in dotted lines.
                                  Brush.Style:=bsClear;
                                  TextOut(0,0,'');

                                  Pen.Color:=printcurail_colour;
                                  Pen.Mode:=pmCopy;

                                  Pen.Style:=psDash;   // results are unpredictable because of short lines (incx).
                                  Pen.Width:=1;

                                                 // mods for track centre-lines  0.79.a  ...

                                  Pen.Width:=printcl_wide;
                                  if Pen.Width<1 then Pen.Width:=1;

                                  if Pen.Width=1 then Pen.Style:=psDash
                                                 else Pen.Style:=psSolid;



                                  for aq:=24 to 25 do begin
                                    if ( (plain_track=False) or (aq=24) ) and (aqyn[aq]=True)

                                            // main side only only if plain track, and data available ?

                                       then begin
                                              move_to.X:=get_w_dots(aq,0); move_to.Y:=get_l_dots(aq,0);
                                              for now:=1 to nlmax_array[aq] do begin
                                                line_to.X:=get_w_dots(aq,now); line_to.Y:=get_l_dots(aq,now);
                                                if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                                move_to:=line_to;
                                              end;//for
                                            end;
                                  end;//next aq
                                end;//if track centre-lines.

                        if (print_settings_form.output_rails_checkbox.Checked=True) or ( (detail_mode_form.thickcl_radio.Checked=True) and (detail_mode_form.no_platforms_radio.Checked=False) )    // 226e
                           then begin
                                              //  draw turnout rails...

                                  Pen.Width:=printrail_wide;
                                  if Pen.Width<1 then Pen.Width:=1;

                                  if (rail_infill_i=0)  // out for pdf, was  or ((scale*out_factor)<0.75)   // less than 18.75% for 4mm scale (control template) (10.71% for 7mm).
                                     then begin           //  outline (pen) mode ...
                                                          //  n.b. this mode does not automatically close the rail-ends.

                                            for aq:=0 to 23 do begin                                // 24, 25 centre-lines already done.
                                              if (adjacent_edges=False) and (aq>15) then CONTINUE;  // no adjacent tracks in output  // 206b

                                              if (detail_mode_form.thickcl_radio.Checked=True) and (aq<16) and (aq>23) then CONTINUE;   // 226c add only platforms if centre-lines only

                                              case aq of     // 223d
                                                16,17,20,21: if print_settings_form.output_platforms_checkbox.Checked=False then CONTINUE;         // platforms not wanted
                                                18,19,22,23: if print_settings_form.output_trackbed_edges_checkbox.Checked=False then CONTINUE;    // trackbed edges not wanted
                                              end;//case

                                              draw_outline_railedge(aq,printcurail_colour);
                                            end;//next aq

                                            for aq:=26 to aq_max_c do draw_outline_railedge(aq,printcurail_colour);  // K-crossing check rails.

                                            outline_railends;     // finally do the rail ends for outline mode
                                          end
                                     else begin      // infill (polygon) mode ...

                                                     // do blades first - neater result.

                                            if detail_mode_form.thickcl_radio.Checked=False   // 226c
                                               then begin

                                                      for rail:=1 to 3 do draw_fill_rail(8);  // closure rails and curved stock rail.

                                                      rail:=0;                                // straight stock rail.
                                                      draw_fill_rail(8);

                                                      for rail:=6 to 7 do draw_fill_rail(8);  // check rails

                                                    end; // 226c

                                            if adjacent_edges=True    // 206b
                                               then begin
                                                      rail:=16;
                                                      repeat
                                                        case rail of     // 223d
                                                          16,20: if print_settings_form.output_platforms_checkbox.Checked=True then draw_fill_rail(1);        // platforms
                                                          18,22: if print_settings_form.output_trackbed_edges_checkbox.Checked=True then draw_fill_rail(1);   // trackbed edges
                                                        end;//case
                                                        rail:=rail+2;
                                                      until rail>22;
                                                    end;

                                          if detail_mode_form.thickcl_radio.Checked=False   // 226c
                                             then begin
                                                    rail:=26;
                                                    repeat
                                                      draw_fill_rail(1);      // K-crossing MS check rails.
                                                      rail:=rail+2;
                                                    until rail>28;

                                                    draw_fill_vee;   // now do the vee.

                                                              // finally draw in or overdraw the planing gauge-faces - (no infill) ...
                                                    aq:=1;
                                                    if (plain_track=False) and (gaunt=False) and (aqyn[1]=True) and (list_planing_mark_aq1>0) {and (drawn_full_aq1=False)}    // not if already drawn.
                                                       then begin
                                                              move_to.X:=get_w_dots(aq,0); move_to.Y:=get_l_dots(aq,0);
                                                              for now:=1 to list_planing_mark_aq1{+1} do begin                    // +1 to overdraw
                                                                line_to.X:=get_w_dots(aq,now); line_to.Y:=get_l_dots(aq,now);
                                                                if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                                                move_to:=line_to;
                                                              end;//for
                                                            end;

                                                    aq:=2;
                                                    if (plain_track=False) and (gaunt=False) and (aqyn[2]=True)  and (list_planing_mark_aq2>0) {and (drawn_full_aq2=False)}    // not if already drawn.
                                                       then begin
                                                              move_to.X:=get_w_dots(aq,0); move_to.Y:=get_l_dots(aq,0);
                                                              for now:=1 to list_planing_mark_aq2{+1} do begin                      // +1 to overdraw
                                                                line_to.X:=get_w_dots(aq,now); line_to.Y:=get_l_dots(aq,now);
                                                                if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                                                move_to:=line_to;
                                                              end;//for
                                                            end;

                                                          //  CAN'T GET FLOODFILL TO WORK ON THE PRINTER 26-8-98.
                                                          // and flood fill the planing with the margin colour ...

                                                          //Brush.Bitmap:=nil;     // so can use style again if it was dots.
                                                  end; // 226c

                                          end;//polygon mode

                                       // add ID text, gaps and sticker symbols over the rails..

                                  pdf_laz_draw_symbols(on_canvas,current_symbols,0,2,grid_left,grid_top,ypd);  // 227c
                                  pdf_laz_draw_symbols(on_canvas,current_symbols,1,2,grid_left,grid_top,ypd);  // 227a draw the 1=gaps           2=second layer
                                  pdf_laz_draw_symbols(on_canvas,current_symbols,2,2,grid_left,grid_top,ypd);  // 227a draw the 2=stickers       2=second layer

                                       // finally add rail joint marks across rails (will now mark over rail infill) and timber numbers over platforms ...  226d

                                  draw_marks(grid_left,grid_top,True,False);

                                  if pad_form.timber_numbering_over_platforms_menu_entry.Checked=True    // 226d
                                     then draw_marks(grid_left,grid_top,False,True);

                                end;//if rails

                      end;// if control template

                      // now the trim margins....

              Pen.Color:=printmargin_colour;
              Pen.Mode:=pmCopy;
              Pen.Style:=psSolid;
              Pen.Width:=printmargin_wide;

                 // draw top trim margin...

              move_to.X:=left_blanking_dots;          move_to.Y:=page_top_dots;   // paper top left.
              line_to.X:=printer_width_indexmax_dots; line_to.Y:=page_top_dots;   // paper top margin.
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                 // and right-hand alignment targets...

              move_to.X:=page_right_dots; move_to.Y:=top_blanking_dots;
              line_to.X:=page_right_dots; line_to.Y:=printer_length_indexmax_dots;                    // paper right margin.
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

              move_to.X:=page_right_dots-alignmarks_inner_dots;
              line_to.X:=printer_width_indexmax_dots;

              move_to.Y:=page_quarter_dots;  // right 1/4 target.
              line_to.Y:=page_quarter_dots;
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

              move_to.Y:=page_mid_dots;      // right centre target.
              line_to.Y:=page_mid_dots;
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

              move_to.Y:=page_3quarter_dots; // right 3/4 target.
              line_to.Y:=page_3quarter_dots;
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                  //  don't show bottom trim line on the last sheet down, otherwise he might trim off the info line,
                  //  and no bottom trim lines on any sheet for banners, unless for multiple print runs.

              if sheet_down<sheet_co_long
                 then begin
                        if sheet[sheet_down+1,sheet_across].empty=False   // something on next page down ?
                           then begin
                                  move_to.X:=left_blanking_dots;          move_to.Y:=page_bottom_dots;
                                  line_to.X:=printer_width_indexmax_dots; line_to.Y:=page_bottom_dots;    // paper bottom margin.
                                  if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                 end;
                      end;

              if (want_bottom_margin=True) and (sheet_down=sheet_co_long)   // wanted for multiple print runs...
                 then begin
                        move_to.X:=left_blanking_dots;          move_to.Y:=page_bottom_dots;
                        line_to.X:=printer_width_indexmax_dots; line_to.Y:=page_bottom_dots;    // paper bottom margin.
                        if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                      end;

              move_to.X:=page_left_dots; move_to.Y:=top_blanking_dots;
              line_to.X:=page_left_dots; line_to.Y:=printer_length_indexmax_dots;               // paper left margin.
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

              move_to.X:=page_left_dots-alignmarks_inner_dots;   // default 3 mm each way.
              line_to.X:=page_left_dots+alignmarks_inner_dots;
              if move_to.X<left_blanking_dots then move_to.X:=left_blanking_dots;

              move_to.Y:=page_quarter_dots;    // left 1/4 target.
              line_to.Y:=page_quarter_dots;
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

              move_to.Y:=page_mid_dots;        // left centre target.
              line_to.Y:=page_mid_dots;
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

              move_to.Y:=page_3quarter_dots;   // left 3/4 target.
              line_to.Y:=page_3quarter_dots;
              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                  // trim margins finished.

              //----------------------

                 //  now any margin blanking (outside the trim margins)...
                 //  (+1 to ensure complete blanking on all printers.)

              Brush.Color:=clWhite;
              Brush.Style:=bsSolid;

              Pen.Color:=clWhite;
              Pen.Style:=psSolid;
              Pen.Width:=1;
              Pen.Mode:=pmCopy;

              if left_blanking_dots>0 then Rectangle(0,0,left_blanking_dots,printer_length_indexmax_dots+1);
              if right_blanking_dots<=printer_width_indexmax_dots then Rectangle(right_blanking_dots,0,printer_width_indexmax_dots+1,printer_length_indexmax_dots+1);

              if top_blanking_dots>0 then Rectangle(0,0,printer_width_indexmax_dots+1,top_blanking_dots);
              if bottom_blanking_dots<=printer_length_indexmax_dots then Rectangle(0,bottom_blanking_dots,printer_width_indexmax_dots+1,printer_length_indexmax_dots+1);

                       // top branding...

              Brush.Color:=clWhite;
              Brush.Style:=bsSolid;

              Font.Assign(set_font('Arial',6,[],clBlack));

              text_out(on_canvas,left_blanking_dots,top_blanking_dots,top_str);  // name string at topleft.

                    // small text inside the margins...

                    // mods 208g  20-04-2014  show page origin dims on templates...

              if print_entire_pad_flag=True        // 214a  for Gordon, see message ref: 19595   // background templates
                 then begin
                        if keep_form.box_file_label.Caption<>''
                           then last_file_str:='  printing from: '+ExtractFileName(keep_form.box_file_label.Caption)
                           else last_file_str:='  printing background templates';
                      end
                 else last_file_str:='  printing the control template';

              if pad_form.show_margin_coordinates_menu_entry.Checked=True
                 then begin
                        all_pages_origin_str:='all pages origin (a/1): top(X)='+round_str(print_pages_top_origin,2)+'mm, left(Y)='+round_str(print_pages_left_origin,2)+'mm      ';     // 208g
                        this_page_begin_str:='this page begins: top(X)='+round_str(grid_top/100,2)+'mm, left(Y)='+round_str(grid_left/100,2)+'mm'+last_file_str;                        // 208g
                        this_page_end_str:='this page ends: bottom(X)='+round_str(grid_bottom/100,2)+'mm, right(Y)='+round_str(grid_right/100,2)+'mm';                                  // 208g
                      end
                 else begin
                        all_pages_origin_str:='';
                        this_page_begin_str:=last_file_str;
                        this_page_end_str:='';
                      end;

              if pad_form.show_corner_info_menu_entry.Checked=True    // 223d
                 then begin

                        Font.Assign(print_corner_page_numbers_font);                           // 0.93.a
                        if print_corner_page_numbers_font.Size>8
                           then begin
                                  Brush.Style:=bsClear;
                                  TextOut(0,0,'');
                                end;

                        Textout(page_left_dots+printmargin_wide+3, page_top_dots+printmargin_wide+2, this_page_begin_str);                                                                                // top left corner
                        Textout(page_left_dots+printmargin_wide+3, page_bottom_dots+Font.Height-printmargin_wide-4, page_num_str+'   '+box_project_title_str+'   '+DateToStr(Date)+' '+TimeToStr(Time));  // bottom left corner
                        Textout(page_right_dots-printmargin_wide-TextWidth(all_pages_origin_str+page_num_str)-3,page_top_dots+printmargin_wide+2,all_pages_origin_str+page_num_str);                      // top right corner
                        Textout(page_right_dots-printmargin_wide-TextWidth(this_page_end_str)-3,page_bottom_dots+Font.Height-printmargin_wide-4,this_page_end_str);                                       // bottom right corner
                      end;

              if distortions<>0
                 then begin
                        Font.Assign(set_font('Arial',7,[],printmargin_colour));

                        text_out(on_canvas,page_left_dots+printmargin_wide,page_top_dots+printmargin_wide-(Font.Height*5),
                                '  Warning :  Data distortions are in force.  This template may not be dimensionally accurate.');
                      end;

              Font.Assign(print_labels_font);  // reset for labels.

              Font.Color:=calc_intensity(clBlack);
              Brush.Color:=clWhite;
              Brush.Style:=bsClear;   // transparent over detail.
              TextOut(0,0,'');

              TextOut(left_blanking_dots,page_bottom_dots+(printmargin_wide div 2)+halfmm_dots,page_str+bottom_str); // add the bottom string last.

              Font.Assign(print_labels_font);  // reset for labels.
              Brush.Style:=bsSolid;

            end;//with Canvas 0.91.d pdf
          end;//with sheet

      end;// 227a while
    end;// 227a while

    if output_in_progress=True     // last or only page
       then begin
              if end_page=False
                 then EXIT
                 else RESULT:=RESULT+1;
            end;

  finally
            // 226c ...

    if (diagram_partials_omitted=True) and (diagram_partial_msg_pref=False)      // php/910    diagram-mode no partial templates
       then begin
              alert_box.preferences_checkbox.Checked:=False;
              alert_box.preferences_checkbox.Tag:=1;          // no what's this note about prefs
              alert_box.preferences_checkbox.Show;

              alert(2,'php/910    diagram-mode  -  partial  templates  omitted',
                      'Your trackplan includes some partial templates which it has not been possible to include in `0diagram-mode`3 PDF output.'
                     +'||For example templates in complex formations such as a tandem turnout or a slip.'
                     +'||Please click `0more information online`1 above, for more explanation and suggested solutions.'
                     +'||<b>•</b> This does not apply to normal `0detail-mode`3 output|    of construction templates.',
                      '','','','','','continue',0);

              diagram_partial_msg_pref:=alert_box.preferences_checkbox.Checked;

              alert_box.preferences_checkbox.Hide;
              alert_box.preferences_checkbox.Tag:=0;  // restore
            end;

    print_busy:=False;
    enable_buttons(True);        // ?? not really needed.
    pdf_laz_form.Close;

  end;//try

end;
//_____________________________________________________________________________________

procedure Tpdf_laz_form.FormShow(Sender: TObject);

begin
  detail_mode_radiobutton.Checked:= NOT output_diagram_mode;
  diagram_mode_radiobutton.Checked:= output_diagram_mode;

  Left:=pad_form.Left+pad_form.Width-Width-20;

  if info_form.Showing=True                // don't want the info cluttering the print preview.
     then begin
            info_was_showing:=True;
            pad_form.hide_info_menu_entry.Click;
          end
     else info_was_showing:=False;

  if panning_form.Showing=True             // nor the panning controls.
     then begin
            panning_was_showing:=True;
            panning_form.Hide;
          end
     else panning_was_showing:=False;

  if shove_timber_form.Showing=True        // nor the shove timbers form.
     then begin
            shove_was_showing:=True;
            shove_timber_form.Hide;
          end
     else shove_was_showing:=False;

  if grid_form.Showing=True                // nor the spacing ring form.
     then begin
            spacing_was_showing:=True;
            grid_form.Hide;
          end
     else spacing_was_showing:=False;


       // bugs fixed -- 208d ...

  if rail_options_form.Showing=True            // nor this
     then begin
            rail_options_was_showing:=True;
            rail_options_form.Hide;
          end
     else rail_options_was_showing:=False;

  if platform_form.Showing=True                // nor this
     then begin
            platform_was_showing:=True;
            platform_form.Hide;
          end
     else platform_was_showing:=False;

  if trackbed_form.Showing=True                // nor this
     then begin
            trackbed_was_showing:=True;
            trackbed_form.Hide;
          end
     else trackbed_was_showing:=False;

  if check_diffs_form.Showing=True             // nor this
     then begin
            check_diffs_was_showing:=True;
            check_diffs_form.Hide;
          end
     else check_diffs_was_showing:=False;

  if data_child_form.Showing=True              // nor this
     then begin
            data_child_was_showing:=True;
            data_child_form.Hide;
          end
     else data_child_was_showing:=False;

  if stay_visible_form.Showing=True            // nor this
     then begin
            stay_visible_was_showing:=True;
            stay_visible_form.Hide;
          end
     else stay_visible_was_showing:=False;

  if brick_form.Showing=True            // nor this   235b
     then begin
            brick_was_showing:=True;
            brick_form.Hide;
          end
     else brick_was_showing:=False;

       //----------
  
  if all_button.Enabled=True then all_button.SetFocus;

  if print_entire_pad_flag=True
    then begin
           if print_group_only_flag=True
              then Caption:=' create  PDF  file :  group  templates  only'
              else Caption:=' create  PDF  file :  background  templates';
         end
    else Caption:=' create  PDF  file :  the  control  template';

  if fit_single_sheet=True then Caption:=Caption+'  on  a  single  page';

  pad_form.top_toolbar_panel.Hide;
  pad_form.second_toolbar_panel.Hide;   // 217a

  pad_form.brick_button.Hide;       // 235b..
  pad_form.store_draw_button.Hide;

  make_slip_form.Hide;   // toolbars marker

  show_output_mode_panel;
  
end;
//_________________________________________________________________________________________

procedure Tpdf_laz_form.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  if Key=VK_F10
     then begin
            Key:=0;      //  otherwise selects the menus.
          end;

  if Key=VK_PAUSE then Application.Minimize;        //  hide TEMPLOT on PAUSE key.

  if Key=VK_F12                  // same as cancel, but unlocks the redraw
     then begin
            Key:=0;
            pdf_laz_form.omit_all_button.Click;
            pad_form.redraw_menu_entry.Click;       // unlock the redraw if locked.
          end;
end;
//________________________________________________________________________________________

procedure Tpdf_laz_form.colour_panelClick(Sender: TObject);

begin
  Color:=get_colour('choose  a  new  colour  for  the  print  information  window',Color);
  button_clicked:=False;     // overide the print form Deactivate.
end;
//_________________________________________________________________________________________

procedure Tpdf_laz_form.size_updownClick(Sender: TObject; Button: TUDBtnType);

begin
  form_scaling:=True;    // no ScrollInView on resize.

  if size_updown.Position>size_updown.Tag                          // ! position goes up, size goes down.
     then ScaleBy(9,10);                                           // scale the form contents down.

  if size_updown.Position<size_updown.Tag
     then ScaleBy(10,9);                                           // scale the form contents up.

  ClientHeight:=VertScrollBar.Range;                               // allow 4 pixel right margin.
  ClientWidth:=HorzScrollBar.Range+4;                              // don't need bottom margin - datestamp label provides this.
  ClientHeight:=VertScrollBar.Range;                               // do this twice, as each affects the other.

  size_updown.Tag:=size_updown.Position;                           // and save for the next click.

  form_scaling:=False;
end;
//__________________________________________________________________________________________

procedure Tpdf_laz_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=648;
  ClientHeight:=252;
  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Tpdf_laz_form.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  button_clicked:=True;
  ModalResult:=mrCancel;

  if spacing_was_showing=True then pad_form.spacing_ring_menu_entry.Click;
  if shove_was_showing=True then pad_form.shove_timbers_menu_entry.Click;
  if panning_was_showing=True then pad_form.show_pan_controls_menu_entry.Click;
  if info_was_showing=True then pad_form.show_info_menu_entry.Click;

    // bug fixes 208d ...

  if rail_options_was_showing=True then pad_form.omit_rails_joints_menu_entry.Click;
  if platform_was_showing=True then pad_form.platform_edges_menu_entry.Click;
  if trackbed_was_showing=True then pad_form.trackbed_ballast_edges_menu_entry.Click;
  if check_diffs_was_showing=True then pad_form.differ_check_rails_menu_entry.Click;
  if data_child_was_showing=True then data_child_form.Show;
  if stay_visible_was_showing=True then stay_visible_form.Show;
  if brick_was_showing=True then brick_form.Show;   // 235b

  pad_form.top_toolbar_panel.Show;
  pad_form.second_toolbar_panel.Show;   // 217a

  pad_form.brick_button.Show;       // 235b..
  pad_form.store_draw_button.Show;

  if Screen.Width>(make_slip_form.Width+pad_form.top_toolbar_panel.Width) then make_slip_form.Show;   // toolbars marker

  pad_form.output_mode_panel.Visible:=False;

end;
//______________________________________________________________________________

procedure Tpdf_laz_form.omit_all_buttonClick(Sender: TObject);

begin
  button_clicked:=True;
  ModalResult:=mrCancel;  // clicking the panel instead of the button doesn't set this.
end;
//______________________________________________________________________________

procedure Tpdf_laz_form.next_row_buttonClick(Sender: TObject);

begin
  button_clicked:=True;       // ModalResult = mrRetry
end;
//_________________________________________________________________________________________

procedure Tpdf_laz_form.omit_page_buttonClick(Sender: TObject);

begin
  button_clicked:=True;       // ModalResult = mrIgnore
end;
//________________________________________________________________________________________

procedure Tpdf_laz_form.ok_buttonClick(Sender: TObject);

begin
  button_clicked:=True;       // ModalResult = mrOK
end;
//_________________________________________________________________________________________

procedure Tpdf_laz_form.all_buttonClick(Sender: TObject);

begin
  button_clicked:=True;
  ModalResult:=mrYes;     // clicking the panel instead of the button doesn't set this.
end;
//_________________________________________________________________________________________

procedure Tpdf_laz_form.FormDeactivate(Sender: TObject);

begin
  if print_busy=True          // don't let him click off the form.
     then begin
            Beep;
            Show;
            BringToFront;
            EXIT;
          end;

  button_clicked:=True;
  ModalResult:=mrCancel;
end;
//________________________________________________________________________________________

procedure pdf_laz_bgnd_shapes(grid_left,grid_top:extended);  // print all background shapes.

var
  i,maxbg_index:integer;
  font_size:integer;

  arm,diamond:extended;

  now_shape:Tbgnd_shape;
  move_to,line_to:TPoint;
  raster_rect:TRect;

  dummy_bitmap:TBitmap;
  dummy_rect:TRect;

  // 236d  for twisted rectangles ...

    infill_points:array[0..3] of TPoint;


    infill_points_pex:array[0..3] of Tpex;

    rect_centx,rect_centy:extended;

    n:integer;

                ////////////////////////////////////////////////////////////////

                procedure rotate_4p(rot,x1,y1:extended; var p1,p2,p3,p4:Tpex);     // rotate 4 points     236d

                begin
                  dotransform(rot,x1,y1,p1,p1);
                  dotransform(rot,x1,y1,p2,p2);
                  dotransform(rot,x1,y1,p3,p3);
                  dotransform(rot,x1,y1,p4,p4);
                end;
                ////////////////////////////////////////////////////////////////


begin
  if print_settings_form.output_bgnd_shapes_checkbox.Checked=False then EXIT;

  maxbg_index:=bgnd_form.bgnd_shapes_listbox.Items.Count-1;

  if maxbg_index<0 then EXIT;

  with on_canvas do begin        // metafile canvas

    Font.Assign(shapes_label_font);
    Font.Color:=printshape_colour;

    font_size:=Round(Font.Size*out_factor);
    if font_size<2 then font_size:=2;
    Font.Size:=font_size;

    Pen.Mode:=pmCopy;

    for i:=0 to maxbg_index do begin
      Pen.Style:=psSolid;
      Pen.Color:=printshape_colour;   // it changes for a label or monochrome picture.
      Pen.Width:=printshape_wide;     // it changes for a picture border.

      now_shape:=Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgnd_shape;     // next shape.

      with now_shape do begin

        if (hide_bits AND $02)<>0 then CONTINUE;   // shape hidden for output

        if shape_code<>4    // not a target mark
           then begin

                  case shape_style of
                                0: begin
                                     Brush.Color:=clWhite;
                                     Brush.Style:=bsClear;      // transparent. (also lines).
                                     TextOut(0,0,'');
                                   end;
                                1: begin
                                     if pdf_black_white=True        // 0.93.a   -- use timber infill colour
                                        then Brush.Color:=clWhite
                                        else Brush.Color:=printtimber_infill_colour;

                                     Brush.Style:=bsSolid;      // blank out.
                                   end;

                                2: begin
                                     Brush.Color:=Pen.Color;
                                     Brush.Style:=bsDiagCross;  // cross-hatched.

                                     TextOut(0,0,'');      // !!! Delphi bug? This seems to be necessary before dotted lines will draw properly.
                                                           // TextOut obviously initialises some background mask property which I have been unable
                                                           // to find or set any other way.

                                     if shape_code=0 then Pen.Style:=psDot; // dashed line.

                                     Pen.Style:=psSolid;

                                   end;

                              else begin
                                     Brush.Color:=clWhite;
                                     Brush.Style:=bsClear;      // transparent.
                                     TextOut(0,0,'');
                                   end;
                  end;//case

                  move_to.X:=Round((p1.y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  move_to.Y:=Round((p1.x*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  if shape_code=3      // label rectangle..
                     then begin
                            Font.Color:=printshape_colour;
                            line_to.X:=move_to.X+TextWidth(shape_name+'    ');  // 0.93.a add 4 spaces  // was +5
                            line_to.Y:=move_to.Y+ABS(Font.Height*4 div 3);      // 0.93.a // was +5
                            Brush.Color:=clWhite;
                            Brush.Style:=bsSolid;             // blank rectangle box for label.
                            Pen.Color:=Font.Color;
                            Pen.Width:=ABS(Font.Height div 24);   // 0.93.a added arbitrary
                            if Pen.Width<1 then Pen.Width:=1;
                          end
                     else begin
                            line_to.X:=Round((p2.y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                            line_to.Y:=Round((p2.x*100+re_org_x-grid_top)*scal_out)+page_top_dots;
                          end;

                  if shape_code<>1      // 236d  label rectangle..
                     then begin
                            if (move_to.X<0) and (line_to.X<0) then CONTINUE;                                                        // not on this page.
                            if (move_to.X>printer_width_indexmax_dots) and (line_to.X>printer_width_indexmax_dots) then CONTINUE;    // not on this page.

                            if (move_to.Y<0) and (line_to.Y<0) then CONTINUE;                                                        // not on this page.
                            if (move_to.Y>printer_length_indexmax_dots) and (line_to.Y>printer_length_indexmax_dots) then CONTINUE;  // not on this page.
                          end;

                  if check_limits(move_to, line_to)=True
                      then begin
                             case shape_code of

                                    -1: begin     // picture = bitmap image.  !!! needs 90 deg rotate. 9-2-01.

                                           if pdf_laz_form.include_pictures_checkbox.Checked=True
                                             then begin
                                                    raster_rect.Left:=move_to.X;
                                                    raster_rect.Top:=move_to.Y;

                                                    raster_rect.Right:=line_to.X;
                                                    raster_rect.Bottom:=line_to.Y;

                                                    if Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgnd_shape.picture_is_metafile=True
                                                       then begin
                                                                   // metafile...     214a

                                                                   // wPDF pdf_printer Canvas bug - stretchdrawing rotated metafiles gives angle error
                                                                   // convert it to a bitmap and copy to pdf Canvas instead.
                                                                   // this means metafiles no longer transparent on PDF...

                                                              dummy_bitmap:=TBitmap.Create;

                                                              dummy_bitmap.Width:=raster_rect.Right-raster_rect.Left;
                                                              dummy_bitmap.Height:=raster_rect.Bottom-raster_rect.Top;

                                                              dummy_rect:=Rect(0,0,dummy_bitmap.Width,dummy_bitmap.Height);

                                                                    // blank to start...

                                                              with dummy_bitmap.Canvas do begin
                                                                Brush.Color:=on_canvas.Brush.Color;
                                                                Brush.Style:=bsSolid;
                                                                FillRect(dummy_rect);
                                                                TextOut(0,0,'');      // !!! Delphi bug?
                                                              end;//with

                                                              try
                                                                dummy_bitmap.Canvas.StretchDraw(dummy_rect,Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgimage.image_shape.rotated_picture.Graphic);   // draw rotated metafile on it

                                                                CopyMode:=cmSrcCopy;
                                                                CopyRect(raster_rect,dummy_bitmap.Canvas,dummy_rect); // and copy it to PDF.

                                                              except
                                                                Pen.Color:=printshape_colour;
                                                                Brush.Color:=Pen.Color;       // metafile failed - draw hatched outline.
                                                                Brush.Style:=bsBDiagonal;
                                                                Rectangle(move_to.X, move_to.Y, line_to.X, line_to.Y);
                                                              end;//try

                                                              dummy_bitmap.Free;

                                                            end     //end metafile

                                                       else begin   // bitmap...
                                                              try
                                                                if Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgimage.image_shape.rotated_bitmap.Empty=True
                                                                   then begin
                                                                          pdf_rotate_bitmap(i);
                                                                          Application.ProcessMessages;   // this seems to be necessary for StretchDraw to work first time.
                                                                        end;

                                                                if Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgnd_shape.show_transparent=True  // 0.93.a moved into file
                                                                   then CopyMode:=cmSrcAnd	    // (destination Canvas) transparent if on white background.
                                                                   else CopyMode:=cmSrcCopy;        // reset normal for destination Canvas.

                                                                if Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgimage.image_shape.rotated_bitmap.Monochrome=True
                                                                   then begin
                                                                          Brush.Style:=bsSolid;    //!!! these are all needed to get StretchDraw to work with monochrome bitmaps
                                                                          Brush.Color:=clWhite;
                                                                          Pen.Color:=clBlack;
                                                                          Font.Color:=clBlack;  // !!!! including this.
                                                                          TextOut(0,0,'');      // !!! Delphi bug?
                                                                                                // TextOut obviously initialises some background mask property which I have been unable
                                                                                                // to find or set any other way.
                                                                        end;

                                                                StretchDraw(raster_rect,Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgimage.image_shape.rotated_picture.Graphic);

                                                                CopyMode:=cmSrcCopy;   // reset normal for destination Canvas.

                                                              except
                                                                CopyMode:=cmSrcCopy;          // reset normal for destination Canvas.
                                                                Pen.Color:=printshape_colour;
                                                                Brush.Color:=Pen.Color;       // stretch failed - draw hatched outline.
                                                                Brush.Style:=bsBDiagonal;
                                                                Rectangle(move_to.X, move_to.Y, line_to.X, line_to.Y);
                                                              end;//try

                                                            end;// bitmap
                                                  end;//include pictures

                                          if (pdf_laz_form.picture_borders_checkbox.Checked=True) or (pdf_laz_form.include_pictures_checkbox.Checked=False) // or (pdf_laz_form.picture_outlines_radio.Checked=True)
                                             then begin
                                                    if pdf_laz_form.include_pictures_checkbox.Checked=True {pdf_laz_form.picture_outlines_radio.Checked=False}
                                                       then Pen.Width:=printpicborder_wide;    // picture borders thinner unless an outline only.
                                                    Pen.Color:=printshape_colour;
                                                    Brush.Color:=clWhite;
                                                    Brush.Style:=bsClear;
                                                    TextOut(0,0,'');
                                                    Rectangle(move_to.X, move_to.Y, line_to.X, line_to.Y);
                                                  end;

                                          if pdf_laz_form.include_pictures_checkbox.Checked=False   // pdf_laz_form.picture_outlines_radio.Checked=True
                                             then begin
                                                    MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y);  // printing picture outlines only - draw diagonal line.
                                                    MoveTo(move_to.X, line_to.Y); LineTo(line_to.X, move_to.Y);  // and other diagonal line.
                                                  end;
                                        end;//-1

                                     0: begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;


                                     1: begin     //  mods for twist rectangle  236d ...

                                          rect_centx:=(p1.x+p2.x)/2;  // centre of rectangle..
                                          rect_centy:=(p1.y+p2.y)/2;

                                          with infill_points_pex[0] do begin x:=p1.x; y:=p1.y; end;
                                          with infill_points_pex[1] do begin x:=p1.x; y:=p2.y; end;
                                          with infill_points_pex[2] do begin x:=p2.x; y:=p2.y; end;
                                          with infill_points_pex[3] do begin x:=p2.x; y:=p1.y; end;

                                          rotate_4p(rect_rot,rect_centx,rect_centy,infill_points_pex[0],infill_points_pex[1],infill_points_pex[2],infill_points_pex[3]);     // rotate 4 points

                                          for n:=0 to 3 do begin
                                            infill_points[n].X:=Round((infill_points_pex[n].y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                                            infill_points[n].Y:=Round((infill_points_pex[n].x*100+re_org_x-grid_top)*scal_out)+page_top_dots;
                                          end;//next

                                          Polygon(Slice(infill_points,4));   // number of points, not index
                                        end;

                                     2: Ellipse(move_to.X, move_to.Y, line_to.X, line_to.Y);

                                     3: Rectangle(move_to.X, move_to.Y, line_to.X, line_to.Y);      // label shape

                             end;//case

                             if shape_code=3
                                then begin
                                       Brush.Color:=clWhite;
                                       Brush.Style:=bsClear;
                                       TextOut(move_to.X,move_to.Y,'   '+shape_name);    // 0.93.a 2 spaces  // was +1  // insert label text in rectangle box.
                                     end;
                           end;

                end
           else begin    // shape_code=4, draw a target mark

                  arm:=p2.x;        // cross arm length.
                  diamond:=arm/2;   // size of centre diamond.

                  move_to.X:=Round((p1.y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;          // lengthwise arms...
                  move_to.Y:=Round(((p1.x-arm)*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  line_to.X:=move_to.X;
                  line_to.Y:=Round(((p1.x+arm)*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  if check_limits(move_to, line_to)=True
                     then begin
                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);   // draw lengthwise arms.
                          end;

                  move_to.X:=Round(((p1.y-arm)*100+re_org_y-grid_left)*scaw_out)+page_left_dots;    // widthwise arms...
                  move_to.Y:=Round((p1.x*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  line_to.X:=Round(((p1.y+arm)*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  line_to.Y:=move_to.Y;

                  if check_limits(move_to, line_to)=True
                     then begin
                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);   // draw widthwise arms.
                          end;

                     // now do 4 diamond lines...

                                // NW line...

                  move_to.X:=Round((p1.y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  move_to.Y:=Round(((p1.x-diamond)*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  line_to.X:=Round(((p1.y+diamond)*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  line_to.Y:=Round((p1.x*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  if check_limits(move_to, line_to)=True
                     then begin
                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);
                          end;

                  move_to:=line_to;      // NE line...
                  line_to.X:=Round((p1.y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  line_to.Y:=Round(((p1.x+diamond)*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  if check_limits(move_to, line_to)=True
                     then begin
                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);
                          end;

                  move_to:=line_to;      // SE line...
                  line_to.X:=Round(((p1.y-diamond)*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  line_to.Y:=Round((p1.x*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  if check_limits(move_to, line_to)=True
                     then begin
                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);
                          end;

                  move_to:=line_to;      // SW line...
                  line_to.X:=Round((p1.y*100+re_org_y-grid_left)*scaw_out)+page_left_dots;
                  line_to.Y:=Round(((p1.x-diamond)*100+re_org_x-grid_top)*scal_out)+page_top_dots;

                  if check_limits(move_to, line_to)=True
                     then begin
                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);
                          end;
                end;

      end;//with now_shape
    end;//for next i
  end;//with on_canvas

end;
//_______________________________________________________________________________________

procedure pdf_laz_bgnd_marks(grid_left,grid_top:extended; maxbg_index:integer; rail_joints_now,numbers_now:boolean);  // print all the background timbering and marks.

    // if rail_joints_now=True draw only the rail joints, otherwise omit them.
    // if numbers_now=True draw only the timber numbers, otherwise omit them.   // 226d
    // !!! NOT BOTH TRUE AT SAME TIME

var
  i,n:integer;

  //----------------------------------------------------------------------
  // SC 13-SEP-2024 556
  p:array[0..27] of TPoint;

  ptr_1st,ptr_2nd:^Tmark;          // pointers to a Tmark record.   ###

  ptr_3rd:^Tmark;

  pn,pnn:integer;

  dummy_i:integer;

  list_chair_code:integer;   // MW 03-08-2024  555a
  chair_label_str:string;
  font_height,half_stringwidth,half_stringheight:integer;
  // sc 13-sep-2024 556
  //----------------------------------------------------------------------


  move_to,line_to:TPoint;
  p1,p2,p3,p4: TPoint;

  now_keep:Tbgnd_keep;
  now_ti:Ttemplate_info;

  array_max:integer;
  code:integer;

  radcen_arm:extended;

  // infill_points:array [0..3] of TPoint;
  infill_points:array [0..34] of TPoint;   // SC 13-SEP-2024 556

  fontsize:extended;
  num_str:string;
  tbnum_str:string;

  mapping_colour:integer;
  using_mapping_colour:boolean;

  switch_label_str:string;  // 206b

  s,idnum_str,idtb_str:string;  // 208a
  num:integer;                  // 208a

begin

  with on_canvas do begin     // metafile canvas

    Font.PixelsPerInch:=pdf_width_dpi;   // match PDF

    Pen.Mode:=pmCopy;   // defaults.
    Pen.Style:=psSolid;

    for n:=0 to maxbg_index do begin

      if Ttemplate(keeps_list.Objects[n]).bg_copied=False then CONTINUE;  // no data, not on background.

      if (Ttemplate(keeps_list.Objects[n]).group_selected=False) and (print_group_only_flag=True) then CONTINUE;  // not in group. 0.78.b 10-12-02.

      if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code>0 then CONTINUE;  // 209c no marks for fb_kludge templates

      now_ti:=Ttemplate(keeps_list.Objects[n]).template_info;  // 227a

      now_keep:=now_ti.bgnd_keep;     // next background keep

      with now_keep do begin

            // mapping_colours_print: 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.

        using_mapping_colour:=False;  // default init.
        mapping_colour:=clBlack;      // init - keep compiler happy.

        with Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1 do begin

          idnum_str:=id_number_str;  // 208a

          if (use_print_mapping_colour=True)
             and ( (mapping_colours_print=2) or (mapping_colours_print=3) )
             and (pdf_black_white=False)
             and (pdf_grey_shade=False)
                 then begin
                        mapping_colour:=calc_intensity(print_mapping_colour);
                        using_mapping_colour:=True;
                      end;

          if (use_pad_marker_colour=True)
             and (mapping_colours_print=4)   // use pad settings instead
             and (pdf_black_white=False)
             and (pdf_grey_shade=False)
                 then begin
                        mapping_colour:=calc_intensity(pad_marker_colour);
                        using_mapping_colour:=True;
                      end;
        end;//with

        tbnum_str:=timber_numbers_string;      // the full string of timber numbering.

             // first draw bgnd marks and timbers ...

        array_max:=intarray_max(list_bgnd_marks[0]);

        for i:=0 to array_max do begin

          code:=intarray_get(list_bgnd_marks[4],i);

          case code of

                                  -123: CONTINUE;     // 235b  offsets for 3-D DXF
            -5,-4,-1,0,8,9,10,501..508: CONTINUE;     // no name label, timber selector, peg centre, blank, peg arms, plain-track end marks. // 0.94.a no check-rail labels
          end;//case

          if print_settings_form.output_rail_joints_checkbox.Checked=False    // 223d
             then begin
                    case code of
                       6: CONTINUE;     // rail joints not wanted.
                    end;//case
                  end;

                  // overwrite rail joints on rails  /  timber numbering on platforms

          if rail_joints_now=(code<>6) then CONTINUE;    // do only the rail joints if rail_joints=True and ignore them otherwise.

          if numbers_now=(code<>99) then CONTINUE;     // 226d do only the timber numbers if numbers_now=True and ignore them otherwise.

          if print_settings_form.output_timbering_checkbox.Checked=False
             then begin
                    case code of
                      3,4,5,14,33,44,54,55,93,95,99,203,233,293: CONTINUE;     // no timbering wanted.
                    end;//case
                  end;

          if print_settings_form.output_timber_centres_checkbox.Checked=False    // 223d
             then begin
                    case code of
                       4,14,44,54: CONTINUE;     // timber centre-lines not wanted.
                    end;//case
                  end;

          if print_settings_form.output_guide_marks_checkbox.Checked=False    // 223d
             then begin
                    case code of
                       1: CONTINUE;     // guide marks not wanted.
                    end;//case
                  end;

          if print_settings_form.output_switch_drive_checkbox.Checked=False    // 223d
             then begin
                    case code of
                       101: CONTINUE;     // switch drive not wanted.
                    end;//case
                  end;

          // if brick_form.show_labels_checkbox.Checked=False    // SC 19-SEP-2024 556
          if print_settings_form.output_chair_labels_checkbox.Checked=False
             then begin
                    case code of
                       461..478: CONTINUE;     // no chair labels wanted
                    end;//case
                  end;//begin

          if print_settings_form.output_chairs_checkbox.Checked=False
             then begin
                    case code of
                       480..499: CONTINUE;     // no chair outlines wanted  221a
                    end;//case
                  end;//begin

          if print_settings_form.output_radial_ends_checkbox.Checked=False
             then begin
                    case code of
                       2,7: CONTINUE;     // no radial ends wanted  206a
                    end;//case
                  end;

          if print_settings_form.output_switch_labels_checkbox.Checked=False
             then begin
                    case code of
                       600,601..605: CONTINUE;     // no long marks or switch labels wanted  206b
                    end;//case
                  end;

          if print_settings_form.output_xing_labels_checkbox.Checked=False
             then begin
                    case code of
                       700,701..703: CONTINUE;     // no long marks or crossing labels wanted  211b
                    end;//case
                  end;

          if ((code=5) or (code=55) or (code=95) or (code=600) or (code=700)) and (out_factor<>1.0) then CONTINUE;   // reduced ends are meaningless if not full-size.   206b 600 added. 211b 700 added

				      // SC 13-SEP-2024 556 add chair outlines
          //if ((code=203) or (code=233) or (code=293)) and (i<array_max)         // timber infill
          if ((code=203) or (code=233) or (code=293) or (code=484) or (code=485) or (code=487) or (code=493) or (code=494) or (code=497)) and (i<array_max)        // timber infill...
          // sc 13-sep-2024 556
             then begin
                     p1.X:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
                     p1.Y:=intarray_get(list_bgnd_marks[1],i);

                     p2.X:=intarray_get(list_bgnd_marks[2],i);    // x2,y2 in  1/100ths mm
                     p2.Y:=intarray_get(list_bgnd_marks[3],i);

                     p3.X:=intarray_get(list_bgnd_marks[0],i+1);    // x3,y3 in  1/100ths mm
                     p3.Y:=intarray_get(list_bgnd_marks[1],i+1);

                     p4.X:=intarray_get(list_bgnd_marks[2],i+1);    // x4,y4 in  1/100ths mm
                     p4.Y:=intarray_get(list_bgnd_marks[3],i+1);


                    // SC 13-SEP-2024 556 add chair outlines
                    if (code=484) or (code=485) or (code=493) or (code=494) or (code=497)    // another 12 marks for radiused corners
		                  then begin
		                         pn:=0;
                           // SC 29-SEP-2024 556
                           // pnn:=0;       // bug introduced by SC
	                          pnn:=2;
                           // sc 29-sep-2024 556

	                          repeat
                              p[pn].X:=intarray_get(list_bgnd_marks[0],i+pnn);
                              p[pn].Y:=intarray_get(list_bgnd_marks[1],i+pnn);

                              p[pn+1].X:=intarray_get(list_bgnd_marks[2],i+pnn);
                              p[pn+1].Y:=intarray_get(list_bgnd_marks[3],i+pnn);

				                          INC(pn);   //+2
				                          INC(pn);
				                          INC(pnn);  //+1
	                          until pn>26;     // was 22

		                       end;
          		        // sc 13-sep-2024 556
                  end

              else begin         // keep compiler happy...
                     p1.X:=0;
                     p1.Y:=0;

                     p2.X:=0;
                     p2.Y:=0;

                     p3.X:=0;
                     p3.Y:=0;

                     p4.X:=0;
                     p4.Y:=0;
                  end;

          if ( (code>0) and (code<200) and (code<>99) )  // 223d
          or (code=600) or (code=700)       // 206b 211b overwrite switch marks on output

             then begin
                    Brush.Color:=clWhite;  // 0.93.a gaps in dotted lines.
                    Brush.Style:=bsClear;
                    TextOut(0,0,'');


                     p1.X:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
                     p1.Y:=intarray_get(list_bgnd_marks[1],i);

                     p2.X:=intarray_get(list_bgnd_marks[2],i);    // x2,y2 in  1/100ths mm
                     p2.Y:=intarray_get(list_bgnd_marks[3],i);

                     case code of
                       1,101: Pen.Width:=printmark_wide;    // guide marks.  switch drive
                           2: Pen.Width:=printmark_wide;    // rad end marks.
                     3,33,93: Pen.Width:=printtimber_wide;  // timber outlines.
                        4,44: Pen.Width:=1;                  // timber centre-lines.
                     5,55,95: Pen.Width:=1;                  // timber reduced ends.
                           6: Pen.Width:=printmark_wide;    // rail joint marks.
                           7: Pen.Width:=printmark_wide;    // transition ends.
                       14,54: Pen.Width:=printrail_wide;    // timber centre-lines with rail centre-lines (for rivet locations?).

                     600,700: Pen.Width:=printrail_wide + printrail_wide div 2;    //  206b 211b long marks

                         else Pen.Width:=1;                 // others not drawn.
                     end;//case

                     if Pen.Width<1 then Pen.Width:=1;

                    case code of
                        4,44: Pen.Style:=psDash;    // timber centre-lines (not for rivets).
                     5,55,95: Pen.Style:=psDot;     // timber reduced ends.
                         else Pen.Style:=psSolid;   // all the rest.
                    end;//case

                    Pen.Style:=psSolid;

                    if Pen.Style<>psSolid then Pen.Width:=1;   // delphi bug? (patterns only work for lines 1 dot wide.)

                    if pdf_black_white=True
                       then Pen.Color:=clBlack
                       else begin
                              if using_mapping_colour=True
                                 then Pen.Color:=mapping_colour
                                 else begin
                                        if mapping_colours_print<0    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
                                           then Pen.Color:=printbg_single_colour     // single colour for all of background templates.
                                           else begin
                                                  case code of
                                           1,101,600,700: Pen.Color:=printguide_colour;  // guide marks. switch drive 206b 600 added, 211b 700 added
                                                       2: Pen.Color:=printalign_colour;  // rad end marks.
                                                 3,33,93: Pen.Color:=printtimber_colour; // timber outlines.
                                                       6: Pen.Color:=printjoint_colour;  // rail joints.
                                                       7: Pen.Color:=printalign_colour;        // transition ends.
                                                     else Pen.Color:=calc_intensity(clBlack);  // thin dotted lines in black only for timber centres and reduced ends.
                                                  end;//case
                                                end;
                                      end;
                            end;

                    Pen.Mode:=pmCopy;

                    move_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;
                    move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                    line_to.X:=Round((p2.Y-grid_left)*scaw_out)+page_left_dots;
                    line_to.Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;
                    if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                  end
             else begin
                    if ((code=-2) or (code=-3)) and {(pad_form.print_radial_centres_menu_entry.Checked=True)}  // 0.82.b
                       (print_settings_form.output_radial_centres_checkbox.Checked=True)    // draw curving rad centres...
                       then begin
                              Pen.Width:=printmark_wide;  // guide marks.

                              if Pen.Width<1 then Pen.Width:=1;

                              Pen.Style:=psSolid;
                              Pen.Mode:=pmCopy;

                              if pdf_black_white=True
                                 then Pen.Color:=clBlack  // overide.
                                 else begin
                                        if mapping_colours_print<>-1
                                           then Pen.Color:=calc_intensity(clBlack)
                                           else Pen.Color:=printbg_single_colour;
                                      end;

                              p1.X:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
                              p1.Y:=intarray_get(list_bgnd_marks[1],i);

                              radcen_arm:=400*scale;  // 4ft scale arbitrary (scale is for control template).

                              move_to.X:=Round((p1.Y+radcen_arm-grid_left)*scaw_out)+page_left_dots;      // mark centre widthwise.
                              move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                              line_to.X:=Round((p1.Y-radcen_arm-grid_left)*scaw_out)+page_left_dots;
                              line_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;
                              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;

                              move_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;                 // mark centre lengthwise
                              move_to.Y:=Round((p1.X+radcen_arm-grid_top)*scal_out)+page_top_dots;

                              line_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;
                              line_to.Y:=Round((p1.X-radcen_arm-grid_top)*scal_out)+page_top_dots;
                              if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                            end;

                    if (code=203) or (code=233) or (code=293)       // timber infill...
		                  or (code=484) or (code=485) or (code=487) or (code=493) or (code=494) or (code=497)   // SC 13-SEP-2024 chair outlines
                       then begin
                              infill_points[0].X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;
                              infill_points[0].Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                              infill_points[1].X:=Round((p2.Y-grid_left)*scaw_out)+page_left_dots;
                              infill_points[1].Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;

                              infill_points[2].X:=Round((p3.Y-grid_left)*scaw_out)+page_left_dots;
                              infill_points[2].Y:=Round((p3.X-grid_top)*scal_out)+page_top_dots;

                              infill_points[3].X:=Round((p4.Y-grid_left)*scaw_out)+page_left_dots;
                              infill_points[3].Y:=Round((p4.X-grid_top)*scal_out)+page_top_dots;

                              // SC 13-SEP-2024 556 chair outlines
                              if (code=484) or (code=485) or (code=493) or (code=494) or (code=497)         // 221a  chair outlines
                                 then begin
                                        for pn:=0 to 27
                                        do begin               // 221a  was 23
                                             //infill_points[pn+4].X:=Round(limits(h_minint,h_maxint,(p[pn].Y+ypd-grid_left)*scaw_out,dummy_i))+page_left_dots;
                                             infill_points[pn+4].X:=Round(limits(h_minint,h_maxint,(p[pn].Y-grid_left)*scaw_out,dummy_i))+page_left_dots;
                                             infill_points[pn+4].Y:=Round(limits(h_minint,h_maxint,(p[pn].X-grid_top)*scal_out,dummy_i))+page_top_dots;
                                           end;   //next
                                      end;
                              // sc 13-SEP-2024 556 chair outlines

                              if (check_limits(infill_points[0],infill_points[1])=True) and (check_limits(infill_points[2],infill_points[3])=True)
                                 then begin
                                        Pen.Width:=1;
                                        Pen.Style:=psSolid;
                                        Pen.Mode:=pmCopy;

                                        Pen.Color:=clWhite;  // so no overdrawing of timber outlines.

                                        if pdf_black_white=True
                                           then Brush.Color:=clBlack
                                           else begin
                                                  if mapping_colours_print<>-1
                                                     then begin
                                                            Brush.Color:=printtimber_infill_colour;
                                                          end
                                                     else Brush.Color:=printbg_single_colour;
                                                end;


                                        case print_timb_infill_style of
                                                        0: CONTINUE;
                                                        1: Brush.Style:=bsBDiagonal;    // hatched. Backward diagonal for the background templates.
                                                        2: Brush.Style:=bsDiagCross;

                                                        3: if (pdf_black_white=True) or (mapping_colours_print<0)
                                                              then Brush.Style:=bsBDiagonal    // impact printer or plotter, or printing black and white or in a single colour.
                                                              else Brush.Style:=bsSolid;

                                                        4: begin                         // blank.
                                                             Brush.Style:=bsSolid;
                                                             Brush.Color:=clWhite;       // overide.
                                                           end;

                                                      else CONTINUE;
                                        end;//case

                                        // SC 13-SEP-2024 556
                                        // chair outline overides...

                                        if (code=484) or (code=485) or (code=493) or (code=494) or (code=497)        // chair outlines
                                           then begin
                                                  Pen.Color:=timber_colour;
                                                  Brush.Color:=printchair_infill_colour;	// SC 13-SEP-2024 556
                                                  Brush.Style:=bsSolid;
                                           end;

                                                     // 241c switch-drive rib ..

                                        if code=487
                                           then begin
                                                  Pen.Color:=clBlack;
                                                  Brush.Color:=$00D0D0E0;
                                                  Brush.Style:=bsDiagCross;
                                           end;


                                        // Polygon(infill_points);

                                        if (code=484) or (code=485) or (code=493) or (code=494) or (code=497)
                                           then Polygon(Slice(infill_points,28))      // chair outline with radiused corners
                                           else Polygon(Slice(infill_points,4));      // timber infill, chair with square corners
                                        // sc 13-SEP-2024 556
                                      end;
                            end;

                    // SC 13-SEP-2024 556
                    // if (code>=461) and (code<=478) and (brick_form.show_labels_checkbox.Checked=True)    // MW 03-08-2024  555a
                    if (code>=461) and (code<=478) and
                       (brick_form.show_labels_checkbox.Checked=True) //or (print_settings_form.chair_labels_checkbox.Checked=True))    // MW 03-08-2024  555a
                       then begin

                            list_chair_code:=intarray_get(list_bgnd_marks[6],i);  // 237a   chair code for this mark if it's a 3D chair

                            chair_label_str:=get_chair_str(list_chair_code);

                            if list_chair_code=14      // over-ride check flare-in from "CCL/R"
                               then case code of
                                    461: chair_label_str:='CCL';     // MS LH TEMPLATE - TS RH TEMPLATE
                                    471: chair_label_str:='CCR';     // TS LH TEMPLATE - MS RH TEMPLATE
                               end;

                            if list_chair_code=16      // over-ride check flare-out from "CCR/L"
                               then case code of
                                    461: chair_label_str:='CCR';     // MS LH TEMPLATE - TS RH TEMPLATE
                                    471: chair_label_str:='CCL';     // TS LH TEMPLATE - MS RH TEMPLATE
                               end;

                            p1.X:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
                            p1.Y:=intarray_get(list_bgnd_marks[1],i);

                            p2.X:=intarray_get(list_bgnd_marks[2],i);    // x2,y2 in  1/100ths mm
                            p2.Y:=intarray_get(list_bgnd_marks[3],i);

                            move_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;     // 208a use the screen number position p1 for the control template (no ID number).
                            move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                            if check_limit(False,False,move_to)=True
                               then begin

                                      Font.Assign(print_chair_labels_font);  // 556  8 init

                                      Font.Height:=0-Round(3.5*inscale*100*scal_out);   // 556 3.5" high text arbitrary

                                      half_stringwidth:=TextWidth(chair_label_str) div 2;
                                      half_stringheight:=TextHeight(chair_label_str) div 2;

				                                  Brush.Style:=bsSolid;
									
                                      Brush.Color:=printchair_label_infill_colour;	// SC 13-SEP-2024 556

                                      Font.Color:=clBlack;

                                      Pen.Width:=1;       // draw the rectangle first...
                                      Pen.Mode:=pmCopy;
                                      Pen.Style:=psSolid;
                                      Pen.Color:=Font.Color;

                                      RoundRect(move_to.X-half_stringwidth-Round(ABS(Font.Height/2)), move_to.Y-half_stringheight-2, move_to.X+half_stringwidth+Round(ABS(Font.Height/2)), move_to.Y+half_stringheight+2, Round(ABS(Font.Height/2.5)), Round(ABS(Font.Height/2.5)) );   // font/2 padding, font/2.5 corner rads, arbitrary

                                      Text_Out(on_canvas,move_to.X-half_stringwidth, move_to.Y-half_stringheight, chair_label_str);
                                      Font.Assign(print_labels_font);      // reset for grid labels
                                    end;

                            end;
                    // sc 13-sep-2024 556


                    if (code=99)
                       and ( (pad_form.print_timber_numbering_menu_entry.Checked=True) or ((out_factor>0.99) and (pad_form.numbering_fullsize_only_menu_entry.Checked=True)) )

                       and (print_settings_form.output_timber_numbers_checkbox.Checked=True)    // 223d

                       then begin
                              p1.X:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
                              p1.Y:=intarray_get(list_bgnd_marks[1],i);

                              p2.X:=intarray_get(list_bgnd_marks[2],i);    // x2,y2 in  1/100ths mm  numbers on output
                              p2.Y:=intarray_get(list_bgnd_marks[3],i);

                              if print_settings_form.output_timb_id_prefix_checkbox.Checked=True    // 223d
                                 then begin
                                        move_to.X:=Round((p2.Y-grid_left)*scaw_out)+page_left_dots;
                                        move_to.Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;
                                      end
                                 else begin                                                           // 223d  ID prefix not wanted, use p1 *screen* positions (as for control template) 
                                        move_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;
                                        move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;
                                      end;

                              num_str:=extract_tbnumber_str(tbnum_str); // get next timber numbering string from the acummulated string.
                              if num_str='' then CONTINUE;              // no string available??

                              if pad_form.timber_numbering_on_plain_track_menu_entry.Checked=False   // 208a
                                 then begin
                                        s:=Copy(num_str,1,1);

                                        if (s='A') or (s='E') or (s='R') or (s='N')    // not wanted on plain track,
                                           then begin
                                                  if Copy(num_str,Length(num_str),1)='1'   // every 10 sleepers
                                                     then num_str:=''                      // show template ID only
                                                     else CONTINUE;
                                                end;
                                      end;

                              if check_limit(False,False,move_to)=True
                                 then begin
                                        Font.Assign(print_timber_numbers_font);

                                        if pdf_black_white=True           // overides..
                                           then Font.Color:=clBlack
                                           else begin
                                                  if mapping_colours_print<0 then Font.Color:=printbg_single_colour;
                                                end;

                                        if pad_form.scale_timber_numbering_menu_entry.Checked=True
                                           then begin
                                                  fontsize:=Font.Size*out_factor;
                                                  if fontsize<4 then CONTINUE;      // minimum to be legible.
                                                  Font.Size:=Round(fontsize);
                                                end;

                                        Brush.Color:=clWhite;
                                        Brush.Style:=bsClear;    // 226d  was solid
                                        TextOut(0,0,'');

                                        if print_settings_form.output_timb_id_prefix_checkbox.Checked=True    // 223d
                                           then begin
                                                  if num_str='' then idtb_str:=idnum_str               // 208a  template ID only
                                                                else idtb_str:=idnum_str+'.'+num_str;  // 208a  timber number output with template ID
                                                end
                                           else begin                               // IDs not wanted  223d
                                                  if num_str='' then CONTINUE;
                                                  idtb_str:=num_str;
                                                end;

                                        idtb_str:=' '+idtb_str+' ';

                                        text_out(on_canvas,move_to.X-(TextWidth(idtb_str) div 2),
                                                move_to.Y-(TextHeight(idtb_str) div 2),
                                                idtb_str);

                                        Font.Assign(print_labels_font);      // reset for grid labels
                                      end;
                            end;//numbering


                    case code of     // switch labels 206b

             601..605,701..703: begin

                                  if out_factor<>1.0 then CONTINUE;     // on full size prints only

                                  p1.X:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
                                  p1.Y:=intarray_get(list_bgnd_marks[1],i);

                                  move_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;
                                  move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                  if check_limit(False,False,move_to)=True
                                     then begin
                                            Font.Assign(print_timber_numbers_font);

                                            Font.Style:=[fsBold,fsItalic];
                                            Font.Color:=printguide_colour;

                                            if scale>3 then Font.Size:=Font.Size+1; // a bit bigger above 3mm/ft

                                            Brush.Style:=bsSolid;
                                            Brush.Color:=clWhite;

                                            case code of
                                                  601: switch_label_str:='tips';
                                                  602: switch_label_str:='set (bend)';
                                                  603: switch_label_str:='planing';
                                                  604: switch_label_str:='stock gauge';
                                                  605: switch_label_str:='joggles';

                                                  701: switch_label_str:='intersection FP';
                                                  702: switch_label_str:='blunt nose';
                                                  703: switch_label_str:='blunt tips';

                                                  else switch_label_str:='';
                                            end;//case

                                            text_out(on_canvas,move_to.X-(TextWidth(switch_label_str) div 2),  // div 2 allows for rotation of template
                                                               move_to.Y-(TextHeight(switch_label_str) div 2),
                                                               ' '+switch_label_str+' ');

                                            Font.Assign(print_labels_font);      // reset for grid labels
                                          end;
                                end;

                    end;//case

                  end;//other codes

        end;//next i background mark

               // finally overdraw timber infill for shoved colours  226a

        if (rail_joints_now=False) and (numbers_now=False) and (Length(now_ti.file_blocks.keep_shoved_timbers)>0) and (now_ti.keep_dims.turnout_info2.no_timbering_flag=False)  // 227d
       and (Ttemplate(keeps_list.Objects[n]).bgnd_timber_fill_overdraw_generated=True)                                                                              // 227d
           then begin
                  for i:=0 to Length(now_ti.file_blocks.keep_shoved_timbers)-1 do begin

                    with now_ti.file_blocks.keep_shoved_timbers[i] do begin

                      if (shove_data.sv_option_bits AND $40)=0 then CONTINUE;     // 232c  if shove_data.sv_col_has_been_set=False   no modified infill

                      if shoved_mod_infill.shoved_number_str='' then CONTINUE;  // 227e timber didn't get drawn

                      with shoved_mod_infill do begin

                      if (shove_data.sv_use_ocol=True) and (black_white=False)  // overdraw previous infill on output
                         then begin
                                infill_points[0].X:=Round((stored_shoved_corners.p1.Y-grid_left)*scaw_out)+page_left_dots;
                                infill_points[0].Y:=Round((stored_shoved_corners.p1.X-grid_top)*scal_out)+page_top_dots;

                                infill_points[1].X:=Round((stored_shoved_corners.p2.Y-grid_left)*scaw_out)+page_left_dots;
                                infill_points[1].Y:=Round((stored_shoved_corners.p2.X-grid_top)*scal_out)+page_top_dots;

                                infill_points[2].X:=Round((stored_shoved_corners.p3.Y-grid_left)*scaw_out)+page_left_dots;
                                infill_points[2].Y:=Round((stored_shoved_corners.p3.X-grid_top)*scal_out)+page_top_dots;

                                infill_points[3].X:=Round((stored_shoved_corners.p4.Y-grid_left)*scaw_out)+page_left_dots;
                                infill_points[3].Y:=Round((stored_shoved_corners.p4.X-grid_top)*scal_out)+page_top_dots;


                                if (check_limits(infill_points[0],infill_points[1])=True) and (check_limits(infill_points[2],infill_points[3])=True)
                                   then begin
                                          Pen.Width:=printtimber_wide;
                                          Pen.Style:=psSolid;
                                          Pen.Mode:=pmCopy;
                                          Pen.Color:=printtimber_colour;

                                          Brush.Color:=shove_data.sv_ocol;

                                          case shove_data.sv_ocol_infill of

                                              0: Brush.Style:=bsSolid;
                                              1: begin Brush.Color:=clWhite; Brush.Style:=bsSolid; end;  // blank style
                                              2: Brush.Style:=bsHorizontal;
                                              3: Brush.Style:=bsVertical;
                                              4: Brush.Style:=bsFDiagonal;
                                              5: Brush.Style:=bsBDiagonal;
                                              6: Brush.Style:=bsCross;
                                              7: Brush.Style:=bsDiagCross;
                                            else Brush.Style:=bsSolid;

                                          end;//case

                                          Polygon(Slice(infill_points,4));   // number of points, not index

                                        end;//check limits
                              end;//use ocol
                      end;//with
                    end;//with
                  end;//next

                end;//if any

                // 226a end

      end;//with now_keep
    end;//next n template
  end;//with on_canvas

end;
//__________________________________________________________________________________________

procedure pdf_laz_bgnd(grid_left,grid_top:extended);        // outut background templates.

var
  max_list_index:integer;
  move_to,line_to:TPoint;
  p1,p2: TPoint;

  now_keep:Tbgnd_keep;
  now_ti:Ttemplate_info;

  n,aq,nk:integer;
  array_max:integer;

  xint,yint:integer;

  l_dims_valid:boolean;
  w_dims_valid:boolean;

  now,rail:integer;

  mapping_colour:integer;
  using_mapping_colour:boolean;

  fixed_diamond_ends:boolean;

  gaunt_template:boolean;  // 0.93.a  ex 0.81

  fb_kludge_this:integer;  // 0.94.a

  this_one_platforms_trackbed:boolean;  // 206b

  this_one_trackbed_cess_ms:boolean;       // 206b
  this_one_trackbed_cess_ts:boolean;       // 206b

  bgnd_y_datum:extended;  // 227c

  kludge:boolean; //227c


                  //////////////////////////////////////////////////////////////

                  procedure set_pen_railcolour(rail_edges:boolean);  // 0.76.a 3-11-01.

                  begin
                    with on_canvas do begin

                      if pdf_black_white=True
                         then begin
                                Pen.Color:=clBlack;
                                EXIT;
                              end;

                      if output_diagram_mode=True    // 0.94.a  don't use mapping colour for rail edges (used for infill instead).
                         then begin
                                if (rail=16) or (rail=20)                  // 0.93.a platforms
                                   then Pen.Color:=printplat_edge_colour
                                   else Pen.Color:=printbgrail_colour;
                                EXIT;
                              end;

                           // detail-mode ...

                      if (using_mapping_colour=True) and ( (pdf_laz_form.black_edges_checkbox.Checked=False) or (rail_edges=False) )
                         then begin
                                if ((rail=16) or (rail=18) or (rail=20) or (rail=22)) and (detail_mode_form.thickcl_radio.Checked=True) and (detail_mode_form.normal_colours_radio.Checked=True)   // 226d
                                   then begin
                                          if (rail=16) or (rail=20)
                                             then Pen.Color:=printplat_edge_colour  // 226d  platforms with thick centre-lines
                                             else Pen.Color:=printbgrail_colour;    // 226d  trackbed edges with thick centre-lines
                                        end
                                   else Pen.Color:=mapping_colour;
                                EXIT;
                              end;

                      if (mapping_colours_print<0) and ( (pdf_laz_form.black_edges_checkbox.Checked=False) or (rail_edges=False) )                    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
                         then begin
                                Pen.Color:=printbg_single_colour;     // single colour for all of background templates.
                                EXIT;
                              end;

                                // normal output...

                      if (rail=16) or (rail=20)   // 0.93.a platforms
                         then Pen.Color:=printplat_edge_colour
                         else Pen.Color:=printbgrail_colour;

                    end;//with
                  end;
                  //////////////////////////////////////////////////////////////

                  function pbg_get_w_dots(q,n:integer):integer;

                  var
                    yint:integer;

                  begin
                    yint:=intarray_get(now_keep.list_bgnd_rails[q,1],n);

                    RESULT:=Round((yint-grid_left)*scaw_out)+page_left_dots;

                    w_dims_valid:=check_draw_dim_w(RESULT);
                  end;
                  //////////////////////////////////////////////////////////////

                  function pbg_get_l_dots(q,n:integer):integer;

                  var
                    xint:integer;

                  begin
                    xint:=intarray_get(now_keep.list_bgnd_rails[q,0],n);

                    RESULT:=Round((xint-grid_top)*scal_out)+page_top_dots;

                    l_dims_valid:=check_draw_dim_l(RESULT);
                  end;
                  //////////////////////////////////////////////////////////////

                  procedure pbg_outline_railedge(aq,blanking_colour:integer; blank_it:boolean);

                  var
                    nk:integer;

                  begin
                    with now_keep do begin
                      array_max:=intarray_max(list_bgnd_rails[aq,0]);
                      if array_max=0 then EXIT;                         // empty rail.

                      xint:=intarray_get(list_bgnd_rails[aq,0],0);
                      yint:=intarray_get(list_bgnd_rails[aq,1],0);

                      move_to.X:=Round((yint-grid_left)*scaw_out)+page_left_dots;
                      move_to.Y:=Round((xint-grid_top)*scal_out)+page_top_dots;

                      with on_canvas do begin

                        if blank_it=True
                           then Pen.Color:=blanking_colour
                           else set_pen_railcolour(True);

                        for nk:=1 to array_max do begin

                          xint:=intarray_get(list_bgnd_rails[aq,0],nk);
                          yint:=intarray_get(list_bgnd_rails[aq,1],nk);

                          line_to.X:=Round((yint-grid_left)*scaw_out)+page_left_dots;
                          line_to.Y:=Round((xint-grid_top)*scal_out)+page_top_dots;

                          if check_limits(move_to, line_to)=True
                             then begin
                                    MoveTo(move_to.X, move_to.Y);
                                    LineTo(line_to.X, line_to.Y);
                                  end;
                          move_to:=line_to;
                        end;//next nk

                      end;//with Canvas
                    end;//with bgnd template
                  end;
                  //////////////////////////////////////////////////////////////

                  procedure pbg_draw_fill_rail(outer_add:integer);    // draw a complete filled rail.

                  const
                    dots_max_c=xy_pts_c*2;

                  var
                    dots:array[0..dots_max_c] of TPoint;     // array of points for filled polygon mode.

                      //    (xy_pts_c=3000;)
                      //   3000 points for each side of rail. if incx is 18" scale (SQRT 9ft scale in 4mm = SQRT(36) =6 mm),
                      //   template max is 4500' scale length.
                      //   ( = 18000 mm or 59ft approx in 4 mm scale).
                      //   ( = 66 A4 sheets long if straight turnout - but normally less for curved turnout).

                      // N.B. huge standard Pascal array is used instead of our own dynamic integer arrays,
                      // because needed for the Polygon function.

                      // total memory = 6000*8 bytes = 48kb.

                    now, start, now_max:integer;
                    edge_started:boolean;
                    dots_index:integer;
                    x_dots,y_dots:integer;
                    aq:integer;
                    mid_dots_index:integer;
                    edge_colour, blanking_colour:integer;

                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                  procedure pbg_modify_rail_end(start_index,stop_index,edge,blank:integer);

                                  var
                                    saved_pen_width:integer;    // 206b

                                  begin

                                    if (start_index>=0) and (start_index<=dots_index) and (stop_index>=0) and (stop_index<=dots_index)
                                       then begin
                                              move_to:=dots[start_index];
                                              line_to:=dots[stop_index];

                                              if check_limits(move_to, line_to)=True
                                                 then begin
                                                        with on_canvas do begin

                                                          saved_pen_width:=Pen.Width; // 206b
                                                          if Brush.Style<>bsSolid then Pen.Width:=saved_pen_width+3;    // 206b  PDF bug, needs a wider line to ensure full blanking if hatched fill

                                                          Pen.Color:=blank;                // first blank across..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(line_to.X, line_to.Y);

                                                          Pen.Width:=saved_pen_width;      // 206b restore original width

                                                          Pen.Color:=edge;                 // then restore the corner points..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(move_to.X, move_to.Y);

                                                          MoveTo(line_to.X, line_to.Y);
                                                          LineTo(line_to.X, line_to.Y);
                                                        end;//with
                                                      end;
                                            end;
                                  end;
                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                  begin
                    aq:=rail;  // gauge-faces.

                    with now_keep do begin

                      if (intarray_max(list_bgnd_rails[aq,0])=0) or (intarray_max(list_bgnd_rails[aq+outer_add,0])=0)  // data not for both edges?
                         then begin
                                if intarray_max(list_bgnd_rails[aq,0])<>0 then pbg_outline_railedge(aq,0,False);
                                if intarray_max(list_bgnd_rails[aq+outer_add,0])<>0 then pbg_outline_railedge(aq+outer_add,0,False);
                                EXIT;
                              end;

                      now_max:=intarray_max(list_bgnd_rails[aq,0]);

                      if gaunt_template=False
                         then begin

                                case aq of
                                     1: begin
                                          start:=planing_end_aq1; // start from end of planing - no infill in planing.

                                          if (start<0) or (start>now_max) then EXIT;  // ???
                                        end;

                                     2: begin                         // ditto
                                          start:=planing_end_aq2; // start from end of planing - no infill in planing.

                                          if (start<0) or (start>now_max) then EXIT;  // ???
                                        end;

                                   else start:=0;                   // whole list.
                                end;//case

                              end
                         else start:=0;  // gaunt template, no planing. 0.81 09-Jul-2005

                      dots_index:=0-1;                    // first increment is to zero.

                      edge_started:=False;

                      for now:=start to now_max do begin
                        x_dots:=pbg_get_w_dots(aq,now);
                        y_dots:=pbg_get_l_dots(aq,now);
                        if (w_dims_valid=True) and (l_dims_valid=True)
                           then begin
                                  edge_started:=True;

                                  Inc(dots_index);
                                  if dots_index>dots_max_c then dots_index:=dots_max_c;

                                  dots[dots_index].X:=x_dots;
                                  dots[dots_index].Y:=y_dots;
                                end
                           else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                      end;//next now

                      mid_dots_index:=dots_index;

                      aq:=rail+outer_add;             // outer-edges.

                      now_max:=intarray_max(list_bgnd_rails[aq,0]);

                      edge_started:=False;

                      for now:=now_max downto 0 do begin
                        x_dots:=pbg_get_w_dots(aq,now);
                        y_dots:=pbg_get_l_dots(aq,now);
                        if (w_dims_valid=True) and (l_dims_valid=True)
                           then begin
                                  edge_started:=True;

                                  Inc(dots_index);
                                  if dots_index>dots_max_c then dots_index:=dots_max_c;

                                  dots[dots_index].X:=x_dots;
                                  dots[dots_index].Y:=y_dots;
                                end
                           else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                      end;//next now

                      with on_canvas do begin

                        set_pen_railcolour(True);

                        if (rail=16) or (rail=20)   // 0.93.a platforms
                           then begin
                                  if ( (using_mapping_colour=True) and (Pen.Color=mapping_colour) ) or ( (mapping_colours_print<0) and (Pen.Color=printbg_single_colour) )   // 206b
                                     then Brush.Color:=Pen.Color
                                     else Brush.Color:=printplat_infill_colour;

                                  case print_platform_infill_style of
                                          0: begin Brush.Style:=bsClear; TextOut(0,0,''); end;
                                          1: Brush.Style:=bsFDiagonal;    // hatched. forward diagonal (backward diagonal on bgnd template timbers).
                                          2: Brush.Style:=bsDiagCross;

                                          3: if mapping_colours_print<0          // solid option.
                                                then Brush.Style:=bsFDiagonal    // single colour.
                                                else Brush.Style:=bsSolid;

                                        else begin                         // 4 = blank.
                                               Brush.Style:=bsSolid;
                                               Brush.Color:=clWhite;       // overide.
                                             end;

                                  end;//case
                                end
                           else begin
                                  if ((this_one_trackbed_cess_ts=True) and (rail=18))  // 215a
                                  or ((this_one_trackbed_cess_ms=True) and (rail=22))  // 215a
                                     then begin
                                            if ( (using_mapping_colour=True) and (Pen.Color=mapping_colour) ) or ( (mapping_colours_print<0) and (Pen.Color=printbg_single_colour) )
                                               then Brush.Color:=Pen.Color
                                               else Brush.Color:=sb_track_bgnd_colour;      // cess use same colour as track background
                                            Brush.Style:=bsBDiagonal;
                                          end
                                     else begin   // normal rails...

                                            if ( (using_mapping_colour=True) and (Pen.Color=mapping_colour) ) or ( (mapping_colours_print<0) and (Pen.Color=printbg_single_colour) )
                                               // then Brush.Color:=calc_intensity(clSilver)  // 214b  - was clGray
                                               then Brush.Color:=printrail_infill_colour_bk   // SC 01-OCT-2024 556 - brick override
                                               else begin
                                                      if fb_kludge_this>0 then Brush.Color:=printrail_infill_colour_cu  // 0.94.a
                                                                          else Brush.Color:=printrail_infill_colour_bg;
                                                    end;

                                            case rail_infill_i of
                                                            1: Brush.Style:=bsBDiagonal;   // hatched
                                                            2: Brush.Style:=bsSolid;       // solid
                                                            3: Brush.Style:=bsDiagCross;   // cross_hatched
                                                            4: begin                       // blank
                                                                 Brush.Style:=bsSolid;
                                                                 Brush.Color:=clWhite;     // overide
                                                               end;
                                                          else Brush.Style:=bsSolid;       // solid
                                            end;//case

                                          end;
                                end;

                        if pdf_black_white=True
                           then begin
                                  Brush.Style:=bsSolid;               // solid infill white.
                                  Brush.Color:=clWhite;               // overide
                                end;

                        if dots_index>2
                           then begin
                                  Polygon(Slice(dots,dots_index+1));   // +1, number of points, not index.  must have 4 points.

                                  edge_colour:=Pen.Color;  // existing rail edges.

                                  if Brush.Style=bsSolid then blanking_colour:=Brush.Color   // infill colour.
                                                         else blanking_colour:=clWhite;

                                        // remove polygon line across end of planing (not for fixed-diamond)..
                                        // (for gaunt template this removes the polygon line across the rail end)

                                  if (fixed_diamond_ends=False) and ((rail=1) or (rail=2)) then pbg_modify_rail_end(0,dots_index,edge_colour,blanking_colour);

                                        // remove polygon lines across stock rail ends...
                                        // and trackbed ends  206b

                                  if (rail=0) or (rail=3) or (rail=18) or (rail=22)   // 18,22 added 206b
                                     then begin
                                            pbg_modify_rail_end(0,dots_index,edge_colour,blanking_colour);  // toe or approach end.

                                            pbg_modify_rail_end(mid_dots_index,mid_dots_index+1,edge_colour,blanking_colour);  // exit end.
                                          end;

                                           // 0.93.a blank platform edges ...

                                  with Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.platform_trackbed_info do begin

                                    if adjacent_edges_keep=True  // platforms
                                       then begin
                                                    // 0.93.a blank platform rear edges ...

                                              if (rail=16) and (draw_ts_platform_keep=True) and (draw_ts_platform_rear_edge_keep=False)   // 0.93.a TS platform start
                                                 then pbg_outline_railedge(16,blanking_colour,True);     // blank rear edge

                                              if (rail=20) and (draw_ms_platform_keep=True) and (draw_ms_platform_rear_edge_keep=False)   // 0.93.a TS platform start
                                                 then pbg_outline_railedge(20,blanking_colour,True);     // blank rear edge

                                                    // 0.93.a blank platform ends ...

                                              if (rail=16) and (draw_ts_platform_keep=True) and (draw_ts_platform_start_edge_keep=False)   // 0.93.a TS platform start
                                                 then pbg_modify_rail_end(0,dots_index,edge_colour,blanking_colour);

                                              if (rail=16) and (draw_ts_platform_keep=True) and (draw_ts_platform_end_edge_keep=False)     // 0.93.a TS platform end
                                                 then pbg_modify_rail_end(mid_dots_index,mid_dots_index+1,edge_colour,blanking_colour);

                                              if (rail=20) and (draw_ms_platform_keep=True) and (draw_ms_platform_start_edge_keep=False)   // 0.93.a MS platform start
                                                 then pbg_modify_rail_end(0,dots_index,edge_colour,blanking_colour);

                                              if (rail=20) and (draw_ms_platform_keep=True) and (draw_ms_platform_end_edge_keep=False)     // 0.93.a MS platform end
                                                 then pbg_modify_rail_end(mid_dots_index,mid_dots_index+1,edge_colour,blanking_colour);

                                            end;
                                  end;//with

                                  if (rail=26) or (rail=28)
                                     then begin
                                            pbg_modify_rail_end(0,dots_index,edge_colour,blanking_colour);  // centre of K-crossing check rails.
                                          end;

                                end;
                      end;//with Canvas
                    end;//with background template
                  end;
                  //////////////////////////////////////////////////////////////

                  procedure pbg_draw_fill_vee;    // do complete vee in one go ...

                  const
                    dots_max_c=xy_pts_c*2;

                  var
                    dots:array[0..dots_max_c] of TPoint;     // array of points for filled polygon mode.

                      //    (xy_pts_c=3000;)
                      //   3000 points for each side of rail. if incx is 18" scale (SQRT 9ft scale in 4mm = SQRT(36) =6 mm),
                      //   template max is 4500' scale length.
                      //   ( = 18000 mm or 59ft approx in 4 mm scale).
                      //   ( = 66 A4 sheets long if straight turnout - but normally less for curved turnout).

                      // N.B. huge standard Pascal array is used instead of our own dynamic integer arrays,
                      // because needed for the Polygon function.

                      // total memory = 6000*8 bytes = 48kb.


                    now:integer;
                    edge_started:boolean;
                    dots_index:integer;
                    x_dots,y_dots:integer;
                    aq:integer;
                    point_mid_dots_index, splice_mid_dots_index:integer;
                    edge_colour, blanking_colour:integer;

                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                  procedure pbg_modify_vee_end(start_index,stop_index,edge,blank:integer);

                                  begin

                                    if (start_index>=0) and (start_index<=dots_index) and (stop_index>=0) and (stop_index<=dots_index)
                                       then begin
                                              move_to:=dots[start_index];
                                              line_to:=dots[stop_index];

                                              if check_limits(move_to, line_to)=True
                                                 then begin
                                                        with on_canvas do begin
                                                          Pen.Color:=blank;                // first blank across..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(line_to.X, line_to.Y);

                                                          Pen.Color:=edge;                 // then restore the corner points..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(move_to.X, move_to.Y);

                                                          MoveTo(line_to.X, line_to.Y);
                                                          LineTo(line_to.X, line_to.Y);
                                                        end;//with
                                                      end;
                                            end;
                                  end;
                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                  begin
                    with now_keep do begin

                      if (intarray_max(list_bgnd_rails[4,0])=0)
                      or (intarray_max(list_bgnd_rails[5,0])=0)
                      or (intarray_max(list_bgnd_rails[12,0])=0)
                      or (intarray_max(list_bgnd_rails[13,0])=0)  // not enough data for filled vee.
                         then begin
                                if intarray_max(list_bgnd_rails[4,0])<>0  then pbg_outline_railedge(4,0,False);       // draw outline vee...
                                if intarray_max(list_bgnd_rails[5,0])<>0  then pbg_outline_railedge(5,0,False);
                                if intarray_max(list_bgnd_rails[12,0])<>0 then pbg_outline_railedge(12,0,False);
                                if intarray_max(list_bgnd_rails[13,0])<>0 then pbg_outline_railedge(13,0,False);
                              end
                         else begin                // polygon mode...

                                dots_index:=0-1;   // first increment is to zero.

                                aq:=4;
                                edge_started:=False;
                                for now:=0 to intarray_max(list_bgnd_rails[aq,0]) do begin    // vee main-side, gauge_face, start from the tip.
                                  x_dots:=pbg_get_w_dots(aq,now);
                                  y_dots:=pbg_get_l_dots(aq,now);
                                  if (w_dims_valid=True) and (l_dims_valid=True)
                                     then begin
                                            edge_started:=True;

                                            Inc(dots_index);
                                            if dots_index>dots_max_c then dots_index:=dots_max_c;

                                            dots[dots_index].X:=x_dots;
                                            dots[dots_index].Y:=y_dots;
                                          end
                                     else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                                end;//next now

                                point_mid_dots_index:=dots_index;

                                aq:=12;
                                edge_started:=False;
                                for now:=intarray_max(list_bgnd_rails[aq,0]) downto 0 do begin // back along outer-edge.
                                  x_dots:=pbg_get_w_dots(aq,now);
                                  y_dots:=pbg_get_l_dots(aq,now);
                                  if (w_dims_valid=True) and (l_dims_valid=True)
                                     then begin
                                            edge_started:=True;

                                            Inc(dots_index);
                                            if dots_index>dots_max_c then dots_index:=dots_max_c;

                                            dots[dots_index].X:=x_dots;
                                            dots[dots_index].Y:=y_dots;
                                          end
                                     else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                                end;//next now

                                aq:=13;
                                edge_started:=False;
                                for now:=0 to intarray_max(list_bgnd_rails[aq,0]) do begin    // and then turnout side outer edge.
                                  x_dots:=pbg_get_w_dots(aq,now);
                                  y_dots:=pbg_get_l_dots(aq,now);
                                  if (w_dims_valid=True) and (l_dims_valid=True)
                                     then begin
                                            edge_started:=True;

                                            Inc(dots_index);
                                            if dots_index>dots_max_c then dots_index:=dots_max_c;

                                            dots[dots_index].X:=x_dots;
                                            dots[dots_index].Y:=y_dots;
                                          end
                                     else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                                end;//next now

                                splice_mid_dots_index:=dots_index;

                                aq:=5;
                                edge_started:=False;
                                for now:=intarray_max(list_bgnd_rails[aq,0]) downto 0 do begin // and back along the gauge face to the tip.
                                  x_dots:=pbg_get_w_dots(aq,now);
                                  y_dots:=pbg_get_l_dots(aq,now);
                                  if (w_dims_valid=True) and (l_dims_valid=True)
                                     then begin
                                            edge_started:=True;

                                            Inc(dots_index);
                                            if dots_index>dots_max_c then dots_index:=dots_max_c;

                                            dots[dots_index].X:=x_dots;
                                            dots[dots_index].Y:=y_dots;
                                          end
                                     else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                                end;//next now

                                with on_canvas do begin

                                  set_pen_railcolour(True);

                                  if ( (using_mapping_colour=True) and (Pen.Color=mapping_colour) ) or ( (mapping_colours_print<0) and (Pen.Color=printbg_single_colour) )
                                     // then Brush.Color:=calc_intensity(clSilver)  // 214b  - was clGray
                                     then Brush.Color:=printrail_infill_colour_bk  // SC 01-OCT-2024 556 - brick override

                                     else begin
                                            if fb_kludge_this>0 then Brush.Color:=printrail_infill_colour_cu
                                                                else Brush.Color:=printrail_infill_colour_bg;
                                          end;

                                  case rail_infill_i of
                                                  1: Brush.Style:=bsBDiagonal;   // hatched
                                                  2: Brush.Style:=bsSolid;       // solid
                                                  3: Brush.Style:=bsDiagCross;   // cross_hatched
                                                  4: begin                       // blank
                                                       Brush.Style:=bsSolid;
                                                       Brush.Color:=clWhite;     // overide
                                                     end;
                                                else Brush.Style:=bsSolid;       // solid
                                  end;//case

                                  if pdf_black_white=True
                                     then begin
                                            Brush.Style:=bsSolid;               // solid infill white.
                                            Brush.Color:=clWhite;               // overide
                                          end;

                                  if dots_index>4
                                     then begin
                                            Polygon(Slice(dots,dots_index+1));   // +1, number of points, not index.  must have at least 5 points.

                                            edge_colour:=Pen.Color;  // existing rail edges.

                                            if Brush.Style=bsSolid then blanking_colour:=Brush.Color   // infill colour.
                                                                   else blanking_colour:=clWhite;

                                                  // remove polygon lines across vee rail ends...

                                            pbg_modify_vee_end(point_mid_dots_index,point_mid_dots_index+1,edge_colour,blanking_colour); // point rail end.

                                            pbg_modify_vee_end(splice_mid_dots_index,splice_mid_dots_index+1,edge_colour,blanking_colour); // splice rail end.

                                          end;

                                end;//with Canvas

                            end;//polygon mode
                    end;//with background template
                  end;
                  //////////////////////////////////////////////////////////////

                  procedure pbg_mark_end(aq1, aq1end, aq2, aq2end:integer);    // print the background rail end mark.

                  begin
                    with now_keep do begin
                      if (bgnd_endmarks_yn[aq1,aq1end]=True) and (bgnd_endmarks_yn[aq2,aq2end]=True)
                         then begin
                                p1:=bgnd_endmarks[aq1,aq1end];
                                p2:=bgnd_endmarks[aq2,aq2end];

                                with on_canvas do begin

                                  set_pen_railcolour(True);

                                  move_to.X:=Round((p1.Y-grid_left)*scaw_out)+page_left_dots;
                                  move_to.Y:=Round((p1.X-grid_top)*scal_out)+page_top_dots;

                                  line_to.X:=Round((p2.Y-grid_left)*scaw_out)+page_left_dots;
                                  line_to.Y:=Round((p2.X-grid_top)*scal_out)+page_top_dots;

                                  if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                end;//with
                              end;
                    end;//with
                  end;
                  //////////////////////////////////////////////////////////////

                  procedure  pbg_outline_railends;  // draw in the rail ends using existing pen settings...

                  begin
                    pbg_mark_end(1,1,9,1);    // main rail wing rail finish.
                    pbg_mark_end(2,1,10,1);   // turnout rail wing rail finish.

                    pbg_mark_end(6,0,14,0);   // main side check rail start.
                    pbg_mark_end(6,1,14,1);   // main side check rail finish.

                    pbg_mark_end(7,0,15,0);   // turnout side check rail start.
                    pbg_mark_end(7,1,15,1);   // turnout side check rail finish.

                    pbg_mark_end(4,0,5,0);    // blunt nose.

                    if fixed_diamond_ends=True
                             then begin
                                    pbg_mark_end(1,0,9,0);   // planed faced of point rails for a fixed-diamond.
                                    pbg_mark_end(2,0,10,0);

                                    pbg_mark_end(26,1,27,1);     // MS K-crossing check rails.
                                    pbg_mark_end(28,1,29,1);     // DS K-crossing check rails.
                                  end;

                  end;
                  //////////////////////////////////////////////////////////////

                  procedure pbg_draw_diagram_mode;    // 0.91.d draw a complete template in diagrammatic mode

                  const
                    dots_max_c=xy_pts_c*2;

                  var
                    dots:array[0..dots_max_c] of TPoint;     // array of points for filled polygon mode.

                      //    (xy_pts_c=3000;)
                      //   3000 points for each side of rail. if incx is 18" scale (SQRT 9ft scale in 4mm = SQRT(36) =6 mm),
                      //   template max is 4500' scale length.
                      //   ( = 18000 mm or 59ft approx in 4 mm scale).
                      //   ( = 66 A4 sheets long if straight turnout - but normally less for curved turnout).

                      // N.B. huge standard Pascal array is used instead of our own dynamic integer arrays,
                      // because needed for the Polygon function.

                      // total memory = 6000*8 bytes = 48kb.

                    now,now_max:integer;
                    edge_started:boolean;
                    dots_index:integer;
                    x_dots,y_dots:integer;
                    ms_mid_dots_index,ts_mid_dots_index:integer;
                    edge_colour, blanking_colour:integer;

                    no_vee:boolean;

                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                  procedure pbg_modify_boundary(start_index,stop_index,edge,blank:integer);

                                  begin

                                    if (start_index>=0) and (start_index<=dots_index) and (stop_index>=0) and (stop_index<=dots_index)
                                       then begin
                                              move_to:=dots[start_index];
                                              line_to:=dots[stop_index];

                                              if check_limits(move_to, line_to)=True
                                                 then begin
                                                        with on_canvas do begin
                                                          Pen.Color:=blank;                // first blank across..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(line_to.X, line_to.Y);

                                                          Pen.Color:=edge;                 // then restore the corner points..
                                                          MoveTo(move_to.X, move_to.Y);
                                                          LineTo(move_to.X, move_to.Y);

                                                          MoveTo(line_to.X, line_to.Y);
                                                          LineTo(line_to.X, line_to.Y);
                                                        end;//with
                                                      end;
                                            end;
                                  end;
                                  //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                  begin
                    with now_keep do begin

                      if (intarray_max(list_bgnd_rails[0,0])=0)    // no data for straight stock rail
                      or (intarray_max(list_bgnd_rails[3,0])=0)    // no data for curved stock rail
                         then begin
                                diagram_partials_omitted:=True;    // 226c
                                EXIT;
                              end;

                      if (intarray_max(list_bgnd_rails[4,0])=0) or (intarray_max(list_bgnd_rails[5,0])=0)   // no data for vee rails
                         then no_vee:=True
                         else no_vee:=False;

                      dots_index:=0-1;                    // first increment is to zero.


                      now_max:=intarray_max(list_bgnd_rails[0,0]);    // straight stock rail
                      edge_started:=False;

                      for now:=0 to now_max do begin
                        x_dots:=pbg_get_w_dots(0,now);
                        y_dots:=pbg_get_l_dots(0,now);
                        if (w_dims_valid=True) and (l_dims_valid=True)
                           then begin
                                  edge_started:=True;

                                  Inc(dots_index);
                                  if dots_index>dots_max_c then dots_index:=dots_max_c;

                                  dots[dots_index].X:=x_dots;
                                  dots[dots_index].Y:=y_dots;
                                end
                           else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                      end;//next now

                      ms_mid_dots_index:=dots_index;

                      if no_vee=False
                         then begin
                                now_max:=intarray_max(list_bgnd_rails[4,0]);    // point rail
                                edge_started:=False;

                                for now:=now_max downto 0 do begin
                                  x_dots:=pbg_get_w_dots(4,now);
                                  y_dots:=pbg_get_l_dots(4,now);
                                  if (w_dims_valid=True) and (l_dims_valid=True)
                                     then begin
                                            edge_started:=True;

                                            Inc(dots_index);
                                            if dots_index>dots_max_c then dots_index:=dots_max_c;

                                            dots[dots_index].X:=x_dots;
                                            dots[dots_index].Y:=y_dots;
                                          end
                                     else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                                end;//next now


                                now_max:=intarray_max(list_bgnd_rails[5,0]);    // splice rail
                                edge_started:=False;

                                for now:=0 to now_max do begin
                                  x_dots:=pbg_get_w_dots(5,now);
                                  y_dots:=pbg_get_l_dots(5,now);
                                  if (w_dims_valid=True) and (l_dims_valid=True)
                                     then begin
                                            edge_started:=True;

                                            Inc(dots_index);
                                            if dots_index>dots_max_c then dots_index:=dots_max_c;

                                            dots[dots_index].X:=x_dots;
                                            dots[dots_index].Y:=y_dots;
                                          end
                                     else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                                end;//next now
                              end;//if vee

                      ts_mid_dots_index:=dots_index;

                      now_max:=intarray_max(list_bgnd_rails[3,0]);    // curved stock rail
                      edge_started:=False;

                      for now:=now_max downto 0 do begin
                        x_dots:=pbg_get_w_dots(3,now);
                        y_dots:=pbg_get_l_dots(3,now);
                        if (w_dims_valid=True) and (l_dims_valid=True)
                           then begin
                                  edge_started:=True;

                                  Inc(dots_index);
                                  if dots_index>dots_max_c then dots_index:=dots_max_c;

                                  dots[dots_index].X:=x_dots;
                                  dots[dots_index].Y:=y_dots;
                                end
                           else if edge_started=True then BREAK;   // don't resume adding dots to this edge once started and then gone out of limits.
                      end;//next now

                      with on_canvas do begin

                        set_pen_railcolour(True);

                        Pen.Width:=printrail_wide;
                        if Pen.Width<1 then Pen.Width:=1;

                        if using_mapping_colour=True
                           then Brush.Color:=mapping_colour
                           else Brush.Color:=sb_diagram_colour;  // 209c  was printrail_infill_colour_bg;

                        case rail_infill_i of
                                        1: Brush.Style:=bsBDiagonal;   // hatched
                                        2: Brush.Style:=bsSolid;       // solid
                                        3: Brush.Style:=bsDiagCross;   // cross_hatched
                                        4: begin                       // blank
                                             Brush.Style:=bsSolid;
                                             Brush.Color:=clWhite;     // overide
                                           end;
                                      else Brush.Style:=bsSolid;       // solid
                        end;//case

                        if pdf_black_white=True
                           then begin
                                  Brush.Style:=bsSolid;               // solid infill white.
                                  Brush.Color:=clWhite;               // overide
                                end;

                        if dots_index>2
                           then begin
                                  Polygon(Slice(dots,dots_index+1));   // +1, number of points, not index.  must have 4 points.

                                               // blank out template boundaries...

                                  if output_include_boundaries=False
                                     then begin
                                            edge_colour:=Pen.Color;  // existing rail edges.

                                            if Brush.Style=bsSolid then blanking_colour:=Brush.Color   // infill colour.
                                                                   else blanking_colour:=clWhite;

                                            pbg_modify_boundary(0,dots_index,edge_colour,blanking_colour);  // toe or approach end.

                                            pbg_modify_boundary(ms_mid_dots_index,ms_mid_dots_index+1,edge_colour,blanking_colour);  // exit end (turnout) or Ctrl-1 end (plain track).

                                            if no_vee=False then pbg_modify_boundary(ts_mid_dots_index,ts_mid_dots_index+1,edge_colour,blanking_colour);  // turnout road end.
                                          end;
                                end;

                        if output_show_points_mark=True  // mark position of points
                           then begin

                                   if  (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.turnout_info1.plain_track_flag=False)   // not for plain track
                                   and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.turnout_info2.semi_diamond_flag=False)            // not for half-diamond
                                   and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.turnout_info2.gaunt_flag=False)                   // not for gaunt turnout

                                   and (intarray_max(list_bgnd_rails[1,0])<>0)    // data for straight switch rail
                                   and (intarray_max(list_bgnd_rails[2,0])<>0)    // data for curved stock rail
                                       then begin
                                              if Brush.Color=clWhite
                                                 then Pen.Color:=clBlack
                                                 else Pen.Color:=clWhite;     // white points mark

                                              x_dots:=pbg_get_w_dots(1,0);  // ms toe.
                                              y_dots:=pbg_get_l_dots(1,0);

                                              if (w_dims_valid=True) and (l_dims_valid=True)
                                              then begin
                                                     MoveTo(x_dots,y_dots);

                                                     x_dots:=pbg_get_w_dots(2,0);  // ts toe.
                                                     y_dots:=pbg_get_l_dots(2,0);

                                                     if (w_dims_valid=True) and (l_dims_valid=True)
                                                        then LineTo(x_dots,y_dots);
                                                   end;
                                            end;
                                end;//mark points

                      end;//with Canvas
                    end;//with background template
                  end;
                  //////////////////////////////////////////////////////////////


begin          // print background templates...

  max_list_index:=keeps_list.Count-1;

  if max_list_index<0 then EXIT;  // no templates in box.

  if output_diagram_mode=False
     then begin
            pdf_laz_bgnd_marks(grid_left,grid_top,max_list_index,False,False);  // 0.93.a // first print all the background timbering and marks except rail joints and timber numbers.

            if pad_form.timber_numbering_over_platforms_menu_entry.Checked=False
               then pdf_laz_bgnd_marks(grid_left,grid_top,max_list_index,False,True);     // 226d and again to do the timber numbers now if wanted under platforms
          end;

  with on_canvas do begin

    Pen.Mode:=pmCopy;     // default

                  //  now print bgnd track centre-lines and turnout rails...

    for n:=0 to max_list_index do begin

      if Ttemplate(keeps_list.Objects[n]).bg_copied=False then CONTINUE;  // no data, not on background.

      if (Ttemplate(keeps_list.Objects[n]).group_selected=False) and (print_group_only_flag=True) then CONTINUE;  // not in group. 0.78.b 10-12-02.

      if  (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code>0)  // 209c
      and (print_settings_form.output_fb_foot_lines_checkbox.Checked=False)
          then CONTINUE;                                                      // foot lines not wanted.

      this_one_platforms_trackbed:=Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.platform_trackbed_info.adjacent_edges_keep;           // True = platforms and trackbed edges   206b

      this_one_trackbed_cess_ms:=Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.platform_trackbed_info.draw_ms_trackbed_cess_edge_keep;  // True = cess width instead of trackbed cutting line 215a
      this_one_trackbed_cess_ts:=Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.platform_trackbed_info.draw_ts_trackbed_cess_edge_keep;  // True = cess width instead of trackbed cutting line 215a

      now_ti:=Ttemplate(keeps_list.Objects[n]).template_info;  // 227a

                // but first add dropper symbols under rails..

      bgnd_y_datum:=now_ti.keep_dims.box_dims1.transform_info.datum_y*100;

      yd:=bgnd_y_datum;      // SC 12-SEP-2024

      kludge:=(now_ti.keep_dims.box_dims1.fb_kludge_template_code>0);  // no symbols for fb_kludge templates

      if kludge=False
         then pdf_laz_draw_symbols(on_canvas,now_ti.file_blocks.keep_symbols,0,1,grid_left,grid_top,bgnd_y_datum);  // 227a draw the 0=droppers over timbers  1=polygon only

               // now rails and track centre-lines...

      now_keep:=now_ti.bgnd_keep;     // next background keep

      with now_keep do begin

         // mapping_colours_print: 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.

        using_mapping_colour:=False;  // default init.

        with Ttemplate(keeps_list.Objects[n]).template_info.keep_dims do begin

          if box_dims1.bgnd_code_077<>1 then CONTINUE;    // 0.77.b BUG???

          with turnout_info2 do begin
            fixed_diamond_ends:=(semi_diamond_flag=True) and (diamond_fixed_flag=True);    // need end marks on fixed diamond point rails.
            gaunt_template:=gaunt_flag;                                                    // 0.93.a ex 0.81
          end;//with

          if (box_dims1.use_print_mapping_colour=True)
             and ( (mapping_colours_print=1) or (mapping_colours_print=3) )
             and (pdf_black_white=False)
             and (pdf_grey_shade=False)
                 then begin
                        mapping_colour:=calc_intensity(box_dims1.print_mapping_colour);
                        using_mapping_colour:=True;
                      end;

          if (box_dims1.use_pad_marker_colour=True)
             and (mapping_colours_print=4)   // use pad settings instead
             and (pdf_black_white=False)
             and (pdf_grey_shade=False)
                 then begin
                        mapping_colour:=calc_intensity(box_dims1.pad_marker_colour);
                        using_mapping_colour:=True;
                      end;

          fb_kludge_this:=box_dims1.fb_kludge_template_code;  // 0.94.a

          if fb_kludge_this=0   // no track centre-lines or diagram mode for kludge templates  212a
             then begin

                    if output_diagram_mode=True then pbg_draw_diagram_mode;  // first draw template in diagrammatic mode.

                    if ((print_settings_form.output_centrelines_checkbox.Checked=True) and (output_diagram_mode=False) and (box_dims1.align_info.dummy_template_flag=False))
                    or ((print_settings_form.output_bgnd_shapes_checkbox.Checked=True) and (box_dims1.align_info.dummy_template_flag=True))  // 212a dummy templates not part of track plan

                       then begin

                              Brush.Color:=clWhite;  // 0.93.a gaps in dotted lines.
                              Brush.Style:=bsClear;
                              TextOut(0,0,'');

                              Pen.Mode:=pmCopy;

                              if box_dims1.align_info.dummy_template_flag=True   // 212a   dummy template as bgnd shapes
                                 then begin
                                        Pen.Style:=psSolid;
                                        Pen.Color:=printshape_colour;
                                        Pen.Width:=printshape_wide;
                                      end
                                 else begin

                                        set_pen_railcolour(False);

                                        Pen.Width:=printcl_wide;
                                        if Pen.Width<1 then Pen.Width:=1;

                                        {if Pen.Width=1 then Pen.Style:=psDash     // out wPDF bug
                                                       else} Pen.Style:=psSolid;

                                      end;

                              for aq:=24 to 25 do begin         // track centre-lines.

                                array_max:=intarray_max(list_bgnd_rails[aq,0]);
                                if array_max=0 then CONTINUE;                      // empty rail.

                                xint:=intarray_get(list_bgnd_rails[aq,0],0);
                                yint:=intarray_get(list_bgnd_rails[aq,1],0);

                                move_to.X:=Round((yint-grid_left)*scaw_out)+page_left_dots;
                                move_to.Y:=Round((xint-grid_top)*scal_out)+page_top_dots;

                                for nk:=1 to array_max do begin

                                  xint:=intarray_get(list_bgnd_rails[aq,0],nk);
                                  yint:=intarray_get(list_bgnd_rails[aq,1],nk);

                                  line_to.X:=Round((yint-grid_left)*scaw_out)+page_left_dots;
                                  line_to.Y:=Round((xint-grid_top)*scal_out)+page_top_dots;

                                  if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                  move_to:=line_to;
                                end;//next nk

                              end;//next aq
                            end;//if track-centres

                  end;//if not kludge

        end;//with template

        if (print_settings_form.output_rails_checkbox.Checked=True) or ( (detail_mode_form.thickcl_radio.Checked=True) and (detail_mode_form.no_platforms_radio.Checked=False) )    // 226d
           then begin
                  Pen.Mode:=pmCopy;
                  Pen.Style:=psSolid;

                  Pen.Width:=printrail_wide;
                  if Pen.Width<1 then Pen.Width:=1;

                  if (rail_infill_i=0)  // out for pdf, was  or ((scale*out_factor)<0.75)   // less than 18.75% for 4mm scale (control template) (10.71% for 7mm).
                  and (output_diagram_mode=False)
                     then begin           //  outline (pen) mode ...
                                          //  n.b. this mode does not automatically close the rail-ends.
                                          //  no infill for platforms

                            set_pen_railcolour(True);

                            for aq:=0 to 23 do begin                                             // 24, 25 centre-lines already done.
                              if (this_one_platforms_trackbed=False) and (aq>15) then CONTINUE;  // no adjacent tracks in output  // 206b

                              if (detail_mode_form.thickcl_radio.Checked=True) and (aq<16) and (aq>23) then CONTINUE;   // 226c add only platforms if centre-lines only

                              case aq of     // 223d
                                16,17,20,21: if print_settings_form.output_platforms_checkbox.Checked=False then CONTINUE;         // platforms not wanted
                                18,19,22,23: if print_settings_form.output_trackbed_edges_checkbox.Checked=False then CONTINUE;    // trackbed edges not wanted
                              end;//case

                              pbg_outline_railedge(aq,0,False);
                            end;

                            for aq:=26 to aq_max_c do pbg_outline_railedge(aq,0,False);   // K-crossing check rails.

                            pbg_outline_railends;  // next, draw in the rail ends using same pen settings...
                          end
                     else begin      // infill (polygon) mode ...

                                     // do blades first - neater result.
                            if detail_mode_form.thickcl_radio.Checked=False   // 226c
                               then begin

                                      if output_diagram_mode=False // detail mode only
                                         then begin

                                                for rail:=1 to 3 do pbg_draw_fill_rail(8);  // closure rails and curved stock rail.

                                                rail:=0;                                    // straight stock rail.
                                                pbg_draw_fill_rail(8);

                                                for rail:=6 to 7 do pbg_draw_fill_rail(8);  // check rails
                                              end;
                                    end; // 226c

                            if this_one_platforms_trackbed=True   // no adjacent tracks in output 206b
                               then begin
                                      rail:=16;     // detail mode or diagram mode (for platforms/trackbed)
                                      repeat
                                        case rail of     // 223d
                                          16,20: if print_settings_form.output_platforms_checkbox.Checked=True then pbg_draw_fill_rail(1);        // platforms
                                          18,22: if print_settings_form.output_trackbed_edges_checkbox.Checked=True then pbg_draw_fill_rail(1);   // trackbed edges
                                        end;//case
                                        rail:=rail+2;
                                        if (output_diagram_mode=True) and (output_include_trackbed_edges=False) and ((rail=18) or (rail=22)) then rail:=rail+2;  // 206b no trackbed/cess in diagram mode
                                      until rail>22;
                                    end;

                            if detail_mode_form.thickcl_radio.Checked=False   // 226c
                               then begin
                                      if output_diagram_mode=False // detail mode only
                                         then begin

                                                rail:=26;
                                                repeat
                                                  pbg_draw_fill_rail(1);                    // K-crossing check rails.
                                                  rail:=rail+2;
                                                until rail>28;

                                                pbg_draw_fill_vee;    // do complete vee in one go ...

                                                                      // finally draw in the planing gauge-faces - no infill...

                                                set_pen_railcolour(True);

                                                aq:=1;

                                                if (intarray_max(list_bgnd_rails[aq,0])<>0) and (planing_end_aq1>0) { and (drawn_full_aq1=False)}
                                                   then begin
                                                          move_to.X:=pbg_get_w_dots(aq,0); move_to.Y:=pbg_get_l_dots(aq,0);
                                                          for now:=1 to planing_end_aq1{+1} do begin
                                                            line_to.X:=pbg_get_w_dots(aq,now); line_to.Y:=pbg_get_l_dots(aq,now);
                                                            if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                                            move_to:=line_to;
                                                          end;//for
                                                        end;

                                                aq:=2;
                                                if (intarray_max(list_bgnd_rails[aq,0])<>0) and (planing_end_aq2>0) { and (drawn_full_aq2=False)}
                                                   then begin
                                                          move_to.X:=pbg_get_w_dots(aq,0); move_to.Y:=pbg_get_l_dots(aq,0);
                                                          for now:=1 to planing_end_aq2{+1} do begin
                                                            line_to.X:=pbg_get_w_dots(aq,now); line_to.Y:=pbg_get_l_dots(aq,now);
                                                            if check_limits(move_to, line_to)=True then begin MoveTo(move_to.X, move_to.Y); LineTo(line_to.X, line_to.Y); end;
                                                            move_to:=line_to;
                                                          end;//for
                                                        end;
                                              end;//detail mode
                                    end; // 226c
                          end;//polygon mode

                end;//if rails

      end;//with bgnd_keep

           // add ID text, gaps and sticker symbols over the rails..

      if kludge=False
         then begin
                pdf_laz_draw_symbols(on_canvas,now_ti.file_blocks.keep_symbols,0,2,grid_left,grid_top,bgnd_y_datum);  // 227c
                pdf_laz_draw_symbols(on_canvas,now_ti.file_blocks.keep_symbols,1,2,grid_left,grid_top,bgnd_y_datum);  // 227a draw the 1=gaps
                pdf_laz_draw_symbols(on_canvas,now_ti.file_blocks.keep_symbols,2,2,grid_left,grid_top,bgnd_y_datum);  // 227a draw the 2=stickers
              end;

    end;//for next n template
  end;//with on_canvas

                         // finally add the rail-joint marks over the rail infill...   // 209c moved outside loop

  if (print_settings_form.output_rails_checkbox.Checked=True) and (output_diagram_mode=False)
     then pdf_laz_bgnd_marks(grid_left,grid_top,max_list_index,True,False);

                        // and the timber numbering over the platforms ...   226d

  if (pad_form.timber_numbering_over_platforms_menu_entry.Checked=True) and (output_diagram_mode=False)
     then pdf_laz_bgnd_marks(grid_left,grid_top,max_list_index,False,True);

end;
//________________________________________________________________________________________

procedure Tpdf_laz_form.how_panelClick(Sender: TObject);

begin
  if help(-1,pdf_help_str,'about  mapping  colours')=1 then pad_form.marker_and_mapping_colours_help_menu_entry.Click;
end;
//____________________________________________________________________________________________

procedure Tpdf_laz_form.FormCloseQuery(Sender: TObject;  var CanClose: Boolean);

begin
  if print_busy=True
     then begin
            CanClose:=False;                    // can''t close if still busy.
            omit_all_button.Click;
          end
     else CanClose:=True;
end;
//___________________________________________________________________________________________

procedure Tpdf_laz_form.banner_fill_checkboxClick(Sender: TObject);

begin
  button_clicked:=True;
  banner_changed:=True;
end;
//_______________________________________________________________________________________

procedure Tpdf_laz_form.font_buttonClick(Sender: TObject);

begin
  preview_form.Font.Assign(get_font('choose  a  new  font  and  text  colour  for  the  preview  page  labels',preview_form.Font,True));
end;
//__________________________________________________________________________________________

procedure Tpdf_laz_form.black_edges_checkboxClick(Sender: TObject);

        // need to repeat the colour setup, already set before form shows.
begin
  print_colours_setup;
end;
//_______________________________________________________________________________________

procedure Tpdf_laz_form.FormResize(Sender: TObject);

begin
  if (Showing=True) and (initdone_flag=True) and (form_scaling=False)    //  otherwise clobbers Windows on startup or quit.
     then ScrollInView(all_button);
end;
//___________________________________________________________________________________________

procedure intensity_changed;

var
  n:integer;

begin
  print_colours_setup;            // set up the new colours.

      // clear any existing rotated bitmaps, so new ones are created with new colours...

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count>0
       then begin
              for n:=0 to Count-1 do begin

                if Tbgshape(Objects[n]).bgnd_shape.shape_code<>-1 then CONTINUE;     // not a picture

                Tbgshape(Objects[n]).bgimage.image_shape.rotated_bitmap.Free;            // clear the bitmap...
                Tbgshape(Objects[n]).bgimage.image_shape.rotated_bitmap:=TBitmap.Create;
              end;//for
            end;
  end;//with
end;
//__________________________________________________________________________________________

procedure pdf_rotate_bitmap(i:integer);     // rotate bitmap supplied 90degs clockwise.

var
  inrow,incol:integer;
  inwidth,inheight:integer;
  pixel_colour:TColor;
  saved_screen_cursor:TCursor;
  str:string;

begin

  saved_screen_cursor:=Screen.Cursor;
  Screen.Cursor:=crHourglass;

  try
    with Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]) do begin

      str:=bgnd_shape.shape_name;

      with bgimage.image_shape do begin

        inwidth:=image_bitmap.Width;
        inheight:=image_bitmap.Height;

        rotated_bitmap.Monochrome:=image_bitmap.Monochrome;

        try
          rotated_bitmap.Width:=inheight;
          rotated_bitmap.Height:=inwidth;
        except
          alert(2,'    image  preparation  failure',
                  'Sorry, preparation of the following picture shape for PDF output has failed:'
                 +'||'+str
                 +'||The failure was caused by insufficient resources in your system.'
                 +'||Try re-scanning the image at a lower resolution, or if it is colour image try re-scanning in grey-scale or black and white.',
                  '','','','','','O K',0);
          EXIT;
        end;//try

        with rotated_bitmap do begin
          with Canvas do begin
            Brush.Color:=clWhite;          //  this clears the new bitmap for starters.
            Brush.Style:=bsSolid;
            FillRect(Rect(0, 0, Width, Height));
          end;//with
        end;//with

        if inheight<32767 then pdf_laz_form.row_progressbar.Max:=inheight    // Delphi 16-bit limits..
                          else pdf_laz_form.row_progressbar.Max:=32767;

        pdf_laz_form.row_progressbar.Position:=0;

        for inrow:=0 to (inheight-1) do begin
          for incol:=0 to (inwidth-1) do begin
            pixel_colour:=image_bitmap.Canvas.Pixels[incol,inrow];
            if pixel_colour<>clWhite then rotated_bitmap.Canvas.Pixels[inheight-1-inrow,incol]:=calc_intensity(pixel_colour);
          end;//for
          pdf_laz_form.row_progressbar.StepIt;

          pdf_laz_form.row_label.Caption:='processing... '+IntToStr(inrow);  // 208b
          Application.ProcessMessages;

        end;//for

        rotated_picture.Graphic:=rotated_bitmap;

      end;//with
    end;//with
  finally
    pdf_laz_form.row_progressbar.Position:=0;
    pdf_laz_form.row_label.Caption:='';
    Screen.Cursor:=saved_screen_cursor;
  end;//try
end;
//________________________________________________________________________________________

{
        mark codes :-

         -123: 235b  offsets for 3-D DXF

           -5: label position.

           -4: timber selector mark.

        -3,-2: curving rad centres.

           -1: fixing peg centre.

            1: guide marks.

            2: radial ends.

            3: timber outlines.

         4,14: timber centre-lines.    14=solid for rivet centres.

            5: timber reduced ends.

            6: rail joint marks.

            7: transition and slewing marks.

            8: peg 1st arm.

            9: peg 2nd arm.

           10: plain track start marks.

33,55,93,95,233,293: selected for shoving timber outlines, reduced ends and infill.

        44,54: selected for shoving timber centre-lines.

          101: switch drive mark   // 223d

          203: timber infilling.

}

//__________________________________________________________________________________________

procedure Tpdf_laz_form.diagram_mode_radiobuttonClick(Sender: TObject);

begin
  if diagram_mode_radiobutton.Checked=True then pad_form.output_diagram_mode_menu_entry.Click;
  show_output_mode_panel;
end;
//______________________________________________________________________________

procedure Tpdf_laz_form.detail_mode_radiobuttonClick(Sender: TObject);

begin
  if detail_mode_radiobutton.Checked=True then pad_form.output_detail_mode_menu_entry.Click;
  show_output_mode_panel;
end;
//______________________________________________________________________________

procedure Tpdf_laz_form.page_listboxClick(Sender: TObject);      // 227a

begin
  with page_listbox do begin
    if ItemIndex<1
       then begin
              sheet_across:=0;
              sheet_down:=-1;
            end
       else begin
              sheet_across:=Tsheet_id(pdf_laz_form.page_listbox.Items.Objects[ItemIndex-1]).across;
              sheet_down:=Tsheet_id(pdf_laz_form.page_listbox.Items.Objects[ItemIndex-1]).down;
            end;

    omit_page_button.Click;    // for a change of page
  end;//with
end;
//______________________________________________________________________________

function pdf_laz_draw_symbols(canv:TCanvas; symbols:Tsymbols; symbol_type,layer:integer; grid_left,grid_top,ypd:extended):boolean;   // layer, ypd 227c

var
  i,n,dummy_i:integer;

  move_to,line_to:TPoint;

  check_intx,check_inty:extended;

  check_int1x,check_int1y,check_int2x,check_int2y:extended;

  pole_length:extended;

  infill_points:array[0..23] of TPoint;

  font_height,half_stringwidth,half_stringheight:integer;

  drawn_id_str:string;

begin
  RESULT:=False;  // default init.

  if print_settings_form.output_symbols_checkbox.Checked=False then EXIT;

  if pdf_laz_form.symbols_checkbox.Checked=False then EXIT;

  if output_diagram_mode=True then EXIT;

  with canv do begin

    if Length(symbols)<1 then EXIT;

    for n:=0 to Length(symbols)-1 do begin

      with symbols[n] do begin

        with symbol_data do begin

          if symb_type<>symbol_type then CONTINUE;

          with drawn_symbol do begin

            case symb_type of

               0: if layer=1
                     then begin                  // it's a dropper polygon...
                            Pen.Width:=1;
                            Pen.Style:=psSolid;
                            Pen.Mode:=pmCopy;
                            Pen.Color:=symb_colour;

                            Brush.Style:=bsSolid;
                            Brush.Color:=symb_colour;

                            for i:=0 to (num_points-1) do begin

                              check_intx:=limits(h_minint,h_maxint,(poly_points[i].Y+ypd-grid_left)*scaw_out+page_left_dots,dummy_i);
                              check_inty:=limits(h_minint,h_maxint,(poly_points[i].X-grid_top)*scal_out+page_top_dots,dummy_i);

                              infill_points[i].X:=Round(check_intx);
                              infill_points[i].Y:=Round(check_inty);

                            end;//next

                            Polygon(Slice(infill_points,num_points));   // number of points, not index

                              // now the flagpole ...

                            check_int1x:=limits(h_minint,h_maxint,(symbol_point.Y+ypd-grid_left)*scaw_out+page_left_dots,dummy_i);
                            check_int1y:=limits(h_minint,h_maxint,(symbol_point.X-grid_top)*scal_out+page_top_dots,dummy_i);

                            check_int2x:=limits(h_minint,h_maxint,(end_point.Y+ypd-grid_left)*scaw_out+page_left_dots,dummy_i);
                            check_int2y:=limits(h_minint,h_maxint,(end_point.X-grid_top)*scal_out+page_top_dots,dummy_i);

                            move_to.X:=Round(check_int1x);  move_to.Y:=Round(check_int1y);
                            line_to.X:=Round(check_int2x);  line_to.Y:=Round(check_int2y);

                            pole_length:=SQRT(SQR(move_to.X-line_to.X)+SQR(move_to.Y-line_to.Y));    // in dots

                            Pen.Width:=Round(pole_length/5);  // 5 arbitrary

                            MoveTo(move_to.X, move_to.Y);
                            LineTo(line_to.X, line_to.Y);


                  end;

               1: begin   // gap H-section fishplate tuf

                    Pen.Width:=1;
                    Pen.Style:=psSolid;
                    Pen.Mode:=pmCopy;
                    Pen.Color:=symb_colour;

                    Brush.Style:=bsSolid;
                    Brush.Color:=symb_colour;

                    for i:=0 to (num_points-1) do begin

                      check_intx:=limits(h_minint,h_maxint,(poly_points[i].Y+ypd-grid_left)*scaw_out+page_left_dots,dummy_i);
                      check_inty:=limits(h_minint,h_maxint,(poly_points[i].X-grid_top)*scal_out+page_top_dots,dummy_i);

                      infill_points[i].X:=Round(check_intx);
                      infill_points[i].Y:=Round(check_inty);

                    end;//next

                    Polygon(Slice(infill_points,num_points));   // number of points, not index

                  end;

              // 2: sticker - boxed string only - below

            end;//case

               // now the ID text...

            if (symb_type<>1) and (layer=2) // no text for a gap
               then begin
                      check_intx:=limits(h_minint,h_maxint,(id_point.Y+ypd-grid_left)*scaw_out+page_left_dots,dummy_i);
                      check_inty:=limits(h_minint,h_maxint,(id_point.X-grid_top)*scal_out+page_top_dots,dummy_i);

                      move_to.X:=Round(check_intx); move_to.Y:=Round(check_inty);

                      Font.Assign(pad_form.pad_dropper_font_label.Font);    // Courier New

                      font_height:=Round(id_height.X*scal_out);

                      if font_height<1 then font_height:=1;

                      Font.Height:=0-font_height;   // heights negative

                      drawn_id_str:=Trim(symb_id_str);

                      half_stringwidth:=TextWidth(drawn_id_str) div 2;
                      half_stringheight:=TextHeight(drawn_id_str) div 2;

                      Font.Color:=symb_colour;

                      Brush.Color:=clWhite;
                      Brush.Style:=bsSolid; //bsClear;

                      if symb_type=2  // sticker  draw box rectangle
                         then begin

                                Pen.Width:=2;
                                Pen.Style:=psSolid;
                                Pen.Mode:=pmCopy;
                                Pen.Color:=clBlack;

                                Brush.Color:=symb_colour;

                                Rectangle(move_to.X-half_stringwidth-7, move_to.Y-half_stringheight, move_to.X+half_stringwidth+9, move_to.Y+half_stringheight);  // 7,9 arbitrary padding

                                Brush.Style:=bsClear;  // for TextOut over rectangle

                                Pen.Width:=1;  // reset

                                Font.Color:=clBlack;
                              end;

                      TextOut(move_to.X-half_stringwidth,move_to.Y-half_stringheight,drawn_id_str);

                      Font.Assign(print_labels_font);  // restore
                    end;


          end;//with
        end;//with

      end;//with

      RESULT:=True;  // something was drawn

    end;//next symbol

  end;//with canv
end;
//______________________________________________________________________________


end.



