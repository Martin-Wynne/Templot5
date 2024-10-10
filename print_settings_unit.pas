
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

(*
"""
================================================================================
	Changes applied
================================================================================
SC 19-SEP-2024 556
 Add object output_omit_S1_labels_checkbox.Tcheckbox to chairing_group in print_settings_unit.lfm
sc 17-sep-2024 556.

SC 22-SEP-2024 556
 print_chair_labels_font
sc 22-sep-2024 556.

SC 01-OCT-2024 556
 add infill styles to print_settings_unit
sc 01-oct-2024 556
================================================================================
"""
*)


unit print_settings_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, Menus, Types;

type

  { Tprint_settings_form }

  Tprint_settings_form = class(TForm)
    output_grid_lines_checkbox: TCheckBox;
    grid_labels_font_button: TButton;
    grid_lines_spacing_button: TButton;
    grid_lines_colour_button: TButton;
    grid_lines_colour_panel: TPanel;
    grid_options_label: TLabel;
    grid_lines_options_panel: TPanel;
    grid_lines_solid_radiobutton: TRadioButton;
    grid_lines_dotted_radiobutton: TRadioButton;
    sb_diagram_infill_style_combobox: TComboBox;
    single_colour_panel: TPanel;
    marker_colour_options_label: TLabel;
    line_thickness_label: TLabel;
    diagram_mode_label: TLabel;
    marker_colour_options_panel: TPanel;
    normal_colours_radiobutton: TRadioButton;
    rails_only_radiobutton: TRadioButton;
    timbers_only_radiobutton: TRadioButton;
    single_colour_button: TButton;
    single_colour_radiobutton: TRadioButton;
    marker_options_help_button: TButton;
    trackpad_marker_radiobutton: TRadioButton;
    rails_and_timbers_radiobutton: TRadioButton;
    track_bgnd_colour_button: TButton;
    diagram_track_colour_button: TButton;
    sb_track_bgnd_colour_panel: TPanel;
    size_adjust_checkbox: TCheckBox;
    thickness_help_button: TButton;
    line_thickness_panel: TPanel;
    radial_end_marks_colour_button: TButton;
    normal_lines_button: TRadioButton;
    set_any_line_button: TRadioButton;
    thick_lines_button: TRadioButton;
    thin_lines_button: TRadioButton;
    rail_joint_marks_colour_button: TButton;
    radial_end_marks_colour_panel: TPanel;
    line_group_label: TLabel;
    platform_edge_colour_button: TButton;
    guide_marks_colour_button: TButton;
    platform_edge_colour_panel: TPanel;
    guide_marks_colour_panel: TPanel;
    background_shapes_colour_button: TButton;
    rail_joint_marks_colour_panel: TPanel;
    background_shapes_colour_panel: TPanel;
    timb_outline_colour_button: TButton;
    output_railbk_infill_colour_button: TButton;
    output_timber_colour_button: TButton;
    output_plat_infill_colour_button: TButton;
    rail_edge_colour_button: TButton;
    timb_outline_colour_panel: TPanel;
    pricbk_colour_panel: TPanel;
    ptic_colour_panel: TPanel;
    output_railbg_infill_colour_button: TButton;
    output_railcu_infill_colour_button: TButton;
    pricbg_colour_panel: TPanel;
    priccu_colour_panel: TPanel;
    infill_group_label: TLabel;
    output_chairs_checkbox: TCheckBox;
    output_chair_infill_colour_button: TButton;
    output_chair_labels_checkbox: TCheckBox;
    output_chair_label_colour_button: TButton;
    output_omit_S1_labels_checkbox: TCheckBox;
    pcic_colour_panel: TPanel;
    plic_colour_panel: TPanel;
    prip_colour_panel: TPanel;
    Shape1: TShape;
    timber_infill_style_combobox: TComboBox;
    railcu_infill_style_combobox: TComboBox;
    railbg_infill_style_combobox: TComboBox;
    railbk_infill_style_combobox: TComboBox;
    platform_infill_style_combobox: TComboBox;
    rail_edge_colour_panel: TPanel;
    top_label: TLabel;
    blue_corner_panel: TPanel;
    size_updown: TUpDown;
    datestamp_label: TLabel;
    spacer_label: TLabel;
    close_panel: TPanel;
    close_button: TButton;
    output_rails_checkbox: TCheckBox;
    output_centrelines_checkbox: TCheckBox;
    output_timbering_checkbox: TCheckBox;
    output_radial_centres_checkbox: TCheckBox;
    output_bgnd_shapes_checkbox: TCheckBox;
    output_fb_foot_lines_checkbox: TCheckBox;
    output_radial_ends_checkbox: TCheckBox;
    Label1: TLabel;
    output_switch_labels_checkbox: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    output_sketchboard_items_checkbox: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    output_xing_labels_checkbox: TCheckBox;
    output_symbols_checkbox: TCheckBox;
    output_timber_centres_checkbox: TCheckBox;
    output_timber_numbers_checkbox: TCheckBox;
    output_timber_extensions_checkbox: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    output_rail_joints_checkbox: TCheckBox;
    output_guide_marks_checkbox: TCheckBox;
    output_switch_drive_checkbox: TCheckBox;
    output_timb_id_prefix_checkbox: TCheckBox;
    output_platforms_checkbox: TCheckBox;
    output_trackbed_edges_checkbox: TCheckBox;
    Shape2: TShape;
    top_label1: TLabel;
    sb_diagram_colour_panel: TPanel;
    track_bgnd_width_button: TButton;
    procedure background_shapes_colour_panelClick(Sender: TObject);
    procedure close_panelClick(Sender: TObject);
    procedure grid_labels_font_buttonClick(Sender: TObject);
    procedure grid_lines_colour_panelClick(Sender: TObject);
    procedure grid_lines_dotted_radiobuttonClick(Sender: TObject);
    procedure grid_lines_solid_radiobuttonClick(Sender: TObject);
    procedure grid_lines_spacing_buttonClick(Sender: TObject);
    procedure output_grid_lines_checkboxClick(Sender: TObject);
    procedure sb_diagram_colour_panelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure guide_marks_colour_panelClick(Sender: TObject);
    procedure normal_colours_radiobuttonClick(Sender: TObject);
    procedure marker_options_help_buttonClick(Sender: TObject);
    procedure normal_lines_buttonClick(Sender: TObject);
    procedure rails_only_radiobuttonClick(Sender: TObject);
    procedure sb_diagram_infill_style_comboboxChange(Sender: TObject);
    procedure timbers_only_radiobuttonClick(Sender: TObject);
    procedure pcic_colour_panelClick(Sender: TObject);
    procedure platform_edge_colour_panelClick(Sender: TObject);
    procedure platform_infill_style_comboboxChange(Sender: TObject);
    procedure pricbg_colour_panelClick(Sender: TObject);
    procedure pricbk_colour_panelClick(Sender: TObject);
    procedure priccu_colour_panelClick(Sender: TObject);
    procedure plic_colour_panelClick(Sender: TObject);
    procedure prip_colour_panelClick(Sender: TObject);
    procedure ptic_colour_panelClick(Sender: TObject);
    procedure radial_end_marks_colour_panelClick(Sender: TObject);
    procedure railbg_infill_style_comboboxChange(Sender: TObject);
    procedure railbk_infill_style_comboboxChange(Sender: TObject);
    procedure railcu_infill_style_comboboxChange(Sender: TObject);
    procedure rails_and_timbers_radiobuttonClick(Sender: TObject);
    procedure rail_edge_colour_panelClick(Sender: TObject);
    procedure rail_joint_marks_colour_panelClick(Sender: TObject);
    procedure set_any_line_buttonClick(Sender: TObject);
    procedure single_colour_panelClick(Sender: TObject);
    procedure single_colour_radiobuttonClick(Sender: TObject);
    procedure size_adjust_checkboxClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
    procedure output_timbering_checkboxClick(Sender: TObject);
    procedure output_timber_numbers_checkboxClick(Sender: TObject);
    procedure thickness_help_buttonClick(Sender: TObject);
    procedure thick_lines_buttonClick(Sender: TObject);
    procedure thin_lines_buttonClick(Sender: TObject);
    procedure timber_infill_style_comboboxChange(Sender: TObject);
    procedure timb_outline_colour_panelClick(Sender: TObject);
    procedure trackpad_marker_radiobuttonClick(Sender: TObject);
    procedure sb_track_bgnd_colour_panelClick(Sender: TObject);
    procedure track_bgnd_width_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var

  print_settings_form: Tprint_settings_form;


                     //  printer default colours and line widths...

  save_fc:integer=clLime;      //  print_labels_font default colour;
  save_tnfc:integer=clBlack;   //  print_timber_numbers_font default colour;

  save_cpnfc:integer=clBlack;  // 0.93.a added print corner numbers font default colour

  print_railedge_colour:integer=$00010101;   // virtual black.
  virtual_black_colour:integer=$00010101;    // HP bug work-around.
  save_prc:integer=$00010101;                // default for colour printing.

  printgrid_colour:integer=clAqua;           // printed grid lines.
  save_grc:integer=clAqua;

  printmargin_colour:integer=clFuchsia;      // printed trim margins.
  save_pmc:integer=clFuchsia;

  printtimber_colour:integer=clBlack; //clBlue;
  save_ptc:integer=clBlack;           //clBlue;

  printtimber_infill_colour:integer=$00E0FFFF;    // 209c  was $00C0FFFF;       // printed timbering.  cream infill.
  save_ptic:integer=$00E0FFFF;                    // 209c  was $00C0FFFF;

  printcurail_colour:integer=$00010101;  //virtual_black_colour;   // rail edge colour for control template.
  printbgrail_colour:integer=$00010101;  //virtual_black_colour;   // rail edge colour for background templates.

  printrail_infill_colour_cu:integer=$0080B0E8;   // 209c  was $006090C0;    // tan/rusty printed rails (control template).
  save_priccu:integer=$0080B0E8;                  // 209c  was $006090C0;

  printrail_infill_colour_bg:integer=$00F0D0B4;  // 214a         was $00E8B080;   // 209c  was $00C09060;    // steely-blue.   //$0090C060 sea-green printed rails (background templates).
  save_pricbg:integer=$00F0D0B4;                 // 214a         was $00E8B080;   // 209c  was $00C09060;

  printrail_infill_colour_bk:integer=clSilver;  // printed rails (brick templates).
  save_pricbk:integer=clSilver;                 //

           // 0.93.a platforms ..

  printplat_edge_colour:integer=$005080A0;     // browny-orange platform edges
  save_priplatedge:integer=$005080A0;
  printplat_infill_colour:integer=$00DCECF4;   // light tan platform infill
  save_priplatfill:integer=$00DCECF4;

  sb_track_bgnd_colour:integer=$0090D8D8;  // 206a
  save_sb_track_bgnd:integer=$0090D8D8;    // 206a

  sb_diagram_colour:integer=$00E4C0A0;   // 223d       was $00C4A07C; steel blue
  save_sb_diagram_col:integer=$00E4C0A0; // 223d       was $00C4A07C; steel blue

  // SC 01-OCT-2024 556
  sb_diagram_infill_style:integer=2;         // solid

  printgrid_thick:extended=0.02;             // mm minimum thickness.
  printpicborder_thick:extended=0.02;        // mm minimum thickness. (1 dot).

  printmargin_thick:extended=0.22;           // mm.
  printshape_thick:extended=0.22;            // mm.

  printtimber_thick:extended=0.16;           // mm.
  printrail_thick:extended=0.16;             // mm.
  printmark_thick:extended=0.16;             // mm.

  printcl_thick:extended=0.02;               // mm. track centre-lines 0.79.a minimum thickness. (1 dot).

  printguide_colour:integer=$000070F0;        // 211b orange was fuchsia
  save_pgc:integer=$000070F0;                 // 211b orange was fuchsia

  printjoint_colour:integer=clBlack;
  save_pjc:integer=clBlack;

  printalign_colour:integer=clLime;
  save_pac:integer=clLime;

  printshape_colour:integer=clFuchsia;
  save_psc:integer=clFuchsia;

  printbg_single_colour:integer=clPurple;
  save_pbg:integer=clPurple;


  // Fonts
  print_labels_font:TFont;
  printer_text_font:TFont;
  print_timber_numbers_font:TFont;
  print_corner_page_numbers_font:TFont;  // 0.93.a
  print_chair_labels_font:TFont;          // SC 22-SEP-2024 556

  printchair_colour:integer=$000050B0;
  save_pcc:integer=$000050B0;

  printchair_infill_colour:integer=$00E0E8FF;
  save_pcic:integer=$00E0E8FF;

  printchair_label_infill_colour:integer=$00C4E4FF;
  save_plic:integer=$00C4E4FF;

  // styles
  print_railbg_infill_style:integer=2;             // solid
  print_railbk_infill_style:integer=2;             // solid
  print_railcu_infill_style:integer=2;             // solid

  out_factor:extended=1.0;     // output scaling factor.

  // SC 01-OCT-2024 556
  track_bgnd_width_in:extended=288;  // 24ft default  206a


  function create_fb_kludge_templates:integer;
  procedure delete_fb_kludge_templates;


implementation

{$BOOLEVAL ON}


{$R *.lfm}

uses
  control_room,pad_unit,math_unit,keep_select,bgkeeps_unit,help_sheet,shove_timber,
  entry_sheet,detail_mode_unit,
  colour_unit, wait_message;

//______________________________________________________________________________

const

    line_thick_help_str:string='      `0Setting  Printed  Line  Thicknesses`9'
      +'||The settings in the OUTPUT > LINE THICKNESS menu options determine the thickness (width) of the lines which make up the drawing on printed templates.'

      +'||Click the THIN LINES menu option to print all lines on your templates at the minimum thickness which is possible on your printer (or not less than 0.02 mm).'

      +'||Click the NORMAL LINES menu option to use the following settings, or the nearest possible on your printer:'
      +'|Grid lines 0.02 mm or minimum'
      +'|Trim margin lines 0.22 mm'
      +'|Background shapes 0.22 mm'
      +'|Picture shape borders 0.02 mm or minimum'
      +'|Rail-edge lines 0.16 mm'
      +'|Timber outlines 0.16 mm'
      +'|Track centre-lines lines 0.02 mm or minimum'    // 0.79.a
      +'|All other marks 0.16 mm'
      +'|(These slightly odd dimensions have been chosen to give as near as possible equivalent results on different makes of printer.)'

      +'||Click the THICK LINES menu option to use the following settings, or the nearest possible on your printer:'
      +'|Grid lines 0.16 mm'
      +'|Trim-margin lines 0.5 mm'
      +'|Background shapes 0.4 mm'
      +'|Picture shape borders 0.16 mm'
      +'|Rail-edge lines 0.3 mm'
      +'|Timber outlines 0.3 mm'
      +'|Track centre-lines lines 0.16 mm'   // 0.79.a
      +'|All other marks 0.3 mm'

      +'||Or click the SET ANY LINE THICKNESS... menu option to make any other line thickness settings which you require.'

      +'||If the SIZE-ADJUST LINE THICKNESS menu option is ticked, Templot will scale down some of these line thicknesses in accordance with any reduced size setting for printing in the PRINT > ENLARGE/REDUCE SIZE menu options.'
      +' The grid lines and trim-margin lines are not affected.'
      +'||If the SIZE-ADJUST LINE THICKNESS menu option is unticked, all lines will be printed at the set thickness, without regard to any reduced size setting for printing in the PRINT > ENLARGE/REDUCE SIZE menu options.'

      +'||For Picture Shape borders, the set line thickness applies only if the image is being printed. If the OUTLINES ONLY option is selected the outline is printed at the Background Shape line thickness.'

      +'||N.B. If you are using an old-style dot-matrix impact printer (or a pen plotter), Templot draws all lines 1 ink-dot thick, and the settings which you make'
      +' here will have no effect until you change to a non-impact printer.'

      +'||Handy Hints:'
      +'||For the final construction templates printed using Best or Letter-Quality or Photo print quality, the THIN LINES option will give the most precise result.'

      +'||For trial prints using the Economy or Draft setting, the NORMAL LINES option is more prominent.'

      +'||The actual drawn line thickness (line width) may vary from these settings and is determined by the dot size and dpi (dots per inch) resolution for your printer.'

      +'||These settings have no effect on templates exported in DXF file format. The way the templates are rendered in your CAD software is determined only in that program.'

      +'||These line thickness settings affect only the printed output, they have no effect on the screen drawing. To change the appearance of'
      +' the drawing on the screen, select the TRACKPAD menu items.';

    marker_mapping_help_str:string='      `0Using  Marker  Colours  and  Mapping  Colours`9'
     +'||Marker and mapping colours allow individual templates or groups of templates to be displayed and printed in different colours. This is useful when templates are being superimposed,'
     +' or when it is desired to have different areas of the track plan in different colours. For example, the main running lines might be in one colour, sidings and yards in another colour,'
     +' and off-stage storage sidings in a third colour.'

     +'||"Marker colour" is the term used for a colour which applies primarily to the trackpad and sketchboard display on the screen.'
     +'||"Mapping colour" is the term used for a colour which applies primarily to the print and PDF output.'

     +'||Colours for the screen and printing are set independently because some colours which are usable on the screen are not suitable for printing templates (white, yellow, pale pastel colours, etc.).'

     +'||Every stored template has an individual marker colour in which it can be displayed on the trackpad,'
     +' and an option setting for whether this colour should be used instead of the normal colours which are being used for background templates on the trackpad.'
     +' The pre-set marker colour is Red, and the option setting is Off, i.e. the marker colour is not actually used until this option setting is changed for this template.'

     +'||Likewise, every stored template has an individual mapping colour in which it can be printed,'
     +' and an option setting for whether this colour should be used instead of the normal colours which are being used for printing background templates.'
     +' The pre-set mapping colour is Magenta-pink, and the option setting is Off, i.e. the mapping colour is not actually used until this option setting is changed for this template.'

     +'||Marker and mapping colours and these option settings are part of the template specification and are included in template data .box files when templates are saved.'

     +'||To change the colours and options for a single background template, click on the template and then on its pop-up menu select the TEMPLATE COLOURS menu items.'
     +' Changing the marker or mapping colour automatically selects the option to use the relevant colour.'

     +'||To change the colours and options for a group of templates (so that they are all displayed in the same colour), first select the group. Then click the GROUP > GROUP SELECT > TEMPLATE COLOURS FOR GROUP menu items.'
     +'||N.B. PLEASE BE AWARE that a selected group of templates is normally displayed in the GROUP COLOUR. The templates will not appear in the chosen marker colour until the group is de-selected (GROUP > GROUP SELECT > GROUP SELECT NONE menu item).'

     +'||When a number of templates are being displayed in a given marker colour, it is possible to select all those templates as a group by clicking the GROUP > GROUP SELECT > SELECT BY MARKER COLOUR... menu item.'
     +' In this way the marker colour for the whole group can be changed.'

     +'||Handy Hint:'
     +'|It will often be useful to maintain a correlation between coloured areas of the track plan and your remembered groups (GROUP > GROUP SELECT > REMEMBER THIS GROUP menu items).'
     +' There is no automatic link between marker colours and remembered groups, because only you know what the colours signify. It is possible to have every template on the plan in a slightly different colour,'
     +' whereas the number of remembered groups is limited to 8.'

     +'||The way in which the marker colours are actually used in displaying the background templates is set in the TRACKPAD > TRACKPAD BACKGND TEMPLATES COLOURS menu options. You can choose whether these colours should apply to the rails, timbers, or both.'
     +' It is also possible to use the mapping colours instead as a means of previewing the printed output. Changing these settings has no effect on templates which have not had their option setting changed to use their marker or mapping colours.'

     +'||The way in which the mapping colours are actually used in printing background templates is set in the PRINT > PRINTED DRAWING OPTIONS > COLOUR OPTIONS menu options.'
     +' You can choose whether these colours should apply to the rails, timbers, or both. This will often be determined by the current printing size and likely consumption of coloured ink.'
     +' Mapping colours do not apply to any timber infill or rail infill. When mapping colours are used for the rails the rail infill colour is set to grey.'
     +' It is also possible to use the marker colours instead as a means of printing the track plan in the same colours as those in which it is being displayed on the screen.'
     +' Changing these settings has no effect on templates which have not had their option setting changed to use their marker or mapping colours.'

     +'||There is also a SINGLE COLOUR option for printing which overrides all other colour settings and prints the entire track plan in a single colour of your choice.'
     +' Finally there is an OPTIONS > BLACK RAIL-EDGES tickbox on the PRINT PAGES window which overrides all other colour, grey-shade, and print-intensity settings and ensures that the rail-edges are always printed in full black.';

//______________________________________________________________________________


function font_colour_for_rgb_panel(colour:integer):TColor;

var
  red,green,blue:integer;
  weighted_average:extended;

begin
  RESULT:=clWhite;  // init

  red:=(colour AND $000000FF);
  green:=(colour AND $0000FF00) div $100;
  blue:=(colour AND $00FF0000) div $10000;

  // calculate Greyscale RGB value using weighted average
  // Y = 0.299 R + 0.587 G + 0.114 B
  weighted_average:= (0.299*red+0.587*green+0.114*blue);
  // showmessage('sbc average '+FloatToStr(weighted_average));
  if (weighted_average>138) or ((green=0) and (weighted_average>100)) then RESULT:=clBlack;
end;


    //______________________________________________________________________________



procedure Tprint_settings_form.size_updownClick(Sender: TObject; Button: TUDBtnType);

begin
  if size_updown.Position>size_updown.Tag                          // ! position goes up, size goes down.
     then ScaleBy(9,10);                                           // scale the form contents down.

  if size_updown.Position<size_updown.Tag
     then ScaleBy(10,9);                                           // scale the form contents up.

  //ClientHeight:=VertScrollBar.Range;                               // allow 4 pixel right margin.
  //ClientWidth:=HorzScrollBar.Range+4;                              // don't need bottom margin - datestamp label provides this.
  //ClientHeight:=VertScrollBar.Range;                               // do this twice, as each affects the other.

  size_updown.Tag:=size_updown.Position;                           // and save for the next click.
end;
//______________________________________________________________________________

// SC 15-SEP-2024 556
procedure Tprint_settings_form.pcic_colour_panelClick(Sender: TObject);

          // print chair infill colour
var
  old:TColor;

begin
  old:=pcic_colour_panel.Color;
  pcic_colour_panel.Color:=get_colour('choose  a  chair  infill  colour',pcic_colour_panel.Color);
  if pcic_colour_panel.Color<>old
     then begin
            output_chairs_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printchair_infill_colour:=pcic_colour_panel.Color;
            save_pcic:=pcic_colour_panel.Color;
            pcic_colour_panel.Font.Color:=font_colour_for_rgb_panel(pcic_colour_panel.Color);
          end;
end;

procedure Tprint_settings_form.marker_options_help_buttonClick(Sender: TObject);

begin
  help(0,marker_mapping_help_str,'');
end;

procedure Tprint_settings_form.normal_lines_buttonClick(Sender: TObject);

begin
  pad_form.normal_printed_lines_menu_entry.Checked:=True;     // radio item.

  printpicborder_thick:=0.02;        // mm minimum thickness. (1 dot).
  printgrid_thick:=0.02;             // mm minimum thickness. (1 dot).

  printmargin_thick:=0.22;           // mm.   (3 dots at 300/360 dpi)
  printshape_thick:=0.22;            // mm.   (3 dots at 300/360 dpi)

  printtimber_thick:=0.16;           // mm.   (2 dots at 300/360 dpi)
  printrail_thick:=0.16;             // mm    (2 dots at 300/360 dpi)
  printmark_thick:=0.16;             // mm.   (2 dots at 300/360 dpi)

  printcl_thick:=0.02;               // mm minimum 1 dot   0.79.a
end;

procedure Tprint_settings_form.rails_only_radiobuttonClick(Sender: TObject);
begin
  mapping_colours_print:=1;    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
end;

procedure Tprint_settings_form.sb_diagram_infill_style_comboboxChange(Sender: TObject);

begin
  sb_diagram_infill_style:=sb_diagram_infill_style_combobox.ItemIndex;
end;

procedure Tprint_settings_form.timbers_only_radiobuttonClick(Sender: TObject);

begin
  mapping_colours_print:=2;    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
end;

procedure Tprint_settings_form.guide_marks_colour_panelClick(Sender: TObject);

          // print guide marks colour
var
  old:TColor;

begin
  old:=guide_marks_colour_panel.Color;
  guide_marks_colour_panel.Color:=get_colour('choose  a  guide  marks  colour',guide_marks_colour_panel.Color);
  if guide_marks_colour_panel.Color<>old
     then begin
            output_guide_marks_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printguide_colour:=guide_marks_colour_panel.Color;
            save_pgc:=guide_marks_colour_panel.Color;
            guide_marks_colour_panel.Font.Color:=font_colour_for_rgb_panel(guide_marks_colour_panel.Color);
          end;

end;

procedure Tprint_settings_form.normal_colours_radiobuttonClick(Sender: TObject);

begin
  mapping_colours_print:=0;    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
end;

procedure Tprint_settings_form.background_shapes_colour_panelClick(Sender: TObject);

          // print background shapes colour
var
  old:TColor;

begin
  old:=background_shapes_colour_panel.Color;
  background_shapes_colour_panel.Color:=get_colour('choose  a  background  shapes  colour',background_shapes_colour_panel.Color);
  if background_shapes_colour_panel.Color<>old
     then begin
            output_bgnd_shapes_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printshape_colour:=background_shapes_colour_panel.Color;
            save_psc:=background_shapes_colour_panel.Color;
            background_shapes_colour_panel.Font.Color:=font_colour_for_rgb_panel(background_shapes_colour_panel.Color);
          end;

end;

procedure Tprint_settings_form.close_panelClick(Sender: TObject);

begin
  Close;
end;

procedure Tprint_settings_form.grid_labels_font_buttonClick(Sender: TObject);
begin
  print_labels_font.Assign(get_font('choose  a  font  and  text  colour  for  the  printed  grid  labels',print_labels_font,True));

  if (print_labels_font.Color<>clBlack) and ((black_white=True) or (grey_shade=True))
     then begin
            if check_black_white=True then EXIT;   // font colour will be reset on printing.
          end;

  save_fc:=print_labels_font.Color;
end;

procedure Tprint_settings_form.grid_lines_colour_panelClick(Sender: TObject);

          // grid lines colour colour
var
  old:TColor;

begin
  if check_black_white=True then EXIT;
  old:=grid_lines_colour_panel.Color;
  grid_lines_colour_panel.Color:=get_colour('choose  a  colour  for  the  printed  grid  lines',grid_lines_colour_panel.Color);
  if grid_lines_colour_panel.Color<>old
     then begin
            printgrid_colour:=grid_lines_colour_panel.Color;
            save_grc:=grid_lines_colour_panel.Color;
            grid_lines_colour_panel.Font.Color:=font_colour_for_rgb_panel(grid_lines_colour_panel.Color);
          end;


end;

procedure Tprint_settings_form.grid_lines_dotted_radiobuttonClick(Sender: TObject);

begin
  pad_form.printed_grid_dotted_menu_entry.Checked:= NOT pad_form.printed_grid_dotted_menu_entry.Checked;  // radio item.
end;

procedure Tprint_settings_form.grid_lines_solid_radiobuttonClick(Sender: TObject);

begin
  pad_form.printed_grid_solid_menu_entry.Checked:=NOT pad_form.printed_grid_solid_menu_entry.Checked;  // radio item.
end;

procedure Tprint_settings_form.grid_lines_spacing_buttonClick(Sender: TObject);
begin
  set_grid_spacings(pad_form);
end;

procedure Tprint_settings_form.output_grid_lines_checkboxClick(Sender: TObject);

begin
  if output_grid_lines_checkbox.checked=True
     then printgrid_i:=1
     else printgrid_i:=0;
  pad_form.print_grid_on_menu_entry.Checked:=(printgrid_i=1);        // radio items
  pad_form.print_grid_off_menu_entry.Checked:=(printgrid_i=0);
end;

procedure Tprint_settings_form.sb_diagram_colour_panelClick(Sender: TObject);

          // sketchboard diagram infill colour
var
  old:TColor;

begin
  old:=sb_diagram_colour_panel.Color;
  sb_diagram_colour_panel.Color:=get_colour('choose  a  track  diagram  colour',sb_diagram_colour_panel.Color);
  if sb_diagram_colour_panel.Color<>old
     then begin
            sb_diagram_colour:=sb_diagram_colour_panel.Color;
            save_sb_diagram_col:=sb_diagram_colour_panel.Color;
            sb_diagram_colour_panel.Font.Color:=font_colour_for_rgb_panel(sb_diagram_colour_panel.Color);
          end;

end;

procedure Tprint_settings_form.FormActivate(Sender: TObject);

begin
  // SC 01-OCT-2024 556
  // infill colours
  pricbg_colour_panel.Color:=printrail_infill_colour_bg;
  pricbk_colour_panel.Color:=printrail_infill_colour_bk;
  priccu_colour_panel.Color:=printrail_infill_colour_cu;
  pcic_colour_panel.Color:=printchair_infill_colour;
  plic_colour_panel.Color:=printchair_label_infill_colour;
  prip_colour_panel.Color:=printplat_infill_colour;
  ptic_colour_panel.Color:=printtimber_infill_colour;

  // infill styles
  timber_infill_style_combobox.ItemIndex:= print_timb_infill_style;
  railbg_infill_style_combobox.ItemIndex:= print_railbg_infill_style;
  railbk_infill_style_combobox.ItemIndex:= print_railbk_infill_style;
  railcu_infill_style_combobox.ItemIndex:= print_railcu_infill_style;
  platform_infill_style_combobox.ItemIndex:= print_platform_infill_style;

  // line colours
  timb_outline_colour_panel.Color:=printtimber_colour;
  rail_edge_colour_panel.Color:=print_railedge_colour;
  platform_edge_colour_panel.Color:=printplat_edge_colour;
  guide_marks_colour_panel.Color:=printguide_colour;
  radial_end_marks_colour_panel.Color:=printalign_colour;
  rail_joint_marks_colour_panel.Color:=printjoint_colour;
  background_shapes_colour_panel.Color:=printshape_colour;

  // line thickness
  thin_lines_button.Checked:= pad_form.thin_printed_lines_menu_entry.Checked;
  normal_lines_button.Checked:= pad_form.normal_printed_lines_menu_entry.Checked;
  thick_lines_button.Checked:= pad_form.thick_printed_lines_menu_entry.Checked;
  set_any_line_button.Checked:=  pad_form.set_line_thicknesses_menu_entry.Checked;
  size_adjust_checkbox.Checked:= pad_form.adjust_line_thickness_menu_entry.Checked;

  // diagram colours
  sb_diagram_colour_panel.Color:=sb_diagram_colour;
  sb_track_bgnd_colour_panel.Color:=sb_track_bgnd_colour;
  // diagram styles
  sb_diagram_infill_style_combobox.ItemIndex:=sb_diagram_infill_style;

  // marker colour options
  case mapping_colours_print of

     -1: single_colour_radiobutton.Checked:=True;      // radio item.
      0: normal_colours_radiobutton.Checked:=True;     // radio item.
      1: rails_only_radiobutton.Checked:=True;         // radio item.
      2: timbers_only_radiobutton.Checked:=True;       // radio item.
      3: rails_and_timbers_radiobutton.Checked:=True;  // radio item.
      4: trackpad_marker_radiobutton.Checked:=True;    // radio item.
  end;//case

  // output grid lines
  case printgrid_i of
      0: output_grid_lines_checkbox.checked:=False;
      1: output_grid_lines_checkbox.checked:=True;
  end;//case

  // grid line style
  grid_lines_solid_radiobutton.checked:=pad_form.printed_grid_solid_menu_entry.Checked;
  grid_lines_dotted_radiobutton.checked:=pad_form.printed_grid_dotted_menu_entry.Checked;

  single_colour_panel.Color:=printbg_single_colour;
  grid_lines_colour_panel.Color:=printgrid_colour;

  // infill colour font colours
  pricbg_colour_panel.Font.Color:=font_colour_for_rgb_panel(pricbg_colour_panel.Color);
  pricbk_colour_panel.Font.Color:=font_colour_for_rgb_panel(pricbk_colour_panel.Color);
  priccu_colour_panel.Font.Color:=font_colour_for_rgb_panel(priccu_colour_panel.Color);
  pcic_colour_panel.Font.Color:=font_colour_for_rgb_panel(pcic_colour_panel.Color);
  plic_colour_panel.Font.Color:=font_colour_for_rgb_panel(plic_colour_panel.Color);
  prip_colour_panel.Font.Color:=font_colour_for_rgb_panel(prip_colour_panel.Color);
  ptic_colour_panel.Font.Color:=font_colour_for_rgb_panel(ptic_colour_panel.Color);
  timb_outline_colour_panel.Font.Color:=font_colour_for_rgb_panel(timb_outline_colour_panel.Color);
  rail_edge_colour_panel.Font.Color:=font_colour_for_rgb_panel(rail_edge_colour_panel.Color);
  platform_edge_colour_panel.Font.Color:=font_colour_for_rgb_panel(platform_edge_colour_panel.Color);
  guide_marks_colour_panel.Font.Color:=font_colour_for_rgb_panel(guide_marks_colour_panel.Color);
  radial_end_marks_colour_panel.Font.Color:=font_colour_for_rgb_panel(radial_end_marks_colour_panel.Color);
  rail_joint_marks_colour_panel.Font.Color:=font_colour_for_rgb_panel(rail_joint_marks_colour_panel.Color);
  background_shapes_colour_panel.Font.Color:=font_colour_for_rgb_panel(background_shapes_colour_panel.Color);
  sb_diagram_colour_panel.Font.Color:=font_colour_for_rgb_panel(sb_diagram_colour_panel.Color);
  sb_track_bgnd_colour_panel.Font.Color:=font_colour_for_rgb_panel(sb_track_bgnd_colour_panel.Color);
  single_colour_panel.Font.Color:=font_colour_for_rgb_panel(single_colour_panel.Color);
  grid_lines_colour_panel.Font.Color:=font_colour_for_rgb_panel(grid_lines_colour_panel.Color);

  // sc 01-oct-2024 556
end;

procedure Tprint_settings_form.platform_edge_colour_panelClick(Sender: TObject);

          // print platform edge colour
var
  old:TColor;

begin
  old:=platform_edge_colour_panel.Color;
  platform_edge_colour_panel.Color:=get_colour('choose  a  platform  edge  colour',platform_edge_colour_panel.Color);
  if platform_edge_colour_panel.Color<>old
     then begin
            output_platforms_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printplat_edge_colour:=platform_edge_colour_panel.Color;
            save_priplatedge:=platform_edge_colour_panel.Color;
            platform_edge_colour_panel.Font.Color:=font_colour_for_rgb_panel(platform_edge_colour_panel.Color);
          end;

end;


procedure Tprint_settings_form.platform_infill_style_comboboxChange(Sender: TObject);

begin
  print_platform_infill_style:=platform_infill_style_combobox.ItemIndex;
end;

//______________________________________________________________________________

// SC 01-OCT-2024 556
procedure Tprint_settings_form.pricbg_colour_panelClick(Sender: TObject);

          // print rail infill colour - background
var
  old:TColor;

begin
  old:=pricbg_colour_panel.Color;
  pricbg_colour_panel.Color:=get_colour('choose  a  background  template  rail  infill  colour',pricbg_colour_panel.Color);
  if pricbg_colour_panel.Color<>old
     then begin
            output_rails_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printrail_infill_colour_bg:=pricbg_colour_panel.Color;
            save_pricbg:=pricbg_colour_panel.Color;
            pricbg_colour_panel.Font.Color:=font_colour_for_rgb_panel(pricbg_colour_panel.Color);
          end;
end;
//______________________________________________________________________________

procedure Tprint_settings_form.pricbk_colour_panelClick(Sender: TObject);

          // print rail infill colour - brick override
var
  old:TColor;

begin
  old:=pricbk_colour_panel.Color;
  pricbk_colour_panel.Color:=get_colour('choose  a  brick  template  rail  infill  colour',pricbk_colour_panel.Color);
  if pricbk_colour_panel.Color<>old
     then begin
            output_rails_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printrail_infill_colour_bk:=pricbk_colour_panel.Color;
            save_pricbk:=pricbk_colour_panel.Color;
            pricbk_colour_panel.Font.Color:=font_colour_for_rgb_panel(pricbk_colour_panel.Color);
          end;
end;
//______________________________________________________________________________

procedure Tprint_settings_form.priccu_colour_panelClick(Sender: TObject);

          // print rail infill colour - current (control)
var
  old:TColor;

begin
  old:=priccu_colour_panel.Color;
  priccu_colour_panel.Color:=get_colour('choose  a  control  template  rail  infill  colour',priccu_colour_panel.Color);
  if priccu_colour_panel.Color<>old
     then begin
            output_rails_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printrail_infill_colour_cu:=priccu_colour_panel.Color;
            save_priccu:=priccu_colour_panel.Color;
            priccu_colour_panel.Font.Color:=font_colour_for_rgb_panel(priccu_colour_panel.Color);
          end;
end;
//______________________________________________________________________________
// sc 01-oct-2024 556

procedure Tprint_settings_form.plic_colour_panelClick(Sender: TObject);

          // print chair label infill colour
var
  old:TColor;

begin
  old:=plic_colour_panel.Color;
  plic_colour_panel.Color:=get_colour('choose  a  chair  label  infill  colour',plic_colour_panel.Color);
  if plic_colour_panel.Color<>old
     then begin
            output_chair_labels_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printchair_label_infill_colour:=plic_colour_panel.Color;
            save_plic:=plic_colour_panel.Color;
            plic_colour_panel.Font.Color:=font_colour_for_rgb_panel(plic_colour_panel.Color);
          end;
end;

procedure Tprint_settings_form.prip_colour_panelClick(Sender: TObject);

          // print platform infill colour
var
  old:TColor;

begin
  old:=prip_colour_panel.Color;
  prip_colour_panel.Color:=get_colour('choose  a  timber  infill  colour',prip_colour_panel.Color);
  if prip_colour_panel.Color<>old
     then begin
            output_platforms_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printplat_infill_colour:=prip_colour_panel.Color;
            save_priplatfill:=prip_colour_panel.Color;
            prip_colour_panel.Font.Color:=font_colour_for_rgb_panel(prip_colour_panel.Color);
          end;
end;

// sc 15-sep-2024 556

// SC 01-OCT-2024 556
procedure Tprint_settings_form.ptic_colour_panelClick(Sender: TObject);

          // print timber infill colour
var
  old:TColor;

begin
  old:=ptic_colour_panel.Color;
  ptic_colour_panel.Color:=get_colour('choose  a  timber  infill  colour',ptic_colour_panel.Color);
  if ptic_colour_panel.Color<>old
     then begin
            output_timbering_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printtimber_infill_colour:=ptic_colour_panel.Color;
            save_ptic:=ptic_colour_panel.Color;
            ptic_colour_panel.Font.Color:=font_colour_for_rgb_panel(ptic_colour_panel.Color);
          end;
end;

procedure Tprint_settings_form.radial_end_marks_colour_panelClick(Sender: TObject);

          // print radial end marks colour
var
  old:TColor;

begin
  old:=radial_end_marks_colour_panel.Color;
  radial_end_marks_colour_panel.Color:=get_colour('choose  a  radial  end  marks  colour',radial_end_marks_colour_panel.Color);
  if radial_end_marks_colour_panel.Color<>old
     then begin
            output_radial_ends_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printalign_colour:=radial_end_marks_colour_panel.Color;
            save_pac:=radial_end_marks_colour_panel.Color;
            radial_end_marks_colour_panel.Font.Color:=font_colour_for_rgb_panel(radial_end_marks_colour_panel.Color);
          end;
end;

procedure Tprint_settings_form.railbg_infill_style_comboboxChange(Sender: TObject);

begin
  print_railbg_infill_style:=railbg_infill_style_combobox.ItemIndex;
end;

procedure Tprint_settings_form.railbk_infill_style_comboboxChange(Sender: TObject);

begin
  print_railbk_infill_style:=railbk_infill_style_combobox.ItemIndex;
end;

procedure Tprint_settings_form.railcu_infill_style_comboboxChange(Sender: TObject);

begin
  print_railcu_infill_style:=railcu_infill_style_combobox.ItemIndex;
end;

procedure Tprint_settings_form.rails_and_timbers_radiobuttonClick(Sender: TObject);

begin
  mapping_colours_print:=3;    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
end;

procedure Tprint_settings_form.rail_edge_colour_panelClick(Sender: TObject);

          // print rail edge colour
var
  old:TColor;

begin
  old:=rail_edge_colour_panel.Color;
  rail_edge_colour_panel.Color:=get_colour('choose  a  rail  edge  colour',rail_edge_colour_panel.Color);
  if rail_edge_colour_panel.Color<>old
     then begin
            output_rails_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            print_railedge_colour:=rail_edge_colour_panel.Color;
            save_prc:=rail_edge_colour_panel.Color;
            rail_edge_colour_panel.Font.Color:=font_colour_for_rgb_panel(rail_edge_colour_panel.Color);
          end;


end;

procedure Tprint_settings_form.rail_joint_marks_colour_panelClick(Sender: TObject);

          // print rail joint marks colour
var
old:TColor;

begin
  old:=rail_joint_marks_colour_panel.Color;
  rail_joint_marks_colour_panel.Color:=get_colour('choose  a  rail  edge  colour',rail_joint_marks_colour_panel.Color);
  if rail_joint_marks_colour_panel.Color<>old
    then begin
           output_rail_joints_checkbox.Checked:=True;               // colour changed, assume she wants to use it
           printjoint_colour:=rail_joint_marks_colour_panel.Color;
           save_pjc:=rail_joint_marks_colour_panel.Color;
           rail_joint_marks_colour_panel.Font.Color:=font_colour_for_rgb_panel(rail_joint_marks_colour_panel.Color);
         end;

end;

procedure Tprint_settings_form.set_any_line_buttonClick(Sender: TObject);

const
    thick_str:string='For more information about setting the printed line thicknesses, click the button below.';

var
    n:integer;
    od:Toutdim;

begin
    putdim(thick_str,1,'printed  grid  line  thickness',                 printgrid_thick,True,True,True,False);  // no neg, no preset, no zero, don't terminate on zero.
    putdim(thick_str,1,'printed  trim-margin  line  thickness',        printmargin_thick,True,True,True,False);  // ditto...
    putdim(thick_str,1,'printed  background-shape  line  thickness',    printshape_thick,True,True,True,False);
    putdim(thick_str,1,'printed  picture-shape  border  thickness', printpicborder_thick,True,True,True,False);
    putdim(thick_str,1,'printed  rail-edge  line  thickness',            printrail_thick,True,True,True,False);
    putdim(thick_str,1,'printed  timber  outline  thickness',          printtimber_thick,True,True,True,False);
    putdim(thick_str,1,'printed  track  centre-line  thickness',           printcl_thick,True,True,True,False);   // 0.79.a
    n:=putdim(thick_str,1,'other  printed  marks  line  thickness',         printmark_thick,True,True,True,False);

    if n<>7 then EXIT;        // 0.79.a   was 6
    if getdims('printed  templates  -  line  thicknesses',line_thick_help_str,pad_form,n,od)=True
       then begin
                printgrid_thick:=od[0];
              printmargin_thick:=od[1];
               printshape_thick:=od[2];
           printpicborder_thick:=od[3];
                printrail_thick:=od[4];
              printtimber_thick:=od[5];
                  printcl_thick:=od[6];  // 0.79.a
                printmark_thick:=od[7];

              pad_form.set_line_thicknesses_menu_entry.Checked:=True;   // radio item.

              detail_mode_form.line_thickness_button.Tag:=1;    // don't use default gauge size if he has set it himself
            end;
end;

procedure Tprint_settings_form.single_colour_panelClick(Sender: TObject);

          // print single colour
var
old:TColor;

begin
    if check_black_white=True then EXIT;

    old:=single_colour_panel.Color;
    single_colour_panel.Color:=get_colour('choose  a  single  colour  for  the  printed  background  templates',single_colour_panel.Color);
    if single_colour_panel.Color<>old
      then begin
             mapping_colours_print:=-1;    // assume he wants to use it. 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD marker colour instead, -1=single colour.
             printbg_single_colour:=rail_joint_marks_colour_panel.Color;
             save_pbg:=single_colour_panel.Color;
             if (save_pbg=0) and (black_white=False) then save_pbg:=virtual_black_colour;  // !!! HP driver bug.
             single_colour_panel.Font.Color:=font_colour_for_rgb_panel(single_colour_panel.Color);
           end;

end;

procedure Tprint_settings_form.single_colour_radiobuttonClick(Sender: TObject);

begin
  mapping_colours_print:=-1;    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
end;

procedure Tprint_settings_form.size_adjust_checkboxClick(Sender: TObject);

begin
  pad_form.adjust_line_thickness_menu_entry.Checked:= NOT pad_form.adjust_line_thickness_menu_entry.Checked;
end;

//_________________________________________________________________________________________


//______________________________________________________________________________
// sc 01-oct-2024 556

procedure Tprint_settings_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=1070;
  ClientHeight:=650;

  AutoScroll:=True;

end;
//______________________________________________________________________________


function highest_fb_kludge_template:integer;  // 0.94.a return highest index of a kludge template.
                                              // return -1 if none.
var
  n:integer;

begin
  RESULT:=-1;                        // init default.
  if keeps_list.Count<1 then EXIT;

  for n:=(keeps_list.Count-1) downto 0 do begin
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code>0
       then begin
              RESULT:=n;   // return index.
              EXIT;
            end;
  end;//next template
end;
//______________________________________________________________________________

function lowest_non_fb_kludge_template:integer;  // 0.94.a return lowest index of a non-kludge template.
                                                 // return -1 if none.
var
  n:integer;

begin
  RESULT:=-1;                        // init default.
  if keeps_list.Count<1 then EXIT;

  for n:=0 to (keeps_list.Count-1) do begin
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code=0
       then begin
              RESULT:=n;   // return index.
              EXIT;
            end;
  end;//next template
end;
//______________________________________________________________________________

function any_bgnd_fb:integer;   // 0.94.a  any background FB templates?

var
  n:integer;

begin
  RESULT:=0;                        // init default.
  if keeps_list.Count<1 then EXIT;

  for n:=0 to (keeps_list.Count-1) do begin
    if Ttemplate(keeps_list.Objects[n]).bg_copied=False then CONTINUE;
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.align_info.cl_only_flag=True then CONTINUE;    // 212a
    if Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.rail_type=2 then RESULT:=RESULT+1;             // return count.
  end;//next keep
end;
//______________________________________________________________________________

function create_fb_kludge_templates:integer;

  // 0.94.a   return number of templates created

var
  count,n,n_max:integer;
  ti,saved_control:Ttemplate_info;
  l_ng,h_g:integer;

  save_bgnd_option:boolean;

begin
  count:=0;
  RESULT:=0;  // init

  if keeps_list.Count<1 then EXIT;

  if  (pad_form.gen_outer_foot_edges_menu_entry.Checked=False)
  and (pad_form.gen_inner_foot_edges_menu_entry.Checked=False)
      then EXIT; // generator switches

  if any_bgnd_fb=0 then EXIT;     // no background FB templates to kludge

  wait_form.cancel_button.Hide;
  wait_form.waiting_label.Caption:='preparing  rail - foot  edges ...';

  wait_form.waiting_label.Width:=wait_form.Canvas.TextWidth(wait_form.waiting_label.Caption);  // 205b bug fix for Wine

  wait_form.Show;

  Screen.Cursor:=crHourGlass;        // might take a while.

  Application.ProcessMessages;

  saved_control:=hold_the_control;  // 227a

  save_bgnd_option:=show_bgnd_templates;
  show_bgnd_templates:=False;

  try

    n_max:=keeps_list.Count-1;

    for n:=0 to n_max do begin
      if  (Ttemplate(keeps_list.Objects[n]).bg_copied=True)                                                   // bgnd template
      and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.align_info.cl_only_flag=False)  // template has rails   212a
      and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.rail_type=2)                    // FB rail
      and (Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.fb_kludge_template_code=0)      // not if already a kludge template
          then begin
                 copy_template_info_from_to(False, Ttemplate(keeps_list.Objects[n]).template_info,ti);  // get the keep data.

                 copy_keep(ti);    // to the control template

                 no_timbering:=True;  // no timbering

                 track_centre_lines_flag:=False;   // no centre lines
                 cl_only:=False;

                 switch_drive_flag:=False; // no switch drive

                 draw_ts_platform:=False;
                 draw_ms_platform:=False;  // no plaforms

                 draw_ts_trackbed_edge:=False;
                 draw_ms_trackbed_edge:=False;  // no trackbed edges

                 adjacent_edges:=True; // no adjacent rails

                 railedges(gauge_faces,outer_edges,centre_lines);   // use these switches.

                 if pad_form.gen_inner_foot_edges_menu_entry.Checked=True
                    then begin
                           fb_kludge:=1;     // template for inner edge
                           gocalc(1,0);
                           store_and_background(False,False);

                               // put it in the group if original is in group (for printing group only)  206e  27-02-2013 ...

                           Ttemplate(keeps_list.Objects[keeps_list.Count-1]).group_selected:=Ttemplate(keeps_list.Objects[n]).group_selected;

                           INC(count);
                         end;

                 if pad_form.gen_outer_foot_edges_menu_entry.Checked=True
                    then begin
                           fb_kludge:=2;      // template for outer edge
                           gocalc(1,0);
                           store_and_background(False,False);

                               // put it in the group if original is in group (for printing group only)  206e  27-02-2013 ...

                           Ttemplate(keeps_list.Objects[keeps_list.Count-1]).group_selected:=Ttemplate(keeps_list.Objects[n]).group_selected;

                           INC(count);
                         end;

               end; //FB template
    end;//for

    if count>0       // any created?
       then begin
                   // sort  fb_kludge templates to the start of the list, so they get overprinted.

              repeat
                l_ng:=lowest_non_fb_kludge_template;

                h_g:=highest_fb_kludge_template;

                if (l_ng<>-1) and (h_g<>-1) and (l_ng<h_g)  // not if none there or already at the start
                   then begin
                          keeps_list.Move(h_g,0);     // move it to start
                          memo_list.Move(h_g,0);      // and any memo
                        end
                   else BREAK;
              until 0<>0;
            end;

  finally
    show_bgnd_templates:=save_bgnd_option;   // restore

    unhold_the_control(saved_control);   // 227a True= free lists, restore data

    Screen.Cursor:=crDefault;

    wait_form.Close;
  end;//try

  RESULT:=count;
end;
//______________________________________________________________________________

procedure delete_fb_kludge_templates;

  // 0.94.a ...

var
  i,n:integer;

begin
  if keeps_list.Count<1 then EXIT;

  if keeps_list.Count<>memo_list.Count then run_error(220);

  n:=0;
  while n<keeps_list.Count do begin

    with Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1 do begin

      if fb_kludge_template_code=0     // not a kludge template
         then begin
                INC(n);
                CONTINUE;      // leave this one.
              end;
    end;//with

    if Ttemplate(keeps_list.Objects[n]).bg_copied=True then wipe_it(n);  // any data on background

    Ttemplate(keeps_list.Objects[n]).Free;
    keeps_list.Delete(n);
    memo_list.Delete(n);

  end;//while              // no need to increment n, it is now pointing to the next keep.
end;
//______________________________________________________________________________

procedure Tprint_settings_form.output_timbering_checkboxClick(Sender: TObject);

begin
  output_timber_centres_checkbox.Enabled:=output_timbering_checkbox.Checked;
  output_timber_numbers_checkbox.Enabled:=output_timbering_checkbox.Checked;
  output_timber_extensions_checkbox.Enabled:=output_timbering_checkbox.Checked;

  output_timb_id_prefix_checkbox.Enabled:=(output_timbering_checkbox.Checked) and (output_timber_numbers_checkbox.Checked);
end;
//______________________________________________________________________________

procedure Tprint_settings_form.output_timber_numbers_checkboxClick(Sender: TObject);

begin
  output_timb_id_prefix_checkbox.Enabled:=output_timber_numbers_checkbox.Checked;
end;

procedure Tprint_settings_form.thickness_help_buttonClick(Sender: TObject);

begin
  help(0,line_thick_help_str,'');
end;

procedure Tprint_settings_form.thick_lines_buttonClick(Sender: TObject);

begin
  pad_form.thick_printed_lines_menu_entry.Checked:=True;     // radio item.

  printgrid_thick:=0.16;             // mm.
  printpicborder_thick:=0.16;        // mm.

  printmargin_thick:=0.5;            // mm.
  printtimber_thick:=0.3;            // mm.
  printrail_thick:=0.3;              // mm
  printmark_thick:=0.3;              // mm.
  printshape_thick:=0.4;             // mm.

  printcl_thick:=0.16;               // mm 2 dots   0.79.a
end;

procedure Tprint_settings_form.thin_lines_buttonClick(Sender: TObject);

begin
  pad_form.thin_printed_lines_menu_entry.Checked:=True;     // radio item.

  printgrid_thick:=0.02;             // mm all minimum thickness... (calcs to 1 dot minimum).
  printmargin_thick:=0.02;           // mm.
  printtimber_thick:=0.02;           // mm.
  printrail_thick:=0.02;             // mm
  printmark_thick:=0.02;             // mm.
  printshape_thick:=0.02;            // mm.
  printpicborder_thick:=0.02;        // mm.
  printcl_thick:=0.02;               // mm.  0.79.a
end;

procedure Tprint_settings_form.timber_infill_style_comboboxChange(Sender: TObject);

begin
  print_timb_infill_style:=timber_infill_style_combobox.ItemIndex;
end;

procedure Tprint_settings_form.timb_outline_colour_panelClick(Sender: TObject);

          // print timber outline colour
var
  old:TColor;

begin
  old:=timb_outline_colour_panel.Color;
  timb_outline_colour_panel.Color:=get_colour('choose  a  timber  outline  colour',timb_outline_colour_panel.Color);
  if timb_outline_colour_panel.Color<>old
     then begin
            output_timbering_checkbox.Checked:=True;               // colour changed, assume she wants to use it
            printtimber_colour:=timb_outline_colour_panel.Color;
            save_ptc:=timb_outline_colour_panel.Color;
            timb_outline_colour_panel.Font.Color:=font_colour_for_rgb_panel(timb_outline_colour_panel.Color);
          end;

end;

procedure Tprint_settings_form.trackpad_marker_radiobuttonClick(Sender: TObject
  );
begin
  mapping_colours_print:=4;    // 0=normal, 1=rails only, 2=timbers only, 3=rails and timber outlines, 4:=use the PAD colour instead, -1=single colour.
end;

procedure Tprint_settings_form.sb_track_bgnd_colour_panelClick(Sender: TObject);

          // sketchboard track bounds infill colour
var
  old:TColor;

begin
  old:=sb_track_bgnd_colour_panel.Color;
  sb_track_bgnd_colour_panel.Color:=get_colour('choose  a  diagram  mode  track  bounds  colour',sb_track_bgnd_colour_panel.Color);
  if sb_track_bgnd_colour_panel.Color<>old
     then begin
            sb_track_bgnd_colour:=sb_track_bgnd_colour_panel.Color;
            save_sb_track_bgnd:=sb_track_bgnd_colour_panel.Color;
            sb_track_bgnd_colour_panel.Font.Color:=font_colour_for_rgb_panel(sb_track_bgnd_colour_panel.Color);
          end;
end;

procedure Tprint_settings_form.track_bgnd_width_buttonClick(Sender: TObject);

const
  bgnd_width_help_str:string='    `0track background width`9'
  +'||Enter a dimension in full-size prototype <B>inches</B> for the width of the coloured track background.'
  +'||green_panel_begin tree.gif This applies only to diagram-mode track plans, shown on the sketchboard and in exported image files.'
  +'||The track background is intended to represent the area inside the railway fence on coloured layout plans.'
  +'||A typical width for a single track railway on level ground would be at least 24ft between the fences - entered as 288 inches (or f24 using the f letter prefix for feet).'
  +' Often the fenced width is much wider.green_panel_end'
  +'|rp.gif This track background function requires templates to be created with track centre-lines.'
  +'||blue_bullet Note that this is not the same as the `0geometry > trackbed edges...`1 functions which are intended as construction guide lines for the model.'
  +' The coloured track background is intended for neat small-scale displays. If used on construction templates it would consume excessive quantities of ink.';

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim(bgnd_width_help_str,2,'track  background  width  ( full-size  INCHES )',track_bgnd_width_in,True,True,True,False);   // no negative, no preset, no zero, don't terminate on zero.
  if n<>0 then EXIT;
  if getdims('track  background  width','',pad_form,n,od)=True
     then track_bgnd_width_in:=od[0];

end;

//______________________________________________________________________________


end.
