
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

   This file was derived from Templot2 version 245a

*)

unit dxf_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, pad_unit;

type

  { Tdxf_form }

  Tdxf_form = class(TForm)
    ok_panel: TPanel;
    ok_button: TButton;
    datestamp_label: TLabel;
    blue_corner_panel: TPanel;
    size_updown: TUpDown;
    colour_panel: TPanel;
    colour_patch: TImage;
    save_dialog: TSaveDialog;
    dxf_memo: TMemo;
    cancel_panel: TPanel;
    cancel_button: TButton;
    help_button: TButton;
    Shape1: TShape;
    Label31: TLabel;
    preview_panel: TPanel;
    preview_button: TButton;
    edit_preview_button: TButton;
    dxf_3d_page_control: TPageControl;
    rails_tab_sheet: TTabSheet;
    bricks_tabsheet: TTabSheet;
    plugs_tabsheet: TTabSheet;
    rail_fit_groupbox: TGroupBox;
    Label29: TLabel;
    Label32: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    bs95r_radiobutton: TRadioButton;
    peco_124_rail_radiobutton: TRadioButton;
    emgs_75_rail_radiobutton: TRadioButton;
    smp_75_rail_radiobutton: TRadioButton;
    custom_rail_radiobutton: TRadioButton;
    cl_125_rail_radiobutton: TRadioButton;
    cl_131_rail_radiobutton: TRadioButton;
    peco_75_rail_radiobutton: TRadioButton;
    set_custom_rail_button: TButton;
    splints_button: TButton;
    clips_button: TButton;
    webs_sprues_button: TButton;
    normals_button: TButton;
    loose_jaws_button: TButton;
    support_tabsheet: TTabSheet;
    rafts_button: TButton;
    supports_button: TButton;
    kerf_tabsheet: TTabSheet;
    snibs_button: TButton;
    kerf_button: TButton;
    exp_checkbox: TCheckBox;
    pyramids_checkbox: TCheckBox;
    loose_jaw_pyramids_checkbox: TCheckBox;
    plugs_checkbox: TCheckBox;
    cnc_corners_checkbox: TCheckBox;
    locator_plugs_checkbox: TCheckBox;
    rectangles_groupbox: TGroupBox;
    brick_slabs_radio: TRadioButton;
    plain_rafts_radio: TRadioButton;
    nails_rafts_radio: TRadioButton;
    combos_tabsheet: TTabSheet;
    Label18: TLabel;
    Label1: TLabel;
    adjacent_lines_label: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label39: TLabel;
    rails_combo: TComboBox;
    adjrails_combo: TComboBox;
    tkclines_combo: TComboBox;
    timbout_combo: TComboBox;
    sleeperend_combo: TComboBox;
    timbcent_combo: TComboBox;
    gmarks_combo: TComboBox;
    radmarks_combo: TComboBox;
    joints_combo: TComboBox;
    shapes_bgnd_combo: TComboBox;
    radcentres_combo: TComboBox;
    text_combo: TComboBox;
    rails_style_combo: TComboBox;
    adjrails_style_combo: TComboBox;
    tkclines_style_combo: TComboBox;
    timbout_style_combo: TComboBox;
    timbcent_style_combo: TComboBox;
    gmarks_style_combo: TComboBox;
    radmarks_style_combo: TComboBox;
    joints_style_combo: TComboBox;
    solid_bgnd_style_combo: TComboBox;
    sleeperend_style_combo: TComboBox;
    radcentres_style_combo: TComboBox;
    dot_bgnd_combo: TComboBox;
    dot_bgnd_style_combo: TComboBox;
    tbnum_combo: TComboBox;
    chairs_style_combo: TComboBox;
    chairs_combo: TComboBox;
    chair_bolts_style_combo: TComboBox;
    chair_bolts_combo: TComboBox;
    sockets_style_combo: TComboBox;
    sockets_combo: TComboBox;
    flanges_combo: TComboBox;
    sprues_combo: TComboBox;
    sprues_style_combo: TComboBox;
    webs_style_combo: TComboBox;
    webs_combo: TComboBox;
    splints_style_combo: TComboBox;
    splints_combo: TComboBox;
    clips_style_combo: TComboBox;
    clips_combo: TComboBox;
    flanges_style_combo: TComboBox;
    sole_plates_style_combo: TComboBox;
    soleplates_combo: TComboBox;
    dropper_id_combo: TComboBox;
    symbols_combo: TComboBox;
    end_flanges_checkbox: TCheckBox;
    omit_all_button: TButton;
    all_black_button: TButton;
    all_red_button: TButton;
    all_blue_button: TButton;
    combo_colour_defaults_button: TButton;
    timbout_kerf_style_combo: TComboBox;
    timbout_kerf_combo: TComboBox;
    sockets_kerf_style_combo: TComboBox;
    sockets_kerf_combo: TComboBox;
    brim_fence_checkbox: TCheckBox;
    sprue_kerf_checkbox: TCheckBox;
    grbl_file_dialog: TOpenDialog;
    _3d_colours_button: TButton;
    fw_widen_button: TButton;
    extra_switch_clearance_checkbox: TCheckBox;
    fret_button: TButton;
    timber_depth_button: TButton;
    soleplate_size_button: TButton;
    press_fit_plug_depths_button: TButton;
    rail_edges_groupbox: TGroupBox;
    Label34: TLabel;
    rail_head_checkbox: TCheckBox;
    fb_inner_checkbox: TCheckBox;
    fb_outer_checkbox: TCheckBox;
    clip_fit_radio: TRadioButton;
    omit_tangs_checkbox: TCheckBox;
    snap_fit_radio: TRadioButton;
    press_fit_radio: TRadioButton;
    chair_snap_fit_button: TButton;
    chair_clip_fit_button: TButton;
    Label23: TLabel;
    Label28: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label59: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label60: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    chair_press_fit_button: TButton;
    firm_label: TLabel;
    glue_label: TLabel;
    bash_label: TLabel;
    fit_label: TLabel;
    Label22: TLabel;
    plug_fit_trackbar: TTrackBar;
    Label70: TLabel;
    snap_fit_plug_depths_button: TButton;
    clip_fit_plug_depths_button: TButton;
    extend_plug_button: TButton;
    Label71: TLabel;
    control_settings_button: TButton;
    kerf_plus_undercut_checkbox: TCheckBox;
    Label41: TLabel;
    Label45: TLabel;
    Label21: TLabel;
    chair_adjust_edit: TEdit;
    xing_flangeway_tweak_edit: TEdit;
    check_flangeway_tweak_edit: TEdit;
    Label72: TLabel;
    raft_match_brick_colour_checkbox: TCheckBox;
    Label73: TLabel;
    switch_drive_checkbox: TCheckBox;
    end_flaps_checkbox: TCheckBox;
    export_tabsheet: TTabSheet;
    options_panel: TPanel;
    Label61: TLabel;
    all_option_radio: TRadioButton;
    group_option_radio: TRadioButton;
    marker_colour_panel: TPanel;
    brick_option_radio: TRadioButton;
    brick_label_text_checkbox: TCheckBox;
    zoom_brick_button: TButton;
    function_groupbox: TGroupBox;
    track_radio: TRadioButton;
    filing_jig_radio: TRadioButton;
    tweezer_tips_radio: TRadioButton;
    bending_jig_radio: TRadioButton;
    export_groupbox: TGroupBox;
    Label37: TLabel;
    Shape3: TShape;
    Label46: TLabel;
    _2d_radiobutton: TRadioButton;
    emf_checkbox: TCheckBox;
    _3d_resin_radiobutton: TRadioButton;
    _3d_cad_radiobutton: TRadioButton;
    resin_shrinkage_button: TButton;
    _3d_fdm_radiobutton: TRadioButton;
    file_type_groupbox: TGroupBox;
    dxf_radio: TRadioButton;
    stl_radio: TRadioButton;
    dxf_stl_both_radio: TRadioButton;
    fdm_shrinkage_button: TButton;
    heated_bed_checkbox: TCheckBox;
    custom_tabsheet: TTabSheet;
    Label44: TLabel;
    Shape2: TShape;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label43: TLabel;
    x_shift_edit: TEdit;
    y_shift_edit: TEdit;
    z_shift_edit: TEdit;
    z_datum_underside_checkbox: TCheckBox;
    stl_repair_button: TButton;
    x_scale_edit: TEdit;
    y_scale_edit: TEdit;
    z_scale_edit: TEdit;
    grbl_button: TButton;
    minibo_button: TButton;
    minibo_backlash_button: TButton;
    fill_below_key_checkbox: TCheckBox;
    Label58: TLabel;
    save_custom_button: TButton;
    load_custom_button: TButton;
    rebuild_now_button: TButton;
    units_panel: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    mm_radio_button: TRadioButton;
    inches_radio_button: TRadioButton;
    limits_checkbox: TCheckBox;
    scaled_checkbox: TCheckBox;
    rotate_stl_by_button: TButton;
    quick_groupbox: TGroupBox;
    Label19: TLabel;
    timbers_fdm_bullet_shape: TShape;
    chairs_bullet_shape: TShape;
    reset_both_bullet_shape: TShape;
    timbers_only_fdm_button: TButton;
    chairs_only_button: TButton;
    reset_both_button: TButton;
    show_settings_button: TButton;
    timbers_laser_bullet_shape: TShape;
    timbers_only_laser_button: TButton;
    hide_settings_button: TButton;
    fdm_filament_button: TButton;
    filament_checkbox: TCheckBox;
    exp_panel: TPanel;
    Label53: TLabel;
    Label27: TLabel;
    club_button: TButton;
    kerfs_only_checkbox: TCheckBox;
    unchaired_kerf_checkbox: TCheckBox;
    alignment_plates_radio: TRadioButton;
    plate_thickness_button: TButton;
    Label42: TLabel;
    plates_settings_button: TButton;
    Shape7: TShape;
    change_to_press_fit_button: TButton;
    dropper_ridge_checkbox: TCheckBox;
    flexi_checkbox: TCheckBox;
    GroupBox1: TGroupBox;
    flexi_1_radio: TRadioButton;
    flexi_2_radio: TRadioButton;
    flexi_3_radio: TRadioButton;
    flexi_random_radio: TRadioButton;
    dropper_ridge_button: TButton;
    nibs_checkbox: TCheckBox;
    blind_sockets_checkbox: TCheckBox;
    drive_ribs_button: TButton;
    snib_space_checkbox: TCheckBox;
    nibs_button: TButton;
    socket_indent_button: TButton;
    indented_socket_checkbox: TCheckBox;
    omit_flanges_conflict_checkbox: TCheckBox;
    mod_timbers_for_scale_checkbox: TCheckBox;
    Label74: TLabel;
    mod_depths_edit: TEdit;
    increase_plug_size_checkbox: TCheckBox;
    rail_section_button: TButton;
    Label75: TLabel;
    rail_label: TLabel;
    Label77: TLabel;
    Label76: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    assemblers_checkbox: TCheckBox;
    procedure ok_panelClick(Sender: TObject);
    procedure help_buttonClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure colour_panelClick(Sender: TObject);
    procedure cancel_panelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rails_comboChange(Sender: TObject);
    procedure rails_comboDropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure scaled_checkboxClick(Sender: TObject);
    procedure _2d_radiobuttonClick(Sender: TObject);
    procedure _3d_colours_buttonClick(Sender: TObject);
    procedure fill_below_key_checkboxClick(Sender: TObject);
    procedure stl_repair_buttonClick(Sender: TObject);
    procedure timbers_only_fdm_buttonClick(Sender: TObject);
    procedure chairs_only_buttonClick(Sender: TObject);
    procedure chair_press_fit_buttonClick(Sender: TObject);
    procedure set_custom_rail_buttonClick(Sender: TObject);
    procedure load_custom_buttonClick(Sender: TObject);
    procedure save_custom_buttonClick(Sender: TObject);
    procedure timber_depth_buttonClick(Sender: TObject);
    procedure fret_buttonClick(Sender: TObject);
    procedure omit_all_buttonClick(Sender: TObject);
    procedure all_black_buttonClick(Sender: TObject);
    procedure all_red_buttonClick(Sender: TObject);
    procedure all_blue_buttonClick(Sender: TObject);
    procedure combo_colour_defaults_buttonClick(Sender: TObject);
    procedure rails_comboContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure kerf_buttonClick(Sender: TObject);
    procedure supports_buttonClick(Sender: TObject);
    procedure grbl_buttonClick(Sender: TObject);
    procedure marker_colour_panelClick(Sender: TObject);
    procedure clips_buttonClick(Sender: TObject);
    procedure rebuild_now_buttonClick(Sender: TObject);
    procedure minibo_buttonClick(Sender: TObject);
    procedure minibo_backlash_buttonClick(Sender: TObject);
    procedure _3d_resin_radiobuttonClick(Sender: TObject);
    procedure _3d_cad_radiobuttonClick(Sender: TObject);
    procedure _3d_fdm_radiobuttonClick(Sender: TObject);
    procedure splints_buttonClick(Sender: TObject);
    procedure zoom_brick_buttonClick(Sender: TObject);
    procedure rotate_stl_by_buttonClick(Sender: TObject);
    procedure webs_sprues_buttonClick(Sender: TObject);
    procedure soleplate_size_buttonClick(Sender: TObject);
    procedure club_buttonClick(Sender: TObject);
    procedure loose_jaws_buttonClick(Sender: TObject);
    procedure rafts_buttonClick(Sender: TObject);
    procedure snibs_buttonClick(Sender: TObject);
    procedure reset_both_buttonClick(Sender: TObject);
    procedure edit_preview_buttonClick(Sender: TObject);
    procedure fw_widen_buttonClick(Sender: TObject);
    procedure plug_fit_trackbarChange(Sender: TObject);
    procedure normals_buttonClick(Sender: TObject);
    procedure press_fit_plug_depths_buttonClick(Sender: TObject);
    procedure filing_jig_radioMouseUp(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tweezer_tips_radioMouseUp(Sender: TObject;   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure chair_snap_fit_buttonClick(Sender: TObject);
    procedure chair_clip_fit_buttonClick(Sender: TObject);
    procedure snap_fit_plug_depths_buttonClick(Sender: TObject);
    procedure clip_fit_plug_depths_buttonClick(Sender: TObject);
    procedure extend_plug_buttonClick(Sender: TObject);
    procedure control_settings_buttonClick(Sender: TObject);
    procedure resin_shrinkage_buttonClick(Sender: TObject);
    procedure fdm_shrinkage_buttonClick(Sender: TObject);
    procedure fdm_filament_buttonClick(Sender: TObject);
    procedure heated_bed_checkboxClick(Sender: TObject);
    procedure filament_checkboxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure show_settings_buttonClick(Sender: TObject);
    procedure timbers_only_laser_buttonClick(Sender: TObject);
    procedure hide_settings_buttonClick(Sender: TObject);
    procedure plate_thickness_buttonClick(Sender: TObject);
    procedure plates_settings_buttonClick(Sender: TObject);
    procedure change_to_press_fit_buttonClick(Sender: TObject);
    procedure dropper_ridge_buttonClick(Sender: TObject);
    procedure drive_ribs_buttonClick(Sender: TObject);
    procedure nibs_buttonClick(Sender: TObject);
    procedure socket_indent_buttonClick(Sender: TObject);
    procedure rail_section_buttonClick(Sender: TObject);
    procedure emgs_75_rail_radiobuttonClick(Sender: TObject);
    procedure rail_labelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dxf_form: Tdxf_form;

  //--------------------------

type

  Tsocket_corners=array[0..27] of Tpex;       // socket and chamfer corners       and undercut corners 8..11  241b    and flap ends 241c

  Tsocket_object=class(TPersistent)    // 232a
    public
      socket_corners:Tsocket_corners;
      chair_id:integer;                 // 237a
      timber_id_str:string;             // 238a
    end;//class


  T3d_face=record     // 227a   for STL blocks

     x1:extended;
     y1:extended;
     z1:extended;

     x2:extended;
     y2:extended;
     z2:extended;

     x3:extended;
     y3:extended;
     z3:extended;

     x4:extended;
     y4:extended;
     z4:extended;

  end;//record

  T3d_face_object=class(TPersistent)

    public

      _3d_face:T3d_face;    // 4 vertices

    end;//class

  Trail_section_data_mm=record

                           // rail section in model mm...

                        rail_depth_mm:extended;

                        rail_head_width_mm:extended;

                        rail_foot_width_mm:extended;


                        rail_corner_rad_mm:extended;    // top corner rad on rail
                        rail_head_depth_mm:extended;    // from rail top down to ...
                        rail_web_top_mm:extended;       // from rail top to intersection fish angle on centre-line   1:2.75
                        rail_web_bottom_mm:extended;    // from rail top to intersection fish angle on centre-line   1:2.75

                        rail_foot_depth_mm:extended;    // up from bottom

                        rail_foot_height_below_head_mm:extended;  // foot thickness at gauge (vertically below head if foot width different from head width)

                        rail_web_thick_mm:extended;

                        rail_fish_angle:extended;    // 1:n

                        rail_web_face_top_from_rail_bot_mm:extended;         // used for face of key and grip ...
                        rail_web_face_bottom_from_rail_bot_mm:extended;

                      end;

    //--------------------------

var
  rail_section_data_mm:Trail_section_data_mm;  // 223a

  chairing_in_dxf:boolean=False;   // 237c...

  seat_thick:extended=1.75;         // 1.75 inches default below rail  235a

  timber_thick:extended=10.08;      // 243b inches default timber thickness = 3.36mm at 4mm/ft = 28*0.12 layers, 21*0.16 layers
                                    // was 9.72 inches default timber thickness (3.24mm at 4mm/ft   27 * 0.12 layers) 234e        was 9" / 3.0mm

  soleplate_thick:extended=0.48;    // prototype 1/2" thick soleplate  = 0.16mm at 4mm/ft ( 1 x 0.16mm layer)   = 0.28mm at 7mm/ft
  soleplate_width:extended=9;       // 9" wide soleplate     236b
  soleplate_rib:extended=3;         // 3" end rib on soleplate (prototype varies)  236b

  switch_slider_rib_width_mm:extended=1.2;      //  3.6";         // 3.6" width of switch drive slider rib            1.20mm at 4mm/ft, same for all scales
  switch_slider_rib_top_depth:extended=1.44;    // 1.44" down to top of switch drive slider rib     0.48mm at 4mm/ft
  switch_slider_rib_mid_depth:extended=2.88;    // 2.88" down to top of angled part                 0.96mm at 4mm/ft
  switch_slider_rib_bottom_depth:extended=5.76; // 5.76" down to bottom of switch drive slider rib  1.92mm at 4mm/ft

  sprue_thick:extended=5.76;     //  default sprue thickness  (1.92mm at 4mm/ft   16 * 0.12 layers) 234e
  sprue_length:extended=18;      //  default sprue length
  sprue_width:extended=4;        //  default sprue width
  sprue_runner_width:extended=8; //  default sprue runner 235a

  web_length:extended=18;        //  default web length (each side from timber edge) default 18"
  web_width:extended=12;         //  default web width 12"
  web_width_flexi:extended=8;    //  default web width on flexi-track 8"  241f

  web_integrity_overlap:extended=0.25;     // default overlap 1/4" (0.08mm at 4mm/ft)   234c needed to avoid slicing errors on sharply curved track
  flange_integrity_overlap:extended=0.25;  // default overlap 1/4" (0.08mm at 4mm/ft)   234c needed to avoid slicing errors on sharply curved track

  side_flange_width_mm:extended=1.0;  //3;   // default 3 inches at 4mm/ft, 244d same for all acales

  end_flange_width:extended=5;    // default 5 inches
  flange_offset:extended=0;
  flange_depth:extended=2.88;     // default inches  (0.96mm at 4mm/ft   8 * 0.12 layers,  6 * 0.16 layers) 234e

  dropper_ridge_spacing_top_mm:extended=0.4;    // 241f
  dropper_ridge_spacing_bottom_mm:extended=0.6; // 241f

  dropper_ridge_height:extended=2.16;        // 244d   2.16" = 0.72mm in 4mm/ft scale = 6 layers at 0.12mm
    //---------------

    // brick connector clips ...

  clip_shaft_width:extended=13.5;   // default 13.5" wide north-south (4.5mm at 4mm/ft)
  clip_top_width:extended=30;       // default 30" wide north-south (10mm at 4mm/ft)

  clip_top_length:extended=4;       // default 4" long west-east (1.33mm at 4mm/ft)
  clip_top_corner_mm:extended=0.08; // default 0.08 mm corner chamfer

  clip_arms_width:extended=6;       // default 6" wide north-south (2mm at 4mm/ft)

  clip_outers_width:extended=13;    // default 13" wide north-south (4.33mm at 4mm/ft)
  clip_outers_length:extended=4;    // default 4" long east-west  (1.33mm at 4mm/ft)

  clip_ends_clear:extended=0;       // default zero north-south
  clip_sides_clear:extended=0.15;   // default 0.15" east-west both sides (0.05mm at 4mm/ft)

  clip_hole_mm:extended=1.0;        // mm square hole

  clip_depth_mm:extended=1.8;         // mm overall clip thickness          (15 * 0.12 layers) 234e
  clip_foot_depth_mm:extended=0.36;   // undersize for no elephant's foot   (3 * 0.12 layers) 234e
  clip_foot_offset_mm:extended=0.3;   // elephant's foot adjustment

    //--------------

  splint_depth:extended=2.88;          // default inches  (0.96mm at 4mm/ft   8 * 0.12 layers) 234e
  splint_width:extended=9;             // default 9 inches  (3mm at 4mm/ft)

  slab_depth:extended=2.88;     // default inches  (0.96mm at 4mm/ft   8 * 0.12 layers) 234e

  label_tab_width:extended=15;         // default 15 inches  was 9" (character dims scaled from 9")  234a
  label_char_thickness:extended=1.8;        // default 1.8" (0.6mm at 4mm/ft     5 * 0.12 layers) 234e


  plugsock_length_mod:extended=0;    // over-ride default size
  plugsock_width_mod:extended=0;



  socket_chamfer:extended=0.15;         // inches wide rebate around top of sockets (0.05mm at 4mm/ft) 234e        was 0.25"
  socket_chamfer_depth:extended=0.36;   // 0.36" depth of top rebate   (0.12mm at 4mm/ft   1 * 0.12 layers) 234e   was 0.72"

  socket_depth:extended=8.64;       // inches   8.41/64" for blind sockets in FDM    (2.88mm at 4mm/ft   24 * 0.12 layers) 234e


      // 241b  sides and ends for snap-fit sockets ...

  snap_socket_fit_sides_sl:extended=0.06;       // mm snap-fit chair plug/socket side clearance on sleepers
  snap_socket_fit_sides_timb:extended=0.05;     // mm snap-fit chair plug/socket side clearance on timbers

  snap_socket_fit_ends:extended=0.04;           // mm snap-fit chair plug/socket end clearance on timbers

  snap_socket_undercut:extended=7/16;     // 7/16 inch side undercut in scocket for snap-fit
  snap_undercut_depth:extended=1.44;      // 1.44" = 0.48mm = 4 * 0.12 layers  (3 layers below top rebate)
  snap_clearcut_depth:extended=6;         // 6"  depth to socket clearcut return

      // 241b  sides and ends for clip-fit sockets ...

  clip_socket_fit_sides_sl:extended=0.06;   // 241c was 0.03    // mm clip-fit chair plug/socket side clearance on sleepers
  clip_socket_fit_sides_timb:extended=0.05; // 241c was 0.03    // mm clip-fit chair plug/socket side clearance on timbers

  clip_socket_fit_ends:extended=0.01;       // was 0.03;       // was 0.04

  clip_socket_undercut:extended=7/16;     // 7/16 inch side undercut in scocket for clip-fit
  clip_undercut_depth:extended=1.44;      // 1.44" = 0.48mm = 4 * 0.12 layers  (3 layers below top rebate)   4mm/ft
  clip_clearcut_depth:extended=5.5;       // 5.5"  depth to socket clearcut return

  clip_socket_flap_top_depth:extended=2.52; // 7 layers  0.84mm     2.88;       // 2.88" = 0.96mm = 8 * 0.12 layers  241c       4mm/ft
  clip_socket_flap_top_length:extended=3.6; // 1.2mm           2.4;       // = 0.8mm 241c    flap 0.8mm thick   2 * 0.4mm walls    4mm/ft

  clip_socket_flap_jut_length:extended=1.1;   // 0.37mm   1 wall 0.4mm     1.5;       // = 0.5mm 241c                                 4mm/ft
  clip_socket_flap_rear_length:extended=0.1;  // 0.03mm                    0.9;      // = 0.3mm 241c    flap 0.8mm thick   2 * 0.4mm walls    4mm/ft

  clip_socket_flap_clear_width:extended=1.5;  // 0.5mm clear each side     0.75;     // = 0.25mm 241c   flap 0.25mm clear of sides   4mm/ft

  clip_tang_end_space:extended=5/16;  // 5/16" 244d  end space between tang base and tang housing

      // 241b sides and ends for press-fit sockets ...

  press_socket_fit_sides_sl:extended=0.05;       // mm chair plug/socket clearance on sleepers 236d
  press_socket_fit_sides_timb:extended=0.04;     // mm chair plug/socket clearance on timbers  236d

      // negative interference fit ...

  press_short_socket_fit_ends:extended=-0.03;      // mm
  press_socket_fit_ends:extended=-0.02;            // mm
  press_long_socket_fit_ends:extended=-0.01;       // mm
  press_very_long_socket_fit_ends:extended=-0.01;  // mm

  socket_indent:extended=1/3;  // inches  1/3" for indented ends of socket


  snap_plug_overcut:extended=3/8;            // 3/8  inch side overcut on plug for snap-fit  (jut width)
  snap_plug_overcut_depth:extended=2.5;      // 2.1/2" snap-fit depth to plug overcut        (jut width)


  press_plug_taper_depth:extended=2;         // inches   2" of full size
  press_plug_inset_depth:extended=3.5;       // inches   1.5" of taper, leaving 4.25" of bottom inset depth
  press_plug_total_depth:extended=7.75;      // inches (bottom of full section)
  press_plug_extended_depth:extended=8.375;  // inches to top of pyramid (chamfered overhang for printing)     0.265" bottom clearance in blind sockets

  snap_plug_taper_depth:extended=2;         // inches   2" of full size
  snap_plug_inset_depth:extended=3.5;       // inches   1.5" of taper, leaving 4.25" of bottom inset depth
  snap_plug_total_depth:extended=7.75;      // inches (bottom of full section)
  snap_plug_extended_depth:extended=8.375;  // inches to top of pyramid (chamfered overhang for printing)     0.265" bottom clearance in blind sockets

  clip_plug_taper_depth:extended=2;         // inches   2" of full size
  clip_plug_inset_depth:extended=3.5;       // inches   1.5" of taper, leaving 4.25" of bottom inset depth
  clip_plug_total_depth:extended=7.75;      // inches (bottom of full section)
  clip_plug_extended_depth:extended=8.375;  // inches to top of pyramid (chamfered overhang for printing)     0.265" bottom clearance in blind sockets


  clip_tang_overcut:extended=1/2;             // 1/2 inch overcut on tang
  clip_tang_roof_front_depth:extended=1+1/4;  // inches   1.1/4"     angled roof for 3D printing   // 241b ...
  clip_tang_roof_back_depth:extended=2;       // inches   2"

  clip_tang_floor_depth:extended=6;           // inches   6"

  clip_tang_default_depth:extended=2.4;       // for restoring after extending the plug

  clip_tang_overcut_depth:extended=2.4;       // 2.4" clip-fit depth to tang overcut = 0.8mm   for socket undercut at 1.44" = 0.48mm  = 4 x 0.12mm layers in Cura


  press_plug_inset_clear_upper:extended=0.25;   // inches   1/4" side inset clearance below taper (all round)
  press_plug_inset_clear_bottom:extended=7/16;  // inches   7/16" side inset clearance at bottom (all round)   1/2" max for default 1" plug end width   237a was 0.5

  snap_plug_inset_clear_upper:extended=0.25;   // inches   1/4" side inset clearance below taper (all round)
  snap_plug_inset_clear_bottom:extended=7/16;  // inches   7/16" side inset clearance at bottom (all round)   1/2" max for default 1" plug end width   237a was 0.5

  clip_plug_inset_clear_upper:extended=0.25;   // inches   1/4" side inset clearance below taper (all round)
  clip_plug_inset_clear_bottom:extended=7/16;  // inches   7/16" side inset clearance at bottom (all round)   1/2" max for default 1" plug end width   237a was 0.5

  locator_plug_depth:extended=36;   // inches   for locating timbers on laser-cut trackbed

  plug_corner_clear_fdm:extended=0.75;  // 236d 3/4 inch  0.25mm at 4mm/ft    was 1.125 // inches   for 3D-printed / laser-cut sockets  0.375mm at 4mm/ft
  plug_corner_clear_cnc:extended=2.25;  // inches   for milled sockets  0.75mm at 4mm/ft

  plug_end_width_fdm:extended=1.5;  // inches between relieved corners   for 3D-printed / laser-cut sockets  0.5mm at 4mm/ft   // 234e
  plug_end_width_cnc:extended=1.0;  // inches between relieved corners   for milled sockets  0.33mm at 4mm/ft                  // 234e

  plug_fit_sides:extended=0;  // mm
  plug_fit_ends:extended=0;   // mm

  pyramid_height_low:extended=3.0;      // mm  chair support pyramid  - low for electronics snips (up to 4mm/ft scale)
  pyramid_height_high:extended=7.0;     // mm  chair support pyramid  - high for workshop side cutters (over 4mm/ft scale)
  
  pyramid_taper:extended=1.25;      // inches all round at base    237e   was 0.75"

  pyramid_top_end_inset:extended=3;   // 241b 3" inches pyramid end from plug end

  pyramid_top_side_inset:extended=2;  // 241b 2" inches pyramid side from centre

  shrink_gauge_spacing:extended=3;    // 242a 3" spacing between chairs on raft

    // 236d loose outer jaw...

  pyramid_height_pin:extended=1.0;      // mm  loose-jaw support pyramid   236d    no cutter needed - break off

  pin_slot_halfwide:extended=1.8;       // inches  for loose-jaw    slot is 3.6 inches x 1.8 inches
  pin_slot_length:extended=1.8;         // inches  for loose-jaw

  loose_pin_clear_sides:extended=0.04;  // mm
  loose_pin_clear_front:extended=0.04;  // mm    inner  (against rail)
  loose_pin_clear_back:extended=0.04;   // mm    outer

  loose_pin_bottom_taper_ins:extended=0.09;   // inches    244d


  key_thicken:extended=0.05;  // mm 244e   +ve to tighten key against rail 236d

  loose_pin_depth_clear:extended=1/8;  // inches  pin above plug bottom

  loose_pin_bottom_chamfer_clear:extended=1.75;  // inches  236d

  slot_angle:extended=5*Pi/180;     // 5 degree slot angle (L1 chairs)  236d


  raft_thick:extended=0.5;      // mm  total=1mm thick
  raft_flange:extended=0.25;    // mm overhang

  raft_label_char_thickness:extended=1.0;   // mm text characters

  alignment_plate_thick_mm:extended=3.0;    // mm plate thickness   241e


  filament_dia_mm:extended=1.75;  // 241c
  filament_adjust:extended=0;

  fw_correction_xing:extended=0;   // total flangeway mods
  fw_correction_check:extended=0;

  fw_tweak_xing:extended=0;        // flangeway tweaks after test printing
  fw_tweak_check:extended=0;

  fw_mod_for_gw:extended=0;

  cutter_kerf_mm:extended=0.2;
  kerf_extra_undercut_mm:extended=0;

    // nibs and snibs 237b ...

  nib_width:extended=0.6;         // mm...
  nib_length:extended=0.6;

  tsn_snib_space_mm:extended=0.3;
  tsf_snib_space_mm:extended=0.3;
  msn_snib_space_mm:extended=0.3;
  msf_snib_space_mm:extended=0.3;

  snib1_extent:extended=6;        // inches
  snib2_extent_t:extended=15.5;   // ts side square-on
  snib2_extent_p:extended=10;     // plain track and  ms side square-on
  snib2_extent_e:extended=12.5;   // equalized timbers

  nailx_spacing:extended=1.0;   // mm  for bed of nails support
  naily_spacing:extended=1.0;
  nails_height:extended=2.0;    // default nail 2mm tall
  nails_toprad:extended=0.175;  // default top 0.35mm dia
  nails_botrad:extended=0.275;  // default bottom 0.55mm dia

  bl_x:extended=0.3;   // MINIBO backlash mm on X
  bl_y:extended=0.3;   // MINIBO backlash mm on Y
  bl_z:extended=0.4;   // MINIBO backlash mm on Z

    // default custom rail section is BS-95R   inches full-size ...

  custom_section_name_str:string='my special rail';

  custom_rail_depth:extended=5.71875;

  custom_rail_head_width:extended=2.75;

  custom_rail_corner_rad:extended=0.5;

  custom_rail_foot_width:extended=2.75;

  custom_rail_fish_angle:extended=2.75;

  custom_rail_web_top:extended=1.9375;       //  from rail top to intersection fish angle on rail centre-line
  custom_rail_web_bottom:extended=1.3125;    //  from rail bottom to intersection fish angle on rail centre-line

  custom_rail_web_thick:extended=0.75;

  //----

  rail_section_option:integer=0;

  fdm_hot_shrinkage_x:extended=1.002;  // Neptune 2S    was 1.0028 BIBO
  fdm_hot_shrinkage_y:extended=1.002;
  fdm_hot_shrinkage_z:extended=1.0;

  fdm_cold_shrinkage_x:extended=0.993;
  fdm_cold_shrinkage_y:extended=0.995;
  fdm_cold_shrinkage_z:extended=1.0;

  resin_shrinkage_x:extended=1.0075;  // 0.75%  241b  was 1.0025;
  resin_shrinkage_y:extended=1.0075;  // 0.75%  241b  was 1.0025;
  resin_shrinkage_z:extended=1.0075;  // 0.75%  241b  was 1.0025;

  cad_shrinkage_x:extended=1.0;
  cad_shrinkage_y:extended=1.0;
  cad_shrinkage_z:extended=1.0;

  stl_rot_x:extended=0;   // 234d STL output rotation ...
  stl_rot_y:extended=0;
  stl_rot_k:extended=0;

  chair_web_adjustment:extended=0;

  _3d:boolean=False;        // 2-D init.

  dxf_showing_settings:boolean=False;  // 241c

  mod_timbers_for_scale_factor:extended=1.0;  //0.653;
  mod_depths_adjustment:extended=1.0;

  procedure init_rail_section;

  procedure export_templates_dxf;

  function dxf_3dface_pex(p1:Tpex; z1:extended; p2:Tpex; z2:extended; p3:Tpex; z3:extended; p4:Tpex; z4:extended; layer,blanked_edges:integer):string;

  function dxf_3dface(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4:extended; layer,blanked_edges:integer):string;    // DXF make up a four-cornered 3-D face.

  function get_next_timber_along(str:string):string;  // 244a

//__________________________________________________________________________________________

implementation

{$BOOLEVAL ON}

{$R *.lfm}

uses
  ShellAPI, Contnrs, Math, xml_unit,
  control_room, help_sheet, chat_unit, colour_unit, math_unit, math2_unit, alert_unit, chairs_unit, entry_sheet,
  bgkeeps_unit, keep_select, bgnd_unit, preview_unit, print_unit, print_settings_unit, jigs_unit,
  custom_3d_unit, export_preview_unit;

var
  stl_file:TextFile;     // 227a

  stl_block_list:TStringlist;    // 227a

  creating_block_str:string='';  // 227a

  block_insert_scaling:extended=1.0;      //  blocks are created at inscale from the control template - no scaling need on insertion

  user_save_path_dxf:string='';
  user_save_path_stl:string='';

  layer_str:array[0..35] of string;       //  36 layers 236d
  line_type_str:array[0..5] of string;

  user_save_file_name_dxf:string='';
  user_save_file_name_stl:string='';

  xmax:extended=1000;     // default drawing limits (reset to screen size if box ticked, otherwise ignored)
  ymax:extended=1000;
  xmin:extended=-25;
  ymin:extended=-25;

  debug_code:integer=0;

  floating_warned:boolean=False;  // 235a

  x_shift,y_shift,z_shift:extended;
  x_scale,y_scale,z_scale:extended;

  x_shrinkage_factor:extended=1.0;
  y_shrinkage_factor:extended=1.0;
  z_shrinkage_factor:extended=1.0;

  rail_foot_z:extended=0;

  rail_corner_bot1_z:extended=0;
  rail_corner_offset1:extended=0;

  rail_corner_bot2_z:extended=0;
  rail_corner_offset2:extended=0;

  rail_corner_bot3_z:extended=0;
  rail_corner_offset3:extended=0;

  rc:extended;

  rail_head_bot_z:extended=0;
  rail_foot_top_z:extended=0;

  rail_web_top_z:extended=0;
  rail_web_bot_z:extended=0;

  rail_web_thickness:extended=0;

  zkeybot:extended=0;     // 233d used for key and filler below key

  timb_top_z:extended=0;
  timb_bot_z:extended=0;
  sprue_top_z:extended=0;
  out_flange_top_z:extended=0;

  beefed_up_chairs:boolean=False;
  fill_below_key:boolean=False;

  stl:boolean=False;  // 227a

  outer_beefing:extended=0;  // additional depth behind ribs outer jaw
  inner_beefing:extended=0;  // additional depth behind ribs inner jaw

  flange_extra:extended=0.5;  // inches +ve increase flange clearance on inner chair jaws



       // DXF colour codes ...

  railsides_3d_colour:integer=141;  // blue steel
  chair_3d_colour:integer=31;       // light brown
  timber_3d_colour:integer=33;      // dark brown
  key_3d_colour:integer=64;         // wood
  bolthead_3d_colour:integer=9;     // silver
  plug_3d_colour:integer=254;       // light grey
  support_3d_colour:integer=9;      // silver

  ckms_fl:extended=0;   // 237b ...
  ckms_fk:extended=0;

  ckts_fl:extended=0;
  ckts_fk:extended=0;

  template_index:integer=0;
  tb_id:integer=0;
  tb_str:string='';
  timber_str:string='';

  dxf_chair:integer=0;
  chi:integer=0;             // 238a

  half_fw_tweaked:extended=0;

  number_slide_chairs:integer=0;
  number_block_slide_chairs:integer=0;
  number_block_heel_chairs:integer=0;

  preview_3d_app_str:string='3D-Tool-Free.exe';
  preview_2d_app_str:string='inkscape.exe';

  mesh_fix_msg_pref:boolean=False;    // 241b

  doing_tools:boolean=False;

  doing_entities:boolean=False;

  inserting_loose_dxf:boolean=False;    // 244e  for loose jaws

  start_tick_count:integer=0;
  tick_count:integer=0;

  procedure _3d_options_click(fix:boolean);forward;

  function dxf_background_keeps(var dxf_file:TextFile):extended;forward;  //  all the background keeps.     // 234e return 3D z depth for background shapes

  procedure dxf_shapes(shapes_z1:extended; var dxf_file:TextFile);forward;    // do any background shapes.   // 234e z depth added

  function colour(layer:integer):string;forward;    // get his requested colour.

  procedure do_export_templates_dxf;forward;  // 227a now in wrapper for kludge FB

//______________________________________________________________________________

function make_stl_dim(axis:integer; shrinkage_factor,scaleby,shift,d:extended):string;   // generate floating point string.
                                                                                         // input d in mm.
  // axis 0=ignore  1=x  2=y  3=z

var
  pz:extended;
  out_str:string;

  d_mod_level:extended;

begin
  if ABS(d)>50000      // 235a  kludge temp bug fix  catch uninitialised value   50 metres output limit
     then begin
            if floating_warned=False
               then begin
                      show_modal_message('invalid: one or more objects are floating'
                                         +#13+#13+'Most likely they are chairs which are no longer fully supported on a timber which has been shoved (crabbed or twisted significantly, perhaps as a waybeam).'
                                         +#13+#13+'If the chairs are not wanted, they should be switched off on the shove timbers or chairing dialogs.'
                                         +#13+#13+'In order to create a valid file, the floating objects have been moved to the grid origin.');
                      floating_warned:=True;
                    end;
            RESULT:='0';
            EXIT;
          end;

  if dxf_form.scaled_checkbox.Checked=True
     then pz:=out_factor*scaleby              // scale in accordance with current output size.
     else pz:=scaleby;

  if _3d=True
     then begin
            pz:=pz*shrinkage_factor;

            d_mod_level:=(timber_thick-soleplate_thick-1/32)*inscale;    // 1/32" below soleplate is the cut-off

            if axis=3          // Z
               then begin

                        // modify Z for plugs and timbers if wanted...

                      if (dxf_form.mod_timbers_for_scale_checkbox.Checked=True) and (dxf_form.z_datum_underside_checkbox.Checked=True)     // 244d
                      and (inserting_loose_dxf=False)  // 244e   loose jaws may be lower on raft
                      and ((d+shift)>0)
                      and ((scale<3.95) or (scale>4.05))
                         then begin
                                if d<(d_mod_level-shift)                                    // modify plug/timber depths for model scale
                                   then d:=((d+shift)*mod_timbers_for_scale_factor)-shift
                                   else d:=((d+shift)-d_mod_level+d_mod_level*mod_timbers_for_scale_factor)-shift;
                              end;
                    end;
          end;

  out_str:=FormatFloat('0.000',d*pz+shift);

  // STL format uses dot for decimal point regardless of regional settings..

  RESULT:=StringReplace(out_str,',','.',[]);
end;
//______________________________________________________________________________

procedure rotate_stl_vertex(var x,y:extended);     // 234d

var
  p:Tpex;

begin
  if stl_rot_k=0 then EXIT;  // nothing to do

  p.x:=x;
  p.y:=y;

  dotransform(stl_rot_k,stl_rot_x,stl_rot_y,p,p);

  x:=p.x;
  y:=p.y;
end;
//______________________________________________________________________________

procedure insert_stl_block(block_str:string; xblock,yblock,zblock,kblock:extended);  // 227a

var
  n,i:integer;
  s:string;

               /////////////////////////////////////////////////////////////////

               procedure calc_block(x,y,z:extended);

               var
                 xstl,ystl,zstl:extended;

               begin
                 xstl:=x*COS(kblock)-y*SIN(kblock)+xblock;
                 ystl:=x*SIN(kblock)+y*COS(kblock)+yblock;

                 rotate_stl_vertex(xstl,ystl);   // 234d

                 zstl:=z+zblock;

                 s:=s+' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,xstl)
                     +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,ystl)
                     +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,zstl);

               end;
               /////////////////////////////////////////////////////////////////


begin
  n:=stl_block_list.IndexOf(block_str);  // 227a
  if n<0 then EXIT;                      // ??? no block data to insert

  if TObjectList(stl_block_list.Objects[n]).Count<1 then EXIT;  // ??? no block data to insert

  for i:=0 to TObjectList(stl_block_list.Objects[n]).Count-1 do begin

    with T3d_face_object(TObjectList(stl_block_list.Objects[n]).Items[i])._3d_face do begin

      if (x3=x4) and (y3=y4) and (z3=z4)   // it's only 3 vertices, make triangle from 1,3,2 ...
         then begin
                s:='| facet normal 0 0 0'
                  +'| outer loop'
                  +'| vertex';

                calc_block(x1,y1,z1);
                s:=s+'| vertex';
                calc_block(x3,y3,z3);
                s:=s+'| vertex';
                calc_block(x2,y2,z2);

                s:=s+'| endloop'
                    +'| endfacet';

                Write(stl_file,insert_crlf_str(s));

              end
         else begin                        // make first triangle from 1,3,2 ...
                s:='| facet normal 0 0 0'
                  +'| outer loop'
                  +'| vertex';

                calc_block(x1,y1,z1);
                s:=s+'| vertex';
                calc_block(x3,y3,z3);
                s:=s+'| vertex';
                calc_block(x2,y2,z2);

                s:=s+'| endloop'
                    +'| endfacet';

                Write(stl_file,insert_crlf_str(s));

                s:='| facet normal 0 0 0'  // make second triangle from 1,4,3 ...
                  +'| outer loop'
                  +'| vertex';

                calc_block(x1,y1,z1);
                s:=s+'| vertex';
                calc_block(x4,y4,z4);
                s:=s+'| vertex';
                calc_block(x3,y3,z3);

                s:=s+'| endloop'
                    +'| endfacet';

                Write(stl_file,insert_crlf_str(s));

              end;

    end;//with face
  end;//next face
end;
//______________________________________________________________________________

procedure stl_3dface(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4:extended);   // 227a STL make 2 triangles from a four-cornered 3-D face.

var
  n,i:integer;
  s:string;

  stl_3d_face:T3d_face;

begin

  if creating_block_str<>''   // this data is defining a block
     then begin
            n:=stl_block_list.IndexOf(creating_block_str);  // 227a
            if n<0 then EXIT;                               // ???

              // add another 3D face to the block data ...

            stl_3d_face.x1:=x1;
            stl_3d_face.y1:=y1;
            stl_3d_face.z1:=z1;

            stl_3d_face.x2:=x2;
            stl_3d_face.y2:=y2;
            stl_3d_face.z2:=z2;

            stl_3d_face.x3:=x3;
            stl_3d_face.y3:=y3;
            stl_3d_face.z3:=z3;

            stl_3d_face.x4:=x4;
            stl_3d_face.y4:=y4;
            stl_3d_face.z4:=z4;

            i:=TObjectList(stl_block_list.Objects[n]).Add(T3d_face_object.Create);

            T3d_face_object(TObjectList(stl_block_list.Objects[n]).Items[i])._3d_face:=stl_3d_face;

          end
     else begin     // not block, 3D face ...

            if (x3=x4) and (y3=y4) and (z3=z4)   // it's only 3 vertices, make triangle from 1,3,2 ...
                 then begin
                        rotate_stl_vertex(x1,y1);   // 234d
                        rotate_stl_vertex(x2,y2);   // 234d
                        rotate_stl_vertex(x3,y3);   // 234d

                        s:='| facet normal 0 0 0'
                          +'| outer loop'
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y1)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z1)
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x3)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y3)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z3)
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x2)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y2)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z2)
                          +'| endloop'
                          +'| endfacet';

                        Write(stl_file,insert_crlf_str(s));

                      end
                 else begin
                        rotate_stl_vertex(x1,y1);   // 234d
                        rotate_stl_vertex(x2,y2);   // 234d
                        rotate_stl_vertex(x3,y3);   // 234d
                        rotate_stl_vertex(x4,y4);   // 234d

                           // make first triangle from 1,3,2 ...

                        s:='| facet normal 0 0 0'
                          +'| outer loop'
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y1)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z1)
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x3)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y3)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z3)
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x2)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y2)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z2)
                          +'| endloop'
                          +'| endfacet';

                        Write(stl_file,insert_crlf_str(s));

                          // make second triangle from 1,4,3 ...

                        s:='| facet normal 0 0 0'
                          +'| outer loop'
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y1)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z1)
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x4)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y4)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z4)
                          +'| vertex'
                          +' '+make_stl_dim(1,x_shrinkage_factor,x_scale,x_shift,x3)
                          +' '+make_stl_dim(2,y_shrinkage_factor,y_scale,y_shift,y3)
                          +' '+make_stl_dim(3,z_shrinkage_factor,z_scale,z_shift,z3)
                          +'| endloop'
                          +'| endfacet';

                        Write(stl_file,insert_crlf_str(s));

                      end;
          end;
end;
//______________________________________________________________________________

function make_code(n:integer):string;    // generate 3-character DXF group code with leading spaces.

begin
  RESULT:=space_lead(FormatFloat('000',n))+'|';
end;
//________________________________________________________________________________________

function make_dim(axis:integer; shrinkage_factor,scaleby,shift,d:extended):string;   // generate floating point string.
                                                                                     // input d in mm.

   // axis 0=ignore  1=x  2=y  3=z

var
  pz:extended;
  out_str:string; // 0.94.a

  d_mod_level:extended;

begin

  if ABS(d)>50000      // 235a  kludge temp bug fix  catch uninitialised value   50 metres output limit
     then begin
            if floating_warned=False
               then begin
                      show_modal_message('invalid: one or more objects are floating'
                                         +#13+#13+'Most likely they are chairs which are no longer fully supported on a timber which has been shoved (crabbed or twisted significantly, perhaps as a waybeam).'
                                         +#13+#13+'If the chairs are not wanted, they should be switched off using the chair heaving functions.'
                                         +#13+#13+'In order to create a valid file, the floating objects have been moved to the grid origin.');
                      floating_warned:=True;
                    end;
            RESULT:='0|';
            EXIT;
          end;

  if dxf_form.scaled_checkbox.Checked=True
     then pz:=out_factor*scaleby            // scale in accordance with current output size
     else pz:=scaleby;                      // scaled on the dialog

  if _3d=True
     then begin
            pz:=pz*shrinkage_factor;

            d_mod_level:=(timber_thick-soleplate_thick-1/32)*inscale;    // 1/32" below soleplate is the cut-off

            if axis=3          // 236d  printer bed thermal expansion compensation
               then begin

                        // modify Z for plugs and timbers if wanted...
                      
                      if (dxf_form.mod_timbers_for_scale_checkbox.Checked=True) and (dxf_form.z_datum_underside_checkbox.Checked=True)     // 244d
                      and (inserting_loose_dxf=False)  // 244e    loose jaws may be lower on raft
                      and ((d+shift)>0)
                      and ((scale<3.95) or (scale>4.05))
                      and (creating_block_str='')          // blocks mod when inserted, not when created
                         then begin
                                if d<(d_mod_level-shift)                                    // modify plug/timber depths for model scale
                                   then d:=((d+shift)*mod_timbers_for_scale_factor)-shift
                                   else d:=((d+shift)-d_mod_level+d_mod_level*mod_timbers_for_scale_factor)-shift;
                              end;

                    end;
          end;

  if creating_block_str<>'' then shift:=0;  // 227a no shift for definition of a block being created

  if dxf_form.inches_radio_button.Checked=True
     then out_str:=FormatFloat('0.000000',(d*pz+shift)/25.4)+'|'
     else out_str:=FormatFloat('0.0000',d*pz+shift)+'|';

  // DXF format uses dot for decimal point regardless of regional settings..

  RESULT:=StringReplace(out_str,',','.',[]);
end;
//___________________________________________________________________________________________

function make_factor(d:extended):string;    // generate floating point string.
                                            // input is a scaling factor
var
  out_str:string; // 0.94.a

begin
  out_str:=FormatFloat('0.000000',d)+'|';

  // DXF format uses dot for decimal point regardless of regional settings..

  RESULT:=StringReplace(out_str,',','.',[]);
end;
//___________________________________________________________________________________________

function make_angle(d:extended):string;    // generate floating point string.
                                           // input d in degrees
var
  out_str:string; // 0.94.a

begin
  out_str:=FormatFloat('0.0000',d)+'|';

  // DXF format uses dot for decimal point regardless of regional settings..

  RESULT:=StringReplace(out_str,',','.',[]);
end;
//___________________________________________________________________________________________

function dxf_3dface(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4:extended; layer,blanked_edges:integer):string;    // DXF make up a four-cornered 3-D face.

var
  s:string;

begin
  RESULT:='';      // default init.

  if (colour(layer)='0|') or (_3d=False) then EXIT;       // does he want this in the file ?

  if dxf_form.limits_checkbox.Checked=True     // only within x,y limits?
     then begin
            if (x1>xmax) or (x2>xmax) or (x3>xmax) or (x4>xmax) then EXIT;
            if (y1>ymax) or (y2>ymax) or (y3>ymax) or (y4>ymax) then EXIT;

            if (x1<xmin) or (x2<xmin) or (x3<xmin) or (x4<xmin) then EXIT;
            if (y1<ymin) or (y2<ymin) or (y3<ymin) or (y4<ymin) then EXIT;
          end;

  s:='  0|3DFACE|  8|'+layer_str[layer]
    +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
    +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y1)
    +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z1)

    +' 11|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x2)
    +' 21|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y2)
    +' 31|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z2)

    +' 12|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x3)
    +' 22|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y3)
    +' 32|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z3)

    +' 13|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x4)
    +' 23|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y4)
    +' 33|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z4);

  RESULT:=insert_crlf_str(s);

  if stl=True then stl_3dface(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4);  // 227a add 2 triangles to STL
end;
//______________________________________________________________________________

function dxf_3dface_pex(p1:Tpex; z1:extended; p2:Tpex; z2:extended; p3:Tpex; z3:extended; p4:Tpex; z4:extended; layer,blanked_edges:integer):string;

begin
  RESULT:=dxf_3dface(p1.x,p1.y,z1, p2.x,p2.y,z2, p3.x,p3.y,z3, p4.x,p4.y,z4, layer, blanked_edges);
end;
//______________________________________________________________________________

function dxf_line(x1,y1,z1,x2,y2,z2:extended; layer:integer):string;    // make up a line group

var
  s:string;

begin
  RESULT:='';      // default init.

  debug_code:=2;

  if dxf_form.limits_checkbox.Checked=True     // only within limits?
     then begin
            if (x1>xmax) or (x2>xmax) or (y1>ymax) or (y2>ymax) then EXIT;
            if (x1<xmin) or (x2<xmin) or (y1<ymin) or (y2<ymin) then EXIT;
          end;

  s:=  '  0|LINE|  8|'+layer_str[layer]
      +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
      +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y1);

  if _3d=True then s:=s

      +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z1);

  s:=s+' 11|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x2)
      +' 21|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y2);

  if _3d=True then s:=s

      +' 31|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z2);

  RESULT:=insert_crlf_str(s);
end;
//______________________________________________________________________________

function loose_jaw_pin_outer(shift_twist,CC_swap:boolean; angle,p0y,zplinth,pin_twist:extended):string;       // 236d

  // p0y on outer jaw face   y negative outwards     x zero on centre-line

  // angle for L1 chairs

var
  p:array[0..17] of Tpex;

  zplug,zbot,zlow,zlowest:extended;  // down from rail top

  shear_chamf,shear_bot:extended;

  s:string;

  n:integer;

  twistx,twisty:extended;    // 237c

  plug_extended_depth:extended;  // 241b

begin
  if dxf_form.clip_fit_radio.Checked=True                         // 241b
     then plug_extended_depth:=clip_plug_extended_depth
     else if dxf_form.snap_fit_radio.Checked=True
             then plug_extended_depth:=snap_plug_extended_depth
             else plug_extended_depth:=press_plug_extended_depth;

  s:='';

  zplug:=0-rail_section_data_mm.rail_depth_mm-seat_thick*inscale;

  zlow:=0-rail_section_data_mm.rail_depth_mm-(seat_thick+plug_extended_depth-loose_pin_depth_clear-loose_pin_bottom_chamfer_clear)*inscale;      // 236d  start of bottom chamfer

  zbot:=0-rail_section_data_mm.rail_depth_mm-(seat_thick+plug_extended_depth-loose_pin_depth_clear)*inscale;      // 236d  bottom of pin

  zlowest:=zbot-pyramid_height_pin;  // 236d  bottom of pin support pyramid

  shear_chamf:=ABS(zlow-zplug)*TAN(angle);
  shear_bot:=ABS(zbot-zplug)*TAN(angle);

    // p[0] and p[5] not used ...

  p[0].x:=0;
  p[0].y:=0;

  p[5].x:=0;
  p[5].y:=0;


      // top part through plinth ...

  p[6].x:=0-pin_slot_halfwide*inscale+loose_pin_clear_sides;  // 236d
  p[6].y:=p0y-pin_slot_length*inscale+loose_pin_clear_back;   // 236d

  p[7].x:=p[6].x;
  p[7].y:=p0y-loose_pin_clear_front;

  p[8].x:=pin_slot_halfwide*inscale-loose_pin_clear_sides;
  p[8].y:=p[7].y;

  p[9].x:=p[8].x;
  p[9].y:=p[6].y;

          // start of chamfered bottom ...

  p[1].x:=p[6].x+loose_pin_bottom_taper_ins*inscale;
  p[1].y:=p[6].y+shear_chamf+loose_pin_bottom_taper_ins*inscale;

  p[2].x:=p[7].x+loose_pin_bottom_taper_ins*inscale;
  p[2].y:=p[7].y+shear_chamf-loose_pin_bottom_taper_ins*inscale;

  p[3].x:=p[8].x-loose_pin_bottom_taper_ins*inscale;
  p[3].y:=p[8].y+shear_chamf-loose_pin_bottom_taper_ins*inscale;

  p[4].x:=p[9].x-loose_pin_bottom_taper_ins*inscale;
  p[4].y:=p[9].y+shear_chamf+loose_pin_bottom_taper_ins*inscale;


          // base of chamfered bottom and top of support for loose pin ...

  p[10].x:=p[6].x+0.1;
  p[10].y:=p[6].y+0.1+shear_bot;

  p[11].x:=p[10].x;
  p[11].y:=p[7].y-0.1+shear_bot;

  p[12].x:=p[8].x-0.1;
  p[12].y:=p[11].y;

  p[13].x:=p[12].x;
  p[13].y:=p[10].y;

          // bottom of support for loose pin...

  p[14].x:=p[6].x-0.2;
  p[14].y:=p[6].y-0.2+shear_bot;

  p[15].x:=p[14].x;
  p[15].y:=p[7].y+0.2+shear_bot;

  p[16].x:=p[8].x+0.2;
  p[16].y:=p[15].y;

  p[17].x:=p[16].x;
  p[17].y:=p[14].y;

  if CC_swap=True   // 237a
     then begin
            for n:=0 to 17 do p[n].y:=0-p[n].y;
          //end;

            if pin_twist<>0  // twist pin for check rail flares      237c
               then begin
                      twistx:=0;
                      twisty:=p[7].y;

                      for n:=0 to 17 do dotransform(pin_twist,twistx,twisty,p[n],p[n]);
                    end;
          end;

  if shift_twist=True   // adjust pin position for twisted jaw  239a
     then begin
            twistx:=p[7].y*TAN(pin_twist);
            twisty:=twistx*TAN(pin_twist);

            for n:=0 to 17 do begin
              p[n].x:=p[n].x-twistx;
              p[n].y:=p[n].y-twisty;
            end;//next

          end;


  debug_code:=123;

    // pin ...

  s:=s+dxf_3dface_pex( p[6],zplinth, p[7],zplinth, p[8],zplinth, p[9],zplinth, 21,0);   // upper surface of pin
  s:=s+dxf_3dface_pex( p[10],zbot,   p[11],zbot,   p[12],zbot,   p[13],zbot,   21,0);   // lower surface of pin

     // pin through plinth ...

  s:=s+dxf_3dface_pex( p[7],zplinth, p[8],zplinth, p[8],zplug,    p[7],zplug,    21,0);   // rear side of pin
  s:=s+dxf_3dface_pex( p[9],zplinth, p[8],zplinth, p[8],zplug,    p[9],zplug,    21,0);   // right side of pin
  s:=s+dxf_3dface_pex( p[9],zplinth, p[6],zplinth, p[6],zplug,    p[9],zplug,    21,0);   // front side of pin
  s:=s+dxf_3dface_pex( p[6],zplinth, p[7],zplinth, p[7],zplug,    p[6],zplug,    21,0);   // left side of pin

       // pin through plug ...

  s:=s+dxf_3dface_pex( p[7],zplug, p[8],zplug, p[3],zlow,    p[2],zlow,    21,0);   // rear side of pin
  s:=s+dxf_3dface_pex( p[9],zplug, p[8],zplug, p[3],zlow,    p[4],zlow,    21,0);   // right side of pin
  s:=s+dxf_3dface_pex( p[9],zplug, p[6],zplug, p[1],zlow,    p[4],zlow,    21,0);   // front side of pin
  s:=s+dxf_3dface_pex( p[6],zplug, p[7],zplug, p[2],zlow,    p[1],zlow,    21,0);   // left side of pin

      // bottom chamfer on pin ...

  s:=s+dxf_3dface_pex( p[11],zbot, p[12],zbot, p[3],zlow, p[2],zlow,  21,0);   // rear side bottom chamfer
  s:=s+dxf_3dface_pex( p[13],zbot, p[12],zbot, p[3],zlow, p[4],zlow,  21,0);   // right side bottom chamfer
  s:=s+dxf_3dface_pex( p[13],zbot, p[10],zbot, p[1],zlow, p[4],zlow,  21,0);   // front side bottom chamfer
  s:=s+dxf_3dface_pex( p[10],zbot, p[11],zbot, p[2],zlow, p[1],zlow,  21,0);   // left side bottom chamfer

     // support for pin ...

  if dxf_form.loose_jaw_pyramids_checkbox.Checked=True
     then begin
            s:=s+dxf_3dface_pex( p[10],zbot,    p[11],zbot,    p[12],zbot,    p[13],zbot,    35,0);   // upper surface of support
            s:=s+dxf_3dface_pex( p[14],zlowest, p[15],zlowest, p[16],zlowest, p[17],zlowest, 35,0);   // lower surface of support

            s:=s+dxf_3dface_pex( p[11],zbot, p[12],zbot, p[16],zlowest, p[15],zlowest, 35,0);   // rear side of support
            s:=s+dxf_3dface_pex( p[13],zbot, p[12],zbot, p[16],zlowest, p[17],zlowest, 35,0);   // right side of support
            s:=s+dxf_3dface_pex( p[13],zbot, p[10],zbot, p[14],zlowest, p[17],zlowest, 35,0);   // front side of support
            s:=s+dxf_3dface_pex( p[10],zbot, p[11],zbot, p[15],zlowest, p[14],zlowest, 35,0);   // left side of support
          end;

  RESULT:=s;
end;
//______________________________________________________________________________

function do_a_pyramid(top1,top2,top3,top4,bot1,bot2,bot3,bot4:Tpex; zt,zb:extended; layer:integer):string;     // 237a   pex clockwise from south-west

var
  s:string;

begin
  s:='';  //init

  s:=s+dxf_3dface_pex(top1,zt, top2,zt, top3,zt, top4,zt, layer,0);   // top surface
  s:=s+dxf_3dface_pex(bot1,zb, bot2,zb, bot3,zb, bot4,zb, layer,0);   // bottom surface

  s:=s+dxf_3dface_pex(top1,zt, top2,zt, bot2,zb, bot1,zb, layer,0);   // west face
  s:=s+dxf_3dface_pex(top2,zt, top3,zt, bot3,zb, bot2,zb, layer,0);   // north face
  s:=s+dxf_3dface_pex(top3,zt, top4,zt, bot4,zb, bot3,zb, layer,0);   // east face
  s:=s+dxf_3dface_pex(top4,zt, top1,zt, bot1,zb, bot4,zb, layer,0);   // south face

  RESULT:=s;
end;
//______________________________________________________________________________

procedure create_3d_P_bolt_blocks(nut:integer; var dxf_file:TextFile);

  // stock rail bolts on P slide chairs

  // nut = 5 nut rotations, 1..5  blocks selected at random for insertion

var
  s:string;
  zbase,zboss,znut,zscrew:extended;
  rbosst,rbossb,xstretch:extended;

  x1,y1,x2,y2,kk:extended;

  x3,y3,x4,y4:extended;

  n:integer;

  a,b,aa,bb:extended;

  q1,q2,q3,q4:Tpex;

  krot,nutk:extended;

  boss_face,boss_base,bolt_vert:extended;

  boss_len:extended;

  rscrew,rnut,nut_thick:extended;

  p1,p2,p3,p4:Tpex;

                   /////////////////////////////////////////////////////////////

                   function gauge_tweak_dxf(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4:extended; layer,blanked_edges:integer):string;

                       // gauge adjustment no longer done here

                   begin
                     RESULT:=dxf_3dface(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,layer,blanked_edges);
                   end;
                   ////////////////////////////////////////////////////////////


begin
  if _3d=False then EXIT;

       // !!! using control template scaling for blocks

  krot:=177*Pi/180;  // draw a vertical boss+nut and rotate co-ords at (180-3) degrees onto outer jaw

  boss_face:=5.5*inscale;  // 5.1/2" out from gauge face
  boss_len:=2*inscale;     // 2" depth of boss  - buried in jaw

  boss_base:=boss_face-boss_len;

  bolt_vert:=3.125*inscale;  // bolt centre-line 3.1/8" down from rail top

  rbosst:=1.3125*inscale;       // rad at face of boss
  rbossb:=rbosst+boss_len/9;    // rad at base of boss 1:9 taper

  rnut:=1.15*inscale;   // 1.5/8" sq. nut, radius to corners
  nut_thick:=inscale;   // nut 1" thick

  rscrew:=inscale/2;    // exposed screw end 1" diameter

  zbase:=0;  // nominal base of boss
  zboss:=zbase+boss_len;
  znut:=zboss+nut_thick;
  zscrew:=znut+inscale/3;  // screwed end 1/3" through nut

  creating_block_str:='PBOLT'+IntToStr(nut);    // 227a

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|'+creating_block_str+'|';

      // do boss ...

  xstretch:=1.45;     // sideways stretch factor on base of boss    1.45 trial and error

  x1:=rbosst;
  y1:=0;

  x3:=rbossb*xstretch;
  y3:=0;

  for n:=1 to 48 do begin

    kk:=n*Pi/24;

    x2:=rbosst*COS(kk);
    y2:=rbosst*SIN(kk);

    x4:=rbossb*COS(kk)*xstretch;
    y4:=rbossb*SIN(kk);


    q1.x:=zboss;
    q1.y:=y1;

    q2.x:=zboss;
    q2.y:=y2;

    q3.x:=zbase;
    q3.y:=y3;

    q4.x:=zbase;
    q4.y:=y4;


    dotransform(krot,0,0,q1,q1);
    dotransform(krot,0,0,q2,q2);
    dotransform(krot,0,0,q3,q3);
    dotransform(krot,0,0,q4,q4);

    debug_code:=100;

    s:=s+gauge_tweak_dxf{dxf_3dface}(x1,q1.x-boss_base,q1.y-bolt_vert, x2,q2.x-boss_base,q2.y-bolt_vert, x4,q4.x-boss_base,q4.y-bolt_vert, x3,q3.x-boss_base,q3.y-bolt_vert, 21,0);   // side of boss

    q3.x:=zboss;
    q3.y:=0;

    q4.x:=zboss;
    q4.y:=0;

    dotransform(krot,0,0,q3,q3);
    dotransform(krot,0,0,q4,q4);

    debug_code:=101;

    s:=s+gauge_tweak_dxf{dxf_3dface}(x1,q1.x-boss_base,q1.y-bolt_vert, x2,q2.x-boss_base,q2.y-bolt_vert,  0,q3.x-boss_base,q3.y-bolt_vert,  0,q4.x-boss_base,q4.y-bolt_vert, 21,0);     // outer face of boss

    x1:=x2;
    y1:=y2;

    x3:=x4;
    y3:=y4;

  end;//next


    // do the exposed screw end...

  x1:=rscrew;   // init
  y1:=0;

  x3:=rscrew;
  y3:=0;

  for n:=1 to 24 do begin

    kk:=n*Pi/12;

    x2:=rscrew*COS(kk);
    y2:=rscrew*SIN(kk);

    x4:=rscrew*COS(kk);
    y4:=rscrew*SIN(kk);

    q1.x:=zscrew;
    q1.y:=y1;

    q2.x:=zscrew;
    q2.y:=y2;

    q3.x:=znut;
    q3.y:=y3;

    q4.x:=znut;
    q4.y:=y4;

    dotransform(krot,0,0,q1,q1);
    dotransform(krot,0,0,q2,q2);
    dotransform(krot,0,0,q3,q3);
    dotransform(krot,0,0,q4,q4);

    debug_code:=102;

    s:=s+gauge_tweak_dxf{dxf_3dface}(x1,q1.x-boss_base,q1.y-bolt_vert, x2,q2.x-boss_base,q2.y-bolt_vert, x4,q4.x-boss_base,q4.y-bolt_vert, x3,q3.x-boss_base,q3.y-bolt_vert, 22,0);   // side of screw end   22=same layer as keys

    q3.x:=zscrew;
    q3.y:=0;

    q4.x:=zscrew;
    q4.y:=0;

    dotransform(krot,0,0,q3,q3);
    dotransform(krot,0,0,q4,q4);

    debug_code:=103;

    s:=s+gauge_tweak_dxf{dxf_3dface}(x1,q1.x-boss_base,q1.y-bolt_vert, x2,q2.x-boss_base,q2.y-bolt_vert,  0,q3.x-boss_base,q3.y-bolt_vert,  0,q4.x-boss_base,q4.y-bolt_vert, 22,0);     // outer face of screw end

    x1:=x2;
    y1:=y2;

    x3:=x4;
    y3:=y4;

  end;//next

    // do the nuts...

  nutk:=(nut*15+5)*Pi/180;   // 5 nut rotations  15, 30, 45, 60, 75 degs   + 5 degs off-square

   // nut corners ...

  p1.x:=rnut*COS(nutk);
  p1.y:=rnut*SIN(nutk);

  nutk:=nutk+Pi/2;

  p2.x:=rnut*COS(nutk);
  p2.y:=rnut*SIN(nutk);

  nutk:=nutk+Pi/2;

  p3.x:=rnut*COS(nutk);
  p3.y:=rnut*SIN(nutk);

  nutk:=nutk+Pi/2;

  p4.x:=rnut*COS(nutk);
  p4.y:=rnut*SIN(nutk);


  q1.x:=znut;
  q1.y:=p1.y;

  q2.x:=znut;
  q2.y:=p2.y;

  q3.x:=znut;
  q3.y:=p3.y;

  q4.x:=znut;
  q4.y:=p4.y;

  dotransform(krot,0,0,q1,q1);
  dotransform(krot,0,0,q2,q2);
  dotransform(krot,0,0,q3,q3);
  dotransform(krot,0,0,q4,q4);

  debug_code:=104;

  s:=s+gauge_tweak_dxf{dxf_3dface}(p1.x,q1.x-boss_base,q1.y-bolt_vert, p2.x,q2.x-boss_base,q2.y-bolt_vert,  p3.x,q3.x-boss_base,q3.y-bolt_vert,  p4.x,q4.x-boss_base,q4.y-bolt_vert, 22,0);     // outer face of nut


   // sides of nut ...

     // nut side 1...

   q1.x:=znut;
   q1.y:=p1.y;

   q2.x:=znut;
   q2.y:=p2.y;

   q3.x:=zboss;
   q3.y:=p2.y;

   q4.x:=zboss;
   q4.y:=p1.y;

   dotransform(krot,0,0,q1,q1);
   dotransform(krot,0,0,q2,q2);
   dotransform(krot,0,0,q3,q3);
   dotransform(krot,0,0,q4,q4);

   debug_code:=105;

   s:=s+gauge_tweak_dxf{dxf_3dface}(p1.x,q1.x-boss_base,q1.y-bolt_vert, p2.x,q2.x-boss_base,q2.y-bolt_vert, p2.x,q3.x-boss_base,q3.y-bolt_vert, p1.x,q4.x-boss_base,q4.y-bolt_vert, 22,0);   // side of nut

     // nut side 2...

   q1.x:=znut;
   q1.y:=p2.y;

   q2.x:=znut;
   q2.y:=p3.y;

   q3.x:=zboss;
   q3.y:=p3.y;

   q4.x:=zboss;
   q4.y:=p2.y;

   dotransform(krot,0,0,q1,q1);
   dotransform(krot,0,0,q2,q2);
   dotransform(krot,0,0,q3,q3);
   dotransform(krot,0,0,q4,q4);

   debug_code:=106;

   s:=s+gauge_tweak_dxf{dxf_3dface}(p2.x,q1.x-boss_base,q1.y-bolt_vert, p3.x,q2.x-boss_base,q2.y-bolt_vert, p3.x,q3.x-boss_base,q3.y-bolt_vert, p2.x,q4.x-boss_base,q4.y-bolt_vert, 22,0);   // side of nut

     // nut side 3...

   q1.x:=znut;
   q1.y:=p3.y;

   q2.x:=znut;
   q2.y:=p4.y;

   q3.x:=zboss;
   q3.y:=p4.y;

   q4.x:=zboss;
   q4.y:=p3.y;

   dotransform(krot,0,0,q1,q1);
   dotransform(krot,0,0,q2,q2);
   dotransform(krot,0,0,q3,q3);
   dotransform(krot,0,0,q4,q4);

   debug_code:=107;

   s:=s+gauge_tweak_dxf{dxf_3dface}(p3.x,q1.x-boss_base,q1.y-bolt_vert, p4.x,q2.x-boss_base,q2.y-bolt_vert, p4.x,q3.x-boss_base,q3.y-bolt_vert, p3.x,q4.x-boss_base,q4.y-bolt_vert, 22,0);   // side of nut

     // nut side 4...

   q1.x:=znut;
   q1.y:=p4.y;

   q2.x:=znut;
   q2.y:=p1.y;

   q3.x:=zboss;
   q3.y:=p1.y;

   q4.x:=zboss;
   q4.y:=p4.y;

   dotransform(krot,0,0,q1,q1);
   dotransform(krot,0,0,q2,q2);
   dotransform(krot,0,0,q3,q3);
   dotransform(krot,0,0,q4,q4);

   debug_code:=108;

   s:=s+gauge_tweak_dxf{dxf_3dface}(p4.x,q1.x-boss_base,q1.y-bolt_vert, p1.x,q2.x-boss_base,q2.y-bolt_vert, p1.x,q3.x-boss_base,q3.y-bolt_vert, p4.x,q4.x-boss_base,q4.y-bolt_vert, 22,0);   // side of nut

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_3d_nail_block(var dxf_file:TextFile);    // for bed of nails  237a

var
  s:string;
  ztop,zbot:extended;
  rtop,rbot:extended;

  x1,y1,x2,y2,kk:extended;

  x3,y3,x4,y4:extended;

  n:integer;

begin
  if _3d=False then EXIT;

  if dxf_form.nails_rafts_radio.Checked=False then EXIT;      // not needed in file

       // z datum on rail top ...

  with _3d_data do ztop:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick+timber_thick)*inscale);    // down to underside of timber    !!! using control template scaling for blocks

  zbot:=ztop-nails_height;    // default nail 2mm tall

  rtop:=nails_toprad;         // default top 0.35mm dia
  rbot:=nails_botrad;         // default bottom 0.55mm dia

  creating_block_str:='NAIL';    // 227a

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|NAIL|';

  x1:=rtop;   // init
  y1:=0;

  x3:=rbot;
  y3:=0;

  for n:=1 to 24 do begin

    kk:=n*Pi/12;

    x2:=rtop*COS(kk);
    y2:=rtop*SIN(kk);

    x4:=rbot*COS(kk);
    y4:=rbot*SIN(kk);

    s:=s+dxf_3dface(x1,y1,ztop, x2,y2,ztop, x4,y4,zbot, x3,y3,zbot, 10,0);     // side of nail
    s:=s+dxf_3dface(x1,y1,ztop, x2,y2,ztop,  0, 0,ztop,  0, 0,ztop, 10,0);     // top of nail
    s:=s+dxf_3dface(x3,y3,zbot, x4,y4,zbot,  0, 0,zbot,  0, 0,zbot, 10,0);     // bottom of nail

    x1:=x2;
    y1:=y2;

    x3:=x4;
    y3:=y4;

  end;

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_3d_bolt_blocks(var dxf_file:TextFile);

var
  s:string;
  zbase,zboss,zferr,zpan,zhead:extended;
  rbosst,rbossb,rferr,rpan:extended;

  x1,y1,x2,y2,kk:extended;

  x3,y3,x4,y4:extended;

  n:integer;

  a,b,aa,bb:extended;

begin
  if _3d=False then EXIT;

  if dxf_form.chair_bolts_combo.ItemIndex=0 then EXIT;      // not needed in file

       // z datum on rail top ...

  with _3d_data do begin

    zbase:=0-(rail_section_data_mm.rail_depth_mm+seat_thick*inscale);    // down to base of chair    !!! using control template scaling for blocks
    zboss:=zbase+boss_height*inscale;
    zferr:=zbase+ferrule_height*inscale;
    zpan:=zferr+inscale/8;                       // pan head thickness 1/8" at edge    was 1/16"
    zhead:=zbase+bolt_head_height*inscale;

    rbosst:=boss_dia*inscale/2;                 // dia at top of boss
    rbossb:=rbosst+boss_height*inscale/2.75;    // dia at bottom of boss 1:2.75 taper       233c was 1:5

    rferr:=hole_dia*inscale/2;
    rpan:=rferr+inscale*7/64;

  end;//with

  creating_block_str:='BOLTBOSS';    // 227a

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|BOLTBOSS|';

      // do boss ...

  x1:=rbosst;   // init
  y1:=0;

  x3:=rbossb;
  y3:=0;

  for n:=1 to 24 do begin

    kk:=n*Pi/12;

    x2:=rbosst*COS(kk);
    y2:=rbosst*SIN(kk);

    x4:=rbossb*COS(kk);
    y4:=rbossb*SIN(kk);

    debug_code:=109;

    s:=s+dxf_3dface(x1,y1,zboss, x2,y2,zboss, x4,y4,zbase, x3,y3,zbase, 19,0);     // side of boss
    s:=s+dxf_3dface(x1,y1,zboss, x2,y2,zboss,  0, 0,zboss,  0, 0,zboss, 19,0);     // top of boss

    x1:=x2;
    y1:=y2;

    x3:=x4;
    y3:=y4;

  end;

      // do ferrule sides ...

  x1:=rferr;   // init
  y1:=0;

  for n:=1 to 24 do begin

    kk:=n*Pi/12;

    x2:=rferr*COS(kk);
    y2:=rferr*SIN(kk);

    debug_code:=110;

    s:=s+dxf_3dface(x1,y1,zboss, x2,y2,zboss, x2,y2,zferr, x1,y1,zferr, 19,0);     // side of ferrule

    x1:=x2;
    y1:=y2;

  end;

  s:=s+'  0|ENDBLK|';

  creating_block_str:='BOLTHEAD';    // 227a

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  s:=s+'  0|BLOCK|  2|BOLTHEAD|';

       // coned pan head skirt ...

  x1:=rpan;   // init
  y1:=0;

  for n:=1 to 24 do begin

    kk:=n*Pi/12;

    x2:=rpan*COS(kk);
    y2:=rpan*SIN(kk);

    debug_code:=111;

    s:=s+dxf_3dface(x1,y1,zferr, x2,y2,zferr,  0, 0,zferr,  0, 0,zferr, 15,0);                  // underside of pan skirt to seal ferrule
    s:=s+dxf_3dface(x1,y1,zpan, x2,y2,zpan,  0, 0,zpan+inscale/3,  0, 0,zpan+inscale/3, 15,0);  // coned top of pan skirt

    s:=s+dxf_3dface(x1,y1,zferr, x2,y2,zferr, x2,y2,zpan, x1,y1,zpan, 15,0);     // side of skirt

    x1:=x2;
    y1:=y2;

  end;

     // 1" sq bolt head..

    a:=inscale/2;
    b:=0-a;

    aa:=a+inscale*3/32;    // tapered sides
    bb:=0-aa;

    debug_code:=112;

    s:=s+dxf_3dface(aa,aa,zferr, a,a,zhead, a,b,zhead, aa,bb,zferr, 15,0);      // sides ...
    s:=s+dxf_3dface(a,b,zhead, aa,bb,zferr, bb,bb,zferr, b,b,zhead, 15,0);
    s:=s+dxf_3dface(bb,bb,zferr, b,b,zhead, b,a,zhead, bb,aa,zferr, 15,0);
    s:=s+dxf_3dface(b,a,zhead, bb,aa,zferr, aa,aa,zferr, a,a,zhead, 15,0);

    s:=s+dxf_3dface(a,a,zhead, a,b,zhead, b,b,zhead, b,a,zhead, 15,0);    // top of head

    s:=s+dxf_3dface(aa,aa,zferr, aa,bb,zferr, bb,bb,zferr, bb,aa,zferr, 15,0);    // underside of of head (in case of overlaps)

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_3d_P_outer_jaw_block(dd_str:string; dx_stretch:extended; loose_pin:boolean; var dxf_file:TextFile);

  // PJ chair with spacer block      also used for DX insert on DD crossing chairs

var
  s:string;

  x1,x2,x3,x4,x5,x7:extended;
  y1,y2,y3,y4:extended;
  z1,z2,z3,z4,z5,z6,z7,z_off:extended;

  foot_offset,side_slope:extended;

  spacer_halflong_top:extended;
  spacer_halflong_bot:extended;    // at bottom of spacer

  spacer_top_z:extended;    // top of spacer
  spacer_bot_z:extended;

  web_thick:extended;

  web_face_top_z:extended;
  web_face_bot_z:extended;

begin
  if _3d=False then EXIT;

     // z datum on rail top ...

  with _3d_data do begin

    spacer_halflong_top:=P_jaw_half_width_top*inscale;
    spacer_halflong_bot:=P_jaw_half_width_mid*inscale;    // at bottom of spacer

    with rail_section_data_mm do begin

      if dd_str<>''
         then begin
                if loose_pin=True
                   then z5:=0-rail_depth_mm-seat_thick*inscale+chair_plinth_thick*inscale+inscale/8   // same plinth thickness as S1 for DD chair - loose DX insert slides over plinth, clearance 1/8"
                   else z5:=0-rail_depth_mm-seat_thick*inscale+chair_plinth_thick*inscale;            // same plinth thickness as S1 for DD chair
              end
         else z5:=0-rail_depth_mm-seat_thick*inscale+P_chair_plinth_thick*inscale;  // down to P chair plinth

      z7:=0-rail_depth_mm;

      foot_offset:=(rail_foot_width_mm-rail_head_width_mm)/2;

      web_thick:=rail_web_thick_mm;

      y1:=0-rail_head_width_mm-foot_offset;   // 237a  -gauge_adjustment;
      y2:=0-(rail_head_width_mm+web_thick)/2; // 237a  -gauge_adjustment;      // outer web face from gauge face

      if dd_str<>''
         then begin
                y3:=y1-dx_stretch; // jaw top in front of spacer for DX insert merge
                y4:=y1-dx_stretch; // jaw base in front of spacer for DX insert merge
              end
         else begin
                y3:=y1-P_jaw_depth_top*inscale; // jaw top in front of spacer
                y4:=y1-P_jaw_depth_bot*inscale; // jaw base in front of spacer
              end;

      web_face_top_z:=0-rail_web_top_mm+web_thick/2/rail_fish_angle;     // out from centre-line to web face at fish angle
      web_face_bot_z:=0-rail_web_bottom_mm-web_thick/2/rail_fish_angle;  // out from centre-line to web face at fish angle

      spacer_top_z:=web_face_top_z-(y1-y2)/rail_fish_angle;
      spacer_bot_z:=web_face_bot_z+(y1-y2)/rail_fish_angle;

    end;//with rail section
  end;//with 3d

  x1:=spacer_halflong_top;
  x4:=spacer_halflong_bot;

  try
    side_slope:=(x4-x1)/(spacer_bot_z-spacer_top_z);
  except
    side_slope:=0;
  end;//try

  x2:=x1+(web_face_top_z-spacer_top_z)*side_slope;
  x3:=x1+(web_face_bot_z-spacer_top_z)*side_slope;
  x5:=x1+(z5-spacer_top_z)*side_slope;
  x7:=x1+(z7-spacer_top_z)*side_slope;

  z1:=spacer_top_z;
  z2:=web_face_top_z;
  z3:=web_face_bot_z;
  z4:=spacer_bot_z;

  if dd_str<>''
     then z6:=z1-2*inscale    // 2" top slope on DX insert
     else z6:=z1-inscale/8;   // 1/8" top slope on P jaw

  if dd_str<>''
     then begin
            creating_block_str:=dd_str;   // 241a

            if loose_pin=True
               then begin
                      z_off:=7*inscale;   // drop  7" scale closer to raft

                      z1:=z1-z_off;
                      z2:=z2-z_off;
                      z3:=z3-z_off;
                      z4:=z4-z_off;
                      z5:=z5-z_off;
                      z6:=z6-z_off;
                      z7:=z7-z_off;
                    end;
          end
     else begin
            if loose_pin=True
               then creating_block_str:='PJAWL'
               else creating_block_str:='PJAW';    // 227a
          end;

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|'+creating_block_str+'|';

  debug_code:=113;

  s:=s+dxf_3dface(0-x1,y1,z1, 0-x2,y2,z2, 0-x3,y2,z3, 0-x4,y1,z4, 21,0);     // west end of spacer
  s:=s+dxf_3dface(  x1,y1,z1,   x2,y2,z2,   x3,y2,z3,   x4,y1,z4, 21,0);     // east end of spacer

  s:=s+dxf_3dface(x2,y2,z2, x3,y2,z3, 0-x3,y2,z3, 0-x2,y2,z2, 21,0);         // web face of spacer
  s:=s+dxf_3dface(x1,y1,z1, x4,y1,z4, 0-x4,y1,z4, 0-x1,y1,z1, 21,0);         // front face of spacer (internal)

  s:=s+dxf_3dface(x1,y1,z1, x2,y2,z2, 0-x2,y2,z2, 0-x1,y1,z1, 21,0);         // top face of spacer
  s:=s+dxf_3dface(x4,y1,z4, x3,y2,z3, 0-x3,y2,z3, 0-x4,y1,z4, 21,0);         // bottom face of spacer


  s:=s+dxf_3dface(0-x1,y1,z1, 0-x5,y1,z5, 0-x5,y4,z5, 0-x1,y3,z6, 21,0);     // west end of jaw
  s:=s+dxf_3dface(  x1,y1,z1,   x5,y1,z5,   x5,y4,z5,   x1,y3,z6, 21,0);     // east end of jaw

  s:=s+dxf_3dface(x1,y1,z1, 0-x1,y1,z1, 0-x1,y3,z6, x1,y3,z6, 21,0);         // top face of jaw
  s:=s+dxf_3dface(x5,y1,z5, 0-x5,y1,z5, 0-x5,y4,z5, x5,y4,z5, 21,0);         // bottom face jaw

  s:=s+dxf_3dface(x1,y1,z1, x5,y1,z5, 0-x5,y1,z5, 0-x1,y1,z1, 21,0);         // rear face of jaw
  s:=s+dxf_3dface(x1,y3,z6, x5,y4,z5, 0-x5,y4,z5, 0-x1,y3,z6, 21,0);         // front face of jaw

        // 236d add pin on underside of loose outer jaw,  y-zero on outer jaw face, gauge_adjusted ...

  if (loose_pin=True) and (dd_str='') then s:=s+loose_jaw_pin_outer(False,False,0,0-_3d_data.outer_jaw_face*inscale,z5,0);

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_3d_key_block(lj,CC:boolean; var dxf_file:TextFile);

 // 237a   lj = key is for loose jaws (longer pad)

var
  s:string;

  key_top_z:extended;  // to apex of key
  key_bot_z:extended;

  key_long:extended;
  pad_long:extended;
  key_taper:extended;
  web_thick:extended;
  pad_thick:extended;    // pad thickness is at centre of jaw

  outer_jaw:extended;

  web_face_top:extended;
  web_face_bot:extended;

  back_key_face_top:extended;
  back_key_face_bot:extended;

  x1,y1,x2,y2:extended;

  x3,y3,x4,y4:extended;

  key_deform:extended;    // 235b

begin
  if _3d=False then EXIT;

     // z datum on rail top ...

  with _3d_data do begin

    with rail_section_data_mm do begin

      web_thick:=rail_web_thick_mm;

      if lj=True                                       // 236d
         then web_thick:=web_thick-key_thicken*2;      // +ve thicken makes tighter rail fit

      outer_jaw:=outer_jaw_face*inscale;

      pad_thick:=outer_jaw-rail_head_width_mm/2-web_thick/2;

      web_face_top:=0-rail_web_top_mm+web_thick/2/rail_fish_angle;     // out from centre-line to web face at fish angle
      web_face_bot:=0-rail_web_bottom_mm-web_thick/2/rail_fish_angle;  // out from centre-line to web face at fish angle

      key_top_z:=0-rail_head_depth_mm;
      key_bot_z:=zkeybot;                //0-(rail_depth_mm-rail_foot_height_below_head_mm)

      back_key_face_top:=0-(rail_depth_mm-rail_web_face_top_from_rail_bot_mm);

      if rail_section_option=0
         then back_key_face_bot:=0-(rail_depth_mm-rail_web_face_bottom_from_rail_bot_mm)  // BS-95R  key as prototype
         else back_key_face_bot:=key_bot_z;                                               // horizontal, no island for 3D printing

    end;//with rail section

    key_long:=key_length*inscale;

    key_taper:=key_pad_taper*inscale;
    key_deform:=key_deformation*inscale;     // 235b

    if lj=True                                   // 237a key is for loose jaw (longer pad)
       then pad_long:=lj_key_pad_length*inscale
       else pad_long:=sj_key_pad_length*inscale;

    x1:=0-key_long/2;
    x2:=0-pad_long/2;
    x3:=pad_long/2;
    x4:=key_long/2;

    y1:=0-outer_jaw;

    y2:=0-rail_section_data_mm.rail_head_width_mm;

    y3:=y1+pad_thick-key_taper;
    y4:=y1+pad_thick;


    y1:=y1-key_deform;   // 235b overlap into jaw  (ensures no gaps in STL for skewed jaws)

  end;//with

  if CC=True        // 237a   swap for check rail ...
     then begin
            y1:=0-y1+(fw); //+fw_correction_check);
            y2:=0-y2+(fw); //+fw_correction_check);
            y3:=0-y3+(fw); //+fw_correction_check);
            y4:=0-y4+(fw); //+fw_correction_check);

            creating_block_str:='CCKEY';
          end
     else creating_block_str:='KEY';    // 227a

  if lj=True then creating_block_str:=creating_block_str+'L';

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|'+creating_block_str+'|';

  debug_code:=114;

  s:=s+dxf_3dface(x1,y1,back_key_face_top, x4,y1,back_key_face_top, x4,y1,back_key_face_bot, x1,y1,back_key_face_bot, 22,0);     // back surface of key

  s:=s+dxf_3dface(x1,y1,back_key_face_top, x1,y2,key_top_z,         x1,y3,web_face_top,      x1,y3,web_face_bot,      22,0);     // upper west end of key
  s:=s+dxf_3dface(x1,y1,back_key_face_top, x1,y1,back_key_face_bot, x1,y2,key_bot_z,         x1,y3,web_face_bot,      22,0);     // lower west end of key

  s:=s+dxf_3dface(x4,y1,back_key_face_top, x4,y2,key_top_z,         x4,y3,web_face_top,      x4,y3,web_face_bot,      22,0);     // upper east end of key
  s:=s+dxf_3dface(x4,y1,back_key_face_top, x4,y1,back_key_face_bot, x4,y2,key_bot_z,         x4,y3,web_face_bot,      22,0);     // lower east end of key

  s:=s+dxf_3dface(x1,y3,web_face_top,      x2,y4,web_face_top,      x2,y4,web_face_bot,      x1,y3,web_face_bot,      22,0);     // front surface of key, west taper
  s:=s+dxf_3dface(x4,y3,web_face_top,      x3,y4,web_face_top,      x3,y4,web_face_bot,      x4,y3,web_face_bot,      22,0);     // front surface of key, east taper

  s:=s+dxf_3dface(x2,y4,web_face_top,      x3,y4,web_face_top,      x3,y4,web_face_bot,      x2,y4,web_face_bot,      22,0);     // front surface of key, pad

  s:=s+dxf_3dface(x1,y1,back_key_face_top, x1,y2,key_top_z,         x4,y2,key_top_z,         x4,y1,back_key_face_top, 22,0);     // back of top
  s:=s+dxf_3dface(x2,y2,key_top_z,         x3,y2,key_top_z,         x3,y4,web_face_top,      x2,y4,web_face_top,      22,0);     // front of top, pad section

  s:=s+dxf_3dface(x1,y2,key_top_z,         x2,y2,key_top_z,         x2,y4,web_face_top,      x1,y3,web_face_top,      22,0);     // front of top, west section
  s:=s+dxf_3dface(x4,y2,key_top_z,         x3,y2,key_top_z,         x3,y4,web_face_top,      x4,y3,web_face_top,      22,0);     // front of top, east section

  s:=s+dxf_3dface(x1,y1,back_key_face_bot, x1,y2,key_bot_z,         x4,y2,key_bot_z,         x4,y1,back_key_face_bot, 22,0);     // back of bottom
  s:=s+dxf_3dface(x2,y2,key_bot_z,         x3,y2,key_bot_z,         x3,y4,web_face_bot,      x2,y4,web_face_bot,      22,0);     // front of bottom, pad section

  s:=s+dxf_3dface(x1,y2,key_bot_z,         x2,y2,key_bot_z,         x2,y4,web_face_bot,      x1,y3,web_face_bot,      22,0);     // front of bottom, west section
  s:=s+dxf_3dface(x4,y2,key_bot_z,         x3,y2,key_bot_z,         x3,y4,web_face_bot,      x4,y3,web_face_bot,      22,0);     // front of bottom, east section

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_s1_outer_jaw_block(loose_pin:boolean; var dxf_file:TextFile);

type
  Tp=array[0..55] of Tpex;

var
  s:string;

  p,raw_p:Tp;

  sections:array[0..3] of Tp; //  0=top, 1=middle, 2=seat, 3=plinth

  ztop,zmid,zseat,zplinth:extended;    // down from rail top

  plinth_edge:Tpex;  // from centre-line at jaw face

  rib_rad_top:extended;
  rib_rad_mid:extended;
  rib_rad_seat:extended;
  rib_rad_plinth:extended;

  fillet_rad_top:extended;
  fillet_rad_mid:extended;
  fillet_rad_seat:extended;
  fillet_rad_plinth:extended;

  i:integer;

  pn:integer;

                             ///////////////////////////////////////////////////

                             procedure do_rib_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended);

                                            // do 90 degs convex rad
                             var
                               n:integer;
                               nk:extended;

                             begin

                               for n:=0 to 6 do begin

                                 nk:=startk+n*Pi/12;     // 15 deg steps clockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y-rad*SIN(nk);     // y negative from gauge-face on outer jaw

                                 if (make_horz_faces=True) and (n>0)
                                    then begin
                                           debug_code:=115;

                                           s:=s+dxf_3dface_pex(p[n+nmod],z, pcentre,z, p[n+nmod-1],z, p[n+nmod-1],z, 21,0);
                                         end;

                               end;//next
                             end;
                             ///////////////////////////////////////////////////

                             procedure do_fillet_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended; phorz:Tpex);

                                            // do 90 degs concave rad
                             var
                               n:integer;
                               nk:extended;

                             begin

                               for n:=0 to 6 do begin

                                 nk:=startk-n*Pi/12;     // 15 deg steps anticlockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y-rad*SIN(nk);     // y negative from gauge-face on outer jaw

                                 if (make_horz_faces=True) and (n>0)
                                    then begin
                                           debug_code:=116;

                                           s:=s+dxf_3dface_pex(p[n+nmod],z, phorz,z, p[n+nmod-1],z, p[n+nmod-1],z, 21,0);
                                         end;

                               end;//next
                             end;
                             ///////////////////////////////////////////////////

begin
  if _3d=False then EXIT;

  for pn:=0 to 55 do begin p[pn].x:=0; p[pn].y:=0; end;    // init all to prevent fp errors   223a

  with _3d_data do begin

    ztop:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-S1_outjaw_height_top)*inscale);    // top of jaw    use control template data for blocks

           // rad centres top ...

    p[50].x:=(S1_outjaw_half_rib_space_top-S1_outjaw_fillet_rad_top)*inscale;
    p[50].y:=0-(outer_jaw_face+S1_outjaw_depth_top+S1_outjaw_fillet_rad_top+outer_beefing)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(S1_outjaw_half_rib_space_top+S1_outjaw_rib_width_top-S1_outjaw_rib_rad_top)*inscale;
    p[52].y:=0-(outer_jaw_face+S1_outjaw_depth_top+S1_outjaw_rib_depth_top-S1_outjaw_rib_rad_top+outer_beefing)*inscale;

    p[53].x:=(S1_outjaw_half_rib_space_top+S1_outjaw_rib_rad_top)*inscale;
    p[53].y:=p[52].y;

    p[54].x:=0-p[53].x;
    p[54].y:=p[52].y;

    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw top ...

    p[1].x:=(S1_outjaw_half_rib_space_top+S1_outjaw_rib_width_top)*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=S1_outjaw_half_rib_space_top*inscale;
    p[46].y:=0-(outer_jaw_face+S1_outjaw_depth_top+outer_beefing)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    p[49].x:=p[46].x;
    p[49].y:=p[0].y;

    p[48].x:=p[47].x;
    p[48].y:=p[0].y;

    rib_rad_top:=S1_outjaw_rib_rad_top*inscale;

    fillet_rad_top:=S1_outjaw_fillet_rad_top*inscale;

  end;//with

  if loose_pin=True
     then creating_block_str:='S1OUTJAL'
     else creating_block_str:='S1OUTJAW';    // 227a

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|'+creating_block_str+'|';

  raw_p:=p;    // for reset

  do_rib_rad(p[52],rib_rad_top,0,2,True,ztop);

  do_rib_rad(p[53],rib_rad_top,Pi/2,9,True,ztop);

  do_fillet_rad(p[50],fillet_rad_top,0,16,True,ztop,p[46]);

  do_fillet_rad(p[51],fillet_rad_top,0-Pi/2,23,True,ztop,p[47]);

  do_rib_rad(p[54],rib_rad_top,0,30,True,ztop);

  do_rib_rad(p[55],rib_rad_top,Pi/2,37,True,ztop);

  sections[0]:=p;   // top x-section completed

  debug_code:=117;

  s:=s+dxf_3dface_pex( p[0],ztop, p[48],ztop, p[30],ztop, p[43],ztop, 21,0);     // top surface of jaw ...
  s:=s+dxf_3dface_pex(p[48],ztop, p[49],ztop, p[46],ztop, p[47],ztop, 21,0);
  s:=s+dxf_3dface_pex(p[49],ztop,  p[1],ztop,  p[2],ztop, p[15],ztop, 21,0);

  s:=s+dxf_3dface_pex(p[53],ztop, p[52],ztop,  p[8],ztop,  p[9],ztop, 21,0);
  s:=s+dxf_3dface_pex(p[55],ztop, p[54],ztop, p[36],ztop, p[37],ztop, 21,0);

  p:=raw_p;    // reset

  with _3d_data do begin

    zmid:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-S1_outjaw_height_mid)*inscale);    // middle x-section

           // rad centres middle ...

    p[50].x:=(S1_outjaw_half_rib_space_mid-S1_outjaw_fillet_rad_mid)*inscale;
    p[50].y:=0-(outer_jaw_face+S1_outjaw_depth_mid+S1_outjaw_fillet_rad_mid+outer_beefing)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(S1_outjaw_half_rib_space_mid+S1_outjaw_rib_width_mid-S1_outjaw_rib_rad_mid)*inscale;
    p[52].y:=0-(outer_jaw_face+S1_outjaw_depth_mid+S1_outjaw_rib_depth_mid-S1_outjaw_rib_rad_mid+outer_beefing)*inscale;

    p[53].x:=(S1_outjaw_half_rib_space_mid+S1_outjaw_rib_rad_mid)*inscale;
    p[53].y:=p[52].y;

    p[54].x:=0-p[53].x;
    p[54].y:=p[52].y;

    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw middle ...

    p[1].x:=(S1_outjaw_half_rib_space_mid+S1_outjaw_rib_width_mid)*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=S1_outjaw_half_rib_space_mid*inscale;
    p[46].y:=0-(outer_jaw_face+S1_outjaw_depth_mid+outer_beefing)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    p[49].x:=p[46].x;
    p[49].y:=p[0].y;

    p[48].x:=p[47].x;
    p[48].y:=p[0].y;

    rib_rad_mid:=S1_outjaw_rib_rad_mid*inscale;

    fillet_rad_mid:=S1_outjaw_fillet_rad_mid*inscale;


  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[52],rib_rad_mid,0,2,False,0);

  do_rib_rad(p[53],rib_rad_mid,Pi/2,9,False,0);

  do_fillet_rad(p[50],fillet_rad_mid,0,16,False,0,p[0]);

  do_fillet_rad(p[51],fillet_rad_mid,0-Pi/2,23,False,0,p[0]);

  do_rib_rad(p[54],rib_rad_mid,0,30,False,0);

  do_rib_rad(p[55],rib_rad_mid,Pi/2,37,False,0);

  sections[1]:=p;   // middle x-section completed

  // sides of jaw...

  debug_code:=118;

  for i:=0 to 42 do s:=s+dxf_3dface_pex(sections[0][i],ztop, sections[0][i+1],ztop, sections[1][i+1],zmid, sections[1][i],zmid, 21,0);      // down from top to middle ...

  debug_code:=119;

  s:=s+dxf_3dface_pex( sections[0][43],ztop, sections[0][0],ztop, sections[1][0],zmid, sections[1][43],zmid, 21,0);       // back to start

  p:=raw_p;    // reset

      // seat x-section ...

  with _3d_data do begin

    zseat:=0-rail_section_data_mm.rail_depth_mm;    // seat x-section

           // rad centres seat ...

    p[50].x:=(S1_outjaw_half_rib_space_seat-S1_outjaw_fillet_rad_seat)*inscale;
    p[50].y:=0-(outer_jaw_face+S1_outjaw_depth_seat+S1_outjaw_fillet_rad_seat+outer_beefing)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(S1_outjaw_half_rib_space_seat+S1_outjaw_rib_width_seat-S1_outjaw_rib_rad_seat)*inscale;
    p[52].y:=0-(outer_jaw_face+S1_outjaw_depth_seat+S1_outjaw_rib_depth_seat-S1_outjaw_rib_rad_seat+outer_beefing)*inscale;

    p[53].x:=(S1_outjaw_half_rib_space_seat+S1_outjaw_rib_rad_seat)*inscale;
    p[53].y:=p[52].y;

    p[54].x:=0-p[53].x;
    p[54].y:=p[52].y;

    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw seat ...

    p[1].x:=(S1_outjaw_half_rib_space_seat+S1_outjaw_rib_width_seat)*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=S1_outjaw_half_rib_space_seat*inscale;
    p[46].y:=0-(outer_jaw_face+S1_outjaw_depth_seat+outer_beefing)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    p[49].x:=p[46].x;
    p[49].y:=p[0].y;

    p[48].x:=p[47].x;
    p[48].y:=p[0].y;

    rib_rad_seat:=S1_outjaw_rib_rad_seat*inscale;

    fillet_rad_seat:=S1_outjaw_fillet_rad_seat*inscale;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[52],rib_rad_seat,0,2,False,0);

  do_rib_rad(p[53],rib_rad_seat,Pi/2,9,False,0);

  do_fillet_rad(p[50],fillet_rad_seat,0,16,False,0,p[0]);

  do_fillet_rad(p[51],fillet_rad_seat,0-Pi/2,23,False,0,p[0]);

  do_rib_rad(p[54],rib_rad_seat,0,30,False,0);

  do_rib_rad(p[55],rib_rad_seat,Pi/2,37,False,0);

  sections[2]:=p;   // seat x-section completed

   // sides of jaw...

  debug_code:=120;

  for i:=0 to 42 do s:=s+dxf_3dface_pex(sections[1][i],zmid, sections[1][i+1],zmid, sections[2][i+1],zseat, sections[2][i],zseat, 21,0);      // down from middle to seat ...

  debug_code:=121;

  s:=s+dxf_3dface_pex( sections[1][43],zmid, sections[1][0],zmid, sections[2][0],zseat, sections[2][43],zseat, 21,0);       // back to start

  p:=raw_p;    // reset

      // plinth x-section ...

  with _3d_data do begin

    zplinth:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-chair_plinth_thick)*inscale);    // plinth x-section

           // rad centres plinth ...

    p[50].x:=(S1_outjaw_half_rib_space_plinth-S1_outjaw_fillet_rad_plinth)*inscale;
    p[50].y:=0-(outer_jaw_face+S1_outjaw_depth_plinth+S1_outjaw_fillet_rad_plinth+outer_beefing)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(S1_outjaw_half_rib_space_plinth+S1_outjaw_rib_width_plinth-S1_outjaw_rib_rad_plinth)*inscale;
    p[52].y:=0-(outer_jaw_face+S1_outjaw_depth_plinth+S1_outjaw_rib_depth_plinth-S1_outjaw_rib_rad_plinth+outer_beefing)*inscale;

    p[53].x:=(S1_outjaw_half_rib_space_plinth+S1_outjaw_rib_rad_plinth)*inscale;
    p[53].y:=p[52].y;

    p[54].x:=0-p[53].x;
    p[54].y:=p[52].y;

    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw seat ...

    p[1].x:=(S1_outjaw_half_rib_space_plinth+S1_outjaw_rib_width_plinth)*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=S1_outjaw_half_rib_space_plinth*inscale;
    p[46].y:=0-(outer_jaw_face+S1_outjaw_depth_plinth+outer_beefing)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    p[49].x:=p[46].x;
    p[49].y:=p[0].y;

    p[48].x:=p[47].x;
    p[48].y:=p[0].y;

    rib_rad_plinth:=S1_outjaw_rib_rad_plinth*inscale;

    fillet_rad_plinth:=S1_outjaw_fillet_rad_plinth*inscale;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[52],rib_rad_plinth,0,2,True,zplinth);

  do_rib_rad(p[53],rib_rad_plinth,Pi/2,9,True,zplinth);

  do_fillet_rad(p[50],fillet_rad_plinth,0,16,True,zplinth,p[46]);

  do_fillet_rad(p[51],fillet_rad_plinth,0-Pi/2,23,True,zplinth,p[47]);

  do_rib_rad(p[54],rib_rad_plinth,0,30,True,zplinth);

  do_rib_rad(p[55],rib_rad_plinth,Pi/2,37,True,zplinth);

  sections[3]:=p;   // plinth x-section completed

  debug_code:=122;

  s:=s+dxf_3dface_pex( p[0],zplinth, p[48],zplinth, p[30],zplinth, p[43],zplinth, 21,0);     // bottom surface of jaw ...
  s:=s+dxf_3dface_pex(p[48],zplinth, p[49],zplinth, p[46],zplinth, p[47],zplinth, 21,0);
  s:=s+dxf_3dface_pex(p[49],zplinth,  p[1],zplinth,  p[2],zplinth, p[15],zplinth, 21,0);

  s:=s+dxf_3dface_pex(p[53],zplinth, p[52],zplinth,  p[8],zplinth,  p[9],zplinth, 21,0);
  s:=s+dxf_3dface_pex(p[55],zplinth, p[54],zplinth, p[36],zplinth, p[37],zplinth, 21,0);

        // add pin on underside of loose outer jaw,  p[0].y on outer jaw face, gauge_adjusted ...

  if loose_pin=True then s:=s+loose_jaw_pin_outer(False,False,0,p[0].y,zplinth,0);    // S1 outer

    // sides of jaw...

  debug_code:=124;

  for i:=0 to 42 do s:=s+dxf_3dface_pex(sections[2][i],zseat, sections[2][i+1],zseat, sections[3][i+1],zplinth, sections[3][i],zplinth, 21,0);      // down from seat to plinth ...

  debug_code:=125;

  s:=s+dxf_3dface_pex( sections[2][43],zseat, sections[2][0],zseat, sections[3][0],zplinth, sections[3][43],zplinth, 21,0);       // back to start

  p:=raw_p;    // reset

     // S1 outer do side bevels ...

  plinth_edge.y:=0-_3d_data.outer_jaw_face*inscale; // 237a  -gauge_adjustment;

  plinth_edge.x:=0-(_2d_data.S1_chair_halfwide-_2d_data.S1_chair_crad_outer)*inscale;    // plinth edge on corner rad centres

    // west side..

  debug_code:=126;  

  s:=s+dxf_3dface_pex(plinth_edge,zplinth,    sections[2][0],zseat,   sections[3][43],zplinth, sections[3][43],zplinth, 21,0);   // visible side
  s:=s+dxf_3dface_pex(plinth_edge,zplinth,    sections[3][0],zplinth, sections[3][43],zplinth, sections[3][43],zplinth, 21,0);   // base
  s:=s+dxf_3dface_pex(sections[3][0],zplinth, sections[2][0],zseat,   sections[3][43],zplinth, sections[3][43],zplinth, 21,0);   // inside
  s:=s+dxf_3dface_pex(plinth_edge,zplinth,    sections[3][0],zplinth, sections[2][0],zseat,    sections[2][0],zseat,    21,0);   // rear

    // east side..

  plinth_edge.x:=0-plinth_edge.x;

  debug_code:=127;

  s:=s+dxf_3dface_pex(plinth_edge,zplinth,    sections[2][1],zseat,   sections[3][2],zplinth, sections[3][2],zplinth, 21,0);   // visible side
  s:=s+dxf_3dface_pex(plinth_edge,zplinth,    sections[3][1],zplinth, sections[3][2],zplinth, sections[3][2],zplinth, 21,0);   // base
  s:=s+dxf_3dface_pex(sections[3][1],zplinth, sections[2][1],zseat,   sections[3][2],zplinth, sections[3][2],zplinth, 21,0);   // inside
  s:=s+dxf_3dface_pex(plinth_edge,zplinth,    sections[3][1],zplinth, sections[2][1],zseat,   sections[2][1],zseat,   21,0);   // rear

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  // end of S1 outer

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_L1_outer_jaw_block(loose_jaw:boolean; var dxf_file:TextFile);  // 228e

type
  Tp=array[0..17] of Tpex;

var
  s:string;

  p,raw_p:Tp;

  sections:array[0..1] of Tp; //  0=top, 1=edge

  ztop,zedge:extended;    // down from rail top

  corner_rad_top,corner_rad_edge:extended;

  i:integer;

  pn:integer;

  tript3,tript4:T3pex;  // L1 side-bevel tri-points

                             ///////////////////////////////////////////////////

                             procedure do_corner_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended);

                                            // do 90 degs convex rad
                             var
                               n:integer;
                               nk:extended;

                             begin

                               for n:=0 to 6 do begin

                                 nk:=startk+n*Pi/12;     // 15 deg steps clockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y-rad*SIN(nk);     // y negative from gauge-face on outer jaw

                                 if (make_horz_faces=True) and (n>0)
                                    then begin
                                           debug_code:=128;

                                           s:=s+dxf_3dface_pex(p[n+nmod],z, pcentre,z, p[n+nmod-1],z, p[n+nmod-1],z, 21,0);
                                         end;

                               end;//next
                             end;
                             ///////////////////////////////////////////////////

begin
  if _3d=False then EXIT;

  if loose_jaw=True
     then creating_block_str:='L1OUTJAL'
     else creating_block_str:='L1OUTJAW';

  try

    if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);

    s:='  0|BLOCK|  2|'+creating_block_str+'|';


    for pn:=0 to 17 do begin p[pn].x:=0; p[pn].y:=0; end;     // init all to prevent fp errors

    with _3d_data do begin

      ztop:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-L1_outjaw_height_top)*inscale);    // top of jaw    use control template data for blocks

      corner_rad_top:=L1_outjaw_corner_rad_top*inscale;

             // rad centres top ...

      p[16].x:=L1_outjaw_half_width_top*inscale-corner_rad_top;
      p[16].y:=0-((outer_jaw_face+L1_outjaw_depth_top)*inscale-corner_rad_top);

      p[17].x:=0-p[16].x;
      p[17].y:=p[16].y;

             // jaw top ...

      p[1].x:=L1_outjaw_half_width_top*inscale;
      p[1].y:=0-outer_jaw_face*inscale;

      p[0].x:=0-p[1].x;
      p[0].y:=p[1].y;

    end;//with

    raw_p:=p;    // for reset later

    for pn:=0 to 17 do p[pn].y:=p[pn].y; // 237a  -gauge_adjustment;

    do_corner_rad(p[16],corner_rad_top,0,2,True,ztop);

    do_corner_rad(p[17],corner_rad_top,Pi/2,9,True,ztop);

    sections[0]:=p;   // top x-section completed

    debug_code:=129;

    s:=s+dxf_3dface_pex( p[0],ztop, p[1],ztop,  p[2],ztop, p[15],ztop, 21,0);     // top surface of jaw ...
    s:=s+dxf_3dface_pex(p[17],ztop, p[16],ztop, p[8],ztop, p[9],ztop,  21,0);

    //---------------------

    p:=raw_p;    // reset

        // edge x-section ...

    with _3d_data do begin

      zedge:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-L1_outjaw_height_edge)*inscale);    // bottom of jaw    use control template data for blocks

      corner_rad_edge:=L1_outjaw_corner_rad_edge*inscale;

             // rad centres edge ...

      p[16].x:=L1_outjaw_half_width_edge*inscale-corner_rad_edge;
      p[16].y:=0-(L1_outjaw_depth_edge*inscale-corner_rad_edge);

      p[17].x:=0-p[16].x;
      p[17].y:=p[16].y;

             // jaw at edge ...

      p[1].x:=L1_outjaw_half_width_edge*inscale;
      p[1].y:=0-outer_jaw_face*inscale;

      p[0].x:=0-p[1].x;
      p[0].y:=p[1].y;

    end;//with

    raw_p:=p;    // for reset later

    for pn:=0 to 17 do p[pn].y:=p[pn].y; // 237a  -gauge_adjustment;

    do_corner_rad(p[16],corner_rad_edge,0,2,True,zedge);

    do_corner_rad(p[17],corner_rad_edge,Pi/2,9,True,zedge);

    sections[1]:=p;   // edge x-section completed

    debug_code:=130;

    s:=s+dxf_3dface_pex( p[0],zedge, p[1],zedge,  p[2],zedge, p[15],zedge, 21,0);     // bottom surface of jaw ...
    s:=s+dxf_3dface_pex(p[17],zedge, p[16],zedge, p[8],zedge, p[9],zedge,  21,0);

    //---------------------

      // sides of jaw...

    debug_code:=131;  

    for i:=0 to 14 do s:=s+dxf_3dface_pex(sections[0][i],ztop, sections[0][i+1],ztop, sections[1][i+1],zedge, sections[1][i],zedge, 21,0);      // down from top to edge ..

    debug_code:=132;

    s:=s+dxf_3dface_pex( sections[0][15],ztop, sections[0][0],ztop, sections[1][0],zedge, sections[1][15],zedge, 21,0);       // back to start

               // add pin on underside of loose outer jaw,  p[0].y on outer jaw face, gauge_adjusted ...

    if loose_jaw=True
       then s:=s+loose_jaw_pin_outer(False,False,slot_angle,p[0].y,zedge,0)    // L1 outer
       else begin                                                        // 236d  side bevels not possible for loose jaw
                    // L1 outer  do side bevels ...

              with _3d_data do begin

                tript3.pex.x:=(S1_outjaw_half_rib_space_seat+S1_outjaw_rib_width_seat)*inscale;     // jaw half-width at seat, same as S1
                tript3.pex.y:=0-outer_jaw_face*inscale;
                tript3.z:=0-rail_section_data_mm.rail_depth_mm;

                tript4.pex.x:=_2d_data.S1_chair_halfwide*inscale-_2d_data.S1_chair_crad_outer*inscale;    // plinth same as S1
                tript4.pex.y:=tript3.pex.y;
                tript4.z:=0-rail_section_data_mm.rail_depth_mm-seat_thick*inscale+L1_chair_plinth_thick*inscale;

              end;//with

                   // east..

              debug_code:=133;

              s:=s+dxf_3dface_pex(sections[1][1],zedge, tript4.pex,tript4.z, sections[1][2],zedge, sections[1][2],zedge, 21,0);  // base
              s:=s+dxf_3dface_pex(sections[1][1],zedge, tript3.pex,tript3.z, sections[1][2],zedge, sections[1][2],zedge, 21,0);  // inside
              s:=s+dxf_3dface_pex(tript3.pex,tript3.z, tript4.pex,tript4.z,  sections[1][2],zedge, sections[1][2],zedge, 21,0);  // outside visible
              s:=s+dxf_3dface_pex(tript4.pex,tript4.z, tript3.pex,tript3.z,  sections[1][1],zedge, sections[1][1],zedge, 21,0);  // rear

                   // west..

              tript4.pex.x:=0-tript4.pex.x;
              tript3.pex.x:=0-tript3.pex.x;

              debug_code:=134;

              s:=s+dxf_3dface_pex(sections[1][0],zedge, tript4.pex,tript4.z, sections[1][15],zedge, sections[1][15],zedge, 21,0);  // base
              s:=s+dxf_3dface_pex(sections[1][0],zedge, tript3.pex,tript3.z, sections[1][15],zedge, sections[1][15],zedge, 21,0);  // inside
              s:=s+dxf_3dface_pex(tript3.pex,tript3.z, tript4.pex,tript4.z,  sections[1][15],zedge, sections[1][15],zedge, 21,0);  // outside visible
              s:=s+dxf_3dface_pex(tript4.pex,tript4.z, tript3.pex,tript3.z,  sections[1][0],zedge,  sections[1][0],zedge,  21,0);  // rear

                // bevels done

            end;

    s:=s+'  0|ENDBLK|';

    Write(dxf_file,insert_crlf_str(s));

    // end of L1 outer

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_S1_SC_L1_CC_inner_jaw_block(jaw_str:string; EF,CC,SC,L1,swap:boolean; shear_k,scylim,cc_flare,half_widen:extended; var dxf_file:TextFile);   // inner jaw

   // inner chairs, single rib between 2 chair screws

   // S1 ordinary chair inners unless CC=check rail mid-inners, SC=switch block mid-inners, L1=bridge chair inners

   // 237a if shear_k<>0, shear jaw rib to angle shear_k for use when jaw is skewed, e.g. on switch block chairs

   // 235b if scylim<>0, scylim = stretch and crop jaw for SC inner (at middle of switch block chairs), and CC mid-inner between flangeway

   // if swap=True, reverse SC inner for use as outer on 1P and 2P half-chairs on switch rail, reverse CC mid-inner for mid-outer on check rail

   // half_widen used to widen jaw for crossing chairs  239b     if negative,   it's flag to omit grip part

type
  Tp=array[0..50] of Tpex;

var
  s:string;

  p,raw_p:Tp;

  sections:array[0..4] of Tp; //  0=stand top, 1=upper middle (top of rib), 2=lower middle, 3=seat, 4=plinth

  ztop,zbot,zstand,zupmid,zlomid,zseat,zplinth:extended;    // down from rail top

  plinth_edge:Tpex;  // from centre-line at jaw face

  rib_rad_stand:extended;
  rib_rad_upmid:extended;
  rib_rad_lomid:extended;
  rib_rad_seat:extended;
  rib_rad_plinth:extended;

  fillet_rad_stand:extended;
  fillet_rad_upmid:extended;
  fillet_rad_lomid:extended;
  fillet_rad_seat:extended;
  fillet_rad_plinth:extended;

  corner_rad_stand:extended;
  corner_rad_upmid:extended;
  corner_rad_lomid:extended;
  corner_rad_seat:extended;
  corner_rad_plinth:extended;

  i:integer;

  x1,x2,x3,x4,x5:extended;
  y1,y2,y3:extended;

  foot_offset:extended;

  n,pn:integer;

  lay:integer; // layer

  no_grip:boolean;



                             ///////////////////////////////////////////////////

                             function do_shear_pex(inp:Tpex):Tpex;

                             var
                               a:extended;
                               b:extended;

                               offset:extended;

                             begin
                               RESULT:=inp;   // init


                               if cc_flare=0
                                  then begin

                                         // jaw is inserted at angle

                                         // 237a grip part unsheared..

                                         if swap=True
                                            then a:=0-(inp.y+rail_section_data_mm.rail_head_width_mm+foot_offset)
                                            else a:=inp.y-foot_offset;

                                         b:=inscale/8;  // 1/8" clear from rail before skewing jaw co-ords

                                         if a>b
                                            then begin
                                                   RESULT.y:=inp.y+inp.x*SIN(shear_k);
                                                   RESULT.x:=inp.x-inp.y*SIN(shear_k);
                                                 end;

                                       end
                                  else begin
                                         if swap=True
                                            then begin

                                                     // jaw is inserted square to stock rail

                                                   offset:=(fw+fw_correction_check)/2+inscale/8; // shear if more than 1/8" beyond middle

                                                                    // shear the stand and grip part..
                                                   if inp.y>offset
                                                      then RESULT.y:=inp.y+inp.x*SIN(shear_k);
                                                 end
                                            else begin

                                                      // CC flare but no swapping?
                                                 end;
                                       end;


                             end;
                             ///////////////////////////////////////////////////

                             function crop_dxf_pex(p1:Tpex; z1:extended; p2:Tpex; z2:extended; p3:Tpex; z3:extended; p4:Tpex; z4:extended; layer,blanked_edges:integer):string;

                                 // 235b  PEX   crop S1 inners at scylim for SC inners (switch heel block stock-rail inners)   and CC inners

                             var
                               aa_top:extended;

                             begin
                               aa_top:=zstand-flange_extra*inscale;

                               if no_grip=True    // AA chair
                                  then begin
                                         if z1>aa_top then z1:=aa_top;
                                         if z2>aa_top then z2:=aa_top;
                                         if z3>aa_top then z3:=aa_top;
                                         if z4>aa_top then z4:=aa_top;
                                       end;

                               if SC=True        // SC and CC
                                  then begin
                                         if p1.y>scylim then p1.y:=scylim;
                                         if p2.y>scylim then p2.y:=scylim;
                                         if p3.y>scylim then p3.y:=scylim;
                                         if p4.y>scylim then p4.y:=scylim;

                                         if swap=True      // reverse for use as an outer...
                                            then begin
                                                   with rail_section_data_mm do begin

                                                     if CC=True                      // check chairs
                                                        then begin
                                                               p1.y:=0-p1.y+scylim*2-cc_flare;
                                                               p2.y:=0-p2.y+scylim*2-cc_flare;
                                                               p3.y:=0-p3.y+scylim*2-cc_flare;
                                                               p4.y:=0-p4.y+scylim*2-cc_flare;

                                                             end
                                                        else begin                               // SC switch chairs
                                                               p1.y:=0-p1.y-rail_head_width_mm;
                                                               p2.y:=0-p2.y-rail_head_width_mm;
                                                               p3.y:=0-p3.y-rail_head_width_mm;
                                                               p4.y:=0-p4.y-rail_head_width_mm;
                                                             end;
                                                   end;//with
                                                 end;
                                       end;

                               if shear_k<>0
                                  then RESULT:=dxf_3dface_pex(do_shear_pex(p1),z1,do_shear_pex(p2),z2,do_shear_pex(p3),z3,do_shear_pex(p4),z4,layer,blanked_edges)
                                  else RESULT:=dxf_3dface_pex(p1,z1,p2,z2,p3,z3,p4,z4,layer,blanked_edges);
                             end;
                             ///////////////////////////////////////////////////

                             function crop_dxf(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4:extended; layer,blanked_edges:integer):string;

                                 // 235b crop S1 inners at scylim for SC inners (switch heel block stock-rail inners)  and CC inners

                             var
                               pd,pe:Tpex;
                               aa_top:extended;

                             begin
                               aa_top:=zstand-flange_extra*inscale;

                               if no_grip=True    // AA chair
                                  then begin
                                         if z1>aa_top then z1:=aa_top;
                                         if z2>aa_top then z2:=aa_top;
                                         if z3>aa_top then z3:=aa_top;
                                         if z4>aa_top then z4:=aa_top;
                                       end;

                               if SC=True          // SC and CC
                                  then begin
                                         if y1>scylim then y1:=scylim;
                                         if y2>scylim then y2:=scylim;
                                         if y3>scylim then y3:=scylim;
                                         if y4>scylim then y4:=scylim;

                                         if swap=True      // reverse for use as an outer...
                                            then begin
                                                   with rail_section_data_mm do begin

                                                     if CC=True
                                                        then begin
                                                               y1:=0-y1+scylim*2-cc_flare;; //-rail_head_width_mm;
                                                               y2:=0-y2+scylim*2-cc_flare;; //-rail_head_width_mm;
                                                               y3:=0-y3+scylim*2-cc_flare;; //-rail_head_width_mm;
                                                               y4:=0-y4+scylim*2-cc_flare;; //-rail_head_width_mm;
                                                             end
                                                        else begin                           //SC
                                                               y1:=0-y1-rail_head_width_mm;
                                                               y2:=0-y2-rail_head_width_mm;
                                                               y3:=0-y3-rail_head_width_mm;
                                                               y4:=0-y4-rail_head_width_mm;
                                                             end;
                                                   end;//with
                                                 end;
                                       end;


                               if shear_k<>0
                                  then begin
                                         pd.x:=x1; pd.y:=y1; pe:=do_shear_pex(pd); x1:=pe.x; y1:=pe.y;
                                         pd.x:=x2; pd.y:=y2; pe:=do_shear_pex(pd); x2:=pe.x; y2:=pe.y;
                                         pd.x:=x3; pd.y:=y3; pe:=do_shear_pex(pd); x3:=pe.x; y3:=pe.y;
                                         pd.x:=x4; pd.y:=y4; pe:=do_shear_pex(pd); x4:=pe.x; y4:=pe.y;
                                       end;

                               RESULT:=dxf_3dface(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,layer,blanked_edges);
                             end;
                             ///////////////////////////////////////////////////

                             procedure do_rib_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended; mod_L1:boolean);

                                            // do 90 degs convex rad     // also corner rad        // z for horz faces
                             var
                               n:integer;
                               nk:extended;
                               ylim:extended;

                             begin

                               for n:=0 to 6 do begin
                                 nk:=startk+n*Pi/12;     // 15 deg steps clockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y+rad*SIN(nk);

                                 ylim:=(_2d_data.L1_chair_inlong-1/8)*inscale; // 229d shrink rib rad to fit 1/8" inside L1 outline     (1/8" allows for some negative gauge adjustment)

                                 if (mod_L1=True) and (L1=True) and (p[n+nmod].y>ylim)
                                    then p[n+nmod].y:=ylim;

                                 if (make_horz_faces=True) and (n>0)
                                    then begin
                                           debug_code:=135;

                                           s:=s+crop_dxf_pex(p[n+nmod],z, pcentre,z, p[n+nmod-1],z, p[n+nmod-1],z, lay,0);
                                         end;
                                         
                               end;//next
                             end;
                             ///////////////////////////////////////////////////

                             procedure do_fillet_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended; phorz:Tpex; mod_L1:boolean);

                                            // do 90 degs concave rad
                             var
                               n:integer;
                               nk:extended;
                               ylim:extended;

                             begin

                               for n:=0 to 6 do begin
                                 nk:=startk-n*Pi/12;     // 15 deg steps anticlockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y+rad*SIN(nk);

                                 ylim:=(_2d_data.L1_chair_inlong-1/8)*inscale; // 229d shrink rib rad to fit 1/8" inside L1 outline     (1/8" allows for some gauge adjustment)

                                 if (mod_L1=true) and (L1=true) and (p[n+nmod].y>ylim)
                                    then p[n+nmod].y:=ylim;

                                 if (make_horz_faces=True) and (n>0)
                                    then begin

                                           debug_code:=136;

                                           s:=s+crop_dxf_pex(p[n+nmod],z, phorz,z, p[n+nmod-1],z, p[n+nmod-1],z, lay,0);
                                         end;

                               end;//next
                             end;
                             ///////////////////////////////////////////////////

begin
  if _3d=False then EXIT;

  for pn:=0 to 50 do begin p[pn].x:=0; p[pn].y:=0; end;    // init all to prevent fp errors   223a

  no_grip:=(half_widen<0);       // negative widening means no grip (AA chair)     239b
  half_widen:=ABS(half_widen);

  lay:=20;  // inner jaw layer

  with _3d_data do begin

    with rail_section_data_mm do foot_offset:=(rail_foot_width_mm-rail_head_width_mm)/2;  // 223a

    y3:=foot_offset; // 237a   back of inner jaw stand against rail foot (might differ from rail head) and outer face insert behind stand   223a

    if jaw_str<>''
       then creating_block_str:=jaw_str
       else creating_block_str:='ODDJAW';  // ???    must have a string for the file

    if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

    s:='  0|BLOCK|  2|'+creating_block_str+'|';

           // stand  (no rib) ...

    zstand:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-S1_injaw_height_stand)*inscale);    // normal stand x-section

    rib_rad_stand:=(S1_injaw_half_width_stand-S1_injaw_side_space_stand)*inscale;

    fillet_rad_stand:=S1_injaw_fillet_rad_stand*inscale;

    corner_rad_stand:=S1_injaw_corner_rad_stand*inscale;

           // rad centres stand ...

    p[41].x:=(S1_injaw_half_width_stand-S1_injaw_corner_rad_stand)*inscale+half_widen;
    p[41].y:=(S1_injaw_depth_stand-S1_injaw_corner_rad_stand+inner_beefing)*inscale;

    p[42].x:=(S1_injaw_half_width_stand-S1_injaw_side_space_stand+S1_injaw_fillet_rad_stand)*inscale;
    p[42].y:=(S1_injaw_depth_stand+S1_injaw_fillet_rad_stand+inner_beefing)*inscale;

    p[43].x:=0;
    p[43].y:=p[42].y;

    p[44].x:=0-p[42].x;
    p[44].y:=p[42].y;

    p[45].x:=0-p[41].x;
    p[45].y:=p[41].y;

           // inner jaw stand ...

    p[1].x:=S1_injaw_half_width_stand*inscale+half_widen;

    p[1].y:=foot_offset;     // 223a   stand fits rail foot

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[41],corner_rad_stand,0,2,False,0,False);

  do_fillet_rad(p[42],fillet_rad_stand,0-Pi/2,9,False,0,p[0],False);

  do_rib_rad(p[43],rib_rad_stand,0,15,False,0,False);

  do_rib_rad(p[43],rib_rad_stand,Pi/2,21,False,0,False);

  do_fillet_rad(p[44],fillet_rad_stand,0,27,False,0,p[0],False);

  do_rib_rad(p[45],corner_rad_stand,Pi/2,34,False,0,False);

          //end;

         // collapse stand section back to a knife edge ...

  for i:=0 to 40 do p[i].y:=y3;  // 223a   stand fits rail foot


  sections[0]:=p;   // stand x-section completed

  p:=raw_p;    // reset

       // upmid  (top of rib) ...

  with _3d_data do begin

    zupmid:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-S1_injaw_height_upmid)*inscale);    // upmid x-section      use control template scaling for blocks

    rib_rad_upmid:=(S1_injaw_half_width_upmid-S1_injaw_side_space_upmid)*inscale;

    fillet_rad_upmid:=S1_injaw_fillet_rad_upmid*inscale;

    corner_rad_upmid:=S1_injaw_corner_rad_upmid*inscale;

           // rad centres upmid ...

    p[41].x:=(S1_injaw_half_width_upmid-S1_injaw_corner_rad_upmid)*inscale+half_widen;
    p[41].y:=(S1_injaw_depth_upmid-S1_injaw_corner_rad_upmid+inner_beefing)*inscale;

    p[42].x:=(S1_injaw_half_width_upmid-S1_injaw_side_space_upmid+S1_injaw_fillet_rad_upmid)*inscale;
    p[42].y:=(S1_injaw_depth_upmid+S1_injaw_fillet_rad_upmid+inner_beefing)*inscale;

    p[43].x:=0;
    p[43].y:=p[42].y;

    p[44].x:=0-p[42].x;
    p[44].y:=p[42].y;

    p[45].x:=0-p[41].x;
    p[45].y:=p[41].y;

           // inner jaw upmid ...

    p[1].x:=S1_injaw_half_width_upmid*inscale+half_widen;

    //p[1].y:=0;

    p[1].y:=foot_offset;     // 223a   stand fits rail foot

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[41],corner_rad_upmid,0,2,False,0,False);

  do_fillet_rad(p[42],fillet_rad_upmid,0-Pi/2,9,False,0,p[0],False);

  do_rib_rad(p[43],rib_rad_upmid,0,15,False,0,False);

  do_rib_rad(p[43],rib_rad_upmid,Pi/2,21,False,0,False);

  do_fillet_rad(p[44],fillet_rad_upmid,0,27,False,0,p[0],False);

  do_rib_rad(p[45],corner_rad_upmid,Pi/2,34,False,0,False);

  sections[1]:=p;   // upmid x-section completed

    // sides of jaw...

  debug_code:=137;

  for i:=0 to 39 do s:=s+crop_dxf_pex(sections[0][i],zstand, sections[0][i+1],zstand, sections[1][i+1],zupmid, sections[1][i],zupmid, lay,0);      // down from stand to upper middle ...

  debug_code:=138;

  s:=s+crop_dxf_pex( sections[0][40],zstand, sections[0][0],zstand, sections[1][0],zupmid, sections[1][40],zupmid, lay,0);       // back to start

  p:=raw_p;    // reset

  with _3d_data do begin

    zlomid:=0-(rail_section_data_mm.rail_depth_mm-(S1_injaw_height_lomid-seat_thick)*inscale);    // lower middle x-section

    rib_rad_lomid:=(S1_injaw_half_width_lomid-S1_injaw_side_space_lomid)*inscale;

    fillet_rad_lomid:=S1_injaw_fillet_rad_lomid*inscale;

    corner_rad_lomid:=S1_injaw_corner_rad_lomid*inscale;

           // rad centres lower middle ...

    p[41].x:=(S1_injaw_half_width_lomid-S1_injaw_corner_rad_lomid)*inscale+half_widen;
    p[41].y:=(S1_injaw_depth_lomid-S1_injaw_corner_rad_lomid+inner_beefing)*inscale;

    p[42].x:=(S1_injaw_half_width_lomid-S1_injaw_side_space_lomid+S1_injaw_fillet_rad_lomid)*inscale;
    p[42].y:=(S1_injaw_depth_lomid+S1_injaw_fillet_rad_lomid+inner_beefing)*inscale;

    p[43].x:=0;
    p[43].y:=p[42].y;

    p[44].x:=0-p[42].x;
    p[44].y:=p[42].y;

    p[45].x:=0-p[41].x;
    p[45].y:=p[41].y;

    if (SC=True) and (scylim<>0)    // stretch at lower mid before cropping
       then begin
              for pn:=41 to 45 do p[pn].y:=p[pn].y+2.75*inscale;     // 2.75" stretch arbitrary
            end;

           // inner jaw lower middle ...

    p[1].x:=S1_injaw_half_width_lomid*inscale+half_widen;

    p[1].y:=foot_offset;     // 223a   stand fits rail foot

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[41],corner_rad_lomid,0,2,False,0,False);

  do_fillet_rad(p[42],fillet_rad_lomid,0-Pi/2,9,False,0,p[0],False);

  do_rib_rad(p[43],rib_rad_lomid,0,15,False,0,False);

  do_rib_rad(p[43],rib_rad_lomid,Pi/2,21,False,0,False);

  do_fillet_rad(p[44],fillet_rad_lomid,0,27,False,0,p[0],False);

  do_rib_rad(p[45],corner_rad_lomid,Pi/2,34,False,0,False);

  sections[2]:=p;   // lower middle x-section completed


      // sides of jaw...

  debug_code:=139;    

  for i:=0 to 39 do s:=s+crop_dxf_pex(sections[1][i],zupmid, sections[1][i+1],zupmid, sections[2][i+1],zlomid, sections[2][i],zlomid, lay,0);      // down from upper middle to lower middle ...

  debug_code:=140;

  s:=s+crop_dxf_pex( sections[1][40],zupmid, sections[1][0],zupmid, sections[2][0],zlomid, sections[2][40],zlomid, lay,0);       // back to start

  p:=raw_p;    // reset

  with _3d_data do begin

    zseat:=0-rail_section_data_mm.rail_depth_mm;    // seat x-section

    rib_rad_seat:=(S1_injaw_half_width_seat-S1_injaw_side_space_seat)*inscale;

    fillet_rad_seat:=S1_injaw_fillet_rad_seat*inscale;

    corner_rad_seat:=S1_injaw_corner_rad_seat*inscale;

           // rad centres seat ...

    p[41].x:=(S1_injaw_half_width_seat-S1_injaw_corner_rad_seat)*inscale+half_widen;
    p[41].y:=(S1_injaw_depth_seat-S1_injaw_corner_rad_seat+inner_beefing)*inscale;

    p[42].x:=(S1_injaw_half_width_seat-S1_injaw_side_space_seat+S1_injaw_fillet_rad_seat)*inscale;
    p[42].y:=(S1_injaw_depth_seat+S1_injaw_fillet_rad_seat+inner_beefing)*inscale;

    p[43].x:=0;
    p[43].y:=p[42].y;

    p[44].x:=0-p[42].x;
    p[44].y:=p[42].y;

    p[45].x:=0-p[41].x;
    p[45].y:=p[41].y;

    if (SC=True) and (scylim<>0)    // stretch at seat before cropping
       then begin
              for pn:=41 to 45 do p[pn].y:=p[pn].y+2.75*inscale;
            end;


           // inner jaw seat ...

    p[1].x:=S1_injaw_half_width_seat*inscale+half_widen;

    //p[1].y:=0;

    p[1].y:=foot_offset;     // 223a   stand fits rail foot

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[41],corner_rad_seat,0,2,False,0,False);

  do_fillet_rad(p[42],fillet_rad_seat,0-Pi/2,9,False,0,p[0],False);

  do_rib_rad(p[43],rib_rad_seat,0,15,False,0,False);

  do_rib_rad(p[43],rib_rad_seat,Pi/2,21,False,0,False);

  do_fillet_rad(p[44],fillet_rad_seat,0,27,False,0,p[0],False);

  do_rib_rad(p[45],corner_rad_seat,Pi/2,34,False,0,False);

  sections[3]:=p;   // seat x-section completed


      // sides of jaw...

  debug_code:=141;

  for i:=0 to 39 do s:=s+crop_dxf_pex(sections[2][i],zlomid, sections[2][i+1],zlomid, sections[3][i+1],zseat, sections[3][i],zseat, lay,0);      // down from lower middle to seat ...

  debug_code:=142;

  s:=s+crop_dxf_pex( sections[2][40],zlomid, sections[2][0],zlomid, sections[3][0],zseat, sections[3][40],zseat, lay,0);       // back to start

  p:=raw_p;    // reset

      // use control template scaling for blocks ...

  with _3d_data do begin

    if (POS('WG',jaw_str)=1) or (POS('VG',jaw_str)=1)                                                      // 241a CD/DD chairs
       then zplinth:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-chair_plinth_thick)*inscale)        // same as S1   allow thickness of seat on DX insert
       else begin

              if L1=True
                 then zplinth:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-L1_chair_edge_thick)*inscale)   // go down to edge height for L1 bridge chairs
                 else if (SC=True) or (CC=True) or (EF=True)
                         then zplinth:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-SC_CC_chair_plinth_thick)*inscale)   // jaw fits all on plinth for others
                         else zplinth:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-chair_plinth_thick)*inscale);
            end;

    rib_rad_plinth:=(S1_injaw_half_width_plinth-S1_injaw_side_space_plinth)*inscale;

    fillet_rad_plinth:=S1_injaw_fillet_rad_plinth*inscale;

    if L1=True
       then fillet_rad_plinth:=fillet_rad_plinth*1.75;  // 229d *1.75 arbitrary fuller rad for L1

    corner_rad_plinth:=S1_injaw_corner_rad_plinth*inscale;

           // rad centres plinth ...

    p[41].x:=(S1_injaw_half_width_plinth-S1_injaw_corner_rad_plinth)*inscale+half_widen;
    p[41].y:=(S1_injaw_depth_plinth-S1_injaw_corner_rad_plinth+inner_beefing)*inscale;

    p[42].x:=(S1_injaw_half_width_plinth-S1_injaw_side_space_plinth)*inscale+fillet_rad_plinth;
    p[42].y:=(S1_injaw_depth_plinth+inner_beefing)*inscale+fillet_rad_plinth;

    p[43].x:=0;
    p[43].y:=p[42].y;

    p[44].x:=0-p[42].x;
    p[44].y:=p[42].y;

    p[45].x:=0-p[41].x;
    p[45].y:=p[41].y;

    if (SC=True) and (scylim<>0)    // stretch at plinth before cropping
       then begin
              for pn:=41 to 45 do p[pn].y:=p[pn].y+2.75*inscale;
            end;

           // inner jaw plinth ...

    p[1].x:=S1_injaw_half_width_plinth*inscale+half_widen;

    p[1].y:=foot_offset;     // 223a   stand fits rail foot

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

      // for underside of jaw ...

    p[46].x:=rib_rad_plinth;
    p[46].y:=(S1_injaw_depth_plinth+inner_beefing)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

  end;//with

  raw_p:=p;    // for reset

  do_rib_rad(p[41],corner_rad_plinth,0,2,True,zplinth,False);

  do_fillet_rad(p[42],fillet_rad_plinth,0-Pi/2,9,True,zplinth,p[46],True);

  do_rib_rad(p[43],rib_rad_plinth,0,15,True,zplinth,True);

  do_rib_rad(p[43],rib_rad_plinth,Pi/2,21,True,zplinth,True);

  do_fillet_rad(p[44],fillet_rad_plinth,0,27,True,zplinth,p[47],True);

  do_rib_rad(p[45],corner_rad_plinth,Pi/2,34,True,zplinth,False);

  sections[4]:=p;   // plinth x-section completed


      // sides of jaw and rear face of stand ..

  debug_code:=143;    

  for i:=0 to 39 do s:=s+crop_dxf_pex(sections[3][i],zseat, sections[3][i+1],zseat, sections[4][i+1],zplinth, sections[4][i],zplinth, lay,0);      // down from seat to plinth ...

  debug_code:=144;

  s:=s+crop_dxf_pex( sections[3][40],zseat, sections[3][0],zseat, sections[4][0],zplinth, sections[4][40],zplinth, lay,0);       // back to start

  debug_code:=145;

  s:=s+crop_dxf_pex( p[0],zplinth,  p[1],zplinth,  p[2],zplinth, p[40],zplinth, lay,0);     // finish bottom surface of jaw ...
  s:=s+crop_dxf_pex(p[45],zplinth, p[41],zplinth,  p[8],zplinth, p[34],zplinth, lay,0);
  s:=s+crop_dxf_pex(p[47],zplinth, p[46],zplinth, p[15],zplinth, p[27],zplinth, lay,0);

  p:=raw_p;    // reset

       // do side bevels ...

  with _2d_data do begin
    plinth_edge.y:=foot_offset;

    if L1=True
       then plinth_edge.x:=0-(L1_chair_halfwide-L1_chair_crad_outer)*inscale     // plinth edge is on corner rad centres
       else plinth_edge.x:=0-(S1_chair_halfwide-S1_chair_crad_outer)*inscale;    // plinth edge is on corner rad centres

    debug_code:=146;

    s:=s+crop_dxf_pex(plinth_edge,zplinth,    sections[3][0],zseat,   sections[4][40],zplinth, sections[4][40],zplinth, lay,0);    // outside visible
    s:=s+crop_dxf_pex(plinth_edge,zplinth,    sections[4][0],zplinth, sections[3][0],zseat,    sections[3][0],zseat,    lay,0);    // rear
    s:=s+crop_dxf_pex(sections[4][0],zplinth, sections[3][0],zseat,   sections[4][40],zplinth, sections[4][40],zplinth, lay,0);    // inside
    s:=s+crop_dxf_pex(plinth_edge,zplinth,    sections[4][0],zplinth, sections[4][40],zplinth, sections[4][40],zplinth, lay,0);    // base of bevel

    plinth_edge.x:=0-plinth_edge.x;

    debug_code:=147;

    s:=s+crop_dxf_pex(plinth_edge,zplinth,    sections[3][1],zseat,   sections[4][2],zplinth, sections[4][2],zplinth, lay,0);    // outside visible
    s:=s+crop_dxf_pex(plinth_edge,zplinth,    sections[4][1],zplinth, sections[3][1],zseat,   sections[3][1],zseat,   lay,0);    // rear
    s:=s+crop_dxf_pex(sections[4][1],zplinth, sections[3][1],zseat,   sections[4][2],zplinth, sections[4][2],zplinth, lay,0);    // inside
    s:=s+crop_dxf_pex(plinth_edge,zplinth,    sections[4][1],zplinth, sections[4][2],zplinth, sections[4][2],zplinth, lay,0);    // base of bevel

  end;//with

       // stand done, now the web grip insert ...

  with _3d_data do begin

  if no_grip=False  // 239b
     then begin

            with rail_section_data_mm do begin

              ztop:=0-(rail_depth_mm-rail_web_face_top_from_rail_bot_mm);        // 233d..
              zbot:=0-(rail_depth_mm-rail_web_face_bottom_from_rail_bot_mm);

            end;//with

            x1:=S1_injaw_half_width_insert_top*inscale+half_widen;
            x2:=S1_injaw_half_width_stand*inscale+half_widen;
            x3:=S1_injaw_half_width_upmid*inscale+half_widen;
            x4:=S1_injaw_half_width_insert_bot*inscale+half_widen;
            x5:=S1_injaw_half_width_lomid*inscale+half_widen;

            y1:=0-(rail_section_data_mm.rail_head_width_mm/2-rail_section_data_mm.rail_web_thick_mm/2); // 237a  -gauge_adjustment*gauge_tweak_side;      // web face of insert

            y2:=0-S1_injaw_depth_insert*inscale; // 237a  -gauge_adjustment*gauge_tweak_side;                     // outer edge of insert at top (in from rail-head gauge-face)

             // top of insert ..

            debug_code:=148;

            s:=s+crop_dxf(x1,y1,ztop, x1,y2,ztop, 0-x1,y2,ztop, 0-x1,y1,ztop, lay,0);

              // front of insert ...

            debug_code:=149;

            s:=s+crop_dxf(x1,y2,ztop,   x2,y3,zstand, 0-x2,y3,zstand, 0-x1,y2,ztop,   lay,0);      // y=0 gauge-face at stand
            s:=s+crop_dxf(x2,y3,zstand, x3,y3,zupmid, 0-x3,y3,zupmid, 0-x2,y3,zstand, lay,0);
            s:=s+crop_dxf(x4,y3,zbot,   x5,y3,zlomid, 0-x5,y3,zlomid, 0-x4,y3,zbot,   lay,0);

              // back of insert ...

            debug_code:=150;

            s:=s+crop_dxf(x1,y1,ztop,   x2,y1,zstand, 0-x2,y1,zstand, 0-x1,y1,ztop,   lay,0);
            s:=s+crop_dxf(x2,y1,zstand, x3,y1,zupmid, 0-x3,y1,zupmid, 0-x2,y1,zstand, lay,0);

              // bottom of insert ..

            debug_code:=151;

            s:=s+crop_dxf(x4,y1,zbot, x5,y3,zlomid, 0-x5,y3,zlomid, 0-x4,y1,zbot, lay,0);

              // ends of insert ...

            debug_code:=152;

            s:=s+crop_dxf(x1,y1,ztop,   x1,y2,ztop,   x2,y3,zstand, x2,y1,zstand, lay,0);
            s:=s+crop_dxf(x2,y1,zstand, x2,y3,zstand, x3,y3,zupmid, x3,y1,zupmid, lay,0);
            s:=s+crop_dxf(x4,y1,zbot,   x4,y3,zbot,   x5,y3,zlomid, x4,y1,zbot,   lay,0);

            s:=s+crop_dxf(0-x1,y1,ztop,   0-x1,y2,ztop,   0-x2,y3,zstand, 0-x2,y1,zstand, lay,0);
            s:=s+crop_dxf(0-x2,y1,zstand, 0-x2,y3,zstand, 0-x3,y3,zupmid, 0-x3,y1,zupmid, lay,0);
            s:=s+crop_dxf(0-x4,y1,zbot,   0-x4,y3,zbot,   0-x5,y3,zlomid, 0-x4,y1,zbot,   lay,0);

          end;


      // finally add extra stiffener chunk when cropping ...  237a

    if scylim<>0
       then begin
              lay:=20;  // inner jaw layer

              ztop:=zstand-flange_extra*inscale;
                 
              zbot:=zlomid;

              if half_widen<>0
                 then begin

                        for n:=9 to 33 do begin

                          if sections[0][n].x>0 then sections[0][n].x:=sections[0][n].x+half_widen*2; //7/4;     // *2 arbitrary
                          if sections[0][n].x<0 then sections[0][n].x:=sections[0][n].x-half_widen*2; //7/4;

                          if sections[2][n].x>0 then sections[2][n].x:=sections[2][n].x+half_widen*2; //7/4;
                          if sections[2][n].x<0 then sections[2][n].x:=sections[2][n].x-half_widen*2; //7/4;

                        end;//next

                      end;

              s:=s+crop_dxf_pex( sections[0][33],zbot,  sections[0][9],zbot,  sections[2][9],zbot,  sections[2][33],zbot, lay,0);  // bottom of chunk
              s:=s+crop_dxf_pex( sections[0][27],ztop,  sections[0][15],ztop, sections[2][18],ztop, sections[2][24],ztop, lay,0);  // top of chunk

              s:=s+crop_dxf_pex( sections[0][27],ztop,  sections[2][24],ztop, sections[2][33],zbot, sections[0][33],zbot, lay,0);  // near side of chunk
              s:=s+crop_dxf_pex( sections[0][15],ztop,  sections[2][18],ztop, sections[2][9],zbot,  sections[0][9],zbot,  lay,0);  // far side of chunk

              s:=s+crop_dxf_pex( sections[2][18],ztop,  sections[2][24],ztop, sections[2][33],zbot, sections[2][9],zbot,  lay,0);  // split face of chunk
              s:=s+crop_dxf_pex( sections[0][27],ztop,  sections[0][15],ztop, sections[0][9],zbot,  sections[0][33],zbot, lay,0);  // buried face of chunk
            end;

  end;//with

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  creating_block_str:='';
end;
//______________________________________________________________________________

procedure create_SC_outer_jaw_block(jaw_str:string; loose_jaw,CC_swap:boolean; shear_k,scylim,cc_flare:extended; var dxf_file:TextFile);

  // 237a if shear_k<>0, shear jaw rib to angle shear_k for use when jaw is skewed, e.g. on switch block chairs, check end chairs

  // scylim = stretch and crop jaw for outer at middle of switch block chairs  235b

  // CC_swap =  rotate for inner end of check chairs

type
  Tp=array[0..55] of Tpex;

var
  s:string;

  p,raw_p:Tp;

  sections:array[0..3] of Tp; //  0=top, 1=middle, 2=seat, 3=plinth

  ztop,zbot,zmid,zseat,zplinth,zstand:extended;    // down from rail top

  plinth_edge:Tpex;  // from centre-line at jaw face

  rib_rad_top:extended;
  rib_rad_mid:extended;
  rib_rad_seat:extended;
  rib_rad_plinth:extended;

  fillet_rad_top:extended;
  fillet_rad_mid:extended;
  fillet_rad_seat:extended;
  fillet_rad_plinth:extended;

  corner_rad_top:extended;
  corner_rad_mid:extended;
  corner_rad_seat:extended;
  corner_rad_plinth:extended;

  i:integer;

  pn:integer;

  lay:integer;

  shear_offset,chamy,chamz,cham_l,cham_h:extended;



                             ///////////////////////////////////////////////////

                             function do_shear_pex(inp:Tpex):Tpex;

                             var
                               a:extended;
                               offset:extended;

                             begin
                               RESULT:=inp;   // init


                               if cc_flare=0
                                  then begin

                                           // jaw is inserted at angle

                                         a:=inp.y+shear_offset;   // 237a key area and top face of jaw unsheared

                                         if a<0                   // beyond jaw face, shear back square
                                            then begin
                                                   RESULT.y:=inp.y+inp.x*SIN(shear_k);
                                                   RESULT.x:=inp.x-a*SIN(shear_k);
                                                 end;

                                         RESULT.x:=RESULT.x+shear_offset*SIN(shear_k);
                                         RESULT.y:=RESULT.y-shear_offset*SIN(shear_k)*TAN(shear_k);
                                       end
                                  else begin
                                         if CC_swap=True
                                            then begin

                                                     // jaw is inserted square to stock rail

                                                   offset:=fw+fw_correction_check+cc_flare;

                                                   a:=inp.y-offset;   // 237c

                                                   if (a>0) and (a<shear_offset)         // shear the jaw face area only
                                                      then begin
                                                             RESULT.y:=inp.y-inp.x*SIN(shear_k);

                                                             //RESULT.x:=inp.x+a*SIN(shear_k);   // 237c not needed
                                                           end
                                                      else RESULT.y:=inp.y+ABS(3*inscale*SIN(shear_k));    // push remainder for thicker jaw to allow for skewing      3" arbitrary

                                                   RESULT.y:=RESULT.y-inscale/32;                     // 1/32" overlap seat/key to ensure solid STL
                                                 end
                                            else begin

                                                      // CC offset but no swapping?
                                                 end;
                                       end;
                             end;
                             ///////////////////////////////////////////////////

                             function crop_dxf_pex(p1:Tpex; z1:extended; p2:Tpex; z2:extended; p3:Tpex; z3:extended; p4:Tpex; z4:extended; layer,blanked_edges:integer):string;

                                 // 235b  PEX   crop SC outers at scylim (negative) (switch heel block turnout-rail outers)

                             begin

                               if scylim<>0
                                  then begin
                                         if p1.y<scylim then p1.y:=scylim;
                                         if p2.y<scylim then p2.y:=scylim;
                                         if p3.y<scylim then p3.y:=scylim;
                                         if p4.y<scylim then p4.y:=scylim;
                                       end;

                               if shear_k<>0
                                  then RESULT:=dxf_3dface_pex(do_shear_pex(p1),z1,do_shear_pex(p2),z2,do_shear_pex(p3),z3,do_shear_pex(p4),z4,layer,blanked_edges)
                                  else RESULT:=dxf_3dface_pex(p1,z1,p2,z2,p3,z3,p4,z4,layer,blanked_edges);

                             end;
                             ///////////////////////////////////////////////////

                             procedure do_rib_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended);

                                            // do 90 degs convex rad
                             var
                               n:integer;
                               nk:extended;
                               dir:extended;

                             begin
                               if CC_swap=True
                                  then dir:=-1.0
                                  else dir:=1.0;

                               for n:=0 to 6 do begin

                                 nk:=startk+n*Pi/12;     // 15 deg steps clockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y-rad*SIN(nk)*dir;

                                 if (make_horz_faces=True) and (n>0)
                                    then begin
                                           debug_code:=153;

                                           s:=s+crop_dxf_pex(p[n+nmod],z, pcentre,z, p[n+nmod-1],z, p[n+nmod-1],z, 21,0);
                                         end;

                               end;//next
                             end;
                             ///////////////////////////////////////////////////

                             procedure do_fillet_rad(pcentre:Tpex; rad,startk:extended; nmod:integer; make_horz_faces:boolean; z:extended; phorz:Tpex);

                                            // do 90 degs concave rad
                             var
                               n:integer;
                               nk:extended;
                               dir:extended;

                             begin
                               if CC_swap=True
                                  then dir:=-1.0
                                  else dir:=1.0;

                               for n:=0 to 6 do begin

                                 nk:=startk-n*Pi/12;     // 15 deg steps anticlockwise

                                 p[n+nmod].x:=pcentre.x+rad*COS(nk);
                                 p[n+nmod].y:=pcentre.y-rad*SIN(nk)*dir;

                                 if (make_horz_faces=True) and (n>0)
                                    then begin
                                           debug_code:=154;

                                           s:=s+crop_dxf_pex(p[n+nmod],z, phorz,z, p[n+nmod-1],z, p[n+nmod-1],z, 21,0);
                                         end;

                               end;//next
                             end;
                             ///////////////////////////////////////////////////

begin
  if _3d=False then EXIT;

  for pn:=0 to 55 do begin p[pn].x:=0; p[pn].y:=0; end;    // init all to prevent fp errors   223a

  with _3d_data do begin

    ztop:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-SC_outjaw_height_top)*inscale);           // top of jaw    use control template data for blocks
    zmid:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-SC_outjaw_height_mid)*inscale);           // middle x-section
    zseat:=0-rail_section_data_mm.rail_depth_mm;                                                      // seat x-section
    zplinth:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-SC_CC_chair_plinth_thick)*inscale);    // plinth x-section

    zstand:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick-_3d_data.S1_injaw_height_stand)*inscale);  // as inner jaw

    shear_offset:=(outer_jaw_face+SC_outjaw_depth_top-SC_outjaw_corner_rad_top-3/16)*inscale;      // 237a   3/16" arbitrary to ensure clear of rounding effects on the corner rads

    // SC outer jaw ...

           // rad centres top ...

    p[50].x:=0-(SC_outjaw_rib_end_top+SC_outjaw_rib_rad_top+SC_outjaw_fillet_rad_top)*inscale;
    p[50].y:=0-(outer_jaw_face+SC_outjaw_depth_top+SC_outjaw_fillet_rad_top)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(SC_outjaw_half_width_top-SC_outjaw_corner_rad_top)*inscale;
    p[52].y:=0-(outer_jaw_face+SC_outjaw_depth_top-SC_outjaw_corner_rad_top)*inscale;

    p[53].x:=SC_outjaw_rib_end_top*inscale;
    p[53].y:=p[50].y-SC_outjaw_rib_side_top*inscale;

    p[54].x:=0-p[53].x;
    p[54].y:=p[53].y;

    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw top ...

    p[1].x:=SC_outjaw_half_width_top*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=(SC_outjaw_rib_end_top+SC_outjaw_rib_rad_top)*inscale;
    p[46].y:=0-(outer_jaw_face+SC_outjaw_depth_top)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;


    rib_rad_top:=SC_outjaw_rib_rad_top*inscale;

    fillet_rad_top:=SC_outjaw_fillet_rad_top*inscale;

    corner_rad_top:=SC_outjaw_corner_rad_top*inscale;

  end;//with

  if jaw_str<>''
     then creating_block_str:=jaw_str
     else creating_block_str:='ODDJAW';  // ???    must have a string for the file

  if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

  try

  s:='  0|BLOCK|  2|'+creating_block_str+'|';

  raw_p:=p;    // for reset

  if CC_swap=True                                               // 237a check rail inner end
     then for pn:=0 to 55 do p[pn].y:=0-p[pn].y+(fw+fw_correction_check+cc_flare);

  do_rib_rad(p[52],corner_rad_top,0,2,True,ztop);

  do_fillet_rad(p[51],fillet_rad_top,0-Pi/2,23,True,ztop,p[46]);


  do_rib_rad(p[53],rib_rad_top,0,30,True,ztop);
  do_rib_rad(p[54],rib_rad_top,Pi/2,9,True,ztop);


  do_fillet_rad(p[50],fillet_rad_top,0,16,True,ztop,p[47]);

  do_rib_rad(p[55],corner_rad_top,pi/2,37,True,ztop);

  sections[0]:=p;   // top x-section completed

  debug_code:=155;

  s:=s+crop_dxf_pex( p[0],ztop, p[1],ztop, p[2],ztop, p[43],ztop, 21,0);     // top surface of jaw ...
  s:=s+crop_dxf_pex(p[55],ztop, p[52],ztop, p[8],ztop, p[37],ztop, 21,0);
  s:=s+crop_dxf_pex(p[47],ztop,  p[46],ztop,  p[30],ztop, p[15],ztop, 21,0);
  s:=s+crop_dxf_pex(p[54],ztop,  p[53],ztop,  p[36],ztop, p[9],ztop, 21,0);

  p:=raw_p;    // reset

    // next section --------- middle -----------

  with _3d_data do begin

           // rad centres mid ...

    p[50].x:=0-(SC_outjaw_rib_end_mid+SC_outjaw_rib_rad_mid+SC_outjaw_fillet_rad_mid)*inscale;
    p[50].y:=0-(outer_jaw_face+SC_outjaw_depth_mid+SC_outjaw_fillet_rad_mid)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(SC_outjaw_half_width_mid-SC_outjaw_corner_rad_mid)*inscale;
    p[52].y:=0-(outer_jaw_face+SC_outjaw_depth_mid-SC_outjaw_corner_rad_mid)*inscale;

    p[53].x:=SC_outjaw_rib_end_mid*inscale;
    p[53].y:=p[50].y-SC_outjaw_rib_side_mid*inscale;

    p[54].x:=0-p[53].x;
    p[54].y:=p[53].y;

    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw mid ...

    p[1].x:=SC_outjaw_half_width_mid*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=SC_outjaw_rib_rad_mid*inscale;
    p[46].y:=0-(outer_jaw_face+SC_outjaw_depth_mid)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    if scylim<>0    // stretch/raise at mid before cropping
       then begin
              zmid:=zmid+0.5*inscale;      // 1/2" arbitrary
            end;

    rib_rad_mid:=SC_outjaw_rib_rad_mid*inscale;

    fillet_rad_mid:=SC_outjaw_fillet_rad_mid*inscale;

    corner_rad_mid:=SC_outjaw_corner_rad_mid*inscale;

  end;//with

  raw_p:=p;    // for reset

  if CC_swap=True                                               // 237a check rail inner end
     then for pn:=0 to 55 do p[pn].y:=0-p[pn].y+(fw+fw_correction_check+cc_flare);

  do_rib_rad(p[52],corner_rad_mid,0,2,False,zmid);

  do_fillet_rad(p[51],fillet_rad_mid,0-Pi/2,23,False,zmid,p[46]);


  do_rib_rad(p[53],rib_rad_mid,0,30,False,zmid);
  do_rib_rad(p[54],rib_rad_mid,Pi/2,9,False,zmid);


  do_fillet_rad(p[50],fillet_rad_mid,0,16,False,zmid,p[47]);

  do_rib_rad(p[55],corner_rad_mid,pi/2,37,False,zmid);

  sections[1]:=p;   // middle x-section completed

  // sides of jaw...

  debug_code:=156;

  for i:=0 to 7 do s:=s+crop_dxf_pex(sections[0][i],ztop, sections[0][i+1],ztop, sections[1][i+1],zmid, sections[1][i],zmid, 21,0);      // down from top to middle ...

  for i:=23 to 35 do s:=s+crop_dxf_pex(sections[0][i],ztop, sections[0][i+1],ztop, sections[1][i+1],zmid, sections[1][i],zmid, 21,0);

   for i:=9 to 21 do s:=s+crop_dxf_pex(sections[0][i],ztop, sections[0][i+1],ztop, sections[1][i+1],zmid, sections[1][i],zmid, 21,0);

  for i:=37 to 42 do s:=s+crop_dxf_pex(sections[0][i],ztop, sections[0][i+1],ztop, sections[1][i+1],zmid, sections[1][i],zmid, 21,0);

  s:=s+crop_dxf_pex( sections[0][8],ztop, sections[0][23],ztop, sections[1][23],zmid, sections[1][8],zmid, 21,0);

  s:=s+crop_dxf_pex( sections[0][36],ztop, sections[0][9],ztop, sections[1][9],zmid, sections[1][36],zmid, 21,0);

  s:=s+crop_dxf_pex( sections[0][22],ztop, sections[0][37],ztop, sections[1][37],zmid, sections[1][22],zmid, 21,0);

  s:=s+crop_dxf_pex( sections[0][43],ztop, sections[0][0],ztop, sections[1][0],zmid, sections[1][43],zmid, 21,0);                         // back to start

  p:=raw_p;    // reset


    // next section --------- seat -----------

  with _3d_data do begin

           // rad centres seat ...

    p[50].x:=0-(SC_outjaw_rib_end_seat+SC_outjaw_rib_rad_seat+SC_outjaw_fillet_rad_seat)*inscale;
    p[50].y:=0-(outer_jaw_face+SC_outjaw_depth_seat+SC_outjaw_fillet_rad_seat)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(SC_outjaw_half_width_seat-SC_outjaw_corner_rad_seat)*inscale;
    p[52].y:=0-(outer_jaw_face+SC_outjaw_depth_seat-SC_outjaw_corner_rad_seat)*inscale;

    p[53].x:=SC_outjaw_rib_end_seat*inscale;
    p[53].y:=p[50].y-SC_outjaw_rib_side_seat*inscale;

    p[54].x:=0-p[53].x;
    p[54].y:=p[53].y;


    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw seat ...

    p[1].x:=SC_outjaw_half_width_seat*inscale;
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=SC_outjaw_rib_rad_seat*inscale;
    p[46].y:=0-(outer_jaw_face+SC_outjaw_depth_seat)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    if scylim<>0    // stretch/raise at seat before cropping
       then begin
              for pn:=50 to 55 do p[pn].y:=p[pn].y-7*inscale;     // 7"  was 3" stretch arbitrary
              zseat:=zseat+0.75*inscale;                          // 3/4" arbitrary
            end;

    rib_rad_seat:=SC_outjaw_rib_rad_seat*inscale;

    fillet_rad_seat:=SC_outjaw_fillet_rad_seat*inscale;

    corner_rad_seat:=SC_outjaw_corner_rad_seat*inscale;

  end;//with

  raw_p:=p;    // for reset

  if CC_swap=True                                               // 237a check rail inner end
     then for pn:=0 to 55 do p[pn].y:=0-p[pn].y+(fw+fw_correction_check+cc_flare);

  do_rib_rad(p[52],corner_rad_seat,0,2,False,zseat);

  do_fillet_rad(p[51],fillet_rad_seat,0-Pi/2,23,False,zseat,p[46]);


  do_rib_rad(p[53],rib_rad_seat,0,30,False,zseat);
  do_rib_rad(p[54],rib_rad_seat,Pi/2,9,False,zseat);


  do_fillet_rad(p[50],fillet_rad_seat,0,16,False,zseat,p[47]);

  do_rib_rad(p[55],corner_rad_seat,pi/2,37,False,zseat);

  sections[2]:=p;   // seat x-section completed

  // sides of jaw...

  debug_code:=157;

  for i:=0 to 7 do s:=s+crop_dxf_pex(sections[1][i],zmid, sections[1][i+1],zmid, sections[2][i+1],zseat, sections[2][i],zseat, 21,0);      // down from middle to seat...

  for i:=23 to 35 do s:=s+crop_dxf_pex(sections[1][i],zmid, sections[1][i+1],zmid, sections[2][i+1],zseat, sections[2][i],zseat, 21,0);

  for i:=9 to 21 do s:=s+crop_dxf_pex(sections[1][i],zmid, sections[1][i+1],zmid, sections[2][i+1],zseat, sections[2][i],zseat, 21,0);

  for i:=37 to 42 do s:=s+crop_dxf_pex(sections[1][i],zmid, sections[1][i+1],zmid, sections[2][i+1],zseat, sections[2][i],zseat, 21,0);

  s:=s+crop_dxf_pex( sections[1][8],zmid, sections[1][23],zmid, sections[2][23],zseat, sections[2][8],zseat, 21,0);

  s:=s+crop_dxf_pex( sections[1][36],zmid, sections[1][9],zmid, sections[2][9],zseat, sections[2][36],zseat, 21,0);

  s:=s+crop_dxf_pex( sections[1][22],zmid, sections[1][37],zmid, sections[2][37],zseat, sections[2][22],zseat, 21,0);

  s:=s+crop_dxf_pex( sections[1][43],zmid, sections[1][0],zmid, sections[2][0],zseat, sections[2][43],zseat, 21,0);                         // back to start

  p:=raw_p;    // reset


    // next section --------- plinth -----------

  with _3d_data do begin

           // rad centres plinth ...

    p[50].x:=0-(SC_outjaw_rib_end_plinth+SC_outjaw_rib_rad_plinth+SC_outjaw_fillet_rad_plinth)*inscale;
    p[50].y:=0-(outer_jaw_face+SC_outjaw_depth_plinth+SC_outjaw_fillet_rad_plinth)*inscale;

    p[51].x:=0-p[50].x;
    p[51].y:=p[50].y;

    p[52].x:=(SC_outjaw_half_width_plinth-SC_outjaw_corner_rad_plinth-1/16)*inscale;            // 237a 1/16" arbitrary to ensure all on plinth when skewed
    p[52].y:=0-(outer_jaw_face+SC_outjaw_depth_plinth-SC_outjaw_corner_rad_plinth)*inscale;

    p[53].x:=SC_outjaw_rib_end_plinth*inscale;
    p[53].y:=p[50].y-SC_outjaw_rib_side_plinth*inscale;

    p[54].x:=0-p[53].x;
    p[54].y:=p[53].y;


    p[55].x:=0-p[52].x;
    p[55].y:=p[52].y;

           // jaw plinth ...

    p[1].x:=(SC_outjaw_half_width_plinth-1/16)*inscale;     // 237a 1/16" arbitrary to ensure all on plinth when skewed
    p[1].y:=0-outer_jaw_face*inscale;

    p[0].x:=0-p[1].x;
    p[0].y:=p[1].y;

    p[46].x:=SC_outjaw_rib_rad_plinth*inscale;
    p[46].y:=0-(outer_jaw_face+SC_outjaw_depth_plinth)*inscale;

    p[47].x:=0-p[46].x;
    p[47].y:=p[46].y;

    if scylim<>0    // stretch at plinth before cropping
       then begin
              for pn:=50 to 55 do p[pn].y:=p[pn].y-7*inscale;     // 7"  was 3" stretch arbitrary
            end;


    rib_rad_plinth:=SC_outjaw_rib_rad_plinth*inscale;

    fillet_rad_plinth:=SC_outjaw_fillet_rad_plinth*inscale;

    corner_rad_plinth:=SC_outjaw_corner_rad_plinth*inscale;

  end;//with

  raw_p:=p;    // for reset

  if CC_swap=True                                               // 237a check rail inner end
     then for pn:=0 to 55 do p[pn].y:=0-p[pn].y+(fw+fw_correction_check+cc_flare);

  do_rib_rad(p[52],corner_rad_plinth,0,2,True,zplinth);                // True = make horizontal bottom faces

  do_fillet_rad(p[51],fillet_rad_plinth,0-Pi/2,23,True,zplinth,p[46]);

  do_rib_rad(p[53],rib_rad_plinth,0,30,True,zplinth);
  do_rib_rad(p[54],rib_rad_plinth,Pi/2,9,True,zplinth);

  do_fillet_rad(p[50],fillet_rad_plinth,0,16,True,zplinth,p[47]);

  do_rib_rad(p[55],corner_rad_plinth,pi/2,37,True,zplinth);

  s:=s+crop_dxf_pex( p[0],zplinth, p[1],zplinth,  p[2],zplinth,  p[43],zplinth, 21,0);     // bottom face of jaw between rads...
  s:=s+crop_dxf_pex(p[55],zplinth, p[52],zplinth, p[8],zplinth,  p[37],zplinth, 21,0);
  s:=s+crop_dxf_pex(p[47],zplinth, p[46],zplinth, p[30],zplinth, p[15],zplinth, 21,0);
  s:=s+crop_dxf_pex(p[54],zplinth, p[53],zplinth, p[36],zplinth, p[9],zplinth,  21,0);

  sections[3]:=p;   // plinth x-section completed
  

  // sides of jaw...

  debug_code:=158;


  for i:=0 to 7 do s:=s+crop_dxf_pex(sections[2][i],zseat, sections[2][i+1],zseat, sections[3][i+1],zplinth, sections[3][i],zplinth, 21,0);      // down from seat to plinth...

  for i:=23 to 35 do s:=s+crop_dxf_pex(sections[2][i],zseat, sections[2][i+1],zseat, sections[3][i+1],zplinth, sections[3][i],zplinth, 21,0);

  for i:=9 to 21 do s:=s+crop_dxf_pex(sections[2][i],zseat, sections[2][i+1],zseat, sections[3][i+1],zplinth, sections[3][i],zplinth, 21,0);

  for i:=37 to 42 do s:=s+crop_dxf_pex(sections[2][i],zseat, sections[2][i+1],zseat, sections[3][i+1],zplinth, sections[3][i],zplinth, 21,0);

  s:=s+crop_dxf_pex( sections[2][8],zseat, sections[2][23],zseat, sections[3][23],zplinth, sections[3][8],zplinth, 21,0);

  s:=s+crop_dxf_pex( sections[2][36],zseat, sections[2][9],zseat, sections[3][9],zplinth, sections[3][36],zplinth, 21,0);

  s:=s+crop_dxf_pex( sections[2][22],zseat, sections[2][37],zseat, sections[3][37],zplinth, sections[3][22],zplinth, 21,0);

  s:=s+crop_dxf_pex( sections[2][43],zseat, sections[2][0],zseat, sections[3][0],zplinth, sections[3][43],zplinth, 21,0);                         // back to start

  p:=raw_p;    // reset


        // finally add extra stiffener chunk when cropping ...  237a

  if scylim<>0
     then begin
            lay:=21;   // outer jaw layer

            ztop:=zstand-flange_extra*inscale;
            zbot:=zseat;
            
            s:=s+crop_dxf_pex( sections[0][22],zbot,  sections[0][23],zbot, sections[2][29],zbot, sections[2][16],zbot, lay,0);  // bottom of chunk
            s:=s+crop_dxf_pex( sections[0][13],ztop,  sections[0][32],ztop, sections[2][35],ztop, sections[2][10],ztop, lay,0);  // top of chunk

            s:=s+crop_dxf_pex( sections[0][13],ztop,  sections[2][10],ztop, sections[2][16],zbot, sections[0][22],zbot, lay,0);  // near side of chunk
            s:=s+crop_dxf_pex( sections[0][32],ztop,  sections[2][35],ztop, sections[2][29],zbot, sections[0][23],zbot, lay,0);  // far side of chunk

            s:=s+crop_dxf_pex( sections[2][35],ztop,  sections[2][10],ztop, sections[2][16],zbot, sections[2][29],zbot, lay,0);  // split face of chunk
            s:=s+crop_dxf_pex( sections[0][13],ztop,  sections[0][32],ztop, sections[0][23],zbot, sections[0][22],zbot, lay,0);  // buried face of chunk
          end;


          // 236d add pin on underside of loose outer jaw,  y-zero on outer jaw face ...

  if CC_swap=True
     then begin
            if loose_jaw=True then s:=s+loose_jaw_pin_outer(False,True,0,0-_3d_data.outer_jaw_face*inscale-(fw+fw_correction_check+cc_flare),zplinth,0-shear_k);      // CC inner end of chair
          end
     else begin
            if loose_jaw=True then s:=s+loose_jaw_pin_outer((shear_k<>0),False,0,0-_3d_data.outer_jaw_face*inscale,zplinth,shear_k);      // SC outer   3P switch mid outer
          end;

  s:=s+'  0|ENDBLK|';

  Write(dxf_file,insert_crlf_str(s));

  // end of SC outer

  finally
    creating_block_str:='';
  end;
end;
//______________________________________________________________________________

procedure create_NCSEAT_block(var dxf_file:TextFile);   // 241a  create DXF seat block for NU nose clamp

  // z datum on rail top
  // use control template scale data for the blocks

var
  zseat,zbase,zneck,zraft:extended;

  top_pex1,top_pex2,top_pex3,top_pex4:Tpex;
  bot_pex1,bot_pex2,bot_pex3,bot_pex4:Tpex;
  neck_pex1,neck_pex2,neck_pex3,neck_pex4:Tpex;

  half_width:extended;
  outer_length,inner_length:extended;
  chamf,neck:extended;

  s:string;

  plug_extended_depth:extended;  // 241b

begin
  if dxf_form.clip_fit_radio.Checked=True                         // 241b
     then plug_extended_depth:=clip_plug_extended_depth
     else if dxf_form.snap_fit_radio.Checked=True
             then plug_extended_depth:=snap_plug_extended_depth
             else plug_extended_depth:=press_plug_extended_depth;

  if _3d=False then EXIT;       // not in 2-D files

  if exp_chairing=False then EXIT;  // temp experimental

  zseat:=0-rail_section_data_mm.rail_depth_mm;    // down to rail seat level   use control template scaling for the blocks

  zbase:=zseat-seat_thick*inscale;    // down to timber top

  zneck:=zbase-1.25*inscale;          // 1.25" arbitrary   support neck

  if scale>4.05
     then zraft:=zbase-plug_extended_depth*inscale-pyramid_height_high-inscale/32   //  1/32" integrity overlap
     else zraft:=zbase-plug_extended_depth*inscale-pyramid_height_low-inscale/32;   //  1/32" integrity overlap

  half_width:=3.5*inscale;      // seat 7" wide

  outer_length:=rail_section_data_mm.rail_foot_width_mm*2/3;     // 2/3rds of rail

  inner_length:=outer_length+fw*2;

  chamf:=seat_thick*inscale/3;  // arbitrary
  neck:=1.25*inscale;           // 1.25" arbitrary

  creating_block_str:='NCSEAT';

  top_pex1.x:=0-half_width;            // top of seat ...
  top_pex1.y:=0-outer_length;

  top_pex2.x:=0-half_width;
  top_pex2.y:=inner_length;

  top_pex3.x:=half_width;
  top_pex3.y:=inner_length;

  top_pex4.x:=half_width;
  top_pex4.y:=0-outer_length;


  bot_pex1.x:=0-half_width;             // underside of seat, and base of support pyramid ...
  bot_pex1.y:=0-outer_length+chamf;

  bot_pex2.x:=0-half_width;
  bot_pex2.y:=inner_length;

  bot_pex3.x:=half_width;
  bot_pex3.y:=inner_length;

  bot_pex4.x:=half_width;
  bot_pex4.y:=0-outer_length+chamf;


  neck_pex1.x:=0-half_width+neck;             // support break-off ...
  neck_pex1.y:=0-outer_length+chamf+neck;

  neck_pex2.x:=0-half_width+neck;
  neck_pex2.y:=inner_length-neck;

  neck_pex3.x:=half_width-neck;
  neck_pex3.y:=inner_length-neck;

  neck_pex4.x:=half_width-neck;
  neck_pex4.y:=0-outer_length+chamf+neck;


  try
    if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);

    s:='  0|BLOCK|  2|'+creating_block_str+'|';

    s:=s+do_a_pyramid(top_pex1,top_pex2,top_pex3,top_pex4,bot_pex1,bot_pex2,bot_pex3,bot_pex4,zseat,zbase,18);    // seat, clockwise from south-west

    if dxf_form.pyramids_checkbox.Checked=True      // add support pyramid  (unlike chairs, support is part of inserted block, not 2D)
       then begin
              s:=s+do_a_pyramid(bot_pex1,bot_pex2,bot_pex3,bot_pex4,neck_pex1,neck_pex2,neck_pex3,neck_pex4,zbase,zneck,18);    // down to neck
              s:=s+do_a_pyramid(neck_pex1,neck_pex2,neck_pex3,neck_pex4,bot_pex1,bot_pex2,bot_pex3,bot_pex4,zneck,zraft,35);    // down to raft
          end;

    s:=s+'  0|ENDBLK|';

    Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;

end;
//______________________________________________________________________________


procedure create_NXSEAT_block(var dxf_file:TextFile);   // 241a  create DXF seat block for NX gap filler -- no actual seat, just the support

  // z datum on rail top
  // use control template scale data for the blocks

var
  zneck,zraft:extended;

  bot_pex1,bot_pex2,bot_pex3,bot_pex4:Tpex;
  neck_pex1,neck_pex2,neck_pex3,neck_pex4:Tpex;

  half_width:extended;
  outer_length,inner_length:extended;

  neckw,neckl:extended;

  s:string;

  plug_extended_depth:extended;  // 241b

begin
  if dxf_form.clip_fit_radio.Checked=True                         // 241b
     then plug_extended_depth:=clip_plug_extended_depth
     else if dxf_form.snap_fit_radio.Checked=True
             then plug_extended_depth:=snap_plug_extended_depth
             else plug_extended_depth:=press_plug_extended_depth;

  if _3d=False then EXIT;       // not in 2-D files

  if exp_chairing=False then EXIT;  // temp experimental

  zneck:=0-rail_section_data_mm.rail_depth_mm-inscale/2;    // down 1/2" below rail

  if scale>4.05
     then zraft:=0-rail_section_data_mm.rail_depth_mm-seat_thick*inscale-plug_extended_depth*inscale-pyramid_height_high-inscale/32   //  1/32" integrity overlap
     else zraft:=0-rail_section_data_mm.rail_depth_mm-seat_thick*inscale-plug_extended_depth*inscale-pyramid_height_low-inscale/32;   //  1/32" integrity overlap

  half_width:=4*inscale;      // 8" wide at raft

  outer_length:=inscale;

  inner_length:=fw*2+inscale/2;

  neckw:=5*inscale/4;    // arbitrary on width
  neckl:=2*inscale;      // arbitrary on length

  creating_block_str:='NXSEAT';


  bot_pex1.x:=0-half_width;             // base of support pyramid ...
  bot_pex1.y:=0-outer_length;

  bot_pex2.x:=0-half_width;
  bot_pex2.y:=inner_length;

  bot_pex3.x:=half_width;
  bot_pex3.y:=inner_length;

  bot_pex4.x:=half_width;
  bot_pex4.y:=0-outer_length;


  neck_pex1.x:=0-half_width+neckw;             // support break-off ...
  neck_pex1.y:=0-outer_length+neckl;

  neck_pex2.x:=0-half_width+neckw;
  neck_pex2.y:=inner_length-neckl;

  neck_pex3.x:=half_width-neckw;
  neck_pex3.y:=inner_length-neckl;

  neck_pex4.x:=half_width-neckw;
  neck_pex4.y:=0-outer_length+neckl;


  try
    if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);

    s:='  0|BLOCK|  2|'+creating_block_str+'|';

    if dxf_form.pyramids_checkbox.Checked=True      // add support pyramid  (unlike chairs, support is part of inserted block, not 2D)
       then begin
              s:=s+do_a_pyramid(neck_pex1,neck_pex2,neck_pex3,neck_pex4,bot_pex1,bot_pex2,bot_pex3,bot_pex4,zneck,zraft,35);    // down to raft
            end;

    s:=s+'  0|ENDBLK|';

    Write(dxf_file,insert_crlf_str(s));

  finally
    creating_block_str:='';
  end;

end;
//______________________________________________________________________________

procedure create_1PRL_seat_block(var dxf_file:TextFile);   // 233d  create DXF seat block for 1PRL switch block slide chairs

  // z datum on rail top
  // use control template scale data for the blocks

var
  p:array[0..25] of Tpex;
  n,ny:integer;

  table_rad,kstep:extended;

  foot_offset:extended;

  zseat,zbase:extended;

  s:string;

begin

  if _3d=False then EXIT;       // not in 2-D files

  if exp_chairing=False then EXIT;  // temp experimental

  with _3d_data do begin

    foot_offset:=(rail_section_data_mm.rail_foot_width_mm-rail_section_data_mm.rail_head_width_mm)/2;

    table_rad:=PLR1_table_corner_radius*inscale;

    kstep:=Pi/12;  // 15 deg steps

     // rad centres...

    p[25].x:=(PLR1_table_top_halfwide-PLR1_table_corner_radius)*inscale;
    p[24].x:=0-p[25].x;

    p[25].y:=PLR1_table_rad_centres_from_gauge_face*inscale;
    p[24].y:=p[25].y;

     //=====================

            // these not used ...

            p[0].x:=0-_2d_data.P_chair_halfwide*inscale;
            p[0].y:=foot_offset-rail_section_data_mm.rail_foot_width_mm;

            p[1].x:=p[0].x;
            p[1].y:=foot_offset;

            p[20].x:=0-p[1].x;
            p[20].y:=p[1].y;

            p[21].x:=0-p[0].x;
            p[21].y:=p[0].y;

     //======================

    p[2].x:=0-PLR1_seat_top_halfwide*inscale;
    p[2].y:=foot_offset;

    p[23].x:=p[2].x;
    p[23].y:=p[2].y-rail_section_data_mm.rail_foot_width_mm;

    p[3].x:=0-PLR1_table_top_halfwide*inscale;
    p[3].y:=p[2].y+inscale/2;

    for n:=4 to 10 do begin

      p[n].x:=p[24].x-table_rad*COS((n-4)*kstep);
      p[n].y:=p[24].y+table_rad*SIN((n-4)*kstep);

    end;//next

    for n:=11 to 17 do begin

      p[n].x:=p[25].x-table_rad*COS((n-5)*kstep);
      p[n].y:=p[25].y+table_rad*SIN((n-5)*kstep);

    end;//next


    p[18].x:=0-p[3].x;
    p[18].y:=p[3].y;

    p[19].x:=0-p[2].x;
    p[19].y:=p[2].y;

    p[22].x:=0-p[23].x;
    p[22].y:=p[23].y;

    zseat:=0-rail_section_data_mm.rail_depth_mm;    // down to rail seat level   use control template scaling for the blocks

    zbase:=zseat-seat_thick*inscale+chair_edge_thick*inscale;    // down to top of chair edge

    creating_block_str:='PLR1SEAT';

    try
      if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);

      s:='  0|BLOCK|  2|'+creating_block_str+'|';

      debug_code:=159;

      s:=s+dxf_3dface_pex( p[2],zseat, p[19],zseat, p[22],zseat,  p[23],zseat, 18,0);   // rail seat top under rail
      s:=s+dxf_3dface_pex( p[2],zbase, p[19],zbase, p[22],zbase,  p[23],zbase, 18,0);   // bottom face

      s:=s+dxf_3dface_pex(p[22],zseat, p[22],zbase, p[23],zbase,  p[23],zseat, 18,0);  // south face under rail (outer jaw)

      s:=s+dxf_3dface_pex( p[2],zseat, p[2],zbase,  p[23],zbase, p[23],zseat, 18,0);   // west end under rail
      s:=s+dxf_3dface_pex(p[19],zseat, p[19],zbase, p[22],zbase, p[22],zseat, 18,0);   // east end under rail

      for n:=2 to 18 do s:=s+dxf_3dface_pex( p[n],zseat, p[n],zbase, p[n+1],zbase, p[n+1],zseat, 18,0);   // remaining sides of table

        // table top ...

      s:=s+dxf_3dface_pex( p[2],zseat, p[3],zseat, p[18],zseat,  p[19],zseat, 18,0);
      s:=s+dxf_3dface_pex( p[3],zseat, p[4],zseat, p[17],zseat,  p[18],zseat, 18,0);

      for n:=4 to 9 do s:=s+dxf_3dface_pex( p[n],zseat, p[n+1],zseat, p[24],zseat,  p[24],zseat, 18,0);    // west table corner

      s:=s+dxf_3dface_pex( p[24],zseat, p[10],zseat, p[11],zseat,  p[25],zseat, 18,0);    // between corners

      for n:=11 to 16 do s:=s+dxf_3dface_pex( p[n],zseat, p[n+1],zseat, p[25],zseat,  p[25],zseat, 18,0);  // east table corner

        // table bottom face ...

      s:=s+dxf_3dface_pex( p[2],zbase, p[3],zbase, p[18],zbase,  p[19],zbase, 18,0);
      s:=s+dxf_3dface_pex( p[3],zbase, p[4],zbase, p[17],zbase,  p[18],zbase, 18,0);

      for n:=4 to 9 do s:=s+dxf_3dface_pex( p[n],zbase, p[n+1],zbase, p[24],zbase,  p[24],zbase, 18,0);    // west table corner

      s:=s+dxf_3dface_pex( p[24],zbase, p[10],zbase, p[11],zbase,  p[25],zbase, 18,0);    // between corners

      for n:=11 to 16 do s:=s+dxf_3dface_pex( p[n],zbase, p[n+1],zbase, p[25],zbase,  p[25],zbase, 18,0);  // east table corner


      s:=s+'  0|ENDBLK|';

      Write(dxf_file,insert_crlf_str(s));

    finally
      creating_block_str:='';
    end;

  end;//with

end;
//______________________________________________________________________________

procedure create_P_seat_block(var dxf_file:TextFile);   // 233c  create DXF block for P slide chair seat (slide table)

  // z datum on rail top
  // use control template scale data for the blocks

var
  p:array[0..35] of Tpex;
  n,ny:integer;

  table_rad,kstep:extended;

  foot_offset:extended;

  zseat,zbase:extended;

  s:string;

begin
  if _3d=False then EXIT;       // not in 2-D files

  if exp_chairing=False then EXIT;  // temp experimental

  with _3d_data do begin

    foot_offset:=(rail_section_data_mm.rail_foot_width_mm-rail_section_data_mm.rail_head_width_mm)/2;

    table_rad:=P_seat_table_radius*inscale;

    kstep:=Pi/24;  // 7.5 deg steps

    p[35].x:=0;       // rad centre ..
    p[35].y:=(_2d_data.P_chair_inlong_mod-P_table_rad_centre_from_end)*inscale;

     //=====================

            // these not used ...

            p[0].x:=0-_2d_data.P_chair_halfwide*inscale;
            p[0].y:=foot_offset-rail_section_data_mm.rail_foot_width_mm;

            p[1].x:=p[0].x;
            p[1].y:=foot_offset;

            p[31].x:=0-p[1].x;
            p[31].y:=p[1].y;

            p[32].x:=0-p[0].x;
            p[32].y:=p[0].y;

     //======================

    p[2].x:=0-P_seat_top_halfwide*inscale;
    p[2].y:=foot_offset;

    p[34].x:=p[2].x;
    p[34].y:=p[2].y-rail_section_data_mm.rail_foot_width_mm;

    p[3].x:=0-table_rad;
    p[3].y:=p[2].y+inscale/2;

    for n:=4 to 28 do begin

      p[n].x:=p[35].x-table_rad*COS((n-4)*kstep);
      p[n].y:=p[35].y+table_rad*SIN((n-4)*kstep);

    end;//next

    p[29].x:=0-p[3].x;
    p[29].y:=p[3].y;

    p[30].x:=0-p[2].x;
    p[30].y:=p[2].y;

    p[33].x:=0-p[34].x;
    p[33].y:=p[34].y;

    zseat:=0-rail_section_data_mm.rail_depth_mm;    // down to rail seat level   use control template scaling for the blocks

    zbase:=zseat-seat_thick*inscale+chair_edge_thick*inscale;    // down to top of chair edge

    creating_block_str:='PSEAT';

    try
      if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);

      s:='  0|BLOCK|  2|'+creating_block_str+'|';

      debug_code:=160;

      s:=s+dxf_3dface_pex( p[2],zseat, p[30],zseat, p[33],zseat,  p[34],zseat, 18,0);   // rail seat top under rail
      s:=s+dxf_3dface_pex( p[2],zbase, p[30],zbase, p[33],zbase,  p[34],zbase, 18,0);   // bottom face

      s:=s+dxf_3dface_pex(p[33],zseat, p[33],zbase, p[34],zbase,  p[34],zseat, 18,0);  // south face under rail (outer jaw)

      s:=s+dxf_3dface_pex( p[2],zseat, p[2],zbase,  p[34],zbase, p[34],zseat, 18,0);   // west end under rail
      s:=s+dxf_3dface_pex(p[30],zseat, p[30],zbase, p[33],zbase, p[33],zseat, 18,0);   // east end under rail

      for n:=2 to 29 do s:=s+dxf_3dface_pex( p[n],zseat, p[n],zbase, p[n+1],zbase, p[n+1],zseat, 18,0);   // remaining sides of table

        // table top ...

      s:=s+dxf_3dface_pex( p[2],zseat, p[3],zseat, p[29],zseat,  p[30],zseat, 18,0);
      s:=s+dxf_3dface_pex( p[3],zseat, p[4],zseat, p[28],zseat,  p[29],zseat, 18,0);

      for n:=4 to 27 do s:=s+dxf_3dface_pex( p[n],zseat, p[n+1],zseat, p[35],zseat,  p[35],zseat, 18,0);

        // table bottom face ...

      s:=s+dxf_3dface_pex( p[2],zbase, p[3],zbase, p[29],zbase,  p[30],zbase, 18,0);
      s:=s+dxf_3dface_pex( p[3],zbase, p[4],zbase, p[28],zbase,  p[29],zbase, 18,0);

      for n:=4 to 27 do s:=s+dxf_3dface_pex( p[n],zbase, p[n+1],zbase, p[35],zbase,  p[35],zbase, 18,0);

      s:=s+'  0|ENDBLK|';

      Write(dxf_file,insert_crlf_str(s));

    finally
      creating_block_str:='';
    end;

  end;//with
end;
//______________________________________________________________________________

procedure create_S1_S1J_L1_CC_seat_block(S1J,L1,CC,under_check,PLR3,ZY,XN,XA,AA:boolean; seat_str:string; var dxf_file:TextFile);   // create DXF block for chair seat insert  S1, S1J, L1, CC, PLR3, ZY, XN, XA

  // z datum on rail top

  // use control template scaling data for the blocks

  // under_check=rotate seat to be under check rail

var
  p:array[0..19] of Tpex;
  n,ny:integer;

  layer:integer;

  jaw_halfwidth_seat:extended;  // mm

  foot_offset:extended;  // mm  228b

  zseat,zpnth,zbase,z_off:extended;

  chunk_half_width:extended;

  shorten_under_check_rail:extended;

  merge_extra,dd_trim:extended;


  zraft:extended;

  bot_pex1,bot_pex2,bot_pex3,bot_pex4:Tpex;
  neck_pex1,neck_pex2,neck_pex3,neck_pex4:Tpex;

  neckw,neckl:extended;


  s:string;

  plug_extended_depth:extended;  // 241b

begin
  if dxf_form.clip_fit_radio.Checked=True                         // 241b
     then plug_extended_depth:=clip_plug_extended_depth
     else if dxf_form.snap_fit_radio.Checked=True
             then plug_extended_depth:=snap_plug_extended_depth
             else plug_extended_depth:=press_plug_extended_depth;

  if _3d=False then EXIT;       // not in 2-D files

  if exp_chairing=False then EXIT;  // temp experimental

  merge_extra:=0; // init  239b
  dd_trim:=0;

  with _3d_data do begin

    with rail_section_data_mm do foot_offset:=(rail_foot_width_mm-rail_head_width_mm)/2;  // 223a

    jaw_halfwidth_seat:=(S1_outjaw_half_rib_space_seat+S1_outjaw_rib_width_seat)*inscale;     // jaw half-width at seat

    with rail_section_data_mm do begin

      if S1J=True
         then p[0].x:=0-_2d_data.S1J_chair_halfwide*inscale+inscale/16      // 1/16" inside edge to ensure no overlaps when curved
         else if XN=True
                 then p[0].x:=0-_2d_data.XN_chair_halfwide*inscale+inscale/16      // 1/16" inside edge to ensure no overlaps when curved
                 else p[0].x:=0-_2d_data.S1_chair_halfwide*inscale+inscale/16;     // 1/16" inside edge to ensure no overlaps when curved

      p[0].y:=foot_offset-rail_foot_width_mm;

      if S1J=True
         then p[1].x:=0-_2d_data.S1J_chair_halfwide*inscale+inscale/16
         else if XN=True
                 then p[1].x:=0-_2d_data.XN_chair_halfwide*inscale+inscale/16
                 else p[1].x:=0-_2d_data.S1_chair_halfwide*inscale+inscale/16;

      p[1].y:=foot_offset;

            // these no longer used...

            p[2].x:=0;
            p[2].y:=0;

            p[3].x:=0;
            p[3].y:=0;

            p[4].x:=0;
            p[4].y:=0;

            p[5].x:=0;
            p[5].y:=0;

      if S1J=True
         then p[6].x:=_2d_data.S1J_chair_halfwide*inscale-inscale/16
         else if XN=True
                 then p[6].x:=_2d_data.XN_chair_halfwide*inscale-inscale/16
                 else p[6].x:=_2d_data.S1_chair_halfwide*inscale-inscale/16;

      p[6].y:=foot_offset;

      if S1J=True
         then p[7].x:=_2d_data.S1J_chair_halfwide*inscale-inscale/16
         else if XN=True
                 then p[7].x:=_2d_data.XN_chair_halfwide*inscale-inscale/16
                 else p[7].x:=_2d_data.S1_chair_halfwide*inscale-inscale/16;

      p[7].y:=foot_offset-rail_foot_width_mm;

      p[8].x:=jaw_halfwidth_seat;
      p[8].y:=foot_offset-rail_foot_width_mm;

      p[9].x:=jaw_halfwidth_seat;
      p[9].y:=0-outer_jaw_face*inscale;

      p[10].x:=0-jaw_halfwidth_seat;
      p[10].y:=0-outer_jaw_face*inscale;

      p[11].x:=0-jaw_halfwidth_seat;
      p[11].y:=foot_offset-rail_foot_width_mm;

      if S1J=True
         then p[12].x:=0-S1J_seat_top_halfwide*inscale
         else p[12].x:=0-S1_seat_top_halfwide*inscale;     // S1 seat top is almost full chair width ...

      p[12].y:=p[0].y;

      if S1J=True
         then p[13].x:=0-S1J_seat_top_halfwide*inscale
         else p[13].x:=0-S1_seat_top_halfwide*inscale;

      p[13].y:=p[1].y;

      if S1J=True
         then p[14].x:=S1J_seat_top_halfwide*inscale
         else p[14].x:=S1_seat_top_halfwide*inscale;

      p[14].y:=p[6].y;

      if S1J=True
         then p[15].x:=S1J_seat_top_halfwide*inscale
         else p[15].x:=S1_seat_top_halfwide*inscale;

      p[15].y:=p[7].y;

      if S1J=True
         then p[16].x:=0-_2d_data.S1J_chair_halfwide*inscale+_3d_data.chair_plinth_spacing*inscale    // plinth
         else p[16].x:=0-_2d_data.S1_chair_halfwide*inscale+_3d_data.chair_plinth_spacing*inscale;    // plinth

      p[16].y:=p[10].y;

            // these no longer used...

            p[17].x:=0;
            p[17].y:=0;

            p[18].x:=0;
            p[18].y:=0;

      if S1J=True
         then p[19].x:=_2d_data.S1J_chair_halfwide*inscale-_3d_data.chair_plinth_spacing*inscale    // plinth
         else p[19].x:=_2d_data.S1_chair_halfwide*inscale-_3d_data.chair_plinth_spacing*inscale;    // plinth

      p[19].y:=p[9].y;

    end;//with

    if PLR3=True        // 237a over-rides       shorten seat to allow for skewed rail      3P..11P
       then begin
              p[0].x:=0-(_2d_data.PLR3_chair_halfwide-5/16)*inscale;        // shorten by 5/16" each side ...
              p[1].x:=0-(_2d_data.PLR3_chair_halfwide-5/16)*inscale;
              p[6].x:=(_2d_data.PLR3_chair_halfwide-5/16)*inscale;
              p[7].x:=(_2d_data.PLR3_chair_halfwide-5/16)*inscale;

              p[8].x:=(_2d_data.PLR3_chair_halfwide-1)*inscale;      // full plinth width ...
              p[9].x:=(_2d_data.PLR3_chair_halfwide-1)*inscale;
              p[10].x:=0-(_2d_data.PLR3_chair_halfwide-1)*inscale;
              p[11].x:=0-(_2d_data.PLR3_chair_halfwide-1)*inscale;

              p[12].x:=0-_2d_data.PLR3_seat_top_halfwide*inscale;
              p[13].x:=0-_2d_data.PLR3_seat_top_halfwide*inscale;
              p[14].x:=_2d_data.PLR3_seat_top_halfwide*inscale;
              p[15].x:=_2d_data.PLR3_seat_top_halfwide*inscale;
            end;


    if ZY=True        // 239a over-rides       shorten seat to allow for skewed rail   ZY wing front and other crossing chairs, and BC chairs
       then begin
              p[0].x:=0-(_2d_data.X_chair_halfwide-7/8)*inscale;        // shorten by 7/8" each side ...
              p[1].x:=0-(_2d_data.X_chair_halfwide-7/8)*inscale;
              p[6].x:=(_2d_data.X_chair_halfwide-7/8)*inscale;
              p[7].x:=(_2d_data.X_chair_halfwide-7/8)*inscale;

              p[8].x:=(_2d_data.X_chair_halfwide-1)*inscale;      // full plinth width ...
              p[9].x:=(_2d_data.X_chair_halfwide-1)*inscale;
              p[10].x:=0-(_2d_data.X_chair_halfwide-1)*inscale;
              p[11].x:=0-(_2d_data.X_chair_halfwide-1)*inscale;

              p[12].x:=0-_2d_data.X_seat_top_halfwide*inscale;
              p[13].x:=0-_2d_data.X_seat_top_halfwide*inscale;
              p[14].x:=_2d_data.X_seat_top_halfwide*inscale;
              p[15].x:=_2d_data.X_seat_top_halfwide*inscale;
            end;

    if XN=True        // 239a over-rides       wider seat on XN knuckle chairs
       then begin
              p[8].x:=(_2d_data.XN_chair_halfwide-1)*inscale;      // full plinth width ...
              p[9].x:=(_2d_data.XN_chair_halfwide-1)*inscale;
              p[10].x:=0-(_2d_data.XN_chair_halfwide-1)*inscale;
              p[11].x:=0-(_2d_data.XN_chair_halfwide-1)*inscale;

              p[12].x:=0-_2d_data.XN_seat_top_halfwide*inscale;
              p[13].x:=0-_2d_data.XN_seat_top_halfwide*inscale;
              p[14].x:=_2d_data.XN_seat_top_halfwide*inscale;
              p[15].x:=_2d_data.XN_seat_top_halfwide*inscale;

              p[16].x:=0-_2d_data.XN_chair_halfwide*inscale+_3d_data.chair_plinth_spacing*inscale;  // plinth
              p[19].x:=_2d_data.XN_chair_halfwide*inscale-_3d_data.chair_plinth_spacing*inscale;    // plinth


              p[1].y:=p[1].y+fw;   // merge seats for XN chair, full fw for integrity overlap ...
              p[13].y:=p[13].y+fw;
              p[14].y:=p[14].y+fw;
              p[6].y:=p[6].y+fw;

            end;


    if (XA=True) or (AA=True)        // 239a over-rides       wider seat on XA gap chairs, AA nose chairs but allow for skew
       then begin
              p[0].x:=0-(_2d_data.XA_chair_halfwide-1)*inscale;        // 1" inside base width ...
              p[1].x:=0-(_2d_data.XA_chair_halfwide-1)*inscale;
              p[6].x:=(_2d_data.XA_chair_halfwide-1)*inscale;
              p[7].x:=(_2d_data.XA_chair_halfwide-1)*inscale;

              p[8].x:=(_2d_data.XA_chair_halfwide-2)*inscale;      // below key  narrower than XN ...
              p[9].x:=(_2d_data.XA_chair_halfwide-2)*inscale;
              p[10].x:=0-(_2d_data.XA_chair_halfwide-2)*inscale;
              p[11].x:=0-(_2d_data.XA_chair_halfwide-2)*inscale;

              p[12].x:=0-_2d_data.XA_seat_top_halfwide*inscale;
              p[13].x:=0-_2d_data.XA_seat_top_halfwide*inscale;
              p[14].x:=_2d_data.XA_seat_top_halfwide*inscale;
              p[15].x:=_2d_data.XA_seat_top_halfwide*inscale;

              p[16].x:=0-_2d_data.XA_chair_halfwide*inscale+_3d_data.chair_plinth_spacing*inscale;  // plinth
              p[19].x:=_2d_data.XA_chair_halfwide*inscale-_3d_data.chair_plinth_spacing*inscale;    // plinth


              if XA=True
                 then begin
                        p[1].y:=p[1].y+(fw+fw_tweak_xing)+inscale/8;   // merge seats for XA chair, full fw   1/8" for integrity overlap ...
                        p[13].y:=p[13].y+(fw+fw_tweak_xing)+inscale/8;
                        p[14].y:=p[14].y+(fw+fw_tweak_xing)+inscale/8;
                        p[6].y:=p[6].y+(fw+fw_tweak_xing)+inscale/8;
                      end;

              if AA=True
                 then begin
                        if seat_str='ABSEAT'
                           then merge_extra:=inscale*5.25 // merge seats for AB,BB chair, full fw   5.25" arbitrary merge
                           else merge_extra:=inscale/2;   // merge seats for AA chair, full fw   1/2" arbitrary partial merge   for glue slot

                        p[1].y:=p[1].y+(fw+fw_tweak_xing)+merge_extra;
                        p[13].y:=p[13].y+(fw+fw_tweak_xing)+merge_extra;
                        p[14].y:=p[14].y+(fw+fw_tweak_xing)+merge_extra;
                        p[6].y:=p[6].y+(fw+fw_tweak_xing)+merge_extra;
                      end;
            end;

    if (ZY=True) and (seat_str='BCSEAT')      // 241a
       then begin
              merge_extra:=inscale*5;  // merge seats for BC chair, full fw   5" arbitrary merge   BC is narower than BB

              p[1].y:=p[1].y+(fw+fw_tweak_xing)+merge_extra;
              p[13].y:=p[13].y+(fw+fw_tweak_xing)+merge_extra;
              p[14].y:=p[14].y+(fw+fw_tweak_xing)+merge_extra;
              p[6].y:=p[6].y+(fw+fw_tweak_xing)+merge_extra;
            end;

    if (ZY=True) and (seat_str='DDSEAT')      // 241a   // trim seat to centre-line of rail
       then begin
              dd_trim:=0-rail_section_data_mm.rail_head_width_mm/2;

              p[0].y:=dd_trim;
              p[7].y:=dd_trim;
              p[8].y:=dd_trim;
              p[9].y:=dd_trim;
              p[10].y:=dd_trim;
              p[11].y:=dd_trim;
              p[12].y:=dd_trim;
              p[15].y:=dd_trim;
              p[16].y:=dd_trim;
              p[19].y:=dd_trim;

            end;

    if (ZY=True) and ((seat_str='DXSEAT') or (seat_str='DXSEATL'))     // 241a   // trim insert seat to centre-line of rail with assembly clearance
       then begin
              dd_trim:=0-rail_section_data_mm.rail_head_width_mm/2;

              if seat_str='DXSEATL'
                 then dd_trim:=dd_trim-inscale/16    // 1/16" assembly clearance if loose
                 else dd_trim:=dd_trim+inscale/16;   // 1/16" integrity overlap if fixed

              p[1].y:=dd_trim;
              p[6].y:=dd_trim;
              p[13].y:=dd_trim;
              p[14].y:=dd_trim;


              dd_trim:=0-rail_section_data_mm.rail_head_width_mm*2;

              p[0].y:=dd_trim;
              p[7].y:=dd_trim;
              p[8].y:=dd_trim;
              p[9].y:=dd_trim;
              p[10].y:=dd_trim;
              p[11].y:=dd_trim;
              p[12].y:=dd_trim;
              p[15].y:=dd_trim;
              p[16].y:=dd_trim;
              p[19].y:=dd_trim;

            end;


    shorten_under_check_rail:=inscale;             // shorten seat by 1" each side ...

    if (CC=True) and (under_check=True)   // 237b over-rides  seat under check rail - rail not load bearing - narrower to allow skewed check ends
       then begin
              p[0].x:=p[0].x+shorten_under_check_rail;
              p[1].x:=p[1].x+shorten_under_check_rail;
              p[6].x:=p[6].x-shorten_under_check_rail;
              p[7].x:=p[7].x-shorten_under_check_rail;

              p[12].x:=p[12].x+shorten_under_check_rail;
              p[13].x:=p[13].x+shorten_under_check_rail;
              p[14].x:=p[14].x-shorten_under_check_rail;
              p[15].x:=p[15].x-shorten_under_check_rail;


              for ny:=0 to 19 do p[ny].y:=0-p[ny].y+(fw);     // 223a
            end;

    zseat:=0-rail_section_data_mm.rail_depth_mm;    // down to rail seat level   use control template scaling for the blocks

    zbase:=zseat-seat_thick*inscale+chair_edge_thick*inscale;    // down to top of chair edge
    zpnth:=zseat-seat_thick*inscale+chair_plinth_thick*inscale;  // down to level of plinth

       // over-rides ...

    if L1=True
       then begin
              zbase:=zseat-seat_thick*inscale+L1_chair_edge_thick*inscale;
              zpnth:=zseat-seat_thick*inscale+L1_chair_plinth_thick*inscale;
            end;

    if CC=True
       then begin
              zbase:=zseat-seat_thick*inscale+SC_CC_chair_edge_thick*inscale;
              zpnth:=zseat-seat_thick*inscale+SC_CC_chair_plinth_thick*inscale;
            end;

    chunk_half_width:=(S1_outjaw_half_width_mid-0.5)*inscale;     // recessed 1/2" each end  from jaw half-width at mid section to allow offset key

    if L1=true
       then creating_block_str:='L1SEAT'
       else if S1J=True
               then creating_block_str:='S1JSEAT'    // 233d
               else if CC=True
                       then begin                    // 237a
                              if under_check=True
                                 then creating_block_str:='CCSEATCK'     // under CC check rail
                                 else creating_block_str:='SCCCSEAT';    // under CC stock rail
                            end
                       else if PLR3=True
                               then creating_block_str:='PLR3SEAT'   // 237a
                               else if ZY=True
                                       then creating_block_str:='ZYSEAT'    // 239a
                                       else if XN=True
                                               then creating_block_str:='XNSEAT'    // 239a
                                               else if XA=True
                                                       then creating_block_str:='XASEAT'    // 239a
                                                       else if AA=True
                                                               then creating_block_str:='AASEAT'    // 239b
                                                               else creating_block_str:='S1SEAT';   // 227a

    if seat_str<>'' then creating_block_str:=seat_str;  // 239b overide if provided

    try
      if stl=True then stl_block_list.AddObject(creating_block_str,TObjectList.Create);  // 227a

      s:='  0|BLOCK|  2|'+creating_block_str+'|';

      debug_code:=161;

      if (ZY=True) and ((seat_str='DXSEAT') or (seat_str='DXSEATL'))
         then begin
                layer:=21;                // part of outer jaw for loose insert
                if seat_str='DXSEAT'
                   then zbase:=zpnth      // overide - fixed DX insert
                   else begin
                          zpnth:=zpnth+inscale/8;  // overide  - loose DX insert slides over plinth, clearance 1/8"
                          zbase:=zpnth;

                          z_off:=7*inscale;   // drop  7" scale closer to raft

                          zseat:=zseat-z_off;
                          zpnth:=zpnth-z_off;
                          zbase:=zbase-z_off;

                                // add support pyramid ...

                          if dxf_form.pyramids_checkbox.Checked=True      // add support pyramid  (unlike chairs, support is part of inserted block, not 2D)
                             then begin
                                    neckw:=inscale*3/4;   // 3/4" break-off all round
                                    neckl:=inscale*3/4;

                                    neck_pex1.x:=p[1].x+neckw;
                                    neck_pex1.y:=p[1].y-neckl;

                                    neck_pex2.x:=p[6].x-neckw;
                                    neck_pex2.y:=p[6].y-neckl;

                                    neck_pex3.x:=p[7].x-neckw;
                                    neck_pex3.y:=p[7].y+neckl*1.5;

                                    neck_pex4.x:=p[0].x+neckw;
                                    neck_pex4.y:=p[0].y+neckl*1.5;

                                    bot_pex1:=p[1];
                                    bot_pex2:=p[6];
                                    bot_pex3:=p[7];
                                    bot_pex4:=p[0];


                                    if scale>4.05
                                       then zraft:=0-rail_section_data_mm.rail_depth_mm-seat_thick*inscale-plug_extended_depth*inscale-pyramid_height_high-inscale/32   // 1/32" integrity overlap
                                       else zraft:=0-rail_section_data_mm.rail_depth_mm-seat_thick*inscale-plug_extended_depth*inscale-pyramid_height_low-inscale/32;   // 1/32" integrity overlap

                                    s:=s+do_a_pyramid(neck_pex1,neck_pex2,neck_pex3,neck_pex4,bot_pex1,bot_pex2,bot_pex3,bot_pex4,zbase,zraft,35);          // pyramid down to raft
                                  end;

                        end;
              end
         else layer:=18;  // seat layer


      s:=s+dxf_3dface(    p[1].x,p[1].y,zbase,   p[6].x,p[6].y,zbase,   p[7].x,p[7].y,zbase,    p[0].x,p[0].y,zbase, layer,0);   // seat bottom under rail   239b

      s:=s+dxf_3dface(  p[16].x,p[16].y,zpnth, p[19].x,p[19].y,zpnth,   p[7].x,p[7].y,zbase,    p[0].x,p[0].y,zbase, layer,0);   // seat bottom under key   239b

      s:=s+dxf_3dface( p[13].x, p[13].y,zseat, p[14].x,p[14].y,zseat, p[15].x,p[15].y,zseat,  p[12].x,p[12].y,zseat, layer,0);   // rail seat top under rail

      s:=s+dxf_3dface(p[11].x,p[11].y,zseat, p[8].x,p[8].y,zseat, p[9].x,p[9].y,zseat, p[10].x,p[10].y,zseat, layer,0);   // rail seat top under key

      if fill_below_key=True      // add filler chunk ...
         then begin
                s:=s+dxf_3dface(0-chunk_half_width,p[11].y,zseat,   chunk_half_width,p[8].y,zseat,   chunk_half_width,p[9].y,zseat,   0-chunk_half_width,p[10].y,zseat,   layer,0);   // bottom of chunk (as rail seat top under key)
                s:=s+dxf_3dface(0-chunk_half_width,p[11].y,zkeybot, chunk_half_width,p[8].y,zkeybot, chunk_half_width,p[9].y,zkeybot, 0-chunk_half_width,p[10].y,zkeybot, layer,0);   // top of chunk

                s:=s+dxf_3dface(0-chunk_half_width,p[11].y,zkeybot, chunk_half_width,p[8].y,zkeybot, chunk_half_width,p[8].y,zseat, 0-chunk_half_width,p[11].y,zseat, layer,0);    // north face of chunk
                s:=s+dxf_3dface(0-chunk_half_width,p[10].y,zkeybot, chunk_half_width,p[9].y,zkeybot, chunk_half_width,p[9].y,zseat, 0-chunk_half_width,p[10].y,zseat, layer,0);    // south face of chunk

                s:=s+dxf_3dface(0-chunk_half_width,p[10].y,zkeybot, 0-chunk_half_width,p[11].y,zkeybot, 0-chunk_half_width,p[11].y,zseat, 0-chunk_half_width,p[10].y,zseat, layer,0);    // west end of chunk
                s:=s+dxf_3dface(  chunk_half_width,p[9].y,zkeybot,    chunk_half_width,p[8].y,zkeybot,   chunk_half_width,p[8].y,zseat,     chunk_half_width,p[9].y,zseat,  layer,0);    // east end of chunk
              end;

      s:=s+dxf_3dface(p[10].x,p[10].y,zseat, p[16].x,p[16].y,zpnth, p[19].x,p[19].y,zpnth, p[9].x,p[9].y,zseat, layer,0);   // south face (outer jaw)

      s:=s+dxf_3dface(p[13].x,p[13].y,zseat, p[1].x,p[1].y,zbase, p[0].x,p[0].y,zbase, p[12].x,p[12].y,zseat, layer,0);   // west end
      s:=s+dxf_3dface(p[14].x,p[14].y,zseat, p[6].x,p[6].y,zbase, p[7].x,p[7].y,zbase, p[15].x,p[15].y,zseat, layer,0);   // east end

      s:=s+dxf_3dface( p[1].x, p[1].y,zbase,   p[6].x,p[6].y,zbase,   p[6].x,p[6].y,zseat,   p[1].x, p[1].y,zseat, layer,0);   // north face (inner jaw) added 24-11-2018

      s:=s+dxf_3dface( p[7].x, p[7].y,zbase, p[15].x,p[15].y,zseat, p[19].x,p[19].y,zpnth, p[7].x, p[7].y, zbase, layer,0);    // se corner
      s:=s+dxf_3dface(p[15].x,p[15].y,zseat,  p[8].x,p[8].y,zseat,  p[9].x,p[9].y,zseat,   p[19].x,p[19].y,zpnth, layer,0);

      s:=s+dxf_3dface( p[0].x, p[0].y,zbase, p[12].x,p[12].y,zseat, p[16].x,p[16].y,zpnth,   p[0].x, p[0].y,zbase, layer,0);   // sw corner
      s:=s+dxf_3dface(p[12].x,p[12].y,zseat, p[11].x,p[11].y,zseat, p[10].x,p[10].y,zseat,  p[16].x,p[16].y,zpnth, layer,0);

      s:=s+'  0|ENDBLK|';

      Write(dxf_file,insert_crlf_str(s));

    finally
      creating_block_str:='';
    end;

  end;//with
end;
//______________________________________________________________________________

function line_type(layer:integer):string;     // get his requested line type.

begin
  with dxf_form do begin
  case layer of
          0: RESULT:=line_type_str[   rails_style_combo.ItemIndex];
          1: RESULT:=line_type_str[adjrails_style_combo.ItemIndex];
          2: RESULT:=line_type_str[tkclines_style_combo.ItemIndex];
          3: RESULT:=line_type_str[ timbout_style_combo.ItemIndex];
          4: RESULT:=line_type_str[sleeperend_style_combo.ItemIndex];
          5: RESULT:=line_type_str[timbcent_style_combo.ItemIndex];
          6: RESULT:=line_type_str[  gmarks_style_combo.ItemIndex];
          7: RESULT:=line_type_str[radmarks_style_combo.ItemIndex];
          8: RESULT:=line_type_str[radcentres_style_combo.ItemIndex];
          9: RESULT:=line_type_str[  joints_style_combo.ItemIndex];
         10: RESULT:=line_type_str[solid_bgnd_style_combo.ItemIndex];
         11: RESULT:=line_type_str[dot_bgnd_style_combo.ItemIndex];
         12: RESULT:='CONTINUOUS|';                                     // text layer.
         13: RESULT:='CONTINUOUS|';                                     // timmber numbering text.
         16: RESULT:=line_type_str[chairs_style_combo.ItemIndex];       // 221a
         19: RESULT:=line_type_str[chair_bolts_style_combo.ItemIndex];  // 221a

        else RESULT:='CONTINUOUS|';      // 3-D layers.
  end;//case
  end;//with
end;
//______________________________________________________________________________

function colour(layer:integer):string;    // get his requested colour.

begin
  with dxf_form do begin
    case layer of
            0: RESULT:=IntToStr(   rails_combo.ItemIndex);
            1: RESULT:=IntToStr(adjrails_combo.ItemIndex);
            2: RESULT:=IntToStr(tkclines_combo.ItemIndex);
            3: RESULT:=IntToStr( timbout_combo.ItemIndex);
            4: RESULT:=IntToStr(sleeperend_combo.ItemIndex);
            5: RESULT:=IntToStr(timbcent_combo.ItemIndex);
            6: RESULT:=IntToStr(  gmarks_combo.ItemIndex);
            7: RESULT:=IntToStr(radmarks_combo.ItemIndex);
            8: RESULT:=IntToStr(radcentres_combo.ItemIndex);
            9: RESULT:=IntToStr(  joints_combo.ItemIndex);
           10: RESULT:=IntToStr(shapes_bgnd_combo.ItemIndex);
           11: RESULT:=IntToStr(dot_bgnd_combo.ItemIndex);
           12: RESULT:=IntToStr(    text_combo.ItemIndex);
           13: RESULT:=IntToStr(   tbnum_combo.ItemIndex);

           14: if _3d=True then RESULT:=IntToStr(railsides_3d_colour)
                           else RESULT:=IntToStr(rails_combo.ItemIndex);

           15: if _3d=True then RESULT:=IntToStr(bolthead_3d_colour)            // bolt heads
                           else RESULT:=IntToStr(chair_bolts_combo.ItemIndex);

           16: if _3d=True then RESULT:=IntToStr(chair_3d_colour)               // chair bases (plinths)
                           else RESULT:=IntToStr(chairs_combo.ItemIndex);

           17: if _3d=True then RESULT:=IntToStr(timber_3d_colour)              // timber outlines
                           else RESULT:=IntToStr(timbout_combo.ItemIndex);

           18: if _3d=True then RESULT:=IntToStr(chair_3d_colour)               // rail seats (plinths)
                           else RESULT:=IntToStr(chairs_combo.ItemIndex);

           19: RESULT:=IntToStr(chair_3d_colour);   // bolts
           20: RESULT:=IntToStr(chair_3d_colour);   // inner jaws
           21: RESULT:=IntToStr(chair_3d_colour);   // outer jaws
           22: RESULT:=IntToStr(key_3d_colour);     // keys

           23: RESULT:=IntToStr(sockets_combo.ItemIndex);      // chair sockets
           24: RESULT:=IntToStr(sprues_combo.ItemIndex);       // timber sprues
           25: RESULT:=IntToStr(flanges_combo.ItemIndex);      // timber side,end flanges
           26: RESULT:=IntToStr(soleplates_combo.ItemIndex);   // switch sole plates
           27: RESULT:=IntToStr(webs_combo.ItemIndex);         // timber webs
           28: RESULT:=IntToStr(splints_combo.ItemIndex);      // brick splints
           29: RESULT:=IntToStr(clips_combo.ItemIndex);        // brick connector clips
           30: RESULT:=IntToStr(symbols_combo.ItemIndex);      // dropper symbols
           31: RESULT:=IntToStr(dropper_id_combo.ItemIndex);   // dropper ID text

           32: RESULT:=IntToStr(timbout_kerf_combo.ItemIndex);   // laser cutter timber outlines
           33: RESULT:=IntToStr(sockets_kerf_combo.ItemIndex);   // laser cutter timber outlines

           34: RESULT:=IntToStr(plug_3d_colour);                // plugs
           35: RESULT:=IntToStr(support_3d_colour);             // support pyramids


          else RESULT:='7';        // black.
    end;//case
  end;//with

  RESULT:=RESULT+'|';
end;
//______________________________________________________________________________

procedure preview_stl;      // 239a

var
  app_str,file_str:string;

begin
  Screen.Cursor:=crHourGlass;

  app_str:=preview_3d_app_str;

  file_str:='"'+exe_str+'internal\pre\preview.stl"';

  if ShellExecute(0,'open',PChar(app_str),PChar(file_str),nil,SW_SHOWNORMAL)<=32
     then begin
            Screen.Cursor:=crDefault;

            ShowMessage('Sorry, unable to start your STL viewer application.');

            dxf_form.edit_preview_button.Click;
          end;

  Sleep(2000);

  repeat
    Sleep(200);
    Application.ProcessMessages;
  until Application.Active=True;

  Screen.Cursor:=crDefault;
end;
//______________________________________________________________________________

procedure preview_dxf;   // 239a

var
  app_str,file_str:string;

begin
  Screen.Cursor:=crHourGlass;

  app_str:=preview_2d_app_str;

  file_str:='"'+exe_str+'internal\pre\preview.dxf"';

  if ShellExecute(0,'open',PChar(app_str),PChar(file_str),nil,SW_SHOWNORMAL)<=32
     then begin
            Screen.Cursor:=crDefault;

            ShowMessage('Sorry, unable to start your DXF viewer application.');

            dxf_form.edit_preview_button.Click;
          end;

  Sleep(2000);

  repeat
    Sleep(200);
    Application.ProcessMessages;
  until Application.Active=True;

  Screen.Cursor:=crDefault;
end;
//______________________________________________________________________________

procedure export_templates_dxf;    // 227a   (ex-225e)

var
  kludge_count:integer;

begin
  if _3d=False
     then kludge_count:=create_fb_kludge_templates
     else kludge_count:=0;

  do_export_templates_dxf;

  if kludge_count>0 then delete_fb_kludge_templates;  // if any
end;
//______________________________________________________________________________

procedure set_rail_label;

begin
  with dxf_form do begin
    if emgs_75_rail_radiobutton.Checked=True then rail_label.Caption:='for  '+emgs_75_rail_radiobutton.Caption+'  ';
    if smp_75_rail_radiobutton.Checked=True then rail_label.Caption:='for  '+smp_75_rail_radiobutton.Caption+'  ';
    if peco_75_rail_radiobutton.Checked=True then rail_label.Caption:='for  '+peco_75_rail_radiobutton.Caption+'  ';
    if cl_125_rail_radiobutton.Checked=True then rail_label.Caption:='for  '+cl_125_rail_radiobutton.Caption+'  ';
    if cl_131_rail_radiobutton.Checked=True then rail_label.Caption:='for  '+cl_131_rail_radiobutton.Caption+'  ';
    if peco_124_rail_radiobutton.Checked=True then rail_label.Caption:='for  '+peco_124_rail_radiobutton.Caption+'  ';
    if custom_rail_radiobutton.Checked=True then rail_label.Caption:='using  custom  rail  settings  ';
    if bs95r_radiobutton.Checked=True then rail_label.Caption:='for  '+bs95r_radiobutton.Caption+'  ';
  end;//with
end;
//______________________________________________________________________________

procedure do_export_templates_dxf;       // 227a (rename for wrapper)

var
  dxf_file:TextFile;

  stl_check:TStringList;

  n,i,njmod,njs:integer;
  s:string;
  colour_str:string;
  f_str:string;
  layer:integer;

  report_str,folder_str,get_builder_str:string;  // 228a

  dxf_filename,stl_filename,stl_fixed_filename:string;

  builder_name_str:string;
  default_loc,builder_running:boolean;

  brick_found:boolean;         // 239a
  brick_label_found:boolean;   // 234a

  chaired_found:boolean;        // 555b

  shapes_z:extended;  // 234e

  jaw_trim:extended;  // 235b

  modjm_str:string;  // 237c

  continue_str,repair_str,online_str:string;

  file_str,app_str:string;

  file_ok:boolean;  // 243b

begin
  if any_bgnd<1
     then begin
            with dxf_form do begin

              i:=alert(3,'    no  templates  currently  on  background',
                      '||`0      DXF / STL  file export`9'
                     +'||There are no stored templates currently on the background drawing on the trackpad.'
                     +'||The template which you can see on the trackpad is the control template.'
                     +'||Only background templates can be exported as DXF/STL files for CAD, laser cutting and 3D printing.'
                     +'||To place a copy of the current control template on the background, go back and click the `0PROGRAM > STORE & BACKGROUND`1 menu item or press the `0INSERT`2 key.'
                     +'||Otherwise the only available DXF/STL functions will be for the track-building tools.',
                      '','','create  files  for  filing  jigs','create  files  for  tweezer  tips','cancel','',0);
              case i of

                   3: begin
                        _3d_fdm_radiobutton.Checked:=True;    // assume FDM for filing jigs
                        _3d_options_click(False);

                        all_option_radio.Checked:=True;           // by-pass alerts

                        filing_jig_radio.Checked:=True;
                      end;


                   4: begin
                        _3d_resin_radiobutton.Checked:=True;    // assume resin for tweezer tips
                        _3d_options_click(False);

                        all_option_radio.Checked:=True;         // by-pass alerts

                        tweezer_tips_radio.Checked:=True;
                      end;

                 else EXIT;

              end;//case

            end;//with
          end;

  half_fw_tweaked:=fw/2;  // init

  repeat

    with dxf_form do begin

      if dxf_showing_settings=False
         then begin
                show_settings_button.Visible:=True;
                hide_settings_button.Visible:=False;
                datestamp_label.Visible:=False;
                dxf_3d_page_control.Visible:=False;
                exp_panel.Visible:=False;
                ClientWidth:=320;
                ClientHeight:=460;
              end;


      set_rail_label;

      do_show_modal(dxf_form);     // 212a  ShowModal

      if (ModalResult<>mrOK) and (ModalResult<>mrYes) then EXIT;


      if (group_option_radio.Checked=True) and (any_selected=0)
         then begin
                if alert(6,'    no  group  templates',
                           '||||You have clicked the `0GROUP TEMPLATES ONLY`1 option,'
                           +' but there are no group templates currently selected on the trackpad.'
                           +'||Do you want to include all background templates in the exported file?',
                            '','','','','no  -  cancel  export','yes  -  all  templates  in  file',0)=5
                   then EXIT;
                   all_option_radio.Checked:=True;           // radio item.
              end;

      // 555b                                                                  // 555b
      if (group_option_radio.Checked=True) and (_3d=True)
           then begin

                //  check for chaired templates
                chaired_found:=False;  // init

                for n:=0 to (keeps_list.Count-1) do begin
                  with Ttemplate(keeps_list.Objects[n]) do begin

                    if bg_copied=False then CONTINUE;        // no data, unused template

                    if (template_info.keep_dims.turnout_info2.chairing_flag=True) and (group_selected=True)
                        then begin
                               chaired_found:=True;
                               BREAK;
                             end;

                  end;//with
                end;//next

                if chaired_found=False
                   then begin
                        if alert(6,'    no chaired templates',
                                      '||||You have clicked the `0GROUP TEMPLATES ONLY`1 option,'
                                      +' but there are no chaired group templates currently selected on the trackpad.'
                                      +'||Do you want to include all background templates in the exported file?',
                                       '','','','','no  -  cancel  export','yes  -  all  templates  in  file',0)=5
                              then EXIT;
                              all_option_radio.Checked:=True;           // radio item.
                        end;


               end;

      // 555b

      if brick_option_radio.Checked=True
           then begin
                brick_found:=False;  // init

                for n:=0 to (keeps_list.Count-1) do begin
                  with Ttemplate(keeps_list.Objects[n]) do begin

                    if bg_copied=False then CONTINUE;        // no data, unused template

                    if (template_info.keep_dims.box_dims1.timbering_brick_flag=True) and (template_info.keep_dims.box_dims1.pad_marker_colour=dxf_form.marker_colour_panel.Color) and (template_info.keep_dims.box_dims1.use_pad_marker_colour=True)
                       then begin
                              brick_found:=True;
                              BREAK;
                            end;

                  end;//with
                end;//next

                if brick_found=False
                   then begin
                          if alert(6,'    no  matching  brick  templates',
                                     '||||You have clicked the `0timbering brick only`1 option,'
                                     +' but there are no templates matching the currently selected brick colour.'
                                     +'||Do you want to include all background templates in the exported file?',
                                      '','','','','no  -  cancel  export','yes  -  all  templates  in  file',0)=5
                             then EXIT;
                             all_option_radio.Checked:=True;           // radio item.
                        end;


              end;

      try
        x_shift:=StrToFloat(Trim(x_shift_edit.Text));
        y_shift:=StrToFloat(Trim(y_shift_edit.Text));
        z_shift:=StrToFloat(Trim(z_shift_edit.Text));
      except
        show_modal_message('error: "shift" must be a valid number with no spaces or other text');
        EXIT;
      end;

      try
        x_scale:=StrToFloat(Trim(x_scale_edit.Text));
        y_scale:=StrToFloat(Trim(y_scale_edit.Text));
        z_scale:=StrToFloat(Trim(z_scale_edit.Text));
      except
        show_modal_message('error: "scale by" must be a valid number with no spaces or other text');
        EXIT;
      end;

      if (x_scale<>1) or (y_scale<>1) or (z_scale<>1)
      or (x_shift<>0) or (y_shift<>0) or (z_shift<>0)
         then begin
                if _3d=True then show_modal_message('You have changed the shift and/or scaling for one or more axes.'+#13+#13+'This is unlikely to produce a satisfactory result for 3-D files.')
                            else show_modal_message('You have changed the shift and/or scaling for one or more axes.'+#13+#13+'Check that this produces the intended result.');
              end;
      //----

      brick_label_found:=False;  //init

      if _3d=True
         then begin
                init_rail_section;          // repeat these to match model section selected..
                init_3d_rea;

                if (brick_option_radio.Checked=True) and (brick_label_text_checkbox.Checked=True)
                   then begin
                          if bgnd_form.bgnd_shapes_listbox.Items.Count>0
                             then begin
                                       //hide_bits:byte; // 214a  0=normal,  1=hide on trackpad,  2=hide on output,  3=hide both

                                       //option_bits:byte;      // 226b  0=normal,

                                            // msb  map tile, has_been_interpolated , has_been_2_toned , has_been_low_contrast , has_been_negative , line is brick label tab , pre_227a , don't allow sync    lsb
                                            //        $80         $40                    $20                 $10                      $08                     $04                $02              $01

                                    for n:=0 to (bgnd_form.bgnd_shapes_listbox.Items.Count-1) do begin
                                      with Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[n]).bgnd_shape do begin
                                         if (shape_code<>0)
                                         or (is_brick=False)           // not brick shape
                                         or ((hide_bits AND $02)<>0)   // 2=hide on output    234b
                                         or ((option_bits AND $04)=0)  // 4=brick label
                                         or (wrap_offset<>marker_colour_panel.Color)     // wrong brick
                                         or (POS('#',shape_name)<>1)                     //  # prefix required for brick label tab
                                            then CONTINUE
                                            else begin
                                                   brick_label_found:=True;
                                                   BREAK;
                                                 end;
                                      end;//with
                                    end;//next
                                  end;

                          if brick_label_found=False
                             then begin
                                    i:=alert(3,'    3-D  export  -  no  brick  label',
                                               'You have ticked the `0brick label text`1 option, but there is no matching brick label in your background shapes.'
                                              +'||Do you want to continue the 3-D export without one?'
                                              +'||To be included in the export, a brick label must match the brick colour, and the label text must begin with a `0#`2 character.',
                                               '','','','continue  without  label','cancel','zoom  to  brick  and  cancel',0);
                                    if i=5 then EXIT;

                                    if i=6 then begin
                                                  zoom_brick_button.Click;
                                                  EXIT;
                                                end;
                                  end;
                        end;

              end;


      try
        mod_depths_adjustment:=StrToFloat(Trim(dxf_form.mod_depths_edit.Text))/100;   // 244d   % setting
      except
        show_modal_message('error: modify-timber-depths adjustment must be a valid number with no spaces or other text');
        EXIT;
      end;//try

      mod_timbers_for_scale_factor:=(4.0/scale)*mod_depths_adjustment;  // 244d      to use same Z dims as 4mm/ft scale for plugs and timbers

      if z_datum_underside_checkbox.Checked=True then z_shift:=z_shift+rail_section_data_mm.rail_depth_mm+(seat_thick+timber_thick)*inscale;

      if ModalResult=mrYes      // 239a
         then begin
                dxf_filename:=exe_str+'internal\pre\preview.dxf';

                stl:=_3d;

                if stl=True
                   then stl_filename:=exe_str+'internal\pre\preview.stl'
                   else stl_filename:='';
              end
         else begin

                with save_dialog do begin                          // set up the save dialog.

                  if _3d=False     // 2-D is DXF only
                     then begin
                            stl:=False;

                            if inches_radio_button.Checked=True
                               then begin
                                      Title:='    export  DXF  file  ( in  inches )  as ...';
                                      f_str:=' in';
                                    end
                               else begin
                                      Title:='    export  DXF  file  ( in  mm )  as ...';
                                      f_str:=' mm';
                                    end;

                            if user_save_file_name_dxf<>'' then InitialDir:=ExtractFilePath(user_save_file_name_dxf)   // use his previous DXF folder.
                                                           else InitialDir:=exe_str+'DXF-FILES\';                      // or the default one.

                            Filter:='DXF files (*.dxf)|*.dxf';
                            FileName:=remove_invalid_str(Copy(Trim(box_project_title_str),1,fname_trunc)+FormatDateTime(' yy_mm_dd hhmm ss',Date+Time))+f_str+'.dxf';
                          end
                     else begin                                        // 3-D ...
                            if stl_radio.Checked=True    // STL only
                               then begin
                                      stl:=_3d;

                                      Title:='    export  STL  file  ( in  mm )  as ...';

                                      if user_save_file_name_stl<>'' then InitialDir:=ExtractFilePath(user_save_file_name_stl)   // use his previous folder.
                                                                     else InitialDir:=exe_str+'STL-FILES-RAW\';                  // or the default one.

                                      Filter:='STL files (*.stl)|*.stl';
                                      FileName:=remove_invalid_str(Copy(Trim(box_project_title_str),1,fname_trunc)+FormatDateTime(' yy_mm_dd hhmm ss',Date+Time))+'.stl';
                                    end
                               else if dxf_radio.Checked=True    // DXF only
                                       then begin
                                              stl:=False;

                                              if inches_radio_button.Checked=True
                                                 then begin
                                                        Title:='    export  DXF  file  ( in  inches )  as ...';
                                                        f_str:=' in';
                                                      end
                                                 else begin
                                                        Title:='    export  DXF  file  ( in  mm )  as ...';
                                                        f_str:=' mm';
                                                      end;

                                              if user_save_file_name_dxf<>'' then InitialDir:=ExtractFilePath(user_save_file_name_dxf)   // use his previous folder.
                                                                             else InitialDir:=exe_str+'DXF-FILES\';                      // or the default one.

                                              Filter:='DXF files (*.dxf)|*.dxf';
                                              FileName:=remove_invalid_str(Copy(Trim(box_project_title_str),1,fname_trunc)+FormatDateTime(' yy_mm_dd hhmm ss',Date+Time))+f_str+'.dxf';
                                            end
                                       else begin                // both_radio   DXF and STL wanted
                                              stl:=_3d;

                                              if inches_radio_button.Checked=True
                                                 then begin
                                                        Title:='    export  DXF / STL  file  ( in  inches )  as ...';
                                                        f_str:=' in';
                                                      end
                                                 else begin
                                                        Title:='    export  DXF / STL  file  ( in  mm )  as ...';
                                                        f_str:=' mm';
                                                      end;

                                              if user_save_file_name_dxf<>'' then InitialDir:=ExtractFilePath(user_save_file_name_dxf)   // use his previous folder.
                                                                             else InitialDir:=exe_str+'DXF-FILES\';                      // or the default one.

                                              Filter:='DXF files (*.dxf)|*.dxf';
                                              FileName:=remove_invalid_str(Copy(Trim(box_project_title_str),1,fname_trunc)+FormatDateTime(' yy_mm_dd hhmm ss',Date+Time))+f_str+'.dxf';
                                            end;
                          end;

                  showing_dialog:=True;   // 212a Wine bug

                  if Execute=False     // do the file dialog
                     then begin
                            showing_dialog:=False;   // 212a Wine bug
                            EXIT;
                          end;

                  showing_dialog:=False;   // 212a Wine bug

                  FileName:=lower_case_filename(FileName);   // 0.79.a   to underscores and lower case.

                  dxf_filename:=ChangeFileExt(FileName,'.dxf');
                  stl_filename:=ChangeFileExt(FileName,'.stl');

                end;//with dialog

                if invalid_85a_file_name(dxf_filename)=True then EXIT;
                if invalid_85a_file_name(stl_filename)=True then EXIT;

                user_save_file_name_stl:=stl_filename;
                user_save_file_name_dxf:=dxf_filename;

                if (_3d=True) and (stl_radio.Checked=True)  // overrides if STL file only wanted ..
                   then begin
                          dxf_filename:=exe_str+'internal\dxf\dummy.dxf';    // 234d  dummy DXF file created if STL only
                          user_save_file_name_dxf:='';
                        end;

              end;//normal export, not preview

      if classic_templot=False then store_and_background(False,True);  // 0.93.a Quick mode - first store and zero existing control template

      try
        Screen.Cursor:=crHourGlass;                                        // could take a while if big file.
        if Application.Terminated=False then Application.ProcessMessages;  // so let the form repaint.

        AssignFile(dxf_file,dxf_filename);
        Rewrite(dxf_file);                   // open a new file (or overwrite existing).

        if stl=True   // 227a
           then begin
                  stl_block_list:=TStringlist.Create;   // 227a

                  AssignFile(stl_file,stl_filename);
                  Rewrite(stl_file);                    // open a new file  (or overwrite existing).

                  Write(stl_file,'solid Templot (c) Martin Wynne');  // STL header
                end;

        doing_entities:=False;   // init not yet

                              // make up the header...

        s:='  0|SECTION|  2|HEADER|'; //  9|$ACADVER|  1|TEMPLOT V.0|';

        xmin:=zoom_offsetx;
        ymin:=zoom_offsety;

        xmax:=xmin+screenx;
        ymax:=ymin+screeny;

        if limits_checkbox.Checked=True          // add the current pad limits in mm.
           then s:=s+'  9|$LIMMIN|'
                    +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,xmin)
                    +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,ymin)
                    +'  9|$LIMMAX|'
                    +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,xmax)
                    +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,ymax);

        s:=s+'  0|ENDSEC|';

        Write(dxf_file,insert_crlf_str(s));  // write header to file.
        Write(dxf_file,dxf_memo.Text);       // write the line type tables.

        s:='  0|TABLE|  2|LAYER| 70|36|';    // 36 layers.
        Write(dxf_file,insert_crlf_str(s));  // write layer table header.

        for layer:=0 to 35 do begin          // 236d  36 layers
                                             // write layer entries from his current settings.

          colour_str:=colour(layer);

          if colour_str='0|' then CONTINUE;  // he wants this layer omitted.

          s:='  0|LAYER|  2|'+layer_str[layer]+' 70|0|  6|'+line_type(layer)+' 62|'+colour_str;
          Write(dxf_file,insert_crlf_str(s));

        end;//for

        s:='  0|ENDTAB|  0|ENDSEC|  0|SECTION|  2|BLOCKS|';

        Write(dxf_file,insert_crlf_str(s));    // end tables and do blocks header.

        if doing_tools=True
           then do_nothing
           else begin

                  seat_thick:=_3d_data.seat_thickness;

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,False,False,False,False,'',dxf_file);  // go create the S1 rail seat block

                  create_S1_S1J_L1_CC_seat_block(True,False,False,False,False,False,False,False,False,'',dxf_file);   // go create the S1J rail seat block

                  create_S1_S1J_L1_CC_seat_block(False,True,False,False,False,False,False,False,False,'',dxf_file);   // go create the L1 rail seat block

                  create_S1_S1J_L1_CC_seat_block(False,False,True,False,False,False,False,False,False,'',dxf_file);   // go create SC, CC stock-rail seat block

                  create_S1_S1J_L1_CC_seat_block(False,False,True,True,False,False,False,False,False,'',dxf_file);    // go create the CC check-rail seat block

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,True,False,False,False,False,'',dxf_file);   // go create the PLR3 switch-rail seat block for skewed rail

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,True,False,False,False,'',dxf_file);   // go create the ZY wing front seat block for skewed rail

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,False,True,False,False,'',dxf_file);   // go create the XN knuckle seat block (wider)

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,False,False,True,False,'',dxf_file);   // go create the XA gap seat block

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,False,False,False,True,'',dxf_file);   // go create the AA nose seat block

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,False,False,False,True,'ABSEAT',dxf_file);   // go create the AB splice seat block

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,True,False,False,False,'BCSEAT',dxf_file);   // go create the BC seat block for skewed rail  width as ZY

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,True,False,False,False,'DDSEAT',dxf_file);   // go create the DD seat block for skewed rail  width as ZY

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,True,False,False,False,'DXSEAT',dxf_file);   // go create the DX seat block for fixed DD insert  width as ZY

                  create_S1_S1J_L1_CC_seat_block(False,False,False,False,False,True,False,False,False,'DXSEATL',dxf_file);   // go create the DX seat block for loose DD insert  width as ZY


                  create_3d_bolt_blocks(dxf_file);          // go create the bolt blocks.    221a

                  create_3d_key_block(False,False,dxf_file);    // go create the normal key block.    221a    no loose pin jaw - key has middle pad
                  create_3d_key_block(True, False,dxf_file);    // go create the normal key block.    221a    for loose-pin jaw (no middle pad)

                  create_3d_key_block(False,True,dxf_file);       // go create the reversed check-rail key block  no loose pin                         237a
                  create_3d_key_block(True, True,dxf_file);       // go create the reversed check-rail key block  for loose-pin jaw (no middle pad)    237a

                  create_s1_outer_jaw_block(False, dxf_file);      // go create the S1 outer jaw block.   221a    no loose pin
                  create_s1_outer_jaw_block(True,  dxf_file);      // go create the S1 outer jaw block.   221a    for loose-pin jaw (no middle pad)

                  create_L1_outer_jaw_block(False, dxf_file);      // go create the L1 outer jaw block.   229e    no loose pin
                  create_L1_outer_jaw_block(True,  dxf_file);      // go create the L1 outer jaw block.   229e    for loose-pin jaw (no middle pad)

                  create_SC_outer_jaw_block('SCOUTJAW', False,False,0,0,0,dxf_file);  // go create the SC outer jaw block.   233d     no loose pin
                  create_SC_outer_jaw_block('SCOUTJAL',  True,False,0,0,0,dxf_file);  // go create the SC outer jaw block.   233d     with loose pin

                  create_SC_outer_jaw_block('CCOUTJAW', False,True,0,0,0,dxf_file);    // go create the CC inner end keyed jaw block.  parallel CC chairs 237a
                  create_SC_outer_jaw_block('CCOUTJAL',  True,True,0,0,0,dxf_file);    // go create the CC inner end keyed jaw block.  parallel CC chairs 237a


                  create_S1_SC_L1_CC_inner_jaw_block('S1INJAW',False,False,False,False,False,0,0,0,0,dxf_file);    // go create the S1 inner jaw block.   221a   S1 = SC=False, L1=False, no swap,scylim=0,   cc_flare=0
                  create_S1_SC_L1_CC_inner_jaw_block('L1INJAW',False,False,False,True,False,0,0,0,0,dxf_file);     // go create the L1 inner jaw block.   221a   L1 = SC=False, L1=True,  no swap,scylim=0,   cc_flare=0

                  jaw_trim:=_2d_data.inner_trim_stock_rail*inscale;

                  create_S1_SC_L1_CC_inner_jaw_block('SCINJAW',False,False,True,False,False,0,jaw_trim,0,0,dxf_file);     // 235b go create the SC inner jaw block (cropped S1 inner).  SC=True, L1=False, no swap,scylim=crop limit, cc_flare=0

                  create_S1_SC_L1_CC_inner_jaw_block('CCFIJAW',False,True,True,False,False,0,(fw+fw_correction_check)/2,0,0,dxf_file);  // 237a go create the CC mid-inner jaw block on stock rail (cropped S1 inner).  SC=True, L1=False, No Swap, scylim=crop limit (half-flangeway), cc_flare=0

                  create_P_seat_block(dxf_file);      // go create the P slide chair seat (slide table) - no inner jaw

                  create_1PRL_seat_block(dxf_file);   // go create the PRL1 block chair seat (slide table) - no inner jaw   for 1P and 2P switch block half-chairs

                  create_NCSEAT_block(dxf_file);      // go create seat for the nose clamp

                  create_NXSEAT_block(dxf_file);      // 241a  go create seat block for NX gap filler -- no actual seat, just the support

                  create_3d_P_outer_jaw_block('',0,False, dxf_file);   // go create the P outer jaw block  without loose pin
                  create_3d_P_outer_jaw_block('',0,True,  dxf_file);   // go create the P outer jaw block  with loose pin

                  create_3d_P_bolt_blocks(1,dxf_file);     // go create P jaw stock rail bolt - 5 nut rotations, selected at random ...
                  create_3d_P_bolt_blocks(2,dxf_file);     // go create P jaw stock rail bolt
                  create_3d_P_bolt_blocks(3,dxf_file);     // go create P jaw stock rail bolt
                  create_3d_P_bolt_blocks(4,dxf_file);     // go create P jaw stock rail bolt
                  create_3d_P_bolt_blocks(5,dxf_file);     // go create P jaw stock rail bolt


                  create_3d_nail_block(dxf_file);    // go create nail for bed of nails  237a


                        // make the customized one-off jaws 237c ...

                  if (_3d=True) and (keeps_list.Count>0)
                     then begin
                            for njmod:=0 to (keeps_list.Count-1) do begin

                              with Ttemplate(keeps_list.Objects[njmod]) do begin   // to next template.

                                if bg_copied=False then CONTINUE;        // no data, unused template.

                                if (dxf_form.group_option_radio.Checked=True) and (group_selected=False)  // ignore this one, only group templates wanted
                                   then CONTINUE;

                                if (dxf_form.brick_option_radio.Checked=True)
                               and ( (template_info.keep_dims.box_dims1.timbering_brick_flag=False) or (template_info.keep_dims.box_dims1.pad_marker_colour<>dxf_form.marker_colour_panel.Color) or (template_info.keep_dims.box_dims1.use_pad_marker_colour=False) )
                                   then CONTINUE;                // not brick template or wrong colour or not in use

                                if ABS(template_info.keep_dims.box_dims1.proto_info.scale_pi-scale)>minfp     // ignore this one, template scale differs from control template
                                   then CONTINUE;

                                if template_info.keep_dims.turnout_info2.chairing_flag=False      // no chairing on this template
                                   then CONTINUE;

                                   // found a template to export ...

                                half_fw_tweaked:=(fw+fw_correction_check)/2;

                                if Length(template_info.keep_jmods)>0
                                   then begin
                                          for njs:=0 to Length(template_info.keep_jmods)-1 do begin

                                            with template_info.keep_jmods[njs] do begin       // a Tjmod

                                              modjm_str:=StringReplace(jm_str,'...',IntToStr(njmod),[rfReplaceAll]);    // modified jaw, e.g. 'MM'+IntToStr(template_index)+tb_str

                                                    // MS switch...

                                              if POS('MM',modjm_str)=1   // chair code 11    1P,2P MS side
                                                 then begin
                                                        jaw_trim:=jm_aq_y-_2d_data.PLR1_chair_inlong*inscale-rail_section_data_mm.rail_head_width_mm;

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str,False,False,True,False,True,0-jm_aq_k*jm_h,jaw_trim, 0, 0, dxf_file); // MM...   MS switch rail outer, unkeyed, skewed  -  swap SC inner to make outer on switch rail 1P and 2P, cc_flare=0

                                                        CONTINUE;
                                                      end;

                                              if POS('MN',modjm_str)=1   // chair code 12 outer    3P..11P MS side
                                                 then begin
                                                        jaw_trim:=0-(jm_aq_y-_2d_data.inner_trim_stock_rail*inscale);

                                                        if template_info.file_blocks.keep_jaw_options[7][2]=True     // 239a switch rail loose mid jaw wanted?
                                                           then jaw_trim:=jaw_trim+_2d_data.mid_jaw_space*inscale;   // gap to to allow flexing of loose mid jaw

                                                        create_SC_outer_jaw_block(modjm_str,
                                                                                  template_info.file_blocks.keep_jaw_options[7][2],  // switch rail loose mid jaw wanted?
                                                                                  False,0-jm_aq_k*jm_h,jaw_trim,0, dxf_file);        // MN...   MS switch rail outer, keyed, skewed 3P..11P


                                                        CONTINUE;
                                                      end;

                                              if POS('MH',modjm_str)=1   // chair code 12 inner    3P..11P MS side
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,False,False,False, 0-jm_aq_k*jm_h,0, 0, 0, dxf_file);   // MH...   MS switch rail inner, skewed 3P..11P, cc_flare=0

                                                        CONTINUE;
                                                      end;

                                                      // TS switch...

                                              if POS('TM',modjm_str)=1   // chair code 11    1P,2P TS side
                                                 then begin
                                                        jaw_trim:=((jm_aq_y-g)/COS(jm_aq_k))-_2d_data.PLR1_chair_inlong*inscale-rail_section_data_mm.rail_head_width_mm;

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,True,jm_aq_k*jm_h,jaw_trim, 0, 0, dxf_file); // TS  SC swap to make outer on switch rail 1P and 2P, cc_flare=0

                                                        CONTINUE;
                                                      end;

                                              if POS('TN',modjm_str)=1   // chair code 12 outer    3P..11P TS side
                                                 then begin
                                                        jaw_trim:=0-((jm_aq_y-g)/COS(jm_aq_k)-_2d_data.inner_trim_stock_rail*inscale);

                                                        if template_info.file_blocks.keep_jaw_options[7][2]=True      // 239a switch rail loose mid jaw wanted?
                                                           then jaw_trim:=jaw_trim+_2d_data.mid_jaw_space*inscale;    // to allow flexing of loose mid jaw

                                                        create_SC_outer_jaw_block(modjm_str,
                                                                                  template_info.file_blocks.keep_jaw_options[7][2],     // switch rail loose mid jaw wanted?
                                                                                  False,jm_aq_k*jm_h,jaw_trim,0,dxf_file);              // TN...

                                                        CONTINUE;
                                                      end;

                                              if POS('TH',modjm_str)=1   // chair code 12 inner    3P..11P MS side
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,False,False,False,jm_aq_k*jm_h,0, 0, 0, dxf_file);   // TH...   TS switch rail inner, skewed rib, cc_flare=0

                                                        CONTINUE;
                                                      end;


                                                      // CC check rail parallel

                                              if POS('FC',modjm_str)=1   // chair code 15  CC parallel part
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str,False,True,True,False,True,0,half_fw_tweaked,0,0,dxf_file);   // 237a go create the CC mid jaw block on check rail (cropped S1 inner).  SC=True, L1=False, Swap, scylim=crop limit (half-flangeway), cc_flare=0

                                                        CONTINUE;
                                                      end;


                                                      // MS check rail ends...


                                              if POS('MB',modjm_str)=1   // chair code 14 inner end of check rail end chair
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                        template_info.file_blocks.keep_jaw_options[9][2],  // check rail loose jaw wanted?
                                                        True, jm_aq_k*jm_h, 0, jm_aq_f, dxf_file);         // MB...   MS check flare-in, keyed, skewed

                                                        CONTINUE;
                                                      end;


                                              if POS('MD',modjm_str)=1   // chair code 16 inner end of check rail end chair
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                        template_info.file_blocks.keep_jaw_options[9][2],         // check rail loose jaw wanted?
                                                        True, 0-jm_aq_k*jm_h, 0, jm_aq_f, dxf_file);              // MD...   MS check rail flare-out, keyed, skewed

                                                        CONTINUE;
                                                      end;



                                              if POS('MA',modjm_str)=1   // chair code 14 middle of check rail end chair
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str,False,True,True,False,True,0-jm_aq_k*jm_h,half_fw_tweaked+jm_aq_f, jm_aq_f, 0, dxf_file);   // 237c go create the mid-outer jaw block on check rail end (cropped S1 inner).  SC=True, L1=False, Swap, scylim=crop limit, cc_flare

                                                        CONTINUE;
                                                      end;


                                              if POS('MC',modjm_str)=1   // chair code 16 middle of check rail end chair
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str,False,True,True,False,True,jm_aq_k*jm_h,half_fw_tweaked+jm_aq_f, jm_aq_f, 0, dxf_file);   // 237c go create the mid-outer jaw block on check rail end (cropped S1 inner).  SC=True, L1=False, Swap, scylim=crop limit, cc_flare

                                                        CONTINUE;
                                                      end;


                                                      // TS check rail ends...


                                              if POS('TB',modjm_str)=1   // chair code 14 inner end of check rail end chair
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                        template_info.file_blocks.keep_jaw_options[9][2],   // check rail loose jaw?
                                                        True, jm_aq_k*jm_h, 0, jm_aq_f, dxf_file);          // TB...   TS check flare-in, keyed, skewed

                                                        CONTINUE;
                                                      end;


                                              if POS('TD',modjm_str)=1   // chair code 16 inner end of check rail end chair
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                        template_info.file_blocks.keep_jaw_options[9][2],    // check rail loose jaw?
                                                        True, 0-jm_aq_k*jm_h, 0, jm_aq_f, dxf_file);         // TD...   TS check rail flare-out, keyed, skewed

                                                        CONTINUE;
                                                      end;


                                              if POS('TA',modjm_str)=1   // chair code 14 middle of check rail end chair
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str,False,True,True,False,True,0-jm_aq_k*jm_h,half_fw_tweaked+jm_aq_f, jm_aq_f, 0, dxf_file);   // 237c go create the mid-outer jaw block on check rail end (cropped S1 inner).  SC=True, L1=False, Swap, scylim=crop limit, cc_flare

                                                        CONTINUE;
                                                      end;


                                              if POS('TC',modjm_str)=1   // chair code 16 middle of check rail end chair
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str,False,True,True,False,True,jm_aq_k*jm_h,half_fw_tweaked+jm_aq_f, jm_aq_f, 0, dxf_file);   // 237c go create the mid-outer jaw block on check rail end (cropped S1 inner).  SC=True, L1=False, Swap, scylim=crop limit, cc_flare

                                                        CONTINUE;
                                                      end;



                                                      // ZY jaws...

                                              if POS('WA',modjm_str)=1   // chair code 21  ZY crossing chairs  main rail 3  outer jaw skewed to match equalized chair base
                                                 then begin

                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[13][2], // rail 3 loose jaw wanted?
                                                          False, jm_aq_k*jm_h, 0, 0, dxf_file);              // WA... rail 3 outer

                                                        CONTINUE;
                                                      end;

                                              if POS('VA',modjm_str)=1   // chair code 21  ZY crossing chairs  crossing rail 2  outer jaw skewed to match equalized chair base
                                                 then begin

                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[14][2], // rail 2 loose jaw wanted?
                                                          False, 0-jm_aq_k*jm_h, 0, 0, dxf_file);            // VA... rail 2 outer

                                                        CONTINUE;
                                                      end;

                                             if POS('WH',modjm_str)=1   // chair code 21  ZY crossing chairs  main rail 3  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, jm_aq_k*jm_h, jm_aq_f, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;

                                             if POS('VH',modjm_str)=1   // chair code 21  ZY crossing chairs  crossing rail 2  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0-jm_aq_k*jm_h, jm_aq_f, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;


                                                 // XN inner jaws...

                                             if POS('WI',modjm_str)=1   // chair code 22  XN knuckle chairs  main rail 3  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, 7*inscale/8, dxf_file);

                                                        CONTINUE;
                                                      end;


                                             if POS('VI',modjm_str)=1   // chair code 22  XN knuckle chairs  crossing rail 2  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, 7*inscale/8, dxf_file);

                                                        CONTINUE;
                                                      end;


                                                 // XA jaws...

                                              if POS('WC',modjm_str)=1   // chair code 23  XA crossing chairs  main rail 3  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[17][2], // rail 3 loose jaw wanted?
                                                          False, jm_aq_k*jm_h, 0, 0, dxf_file);              // WC... rail 3 outer

                                                        CONTINUE;
                                                      end;

                                              if POS('VC',modjm_str)=1   // chair code 23  XA crossing chairs  crossing rail 2  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[18][2], // rail 2 loose jaw wanted?
                                                          False, 0-jm_aq_k*jm_h, 0, 0, dxf_file);            // VC... rail 2 outer

                                                        CONTINUE;
                                                      end;


                                             if POS('WJ',modjm_str)=1   // chair code 23  XA crossing chairs  main rail 3  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, jm_aq_k*jm_h, jm_aq_f, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;

                                             if POS('VJ',modjm_str)=1   // chair code 23  XA crossing chairs  crossing rail 2  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0-jm_aq_k*jm_h, jm_aq_f, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;


                                                 // NX  xing gap filler spacer...

                                              if POS('XK',modjm_str)=1   // AA chair code 24   add gap spacer    main rail 3 bent wing part   inner jaw skewed to match equalized chair base
                                                 then begin
                                                             // jaw widened each way by 1.25" for nose blocks

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, 1.25*inscale, dxf_file);

                                                        CONTINUE;
                                                      end;


                                              if POS('YK',modjm_str)=1   // AA chair code 24   add gap spacer   crossing rail 2 bent wing part    inner jaw skewed to match equalized chair base
                                                 then begin
                                                             // jaw widened each way by 1.25" for nose blocks

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, 1.25*inscale, dxf_file);

                                                        CONTINUE;
                                                      end;


                                                 // AA jaws...

                                              if POS('WD',modjm_str)=1   // chair code 24  AA nose chair   main rail 3  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[20][2], // rail 3 loose jaw wanted?
                                                          False, jm_aq_k*jm_h, 0, 0, dxf_file);              // WC... rail 3 outer

                                                        CONTINUE;
                                                      end;


                                              if POS('VD',modjm_str)=1   // chair code 24  AA nose chair    crossing rail 2  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[19][2], // rail 2 loose jaw wanted?
                                                          False, 0-jm_aq_k*jm_h, 0, 0, dxf_file);            // VC... rail 2 outer

                                                        CONTINUE;
                                                      end;



                                             if POS('WK',modjm_str)=1   // chair code 24  AA crossing nose chairs  main rail 3 bent wing part   inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // jaw widened each way by 1.25" for nose blocks

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f+inscale/4, 0, 1.25*inscale, dxf_file);

                                                        CONTINUE;
                                                      end;

                                               if POS('NK',modjm_str)=1   // chair code 24  add nose clamp    main rail 3 bent wing part   inner jaw skewed to match equalized chair base
                                                   then begin

                                                             // jaw widened each way by 1.25" for nose blocks

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f+inscale/4, 0, 1.25*inscale, dxf_file);

                                                          CONTINUE;
                                                        end;


                                             if POS('WP',modjm_str)=1   // chair code 24  AA crossing nose chairs  main-side of point rail nose    inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // jaw widened each way by 1.25" for nose blocks

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, jm_aq_k*jm_h, jm_aq_f, 0, 1.25*inscale, dxf_file);

                                                        CONTINUE;
                                                      end;


                                               if POS('NP',modjm_str)=1   // chair code 24  add nose clamp   main-side of point rail nose    inner jaw skewed to match equalized chair base
                                                   then begin

                                                             // jaw widened each way by 1.25" for nose blocks

                                                            create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, jm_aq_k*jm_h, jm_aq_f, 0, 1.25*inscale, dxf_file);

                                                          CONTINUE;
                                                        end;


                                             if POS('VK',modjm_str)=1   // chair code 24  AA crossing chairs  crossing rail 2 bent wing part    inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // jaw widened each way by 1.25" for nose blocks

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, 1.25*inscale, dxf_file);

                                                        CONTINUE;
                                                      end;

                                               if POS('OK',modjm_str)=1   // chair code 24  add nose clamp  crossing rail 2 bent wing part    inner jaw skewed to match equalized chair base
                                                   then begin

                                                             // jaw widened each way by 1.25" for nose blocks

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, 1.25*inscale, dxf_file);

                                                          CONTINUE;
                                                        end;


                                             if POS('VP',modjm_str)=1   // chair code 24  AA crossing nose chairs  turnout-side of point rail nose    inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // jaw widened each way by 1.25" for nose blocks   negative widening means omit jaw grip part - AA chair nose

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0-jm_aq_k*jm_h, jm_aq_f+inscale/4, 0, 0-1.25*inscale, dxf_file);

                                                        CONTINUE;
                                                      end;


                                               if POS('OP',modjm_str)=1   // chair code 24  add nose clamp  turnout-side of point rail nose    inner jaw skewed to match equalized chair base
                                                   then begin

                                                             // jaw widened each way by 1.25" for nose blocks   negative widening means omit jaw grip part - AA chair nose

                                                            create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0-jm_aq_k*jm_h, jm_aq_f+inscale/4, 0, 0-1.25*inscale, dxf_file);

                                                          CONTINUE;
                                                        end;



                                                 // AB jaws...

                                              if POS('WE',modjm_str)=1   // chair code 25  AB splice chair   main rail 3  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[22][2], // rail 3 loose jaw wanted?
                                                          False, jm_aq_k*jm_h, 0, 0, dxf_file);              // WE... rail 3 outer

                                                        CONTINUE;
                                                      end;


                                              if POS('VE',modjm_str)=1   // chair code 25  AB splice chair    crossing rail 2  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[21][2], // rail 2 loose jaw wanted?
                                                          False, 0-jm_aq_k*jm_h, 0, 0, dxf_file);            // VE... rail 2 outer

                                                        CONTINUE;
                                                      end;



                                             if POS('WL',modjm_str)=1   // chair code 25  AB splice chair   main rail 3 bent wing part   inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // 1/2" widening each way  (arbitrary for model strength)

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f+inscale/4, 0, inscale/2, dxf_file);

                                                        CONTINUE;
                                                      end;


                                             if POS('WQ',modjm_str)=1   // chair code 25  AB splice chair   main-side of point rail nose    inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // 1/2" widening each way  (arbitrary for model strength)

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, jm_aq_k*jm_h, jm_aq_f, 0, inscale/2, dxf_file);

                                                        CONTINUE;
                                                      end;


                                             if POS('VL',modjm_str)=1   // chair code 25  AB splice chair    crossing rail 2 bent wing part    inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // 1/2" widening each way  (arbitrary for model strength)

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, inscale/2, dxf_file);

                                                        CONTINUE;
                                                      end;


                                             if POS('VQ',modjm_str)=1   // chair code 25  AB splice chair    turnout-side of point rail nose    inner jaw skewed to match equalized chair base
                                                 then begin

                                                           // 1/2" widening each way  (arbitrary for model strength)

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0-jm_aq_k*jm_h, jm_aq_f+inscale/4, 0, inscale/2, dxf_file);

                                                        CONTINUE;
                                                      end;




                                                 // BB/BC jaws...


                                              if POS('WF',modjm_str)=1   // chair code 26   BB/BC wing rail
                                                 then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                                                  template_info.file_blocks.keep_jaw_options[24][2],  // wing rail loose jaw wanted?
                                                                                  False, jm_aq_k*jm_h, 0, 0, dxf_file);               // WF...   TS wing rail flare-out, keyed, skewed
                                                        CONTINUE;
                                                      end;

                                             if POS('WM',modjm_str)=1   // chair code 26  BB/BC wing rail
                                                 then begin

                                                           // 1/4" widening each way  (arbitrary for model strength)

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, inscale/4, dxf_file);

                                                        CONTINUE;
                                                      end;

                                             if POS('VR',modjm_str)=1   // chair code 26  BB/BC wing rail
                                                 then begin

                                                           // 1/4" widening each way  (arbitrary for model strength)

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0-jm_aq_k*jm_h, jm_aq_f, 0, inscale/4, dxf_file);

                                                        CONTINUE;
                                                      end;




                                             if POS('VF',modjm_str)=1   // chair code 26  BB/BC wing rail  MS
                                                then begin
                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[23][2], // loose jaw wanted?
                                                          False, 0-jm_aq_k*jm_h, 0, 0, dxf_file);            // VF... outer

                                                        CONTINUE;
                                                      end;


                                             if POS('VM',modjm_str)=1   // chair code 26  BB/BC wing chair
                                                 then begin

                                                             //  1/4" widening each way  (arbitrary for model strength)

                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, 0, jm_aq_f, 0, inscale/4, dxf_file);

                                                        CONTINUE;
                                                      end;



                                             if POS('WR',modjm_str)=1   // chair code 26  BB/BC wing chair chair   main-side of point rail
                                                 then begin

                                                             //  1/4" widening each way  (arbitrary for model strength)

                                                          create_S1_SC_L1_CC_inner_jaw_block(modjm_str, False,False,True,False,False, jm_aq_k*jm_h, jm_aq_f, 0, inscale/4, dxf_file);

                                                        CONTINUE;
                                                      end;


                                                 // CD/DD jaws...


                                             if POS('WG',modjm_str)=1   // chair code 27  CD/DD exit chairs  main rail 3  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, True,False,False,False,False, jm_aq_k*jm_h, 0, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;

                                             if POS('VG',modjm_str)=1   // chair code 27  CD/ED exit chairs  crossing rail 2  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, True,False,False,False,False, 0-jm_aq_k*jm_h, 0, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;



                                              if POS('WN',modjm_str)=1   // chair code 27  DX insert on DD chair  based on P jaws
                                                 then begin
                                                        create_3d_P_outer_jaw_block(modjm_str,jm_aq_f, template_info.file_blocks.keep_jaw_options[27][2], dxf_file);   // go create the P outer jaw block  with/without loose support

                                                        CONTINUE;
                                                      end;

                                              if POS('VN',modjm_str)=1   // chair code 27  DX insert on DD chair  based on P jaws
                                                 then begin
                                                        create_3d_P_outer_jaw_block(modjm_str,jm_aq_f, template_info.file_blocks.keep_jaw_options[27][2], dxf_file);   // go create the P outer jaw block  with/without loose support

                                                        CONTINUE;
                                                      end;



                                                 // EF jaws...

                                              if POS('WO',modjm_str)=1   // chair code 28  EF exit chairs  main rail 3  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        jaw_trim:=jm_aq_f;

                                                        if template_info.file_blocks.keep_jaw_options[29][2]=True     // 239a loose mid jaw wanted?
                                                           then jaw_trim:=jaw_trim-_2d_data.mid_jaw_space*inscale/2;  // to allow flexing of loose mid jaw

                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[29][2], // rail 3 loose jaw wanted?
                                                          False, jm_aq_k*jm_h, 0-jaw_trim, 0, dxf_file);     // WO... rail 3 outer

                                                        CONTINUE;
                                                      end;

                                              if POS('VO',modjm_str)=1   // chair code 28  EF exit chairs  crossing rail 2  outer jaw skewed to match equalized chair base
                                                 then begin
                                                        jaw_trim:=jm_aq_f;

                                                        if template_info.file_blocks.keep_jaw_options[30][2]=True     // 239a loose mid jaw wanted?
                                                           then jaw_trim:=jaw_trim-_2d_data.mid_jaw_space*inscale/2;  // to allow flexing of loose mid jaw

                                                        create_SC_outer_jaw_block(modjm_str,

                                                          template_info.file_blocks.keep_jaw_options[30][2], // rail 2 loose jaw wanted?
                                                          False, 0-jm_aq_k*jm_h, 0-jaw_trim, 0, dxf_file);   // VO... rail 2 outer

                                                        CONTINUE;
                                                      end;

                                             if POS('WZ',modjm_str)=1   // chair code 28  EF exit chairs  main rail 3  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, True,False,False,False,False, jm_aq_k*jm_h, 0, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;

                                             if POS('VZ',modjm_str)=1   // chair code 28  EF exit chairs  crossing rail 2  inner jaw skewed to match equalized chair base
                                                 then begin
                                                        create_S1_SC_L1_CC_inner_jaw_block(modjm_str, True,False,False,False,False, 0-jm_aq_k*jm_h, 0, 0, 0, dxf_file);

                                                        CONTINUE;
                                                      end;


                                            end;//with
                                          end;//next jmod
                                        end;//if any

                                      end;//with template
                            end;//next template
                          end;//if jaws

                end;  // end of blocks

        s:='  0|ENDSEC|  0|SECTION|  2|ENTITIES|';

        file_ok:=False;  // init

        doing_entities:=True;

        Write(dxf_file,insert_crlf_str(s));    // end blocks and do entities header.

        if tweezer_tips_radio.Checked=True      // 236d
           then begin
                  dxf_tweezer_tips(dxf_file);
                  file_ok:=True;
                end
           else if filing_jig_radio.Checked=True
                   then begin
                          file_ok:=dxf_filing_jigs(dxf_file);
                        end
                   else begin

                          shapes_z:=dxf_background_keeps(dxf_file);    // go do all the background keeps.

                          dxf_shapes(shapes_z, dxf_file);              // then go do all the shapes.

                          file_ok:=True;

                        end;

        Write(dxf_file,insert_crlf_str('  0|ENDSEC|  0|EOF|'));

        CloseFile(dxf_file);         // and close the file.

        if stl=True       // 227a
           then begin
                  Write(stl_file,insert_crlf_str('|endsolid Templot (c) Martin Wynne'));
                  CloseFile(stl_file);

                  if stl_block_list.Count>0 then for n:=0 to stl_block_list.Count-1 do TObjectList(stl_block_list.Objects[n]).Free;
                  stl_block_list.Free;    // 227a
                end;

        if file_ok=False     // 243b
           then begin
                  DeleteFile(dxf_filename);
                  if stl=True then DeleteFile(stl_filename);
                  Screen.Cursor:=crDefault;
                  CONTINUE;
                end;

        if ModalResult=mrYes   // preview
           then begin
                  Application.ProcessMessages;

                  start_tick_count:=GetTickCount;   // wait 10 seconds max for file to save

                  if stl=True
                     then begin
                            repeat
                              Application.ProcessMessages;
                              tick_count:=GetTickCount;
                            until (FileExists(exe_str+'internal\pre\preview.stl')=True) or ((tick_count-start_tick_count)>10000);

                            preview_stl;
                          end
                     else begin
                            repeat
                              Application.ProcessMessages;
                              tick_count:=GetTickCount;
                            until (FileExists(exe_str+'internal\pre\preview.dxf')=True) or ((tick_count-start_tick_count)>10000);

                            preview_dxf;
                          end;

                  Screen.Cursor:=crDefault;

                  CONTINUE;
                end;

        Screen.Cursor:=crDefault;

        if (_3d=True) and (stl_radio.Checked=True)
           then report_str:=''
           else report_str:='Created DXF file:||`0'+dxf_filename+'`f';

        if stl=True
           then begin
                  report_str:=report_str+'||Created STL file:||`0'+stl_filename+'`f'
                                        +'||STL files from Templot need to be finalized by a mesh-fixing repair process before they can be used for 3D printing.'
                                        +'||If you have the `03D Builder`3 app installed on your system you can open the STL file for easy mesh fixing by clicking the green bar below.'
                                        +'||green_panel_begin tree.gif  The `03D Builder`3 app can be easily obtained and installed from the Microsoft App Store.||Click the top blue bar to get it.green_panel_end'
                                        +'|If not, click the option to access a free online mesh-fixing service instead.'
                                        +'||Refer to the Templot Club user forum for more information.';                          // 241b

                  get_builder_str:='get  3D Builder';
                  continue_str:='open  STL  file  in  3D  Buider  for  mesh  fixing';
                  repair_str:='continue  without  mesh  fixing';
                  online_str:='visit  free  online  mesh-fixing  service';
                end
           else begin
                  get_builder_str:='';
                  continue_str:='continue';
                  repair_str:='';
                  online_str:='';
                end;


        i:=alert(2,'    DXF / STL  file(s)  created',
                   report_str,
                   '',get_builder_str,online_str,'open  the  containing  folder',repair_str,continue_str,0);

        case i of

             2: go_to_url('https://apps.microsoft.com/store/detail/3d-builder/9WZDNCRFJ3T6');

             3: go_to_url('https://www.formware.co/onlinestlrepair');

             4: begin
                  if stl=True
                     then folder_str:=ExtractFilePath(stl_filename)
                     else folder_str:=ExtractFilePath(dxf_filename);

                  if ShellExecute(0,'explore',PChar(folder_str),nil,nil,SW_SHOWNORMAL)<=32
                     then show_modal_message('Sorry, unable to open the folder.')
                     else external_window_showing:=True;
                end;

             6: if stl=True
                   then begin
                          if mesh_fix_msg_pref=False
                             then begin

                                    alert_box.preferences_checkbox.Checked:=False;
                                    alert_box.preferences_checkbox.Show;


                                    n:=alert(2,'    STL  file  -  mesh - fixing',
                                               '    `0STL file - mesh-fixing`9'
                                              +'||green_panel_begin tree.gif If you have installed `03D Builder`3 for STL files :'
                                              +'|||When `03D Builder`3 opens showing your STL file:'
                                              +'||1. click `0Import Model`z'
                                              +'||2. click `0Repair`z (spanner/wrench icon) and wait for it to finish (it may take several minutes)'
                                              +'||3. click `0Save`z icon'
                                              +'||4. close 3D Builder to return to Templot.green_panel_end'
                                              +'|Refer to the Templot Club user forum for more information.',
                                               '','','','','cancel  mesh-fixing','continue',0);

                                    mesh_fix_msg_pref:=alert_box.preferences_checkbox.Checked;
                                    alert_box.preferences_checkbox.Hide;

                                    if n=5 then CONTINUE;

                                  end;

                          Screen.Cursor:=crHourGlass;

                          if LowerCase(ExtractFilePath(stl_filename))=LowerCase(exe_str+'STL-FILES-RAW\')  // default location?   Copy into FIXED folder for fixing
                             then begin
                                    default_loc:=True;

                                    stl_fixed_filename:=exe_str+'STL-FILES-FIXED\'+ExtractFileName(stl_filename);

                                    if FileExists(stl_filename)=True
                                       then CopyFile(PChar(stl_filename),PChar(stl_fixed_filename),False);

                                    file_str:=stl_fixed_filename;
                                  end
                             else begin
                                    default_loc:=False;
                                    file_str:=stl_filename;
                                  end;

                          if ShellExecute(0,'open',PChar(file_str),nil,nil,SW_SHOWNORMAL)<=32   // 0.79.a
                             then begin
                                    Screen.Cursor:=crDefault;
                                    show_modal_message('Sorry, unable to open the STL file for mesh-fixing.');
                                    CONTINUE;
                                  end
                             else external_window_showing:=True;

                          builder_name_str:='3D Builder';
                          builder_running:=(FindWindow(nil,PChar(builder_name_str))<>0);

                          Sleep(2000);

                          repeat
                            Sleep(200);
                            Application.ProcessMessages;
                          until Application.Active=True;

                          Sleep(200);

                          Screen.Cursor:=crDefault;

                          if (default_loc=True) and (builder_running=True) and (FindWindow(nil,PChar(builder_name_str))=0)   // show fixed folder if 3D Builder now closed
                             then begin
                                    folder_str:=exe_str+'STL-FILES-FIXED\';

                                    if ShellExecute(0,'explore',PChar(folder_str),nil,nil,SW_SHOWNORMAL)<=32
                                       then show_modal_message('Sorry, unable to open the STL folder.')
                                       else external_window_showing:=True;
                                  end;

                        end;

        end;//case

      except
        Screen.Cursor:=crDefault;
        alert(5,'      file  error',
                '||Unable to create DXF/STL file(s).'
               +'||Please check the file and folder names and that this file is not in use by another application.'
               +'||If saving to a floppy disk, please check that it is not write-protected.'
               +' DXF files are much larger than Templot box data files. A large drawing may have exceeded the capacity of the floppy disk.',
               '','','','','cancel  DXF / STL','',0);
      end;//try
    end;//with

    Screen.Cursor:=crDefault;

  until 0<>0;   // show it modal again    228a
end;
//______________________________________________________________________________

procedure Tdxf_form.ok_panelClick(Sender: TObject);

var
  old:extended;
  str:string;

begin
  floating_warned:=False;  // init  235a

  doing_tools:=False;  // init 241b

  if tweezer_tips_radio.Checked=True
     then begin
            if _2d_radiobutton.Checked=True
               then begin
                      show_modal_message('invalid request :'+#13+#13+'You have set the export format to 2-D.'+#13+#13+'The tweezer tips can be exported in 3-D only.'
                                        +#13+#13+'If you want to export track in 2-D, change the export option to "track".');
                      EXIT;
                    end;

            doing_tools:=True;
          end
     else begin
            if filing_jig_radio.Checked=True
               then begin
                      if _2d_radiobutton.Checked=True
                         then begin
                                show_modal_message('invalid request :'+#13+#13+'You have set the export format to 2-D.'+#13+#13+'The filing jigs can be exported in 3-D only.'
                                                  +#13+#13+'If you want to export track in 2-D, change the export option to "track".');
                                EXIT;
                              end;

                      with jigs_form do begin
                        xing_control_label.Caption:='1: '+FormatFloat('0.##',k3n);
                        if gaunt=False
                           then switch_control_label.Caption:='1: '+FormatFloat('0.##',k1n)
                           else switch_control_label.Caption:='';
                      end;//with

                      if do_show_modal(jigs_form)=mrOk
                         then begin
                                doing_tools:=True;     // global
                              end
                         else EXIT;

                    end;
          end;

  if doing_tools=False
     then begin
              // needed for rebuild ...

            old:=fw_tweak_xing+fw_tweak_check;

            fw_tweak_xing:=0;  // init
            fw_tweak_check:=0; // init

            try
              fw_tweak_xing:=StrToFloat(Trim(xing_flangeway_tweak_edit.Text));  // 239a   // 237a
              fw_tweak_check:=StrToFloat(Trim(check_flangeway_tweak_edit.Text));  // 239a   // 237a
            except
              show_modal_message('error: flangeway adjustments must be a valid number with no spaces or other text');
              EXIT;
            end;

            if old<>(fw_tweak_xing+fw_tweak_check)
               then show_modal_message('Information'
                                            +#13+#13+'If you have made a change to the flangeway adjustments it will be necessary'
                                                +#13+'to make a new timbering base if it includes crossings or check rails.'
                                            +#13+#13+'And new crossing and check-rail chairs to match.'+#13+' ');

            fw_correction_check:=fw_tweak_check+fw_mod_for_gw;   // add any gauge-widening

            old:=chair_web_adjustment;
            try
              chair_web_adjustment:=StrToFloat(Trim(dxf_form.chair_adjust_edit.Text));
            except
              show_modal_message('error: chair rail-fit adjustment must be a valid number with no spaces or other text');
              EXIT;
            end;

            if chair_web_adjustment<>old then show_modal_message('Information'
                                                        +#13+#13+'If you have made a change to the chair rail-fit it will be'
                                                            +#13+'necessary to make all new chairs (and loose jaws if used).'
                                                        +#13+#13+'There is no change needed to the timbering base.'+#13+' ');

            pad_form.generator_rebuild_bgnd_menu_entry.Click;     // 237d  rebuild first

          end;

  if _2d_radiobutton.Checked=True
     then begin
            x_shrinkage_factor:=1.0;
            y_shrinkage_factor:=1.0;
            z_shrinkage_factor:=1.0;
          end
     else if _3d_fdm_radiobutton.Checked=True
             then begin
                    if heated_bed_checkbox.Checked=True
                       then begin
                              x_shrinkage_factor:=fdm_hot_shrinkage_x;
                              y_shrinkage_factor:=fdm_hot_shrinkage_y;
                              z_shrinkage_factor:=fdm_hot_shrinkage_z;
                            end
                       else begin
                              x_shrinkage_factor:=fdm_cold_shrinkage_x;
                              y_shrinkage_factor:=fdm_cold_shrinkage_y;
                              z_shrinkage_factor:=fdm_cold_shrinkage_z;
                            end;
                  end
             else if _3d_resin_radiobutton.Checked=True
                     then begin
                            x_shrinkage_factor:=resin_shrinkage_x;
                            y_shrinkage_factor:=resin_shrinkage_y;
                            z_shrinkage_factor:=resin_shrinkage_z;
                          end
                     else if _3d_cad_radiobutton.Checked=True
                             then begin
                                    x_shrinkage_factor:=cad_shrinkage_x;
                                    y_shrinkage_factor:=cad_shrinkage_y;
                                    z_shrinkage_factor:=cad_shrinkage_z;
                                  end;

  if (Sender=preview_button) or (Sender=preview_panel)
     then ModalResult:=mrYes
     else ModalResult:=mrOK;
end;
//______________________________________________________________________________

procedure Tdxf_form.rebuild_now_buttonClick(Sender: TObject);

begin

  try
    fw_tweak_xing:=StrToFloat(Trim(xing_flangeway_tweak_edit.Text));  // 239a   // 237a
    fw_tweak_check:=StrToFloat(Trim(check_flangeway_tweak_edit.Text));  // 239a   // 237a
  except
    show_modal_message('error: flangeway adjustments must be a valid number with no spaces or other text');
    EXIT;
  end;

  fw_correction_check:=fw_tweak_check+fw_mod_for_gw;   // add any gauge-widening

  try
    chair_web_adjustment:=StrToFloat(Trim(dxf_form.chair_adjust_edit.Text));
  except
    show_modal_message('error: chair fit adjustment must be a valid number with no spaces or other text');
    EXIT;
  end;

  pad_form.generator_rebuild_bgnd_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tdxf_form.help_buttonClick(Sender: TObject);

const
  help_str:string='   `0Export  in  DXF / STL  file  format`9'

 +'|| tree.gif  These are old notes from 25 years ago. For up-to-date information about 3-D exports for 3D-printed plug track please refer to the Templot Club forum, or click the|'
 +'`03-D  DXF / STL  exports  -  more  information`z|button at the bottom of these notes.|<HR>'

 +'|N.B. This export function is not Templot''s normal data file saving function. To save your track design work in the normal way for later reloading, click the SAVE ALL... or SAVE GROUP... buttons on the STORAGE BOX,'
 +' or click the FILES > SAVE ALL TEMPLATES... menu item on the trackpad window.'

 +'||This DXF export function is primarily intended as a means of transferring Templot''s drawings to other software, or to specialist copying services for printing in large format.'

 +'||Exported DXF files can only be re-imported into Templot as part of the BACKGROUND SHAPES functions, which do not permit the templates to be further copied, adjusted or aligned.'
 +' This is occasionally useful as a means of comparing two track plans, or when you want to use an existing track plan as a background design guide.'

 +'||Templot will generate a DXF file from the current background drawing using these colours and styles for each layer.'
 +' Select your required settings from the drop-down lists.'

 +'||To omit a layer from the file, select NONE as the colour for that layer. You will rarely want to do this as'
 +' most CAD software using this file format permits you to omit unwanted layers. The exception to this is the RADIAL CENTRES layer which should normally be omitted - see Handy Hints below.'
 +' Omitting layers here does reduce the file size, which might be useful if you are saving to a floppy disk.'

 +'||Don''t get confused - these "layers" are only meaningful within your CAD program. To toggle elements of the drawing on or off within Templot,'
 +' use the GENERATOR > GENERATOR SETTINGS > menu items. Each background template is exported in its present state. If timber outlines, say, were switched off in the GENERATOR SETTINGS > menu when the background template'
 +' was copied or rebuilt, they won''t appear in the DXF file, regardless of which colour you choose for them.'

 +'||The DXF file can be exported in millimetres (to 2 decimal places) or inches (to 4 decimal places), click the MM or INCHES option buttons accordingly.'
 +' You will probably need to specify which when importing the file into your CAD program. (If you have difficulty getting the CAD drawing to import at the correct size, try using the other option.)'

 +'||If the SCALED box is ticked, the DXF data will be scaled in accordance with the current PRINT > ENLARGE / REDUCE SIZE menu setting, as shown.'
 +' If this box is blank, the DXF data will be exported at full-size (100%) regardless of the print size setting.'

 +'||To omit some of your background templates from the file, click the GROUP TEMPLATES ONLY option button, having first selected the ones you do require as members of a group.'
 +' (By clicking them on the pad, and then clicking GROUP SELECT (TOGGLE) on the pop-up menu, or by clicking the GROUP SELECT button in the storage box.)'

 +'||The control template is not included in DXF files. To export the control template only, you should store a copy of the control template as a background template, and then select it as the only member of a group.'

 +'||If the DRAWING LIMITS box is ticked, only the currently visible part of the trackpad drawing will be included in the file, and the drawing limit dimensions will be included in the file header.'
 +'||By re-sizing the trackpad window on the screen, and zooming in or out, you can in this way export any selected area of the drawing.'
 +' Compare this option with GROUP TEMPLATES ONLY (see above), in which only the selected group templates are exported, but without regard to whether they are currently visible.'
 +'||If the DRAWING LIMITS box is left blank, the entire background area will be exported, regardless of the current trackpad view and zoom settings. (If your CAD software reports "Bad Header" when loading files from Templot,'
 +' this box should be ticked, and you should then zoom out and re-position the trackpad view sufficiently to see all of the required part of your drawing.)'

 +'||Your chosen colours may or may not appear correctly - some CAD software maps different colours onto the DXF pen codes'
 +' or uses the current pen colour settings instead. And "black" means "white" if your CAD program uses a dark screen.'
 +' Experiment with dotted and dashed lines to get the required result in the CAD program you are using.'
 +'||Unlike Templot''s own box file format, the DXF file contains only the template drawings. The information texts'
 +' and your memo texts are not included. If these details will be needed externally to Templot, click the WRITE button in the information panel'
 +' and save them as a separate text file.'
 +'||In generating the DXF file, any printer calibration is ignored.'
 +' The grid and page alignment marks are also omitted. If necessary for the destination software or printer, the aspect ratio and scaling can'
 +' be adjusted using data distortions - see the PROGRAM > EXPERT menu items on the PROGRAM PANEL menus.'
 +'||For background PICTURE SHAPES the DXF file contains only a rectangular outline, not the bitmap image contents. Consult the documentaion for your CAD or drawing software about importing bitmap images.'
 +'||Handy Hints :'

 +'||If the DRAWING LIMITS box is left blank (see above), it is better to omit the radial centre marks. Your CAD program may otherwise scale down the drawing in order to accommodate them. If you are using very large radii your templates'
 +' could then appear as little more than a smudge in the corner of the paper.'
 +'||If the DRAWING LIMITS box is ticked, the radial centre marks can be included, since only those visible on the trackpad will be included in the file.'

 +'||When using the DRAWING LIMITS option to export a selected area, set a fraction larger area to allow for the ragged edges. The margins can be cropped cleanly to your exact requirements in your CAD software.'

 +'||Remember that DXF files are much larger than Templot''s own box data files. A complete track layout which requires say 150KB in Templot format can be 3MB or more as a DXF file. Don''t accumulate more of them than you need,'
 +' and remember to omit unwanted features to save file space. It is better to save your work as Templot files and generate DXFs only as needed.'
 +'||N.B. If the SCALED box is ticked, and the print size is currently set to PRINT SINGLE PAGE, it will be necessary to have actually printed such a page before this size option will take effect for the DXF file.';


begin
  if help(0,help_str,'3-D  DXF / STL  exports  -  more  information')=1 then go_to_url('https://85a.uk/templot/companion/plug_track.php');
end;
//________________________________________________________________________________________

procedure formsize_updown_click;

begin
  with dxf_form do begin

    if size_updown.Position>size_updown.Tag  // ! position goes up, size goes down.
       then ScaleBy(9,10);                   // scale the form contents down.

    if size_updown.Position<size_updown.Tag
       then ScaleBy(10,9);                   // scale the form contents up.

    ClientHeight:=VertScrollBar.Range;       // don't need bottom margin - datestamp label provides this (aligned alBottom).
    ClientWidth:=HorzScrollBar.Range+4;      // allow 4 pixel right margin.
    ClientHeight:=VertScrollBar.Range;       // do this twice, as each affects the other (autoscroll).

    size_updown.Tag:=size_updown.Position;   // and save for the next click.
  end;//with
end;//proc
//____________________________________________________________________

procedure Tdxf_form.size_updownClick(Sender:TObject; Button:TUDBtnType);

begin
  formsize_updown_click;
end;//proc
//____________________________________________________________________

procedure Tdxf_form.colour_panelClick(Sender: TObject);

begin
  Color:=get_colour('choose  a  new  colour  for  the  DXF  dialog',Color);
end;
//__________________________________________________________________________________________

procedure Tdxf_form.cancel_panelClick(Sender: TObject);

begin
  ModalResult:=mrCancel;
end;
//_________________________________________________________________________________________

function dxf_background_keeps(var dxf_file:TextFile):extended;  //  all the background keeps.     // 234e return 3D z depth for background shapes

type
  Tpexes=array[0..59] of Tpex;    // 241b

  Ttimber_sockets=record
                    corners:Tsocket_corners;
                    upm:extended;                // from org end of timber to middle of socket
                    ns:Tpex;                     // distance upm along edge of timber, near side
                    fs:Tpex;                     // distance upm along edge of timber, far side
                    valid:boolean;
                  end;

var
  socket_list:TStringList;  // 232a

  timber_sockets:array[0..35] of Ttimber_sockets;  // up to 36 sockets max on a timber (for bridge chairs on waybeams)  234e  was 0..11

  i,n,np,nn,ni,nj,nw,nv,njs,m:integer;

  code:integer;

  n1,n2,blanks:integer;

  infill_corner1,infill_corner2,infill_corner3,infill_corner4:Tpex;      // 232a

  timber_corner1,timber_corner2,timber_corner3,timber_corner4:Tpex;      // 236a

  p:array[0..47] of TPoint;  // 237a was 39  236d  was 35              221a       was 27        228b was 31

  out_flange_pex:array[0..7] of Tpex;     // 228a  timber flange

  pex:Tpexes;
  sockets_pex:Tpexes;

  sprue_pex:array[0..5] of Tpex;

  web_pex:array[0..3] of Tpex;  // 228b

  pc,pc1,pc2,pc3,pc4:TPoint;  // 221a

  ps1,ps2,ps3,ps4,ps5,ps6,ps7,ps8,ps9,ps10,ps11,ps12,ps13,ps14,ps15,ps16:TPoint;   // 228b

  pex1,pex2,pex3,pex4:Tpex;

  move_to,line_to:TPoint;

  x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6:extended;

  x13,x14,x15,x16,x17,x18,x19,x20:extended;
  y13,y14,y15,y16,y17,y18,y19,y20:extended;

  x21,y21,x22,y22:extended;  // 223a

  z1,z2,z3,z4,z5,z6,z7,z8,z9,z10,z11,z12,z13,z14,z15,Z50:extended; // 221a

  z99:extended;  // plug depth  MAR 2021

  railtop_width:extended;  // 221a
  top_sides:extended;      // 221a

  railbottom_width:extended;  // 223a
  bottom_sides:extended;      // 223a

  k_dxf:extended;   // 221a

  xk,yk:extended;

  s,dxf_str:string;   // 221a

  dxf_lay:integer;              // 237c ..
  dxf_x,dxf_y,dxf_k:extended;

  modj_str,modjm_str:string;  // 237c ...
  pbolt_str:string;
  jaw_trim:extended;

  fb_kludge_this:integer;  // 227a

  ch_code:integer;  // 221a

  layer:integer;

  aq:integer;
  array_max:integer;

  radcen_dim:integer;
  cen_point:Tpoint;

  now_keep:Tbgnd_keep;
  now_ti:Ttemplate_info;  //227a

  mod_name_x,mod_name_y:extended;
  text_height:extended;
  tbnum_str, text_str:string;

  fixed_diamond_ends:boolean;


  hand:integer;

  z80,z81,z82:extended;      // 241b ..
  z85,z86,z87:extended;

  tangs,double_tangs:boolean;


  straaa:string; // debug
  aaa:integer;   // debug


  midtang36_pex,midtang37_pex,midtang38_pex,midtang39_pex:Tpex;

  z90,z95,z96,z97,z98:extended;

  locator_depth_mod:extended;

  nnn:integer;
  nnn_str:string;

  ns_timb_diffx,ns_timb_diffy,timb_length:extended;   // near side

  ne_timb_diffx,ne_timb_diffy,timb_width:extended;    // near end

  template_is_waybeams:boolean;

  debug_c:integer;  // debug

  extra_opening:integer;

  soleplate_mark_count:integer;  // 236b

  sp_z:extended; // 236b

  ss1,ss2,ss3,ss4:Tpex;     // 236d   loose pin slot rectangle at plinth and top of plug
  ss5,ss6,ss7,ss8:Tpex;     // 236d   loose pin slot rectangle at base of plug - sheared position for angled slot (L1 chairs)
  ss9,ss10,ss11,ss12:Tpex;    // 237a   loose pin slot rectangle - second slot for check chairs inners
  ss13,ss14,ss15,ss16:Tpex;   // 237a   loose pin second slot rectangle at base of plug - sheared position for angled second slot (L1 chairs)

  slot_shear:extended;   // 236d  offset to bottom of angled slot

  pmid1,pmid2,pmid3,pmid4,pmid5,pmid6,pmid7,pmid8,pmid9,pmid10:Tpex;  // 236d  support pyramid parts under slotted plug

  doing_L1:boolean; // 236d

  tb_encoded:extended;  // 237a

  slots_wanted:integer;

  loose_1st,loose_2nd:boolean;    // 238a

  plug_extended_depth,plug_taper_depth,plug_inset_depth,plug_total_depth:extended;   // 241b

  undercut_depth,clearcut_depth:extended;   // 241b

  do_flange,do_web:boolean;   // 244c socket corners conflict check
  sockn:integer;              // 244c
  socket_middle_pex:Tpex;     // 244c


                              ////////////////////////////////////////////////////////////

                              procedure dxf_text;      // put a text item in the file.

                              var
                                s:string;

                              begin
                                if (colour(layer)<>'0|') and (_3d=False)       // does he want this in the file ?
                                   then begin
                                          x1:=move_to.x/100; y1:=move_to.y/100-text_height;   // (convert Templot top-left to DXF bottom-left.)

                                          if dxf_form.limits_checkbox.Checked=True     // only within limits?
                                             then begin
                                                    if (x1>xmax) or (y1>ymax) then EXIT;
                                                    if (x1<xmin) or (y1<ymin) then EXIT;
                                                  end;

                                          debug_code:=4;

                                          s:='  0|TEXT|  8|'+layer_str[layer]
                                            +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
                                            +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y1)
                                            +' 40|'+make_dim(0,1,1,0,text_height)
                                            +'  1|'+text_str+'|';

                                          Write(dxf_file,insert_crlf_str(s));
                                        end;
                              end;
                              ////////////////////////////////////////////////////////////

                              procedure insert_bolt;

                              begin

                                if dxf_form.chair_bolts_combo.ItemIndex=0 then EXIT;      // not wanted in file

                                if (now_ti.file_blocks.keep_jaw_options[chi][2]=True)   // 239a
                               and (now_ti.file_blocks.keep_jaw_options[chi][3]=True)   // not exporting a loose jaw
                                   then EXIT;

                                if (dxf_form.limits_checkbox.Checked=True)     // only within limits?
                               and ((x1>xmax) or (y1>ymax) or (x1<xmin) or (y1<ymin))
                                   then do_nothing
                                   else begin

                                          debug_code:=5;

                                          s:='  0|INSERT|  2|BOLTBOSS|  8|'+layer_str[19]
                                            +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,(x1+x2)/2)
                                            +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,(y1+y2)/2)
                                            +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,0)

                                            +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                            +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                            +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                            +' 50|'+make_angle(0);

                                          debug_code:=6;

                                        s:=s+'  0|INSERT|  2|BOLTHEAD|  8|'+layer_str[15]
                                            +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,(x1+x2)/2)
                                            +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,(y1+y2)/2)
                                            +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,0)

                                            +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                            +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                            +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                            +' 50|'+make_angle(Random(90));

                                          Write(dxf_file,insert_crlf_str(s));

                                          if stl=True then insert_stl_block('BOLTBOSS',(x1+x2)/2,(y1+y2)/2,0,0);                  // 227a ..
                                          if stl=True then insert_stl_block('BOLTHEAD',(x1+x2)/2,(y1+y2)/2,0,Random(90)*Pi/180);

                                        end;
                              end;
                              //////////////////////////////////////////////////

                              procedure dxf_mark;      // put a mark in the DXF file.

                              begin

                                if colour(layer)<>'0|'       // does he want this in the file ?
                                   then begin
                                          x1:=move_to.x/100; y1:=move_to.y/100;
                                          x2:=line_to.x/100; y2:=line_to.y/100;

                                          if _3d=False
                                             then begin
                                                    Write(dxf_file,dxf_line(x1, y1, 0, x2, y2, 0, layer));   // 2D outline
                                                  end
                                             else begin
                                                    if code=495 then insert_bolt;     // 3D

                                                  end;
                                        end;
                              end;
                              //////////////////////////////////////////////////

                              procedure dxf_mark_end(aq1, aq1end, aq2, aq2end:integer);  // make the background rail end mark.

                              begin
                                with now_keep do begin
                                  if (bgnd_endmarks_yn[aq1,aq1end]=True) and (bgnd_endmarks_yn[aq2,aq2end]=True)
                                     then begin
                                            move_to:=bgnd_endmarks[aq1,aq1end];
                                            line_to:=bgnd_endmarks[aq2,aq2end];

                                            x1:=move_to.x/100; y1:=move_to.y/100;
                                            x2:=line_to.x/100; y2:=line_to.y/100;

                                            if _3d=True
                                               then begin

                                                      x3:=x1+top_sides/railtop_width*(x2-x1);   // web on x1 side
                                                      y3:=y1+top_sides/railtop_width*(y2-y1);

                                                      x4:=x1+(top_sides+rail_web_thickness)/railtop_width*(x2-x1);   // web on x2 side
                                                      y4:=y1+(top_sides+rail_web_thickness)/railtop_width*(y2-y1);

                                                      x21:=x1+(top_sides-bottom_sides)/railtop_width*(x2-x1);   // foot on x1 side
                                                      y21:=y1+(top_sides-bottom_sides)/railtop_width*(y2-y1);

                                                      x22:=x1+(top_sides+rail_web_thickness+bottom_sides)/railtop_width*(x2-x1);   // foot on x2 side
                                                      y22:=y1+(top_sides+rail_web_thickness+bottom_sides)/railtop_width*(y2-y1);

                                                      x13:=x1+rc/railtop_width*(x2-x1);   // corner rad on x1 side
                                                      y13:=y1+rc/railtop_width*(y2-y1);

                                                      x14:=x2-rc/railtop_width*(x2-x1);   // corner rad on x2 side
                                                      y14:=y2-rc/railtop_width*(y2-y1);

                                                      x15:=x1+rail_corner_offset1/railtop_width*(x2-x1);   // corner rad step 1 on x1 side
                                                      y15:=y1+rail_corner_offset1/railtop_width*(y2-y1);

                                                      x16:=x2-rail_corner_offset1/railtop_width*(x2-x1);   // corner rad step 1 on x2 side
                                                      y16:=y2-rail_corner_offset1/railtop_width*(y2-y1);

                                                      x17:=x1+rail_corner_offset2/railtop_width*(x2-x1);   // corner rad step 2 on x1 side
                                                      y17:=y1+rail_corner_offset2/railtop_width*(y2-y1);

                                                      x18:=x2-rail_corner_offset2/railtop_width*(x2-x1);   // corner rad step 2 on x2 side
                                                      y18:=y2-rail_corner_offset2/railtop_width*(y2-y1);

                                                      x19:=x1+rail_corner_offset3/railtop_width*(x2-x1);   // corner rad step 3 on x1 side
                                                      y19:=y1+rail_corner_offset3/railtop_width*(y2-y1);

                                                      x20:=x2-rail_corner_offset3/railtop_width*(x2-x1);   // corner rad step 3 on x2 side
                                                      y20:=y2-rail_corner_offset3/railtop_width*(y2-y1);

                                                      debug_code:=162;

                                                      Write(dxf_file,dxf_3dface(x13,y13,  0, x14,y14,  0, x16,y16, z9, x15,y15, z9, 14,0));     // head corners
                                                      Write(dxf_file,dxf_3dface(x15,y15, z9, x16,y16, z9, x18,y18,z10, x17,y17,z10, 14,0));
                                                      Write(dxf_file,dxf_3dface(x17,y17,z10, x18,y18,z10, x20,y20,z11, x19,y19,z11, 14,0));
                                                      Write(dxf_file,dxf_3dface(x19,y19,z11, x20,y20,z11,  x2, y2,z12,  x1, y1,z12, 14,0));
                                                      Write(dxf_file,dxf_3dface( x1, y1,z12,  x2, y2,z12,  x2, y2, z1,  x1, y1, z1, 14,0));

                                                      Write(dxf_file,dxf_3dface( x1, y1, z1,  x2, y2, z1,  x4, y4, z2,  x3, y3, z2, 14,0));   // top fish angle

                                                      Write(dxf_file,dxf_3dface(x3,y3,z2, x4,y4,z2, x4,y4,z3, x3,y3,z3, 14,0));    // middle of web

                                                      Write(dxf_file,dxf_3dface(x3,y3,z3, x4,y4,z3, x22,y22,z4, x21,y21,z4, 14,0));    // bottom fish angle

                                                      Write(dxf_file,dxf_3dface(x21,y21,z4, x22,y22,z4, x22,y22,z5, x21,y21,z5, 14,0));    // rail foot
                                                    end
                                               else Write(dxf_file,dxf_line(x1, y1, 0, x2, y2, 0, layer));  // 2d at rail top.

                                          end;
                                end;//with
                              end;
                              //////////////////////////////////////////////////////////

                              procedure dxf_bgnd_rail(do_3d:boolean);

                              var
                                nk:integer;

                                nko,array_max_outer,nk_3d_start:integer;
                                move_to_outer,line_to_outer:TPoint;
                                x11,y11,x12,y12:extended;

                                x31,y31,x32,y32,x41,y41,x42,y42:extended;

                                x33,y33,x35,y35,x37,y37,x39,y39:extended;
                                x34,y34,x36,y36,x38,y38,x40,y40:extended;

                                x43,y43,x45,y45,x47,y47,x49,y49:extended;
                                x44,y44,x46,y46,x48,y48,x50,y50:extended;

                                x61,y61,x62,y62,x71,y71,x72,y72:extended;  // 223a



                              begin
                                if (do_3d=False) and (fb_kludge_this<>0)   // 227a ..
                                   then case aq of
                                          0..7,16,18,20,22,26,28: EXIT;    // 2-D gauge faces not wanted for FB kludge templates
                                        end;

                                with now_keep do begin

                                  array_max:=intarray_max(list_bgnd_rails[aq,0]);
                                  if array_max=0 then EXIT;                       // empty rail.

                                  if (do_3d=True) and (aq<9) then array_max_outer:=intarray_max(list_bgnd_rails[aq+8,0])
                                                             else array_max_outer:=0;

                                     // run along rail head...

                                  move_to.x:=intarray_get(list_bgnd_rails[aq,0],0);
                                  move_to.y:=intarray_get(list_bgnd_rails[aq,1],0);

                                  nk_3d_start:=0;     // keep compiler happy.

                                  if array_max_outer>0     // for 3-D.
                                     then begin
                                            move_to_outer.x:=intarray_get(list_bgnd_rails[aq+8,0],0);
                                            move_to_outer.y:=intarray_get(list_bgnd_rails[aq+8,1],0);

                                            case aq of
                                                    1: nk_3d_start:=planing_end_aq1; // start top infill from end of planing
                                                    2: nk_3d_start:=planing_end_aq2;
                                                  else nk_3d_start:=0;
                                            end;//case

                                            if nk_3d_start<0 then nk_3d_start:=0;
                                          end;

                                  for nk:=1 to array_max do begin

                                    line_to.x:=intarray_get(list_bgnd_rails[aq,0],nk);
                                    line_to.y:=intarray_get(list_bgnd_rails[aq,1],nk);

                                    x1:=move_to.x/100; y1:=move_to.y/100;
                                    x2:=line_to.x/100; y2:=line_to.y/100;

                                    if do_3d=True               // 3-D ...
                                       then begin
                                                      // rail sides...

                                                 // use same index into outer rail edge (aproximation) (except blades)...

                                              if array_max_outer>0         // valid outer rail edge.
                                                 then begin
                                                        nko:=nk-nk_3d_start;
                                                        if nko>array_max_outer then nko:=array_max_outer;
                                                        if nko<0 then nko:=0;

                                                        line_to_outer.x:=intarray_get(list_bgnd_rails[aq+8,0],nko);
                                                        line_to_outer.y:=intarray_get(list_bgnd_rails[aq+8,1],nko);

                                                        x11:=move_to_outer.x/100; y11:=move_to_outer.y/100;
                                                        x12:=line_to_outer.x/100; y12:=line_to_outer.y/100;

                                                          // gauge-face...

                                                        x31:=x1+top_sides/railtop_width*(x11-x1);   // web at x1
                                                        y31:=y1+top_sides/railtop_width*(y11-y1);

                                                        x61:=x1+(top_sides-bottom_sides)/railtop_width*(x11-x1);     // 223a   rail foot
                                                        y61:=y1+(top_sides-bottom_sides)/railtop_width*(y11-y1);


                                                          // round corner rad from top, gauge-face...

                                                          // at x1...

                                                        x33:=x1+rc/railtop_width*(x11-x1);
                                                        y33:=y1+rc/railtop_width*(y11-y1);

                                                        x35:=x1+rail_corner_offset1/railtop_width*(x11-x1);
                                                        y35:=y1+rail_corner_offset1/railtop_width*(y11-y1);

                                                        x37:=x1+rail_corner_offset2/railtop_width*(x11-x1);
                                                        y37:=y1+rail_corner_offset2/railtop_width*(y11-y1);

                                                        x39:=x1+rail_corner_offset3/railtop_width*(x11-x1);
                                                        y39:=y1+rail_corner_offset3/railtop_width*(y11-y1);


                                                        x32:=x2+top_sides/railtop_width*(x12-x2);    // web at x2
                                                        y32:=y2+top_sides/railtop_width*(y12-y2);

                                                        x62:=x2+(top_sides-bottom_sides)/railtop_width*(x12-x2);    // 223a   rail foot
                                                        y62:=y2+(top_sides-bottom_sides)/railtop_width*(y12-y2);

                                                          // corner rad at x2...

                                                        x34:=x2+rc/railtop_width*(x12-x2);
                                                        y34:=y2+rc/railtop_width*(y12-y2);

                                                        x36:=x2+rail_corner_offset1/railtop_width*(x12-x2);
                                                        y36:=y2+rail_corner_offset1/railtop_width*(y12-y2);

                                                        x38:=x2+rail_corner_offset2/railtop_width*(x12-x2);
                                                        y38:=y2+rail_corner_offset2/railtop_width*(y12-y2);

                                                        x40:=x2+rail_corner_offset3/railtop_width*(x12-x2);
                                                        y40:=y2+rail_corner_offset3/railtop_width*(y12-y2);

                                                             // outer-edge ...

                                                        x41:=x1+(top_sides+rail_web_thickness)/railtop_width*(x11-x1);    // web at x1
                                                        y41:=y1+(top_sides+rail_web_thickness)/railtop_width*(y11-y1);

                                                        x71:=x1+(top_sides+bottom_sides+rail_web_thickness)/railtop_width*(x11-x1);    // 223a  outer foot
                                                        y71:=y1+(top_sides+bottom_sides+rail_web_thickness)/railtop_width*(y11-y1);


                                                          // round corner rad from top, outer-edge...

                                                          // at x11...

                                                        x43:=x11-rc/railtop_width*(x11-x1);
                                                        y43:=y11-rc/railtop_width*(y11-y1);

                                                        x45:=x11-rail_corner_offset1/railtop_width*(x11-x1);
                                                        y45:=y11-rail_corner_offset1/railtop_width*(y11-y1);

                                                        x47:=x11-rail_corner_offset2/railtop_width*(x11-x1);
                                                        y47:=y11-rail_corner_offset2/railtop_width*(y11-y1);

                                                        x49:=x11-Rail_corner_offset3/railtop_width*(x11-x1);
                                                        y49:=y11-rail_corner_offset3/railtop_width*(y11-y1);


                                                             // at x2 ...

                                                        x42:=x2+(top_sides+rail_web_thickness)/railtop_width*(x12-x2);    // outer-edge web at x2
                                                        y42:=y2+(top_sides+rail_web_thickness)/railtop_width*(y12-y2);


                                                        x72:=x2+(top_sides+bottom_sides+rail_web_thickness)/railtop_width*(x12-x2);    // 223a  outer foot
                                                        y72:=y2+(top_sides+bottom_sides+rail_web_thickness)/railtop_width*(y12-y2);


                                                          // corner rad at x12...

                                                        x44:=x12-rc/railtop_width*(x12-x2);
                                                        y44:=y12-rc/railtop_width*(y12-y2);

                                                        x46:=x12-rail_corner_offset1/railtop_width*(x12-x2);
                                                        y46:=y12-rail_corner_offset1/railtop_width*(y12-y2);

                                                        x48:=x12-rail_corner_offset2/railtop_width*(x12-x2);
                                                        y48:=y12-rail_corner_offset2/railtop_width*(y12-y2);

                                                        x50:=x12-rail_corner_offset3/railtop_width*(x12-x2);
                                                        y50:=y12-rail_corner_offset3/railtop_width*(y12-y2);


                                                           // top corner rad, outer-edge, upwards from bottom of head ...

                                                        debug_code:=163;


                                                        Write(dxf_file,dxf_3dface(x11,y11, z1, x12,y12, z1, x12,y12,z12, x11,y11,z12, 14,0));   // up to bottom of corner rad
                                                        Write(dxf_file,dxf_3dface(x11,y11,z12, x12,y12,z12, x50,y50,z11, x49,y49,z11, 14,0));   // step up corner rad
                                                        Write(dxf_file,dxf_3dface(x49,y49,z11, x50,y50,z11, x48,y48,z10, x47,y47,z10, 14,0));   // step up corner rad
                                                        Write(dxf_file,dxf_3dface(x47,y47,z10, x48,y48,z10, x46,y46, z9, x45,y45, z9, 14,0));   // step up corner rad
                                                        Write(dxf_file,dxf_3dface(x45,y45, z9, x46,y46, z9, x44,y44,  0, x43,y43,  0, 14,0));   // up to top of corner rad

                                                           // outer-edge downwards from bottom of head ...

                                                        Write(dxf_file,dxf_3dface(x11,y11,z1, x12,y12,z1, x42,y42,z2, x41,y41,z2, 14,10));  // in to web
                                                        Write(dxf_file,dxf_3dface(x41,y41,z2, x42,y42,z2, x42,y42,z3, x41,y41,z3, 14,10));  // down web

                                                        Write(dxf_file,dxf_3dface(x41,y41,z3, x42,y42,z3, x72,y72,z4, x71,y71,z4, 14,10));  // out to foot
                                                        Write(dxf_file,dxf_3dface(x71,y71,z4, x72,y72,z4, x72,y72,z5, x71,y71,z5, 14,10));  // rail foot side

                                                        Write(dxf_file,dxf_3dface(x61,y61,z5, x71,y71,z5, x72,y72,z5, x62,y62,z5, 14,0));   // bottom face of rail


                                                           // back up gauge-face ...

                                                        Write(dxf_file,dxf_3dface(x61,y61,z5, x62,y62,z5, x62,y62,z4, x61,y61,z4, 14,10));  // rail foot side
                                                        Write(dxf_file,dxf_3dface(x61,y61,z4, x62,y62,z4, x32,y32,z3, x31,y31,z3, 14,10));  // in to web

                                                        Write(dxf_file,dxf_3dface(x31,y31,z3, x32,y32,z3, x32,y32,z2, x31,y31,z2, 14,10));  // up web
                                                        Write(dxf_file,dxf_3dface(x31,y31,z2, x32,y32,z2,  x2, y2,z1,  x1, y1,z1, 14,10));  // out to head

                                                        Write(dxf_file,dxf_3dface( x1, y1, z1,  x2, y2, z1,  x2, y2,z12,  x1, y1,z12, 14,0));   // up to bottom of corner rad
                                                        Write(dxf_file,dxf_3dface( x1, y1,z12,  x2, y2,z12, x40,y40,z11, x39,y39,z11, 14,0));   // step up corner rad
                                                        Write(dxf_file,dxf_3dface(x39,y39,z11, x40,y40,z11, x38,y38,z10, x37,y37,z10, 14,0));   // step up corner rad
                                                        Write(dxf_file,dxf_3dface(x37,y37,z10, x38,y38,z10, x36,y36, z9, x35,y35, z9, 14,0));   // step up corner rad
                                                        Write(dxf_file,dxf_3dface(x35,y35, z9, x36,y36, z9, x34,y34,  0, x33,y33,  0, 14,0));   // up to top of corner rad

                                                        Write(dxf_file,dxf_3dface(x33,y33,  0, x34,y34,  0, x44,y44,  0, x43,y43,  0, 14,0));   // rail top between corner rads

                                                        move_to_outer:=line_to_outer;    // for next
                                                      end;
                                            end
                                       else Write(dxf_file,dxf_line(x1,y1,0, x2,y2,0, layer));   // 2D along rail top

                                    move_to:=line_to;

                                  end;//next nk
                                end;//with
                              end;
                              ////////////////////////////////////////////////////////////

                              procedure _3d_chair_outline;     // layer 16

                              var
                                n3:integer;

                              begin
                                if n1=27
                                   then n3:=0
                                   else n3:=n1+1;

                                x1:=p[n1].X/100;
                                y1:=p[n1].Y/100;

                                x2:=p[n3].X/100;
                                y2:=p[n3].Y/100;

                                x3:=p[n2].X/100;
                                y3:=p[n2].Y/100;

                                x4:=p[n2+1].X/100;
                                y4:=p[n2+1].Y/100;

                                   // sides of base...

                                debug_code:=164;

                                Write(dxf_file,dxf_3dface(x1,y1,z7, x1,y1,z8, x2,y2,z8, x2,y2,z7, 16,5));

                                if blanks=8 then Write(dxf_file,dxf_3dface(x2,y2,z7, x2,y2,z8, x3,y3,z8, x3,y3,z7, 16,5));

                                if blanks=2 then Write(dxf_file,dxf_3dface(x4,y4,z7, x4,y4,z8, x1,y1,z8, x1,y1,z7, 16,5));

                                Write(dxf_file,dxf_3dface(x3,y3,z7, x3,y3,z8, x4,y4,z8, x4,y4,z7, 16,5));

                              end;
                              ////////////////////////////////////////////////////////////

                              procedure _3d_chair_plinth(za,zb:extended; doing_horz,doing_top:boolean);     // za,zb,doing_horz MAR 2021

                              var
                                n1:integer;

                                pp1,pp2,pp3,pp4:Tpex;  // 228b   plinth rectangle

                                plinthmid1,plinthmid2:Tpex;   // 237a


                                                  //////////////////////////////

                                                  procedure do_plinth_corner;

                                                  begin
                                                    debug_code:=165;

                                                    Write(dxf_file,dxf_3dface(x1,y1,zb, x2,y2,zb, x5,y5,za, x1,y1,zb, 16,15));
                                                  end;
                                                  //////////////////////////////

                              begin
                                    // plinth...

                                pp1.x:=pc1.x/100;
                                pp1.y:=pc1.y/100;

                                pp2.x:=pc2.x/100;
                                pp2.y:=pc2.y/100;

                                pp3.x:=pc3.x/100;
                                pp3.y:=pc3.y/100;

                                pp4.x:=pc4.x/100;
                                pp4.y:=pc4.y/100;

                                  // 236d loose pin slot in plinth ...

                                ss1.x:=ps1.x/100;
                                ss1.y:=ps1.y/100;

                                ss2.x:=ps2.x/100;
                                ss2.y:=ps2.y/100;

                                ss3.x:=ps3.x/100;
                                ss3.y:=ps3.y/100;

                                ss4.x:=ps4.x/100;
                                ss4.y:=ps4.y/100;

                                  // angled slot on L1 chair plugs ...

                                ss5.x:=ps5.x/100;
                                ss5.y:=ps5.y/100;

                                ss6.x:=ps6.x/100;
                                ss6.y:=ps6.y/100;

                                ss7.x:=ps7.x/100;
                                ss7.y:=ps7.y/100;

                                ss8.x:=ps8.x/100;
                                ss8.y:=ps8.y/100;

                                  // second slot on check chairs inners ...

                                ss9.x:=ps9.x/100;
                                ss9.y:=ps9.y/100;

                                ss10.x:=ps10.x/100;
                                ss10.y:=ps10.y/100;

                                ss11.x:=ps11.x/100;
                                ss11.y:=ps11.y/100;

                                ss12.x:=ps12.x/100;
                                ss12.y:=ps12.y/100;

                                  // angled slot on L1 check chair plugs ...

                                ss13.x:=ps13.x/100;
                                ss13.y:=ps13.y/100;

                                ss14.x:=ps14.x/100;
                                ss14.y:=ps14.y/100;

                                ss15.x:=ps15.x/100;
                                ss15.y:=ps15.y/100;

                                ss16.x:=ps16.x/100;
                                ss16.y:=ps16.y/100;

                                slots_wanted:=0;  // init

                                if dxf_form.locator_plugs_checkbox.Checked=False         // not if locator plugs
                                   then begin

                                          case dxf_chair of    // 239a

                                                 1: begin    // S1

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[0][2];      // 0 = running rail
                                                      loose_2nd:=False;
                                                    end;

                                                 2: begin    // P

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[3][2];      // 3 = stock rail
                                                      loose_2nd:=False;
                                                    end;

                                                 5: begin    // L1

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[2][2];      // 2 = running rail
                                                      loose_2nd:=False;
                                                    end;

                                                 7: begin    // S1J

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[1][2];      // 1 = running rail
                                                      loose_2nd:=False;
                                                    end;

                                                10: begin    // SC fictional

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[31][2];      // 31 = running rail
                                                      loose_2nd:=False;
                                                    end;

                                                11: begin    // switch block slide chairs    1P, 2P stock rail

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[4][2];      // 4 = stock rail
                                                      loose_2nd:=False;                                          // ( 5 no jaw)
                                                    end;

                                                12: begin    // switch block heel chairs     3P..11P

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[6][2];       // 6 = stock rail
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[7][2];       // 7 = switch rail
                                                    end;

                                             14,16: begin    // check rail end chairs   CCL , CCR

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[10][2];       // 10 = running rail
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[11][2];       // 11 = check rail
                                                    end;

                                                15: begin   // check rail chairs CC parallel

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[8][2];       // 8 = running rail
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[9][2];       // 9 = check rail
                                                    end;





                                                21: begin   // ZY wing front chairs

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[13][2];       // 13 = main crossing rail
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[14][2];       // 14 = turnout crossing rail                                                    end;

                                                    end;

                                                22: begin   // XN knuckle chairs

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[15][2];       // 15 = main crossing rail
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[16][2];       // 16 = turnout crossing rail                                                    end;

                                                    end;


                                                23: begin   // XA gap chairs

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[17][2];       // 17 = main rail, along wing
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[18][2];       // 18 = turnout rail, along wing                                                    end;

                                                    end;


                                                24: begin   // AA nose chairs

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[20][2];       // 20 = along TS wing
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[19][2];       // 19 = along MS wing                                                    end;

                                                    end;

                                                25: begin   // AB splice chairs

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[22][2];       // 22 = along TS wing
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[21][2];       // 21 = along MS wing                                                    end;

                                                    end;

                                                26: begin   // BB/BC wing flare chairs           241a

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[24][2];       // 24 = along TS wing
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[23][2];       // 23 = along MS wing                                                    end;

                                                    end;


                                                28: begin   // EF exit chairs

                                                      loose_1st:=now_ti.file_blocks.keep_jaw_options[27][2];       // 27 = main exit rail
                                                      loose_2nd:=now_ti.file_blocks.keep_jaw_options[28][2];       // 28 = turnout exit rail                                                    end;

                                                    end;




                                               else begin   // ??? other chairs

                                                      loose_1st:=False;
                                                      loose_2nd:=False;
                                                    end;

                                          end;//case

                                          if (loose_1st=True)  and (loose_2nd=True)  then slots_wanted:=2;     // both slots
                                          if (loose_1st=True)  and (loose_2nd=False) then slots_wanted:=1;     // first slot
                                          if (loose_1st=False) and (loose_2nd=True)  then slots_wanted:=0-1;   // second slot on switch/check rail only
                                          if (loose_1st=False) and (loose_2nd=False) then slots_wanted:=0;     // no slots

                                        end;


                                if doing_horz=True   // top and bottom
                                   then begin
                                          for n1:=1 to 6 do begin   // 1st corner

                                            x1:=p[n1].X/100;
                                            y1:=p[n1].Y/100;

                                            x2:=p[n1+1].X/100;
                                            y2:=p[n1+1].Y/100;

                                            x5:=pc1.x/100;
                                            y5:=pc1.y/100;

                                            do_plinth_corner;

                                          end;//next

                                          for n1:=8 to 13 do begin   // 2nd corner

                                            x1:=p[n1].X/100;
                                            y1:=p[n1].Y/100;

                                            x2:=p[n1+1].X/100;
                                            y2:=p[n1+1].Y/100;

                                            x5:=pc2.x/100;
                                            y5:=pc2.y/100;

                                            do_plinth_corner;

                                          end;//next

                                          for n1:=15 to 20 do begin   // 3rd corner

                                            x1:=p[n1].X/100;
                                            y1:=p[n1].Y/100;

                                            x2:=p[n1+1].X/100;
                                            y2:=p[n1+1].Y/100;

                                            x5:=pc3.x/100;
                                            y5:=pc3.y/100;

                                            do_plinth_corner;

                                          end;//next

                                          for n1:=22 to 27 do begin   // 4th corner

                                            x1:=p[n1].X/100;
                                            y1:=p[n1].Y/100;

                                            if n1=27
                                               then begin
                                                      x2:=p[0].X/100;
                                                      y2:=p[0].Y/100;
                                                    end
                                               else begin
                                                      x2:=p[n1+1].X/100;
                                                      y2:=p[n1+1].Y/100;
                                                    end;

                                            x5:=pc4.x/100;
                                            y5:=pc4.y/100;

                                            do_plinth_corner;

                                          end;//next

                                          debug_code:=166;

                                          if slots_wanted=0 then Write(dxf_file,dxf_3dface_pex( pp1,za, pp2,za, pp3,za, pp4,za, 16,0));  // top and bottom of plinth area (no slot)

                                          if slots_wanted=1  // top and bottom of plinth area with first or single slot for loose jaw pin ...
                                             then begin
                                                    Write(dxf_file,dxf_3dface_pex( pp1,za, ss2,za, ss1,za, pp4,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( pp2,za, ss3,za, ss2,za, pp1,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( pp3,za, ss4,za, ss3,za, pp2,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( pp4,za, ss1,za, ss4,za, pp3,za, 16,0));
                                                  end;

                                          if slots_wanted=2   // top and bottom of plinth area with both slots for loose jaw pins (check rail) ...
                                             then begin
                                                    plinthmid1.x:=(pp1.x+pp4.x)/2;
                                                    plinthmid1.y:=(pp1.y+pp4.y)/2;

                                                    plinthmid2.x:=(pp2.x+pp3.x)/2;
                                                    plinthmid2.y:=(pp2.y+pp3.y)/2;

                                                    Write(dxf_file,dxf_3dface_pex(        pp1,za,  ss9,za,       ss10,za, plinthmid1,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex(       ss10,za,  ss2,za, plinthmid1,za, plinthmid1,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( plinthmid1,za,  ss2,za,        ss1,za,        pp4,za, 16,0));

                                                    Write(dxf_file,dxf_3dface_pex(        pp2,za, ss12,za,        ss9,za,        pp1,za, 16,0));

                                                    Write(dxf_file,dxf_3dface_pex(        pp3,za,  ss4,za,        ss3,za, plinthmid2,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex(        ss3,za, ss11,za, plinthmid2,za, plinthmid2,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( plinthmid2,za, ss11,za,       ss12,za,        pp2,za, 16,0));

                                                    Write(dxf_file,dxf_3dface_pex(        pp4,za,  ss1,za,        ss4,za,        pp3,za, 16,0));

                                                    Write(dxf_file,dxf_3dface_pex( ss10,za, ss11,za, ss3,za, ss2,za, 16,0));   // centre area between slots
                                                  end;

                                          if slots_wanted<0   // top and bottom of plinth area with second slot only (check rail) ...
                                             then begin
                                                    Write(dxf_file,dxf_3dface_pex( pp1,za, ss9,za,  ss10,za, pp4,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( pp2,za, ss12,za, ss9,za,  pp1,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( pp3,za, ss11,za, ss12,za, pp2,za, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( pp4,za, ss10,za, ss11,za, pp3,za, 16,0));
                                                  end;


                                          debug_code:=167;

                                          Write(dxf_file,dxf_3dface( p[0].x/100, p[0].y/100,zb,  p[1].x/100, p[1].y/100,zb, pc1.x/100,pc1.y/100,za, pc4.x/100,pc4.y/100,za, 16,15));  // 1st side of plinth

                                          Write(dxf_file,dxf_3dface( p[7].x/100, p[7].y/100,zb,  p[8].x/100, p[8].y/100,zb, pc2.x/100,pc2.y/100,za, pc1.x/100,pc1.y/100,za, 16,15));  // 2nd side of plinth

                                          Write(dxf_file,dxf_3dface(p[14].x/100,p[14].y/100,zb, p[15].x/100,p[15].y/100,zb, pc3.x/100,pc3.y/100,za, pc2.x/100,pc2.y/100,za, 16,15));  // 3rd side of plinth

                                          Write(dxf_file,dxf_3dface(p[21].x/100,p[21].y/100,zb, p[22].x/100,p[22].y/100,zb, pc4.x/100,pc4.y/100,za, pc3.x/100,pc3.y/100,za, 16,15));  // 4th side of plinth
                                        end
                                   else begin    // sides of slots in plinth for loose jaw pin ...

                                          debug_code:=168;

                                          if (slots_wanted>0) and (za<>zb)
                                             then begin                                                                      // first slot
                                                    Write(dxf_file,dxf_3dface_pex( ss1,za, ss2,za, ss2,zb, ss1,zb, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( ss2,za, ss3,za, ss3,zb, ss2,zb, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( ss3,za, ss4,za, ss4,zb, ss3,zb, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( ss4,za, ss1,za, ss1,zb, ss4,zb, 16,0));
                                                  end;

                                          if ((slots_wanted>1) or (slots_wanted<0)) and (za<>zb)   // 237a add second slot if any (check rail chairs)
                                             then begin
                                                    Write(dxf_file,dxf_3dface_pex( ss9,za,  ss10,za, ss10,zb, ss9,zb, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( ss10,za, ss11,za, ss11,zb, ss10,zb, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( ss11,za, ss12,za, ss12,zb, ss11,zb, 16,0));
                                                    Write(dxf_file,dxf_3dface_pex( ss12,za, ss9,za,  ss9,zb,  ss12,zb, 16,0));
                                                  end;
                                        end;
                              end;
                              //////////////////////////////////////////////////

                              function find_any_sockets_on_timber:integer;

                              var
                                m,nnn:integer;
                                basex,basey:extended;
                                up1,up2,up3,up4,upmid:extended;

                                list_empty:boolean;

                                           //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                           procedure move_up_and_insert(i:integer);

                                           var
                                             mu:integer;

                                             a,b,c,d:extended;

                                           begin
                                                     // move up ..    anything in 35 is lost

                                             for mu:=34 downto i do timber_sockets[mu+1]:=timber_sockets[mu];    // [0..35]

                                             with timber_sockets[i] do begin

                                               corners:=Tsocket_object(socket_list.Objects[nnn]).socket_corners;    // get 4,5,6,7  rebate/chamfer corners

                                               valid:=True;

                                                 // set near-side ns and far side fs opposite middle of socket...

                                               try
                                                 ns.x:=infill_corner1.x+ns_timb_diffx*upmid/timb_length;
                                                 ns.y:=infill_corner1.y+ns_timb_diffy*upmid/timb_length;

                                                 fs.x:=infill_corner4.x+ns_timb_diffx*upmid/timb_length;
                                                 fs.y:=infill_corner4.y+ns_timb_diffy*upmid/timb_length;
                                               except
                                                 valid:=False;
                                               end;//try

                                               if template_is_waybeams=True
                                                  then begin
                                                              // rotate corner sequence...

                                                         corners[0]:=corners[4];   // use corners[0] as temp

                                                         corners[4]:=corners[5];
                                                         corners[5]:=corners[6];
                                                         corners[6]:=corners[7];
                                                         corners[7]:=corners[0];
                                                       end;

                                               a:=SQRT(SQR(corners[4].x-ns.x)+SQR(corners[4].y-ns.y));
                                               b:=SQRT(SQR(corners[7].x-ns.x)+SQR(corners[7].y-ns.y));

                                                   // see which end of socket is closer to timber org centre ...
                                                   // re-use 0,1,2,3 socket sides for sorted corners, clockwise from start ...

                                               if a<b             // first side of socket
                                                  then begin
                                                          c:=SQRT(SQR(corners[4].x-basex)+SQR(corners[4].y-basey));
                                                          d:=SQRT(SQR(corners[5].x-basex)+SQR(corners[5].y-basey));

                                                          if c<d
                                                             then begin
                                                                    corners[0]:=corners[4];
                                                                    corners[1]:=corners[5];
                                                                    corners[2]:=corners[6];
                                                                    corners[3]:=corners[7];
                                                                  end
                                                             else begin
                                                                    corners[0]:=corners[5];
                                                                    corners[1]:=corners[4];
                                                                    corners[2]:=corners[7];
                                                                    corners[3]:=corners[6];
                                                                  end;
                                                       end
                                                  else begin
                                                          c:=SQRT(SQR(corners[6].x-basex)+SQR(corners[6].y-basey));
                                                          d:=SQRT(SQR(corners[7].x-basex)+SQR(corners[7].y-basey));

                                                          if c<d
                                                             then begin
                                                                    corners[0]:=corners[6];
                                                                    corners[1]:=corners[7];
                                                                    corners[2]:=corners[4];
                                                                    corners[3]:=corners[5];
                                                                  end
                                                             else begin
                                                                    corners[0]:=corners[7];
                                                                    corners[1]:=corners[6];
                                                                    corners[2]:=corners[5];
                                                                    corners[3]:=corners[4];
                                                                  end;
                                                       end;

                                               timber_sockets[i].upm:=upmid;

                                             end;//with

                                           end;
                                           //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                              begin
                                RESULT:=0;           // init
                                list_empty:=True;    // init
                                for nnn:=0 to 35 do timber_sockets[nnn].valid:=False;   // init re-usable socket list for this timber

                                if socket_list.Count>0
                                   then begin

                                          for nnn:=0 to (socket_list.Count-1) do begin

                                            with Tsocket_object(socket_list.Objects[nnn]) do begin    // 4..7 = chamfer corners

                                              if (check_if_inside_4_corners(socket_corners[4],infill_corner1,infill_corner2,infill_corner3,infill_corner4)=True)
                                             and (check_if_inside_4_corners(socket_corners[5],infill_corner1,infill_corner2,infill_corner3,infill_corner4)=True)
                                             and (check_if_inside_4_corners(socket_corners[6],infill_corner1,infill_corner2,infill_corner3,infill_corner4)=True)
                                             and (check_if_inside_4_corners(socket_corners[7],infill_corner1,infill_corner2,infill_corner3,infill_corner4)=True)
                                                 then begin
                                                            // socket is on this timber, all 4 rebate/chamfer corners

                                                        basex:=(infill_corner1.x+infill_corner4.x)/2;    // middle of org end of timber..
                                                        basey:=(infill_corner1.y+infill_corner4.y)/2;

                                                            // to socket corners from org end of timber ...

                                                        up1:=SQRT(SQR(socket_corners[4].x-basex)+SQR(socket_corners[4].y-basey));
                                                        up2:=SQRT(SQR(socket_corners[5].x-basex)+SQR(socket_corners[5].y-basey));
                                                        up3:=SQRT(SQR(socket_corners[6].x-basex)+SQR(socket_corners[6].y-basey));
                                                        up4:=SQRT(SQR(socket_corners[7].x-basex)+SQR(socket_corners[7].y-basey));

                                                        upmid:=(up1+up2+up3+up4)/4;  // to middle of socket from org end of timber

                                                           // insert socket in timber sockets list, in ascending upmid away from org ...

                                                           // max 36 sockets per timber, duplicates (upmid equal) are ignored

                                                        if list_empty=True
                                                           then begin
                                                                  move_up_and_insert(0);     // first one, to get started
                                                                  RESULT:=RESULT+1;
                                                                  list_empty:=False;
                                                                end
                                                           else begin
                                                                  if upmid<timber_sockets[0].upm
                                                                     then begin
                                                                            move_up_and_insert(0);
                                                                            RESULT:=RESULT+1;
                                                                          end
                                                                     else begin
                                                                            for m:=1 to 35 do begin

                                                                              if timber_sockets[m].valid=True
                                                                                 then begin
                                                                                        if (upmid>timber_sockets[m-1].upm) and (upmid<timber_sockets[m].upm)
                                                                                           then begin
                                                                                                  move_up_and_insert(m);
                                                                                                  RESULT:=RESULT+1;
                                                                                                  BREAK;
                                                                                                end;
                                                                                      end
                                                                                 else begin
                                                                                        if (upmid>timber_sockets[m-1].upm)
                                                                                           then begin
                                                                                                  move_up_and_insert(m);
                                                                                                  RESULT:=RESULT+1;
                                                                                                  BREAK;
                                                                                                end;
                                                                                      end;
                                                                            end;//next m

                                                                          end;
                                                                end;
                                                      end;
                                            end;//with socket
                                          end;//next socket

                                        end;

                                if RESULT>36 then RESULT:=36;   // 234e bug-fix  max 36 sockets per timber (waybeams)

                              end;
                              //////////////////////////////////////////////////


begin
  if dxf_form.clip_fit_radio.Checked=True                         // 241b
     then begin
            plug_extended_depth:=clip_plug_extended_depth;
            plug_taper_depth:=clip_plug_taper_depth;
            plug_inset_depth:=clip_plug_inset_depth;
            plug_total_depth:=clip_plug_total_depth;
            undercut_depth:=clip_undercut_depth;
            clearcut_depth:=clip_clearcut_depth;
          end
     else if dxf_form.snap_fit_radio.Checked=True
             then begin
                    plug_extended_depth:=snap_plug_extended_depth;
                    plug_taper_depth:=snap_plug_taper_depth;
                    plug_inset_depth:=snap_plug_inset_depth;
                    plug_total_depth:=snap_plug_total_depth;
                    undercut_depth:=snap_undercut_depth;
                    clearcut_depth:=snap_clearcut_depth;
                  end
             else begin
                    plug_extended_depth:=press_plug_extended_depth;
                    plug_taper_depth:=press_plug_taper_depth;
                    plug_inset_depth:=press_plug_inset_depth;
                    plug_total_depth:=press_plug_total_depth;

                    undercut_depth:=0;
                    clearcut_depth:=0;
                  end;


  RESULT:=0;         // init  234e
  z98:=0;            // init

  doing_L1:=False;   // init 236d

  z8:=0;   // keep compiler happy...
  z13:=0;
  z15:=0;
  z99:=0;

  z80:=0;  // 241b ...
  z81:=0;

  z85:=0;
  z86:=0;
  z87:=0;


  try

    if keeps_list.Count<1 then EXIT;  // how did this happen ?

    if dxf_form.extra_switch_clearance_checkbox.Checked=True      // 235b
       then begin
              if (cpi.fw_pi/inscale)>3.5  // 00-BF flangeway
                 then extra_opening:=2
                 else extra_opening:=1;
            end
       else extra_opening:=0;

    socket_list:=TStringList.Create;  // 232a

    socket_list.Clear;

    fixed_diamond_ends:=False;  // keep compiler happy...

    railtop_width:=rail_section_data_mm.rail_head_width_mm;     // mm - 2D TEMPLATE SETTINGS MAY DIFFER  (cpi.railtop_pi)

    railbottom_width:=rail_section_data_mm.rail_foot_width_mm;  // 223a

    rail_foot_z:=0-rail_section_data_mm.rail_depth_mm;          // mm  rail top is z datum.

       // 232a  build entire 3-D sockets list first and draw them...

    if (_3d=True) and (dxf_form.sockets_combo.ItemIndex<>0)  // sockets wanted
       then begin
              for n:=0 to (keeps_list.Count-1) do begin

                with Ttemplate(keeps_list.Objects[n]) do begin   // to next template.

                  if bg_copied=False then CONTINUE;              // no data, unused template.

                  if (dxf_form.group_option_radio.Checked=True) and (group_selected=False)  // ignore this one.
                     then CONTINUE;

                  if (dxf_form.brick_option_radio.Checked=True)
                 and ( (template_info.keep_dims.box_dims1.timbering_brick_flag=False) or (template_info.keep_dims.box_dims1.pad_marker_colour<>dxf_form.marker_colour_panel.Color) or (template_info.keep_dims.box_dims1.use_pad_marker_colour=False) )
                     then CONTINUE;                // not brick template or wrong colour or not in use

                  if ABS(template_info.keep_dims.box_dims1.proto_info.scale_pi-scale)>minfp
                     then CONTINUE;

                  if template_info.keep_dims.turnout_info2.chairing_flag=True      // 235a chairing on this template
                     then seat_thick:=_3d_data.seat_thickness                                            // 235a  from chairing data
                     else seat_thick:=template_info.keep_dims.box_dims1.proto_info.rail_seat_height_pi;  // 235a  unchaired as template rail section data

                  z8:=rail_foot_z-seat_thick*inscale;

                  z13:=z8-timber_thick*inscale;  // z13 timber bottom

                  z15:=z8-socket_chamfer_depth*inscale;  // z15 is chamfer depth (defaults 0.36" deep x 0.15" wide)

                  z99:=z8-socket_depth*inscale;  // mm  blind socket depth 3.75" scale default   z8 is timber top

                  z80:=z8-undercut_depth*inscale;  // 241b ...
                  z81:=z8-clearcut_depth*inscale;

                  z82:=z8-clip_socket_flap_top_depth*inscale;
                  

                  now_keep:=Ttemplate(keeps_list.Objects[n]).template_info.bgnd_keep;    // get the drawing data

                end;//with Ttemplate

                with now_keep do begin

                     // bgnd marks ...

                  array_max:=intarray_max(list_bgnd_marks[0]);

                  i:=-1; //init

                  repeat

                    INC(i);

                    if i>(array_max-7) then BREAK;

                    code:=intarray_get(list_bgnd_marks[4],i);   // get mark code

                            // get timber ID ...      238a

                    tb_encoded:=intarray_get(list_bgnd_marks[5],i)/10000;

                    tb_str:=Chr(Trunc(tb_encoded));        // 237a
                    tb_id:=Round(Frac(tb_encoded)*10000);

                    timber_str:=tb_str+IntToStr(tb_id);  // 241f

                            // and chair ID ...

                    dxf_chair:=intarray_get(list_bgnd_marks[6],i);  // 237a   chair code for this mark if it's a 3D chair


                    if code=492       // socket outlines, get 28 corners ...        now 28 corners 241c
                       then begin

                              nj:=socket_list.AddObject(IntToStr(socket_list.Count),Tsocket_object.Create);

                              np:=0; // init

                               // N.B. socket order in list  0=MS STOCK/PLAIN TRACK,  1=MS CROSSING/TS PLAIN TRACK,  2=TS CROSSING,  3=TS STOCK

                               // build socket list (corners of socket and chamfer) ...
                               // 2D outlines in list so ignore second point for each line

                              repeat

                                with Tsocket_object(socket_list.Objects[nj]) do begin

                                  socket_corners[np].x:=intarray_get(list_bgnd_marks[0],i)/100;  // to mm
                                  socket_corners[np].y:=intarray_get(list_bgnd_marks[1],i)/100;

                                  chair_id:=intarray_get(list_bgnd_marks[6],i);  // 237a   chair code for this socket
                                  timber_id_str:=tb_str+IntToStr(tb_id);         // 238a   timber this socket is on

                                  sockets_pex[np]:=socket_corners[np];

                                end;//with

                                INC(np);

                                INC(i);  // next mark in list

                              until np>27;     // 241c was 11

                              DEC(i);  // undo last INC

                                 // socket in list, now draw it...

                              debug_code:=181;

                                 // top rebate around socket ...    z8 is timber top    // rebate instead of chamfer...     234e

                              Write(dxf_file,dxf_3dface_pex( sockets_pex[4],z8, sockets_pex[4],z15, sockets_pex[5],z15, sockets_pex[5],z8,  23,0));  // rebate near side
                              Write(dxf_file,dxf_3dface_pex( sockets_pex[5],z8, sockets_pex[5],z15, sockets_pex[6],z15, sockets_pex[6],z8,  23,0));  // rebate gauge end
                              Write(dxf_file,dxf_3dface_pex( sockets_pex[6],z8, sockets_pex[6],z15, sockets_pex[7],z15, sockets_pex[7],z8,  23,0));  // rebate far side
                              Write(dxf_file,dxf_3dface_pex( sockets_pex[7],z8, sockets_pex[7],z15, sockets_pex[4],z15, sockets_pex[4],z8,  23,0));  // rebate outer end

                              Write(dxf_file,dxf_3dface_pex( sockets_pex[4],z15, sockets_pex[0],z15, sockets_pex[1],z15, sockets_pex[5],z15,  23,0));  // rebate near bottom
                              Write(dxf_file,dxf_3dface_pex( sockets_pex[5],z15, sockets_pex[1],z15, sockets_pex[2],z15, sockets_pex[6],z15,  23,0));  // rebate gauge end bottom
                              Write(dxf_file,dxf_3dface_pex( sockets_pex[6],z15, sockets_pex[2],z15, sockets_pex[3],z15, sockets_pex[7],z15,  23,0));  // rebate far bottom
                              Write(dxf_file,dxf_3dface_pex( sockets_pex[7],z15, sockets_pex[3],z15, sockets_pex[0],z15, sockets_pex[4],z15,  23,0));  // rebate outer end bottom


                              if dxf_form.blind_sockets_checkbox.Checked=True
                                 then begin
                                          // base of socket ...

                                        debug_code:=182;

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[0],z99, sockets_pex[1],z99, sockets_pex[2],z99, sockets_pex[3],z99,  23,0));  // base of socket
                                      end
                                 else begin
                                          // bottom flange around socket ...    z13 is timber bottom, same width as top chamfer

                                        debug_code:=183;

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[4],z13, sockets_pex[0],z13, sockets_pex[1],z13, sockets_pex[5],z13,  23,0));  // flange near side
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[5],z13, sockets_pex[1],z13, sockets_pex[2],z13, sockets_pex[6],z13,  23,0));  // flange gauge end
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[6],z13, sockets_pex[2],z13, sockets_pex[3],z13, sockets_pex[7],z13,  23,0));  // flange far side
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[7],z13, sockets_pex[3],z13, sockets_pex[0],z13, sockets_pex[4],z13,  23,0));  // flange outer end

                                        z99:=z13;
                                      end;

                                          // sides of socket ...

                              debug_code:=184;

                              if dxf_form.press_fit_radio.Checked=True
                                 then begin
                                                  // plain socket sides ...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[0],z99, sockets_pex[1],z99, sockets_pex[1],z15, sockets_pex[0],z15,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[1],z99, sockets_pex[2],z99, sockets_pex[2],z15, sockets_pex[1],z15,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[2],z99, sockets_pex[3],z99, sockets_pex[3],z15, sockets_pex[2],z15,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[3],z99, sockets_pex[0],z99, sockets_pex[0],z15, sockets_pex[3],z15,  23,0));  // side of socket
                                      end
                                 else begin

                                                 // socket sides with undercut ...  241b

                                        // upper sides/ends above undercut...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[0],z80, sockets_pex[1],z80, sockets_pex[1],z15, sockets_pex[0],z15,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[1],z80, sockets_pex[2],z80, sockets_pex[2],z15, sockets_pex[1],z15,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[2],z80, sockets_pex[3],z80, sockets_pex[3],z15, sockets_pex[2],z15,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[3],z80, sockets_pex[0],z80, sockets_pex[0],z15, sockets_pex[3],z15,  23,0));  // side of socket


                                        // undercut sides ...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[8],z80,  sockets_pex[9],z80,  sockets_pex[9],z81,  sockets_pex[8],z81,  23,0));  // side of undercut
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[9],z80,  sockets_pex[17],z80, sockets_pex[17],z81, sockets_pex[9],z81,  23,0));  // far end of undercut
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[8],z80,  sockets_pex[16],z80, sockets_pex[16],z81, sockets_pex[8],z81,  23,0));  // near end of undercut

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[10],z80, sockets_pex[11],z80, sockets_pex[11],z81, sockets_pex[10],z81, 23,0));  // side of undercut
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[10],z80, sockets_pex[18],z80, sockets_pex[18],z81, sockets_pex[10],z81, 23,0));  // far end of undercut
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[11],z80, sockets_pex[19],z80, sockets_pex[19],z81, sockets_pex[11],z81, 23,0));  // near end of undercut


                                        // undercut horizontal faces   above...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[8],z80,  sockets_pex[16],z80, sockets_pex[17],z80, sockets_pex[9],z80,  23,0));  // near side
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[10],z80, sockets_pex[18],z80, sockets_pex[19],z80, sockets_pex[11],z80, 23,0));  // far side

                                        // undercut horizontal faces   below...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[8],z81,  sockets_pex[16],z81, sockets_pex[17],z81, sockets_pex[9],z81,  23,0));  // near side
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[10],z81, sockets_pex[18],z81, sockets_pex[19],z81, sockets_pex[11],z81, 23,0));  // far side

                                        // lower sides/ends below undercut...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[0],z99, sockets_pex[1],z99, sockets_pex[1],z81, sockets_pex[0],z81,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[1],z99, sockets_pex[2],z99, sockets_pex[2],z81, sockets_pex[1],z81,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[2],z99, sockets_pex[3],z99, sockets_pex[3],z81, sockets_pex[2],z81,  23,0));  // side of socket
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[3],z99, sockets_pex[0],z99, sockets_pex[0],z81, sockets_pex[3],z81,  23,0));  // side of socket

                                        // middle around ends...

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[16],z80, sockets_pex[0],z80,  sockets_pex[0],z81,  sockets_pex[16],z81, 23,0));  // near near side
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[0],z80,  sockets_pex[3],z80,  sockets_pex[3],z81,  sockets_pex[0],z81,  23,0));  // near end
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[3],z80,  sockets_pex[19],z80, sockets_pex[19],z81, sockets_pex[3],z81,  23,0));  // near far side

                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[17],z80, sockets_pex[1],z80,  sockets_pex[1],z81,  sockets_pex[17],z81, 23,0));  // far near side
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[1],z80,  sockets_pex[2],z80,  sockets_pex[2],z81,  sockets_pex[1],z81,  23,0));  // far end
                                        Write(dxf_file,dxf_3dface_pex( sockets_pex[2],z80,  sockets_pex[18],z80, sockets_pex[18],z81, sockets_pex[2],z81,  23,0));  // far far side

                                        if (dxf_form.clip_fit_radio.Checked=True) and (dxf_form.end_flaps_checkbox.Checked=True)   // 241c
                                           then begin

                                                  // add chunks over end flaps

                                                     // top covers inside end rebates ...

                                                  Write(dxf_file,insert_crlf_str(do_a_pyramid(sockets_pex[4], sockets_pex[12], sockets_pex[15], sockets_pex[7],
                                                                                              sockets_pex[4], sockets_pex[12], sockets_pex[15], sockets_pex[7], z8,z15, 23) ));  // near end

                                                  Write(dxf_file,insert_crlf_str(do_a_pyramid(sockets_pex[5], sockets_pex[13], sockets_pex[14], sockets_pex[6],
                                                                                              sockets_pex[5], sockets_pex[13], sockets_pex[14], sockets_pex[6], z8,z15, 23) ));  // far end

                                                     // top chunks below cover ...

                                                  Write(dxf_file,dxf_3dface_pex(  sockets_pex[0],z15, sockets_pex[16],z15, sockets_pex[19],z15,  sockets_pex[3],z15, 23,0));  // near end upper face
                                                  Write(dxf_file,dxf_3dface_pex(  sockets_pex[0],z82, sockets_pex[16],z82, sockets_pex[19],z82,  sockets_pex[3],z82, 23,0));  // near end lower face

                                                  Write(dxf_file,dxf_3dface_pex( sockets_pex[16],z15, sockets_pex[19],z15, sockets_pex[19],z82, sockets_pex[16],z82, 23,0));  // near end inner face


                                                  Write(dxf_file,dxf_3dface_pex(  sockets_pex[1],z15, sockets_pex[17],z15, sockets_pex[18],z15,  sockets_pex[2],z15, 23,0));  // far end upper face
                                                  Write(dxf_file,dxf_3dface_pex(  sockets_pex[1],z82, sockets_pex[17],z82, sockets_pex[18],z82,  sockets_pex[2],z82, 23,0));  // far end lower face

                                                  Write(dxf_file,dxf_3dface_pex( sockets_pex[17],z15, sockets_pex[18],z15, sockets_pex[18],z82, sockets_pex[17],z82, 23,0));  // far end inner face

                                                  // add flaps ...

                                                  Write(dxf_file,insert_crlf_str(do_a_pyramid(sockets_pex[0],  sockets_pex[16], sockets_pex[19], sockets_pex[3],
                                                                                              sockets_pex[20], sockets_pex[21], sockets_pex[22], sockets_pex[23], z82,z99, 23) ));  // near flap

                                                  Write(dxf_file,insert_crlf_str(do_a_pyramid(sockets_pex[1],  sockets_pex[17], sockets_pex[18], sockets_pex[2],
                                                                                              sockets_pex[24], sockets_pex[25], sockets_pex[26], sockets_pex[27], z82,z99, 23) ));  // far flap

                                                end;

                                      end;

                            end;//socket

                  until 0<>0;

                end;//with keep

              end;//next keep

            end;//sockets wanted

       //------------------------------------

          //  start again  --  rails and timbers around sockets ...

    for n:=0 to (keeps_list.Count-1) do begin

      with Ttemplate(keeps_list.Objects[n]) do begin   // to next template.

        fb_kludge_this:=template_info.keep_dims.box_dims1.fb_kludge_template_code;  // 227a

        if bg_copied=False then CONTINUE;              // no data, unused template.

        if (dxf_form.group_option_radio.Checked=True) and (group_selected=False)  // ignore this one.
           then CONTINUE;

        if (dxf_form.brick_option_radio.Checked=True)
       and ( (template_info.keep_dims.box_dims1.timbering_brick_flag=False) or (template_info.keep_dims.box_dims1.pad_marker_colour<>dxf_form.marker_colour_panel.Color) or (template_info.keep_dims.box_dims1.use_pad_marker_colour=False) )
           then CONTINUE;                // wrong colour or not in use

        if _3d=False      // 227a ...
           then begin
                  if ((fb_kludge_this=1) and (dxf_form.fb_inner_checkbox.Checked=False))
                  or ((fb_kludge_this=2) and (dxf_form.fb_outer_checkbox.Checked=False))
                     then CONTINUE;
                end;

        // 555b
        if (_3d=True) and (template_info.keep_dims.turnout_info2.chairing_flag=False)    // ignore this one
           then CONTINUE;
        // 555b

        if (_3d=True) and (ABS(template_info.keep_dims.box_dims1.proto_info.scale_pi-scale)>minfp)
           then begin
                  show_modal_message('A background template differs in scale from the control template:'
                              +#13+#13+'control template scale: '+FloatToStr(scale)+' mm/ft'
                              +#13+#13+'background template scale: '+FloatToStr(template_info.keep_dims.box_dims1.proto_info.scale_pi)+' mm/ft'
                              +#13+#13+'It is not possible to export this template to DXF in 3D.'
                              +#13+#13+'You may wish to modify the control template to match.');
                  CONTINUE;
                end;


        chairing_in_dxf:=(_3d=True);   // 237c generating chair jaws

        with template_info.keep_dims.turnout_info2.switch_info do begin
          number_slide_chairs:=num_slide_chairs;
          number_block_slide_chairs:=num_block_slide_chairs+extra_opening;
          number_block_heel_chairs:=num_block_heel_chairs-extra_opening;
        end;//with

        template_is_waybeams:=template_info.keep_dims.turnout_info2.plain_track_info.waybeams_template_flag;  // 235a  this template is waybeam timbers

        if template_info.keep_dims.turnout_info2.chairing_flag=True      // 235a chairing on this template
           then seat_thick:=_3d_data.seat_thickness                                            // 235a  from chairing data
           else seat_thick:=template_info.keep_dims.box_dims1.proto_info.rail_seat_height_pi;  // 235a  unchaired as template rail section data

        with _3d_data do begin

          with rail_section_data_mm do begin

            rail_web_thickness:=rail_web_thick_mm;

            rail_web_top_z:=0-rail_web_top_mm+rail_web_thickness/2/rail_fish_angle;     // out from centre-line to web face at fish angle
            rail_web_bot_z:=0-rail_web_bottom_mm-rail_web_thickness/2/rail_fish_angle;  // out from centre-line to web face at fish angle

            rc:=rail_corner_rad_mm;

            rail_corner_bot1_z:=0-rc+rc*COS(Pi/8);   // 22.5 degs
            rail_corner_offset1:=rc-rc*SIN(Pi/8);

            rail_corner_bot2_z:=0-rc+rc*COS(Pi/4);   // 45 degs
            rail_corner_offset2:=rc-rc*SIN(Pi/4);

            rail_corner_bot3_z:=0-rc+rc*COS(Pi*3/8);   // 67.5 degs
            rail_corner_offset3:=rc-rc*SIN(Pi*3/8);

            rail_head_bot_z:=0-rail_head_depth_mm;
            rail_foot_top_z:=rail_foot_z+rail_foot_depth_mm;

          end;//with

          timb_top_z:=rail_foot_z-seat_thick*inscale;

          timb_bot_z:=timb_top_z-timber_thick*inscale;

          sprue_top_z:=timb_bot_z+sprue_thick*inscale; // thickness 3-D timber sprue (mark code 9998 or 9999)

          out_flange_top_z:=timb_bot_z+flange_depth*inscale; // thickness 3-D timber outer flange (mark code 490)

        end;//with

        z1:=rail_head_bot_z;
        z2:=rail_web_top_z;
        z3:=rail_web_bot_z;
        z4:=rail_foot_top_z;
        z5:=rail_foot_z;

        z8:=timb_top_z;

        z9:=rail_corner_bot1_z;
        z10:=rail_corner_bot2_z;
        z11:=rail_corner_bot3_z;
        z12:=0-rc;

        z14:=sprue_top_z;

        top_sides:=(railtop_width-rail_web_thickness)/2;

        bottom_sides:=(railbottom_width-rail_web_thickness)/2;

        with template_info.keep_dims.turnout_info2 do fixed_diamond_ends:=(semi_diamond_flag=True) and (diamond_fixed_flag=True);    // need end marks on fixed diamond point rails.

        hand:=template_info.keep_dims.box_dims1.turnout_info1.hand;

        now_ti:=Ttemplate(keeps_list.Objects[n]).template_info;  // 227a

        now_keep:=now_ti.bgnd_keep;    // get the drawing data.

      end;//with Ttemplate

      with now_keep do begin

        tbnum_str:=timber_numbers_string;      // the full string of timber numbering.

           // first do the bgnd marks and timbers ...

        array_max:=intarray_max(list_bgnd_marks[0]);

        i:=-1; //init

        soleplate_mark_count:=0;  // init

        repeat    // 227a change loop control

          INC(i);

          if i>array_max then BREAK;

          code:=intarray_get(list_bgnd_marks[4],i);   // check this mark wanted.

          move_to.x:=intarray_get(list_bgnd_marks[0],i);    // x1,y1 in  1/100ths mm
          move_to.y:=intarray_get(list_bgnd_marks[1],i);

          if (code=99) or (code=-5)  // text
             then begin
                    line_to.x:=0;    // x2,y2  not used.
                    line_to.y:=0;
                  end
             else begin
                    line_to.x:=intarray_get(list_bgnd_marks[2],i);    // x2,y2 in  1/100ths mm  or other data
                    line_to.y:=intarray_get(list_bgnd_marks[3],i);
                  end;

                  // get timber ID ...      238a

          tb_encoded:=intarray_get(list_bgnd_marks[5],i)/10000;

          tb_str:=Chr(Trunc(tb_encoded));        // 237a
          tb_id:=Round(Frac(tb_encoded)*10000);

          timber_str:=tb_str+IntToStr(tb_id);  // 241f

                  // and chair ID ...

          dxf_chair:=intarray_get(list_bgnd_marks[6],i);  // 237a   chair code for this mark if it's a 3D chair

          case dxf_chair of           // 238a  find chair options from chair code      chi is list index

              { S1 }  1: chi:=0;

               { P }  2: chi:=3;

              { SC }  4: chi:=0;     // fictional 4-screw same as S1

              { L1 }  5: chi:=2;

             { S1J }  7: chi:=1;

          { 1P..2P } 11: chi:=4;

         { 3P..11P } 12: chi:=6;

{ CCLR working end flare } 14: chi:=10;

              { CC } 15: chi:=8;

{ CCLR extension end flare } 16: chi:=10;


                    else chi:=0;

          end;//case


          case code of
                    -5: layer:=12;   // keep labels

                    -4: begin
                          if _3d=True
                             then CONTINUE
                             else layer:=3;    // 2-D timber outlines for laser kerf  (3-D uses timber infill).
                        end;

                 -3,-2: layer:=8;    // curving rad centres.

           -1,0,8,9,10: CONTINUE;    // fixing peg, blank entries, peg arms, plain track start marks.  not in DXF.

                     1: layer:=6;    // guide marks

                   2,7: layer:=7;    // radial end marks.  transition marks.

               3,33,93: begin
                          if _3d=True
                             then begin
                                    if (tb_str='S') and (tb_id=1)     // 236b toe timber, do soleplate surround
                                       then begin
                                              layer:=26;
                                              INC(soleplate_mark_count);
                                            end
                                       else CONTINUE;   // only soleplate surround in 3-D is from timber outline. Other 3-D timbers are from timber infill
                                  end
                             else layer:=3;   // 2-D timber outlines

                        end;

            4,14,44,54: begin
                          if _3d=True then CONTINUE
                                      else layer:=5;    // timber centre-lines.
                        end;

               5,55,95: begin
                          if _3d=True then CONTINUE
                                      else layer:=4;    // timber reduced ends.
                        end;

                     6: layer:=9;    // rail joints.

                    99: begin
                          if _3d=True then CONTINUE
                                      else layer:=13;   // timber numbering.
                        end;

                   101: begin
                          if (_3d=True) or (dxf_form.soleplates_combo.ItemIndex=0)
                             then CONTINUE
                             else layer:=26;    // 2-D soleplate outline, switch drive mark  244a       3-D soleplate is timber infill
                        end;

       203,233,293,487: begin               // 487 is switch drive slider ribs
                          if _3d=False
                             then CONTINUE     // 2-D 243b
                             else layer:=17;   // timber infill for 3-D
                        end;

                   490: layer:=25;      // timber   side,end flanges

               486,491: layer:=34;      // chair plug outlines   227a

                   492: if (_3d=False) or (dxf_form.sockets_combo.ItemIndex=0)      // 492 sockets and top chamfer for 3-D printing
                           then CONTINUE                                            // not in 2-D, see 498 instead
                           else layer:=17;


   484,485,493,494,497: if dxf_form.chairs_combo.ItemIndex=0 then CONTINUE
                                                             else layer:=16;     // chair outlines   227a ..

                   495: if dxf_form.chair_bolts_combo.ItemIndex=0 then CONTINUE
                                                                  else layer:=19; // chair bolt mark across X

                   496: if (_3d=True) or (dxf_form.chair_bolts_combo.ItemIndex=0) then CONTINUE     // not in 3-D
                                                                                  else layer:=19;   // chair bolt mark across Y

                   498: if (_3d=True) or (dxf_form.sockets_combo.ItemIndex=0)      // 498 sockets for laser cutting,  actual size    see also 9997
                           then CONTINUE                                           // not in 3-D
                           else layer:=23;                                         // 2-D chair socket in timber, actual size

      480..483,488,489: if _3d=False then CONTINUE     // not in 2-D
                                     else layer:=22;   // dxf 3D key markers

                  9996: if (_3d=True) or (dxf_form.timbout_kerf_combo.ItemIndex=0) // 9996 timber outlines, with laser kerf adjustment   see also 498
                           then CONTINUE                                           // not in 3-D
                           else layer:=32;                                         // 2-D timber outline, kerf adjusted layer

                  9997: if (_3d=True) or (dxf_form.sockets_kerf_combo.ItemIndex=0) // 9997 sockets for laser cutting, with laser kerf adjustment   see also 498
                           then CONTINUE                                           // not in 3-D
                           else layer:=33;                                         // 2-D chair socket in timber, kerf adjusted layer

                  9998: layer:=27;      // timber web

                  9999: layer:=24;      // timber sprue

                   else CONTINUE;
          end;//case

                  // timber side and end flanges   layer  25 ...

          if ((code=479) or (code=490)) and (_3d=True) and (dxf_form.flanges_combo.ItemIndex<>0) and (i<(array_max-7))     // 479=dropper ridges  243b
             then begin

                    np:=0; // init

                       // build points array ...   8 marks per outer flange      out_flange_pex:array[0..7] of Tpex;
                       // 2D lines in list so ignore second point [3],[4] for each line

                    repeat
                      out_flange_pex[np].X:=intarray_get(list_bgnd_marks[0],i)/100;  // to mm
                      out_flange_pex[np].Y:=intarray_get(list_bgnd_marks[1],i)/100;

                      INC(np);

                      INC(i);  // next in list

                    until np>7;

                    DEC(i);  // undo last INC  228a

                    z14:=out_flange_top_z;
                    z13:=timb_bot_z;

                    z50:=z14+dropper_ridge_height*inscale;   // 241f


                    do_flange:=True;  // 244c  init

                    if (dxf_form.omit_flanges_conflict_checkbox.Checked=True) and (socket_list.Count>0)       // 244c
                       then begin
                              for sockn:=0 to (socket_list.Count-1) do begin

                                with Tsocket_object(socket_list.Objects[sockn]) do begin    // 4..7 = chamfer corners on socket

                                  socket_middle_pex.x:=(socket_corners[4].x+socket_corners[6].x)/2;
                                  socket_middle_pex.y:=(socket_corners[4].y+socket_corners[6].y)/2;

                                     // check if any socket corner or mid-point, is within the flange rectangle...

                                  if (check_if_inside_4_corners(socket_corners[4],out_flange_pex[0],out_flange_pex[1],out_flange_pex[2],out_flange_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_corners[5],out_flange_pex[0],out_flange_pex[1],out_flange_pex[2],out_flange_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_corners[6],out_flange_pex[0],out_flange_pex[1],out_flange_pex[2],out_flange_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_corners[7],out_flange_pex[0],out_flange_pex[1],out_flange_pex[2],out_flange_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_middle_pex,out_flange_pex[0],out_flange_pex[1],out_flange_pex[2],out_flange_pex[3])=True)
                                     then begin
                                            do_flange:=False;
                                            BREAK;
                                          end;

                                     // check if any flange corner is within the socket rectangle...

                                  if (check_if_inside_4_corners(out_flange_pex[0],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                  or (check_if_inside_4_corners(out_flange_pex[1],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                  or (check_if_inside_4_corners(out_flange_pex[2],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                  or (check_if_inside_4_corners(out_flange_pex[3],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                     then begin
                                            do_flange:=False;
                                            BREAK;
                                          end;

                                end;//with
                              end;//next
                            end;

                    if do_flange=True
                       then begin
                                      // surfaces of outer flange ...   layer 25

                              debug_code:=169;

                              Write(dxf_file,dxf_3dface_pex(out_flange_pex[0],z13, out_flange_pex[1],z13, out_flange_pex[2],z13, out_flange_pex[3],z13, 25,0));  // bottom of outer flange
                              Write(dxf_file,dxf_3dface_pex(out_flange_pex[0],z14, out_flange_pex[1],z14, out_flange_pex[2],z14, out_flange_pex[3],z14, 25,0));  // top of outer flange

                                      // sides of outer flange ...

                              debug_code:=170;

                              Write(dxf_file,dxf_3dface_pex(out_flange_pex[0],z13, out_flange_pex[1],z13, out_flange_pex[1],z14, out_flange_pex[0],z14, 25,0));  // lower end
                              Write(dxf_file,dxf_3dface_pex(out_flange_pex[1],z13, out_flange_pex[2],z13, out_flange_pex[2],z14, out_flange_pex[1],z14, 25,0));  // outer side
                              Write(dxf_file,dxf_3dface_pex(out_flange_pex[2],z13, out_flange_pex[3],z13, out_flange_pex[3],z14, out_flange_pex[2],z14, 25,0));  // upper end
                              Write(dxf_file,dxf_3dface_pex(out_flange_pex[3],z13, out_flange_pex[0],z13, out_flange_pex[0],z14, out_flange_pex[3],z14, 25,0));  // inner side


                              if (dxf_form.dropper_ridge_checkbox.Checked=True) {and (timber_str<>'S1') and (timber_str<>'S2')}             // 241f

                              and (NOT ( (timber_str=slider1_str)   // switch slider ribs ...
                                      or (timber_str=slider2_str)
                                      or (timber_str=slider3_str)
                                      or (timber_str=slider4_str)
                                      or (timber_str=slider5_str)
                                      or (timber_str=get_next_timber_along(slider1_str))
                                      or (timber_str=get_next_timber_along(slider2_str))
                                      or (timber_str=get_next_timber_along(slider3_str))
                                      or (timber_str=get_next_timber_along(slider4_str))
                                      or (timber_str=get_next_timber_along(slider5_str)) ))

                              and (SQRT(SQR(out_flange_pex[4].x-out_flange_pex[7].x)+SQR(out_flange_pex[4].y-out_flange_pex[7].y))>minfp)  // not wanted for end flanges, zero length of rib
                                  then begin
                                        Write(dxf_file,dxf_3dface_pex(out_flange_pex[4],z50, out_flange_pex[1],z50, out_flange_pex[2],z50, out_flange_pex[7],z50, 25,0));  // top of ridge
                                        Write(dxf_file,dxf_3dface_pex(out_flange_pex[5],z14, out_flange_pex[1],z14, out_flange_pex[2],z14, out_flange_pex[6],z14, 25,0));  // bottom of ridge

                                                // sides of ridge ...

                                        Write(dxf_file,dxf_3dface_pex(out_flange_pex[4],z50, out_flange_pex[1],z50, out_flange_pex[1],z14, out_flange_pex[5],z14, 25,0));  // lower end
                                        Write(dxf_file,dxf_3dface_pex(out_flange_pex[1],z50, out_flange_pex[2],z50, out_flange_pex[2],z14, out_flange_pex[1],z14, 25,0));  // outer side
                                        Write(dxf_file,dxf_3dface_pex(out_flange_pex[7],z50, out_flange_pex[2],z50, out_flange_pex[2],z14, out_flange_pex[6],z14, 25,0));  // upper end
                                        Write(dxf_file,dxf_3dface_pex(out_flange_pex[4],z50, out_flange_pex[7],z50, out_flange_pex[6],z14, out_flange_pex[5],z14, 25,0));  // inner side
                                       end;

                            end;//do_flange


                    CONTINUE;
                  end;


                  // timber sprues  layer 24 ...

          if (code=9999) and (_3d=True) and (dxf_form.sprues_combo.ItemIndex<>0) and (i<(array_max-6))
             then begin

                    np:=0; // init

                       // build points array ...   6 marks per sprue                          sprue_pex:array[0..5] of Tpex;
                       // 2D lines in list so ignore second point [3],[4] for each line

                    repeat
                      sprue_pex[np].X:=intarray_get(list_bgnd_marks[0],i)/100;  // to mm
                      sprue_pex[np].Y:=intarray_get(list_bgnd_marks[1],i)/100;

                      INC(np);

                      INC(i);  // next in list

                    until np>5;

                    DEC(i);  // undo last INC  228a

                    z14:=sprue_top_z;              // sprue_top
                    z13:=z14-sprue_thick*inscale;  // sprue bottom

                            // surfaces of sprue ...

                    debug_code:=171;

                    Write(dxf_file,dxf_3dface_pex(sprue_pex[0],z13, sprue_pex[1],z13, sprue_pex[4],z13, sprue_pex[5],z13, 24,0));  // bottom of sprue
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[1],z13, sprue_pex[2],z13, sprue_pex[3],z13, sprue_pex[4],z13, 24,0));  // bottom of sprue

                    Write(dxf_file,dxf_3dface_pex(sprue_pex[0],z14, sprue_pex[1],z14, sprue_pex[4],z14, sprue_pex[5],z14, 24,0));  // top of sprue
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[1],z14, sprue_pex[2],z14, sprue_pex[3],z14, sprue_pex[4],z14, 24,0));  // top of sprue

                            // sides of sprue ...

                    debug_code:=172;

                    Write(dxf_file,dxf_3dface_pex(sprue_pex[0],z13, sprue_pex[1],z13, sprue_pex[1],z14, sprue_pex[0],z14, 24,0));  // near side
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[1],z13, sprue_pex[2],z13, sprue_pex[2],z14, sprue_pex[1],z14, 24,0));  // outer side
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[2],z13, sprue_pex[3],z13, sprue_pex[3],z14, sprue_pex[2],z14, 24,0));  // end side
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[3],z13, sprue_pex[4],z13, sprue_pex[4],z14, sprue_pex[3],z14, 24,0));  // inner side
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[4],z13, sprue_pex[5],z13, sprue_pex[5],z14, sprue_pex[4],z14, 24,0));  // far side
                    Write(dxf_file,dxf_3dface_pex(sprue_pex[5],z13, sprue_pex[0],z13, sprue_pex[0],z14, sprue_pex[5],z14, 24,0));  // timber side

                    CONTINUE;
                  end;


                  // timber webs  layer 27 ...

          if (code=9998) and (_3d=True) and (dxf_form.webs_combo.ItemIndex<>0) and (i<(array_max-4))
             then begin

                    np:=0; // init

                       // 4 marks per web      web_pex:array[0..3] of Tpex;
                       // 2D lines in list so ignore second point [3],[4] for each line

                    repeat
                      web_pex[np].X:=intarray_get(list_bgnd_marks[0],i)/100;  // to mm
                      web_pex[np].Y:=intarray_get(list_bgnd_marks[1],i)/100;

                      INC(np);

                      INC(i);  // next in list

                    until np>3;

                    DEC(i);  // undo last INC  228a

                    z14:=out_flange_top_z;    // web top same as side flanges
                    z13:=timb_bot_z;          // web bottom


                    do_web:=True;  // 244c  init

                    if (dxf_form.omit_flanges_conflict_checkbox.Checked=True) and (socket_list.Count>0)       // 244c
                       then begin
                              for sockn:=0 to (socket_list.Count-1) do begin

                                with Tsocket_object(socket_list.Objects[sockn]) do begin    // 4..7 = chamfer corners

                                  socket_middle_pex.x:=(socket_corners[4].x+socket_corners[6].x)/2;
                                  socket_middle_pex.y:=(socket_corners[4].y+socket_corners[6].y)/2;

                                    // check if any socket corner or mid-point is within the web rectangle...

                                  if (check_if_inside_4_corners(socket_corners[4],web_pex[0],web_pex[1],web_pex[2],web_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_corners[5],web_pex[0],web_pex[1],web_pex[2],web_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_corners[6],web_pex[0],web_pex[1],web_pex[2],web_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_corners[7],web_pex[0],web_pex[1],web_pex[2],web_pex[3])=True)
                                  or (check_if_inside_4_corners(socket_middle_pex,web_pex[0],web_pex[1],web_pex[2],web_pex[3])=True)
                                     then begin
                                            do_web:=False;
                                            BREAK;
                                          end;

                                     // check if any flange corner is within the socket rectangle...

                                  if (check_if_inside_4_corners(web_pex[0],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                  or (check_if_inside_4_corners(web_pex[1],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                  or (check_if_inside_4_corners(web_pex[2],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                  or (check_if_inside_4_corners(web_pex[3],socket_corners[4],socket_corners[5],socket_corners[6],socket_corners[7])=True)
                                     then begin
                                            do_web:=False;
                                            BREAK;
                                          end;

                                end;//with
                              end;//next
                            end;

                    if do_web=True
                       then begin
                                      // surfaces of web ...

                              debug_code:=173;

                              Write(dxf_file,dxf_3dface_pex(web_pex[0],z13, web_pex[1],z13, web_pex[2],z13, web_pex[3],z13, 27,0));  // bottom of web
                              Write(dxf_file,dxf_3dface_pex(web_pex[0],z14, web_pex[1],z14, web_pex[2],z14, web_pex[3],z14, 27,0));  // top of web

                                      // sides of web ...

                              debug_code:=174;

                              Write(dxf_file,dxf_3dface_pex(web_pex[0],z13, web_pex[1],z13, web_pex[1],z14, web_pex[0],z14, 27,0));
                              Write(dxf_file,dxf_3dface_pex(web_pex[1],z13, web_pex[2],z13, web_pex[2],z14, web_pex[1],z14, 27,0));
                              Write(dxf_file,dxf_3dface_pex(web_pex[2],z13, web_pex[3],z13, web_pex[3],z14, web_pex[2],z14, 27,0));
                              Write(dxf_file,dxf_3dface_pex(web_pex[3],z13, web_pex[0],z13, web_pex[0],z14, web_pex[3],z14, 27,0));

                            end;//do_web

                    CONTINUE;
                  end;


             // chair base, plug and supports ...

          if (now_ti.file_blocks.keep_jaw_options[chi][2]=False) or (now_ti.file_blocks.keep_jaw_options[chi][3]=False)   // not exporting a loose jaw
             then begin

                    if ( (code=484) or (code=485) or (code=493) or (code=494) or (code=497) )        // 221a chair outlines with corner rads    layer 16
                   and ( i<(array_max-18) )
                       then begin

                              doing_L1:=(code=493);   // 236d

                              np:=0; // init
                              ni:=0;

                              case code of

                                 484: begin    // X crossing chair
                                        z6:=timb_top_z+_3d_data.X_chair_plinth_thick*inscale;
                                        z7:=timb_top_z+_3d_data.X_chair_edge_thick*inscale;
                                      end;

                                 485: begin    // SC-CC chair
                                        z6:=timb_top_z+_3d_data.SC_CC_chair_plinth_thick*inscale;
                                        z7:=timb_top_z+_3d_data.SC_CC_chair_edge_thick*inscale;
                                      end;

                                 493: begin   // L1 chair
                                        z6:=timb_top_z+_3d_data.L1_chair_plinth_thick*inscale;
                                        z7:=timb_top_z+_3d_data.L1_chair_edge_thick*inscale;
                                      end;

                                 497: begin   // P chair
                                        z6:=timb_top_z+_3d_data.P_chair_plinth_thick*inscale;
                                        z7:=timb_top_z+_3d_data.P_chair_edge_thick*inscale;
                                      end;

                                 else begin   // 494  S1-S1Jchair
                                        z6:=timb_top_z+_3d_data.chair_plinth_thick*inscale;    // chair plinth is a nominal rectangle area inside the outline perimeter
                                        z7:=timb_top_z+_3d_data.chair_edge_thick*inscale;
                                      end;
                              end;//case

                                 // build points array (28 points)...  + 4 points for plinth rectangle (28..31)
                                 // + 4 points (32..35) for jaw loose pin rectangle
                                 // + 4 points (36..39) for jaw loose pin rectangle sheared for angled pin slot     236d
                                 // + 4 points (40..43) for jaw loose pin rectangle for second jaw on check chairs  237a
                                 // + 4 points (44..47) for jaw loose pin rectangle sheared for angled second jaw on check chairs  237a

                              repeat
                                p[np].X:=intarray_get(list_bgnd_marks[0],i+ni);
                                p[np].Y:=intarray_get(list_bgnd_marks[1],i+ni);

                                p[np+1].X:=intarray_get(list_bgnd_marks[2],i+ni);
                                p[np+1].Y:=intarray_get(list_bgnd_marks[3],i+ni);

                                INC(np);  // +2
                                INC(np);

                                INC(ni);  // +1

                              until np>46;

                                 // corner centres ...  (plinth rectangle)

                              pc1:=p[29];
                              pc2:=p[30];
                              pc3:=p[31];
                              pc4:=p[28];

                              pex1.x:=pc1.x/100;      // for later on this chair...
                              pex1.y:=pc1.y/100;

                              pex2.x:=pc2.x/100;
                              pex2.y:=pc2.y/100;

                              pex3.x:=pc3.x/100;
                              pex3.y:=pc3.y/100;

                              pex4.x:=pc4.x/100;
                              pex4.y:=pc4.y/100;

                                 // outer jaw loose pin slot ...

                              ps1:=p[32];
                              ps2:=p[33];
                              ps3:=p[34];
                              ps4:=p[35];

                                  // sheared slot dims for angled slot L1 chairs ...

                              ps5:=p[36];
                              ps6:=p[37];
                              ps7:=p[38];
                              ps8:=p[39];

                                  // second slot dims for for check-rail chairs inner jaw ...

                              ps9:=p[40];
                              ps10:=p[41];
                              ps11:=p[42];
                              ps12:=p[43];

                                  // sheared second slot dims for angled slot L1 check chairs ...

                              ps13:=p[44];
                              ps14:=p[45];
                              ps15:=p[46];
                              ps16:=p[47];


                              //  edge blanks not now used ...

                              if (_3d=True) and (colour(layer)<>'0|')
                                 then begin
                                                   // inner ...

                                                  n1:=6;
                                                  n2:=8;
                                                  blanks:=8;
                                                  _3d_chair_outline;

                                                  n1:=5;
                                                  n2:=9;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=4;
                                                  n2:=10;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=3;
                                                  n2:=11;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=2;
                                                  n2:=12;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=1;
                                                  n2:=13;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  // middle ..

                                                  n1:=0;
                                                  n2:=14;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  // outer ...

                                                  n1:=27;
                                                  n2:=15;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=26;
                                                  n2:=16;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=25;
                                                  n2:=17;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=24;
                                                  n2:=18;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=23;
                                                  n2:=19;
                                                  blanks:=10;
                                                  _3d_chair_outline;

                                                  n1:=22;
                                                  n2:=20;
                                                  blanks:=2;
                                                  _3d_chair_outline;

                                                  _3d_chair_plinth(z6,z7,True,True);     // sloping sides and top of plinth

                                                  _3d_chair_plinth(z8,z8,True,False);    // underside of chair

                                                  _3d_chair_plinth(z6,z8,False,False);   // sides of loose pin slot

                                      end
                                 else begin    // 2-D and wire-frame ...

                                        for np:=0 to 26 do begin     // draw 28 lines chair outline...

                                          move_to:=p[np];
                                          line_to:=p[np+1];

                                          dxf_mark;    // first 27 lines
                                        end;//next;

                                        move_to:=line_to;
                                        line_to:=p[0];

                                        dxf_mark;  // back to first point
                                      end;

                              CONTINUE;
                            end;

                         //   ss1,etc slot outlines already set for this chair in plinth above ...

                  if (code=491) and (i<(array_max-60))      // 241b chair plug outline  layer 16    60 total marks
                     then begin

                            np:=0; // init

                               // build points array (0..35, 36 points, sides and angled corners, support pyramids) ...
                               // 24 points on 3 plug outlines and sequential 4 points in list on support top, 4 on support bottom, 4 mid points needed for twisted slots (loose jaws)
                               // 2D lines in list so ignore second point [3],[4] for each line

                               // 24 more points for clip-fit plugs - tang recesses  - total 60 points

                            repeat
                              pex[np].X:=intarray_get(list_bgnd_marks[0],i)/100;  // to mm
                              pex[np].Y:=intarray_get(list_bgnd_marks[1],i)/100;

                              INC(np);

                              INC(i);  // next in list

                            until np>59;   // 241b

                            DEC(i);  // undo last INC  228a

                              // init in case no plug, modified later if plug ...

                            z96:=z8;                   // if no plug  support pyramid on underside of chair base     z8 is timber top

                            if scale>4.05
                               then z98:=z96-pyramid_height_high   // mm  depth of pyramid
                               else z98:=z96-pyramid_height_low;   // mm  depth of pyramid

                            RESULT:=z98;   // 234e return this for the background shapes (support raft)

                            if (_3d=True) and (dxf_form.plugs_checkbox.Checked=True)   // plug ... JUNE 2021
                               then begin
                                      layer:=34;

                                            // 229d  plug depths in order down from top   z8 is timber top
                                            // modify above Z ...

                                            // 234e  mods  allow plug bottom inset smaller than inset below taper ( second taper) ...

                                      if dxf_form.snap_fit_radio.Checked=True   // 241b
                                         then begin
                                                z99:=z8-snap_plug_overcut_depth*inscale;   // mm  default 2.1/4" depth to plug overcut
                                                z95:=z99;                                  // mm  level overcut top face
                                              end
                                         else begin                                    // clip-fit and press-fit
                                                z99:=z8-plug_taper_depth*inscale;      // mm  plug outer side depth, top of taper   default 1.5",  5.5" scale above total depth
                                                z95:=z8-plug_inset_depth*inscale;      // mm  plug side depth, top of bottom inset  default 3",  4" scale above total depth
                                              end;

                                      z97:=z8-plug_total_depth*inscale;      // mm  plug effective depth   default 7.75" scale

                                      z96:=z8-plug_extended_depth*inscale;   // 237a      was z97-inscale*3/8;   top of pyramid support, 5/8" scale below plug sides to improve 3D printing overhang    // 232c was 1/8"

                                      z85:=z8-clip_tang_roof_front_depth*inscale;   // 241b
                                      z86:=z8-clip_tang_roof_back_depth*inscale;
                                      z87:=z8-clip_tang_floor_depth*inscale;


                                            // lengthen top section if locator plugs wanted ...

                                      if dxf_form.locator_plugs_checkbox.Checked=True
                                         then begin
                                                locator_depth_mod:=(locator_plug_depth-plug_extended_depth)*inscale;

                                                z99:=z99-locator_depth_mod;
                                                z95:=z95-locator_depth_mod;
                                                z97:=z97-locator_depth_mod;
                                                z96:=z96-locator_depth_mod;
                                              end;

                                      if z99>z8 then z99:=z8;
                                      if z95>z99 then z95:=z99;
                                      if z97>z95 then z97:=z95;
                                      if z96>z97 then z96:=z97;

                                      if scale>4.05
                                         then z98:=z96-pyramid_height_high     // mm  depth of pyramid support below plug
                                         else z98:=z96-pyramid_height_low;     // mm  depth of pyramid support below plug

                                      RESULT:=z98;   // 234e return this for the background shapes (support raft)

                                      z90:=z96;  // through slot

                                         // plug ...

                                      debug_code:=175;

                                      slots_wanted:=0;  // init

                                      if dxf_form.locator_plugs_checkbox.Checked=False         // not if locator plugs
                                         then begin

                                                  //  chair codes: 1=S1 chair, 2=P chair, 3=  , 4= , 5=L1 bridge chair, 6=M1 bridge chair, 7=S1J joint chair
                                                  //               8=S1O half-bolted chair outer, 9=S1N half-bolted chair inner, 10=SC fictional 4-screw chair

                                                  case dxf_chair of    // 239a

                                                         1: begin    // S1

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[0][2];      // 0 = running rail
                                                              loose_2nd:=False;
                                                            end;

                                                         2: begin    // P

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[3][2];      // 3 = stock rail
                                                              loose_2nd:=False;
                                                            end;

                                                         5: begin    // L1

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[2][2];      // 2 = running rail
                                                              loose_2nd:=False;
                                                            end;

                                                         7: begin    // S1J

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[1][2];      // 1 = running rail
                                                              loose_2nd:=False;
                                                            end;

                                                        10: begin    // SC fictional

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[31][2];      // 31 = running rail
                                                              loose_2nd:=False;
                                                            end;

                                                        11: begin    // switch block slide chairs    1P, 2P stock rail

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[4][2];      // 4 = stock rail
                                                              loose_2nd:=False;                                          // ( 5 no jaw)
                                                            end;

                                                        12: begin    // switch block heel chairs     3P..11P

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[6][2];       // 6 = stock rail
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[7][2];       // 7 = switch rail
                                                            end;

                                                     14,16: begin    // check rail end chairs   CCL , CCR

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[10][2];       // 10 = running rail
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[11][2];       // 11 = check rail
                                                            end;

                                                        15: begin   // check rail chairs CC parallel

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[8][2];       // 8 = running rail
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[9][2];       // 9 = check rail
                                                            end;


                                                        21: begin   // ZY wing front chairs

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[13][2];       // 13 = main crossing rail
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[14][2];       // 14 = turnout crossing rail                                                    end;

                                                            end;

                                                        22: begin   // XN knuckle chairs

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[15][2];       // 15 = main crossing rail
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[16][2];       // 16 = turnout crossing rail                                                    end;

                                                            end;

                                                        23: begin   // XA gap chairs

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[17][2];       // 17 = main rail, along wing
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[18][2];       // 18 = turnout rail, along wing                                                    end;

                                                            end;


                                                        24: begin   // AA nose chairs

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[20][2];       // 20 = along TS wing
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[19][2];       // 19 = along MS wing                                                    end;

                                                            end;

                                                        25: begin   // AB splice chairs

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[22][2];       // 22 = along TS wing
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[21][2];       // 21 = along MS wing                                                    end;

                                                            end;


                                                        26: begin   // BB/BC wing flare chairs    241a

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[24][2];       // 24 = along TS wing
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[23][2];       // 23 = along MS wing                                                    end;

                                                            end;




                                                        28: begin   // EF exit chairs

                                                              loose_1st:=now_ti.file_blocks.keep_jaw_options[27][2];       // 27 = main exit rail
                                                              loose_2nd:=now_ti.file_blocks.keep_jaw_options[28][2];       // 28 = turnout exit rail                                                    end;

                                                            end;





                                                       else begin   // ??? other chairs

                                                              loose_1st:=False;
                                                              loose_2nd:=False;
                                                            end;

                                                  end;//case

                                                  if (loose_1st=True)  and (loose_2nd=True)  then slots_wanted:=2;     // both slots
                                                  if (loose_1st=True)  and (loose_2nd=False) then slots_wanted:=1;     // first slot
                                                  if (loose_1st=False) and (loose_2nd=True)  then slots_wanted:=0-1;   // second slot on switch/check rail only
                                                  if (loose_1st=False) and (loose_2nd=False) then slots_wanted:=0;     // no slots

                                              end;

                                                         // plug top face  ...

                                      if (slots_wanted=0) or (dxf_form.chairs_combo.ItemIndex=0)  // no slots, or slots not set

                                         then begin      // no slot for loose pin, use same dims as top of support pyramid for top centre of plug ...

                                                slots_wanted:=0;  // force in case no chairs combo, dims not set     //241e

                                                Write(dxf_file,dxf_3dface_pex( pex[0],z8, pex[1],z8, pex[24],z8, pex[24],z8, layer,0));  // top face of plug  1st corner
                                                Write(dxf_file,dxf_3dface_pex( pex[2],z8, pex[3],z8, pex[25],z8, pex[25],z8, layer,0));  // top face of plug  2nd corner
                                                Write(dxf_file,dxf_3dface_pex( pex[4],z8, pex[5],z8, pex[26],z8, pex[26],z8, layer,0));  // top face of plug  3rd corner
                                                Write(dxf_file,dxf_3dface_pex( pex[6],z8, pex[7],z8, pex[27],z8, pex[27],z8, layer,0));  // top face of plug  4th corner

                                                Write(dxf_file,dxf_3dface_pex( pex[1],z8, pex[2],z8, pex[25],z8, pex[24],z8, layer,0));  // top face of plug  1st side
                                                Write(dxf_file,dxf_3dface_pex( pex[3],z8, pex[4],z8, pex[26],z8, pex[25],z8, layer,0));  // top face of plug  2nd side
                                                Write(dxf_file,dxf_3dface_pex( pex[5],z8, pex[6],z8, pex[27],z8, pex[26],z8, layer,0));  // top face of plug  3rd side
                                                Write(dxf_file,dxf_3dface_pex( pex[7],z8, pex[0],z8, pex[24],z8, pex[27],z8, layer,0));  // top face of plug  4th side

                                                Write(dxf_file,dxf_3dface_pex( pex[24],z8,  pex[25],z8,  pex[26],z8,  pex[27],z8,  layer,0));  // top face of plug centre   (dims as top of pyramid)
                                              end
                                         else begin      //  fill 15 spaces around slots ...

                                                Write(dxf_file,dxf_3dface_pex( pex[0],z8, pex[1],z8, ss1,z8,  ss1,z8,  layer,0));  // 1
                                                Write(dxf_file,dxf_3dface_pex( pex[1],z8, ss2,z8,    ss1,z8,  ss1,z8,  layer,0));  // 1A
                                                Write(dxf_file,dxf_3dface_pex( pex[1],z8, pex[2],z8, ss2,z8,  ss2,z8,  layer,0));  // 2
                                                Write(dxf_file,dxf_3dface_pex( pex[2],z8, ss10,z8,   ss2,z8,  ss2,z8,  layer,0));  // 3
                                                Write(dxf_file,dxf_3dface_pex( pex[2],z8, ss9,z8,    ss10,z8, ss10,z8, layer,0));  // 4
                                                Write(dxf_file,dxf_3dface_pex( pex[2],z8, pex[3],z8, ss9,z8,  ss9,z8,  layer,0));  // 5
                                                Write(dxf_file,dxf_3dface_pex( pex[3],z8, pex[4],z8, ss12,z8, ss9,z8,  layer,0));  // 6
                                                Write(dxf_file,dxf_3dface_pex( pex[4],z8, pex[5],z8, ss12,z8, ss12,z8, layer,0));  // 7
                                                Write(dxf_file,dxf_3dface_pex( pex[5],z8, ss11,z8,   ss12,z8, ss12,z8, layer,0));  // 8
                                                Write(dxf_file,dxf_3dface_pex( pex[5],z8, ss3,z8,    ss11,z8, ss11,z8, layer,0));  // 9
                                                Write(dxf_file,dxf_3dface_pex( pex[5],z8, pex[6],z8, ss3,z8,  ss3,z8,  layer,0));  // 10
                                                Write(dxf_file,dxf_3dface_pex( pex[6],z8, ss4,z8,    ss3,z8,  ss3,z8,  layer,0));  // 10A
                                                Write(dxf_file,dxf_3dface_pex( pex[6],z8, pex[7],z8, ss4,z8,  ss4,z8,  layer,0));  // 11
                                                Write(dxf_file,dxf_3dface_pex( pex[7],z8, pex[0],z8, ss1,z8,  ss4,z8,  layer,0));  // 12

                                                Write(dxf_file,dxf_3dface_pex( ss2,z8,    ss10,z8,   ss11,z8, ss3,z8,  layer,0));  // 13 between slots
                                              end;

                                                        // plug bottom face  ...

                                      if (slots_wanted=0) or (dxf_form.chairs_combo.ItemIndex=0)   // no slots for loose pins, dims as top of support pyramid plug, or slots not set ...
                                         then begin
                                                slots_wanted:=0;  // force in case no chairs combo, dims not set     //241e

                                                Write(dxf_file,dxf_3dface_pex( pex[24],z96, pex[25],z96, pex[26],z96, pex[27],z96, layer,0));  // base of plug centre   top of pyramid
                                              end
                                         else begin    // 237a  plug bottom z96   fill 12 spaces between 2 twisted slots and pyramid rectangle ...

                                                   // ss1..4 sheared to ss5..8   for sheared first slot (L1 chair, angled slot)
                                                   // ss9..12 sheared to ss13..16   for sheared second slot (L1 chair, angled slot)

                                                Write(dxf_file,dxf_3dface_pex(   ss5,z96, pex[32],z96, pex[24],z96, pex[24],z96, layer,0));  // 1
                                                Write(dxf_file,dxf_3dface_pex(   ss5,z96,     ss6,z96, pex[32],z96, pex[32],z96, layer,0));  // 2
                                                Write(dxf_file,dxf_3dface_pex(   ss6,z96,    ss14,z96, pex[33],z96, pex[32],z96, layer,0));  // 3
                                                Write(dxf_file,dxf_3dface_pex(  ss14,z96,    ss13,z96, pex[33],z96, pex[33],z96, layer,0));  // 4
                                                Write(dxf_file,dxf_3dface_pex(  ss13,z96, pex[25],z96, pex[33],z96, pex[33],z96, layer,0));  // 5
                                                Write(dxf_file,dxf_3dface_pex(  ss13,z96,    ss16,z96, pex[26],z96, pex[25],z96, layer,0));  // 6
                                                Write(dxf_file,dxf_3dface_pex(  ss16,z96, pex[34],z96, pex[26],z96, pex[26],z96, layer,0));  // 7
                                                Write(dxf_file,dxf_3dface_pex(  ss16,z96,    ss15,z96, pex[34],z96, pex[34],z96, layer,0));  // 8
                                                Write(dxf_file,dxf_3dface_pex(  ss15,z96,     ss7,z96, pex[35],z96, pex[34],z96, layer,0));  // 9
                                                Write(dxf_file,dxf_3dface_pex(   ss7,z96,     ss8,z96, pex[35],z96, pex[35],z96, layer,0));  // 10
                                                Write(dxf_file,dxf_3dface_pex(   ss8,z96, pex[27],z96, pex[35],z96, pex[35],z96, layer,0));  // 11
                                                Write(dxf_file,dxf_3dface_pex(   ss8,z96,     ss5,z96, pex[24],z96, pex[27],z96, layer,0));  // 12

                                                Write(dxf_file,dxf_3dface_pex(   ss6,z96,    ss14,z96,    ss15,z96,     ss7,z96, layer,0));  // between slots
                                              end;

                                      if slots_wanted=1    // single slot for loose jaw pin - plate over second slot ...
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex(  ss9,z8,  ss10,z8,  ss11,z8,  ss12,z8,  layer,0));  // top
                                                Write(dxf_file,dxf_3dface_pex( ss13,z96, ss14,z96, ss15,z96, ss16,z96, layer,0));  // bottom
                                              end;

                                      if slots_wanted<0   // second slot only (check rail) ... plate over first slot ...
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex( ss1,z8,  ss2,z8,  ss3,z8,  ss4,z8,  layer,0));  // top
                                                Write(dxf_file,dxf_3dface_pex( ss5,z96, ss6,z96, ss7,z96, ss8,z96, layer,0));  // bottom
                                              end;
                                                     // sides of slots ...

                                      if (slots_wanted>0) and (z8<>z90)
                                         then begin
                                                     // sides of first slot in plug

                                                Write(dxf_file,dxf_3dface_pex( ss1,z8, ss2,z8, ss6,z90, ss5,z90, layer,0));
                                                Write(dxf_file,dxf_3dface_pex( ss2,z8, ss3,z8, ss7,z90, ss6,z90, layer,0));
                                                Write(dxf_file,dxf_3dface_pex( ss3,z8, ss4,z8, ss8,z90, ss7,z90, layer,0));
                                                Write(dxf_file,dxf_3dface_pex( ss4,z8, ss1,z8, ss5,z90, ss8,z90, layer,0));
                                              end;

                                      if ((slots_wanted>1) or (slots_wanted<0)) and (z8<>z90)
                                         then begin
                                                    // sides of second slot, check rail

                                                Write(dxf_file,dxf_3dface_pex( ss9,z8,  ss10,z8, ss14,z90, ss13,z90, layer,0));
                                                Write(dxf_file,dxf_3dface_pex( ss10,z8, ss11,z8, ss15,z90, ss14,z90, layer,0));
                                                Write(dxf_file,dxf_3dface_pex( ss11,z8, ss12,z8, ss16,z90, ss15,z90, layer,0));
                                                Write(dxf_file,dxf_3dface_pex( ss12,z8, ss9,z8,  ss13,z90, ss16,z90, layer,0));
                                              end;

                                              // sides of plug ...

                                      debug_code:=176;

                                      tangs:=dxf_form.clip_fit_radio.Checked;

                                      double_tangs:=ABS(pex[38].y-pex[37].y)>minfp;   // 2 tang sets on this chair?   non-zero spacing

                                      midtang36_pex.x:=(pex[36].x+pex[43].x)/2;
                                      midtang36_pex.y:=(pex[36].y+pex[43].y)/2;

                                      midtang37_pex.x:=(pex[37].x+pex[42].x)/2;
                                      midtang37_pex.y:=(pex[37].y+pex[42].y)/2;

                                      midtang38_pex.x:=(pex[38].x+pex[41].x)/2;
                                      midtang38_pex.y:=(pex[38].y+pex[41].y)/2;

                                      midtang39_pex.x:=(pex[39].x+pex[40].x)/2;
                                      midtang39_pex.y:=(pex[39].y+pex[40].y)/2;


                                         // vertical down to taper start ...

                                            // ends and corners ...

                                      Write(dxf_file,dxf_3dface_pex( pex[0],z99, pex[1],z99, pex[1],z8, pex[0],z8,  layer,0));  // outer end of plug 1st corner
                                      Write(dxf_file,dxf_3dface_pex( pex[2],z99, pex[3],z99, pex[3],z8, pex[2],z8,  layer,0));  // inner end of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[3],z99, pex[4],z99, pex[4],z8, pex[3],z8,  layer,0));  // inner end of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[4],z99, pex[5],z99, pex[5],z8, pex[4],z8,  layer,0));  // inner end of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[6],z99, pex[7],z99, pex[7],z8, pex[6],z8,  layer,0));  // outer end of plug last corner
                                      Write(dxf_file,dxf_3dface_pex( pex[7],z99, pex[0],z99, pex[0],z8, pex[7],z8,  layer,0));  // outer end of plug

                                            // near side ...

                                      if tangs=True
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex(  pex[1],z99, pex[36],z99, pex[36],z8,  pex[1],z8,  layer,0));     // side of plug above taper -- near side near part
                                                Write(dxf_file,dxf_3dface_pex( pex[37],z99, pex[38],z99, pex[38],z8, pex[37],z8,  layer,0));     // side of plug above taper -- near side mid part between recesses
                                                Write(dxf_file,dxf_3dface_pex( pex[39],z99,  pex[2],z99,  pex[2],z8, pex[39],z8,  layer,0));     // side of plug above taper -- near side far part

                                                Write(dxf_file,dxf_3dface_pex( pex[36],z85, pex[37],z85, pex[37],z8, pex[36],z8,  layer,0));     // side of plug above 1st tang recess -- near side
                                                Write(dxf_file,dxf_3dface_pex( pex[38],z85, pex[39],z85, pex[39],z8, pex[38],z8,  layer,0));     // side of plug above 2nd tang recess -- near side

                                                Write(dxf_file,dxf_3dface_pex( pex[36],z85, pex[37],z85, midtang37_pex,z86, midtang36_pex,z86,  layer,0));   // roof of 1st tang recess -- near side

                                                if double_tangs=True
                                                   then Write(dxf_file,dxf_3dface_pex( pex[38],z85, pex[39],z85, midtang39_pex,z86, midtang38_pex,z86,  layer,0));   // roof of 2nd tang recess -- near side
                                              end
                                         else Write(dxf_file,dxf_3dface_pex( pex[1],z99, pex[2],z99, pex[2],z8, pex[1],z8,  layer,0));  // near side of plug above taper

                                            // far side ...

                                      if tangs=True
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex(  pex[5],z99, pex[40],z99, pex[40],z8,  pex[5],z8,  layer,0));     // side of plug above taper -- far side far part
                                                Write(dxf_file,dxf_3dface_pex( pex[41],z99, pex[42],z99, pex[42],z8, pex[41],z8,  layer,0));     // side of plug above taper -- far side mid part between recesses
                                                Write(dxf_file,dxf_3dface_pex( pex[43],z99,  pex[6],z99,  pex[6],z8, pex[43],z8,  layer,0));     // side of plug above taper -- far side near part

                                                Write(dxf_file,dxf_3dface_pex( pex[40],z85, pex[41],z85, pex[41],z8, pex[40],z8,  layer,0));     // side of plug above 2nd tang recess -- far side
                                                Write(dxf_file,dxf_3dface_pex( pex[42],z85, pex[43],z85, pex[43],z8, pex[42],z8,  layer,0));     // side of plug above 1st tang recess -- far side

                                                Write(dxf_file,dxf_3dface_pex( pex[42],z85, pex[43],z85, midtang36_pex,z86, midtang37_pex,z86,  layer,0));   // roof of 1st tang recess -- far side

                                                if double_tangs=True
                                                   then Write(dxf_file,dxf_3dface_pex( pex[40],z85, pex[41],z85, midtang38_pex,z86, midtang39_pex,z86,  layer,0));   // roof of 2nd tang recess -- far side

                                              end
                                         else Write(dxf_file,dxf_3dface_pex( pex[5],z99, pex[6],z99, pex[6],z8, pex[5],z8,  layer,0));  // far side of plug above taper

                                        // done vertical down to taper

                                        // angled taper ...

                                            // ends and corners ...

                                      Write(dxf_file,dxf_3dface_pex( pex[0],z99, pex[1],z99,  pex[9],z95,  pex[8],z95,  layer,0));  // taper angle side of plug 1st corner
                                      Write(dxf_file,dxf_3dface_pex( pex[2],z99, pex[3],z99, pex[11],z95, pex[10],z95,  layer,0));  // taper angle corner of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[3],z99, pex[4],z99, pex[12],z95, pex[11],z95,  layer,0));  // taper angle end of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[4],z99, pex[5],z99, pex[13],z95, pex[12],z95,  layer,0));  // taper angle corner of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[6],z99, pex[7],z99, pex[15],z95, pex[14],z95,  layer,0));  // taper angle last corner
                                      Write(dxf_file,dxf_3dface_pex( pex[7],z99, pex[0],z99,  pex[8],z95, pex[15],z95,  layer,0));  // taper angle end of plug

                                            // near side ...

                                      if tangs=True
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex( pex[1],z99,  pex[36],z99, pex[44],z95,  pex[9],z95, layer,0));  // taper angle side of plug -- near side near part
                                                Write(dxf_file,dxf_3dface_pex( pex[37],z99, pex[38],z99, pex[46],z95, pex[45],z95, layer,0));  // taper angle side of plug -- near side mid part between recesses
                                                Write(dxf_file,dxf_3dface_pex( pex[2],z99,  pex[39],z99, pex[47],z95, pex[10],z95, layer,0));  // taper angle side of plug -- near side far part
                                              end
                                         else Write(dxf_file,dxf_3dface_pex( pex[1],z99, pex[2],z99, pex[10],z95, pex[9],z95,   layer,0));  // taper angle side of plug

                                            // far side ...

                                      if tangs=True
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex(  pex[5],z99, pex[40],z99, pex[48],z95, pex[13],z95, layer,0));  // taper angle side of plug --  far side far part
                                                Write(dxf_file,dxf_3dface_pex( pex[41],z99, pex[42],z99, pex[50],z95, pex[49],z95, layer,0));  // taper angle side of plug --  far side mid part between recesses
                                                Write(dxf_file,dxf_3dface_pex( pex[43],z99,  pex[6],z99, pex[14],z95, pex[51],z95, layer,0));  // taper angle side of plug --  far side near part
                                              end
                                         else Write(dxf_file,dxf_3dface_pex( pex[5],z99, pex[6],z99, pex[14],z95, pex[13],z95,  layer,0));  // taper angle side of plug

                                        // done tapered part

                                        // lower inset ...

                                           // ends and corners ...

                                      Write(dxf_file,dxf_3dface_pex( pex[16],z97, pex[17],z97,  pex[9],z95,  pex[8],z95,   layer,0));  // inset side of plug 1st corner
                                      Write(dxf_file,dxf_3dface_pex( pex[18],z97, pex[19],z97, pex[11],z95, pex[10],z95,  layer,0));    // inset corner
                                      Write(dxf_file,dxf_3dface_pex( pex[19],z97, pex[20],z97, pex[12],z95, pex[11],z95,  layer,0));    // inset far end of plug
                                      Write(dxf_file,dxf_3dface_pex( pex[20],z97, pex[21],z97, pex[13],z95, pex[12],z95,  layer,0));    // inset corner
                                      Write(dxf_file,dxf_3dface_pex( pex[22],z97, pex[23],z97, pex[15],z95, pex[14],z95,  layer,0));    // inset last corner
                                      Write(dxf_file,dxf_3dface_pex( pex[23],z97, pex[16],z97,  pex[8],z95,  pex[15],z95,  layer,0));   // inset near end plug


                                      if tangs=True
                                         then begin
                                                Write(dxf_file,dxf_3dface_pex( pex[17],z97,  pex[52],z87, pex[44],z95,  pex[9],z95,  layer,0));   // inset side of plug  -- near side near part
                                                Write(dxf_file,dxf_3dface_pex( pex[18],z97,  pex[55],z87, pex[47],z95, pex[10],z95,  layer,0));   // inset side of plug  -- near side far part

                                                Write(dxf_file,dxf_3dface_pex( pex[52],z87,  pex[55],z87, pex[18],z97, pex[17],z97,  layer,0));   // side of plug below tang both recesses -- near side

                                                Write(dxf_file,dxf_3dface_pex( pex[46],z95,  pex[45],z95, pex[53],z87, pex[54],z87,  layer,0));   // inset side between recesses -- near side



                                                Write(dxf_file,dxf_3dface_pex( pex[22],z97,  pex[59],z87, pex[51],z95, pex[14],z95,  layer,0));   // inset side of plug  -- far side near part
                                                Write(dxf_file,dxf_3dface_pex( pex[21],z97,  pex[56],z87, pex[48],z95, pex[13],z95,  layer,0));   // inset side of plug  -- far side far part

                                                Write(dxf_file,dxf_3dface_pex( pex[59],z87,  pex[56],z87, pex[21],z97, pex[22],z97,  layer,0));   // side of plug below tang both recesses -- far side

                                                Write(dxf_file,dxf_3dface_pex( pex[49],z95,  pex[50],z95, pex[58],z87, pex[57],z87,  layer,0));   // inset side between recesses -- far side



                                                Write(dxf_file,dxf_3dface_pex( pex[52],z87, pex[53],z87, pex[58],z87, pex[59],z87,  layer,0));   // floor of 1st tang recess


                                                Write(dxf_file,dxf_3dface_pex( pex[36],z85, midtang36_pex,z86,       pex[36],z99, pex[36],z99,  layer,0));   // end face of 1st tang recess -- near side  near end upper triangle part
                                                Write(dxf_file,dxf_3dface_pex( pex[36],z99, midtang36_pex,z86, midtang36_pex,z95, pex[44],z95,  layer,0));   // end face of 1st tang recess -- near side  near end mid part

                                                Write(dxf_file,dxf_3dface_pex( pex[43],z85, midtang36_pex,z86,       pex[43],z99, pex[43],z99,  layer,0));   // end face of 1st tang recess -- far side  near end upper triangle part
                                                Write(dxf_file,dxf_3dface_pex( pex[43],z99, midtang36_pex,z86, midtang36_pex,z95, pex[51],z95,  layer,0));   // end face of 1st tang recess -- far side  near end mid part

                                                Write(dxf_file,dxf_3dface_pex( pex[44],z95,       pex[51],z95,       pex[59],z87, pex[52],z87,  layer,0));   // end face of 1st tang recess -- near end lower part both sides



                                                Write(dxf_file,dxf_3dface_pex( pex[37],z85, midtang37_pex,z86,       pex[37],z99, pex[37],z99,  layer,0));   // end face of 1st tang recess -- near side  far end upper triangle part
                                                Write(dxf_file,dxf_3dface_pex( pex[37],z99, midtang37_pex,z86, midtang37_pex,z95, pex[45],z95,  layer,0));   // end face of 1st tang recess -- near side  far end mid part

                                                Write(dxf_file,dxf_3dface_pex( pex[42],z85, midtang37_pex,z86,       pex[42],z99, pex[42],z99,  layer,0));   // end face of 1st tang recess -- far side  far end upper triangle part
                                                Write(dxf_file,dxf_3dface_pex( pex[42],z99, midtang37_pex,z86, midtang37_pex,z95, pex[50],z95,  layer,0));   // end face of 1st tang recess -- far side  far end mid part

                                                Write(dxf_file,dxf_3dface_pex( pex[45],z95,       pex[50],z95,       pex[58],z87, pex[53],z87,  layer,0));   // end face of 1st tang recess -- far end lower part both sides

                                               if double_tangs=True
                                                   then begin
                                                          Write(dxf_file,dxf_3dface_pex( pex[54],z87, pex[55],z87, pex[56],z87, pex[57],z87,  layer,0));   // floor of 2nd tang recess


                                                          Write(dxf_file,dxf_3dface_pex( pex[38],z85, midtang38_pex,z86,       pex[38],z99, pex[38],z99,  layer,0));   // end face of 2nd tang recess -- near side  near end upper triangle part
                                                          Write(dxf_file,dxf_3dface_pex( pex[38],z99, midtang38_pex,z86, midtang38_pex,z95, pex[46],z95,  layer,0));   // end face of 2nd tang recess -- near side  near end mid part

                                                          Write(dxf_file,dxf_3dface_pex( pex[41],z85, midtang38_pex,z86,       pex[41],z99, pex[41],z99,  layer,0));   // end face of 2nd tang recess -- far side  near end upper triangle part
                                                          Write(dxf_file,dxf_3dface_pex( pex[41],z99, midtang38_pex,z86, midtang38_pex,z95, pex[49],z95,  layer,0));   // end face of 2nd tang recess -- far side  near end mid part

                                                          Write(dxf_file,dxf_3dface_pex( pex[46],z95,       pex[49],z95,       pex[57],z87, pex[54],z87,  layer,0));   // end face of 2nd tang recess -- near end lower part both sides



                                                          Write(dxf_file,dxf_3dface_pex( pex[39],z85, midtang39_pex,z86,       pex[39],z99, pex[39],z99,  layer,0));   // end face of 2nd tang recess -- near side  far end upper triangle part
                                                          Write(dxf_file,dxf_3dface_pex( pex[39],z99, midtang39_pex,z86, midtang39_pex,z95, pex[47],z95,  layer,0));   // end face of 2nd tang recess -- near side  far end mid part

                                                          Write(dxf_file,dxf_3dface_pex( pex[40],z85, midtang39_pex,z86,       pex[40],z99, pex[40],z99,  layer,0));   // end face of 2nd tang recess -- far side  far end upper triangle part
                                                          Write(dxf_file,dxf_3dface_pex( pex[40],z99, midtang39_pex,z86, midtang39_pex,z95, pex[48],z95,  layer,0));   // end face of 2nd tang recess -- far side  far end mid part

                                                          Write(dxf_file,dxf_3dface_pex( pex[47],z95,       pex[48],z95,       pex[56],z87, pex[55],z87,  layer,0));   // end face of 2nd tang recess -- far end lower part both sides

                                                        end;

                                              end
                                         else begin
                                                Write(dxf_file,dxf_3dface_pex( pex[17],z97, pex[18],z97, pex[10],z95,  pex[9],z95,  layer,0));   // near inset side of plug
                                                Write(dxf_file,dxf_3dface_pex( pex[21],z97, pex[22],z97, pex[14],z95, pex[13],z95,  layer,0));   // far inset side of plug
                                              end;


                                        //  bottom chamfers on plug ...

                                      debug_code:=177;

                                      Write(dxf_file,dxf_3dface_pex( pex[16],z97,  pex[17],z97,  pex[24],z96, pex[24],z96, layer,0));  // 1st corner
                                      Write(dxf_file,dxf_3dface_pex( pex[18],z97,  pex[19],z97,  pex[25],z96, pex[25],z96, layer,0));  // 2nd corner
                                      Write(dxf_file,dxf_3dface_pex( pex[20],z97,  pex[21],z97,  pex[26],z96, pex[26],z96, layer,0));  // 3rd corner
                                      Write(dxf_file,dxf_3dface_pex( pex[22],z97,  pex[23],z97,  pex[27],z96, pex[27],z96, layer,0));  // 4th corner

                                      Write(dxf_file,dxf_3dface_pex( pex[17],z97,  pex[18],z97,  pex[25],z96, pex[24],z96, layer,0));  // 1st side
                                      Write(dxf_file,dxf_3dface_pex( pex[19],z97,  pex[20],z97,  pex[26],z96, pex[25],z96, layer,0));  // 2nd side
                                      Write(dxf_file,dxf_3dface_pex( pex[21],z97,  pex[22],z97,  pex[27],z96, pex[26],z96, layer,0));  // 3rd side
                                      Write(dxf_file,dxf_3dface_pex( pex[23],z97,  pex[16],z97,  pex[24],z96, pex[27],z96, layer,0));  // 4th side


                                        // add support pyramids below plug ...

                                      debug_code:=178;

                                      if (dxf_form.pyramids_checkbox.Checked=True) and (z96<>z98)
                                         then begin
                                                layer:=35;

                                                debug_code:=180;

                                                  // clear pin slots for multi-part pyramids ...

                                                pmid1.x:=(pex[28].x+pex[29].x)/2;
                                                pmid1.y:=(pex[28].y+pex[29].y)/2;

                                                pmid2.x:=(pex[30].x+pex[31].x)/2;
                                                pmid2.y:=(pex[30].y+pex[31].y)/2;


                                                pmid3.x:=(pex[28].x+pmid1.x)/2;
                                                pmid3.y:=(pex[28].y+pmid1.y)/2;

                                                pmid4.x:=(pmid2.x+pex[31].x)/2;
                                                pmid4.y:=(pmid2.y+pex[31].y)/2;

                                                pmid5.x:=(pex[29].x+pmid1.x)/2;
                                                pmid5.y:=(pex[29].y+pmid1.y)/2;

                                                pmid6.x:=(pmid2.x+pex[30].x)/2;
                                                pmid6.y:=(pmid2.y+pex[30].y)/2;


                                                pmid7.x:=(pmid3.x+pmid1.x)/2;
                                                pmid7.y:=(pmid3.y+pmid1.y)/2;

                                                pmid8.x:=(pmid4.x+pmid2.x)/2;
                                                pmid8.y:=(pmid4.y+pmid2.y)/2;

                                                pmid9.x:=(pmid5.x+pmid1.x)/2;
                                                pmid9.y:=(pmid5.y+pmid1.y)/2;

                                                 pmid10.x:=(pmid6.x+pmid2.x)/2;
                                                 pmid10.y:=(pmid6.y+pmid2.y)/2;


                                                 if slots_wanted=0   // no slot clearance through single pyramid
                                                    then begin
                                                           Write(dxf_file,insert_crlf_str(do_a_pyramid(pex[24], pex[25], pex[26], pex[27],   pex[28], pex[29], pex[30], pex[31], z96,z98, layer)));
                                                         end;

                                                 if slots_wanted>0   // clear at least first (outer) slot
                                                    then begin
                                                           Write(dxf_file,insert_crlf_str(do_a_pyramid(ss8,  pex[27], pex[24], ss5,    pmid4, pex[31], pex[28], pmid3, z96,z98, layer)));    // outer pyramid
                                                         end;

                                                 if (slots_wanted=2) or (slots_wanted=-1)   // clear at least second (inner) slot
                                                    then begin
                                                           Write(dxf_file,insert_crlf_str(do_a_pyramid(ss13, pex[25], pex[26], ss16,   pmid5, pex[29], pex[30], pmid6, z96,z98, layer)));    // inner pyramid
                                                         end;

                                                 if slots_wanted=1   // clear outer slot only
                                                    then begin
                                                           Write(dxf_file,insert_crlf_str(do_a_pyramid(ss6,  pex[25], pex[26], ss7,    pmid1, pex[29], pex[30], pmid2, z96,z98, layer)));    // remaining pyramid
                                                         end;

                                                 if slots_wanted=-1  // clear inner slot only
                                                    then begin
                                                           Write(dxf_file,insert_crlf_str(do_a_pyramid(ss15, pex[27], pex[24], ss14,   pmid2, pex[31], pex[28], pmid1, z96,z98, layer)));    // remaining pyramid
                                                         end;

                                                 if slots_wanted=2   // clear both slots
                                                    then begin
                                                           Write(dxf_file,insert_crlf_str(do_a_pyramid(ss14, ss15,    ss7,     ss6,   pmid9,  pmid10,  pmid8,   pmid7, z96,z98, layer)));    // middle pyramid
                                                         end;

                                                        //end;
                                              end
                                         else begin                                                        // no pyramids
                                                if dxf_form.nails_rafts_radio.Checked=True
                                                   then RESULT:=z8-timber_thick*inscale-nails_height       // no pyramids - bed of nails below timber
                                                   else RESULT:=z96;                                       // no pyramids - raft below plug, or below chair base if no plug
                                              end;

                                    end;// plug wanted

                              CONTINUE;

                            end;


                    if (code=486) and (i<(array_max-8))      // 241b near-side plug tang    8 total marks
                       then begin

                              np:=0; // init

                              repeat
                                pex[np].X:=intarray_get(list_bgnd_marks[0],i)/100;  // to mm
                                pex[np].Y:=intarray_get(list_bgnd_marks[1],i)/100;

                                INC(np);

                                INC(i);  // next in list

                              until np>7;   // 241b

                              DEC(i);  // undo last INC  228a

                              if (_3d=True) and (dxf_form.plugs_checkbox.Checked=True) and (dxf_form.clip_fit_radio.Checked=True) and (dxf_form.omit_tangs_checkbox.Checked=False)  // 241b clip-fit near-side tang  AUG 2023
                                 then begin

                                        Write(dxf_file,insert_crlf_str(do_a_pyramid(pex[4],pex[5],pex[6],pex[7], pex[0],pex[1],pex[2],pex[3], z8-clip_tang_overcut_depth*inscale, z8-clip_tang_floor_depth*inscale, 22) ));  // layer 22 = chair keys
                                      end;

                              CONTINUE;

                            end;

                  end;//chair base, plug, support


          case soleplate_mark_count of

            // 0  no soleplate
            // 1,2  ignore end marks

            3: begin
                 timber_corner1.x:=move_to.x/100;
                 timber_corner1.y:=move_to.y/100;  // to mm.

                 timber_corner2.x:=line_to.x/100;
                 timber_corner2.y:=line_to.y/100;
               end;

            4: begin                                  // swap corners
                 timber_corner4.x:=move_to.x/100;
                 timber_corner4.y:=move_to.y/100;  // to mm.

                 timber_corner3.x:=line_to.x/100;
                 timber_corner3.y:=line_to.y/100;

                    // add full timber as the soleplate surround (infill corners already done) ...

                 sp_z:=timb_top_z-soleplate_thick*inscale;

                 if (dxf_form.soleplates_combo.ItemIndex<>0) and (colour(26)<>'0|')
                    then begin

                              // top of surround ...

                           Write(dxf_file,dxf_3dface_pex(timber_corner1,sp_z, infill_corner1,sp_z, infill_corner2,sp_z, timber_corner2,sp_z, 26,0));   // near side
                           Write(dxf_file,dxf_3dface_pex(timber_corner2,sp_z, infill_corner2,sp_z, infill_corner3,sp_z, timber_corner3,sp_z, 26,0));   // far end
                           Write(dxf_file,dxf_3dface_pex(timber_corner3,sp_z, infill_corner3,sp_z, infill_corner4,sp_z, timber_corner4,sp_z, 26,0));   // far side
                           Write(dxf_file,dxf_3dface_pex(timber_corner4,sp_z, infill_corner4,sp_z, infill_corner1,sp_z, timber_corner1,sp_z, 26,0));   // near end

                              // bottom of surround ...

                           Write(dxf_file,dxf_3dface_pex(timber_corner1,timb_bot_z, infill_corner1,timb_bot_z, infill_corner2,timb_bot_z, timber_corner2,timb_bot_z, 26,0));   // near side
                           Write(dxf_file,dxf_3dface_pex(timber_corner2,timb_bot_z, infill_corner2,timb_bot_z, infill_corner3,timb_bot_z, timber_corner3,timb_bot_z, 26,0));   // far end
                           Write(dxf_file,dxf_3dface_pex(timber_corner3,timb_bot_z, infill_corner3,timb_bot_z, infill_corner4,timb_bot_z, timber_corner4,timb_bot_z, 26,0));   // far side
                           Write(dxf_file,dxf_3dface_pex(timber_corner4,timb_bot_z, infill_corner4,timb_bot_z, infill_corner1,timb_bot_z, timber_corner1,timb_bot_z, 26,0));   // near end

                              // outer sides of suround ...

                           Write(dxf_file,dxf_3dface_pex(timber_corner1,sp_z, timber_corner2,sp_z, timber_corner2,timb_bot_z, timber_corner1,timb_bot_z, 26,0));   // near side
                           Write(dxf_file,dxf_3dface_pex(timber_corner2,sp_z, timber_corner3,sp_z, timber_corner3,timb_bot_z, timber_corner2,timb_bot_z, 26,0));   // far end
                           Write(dxf_file,dxf_3dface_pex(timber_corner3,sp_z, timber_corner4,sp_z, timber_corner4,timb_bot_z, timber_corner3,timb_bot_z, 26,0));   // far side
                           Write(dxf_file,dxf_3dface_pex(timber_corner4,sp_z, timber_corner1,sp_z, timber_corner1,timb_bot_z, timber_corner4,timb_bot_z, 26,0));   // near end

                              // inner sides of suround ...

                           Write(dxf_file,dxf_3dface_pex(infill_corner1,sp_z, infill_corner2,sp_z, infill_corner2,timb_bot_z, infill_corner1,timb_bot_z, 26,0));   // near side
                           Write(dxf_file,dxf_3dface_pex(infill_corner2,sp_z, infill_corner3,sp_z, infill_corner3,timb_bot_z, infill_corner2,timb_bot_z, 26,0));   // far end
                           Write(dxf_file,dxf_3dface_pex(infill_corner3,sp_z, infill_corner4,sp_z, infill_corner4,timb_bot_z, infill_corner3,timb_bot_z, 26,0));   // far side
                           Write(dxf_file,dxf_3dface_pex(infill_corner4,sp_z, infill_corner1,sp_z, infill_corner1,timb_bot_z, infill_corner4,timb_bot_z, 26,0));   // near end

                         end;

                 soleplate_mark_count:=0;   // only one soleplate!

               end;//4

          end;//case

          if ((code=203) or (code=233) or (code=293) ) and (i<(array_max-2))      // timber infill    or 236b soleplate top
             and (_3d=True) and (colour(17)<>'0|')
             then begin

                      // new timber ...

                    infill_corner1.x:=move_to.x/100;
                    infill_corner1.y:=move_to.y/100;  // to mm.

                    infill_corner2.x:=line_to.x/100;
                    infill_corner2.y:=line_to.y/100;


                    infill_corner3.x:=(intarray_get(list_bgnd_marks[0],i+1))/100;
                    infill_corner3.y:=(intarray_get(list_bgnd_marks[1],i+1))/100;

                    infill_corner4.x:=(intarray_get(list_bgnd_marks[2],i+1))/100;
                    infill_corner4.y:=(intarray_get(list_bgnd_marks[3],i+1))/100;

                    ns_timb_diffx:=infill_corner2.x-infill_corner1.x;    // assume timber rectangular, same diffs for near side and far side..
                    ns_timb_diffy:=infill_corner2.y-infill_corner1.y;

                    try
                      timb_length:=SQRT(SQR(ns_timb_diffx)+SQR(ns_timb_diffy));
                    except
                      timb_length:=8.5*scale;
                    end;//try

                    ne_timb_diffx:=infill_corner4.x-infill_corner1.x;    // assume timber rectangular, same diffs for near end and far end..
                    ne_timb_diffy:=infill_corner4.y-infill_corner1.y;

                    try
                      timb_width:=SQRT(SQR(ne_timb_diffx)+SQR(ne_timb_diffy));       // 234e
                    except
                      timb_width:=10*inscale;
                    end;//try

                    nv:=find_any_sockets_on_timber;   // find number of sockets on this timber and list them in order     232a

                           // do timber sides, and fill top surface and bottom surface around sockets ...

                    if colour(3)<>'0|'     // timber outlines wanted
                       then begin

                              debug_code:=185;

                              Write(dxf_file,dxf_3dface_pex(infill_corner1,timb_top_z, infill_corner2,timb_top_z, infill_corner2,timb_bot_z, infill_corner1,timb_bot_z, 17,0));      // sides of timber...
                              Write(dxf_file,dxf_3dface_pex(infill_corner2,timb_top_z, infill_corner3,timb_top_z, infill_corner3,timb_bot_z, infill_corner2,timb_bot_z, 17,0));
                              Write(dxf_file,dxf_3dface_pex(infill_corner3,timb_top_z, infill_corner4,timb_top_z, infill_corner4,timb_bot_z, infill_corner3,timb_bot_z, 17,0));
                              Write(dxf_file,dxf_3dface_pex(infill_corner4,timb_top_z, infill_corner1,timb_top_z, infill_corner1,timb_bot_z, infill_corner4,timb_bot_z, 17,0));

                              debug_code:=186;

                              if nv<1              // no sockets, fill timber top
                                 then Write(dxf_file,dxf_3dface_pex(infill_corner1,timb_top_z, infill_corner2,timb_top_z, infill_corner3,timb_top_z, infill_corner4,timb_top_z, 17,0));

                              debug_code:=187;

                              if (nv<1) or (dxf_form.blind_sockets_checkbox.Checked=True)   // no sockets, or blind sockets, fill timber bottom
                                 then Write(dxf_file,dxf_3dface_pex(infill_corner1,timb_bot_z, infill_corner2,timb_bot_z, infill_corner3,timb_bot_z, infill_corner4,timb_bot_z, 17,0));

                              debug_code:=188;

                              if nv>0                  // fill timber top between sockets ...
                                 then begin
                                        for nw:=0 to (nv-1) do begin
                                          if timber_sockets[nw].valid=False then BREAK;  // no more sockets on timber

                                          if nw=0        // up to first socket ..
                                             then begin
                                                    debug_code:=189;

                                                    Write(dxf_file,dxf_3dface_pex(timber_sockets[0].ns,timb_top_z,       infill_corner1,timb_top_z, timber_sockets[0].corners[0],timb_top_z, timber_sockets[0].corners[1],timb_top_z, 17,0));      // west quad
                                                    Write(dxf_file,dxf_3dface_pex(      infill_corner1,timb_top_z,       infill_corner4,timb_top_z, timber_sockets[0].corners[3],timb_top_z, timber_sockets[0].corners[0],timb_top_z, 17,0));      // bottom quad
                                                    Write(dxf_file,dxf_3dface_pex(      infill_corner4,timb_top_z, timber_sockets[0].fs,timb_top_z, timber_sockets[0].corners[2],timb_top_z, timber_sockets[0].corners[3],timb_top_z, 17,0));      // east quad
                                                  end
                                             else begin  // all remaining sockets ...

                                                    debug_code:=190;

                                                    Write(dxf_file,dxf_3dface_pex(        timber_sockets[nw].ns,timb_top_z,   timber_sockets[nw].corners[0],timb_top_z,   timber_sockets[nw].corners[1],timb_top_z,   timber_sockets[nw].corners[1],timb_top_z, 17,0));    // west triangle

                                                    Write(dxf_file,dxf_3dface_pex(        timber_sockets[nw].ns,timb_top_z,         timber_sockets[nw-1].ns,timb_top_z, timber_sockets[nw-1].corners[1],timb_top_z,   timber_sockets[nw].corners[0],timb_top_z, 17,0));    // south-west quad

                                                    Write(dxf_file,dxf_3dface_pex(timber_sockets[nw].corners[0],timb_top_z, timber_sockets[nw-1].corners[1],timb_top_z, timber_sockets[nw-1].corners[2],timb_top_z,   timber_sockets[nw].corners[3],timb_top_z, 17,0));    // south quad

                                                    Write(dxf_file,dxf_3dface_pex(      timber_sockets[nw-1].fs,timb_top_z,           timber_sockets[nw].fs,timb_top_z,   timber_sockets[nw].corners[3],timb_top_z, timber_sockets[nw-1].corners[2],timb_top_z, 17,0));    // south-east quad

                                                    Write(dxf_file,dxf_3dface_pex(        timber_sockets[nw].fs,timb_top_z,   timber_sockets[nw].corners[2],timb_top_z,   timber_sockets[nw].corners[3],timb_top_z,   timber_sockets[nw].corners[3],timb_top_z, 17,0));    // east triangle
                                                  end;

                                          debug_code:=191;

                                          if nw=(nv-1)   // finish beyond last socket ..
                                             then begin
                                                    Write(dxf_file,dxf_3dface_pex(timber_sockets[nw].ns,timb_top_z, timber_sockets[nw].corners[1],timb_top_z,                infill_corner2,timb_top_z,        infill_corner2,timb_top_z, 17,0));     // west triangle
                                                    Write(dxf_file,dxf_3dface_pex(       infill_corner2,timb_top_z, timber_sockets[nw].corners[1],timb_top_z, timber_sockets[nw].corners[2],timb_top_z,        infill_corner3,timb_top_z, 17,0));     // top quad
                                                    Write(dxf_file,dxf_3dface_pex(       infill_corner3,timb_top_z, timber_sockets[nw].corners[2],timb_top_z,         timber_sockets[nw].fs,timb_top_z, timber_sockets[nw].fs,timb_top_z, 17,0));     // east triangle
                                                  end;
                                        end;

                                      end;

                              if (nv>0) and (dxf_form.blind_sockets_checkbox.Checked=False)    // fill timber bottom between sockets ...
                                 then begin
                                        for nw:=0 to (nv-1) do begin
                                          if timber_sockets[nw].valid=False then BREAK;  // no more sockets on timber

                                          debug_code:=192;

                                          if nw=0        // up to first socket ..
                                             then begin
                                                    Write(dxf_file,dxf_3dface_pex(timber_sockets[0].ns,timb_bot_z,       infill_corner1,timb_bot_z, timber_sockets[0].corners[0],timb_bot_z, timber_sockets[0].corners[1],timb_bot_z, 17,0));      // west quad
                                                    Write(dxf_file,dxf_3dface_pex(      infill_corner1,timb_bot_z,       infill_corner4,timb_bot_z, timber_sockets[0].corners[3],timb_bot_z, timber_sockets[0].corners[0],timb_bot_z, 17,0));      // bottom quad
                                                    Write(dxf_file,dxf_3dface_pex(      infill_corner4,timb_bot_z, timber_sockets[0].fs,timb_bot_z, timber_sockets[0].corners[2],timb_bot_z, timber_sockets[0].corners[3],timb_bot_z, 17,0));      // east quad
                                                  end
                                             else begin  // all remaining sockets ...

                                                    debug_code:=193;

                                                    Write(dxf_file,dxf_3dface_pex(        timber_sockets[nw].ns,timb_bot_z,   timber_sockets[nw].corners[0],timb_bot_z,   timber_sockets[nw].corners[1],timb_bot_z,   timber_sockets[nw].corners[1],timb_bot_z, 17,0));    // west triangle

                                                    Write(dxf_file,dxf_3dface_pex(        timber_sockets[nw].ns,timb_bot_z,         timber_sockets[nw-1].ns,timb_bot_z, timber_sockets[nw-1].corners[1],timb_bot_z,   timber_sockets[nw].corners[0],timb_bot_z, 17,0));    // south-west quad

                                                    Write(dxf_file,dxf_3dface_pex(timber_sockets[nw].corners[0],timb_bot_z, timber_sockets[nw-1].corners[1],timb_bot_z, timber_sockets[nw-1].corners[2],timb_bot_z,   timber_sockets[nw].corners[3],timb_bot_z, 17,0));    // south quad

                                                    Write(dxf_file,dxf_3dface_pex(      timber_sockets[nw-1].fs,timb_bot_z,           timber_sockets[nw].fs,timb_bot_z,   timber_sockets[nw].corners[3],timb_bot_z, timber_sockets[nw-1].corners[2],timb_bot_z, 17,0));    // south-east quad

                                                    Write(dxf_file,dxf_3dface_pex(        timber_sockets[nw].fs,timb_bot_z,   timber_sockets[nw].corners[2],timb_bot_z,   timber_sockets[nw].corners[3],timb_bot_z,   timber_sockets[nw].corners[3],timb_bot_z, 17,0));    // east triangle
                                                  end;

                                          debug_code:=194;

                                          if nw=(nv-1)   // finish beyond last socket ..
                                             then begin
                                                    Write(dxf_file,dxf_3dface_pex(timber_sockets[nw].ns,timb_bot_z, timber_sockets[nw].corners[1],timb_bot_z,                infill_corner2,timb_bot_z,        infill_corner2,timb_bot_z, 17,0));     // west triangle
                                                    Write(dxf_file,dxf_3dface_pex(       infill_corner2,timb_bot_z, timber_sockets[nw].corners[1],timb_bot_z, timber_sockets[nw].corners[2],timb_bot_z,        infill_corner3,timb_bot_z, 17,0));     // top quad
                                                    Write(dxf_file,dxf_3dface_pex(       infill_corner3,timb_bot_z, timber_sockets[nw].corners[2],timb_bot_z,         timber_sockets[nw].fs,timb_bot_z, timber_sockets[nw].fs,timb_bot_z, 17,0));     // east triangle
                                                  end;
                                        end;
                                      end;

                            end;

                    CONTINUE;
                  end;

          if (code=487) and (i<(array_max-2))        // 241c   switch-drive slider ribs
             and (_3d=True) and (colour(17)<>'0|')
             then begin

                      // new rib ...

                    infill_corner1.x:=move_to.x/100;
                    infill_corner1.y:=move_to.y/100;  // to mm.

                    infill_corner2.x:=line_to.x/100;
                    infill_corner2.y:=line_to.y/100;


                    infill_corner3.x:=(intarray_get(list_bgnd_marks[0],i+1))/100;
                    infill_corner3.y:=(intarray_get(list_bgnd_marks[1],i+1))/100;

                    infill_corner4.x:=(intarray_get(list_bgnd_marks[2],i+1))/100;
                    infill_corner4.y:=(intarray_get(list_bgnd_marks[3],i+1))/100;

                      // upper parallel part ...

                    Write(dxf_file,insert_crlf_str(do_a_pyramid(infill_corner1,infill_corner2,infill_corner3,infill_corner4, infill_corner1,infill_corner2,infill_corner3,infill_corner4,
                                                                timb_top_z-switch_slider_rib_top_depth*inscale, timb_top_z-switch_slider_rib_mid_depth*inscale, 17) ));

                      // lower angled part ...

                    Write(dxf_file,insert_crlf_str(do_a_pyramid(infill_corner1,infill_corner2,infill_corner3,infill_corner4, infill_corner4,infill_corner1,infill_corner1,infill_corner4,
                                                                timb_top_z-switch_slider_rib_mid_depth*inscale, timb_top_z-switch_slider_rib_bottom_depth*inscale, 17) ));

                    CONTINUE;
                  end;


          if (code>0) and (code<>99) // 99=text

             then dxf_mark                // put it in the file
             else begin
                    if ((code=-2) or (code=-3)) and (_3d=False)    // curving rad centres...
                       then begin
                              cen_point:=move_to;            // temp save rad centre point.
                              radcen_dim:=Round(screenx/2);  // i.e. *100/200  to 1/100th mm  (200 arbitrary).

                              move_to.x:=cen_point.x-radcen_dim;
                              move_to.y:=cen_point.y;
                              line_to.x:=cen_point.x+radcen_dim;
                              line_to.y:=cen_point.y;

                              dxf_mark;  // horizontal part.

                              move_to.x:=cen_point.x;
                              move_to.y:=cen_point.y-radcen_dim;
                              line_to.x:=cen_point.x;
                              line_to.y:=cen_point.y+radcen_dim;

                              dxf_mark;  // vertical part.
                            end;

                    if (code=-5) and (_3d=False)     // keep name labels
                       then begin
                              text_str:=Trim(Copy(Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.reference_string,1,99));   // not the keep number.

                              text_height:=pad_form.bgnd_keeps_font_label.Font.Size*25.4/72;   // font height in mm.
                              text_height:=text_height*Screen.PixelsPerInch/96;                // to match screen appearance.

                              mod_name_x:=Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.mod_text_x;
                              mod_name_y:=Ttemplate(keeps_list.Objects[n]).template_info.keep_dims.box_dims1.mod_text_y;

                              move_to.x:=move_to.x+Round(mod_name_x*100);  // (Templot top-left of text.)
                              move_to.y:=move_to.y+Round(mod_name_y*100);

                              dxf_text;
                            end;

                    if (code=99) and (_3d=False)    // timber numbering
                       then begin
                              move_to.x:=move_to.x-200;      // 2mm arbitrary, because width of CAD font not known.

                              text_height:=print_timber_numbers_font.Size*25.4/72;   // font height in mm.

                              text_str:=extract_tbnumber_str(tbnum_str); // get next timber numbering string from the acummulated string.
                              if text_str='' then CONTINUE;              // no string available??

                              text_str:=IntToStr(n+1)+'.'+text_str;      // add template number prefix.

                              dxf_text;
                            end;

                  end;

        until 0<>0;  //227a change loop control

          // and then rails ...

        layer:=2;           // layer CENTLINE    track centre-lines.

        if (colour(layer)<>'0|') and (fb_kludge_this=0)                          // 227a no track centre-lines for kludge template
        and (_3d=False)
           then for aq:=24 to 25 do dxf_bgnd_rail(False);                        // track centre-lines (no 3-D option).

        layer:=1;           // layer ADJTRACK    adjacent track rails.

        if (colour(layer)<>'0|') and ((dxf_form.rail_head_checkbox.Checked=True) or (fb_kludge_this<>0))    // 227a
           then for aq:=16 to 23 do dxf_bgnd_rail(_3d);   // all the adjacent rails.

        layer:=0;           // layer RAILS       turnout rails.

        if (colour(layer)<>'0|') and ((dxf_form.rail_head_checkbox.Checked=True) or (fb_kludge_this<>0))    // 227a
           then begin

                  for aq:=0  to 15 do dxf_bgnd_rail(_3d);   // all the turnout rails.
                  for aq:=26 to 29 do dxf_bgnd_rail(_3d);   // K-crossing check rails.

                      // finally, draw in the rail ends ...

                  dxf_mark_end(1,1,9,1);    // main rail wing rail finish.
                  dxf_mark_end(2,1,10,1);   // turnout rail wing rail finish.

                  dxf_mark_end(6,0,14,0);   // main side check rail start.
                  dxf_mark_end(6,1,14,1);   // main side check rail finish.

                  dxf_mark_end(7,0,15,0);   // turnout side check rail start.
                  dxf_mark_end(7,1,15,1);   // turnout side check rail finish.

                  dxf_mark_end(4,0,5,0);    // blunt nose.

                  if fixed_diamond_ends=True
                  then begin
                         dxf_mark_end(1,0,9,0);   // planed faced of point rails for a fixed-diamond.
                         dxf_mark_end(2,0,10,0);

                         dxf_mark_end(26,1,27,1);     // MS K-crossing check rails.
                         dxf_mark_end(28,1,29,1);     // DS K-crossing check rails.
                       end;

                end;//if RAILS

      end;//with now_keep

                      // do the chair jaws ...  237c

      if (_3d=True) and (Length(now_ti.keep_jaws)>0)
         then begin

                for njs:=0 to Length(now_ti.keep_jaws)-1 do begin

                  with now_ti.keep_jaws[njs] do begin       // a Tjaw

                    if chcode=0 then CONTINUE;    // invalid entry

                    k_dxf:=0;  // degrees for DXF   keep compiler happy
                    xk:=x2-x1;
                    yk:=y2-y1;

                    if ABS(xk)<minfp    // no div 0
                       then begin
                              if y2>y1 then k_dxf:=90;   // DXF angles in degrees
                              if y2<y1 then k_dxf:=0-90;
                            end
                       else begin
                              k_dxf:=ARCTAN(ABS(yk)/ABS(xk))*180/Pi;

                              if (xk<0) and (yk>=0) then k_dxf:=180-k_dxf;
                              if (xk<0) and (yk<0)  then k_dxf:=k_dxf-180;

                              if (xk>0) and (yk<0)  then k_dxf:=0-k_dxf;
                            end;

                    if right_hand=true then k_dxf:=k_dxf+180;  // RH template

                    if (rail=3) or (rail=4)
                       then k_dxf:=k_dxf+180;  // to opposite side of rail

                    while k_dxf>360 do k_dxf:=k_dxf-360;

                    dxf_x:=(x1+x2)/2;
                    dxf_y:=(y1+y2)/2;

                    dxf_k:=k_dxf*Pi/180;  // radians for STL

                    if inner=True
                       then dxf_lay:=20    // 20 = inner jaw layer
                       else dxf_lay:=21;   // 21 = outer jaw layer

                    modj_str:=StringReplace(j_str,'...',IntToStr(n),[rfReplaceAll]);    // modified jaw, e.g. 'MN'+IntToStr(template_index)+tb_str

                    if j_str<>''
                       then begin
                              if (inner=False) and (loose_outer=True) then inserting_loose_dxf:=True;    // 244e   for loose outer jaws

                              s:='  0|INSERT|  2|'+modj_str+'|  8|'+layer_str[dxf_lay]
                                +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,dxf_x)
                                +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,dxf_y)
                                +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z_mod)

                                +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                +' 50|'+make_angle(k_dxf);   // DXF wants degrees

                              Write(dxf_file,insert_crlf_str(s));

                              if stl=True then insert_stl_block(modj_str,dxf_x,dxf_y,z_mod,dxf_k);   // radians


                              if (j_str='PJAW') or (j_str='PJAWL')   // P slide chair, add stock rail bolt
                                 then begin
                                        pbolt_str:='PBOLT'+IntToStr(Random(5)+1);    // 5 nut rotations selected at random

                                        s:='  0|INSERT|  2|'+pbolt_str+'|  8|'+layer_str[dxf_lay]
                                          +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,dxf_x)
                                          +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,dxf_y)
                                          +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z_mod)

                                          +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                          +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                          +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                          +' 50|'+make_angle(k_dxf);   // DXF wants degrees

                                        Write(dxf_file,insert_crlf_str(s));

                                        if stl=True then insert_stl_block(pbolt_str,dxf_x,dxf_y,z_mod,dxf_k);   // radians

                                      end;
                              inserting_loose_dxf:=False;    // 244e  reset
                            end;


                  end;//with jaw
                end;//next jaw
              end;//if jaws

              //=========

                   // now do the chair seats ...  237c

      if (_3d=True) and (Length(now_ti.keep_seats)>0)
         then begin
                for njs:=0 to Length(now_ti.keep_seats)-1 do begin

                  with now_ti.keep_seats[njs] do begin       // a Tseat

                    if chcode=0 then CONTINUE;    // invalid entry

                    k_dxf:=0;  // degrees for DXF   keep compiler happy
                    xk:=x2-x1;
                    yk:=y2-y1;

                    if ABS(xk)<minfp    // no div 0
                       then begin
                              if y2>y1 then k_dxf:=90;   // DXF angles in degrees
                              if y2<y1 then k_dxf:=0-90;
                            end
                       else begin
                              k_dxf:=ARCTAN(ABS(yk)/ABS(xk))*180/Pi;

                              if (xk<0) and (yk>=0) then k_dxf:=180-k_dxf;
                              if (xk<0) and (yk<0)  then k_dxf:=k_dxf-180;

                              if (xk>0) and (yk<0)  then k_dxf:=0-k_dxf;
                            end;

                    if right_hand=true then k_dxf:=k_dxf+180;  // RH template

                    if (rail=3) or (rail=4)
                       then k_dxf:=k_dxf+180;  // to opposite side of rail

                    while k_dxf>360 do k_dxf:=k_dxf-360;

                    dxf_x:=(x1+x2)/2;
                    dxf_y:=(y1+y2)/2;

                    dxf_k:=k_dxf*Pi/180;  // radians for STL

                    dxf_lay:=18;   // 18 = seat layer

                    if s_str<>''
                       then begin
                              s:='  0|INSERT|  2|'+s_str+'|  8|'+layer_str[dxf_lay]
                                +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,dxf_x)
                                +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,dxf_y)
                                +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,0)

                                +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                +' 50|'+make_angle(k_dxf);   // DXF wants degrees

                              Write(dxf_file,insert_crlf_str(s));

                              if stl=True then insert_stl_block(s_str,dxf_x,dxf_y,0,dxf_k);   // radians
                            end;

                  end;//with seat
                end;//next seat
              end;//if seats

              //=========

                   // now do the chair keys ...  237c

      if (_3d=True) and (Length(now_ti.keep_keys)>0)
         then begin
                for njs:=0 to Length(now_ti.keep_keys)-1 do begin

                  with now_ti.keep_keys[njs] do begin       // a Tkey

                    if chcode=0 then CONTINUE;    // invalid entry

                    k_dxf:=0;  // degrees for DXF   keep compiler happy
                    xk:=x2-x1;
                    yk:=y2-y1;

                    if ABS(xk)<minfp    // no div 0
                       then begin
                              if y2>y1 then k_dxf:=90;   // DXF angles in degrees
                              if y2<y1 then k_dxf:=0-90;
                            end
                       else begin
                              k_dxf:=ARCTAN(ABS(yk)/ABS(xk))*180/Pi;

                              if (xk<0) and (yk>=0) then k_dxf:=180-k_dxf;
                              if (xk<0) and (yk<0)  then k_dxf:=k_dxf-180;

                              if (xk>0) and (yk<0)  then k_dxf:=0-k_dxf;
                            end;

                    if right_hand=true then k_dxf:=k_dxf+180;  // RH template

                    if (rail=3) or (rail=4)
                       then k_dxf:=k_dxf+180;  // to opposite side of rail

                    while k_dxf>360 do k_dxf:=k_dxf-360;

                    dxf_x:=(x1+x2)/2;
                    dxf_y:=(y1+y2)/2;

                    dxf_k:=k_dxf*Pi/180;  // radians for STL

                    dxf_lay:=22;  // 2 = keys  layer

                    if k_str<>''
                       then begin
                              if loose_outer=True then inserting_loose_dxf:=True;    // 244e            // for loose outer jaws

                              s:='  0|INSERT|  2|'+k_str+'|  8|'+layer_str[dxf_lay]
                                +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,dxf_x)
                                +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,dxf_y)
                                +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,z_mod_key)

                                +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                +' 50|'+make_angle(k_dxf);   // DXF wants degrees

                              Write(dxf_file,insert_crlf_str(s));

                              if stl=True then insert_stl_block(k_str,dxf_x,dxf_y,z_mod_key,dxf_k);   // radians

                              inserting_loose_dxf:=False;    // 244e  reset
                            end;

                  end;//with seat
                end;//next seat
              end;//if seats

              //=========

    end;//next n template

    if socket_list.Count>0 then for n:=0 to socket_list.Count-1 do Tsocket_object(socket_list.Objects[n]).Free;     // 232a
    socket_list.Free;

  finally
    chairing_in_dxf:=False;
  end;//try
end;
//______________________________________________________________________________

procedure dxf_shapes(shapes_z1:extended; var dxf_file:TextFile);   // do any background shapes.   // 234e z depth added

var
  i,maxbg:integer;
  now_shape:Tbgnd_shape;
  x1,y1,x2,y2:extended;
  p,q,rad:extended;
  layer:integer;
  font_height:extended;
  s:string;
  arm,diamond:extended;

  z,z1,z2,brick_bot_z,slabs_top_z,splints_top_z,walls_top_z,clips_top_z,clips_foot_z:extended;

  shapes_z2,shapes_z3:extended;

  xlo,ylo,xhi,yhi,spk,spw:extended;

  p1,p2,p3,p4,p1a,p2a,p3a,p4a,p1b,p2b,p3b,p4b:Tpex;

  pf1,pf2,pf3,pf4:Tpex;

  clip_length,rot_k:extended;

  sc:integer;

  nail:Tpex;                // 237a
  nailxco,nailyco:integer;
  nn,nm:integer;

  plug_total_depth:extended;

                ////////////////////////////////////////////////////////////////

                procedure rotate_4p(rot,x1,y1:extended; var p1,p2,p3,p4:Tpex);     // rotate 4 points

                begin
                  dotransform(rot,x1,y1,p1,p1);
                  dotransform(rot,x1,y1,p2,p2);
                  dotransform(rot,x1,y1,p3,p3);
                  dotransform(rot,x1,y1,p4,p4);
                end;
                ////////////////////////////////////////////////////////////////

                procedure write_3d_solid_rectangle(p1,p2,p3,p4:Tpex; z1,z2:extended; layer:integer);

                begin
                  if ABS(z2-z1)>minfp   // no zero thickness
                     then begin
                            Write(dxf_file,dxf_3dface_pex(p1,z1, p2,z1, p3,z1, p4,z1, layer,0));     // top surface
                            Write(dxf_file,dxf_3dface_pex(p1,z2, p2,z2, p3,z2, p4,z2, layer,0));     // bottom surface

                            Write(dxf_file,dxf_3dface_pex(p1,z2, p2,z2, p2,z1, p1,z1, layer,0));     // near edge
                            Write(dxf_file,dxf_3dface_pex(p2,z2, p3,z2, p3,z1, p2,z1, layer,0));     // far end
                            Write(dxf_file,dxf_3dface_pex(p3,z2, p4,z2, p4,z1, p3,z1, layer,0));     // far edge
                            Write(dxf_file,dxf_3dface_pex(p4,z2, p1,z2, p1,z1, p4,z1, layer,0));     // near end
                          end;
                end;
                ////////////////////////////////////////////////////////////////

                procedure seven_seg(on_raft:boolean; text_scaling:extended; str:string);    // draw numbers 7-seg style on brick label     234a

                  // segments numbered:           datum bottom left   vertical segments 1"x3.5"   horz segments 2"x1"

                  //       7
                  //     2   3
                  //       6
                  //     1   4
                  //       5

                  //       8    decimal point
                  //       9    space

                  //      10  diagonals..
                  //      11
                  //          14  mid right
                  //      12
                  //      13


                var
                  n:integer;
                  num_char:Char;
                  orgx,orgy:extended;
                  z1,z2:extended;
                  p1,p2,p3,p4:Tpex;

                  blscale:extended;

                  on_layer:integer;


                                  //============================================

                                  procedure seg(segment:integer);    // 234a  layer=28 (as splints)

                                  begin
                                    case segment of

                                      1: begin
                                           p1.x:=orgx;           p1.y:=orgy;
                                           p2.x:=orgx+blscale;   p2.y:=p1.y;
                                           p3.x:=p2.x;           p3.y:=orgy+3.5*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      2: begin
                                           p1.x:=orgx;           p1.y:=orgy+3.5*blscale;
                                           p2.x:=orgx+blscale;   p2.y:=p1.y;
                                           p3.x:=p2.x;           p3.y:=orgy+7*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      3: begin
                                           p1.x:=orgx+3*blscale; p1.y:=orgy+3.5*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=p1.y;
                                           p3.x:=p2.x;           p3.y:=orgy+7*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      4: begin
                                           p1.x:=orgx+3*blscale; p1.y:=orgy;
                                           p2.x:=orgx+4*blscale; p2.y:=p1.y;
                                           p3.x:=p2.x;           p3.y:=orgy+3.5*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      5: begin
                                           p1.x:=orgx;           p1.y:=orgy;
                                           p2.x:=orgx+4*blscale; p2.y:=p1.y;

                                           p3.x:=p2.x;           p3.y:=orgy+blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      6: begin
                                           p1.x:=orgx;           p1.y:=orgy+3*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=p1.y;

                                           p3.x:=p2.x;           p3.y:=orgy+4*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      7: begin
                                           p1.x:=orgx;           p1.y:=orgy+6*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=p1.y;

                                           p3.x:=p2.x;           p3.y:=orgy+7*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      8: begin                                  // decimal point
                                           p1.x:=orgx+blscale/2;   p1.y:=orgy;
                                           p2.x:=orgx+3.5*blscale; p2.y:=p1.y;

                                           p3.x:=p2.x;           p3.y:=orgy+3*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;

                                      9: EXIT;  // space

                                     10: begin
                                           p1.x:=orgx+blscale;   p1.y:=orgy+6*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=orgy+4.5*blscale;

                                           p3.x:=p2.x;           p3.y:=orgy+5.5*blscale;
                                           p4.x:=p1.x;           p4.y:=orgy+7*blscale;
                                         end;

                                     11: begin
                                           p1.x:=orgx+blscale;   p1.y:=orgy+3.5*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=orgy+4.5*blscale;

                                           p3.x:=p2.x;           p3.y:=orgy+5.5*blscale;
                                           p4.x:=p1.x;           p4.y:=orgy+4.5*blscale;
                                         end;


                                     12: begin
                                           p1.x:=orgx+blscale;   p1.y:=orgy+2.5*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=orgy+1.5*blscale;

                                           p3.x:=p2.x;           p3.y:=orgy+2.5*blscale;
                                           p4.x:=p1.x;           p4.y:=orgy+3.5*blscale;
                                         end;


                                     13: begin
                                           p1.x:=orgx+blscale;   p1.y:=orgy;
                                           p2.x:=orgx+4*blscale; p2.y:=orgy+1.5*blscale;

                                           p3.x:=p2.x;           p3.y:=orgy+2.5*blscale;
                                           p4.x:=p1.x;           p4.y:=orgy+blscale;
                                         end;


                                     14: begin
                                           p1.x:=orgx+3*blscale; p1.y:=orgy+1.5*blscale;
                                           p2.x:=orgx+4*blscale; p2.y:=p1.y;
                                           p3.x:=p2.x;           p3.y:=orgy+5.5*blscale;
                                           p4.x:=p1.x;           p4.y:=p3.y;
                                         end;


                                    end;//case

                                    rotate_4p(spk,x1,y1,p1,p2,p3,p4);

                                    write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,on_layer);
                                  end;
                                  //============================================

                begin
                  if on_raft=True   // label text on chairing raft
                     then begin
                            on_layer:=10;   // bgnd shapes
                            z1:=shapes_z1;
                            z2:=z1+raft_label_char_thickness;
                          end
                     else begin
                            on_layer:=28;      // splints
                            z1:=splints_top_z;
                            z2:=z1+label_char_thickness*inscale;
                          end;

                  blscale:=label_tab_width*inscale*text_scaling/10;   // 234e  10 arbitrary was 9     brick label scaling, based on 6" high on 9" tab, characters at 6.5" centres

                  orgy:=y1-3.5*blscale;    // character datum 3.5" from centre

                  for n:=1 to Length(str) do begin
                    num_char:=str[n];

                    orgx:=x1+blscale/2+(n-1)*6.5*blscale;  // character spacing    1/2" offset at left for initial dash (#)

                    case num_char of

                       '_': begin                                 seg(5);                 end;      // underscore

                   '-','#': begin                                         seg(6);         end;

                       '=': begin                                 seg(5); seg(6);         end;

                   'O','0': begin seg(1); seg(2); seg(3); seg(4); seg(5);         seg(7); end;
                   'I','1': begin                 seg(3); seg(4);                         end;
                       '2': begin seg(1);         seg(3);         seg(5); seg(6); seg(7); end;
                       '3': begin                 seg(3); seg(4); seg(5); seg(6); seg(7); end;
                       '4': begin         seg(2); seg(3); seg(4);         seg(6);         end;
                       '5': begin         seg(2);         seg(4); seg(5); seg(6); seg(7); end;
                       '6': begin seg(1); seg(2);         seg(4); seg(5); seg(6); seg(7); end;
                       '7': begin                 seg(3); seg(4);                 seg(7); end;
                       '8': begin seg(1); seg(2); seg(3); seg(4); seg(5); seg(6); seg(7); end;
                       '9': begin         seg(2); seg(3); seg(4); seg(5); seg(6); seg(7); end;

                       'A': begin seg(1); seg(2); seg(3); seg(4);         seg(6); seg(7); end;
                       'B': begin seg(1); seg(2);                                                         seg(10); seg(11); seg(12); seg(13);          end;
                       'C': begin seg(1); seg(2);                 seg(5);         seg(7); end;
                       'D': begin seg(1); seg(2);                                                         seg(10);                   seg(13); seg(14); end;
                       'E': begin seg(1); seg(2);                 seg(5); seg(6); seg(7); end;
                       'F': begin seg(1); seg(2);                         seg(6); seg(7); end;
                       'G': begin seg(1); seg(2);         seg(4); seg(5);         seg(7); end;
                       'H': begin seg(1); seg(2); seg(3); seg(4);         seg(6);         end;
                       'J': begin                 seg(3); seg(4); seg(5);                 end;
                       'K': begin seg(1); seg(2);                                                                  seg(11); seg(12);                   end;
                       'L': begin seg(1); seg(2);                 seg(5);                 end;
                       'P': begin seg(1); seg(2); seg(3);                 seg(6); seg(7); end;
                       'R': begin seg(1); seg(2);                                                         seg(10); seg(11); seg(12);                   end;
                       'U': begin seg(1); seg(2); seg(3); seg(4); seg(5);                 end;

                       'b': begin seg(1); seg(2);                                                                           seg(12); seg(13);          end;
                       'c': begin seg(1);                         seg(5); seg(6);         end;
                       'd': begin seg(1);         seg(3); seg(4); seg(5); seg(6);         end;
                       'h': begin seg(1); seg(2);         seg(4);         seg(6);         end;
                       'i': begin                         seg(4);                         end;
                       'n': begin seg(1);                 seg(4);         seg(6);         end;
                       'o': begin seg(1);                 seg(4); seg(5); seg(6);         end;
                       'r': begin seg(1);                                 seg(6);         end;
                       't': begin seg(1); seg(2);                 seg(5); seg(6);         end;
                       'u': begin seg(1);                 seg(4); seg(5);                 end;

                       '|': begin seg(1); seg(2);                                         end;      // pipe on left

                   ',','.': begin                                                         seg(8); end;            // decimal point    comma same

                       ':': begin                                                                                                             seg(14); end;

                       ' ': begin                                                                 seg(9); end;   // space

                       else begin                                 seg(5); seg(6); seg(7); end;    // hamburger

                    end;//case



                  end;//next
                end;

                ////////////////////////////////////////////////////////////////

                procedure do_clip(brim_fence:boolean; offset,z1,z2:extended);

                begin

                  if (now_shape.show_transparent=False) or (dxf_form.exp_checkbox.Checked=True)    // do tommy bar part ...
                     then begin
                            p1.x:=x1-clip_length;
                            p1.y:=y1-clip_shaft_width*inscale/2+offset;

                            p2.x:=p1.x;
                            p2.y:=y1+clip_shaft_width*inscale/2-offset;

                            p3.x:=x1-clip_hole_mm/2;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip shaft


                            p1.x:=x1-clip_hole_mm/2;
                            p1.y:=y1+clip_shaft_width*inscale/2-offset;

                            p2.x:=p1.x;
                            p2.y:=y1+clip_hole_mm/2;

                            p3.x:=x1+clip_hole_mm/2;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip hole north


                            p1.x:=x1-clip_hole_mm/2;
                            p1.y:=y1-clip_shaft_width*inscale/2+offset;

                            p2.x:=p1.x;
                            p2.y:=y1-clip_hole_mm/2;

                            p3.x:=x1+clip_hole_mm/2;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip hole south


                            p1.x:=x1+offset;
                            p1.y:=y1+clip_shaft_width*inscale/2-offset;

                            p2.x:=p1.x;

                            if offset=0
                               then p2.y:=y1+(clip_top_width/2)*inscale-clip_top_corner_mm
                               else p2.y:=y1+(clip_top_width/2)*inscale-offset;                // doing foot

                            p3.x:=x1+clip_top_length*inscale-offset;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;


                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin

                                      p1a.x:=x1-clip_length;   // for brim fence clear
                                      p1a.y:=p2.y+13*inscale;  // to clear attaching claw after trimming

                                      p2a.x:=p1a.x;
                                      p2a.y:=p1a.y+3*inscale;  // brim fence 3" wide   232c

                                      p3a.x:=p3.x+3.5*inscale;
                                      p3a.y:=p2a.y;

                                      p4a.x:=p3a.x;
                                      p4a.y:=p1a.y;

                                        // for the outer fence...

                                      p2b:=p3a;

                                      p3b.x:=p2b.x+3*inscale;
                                      p3b.y:=p2b.y;

                                    end;
                             //-----

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip tommy north

                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin
                                      p1:=p1a;
                                      p2:=p2a;
                                      p3:=p3a;
                                      p4:=p4a;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // brim fence north
                                    end;

                            if offset=0    // ignore chamered ends if doing foot
                               then begin
                                      p1.x:=x1;
                                      p1.y:=y1+(clip_top_width/2)*inscale-clip_top_corner_mm;

                                      p2.x:=x1+clip_top_corner_mm;
                                      p2.y:=y1+(clip_top_width/2)*inscale;

                                      p3.x:=x1+clip_top_length*inscale-clip_top_corner_mm;
                                      p3.y:=p2.y;

                                      p4.x:=x1+clip_top_length*inscale;
                                      p4.y:=p1.y;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip top north chamfer
                                    end;

                            p1.x:=x1+offset;
                            p1.y:=y1-clip_shaft_width*inscale/2+offset;

                            p2.x:=p1.x;

                            if offset=0
                               then p2.y:=y1-(clip_top_width/2)*inscale+clip_top_corner_mm
                               else p2.y:=y1-(clip_top_width/2)*inscale+offset;              // doing foot

                            p3.x:=x1+clip_top_length*inscale-offset;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin

                                      p1a.x:=x1-clip_length;   // for brim fence clear
                                      p1a.y:=p2.y-13*inscale;  // to clear attaching claw after trimming

                                      p2a.x:=p1a.x;
                                      p2a.y:=p1a.y-3*inscale;  // brim fence 3" wide   232c

                                      p3a.x:=p3.x+3.5*inscale;
                                      p3a.y:=p2a.y;

                                      p4a.x:=p3a.x;
                                      p4a.y:=p1a.y;

                                        // for the outer fence...

                                      p1b:=p3a;

                                      p4b.x:=p1b.x+3*inscale;
                                      p4b.y:=p1b.y;

                                    end;
                             //-----

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip tommy south


                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin
                                      p1:=p1a;
                                      p2:=p2a;
                                      p3:=p3a;
                                      p4:=p4a;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // brim fence south


                                      p1:=p1b;
                                      p2:=p2b;
                                      p3:=p3b;
                                      p4:=p4b;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // brim fence outer

                                    end;

                            if offset=0    // ignore chamered ends if doing foot
                               then begin
                                      p1.x:=x1;
                                      p1.y:=y1-(clip_top_width/2)*inscale+clip_top_corner_mm;

                                      p2.x:=x1+clip_top_corner_mm;
                                      p2.y:=y1-(clip_top_width/2)*inscale;

                                      p3.x:=x1+clip_top_length*inscale-clip_top_corner_mm;
                                      p3.y:=p2.y;

                                      p4.x:=x1+clip_top_length*inscale;
                                      p4.y:=p1.y;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip top south chamfer
                                    end;

                            p1.x:=x1+clip_hole_mm/2;
                            p1.y:=y1-clip_shaft_width*inscale/2+offset;

                            p2.x:=p1.x;
                            p2.y:=y1+clip_shaft_width*inscale/2-offset;

                            p3.x:=x1+clip_top_length*inscale-offset;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip top middle

                          end;

                  if (now_shape.show_transparent=True) or (dxf_form.exp_checkbox.Checked=True)    // do claws part ...
                     then begin

                            p1.x:=x1-clip_sides_clear*inscale-offset;
                            p1.y:=y1+(clip_top_width/2+clip_ends_clear)*inscale+offset;

                            p2.x:=p1.x;
                            p2.y:=y1+(clip_top_width/2+clip_arms_width)*inscale;

                            p3.x:=x1+clip_length;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                             //-----

                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin

                                      p1a.x:=p2.x-5.5*inscale;   // for brim fence clear
                                      p1a.y:=p2.y+6*inscale;

                                      p2a.x:=p1a.x;
                                      p2a.y:=p1a.y+3*inscale;  // brim fence 3" wide   232c

                                      p3a.x:=p3.x;
                                      p3a.y:=p2a.y;

                                      p4a.x:=p3a.x;
                                      p4a.y:=p1a.y;

                                        // for the outer fence...

                                      p2b.x:=p2a.x-3*inscale;
                                      p2b.y:=p2a.y;

                                      p3b:=p2a;

                                    end;
                             //-----

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip arm north

                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin
                                      p1:=p1a;
                                      p2:=p2a;
                                      p3:=p3a;
                                      p4:=p4a;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // brim fence north
                                    end;

                            p1.x:=x1-clip_sides_clear*inscale-offset;
                            p1.y:=y1-(clip_top_width/2+clip_ends_clear)*inscale-offset;

                            p2.x:=p1.x;
                            p2.y:=y1-(clip_top_width/2+clip_arms_width)*inscale;

                            p3.x:=x1+clip_length;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                             //-----

                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin

                                      p1a.x:=p2.x-5.5*inscale;   // for brim fence clear
                                      p1a.y:=p2.y-6*inscale;

                                      p2a.x:=p1a.x;
                                      p2a.y:=p1a.y-3*inscale;  // brim fence 3" wide   232c

                                      p3a.x:=p3.x;
                                      p3a.y:=p2a.y;

                                      p4a.x:=p3a.x;
                                      p4a.y:=p1a.y;

                                        // for the outer fence...

                                      p1b.x:=p2a.x-3*inscale;
                                      p1b.y:=p2a.y;

                                      p4b:=p2a;

                                    end;
                             //-----


                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip arm south


                            if (brim_fence=True) and (dxf_form.brim_fence_checkbox.Checked=True)      // 232c
                               then begin
                                      p1:=p1a;
                                      p2:=p2a;
                                      p3:=p3a;
                                      p4:=p4a;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // brim fence south


                                      p1:=p1b;
                                      p2:=p2b;
                                      p3:=p3b;
                                      p4:=p4b;

                                      rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                                      write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // brim fence outer

                                    end;


                            p1.x:=x1-clip_outers_length*inscale;
                            p1.y:=y1+(clip_top_width/2+clip_arms_width-clip_outers_width)*inscale+offset;

                            p2.x:=p1.x;
                            p2.y:=y1+(clip_top_width/2+clip_arms_width)*inscale;

                            p3.x:=x1-clip_sides_clear*inscale-offset;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip outer north


                            p1.x:=x1-clip_outers_length*inscale;
                            p1.y:=y1-(clip_top_width/2+clip_arms_width-clip_outers_width)*inscale-offset;

                            p2.x:=p1.x;
                            p2.y:=y1-(clip_top_width/2+clip_arms_width)*inscale;

                            p3.x:=x1-clip_sides_clear*inscale-offset;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip outer south


                            p1.x:=x1+(clip_top_length+clip_sides_clear)*inscale+offset;
                            p1.y:=y1-(clip_top_width/2+clip_ends_clear)*inscale-offset;

                            p2.x:=p1.x;
                            p2.y:=y1+(clip_top_width/2+clip_ends_clear)*inscale+offset;

                            p3.x:=x1+clip_length;
                            p3.y:=p2.y;

                            p4.x:=p3.x;
                            p4.y:=p1.y;

                            rotate_4p(rot_k,x1,y1,p1,p2,p3,p4);

                            write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,29);    // clip bump

                          end;

                end;
                ////////////////////////////////////////////////////////////////

begin
  if dxf_form.clip_fit_radio.Checked=True                         // 241b
     then begin
            plug_total_depth:=clip_plug_total_depth;
          end
     else if dxf_form.snap_fit_radio.Checked=True
             then begin
                    plug_total_depth:=snap_plug_total_depth;
                  end
             else begin
                    plug_total_depth:=press_plug_total_depth;
                  end;


  maxbg:=bgnd_form.bgnd_shapes_listbox.Items.Count;  // any there ?

  layer:=0;  // keep compiler happy

  if (_3d=False) and (maxbg>0)                       // first do any drawn 2D kerf lines
     then begin
            for i:=0 to (maxbg-1) do begin

              now_shape:=Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgnd_shape;     // next shape.

              with now_shape do begin

                if (shape_code=0) and (is_kerf=True)  // 244a   drawn kerf lines
                   then layer:=32                     // timber kerf lines
                   else CONTINUE;
              end;//with

              x1:=now_shape.p1.x+re_org_x/100;
              y1:=now_shape.p1.y+re_org_y/100;

              x2:=now_shape.p2.x+re_org_x/100;
              y2:=now_shape.p2.y+re_org_y/100;

              if dxf_form.limits_checkbox.Checked=True     // only within limits?
                                                           // (!!! this check is duplicated in dxf_line.)
                 then begin
                        if (x1>xmax) or (y1>ymax) then CONTINUE;
                        if (x1<xmin) or (y1<ymin) then CONTINUE;

                        if (x2>xmax) or (y2>ymax) then CONTINUE;
                        if (x2<xmin) or (y2<ymin) then CONTINUE;
                      end;

              Write(dxf_file,dxf_line(x1, y1, 0, x2, y2, 0, layer));  // 2-D line

            end;//next
          end;

  if dxf_form.shapes_bgnd_combo.ItemIndex=0 then EXIT;  // not wanted

  if (_3d=True) and (dxf_form.assemblers_checkbox.Checked=False)  then EXIT;   // not wanted  245a

  if shapes_z1>=0
     then begin
            if scale>4.05
               then shapes_z1:=timb_top_z-plug_total_depth*inscale-pyramid_height_high     // no plugs or pyramids
               else shapes_z1:=timb_top_z-plug_total_depth*inscale-pyramid_height_low;     // no plugs or pyramids
          end;

  shapes_z1:=shapes_z1+inscale/4;  // 238a integrity overlap supports 1/4"

  if maxbg>0                                             // any there ?
     then begin

            shapes_z2:=shapes_z1-raft_thick;    // bottom of raft flange
            shapes_z3:=shapes_z2-raft_thick;    // bottom of raft

            layer:=10;  // keep compiler happy

            with _3d_data do begin

              brick_bot_z:=0-(rail_section_data_mm.rail_depth_mm+(seat_thick+timber_thick)*inscale);

              slabs_top_z:=brick_bot_z+slab_depth*inscale;      // 234b

              splints_top_z:=brick_bot_z+splint_depth*inscale;  // 228b

              walls_top_z:=brick_bot_z+timber_thick*inscale;   // 234e

              clips_top_z:=brick_bot_z+clip_depth_mm;           // 228b
              clips_foot_z:=brick_bot_z+clip_foot_depth_mm;     // 228b

            end;//with

            font_height:=shapes_label_font.Size*25.4/72;      // in mm for labels

            for i:=0 to maxbg-1 do begin

              now_shape:=Tbgshape(bgnd_form.bgnd_shapes_listbox.Items.Objects[i]).bgnd_shape;     // next shape.

              sc:=now_shape.shape_code;

              with now_shape do begin

                if (sc=0) and (is_kerf=True) then CONTINUE;  // 244a already drawn in KERFTIMB layer if wanted

                if ((hide_bits AND $02)<>0) then CONTINUE;   // 2=hide on output  234b

                if (_3d=True) and (sc<>0) and (sc<>1) and (sc<>4) then CONTINUE;   // 3D only for lines, rectangles, target marks only yet

                if (_3d=False) and ( ((sc=0) and (shape_style=2)) or (sc=-1) )
                   then layer:=11    // colour for 2-D dotted lines and pictures.
                   else layer:=10;   // for 2-D background shapes except dotted lines and pictures,   and all 3-D shapes,  changed later for timbering bricks

              end;//with

              if sc<>4            // not a target mark
                   then begin

                          x1:=now_shape.p1.x+re_org_x/100;
                          y1:=now_shape.p1.y+re_org_y/100;

                          x2:=now_shape.p2.x+re_org_x/100;
                          y2:=now_shape.p2.y+re_org_y/100;

                          if dxf_form.limits_checkbox.Checked=True     // only within limits?
                                                                       // (!!! this check is duplicated in dxf_line.)
                             then begin
                                    if (x1>xmax) or (y1>ymax) then CONTINUE;
                                    if (x1<xmin) or (y1<ymin) then CONTINUE;

                                    if now_shape.shape_code<3         // x2,y2 not valid for text labels and target marks
                                       then begin
                                              if (x2>xmax) or (y2>ymax) then CONTINUE;
                                              if (x2<xmin) or (y2<ymin) then CONTINUE;
                                            end;
                                  end;

                          case now_shape.shape_code of

                                      -1: begin
                                            if _3d=True then CONTINUE;  // no pictures in 3-D

                                                 // 2-D picture outline...

                                            Write(dxf_file,dxf_line(x1, y1, 0, x1, y2, 0, layer));
                                            Write(dxf_file,dxf_line(x1, y2, 0, x2, y2, 0, layer));
                                            Write(dxf_file,dxf_line(x2, y2, 0, x2, y1, 0, layer));
                                            Write(dxf_file,dxf_line(x2, y1, 0, x1, y1, 0, layer));

                                               // add diagonals for picture...

                                            Write(dxf_file,dxf_line(x1, y1, 0, x2, y2, 0, layer));  // diagonal
                                            Write(dxf_file,dxf_line(x1, y2, 0, x2, y1, 0, layer));  // other diagonal
                                          end;


                                       0: if _3d=True      // line...
                                             then begin
                                                    if now_shape.is_kerf=True then CONTINUE;  // 244a

                                                    if (dxf_form.splints_combo.ItemIndex<>0)                                                  // do splints, walls and label tabs
                                                    or ( (dxf_form.plain_rafts_radio.Checked=True) and ((now_shape.option_bits AND $04)<>0) ) // 236c this is a brick label tab on a chair raft
                                                       then begin

                                                              if (dxf_form.brick_option_radio.Checked=True)
                                                                 and ((now_shape.is_brick=False) or (now_shape.wrap_offset<>dxf_form.marker_colour_panel.Color))
                                                                 then CONTINUE;      // wrong brick colour

                                                              if x1>x2
                                                                 then begin
                                                                        xlo:=x2;
                                                                        ylo:=y2;
                                                                        xhi:=x1;
                                                                        yhi:=y1;
                                                                      end
                                                                 else begin
                                                                        xlo:=x1;
                                                                        ylo:=y1;
                                                                        xhi:=x2;
                                                                        yhi:=y2;
                                                                      end;
                                                              try
                                                                if ABS(xhi-xlo)<minfp  // splint angle vertical
                                                                   then begin
                                                                          if yhi>ylo
                                                                             then spk:=Pi/2
                                                                             else spk:=0-Pi/2;
                                                                        end
                                                                   else spk:=ARCTAN((yhi-ylo)/(xhi-xlo));   // splint angle
                                                              except
                                                                spk:=0;
                                                              end;//try

                                                                // splint/label corners ...

                                                              if (now_shape.option_bits AND $04)<>0     // this is a brick label tab
                                                                 then begin
                                                                        spw:=label_tab_width*inscale/2;

                                                                        if dxf_form.plain_rafts_radio.Checked=True   // label is on chairing raft     236c
                                                                           then begin
                                                                                  z1:=shapes_z1;
                                                                                  z2:=shapes_z1;    // zero splint thickness if text on chair raft
                                                                                end
                                                                           else begin                   // label tab as splint
                                                                                  z1:=splints_top_z;
                                                                                  z2:=brick_bot_z;
                                                                                end;
                                                                      end
                                                                 else begin         // normal splint or wall (no label) ...

                                                                        if (now_shape.is_brick_wall=True) and (now_shape.wall_width<>0)
                                                                           then spw:=now_shape.wall_width/2
                                                                           else spw:=splint_width*inscale/2;      // splint or default wall

                                                                        z1:=splints_top_z;
                                                                        z2:=brick_bot_z;      // splint bottom
                                                                      end;

                                                              p1.x:=xlo-spw*SIN(spk);
                                                              p1.y:=ylo+spw*COS(spk);

                                                              p2.x:=xhi-spw*SIN(spk);
                                                              p2.y:=yhi+spw*COS(spk);

                                                              p3.x:=xhi+spw*SIN(spk);
                                                              p3.y:=yhi-spw*COS(spk);

                                                              p4.x:=xlo+spw*SIN(spk);
                                                              p4.y:=ylo-spw*COS(spk);

                                                                // if wall ...

                                                              if now_shape.is_brick_wall=True
                                                                 then begin
                                                                        if now_shape.wall_depth<>0
                                                                           then z1:=z2+now_shape.wall_depth   // 234e ..
                                                                           else z1:=walls_top_z;
                                                                      end;

                                                                // into file ...

                                                              if z1<>z2 then write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2,28);        // 236c  splint

                                                                 // add label tab characters ...

                                                              if (dxf_form.brick_label_text_checkbox.Checked=True)
                                                              and ((now_shape.option_bits AND $04)<>0)   // this is a label tab, write 7-seg characters on it
                                                              and (now_shape.is_brick=True)              // brick shape
                                                              and (POS('#',now_shape.shape_name)=1)                                                                  // # prefix required for brick label tab
                                                                 then seven_seg(dxf_form.plain_rafts_radio.Checked,now_shape.brick_label_scaling,now_shape.shape_name);

                                                            end;
                                                  end
                                             else Write(dxf_file,dxf_line(x1, y1, 0, x2, y2, 0, layer));  // 2-D line

                                       1: begin     // twist the rectangle...

                                            p1.x:=now_shape.p1.x+re_org_x/100;
                                            p1.y:=now_shape.p1.y+re_org_y/100;

                                            p3.x:=now_shape.p2.x+re_org_x/100;
                                            p3.y:=now_shape.p2.y+re_org_y/100;

                                            p2.x:=p1.x;
                                            p2.y:=p3.y;

                                            p4.x:=p3.x;
                                            p4.y:=p1.y;

                                            rot_k:=now_shape.rect_rot;         // slab rotation angle

                                            while (rot_k>(Pi*2)) do rot_k:=rot_k-Pi*2;   // normalize
                                            while (rot_k<(Pi*2)) do rot_k:=rot_k+Pi*2;

                                            rotate_4p(rot_k,(p1.x+p3.x)/2,(p1.y+p3.y)/2,p1,p2,p3,p4);    // rotate corners around centre of rectangle

                                            if _3d=True
                                               then begin
                                                      if (dxf_form.plain_rafts_radio.Checked=True)   // do support raft from rectangle shape ...
                                                      or (dxf_form.nails_rafts_radio.Checked=True)
                                                         then begin

                                                                if (dxf_form.brick_option_radio.Checked=True) and (dxf_form.raft_match_brick_colour_checkbox.Checked=True)    // 241b
                                                                and (now_shape.wrap_offset<>dxf_form.marker_colour_panel.Color)
                                                                   then CONTINUE;

                                                                xlo:=MIN(x1,x2)-raft_flange;      // flange overhang
                                                                ylo:=MIN(y1,y2)-raft_flange;

                                                                xhi:=MAX(x1,x2)+raft_flange;
                                                                yhi:=MAX(y1,y2)+raft_flange;

                                                                pf1.x:=xlo;        // flange corners ...
                                                                pf1.y:=ylo;

                                                                pf2.x:=xlo;
                                                                pf2.y:=yhi;

                                                                pf3.x:=xhi;
                                                                pf3.y:=yhi;

                                                                pf4.x:=xhi;
                                                                pf4.y:=ylo;

                                                                rotate_4p(rot_k,(xlo+xhi)/2,(ylo+yhi)/2,pf1,pf2,pf3,pf4);    // rotate flange corners around centre of rectangle

                                                                write_3d_solid_rectangle(pf1,pf2,pf3,pf4,shapes_z1,shapes_z2,layer);     // 236d raft flange

                                                                write_3d_solid_rectangle(p1,p2,p3,p4,shapes_z2,shapes_z3,layer);         // 236d bottom of raft

                                                                if dxf_form.nails_rafts_radio.Checked=True   // add bed of nails
                                                                   then begin
                                                                          nailxco:=TRUNC(ABS(xhi-xlo)/nailx_spacing);   // count of nails
                                                                          nailyco:=TRUNC(ABS(yhi-ylo)/naily_spacing);

                                                                          for nn:=0 to (nailxco-1) do begin
                                                                            for nm:=0 to (nailyco-1) do begin

                                                                              nail.x:=xlo+nailx_spacing/2+nn*nailx_spacing;
                                                                              nail.y:=ylo+naily_spacing/2+nm*naily_spacing;

                                                                              dotransform(rot_k,(xlo+xhi)/2,(ylo+yhi)/2,nail,nail);   // rotate nail location to match raft

                                                                              s:='  0|INSERT|  2|NAIL|  8|'+layer_str[10]                        // 10 = raft shape rectangle
                                                                                +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,nail.x)
                                                                                +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,nail.y)
                                                                                +' 30|'+make_dim(3,z_shrinkage_factor,z_scale,z_shift,0)

                                                                                +' 41|'+make_factor(block_insert_scaling)      // scaling on x
                                                                                +' 42|'+make_factor(block_insert_scaling)      // scaling on y
                                                                                +' 43|'+make_factor(block_insert_scaling)      // scaling on z

                                                                                +' 50|'+make_angle(rot_k);

                                                                              Write(dxf_file,insert_crlf_str(s));

                                                                              if stl=True then insert_stl_block('NAIL',nail.x,nail.y,0,rot_k*Pi/180);


                                                                            end;//next naily
                                                                          end;//next nailx

                                                                          //
                                                                        end;//nails
                                                              end
                                                         else begin
                                                                if dxf_form.alignment_plates_radio.Checked=True     // do laser/CNC aligment plate
                                                                   then begin
                                                                          write_3d_solid_rectangle(p1,p2,p3,p4,timb_top_z+alignment_plate_thick_mm,timb_top_z,layer);   // 241e
                                                                        end
                                                                   else begin    // do twisted rectangle as slab...

                                                                          if dxf_form.splints_combo.ItemIndex<>0
                                                                             then begin
                                                                                    if (dxf_form.brick_option_radio.Checked=True)
                                                                                   and ((now_shape.is_brick=False) or (now_shape.wrap_offset<>dxf_form.marker_colour_panel.Color))
                                                                                       then CONTINUE;      // doing bricks, not brick or wrong brick colour
                                                                                  end;

                                                                          write_3d_solid_rectangle(p1,p2,p3,p4,slabs_top_z,brick_bot_z,28);   // 28 = splints layer
                                                                        end;
                                                              end;

                                                    end //3d
                                               else begin  // make 2D twisted rectangle

                                                      Write(dxf_file,dxf_line(p1.x, p1.y, 0, p2.x, p2.y, 0, layer));
                                                      Write(dxf_file,dxf_line(p2.x, p2.y, 0, p3.x, p3.y, 0, layer));
                                                      Write(dxf_file,dxf_line(p3.x, p3.y, 0, p4.x, p4.y, 0, layer));
                                                      Write(dxf_file,dxf_line(p4.x, p4.y, 0, p1.x, p1.y, 0, layer));
                                                    end;

                                          end;//rectangle

                                       2: if _3d=True           // make circle
                                             then CONTINUE      // no circles in 3-D
                                             else begin

                                                    p:=(x1+x2)/2;    // average to get circle centres..
                                                    q:=(y1+y2)/2;
                                                    rad:=( ABS((x1-x2)/2) + ABS((y1-y2)/2) )/2;  // and radius.

                                                    debug_code:=12;

                                                    s:='  0|CIRCLE|  8|'+layer_str[layer]
                                                      +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,p)
                                                      +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,q)
                                                      +' 40|'+make_dim(0,1,1,0,rad);

                                                    Write(dxf_file,insert_crlf_str(s));
                                                  end;

                                       3: if _3d=True   // no label shapes in 3-D
                                             then CONTINUE
                                             else begin                // 2-D label shape

                                                    debug_code:=13;
                                                    
                                                    s:='  0|TEXT|  8|'+layer_str[layer]
                                                      +' 10|'+make_dim(1,x_shrinkage_factor,x_scale,x_shift,x1)
                                                      +' 20|'+make_dim(2,y_shrinkage_factor,y_scale,y_shift,y1)
                                                      +' 40|'+make_dim(0,1,1,0,font_height)  // text height for labels
                                                      +'  1|'+now_shape.shape_name+'|';    // label string.

                                                    Write(dxf_file,insert_crlf_str(s));
                                                  end;

                          end;//case
                        end
                   else begin    // shape_code=4, draw a target mark or brick clip

                          x1:=now_shape.p1.x+re_org_x/100;
                          y1:=now_shape.p1.y+re_org_y/100;

                          clip_length:=ABS(now_shape.p2.x);  // clip size mm
                          rot_k:=now_shape.p2.y;             // clip rotation angle

                          while (rot_k>(Pi*2)) do rot_k:=rot_k-Pi*2;   // normalize
                          while (rot_k<(Pi*2)) do rot_k:=rot_k+Pi*2;

                          if now_shape.p2.x<0      // swap direction if size negative, rotate 180 degrees
                             then begin
                                    if rot_k>Pi then rot_k:=rot_k-Pi
                                                else rot_k:=rot_k+Pi;
                                  end;

                          if (_3d=True) and (dxf_form.clips_combo.ItemIndex<>0)   //  do a brick_clip
                             then begin

                                    if (dxf_form.brick_option_radio.Checked=True)
                                    and ((now_shape.is_brick=False) or (now_shape.wrap_offset<>dxf_form.marker_colour_panel.Color))
                                       then CONTINUE;      // not a brick or wrong brick colour

                                    do_clip(True,clip_foot_offset_mm,clips_foot_z,brick_bot_z);     // foot part with offset to prevent elephant's foot
                                    do_clip(False,0,clips_top_z,clips_foot_z);                      // main part above

                                  end
                             else begin         // 2-D target mark..

                                    arm:=p2.x;            // cross arm length.
                                    diamond:=arm/2;       // size of centre diamond.

                                    Write(dxf_file,dxf_line(x1-arm, y1,     0, x1+arm, y1,     0, layer));  // horizontal arms.
                                    Write(dxf_file,dxf_line(x1,     y1-arm, 0, x1,     y1+arm, 0, layer));  // vertical arms.

                                       // now do 4 diamond lines...

                                    Write(dxf_file,dxf_line(x1-diamond, y1,         0, x1,         y1+diamond, 0, layer));     // NW line.
                                    Write(dxf_file,dxf_line(x1,         y1+diamond, 0, x1+diamond, y1,         0, layer));     // NE line.
                                    Write(dxf_file,dxf_line(x1+diamond, y1,         0, x1,         y1-diamond, 0, layer));     // SE line.
                                    Write(dxf_file,dxf_line(x1,         y1-diamond, 0, x1-diamond, y1,         0, layer));     // SW line.

                                  end;
                        end;

              //end;//with now_shape
            end;//for next i shape
          end;//if shapes
end;
//______________________________________________________________________________

procedure Tdxf_form.FormShow(Sender: TObject);

begin
  ok_button.SetFocus;
end;
//______________________________________________________________________________

procedure Tdxf_form.rails_comboChange(Sender: TObject);

begin
  if (Sender is TComboBox) then TComboBox(Sender).Color:=clWhite;
end;
//______________________________________________________________________________

procedure Tdxf_form.rails_comboDropDown(Sender: TObject);

begin
  if (Sender is TComboBox) then TComboBox(Sender).Color:=clWhite;
end;
//______________________________________________________________________________

procedure Tdxf_form.rails_comboContextPopup(Sender: TObject;  MousePos: TPoint; var Handled: Boolean);

begin
  if (Sender is TComboBox) then TComboBox(Sender).ItemIndex:=0;

  Handled:=True;
end;
//______________________________________________________________________________

procedure Tdxf_form.FormCreate(Sender: TObject);

begin
  if Screen.Height<500 then Top:=2;    // move form up the screen for lo-res.

  ClientWidth:=1160;
  ClientHeight:=790;
  AutoScroll:=True;

end;
//______________________________________________________________________________

procedure Tdxf_form.FormActivate(Sender: TObject);

begin
  with scaled_checkbox do begin
    if Checked=True then Caption:='s&caled  '+round_str(out_factor*100,2)+' %'
                    else Caption:='s&caled';
  end;//with
end;
//______________________________________________________________________________

procedure Tdxf_form.scaled_checkboxClick(Sender: TObject);

var
  dxf_scaling_help_str:string;

begin
  dxf_scaling_help_str:='      `0DXF output scaling`9'
                       +'||The DXF output will now be scaled at '+round_str(out_factor*100,2)+' %'
                       +'||This setting can be changed on the `0output`1 menu at `0enlarge/reduce size`1 menu items.'
                       +'||For export to a CAD program you should normally leave this on 100% and do any required scaling in the CAD program.'
                       +'||For output to graphics editing and drawing programs you may get better results by exporting a metafile image instead (EMF file).';

  with scaled_checkbox do begin
    if Checked=True
       then begin
              Caption:='s&caled  '+round_str(out_factor*100,2)+' %';
              help(0,dxf_scaling_help_str,'');
            end
       else Caption:='s&caled';
  end;//with

end;
//_______________________________________________________________________________________

procedure Tdxf_form._2d_radiobuttonClick(Sender: TObject);

begin
  _3d:=False;
  file_type_groupbox.Enabled:=False;
  dxf_radio.Enabled:=False;
  stl_radio.Enabled:=False;
  dxf_stl_both_radio.Enabled:=False;

  preview_panel.Color:=$0090D0FF;                    // sand
  preview_panel.Caption:='   preview  2-D  export';
end;
//_________________________________________________________________________

procedure _3d_options_click(fix:boolean);

begin

     // fix generator issues if any...

  if (fix=True) and (timbering_infill=False)
     then begin
            pad_form.timbering_infill_menu_entry.Checked:=True;
            timbering_infill:=True;

            pad_form.generator_rebuild_bgnd_menu_entry.Click;
          end;

   _3d:=True;

  with dxf_form do begin
    file_type_groupbox.Enabled:=True;
    dxf_radio.Enabled:=True;
    stl_radio.Enabled:=True;
    dxf_stl_both_radio.Enabled:=True;

    stl_radio.Checked:=True;


    preview_panel.Color:=$00FFF080;  // light blue
    preview_panel.Caption:='   preview  3-D  export';

  end;//with

end;
//______________________________________________________________________________

procedure Tdxf_form._3d_fdm_radiobuttonClick(Sender: TObject);

begin
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));
 end;
//______________________________________________________________________________

procedure Tdxf_form.heated_bed_checkboxClick(Sender: TObject);

begin
  _3d_fdm_radiobutton.Checked:=True;    // assume FDM
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));
end;
//______________________________________________________________________________

procedure Tdxf_form._3d_resin_radiobuttonClick(Sender: TObject);

begin
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));
end;
//______________________________________________________________________________

procedure Tdxf_form._3d_cad_radiobuttonClick(Sender: TObject);

begin
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));
end;
//______________________________________________________________________________

procedure Tdxf_form._3d_colours_buttonClick(Sender: TObject);

var
  i:integer;

begin
  i:=alert(4,'   3-D  rails  colour ...',
             'Choose a colour for the rails when rendered by your CAD program in 3-D format.',
             'red','blue','grey  steel','light  rust','cancel','blue  steel',0);

  case i of
         1: railsides_3d_colour:=1;   // red
         2: railsides_3d_colour:=5;
         3: railsides_3d_colour:=252;
         4: railsides_3d_colour:=31;
         5: EXIT;
         6: railsides_3d_colour:=141;
  end;//case


  i:=alert(4,'   3-D  timber  colour ...',
             'Choose a colour for the timbers when rendered by your CAD program in 3-D format.',
             'black','stone','grey','light  brown','cancel','dark  brown',0);

  case i of
         1: timber_3d_colour:=7;    // black
         2: timber_3d_colour:=54;   // stone
         3: timber_3d_colour:=8;    // grey
         4: timber_3d_colour:=31;   // light brown
         5: EXIT;
         6: timber_3d_colour:=33;   // dark brown
  end;//case


  i:=alert(4,'   3-D  chairs / baseplates  colour ...',
             'Choose a colour for the chairs / baseplates when rendered by your CAD program in 3-D format.',
             'black','grey','dark  brown','bright  rust','cancel','light  brown',0);

  case i of
         1: chair_3d_colour:=7;    // black
         2: chair_3d_colour:=8;    // grey
         3: chair_3d_colour:=33;   // dark brown
         4: chair_3d_colour:=30;   // bright rust
         5: EXIT;
         6: chair_3d_colour:=31;   // light brown
  end;//case

  i:=alert(4,'   3-D   chair  keys  colour ...',
             'Choose a colour for the chair keys when rendered by your CAD program in 3-D format.',
             'black','grey','dark  brown','light  brown','cancel','wood',0);

  case i of
         1: key_3d_colour:=7;    // black
         2: key_3d_colour:=8;    // grey
         3: key_3d_colour:=33;   // dark brown
         4: key_3d_colour:=31;   // light brown
         5: EXIT;
         6: key_3d_colour:=64;   // wood
  end;//case


  i:=alert(4,'   3-D   chair  bolt/screw  colour ...',
             'Choose a colour for the chair bolt/screws when rendered by your CAD program in 3-D format.',
             'black','grey','red','blue','cancel','silver',0);

  case i of
         1: bolthead_3d_colour:=7;    // black
         2: bolthead_3d_colour:=8;    // grey
         3: bolthead_3d_colour:=1;    // red
         4: bolthead_3d_colour:=5;    // blue
         5: EXIT;
         6: bolthead_3d_colour:=9;    // silver
  end;//case


  i:=alert(4,'   3-D   chair  plug  colour ...',
             'Choose a colour for the chair plugs when rendered by your CAD program in 3-D format.',
             'black','silver','red','blue','cancel','light grey',0);

  case i of
         1: plug_3d_colour:=7;    // black
         2: plug_3d_colour:=9;    // silver
         3: plug_3d_colour:=1;    // red
         4: plug_3d_colour:=5;    // blue
         5: EXIT;
         6: plug_3d_colour:=254;  // light grey
  end;//case


  i:=alert(4,'   3-D   chair  support  colour ...',
             'Choose a colour for the chair supports when rendered by your CAD program in 3-D format.',
             'black','grey','red','blue','cancel','silver',0);

  case i of
         1: support_3d_colour:=7;    // black
         2: support_3d_colour:=8;    // grey
         3: support_3d_colour:=1;    // red
         4: support_3d_colour:=5;    // blue
         5: EXIT;
         6: support_3d_colour:=9;    // silver
  end;//case

end;
//_________________________________________________________________________

procedure Tdxf_form.fill_below_key_checkboxClick(Sender: TObject);

begin
  fill_below_key:=fill_below_key_checkbox.Checked;
end;
//______________________________________________________________________________

procedure init_rail_section;

var
  n:integer;

                               /////////////////////////////////////////////////

                               procedure fish_calcs;

                               begin
                                 with rail_section_data_mm do begin

                                   rail_web_thick_mm:=rail_web_thick_mm*(100+chair_web_adjustment)/100;   // % adjust

                                   rail_head_depth_mm:=rail_web_top_mm-rail_head_width_mm/2/rail_fish_angle;
                                   rail_foot_depth_mm:=rail_depth_mm-rail_web_bottom_mm-rail_foot_width_mm/2/rail_fish_angle;

                                   rail_foot_height_below_head_mm:=rail_depth_mm-rail_web_bottom_mm-rail_head_width_mm/2/rail_fish_angle;   // foot thickness at gauge (vertically below head if foot width different from head width)

                                        // these used for face of key and grip ..

                                   rail_web_face_top_from_rail_bot_mm:=rail_depth_mm-rail_web_top_mm+rail_web_thick_mm/2/rail_fish_angle;
                                   rail_web_face_bottom_from_rail_bot_mm:=rail_depth_mm-rail_web_bottom_mm-rail_web_thick_mm/2/rail_fish_angle;

                                        // used for chair key and filler below key:

                                   zkeybot:=0-(rail_depth_mm-rail_foot_height_below_head_mm);

                                 end;//with
                               end;
                               /////////////////////////////////////////////////

begin

    // default rail section is BS-95R   inches full-size * current scale ...

  with rail_section_data_mm do begin

    rail_depth_mm:=(5+23/32)*inscale;    // - 2D TEMPLATE SETTING MAY DIFFER  (cpi.rail_height_pi - inclined rail calcs - in inches)

    rail_head_width_mm:=(2+3/4)*inscale;   // - 2D TEMPLATE SETTING MAY DIFFER  (cpi.railtop_pi - in mm)

    rail_corner_rad_mm:=0.5*inscale;

    rail_foot_width_mm:=(2+3/4)*inscale;
    rail_fish_angle:=2.75;                               // 1:n

    rail_web_top_mm:=(1+15/16)*inscale;                  //  from rail top to intersection fish angle on rail centre-line  1:2.75
    rail_web_bottom_mm:=rail_depth_mm-(1+5/16)*inscale;  //  from rail top to intersection fish angle on rail centre-line  1:2.75

    rail_web_thick_mm:=0.75*inscale;

    fish_calcs;

   if dxf_form.bs95r_radiobutton.Checked=True
       then rail_section_option:=0;


      // model rail section over-rides ...

      // C&L / EMGS / Exactoscale code75 bullhead. including some 3D printing allowances ...

    if dxf_form.emgs_75_rail_radiobutton.Checked=True
       then begin

              rail_section_option:=1;

                 // convert to full-size at 4mm/ft and back to current scale   (4mm/ft = *3" per mm)

              rail_depth_mm:=1.90*3*inscale;   // code 75 // - 2D TEMPLATE SETTING MAY DIFFER  (cpi.rail_height_pi - inclined rail calcs - in inches)

              rail_head_width_mm:=0.90*3*inscale;   // - 2D TEMPLATE SETTING MAY DIFFER  (cpi.railtop_pi - in mm)

              rail_corner_rad_mm:=0.15*3*inscale;

              rail_foot_width_mm:=0.90*3*inscale;

              rail_fish_angle:=1.5;          // 1:n   arbitrary

              rail_web_top_mm:=0.80*3*inscale;        //  from rail top to intersection fish angle on rail centre-line
              rail_web_bottom_mm:=1.25*3*inscale;     //  from rail top to intersection fish angle on rail centre-line

              rail_web_thick_mm:=0.35*3*inscale;

              fish_calcs;
            end;

      // SMP code75 bullhead ...

    if dxf_form.smp_75_rail_radiobutton.Checked=True
       then begin

              rail_section_option:=2;

                // convert to full-size at 4mm/ft and back to current scale   (4mm/ft = *3" per mm)

              rail_head_width_mm:=0.8*3*inscale;  //  2D TEMPLATE SETTING MAY DIFFER  (cpi.railtop_pi)

              rail_foot_width_mm:=0.8*3*inscale;

              rail_depth_mm:=1.92*3*inscale;  // 2D TEMPLATE SETTING MAY DIFFER  (cpi.rail_height_pi - inclined rail calcs)

              rail_fish_angle:=1.5;    // 1:n    arbitrary

              rail_web_thick_mm:=0.35*3*inscale;

              rail_web_top_mm:=0.8*3*inscale;                    //  from rail top to intersection fish angle on rail centre-line
              rail_web_bottom_mm:=rail_depth_mm-0.6*3*inscale;   //  from rail top to intersection fish angle on rail centre-line

              fish_calcs;
            end;

      // Peco 0 gauge bullhead (conversions at 7mm/ft) ...

    if dxf_form.peco_124_rail_radiobutton.Checked=True
       then begin

              rail_section_option:=3;

                // use measured dims converted to full-size at 7mm/ft ...

              rail_depth_mm:=(5+13/32)*inscale;  // 2D TEMPLATE SETTING MAY DIFFER  (cpi.rail_height_pi - inclined rail calcs)

              rail_head_width_mm:=(2+17/32)*inscale;

              rail_foot_width_mm:=(3+3/64)*inscale;

              rail_fish_angle:=1.5;    // 1:n    arbitrary

              rail_web_top_mm:=(2+13/32)*inscale;                  //  from rail top to intersection fish angle on rail centre-line
              rail_web_bottom_mm:=rail_depth_mm-(1+9/16)*inscale;  //  from rail top to intersection fish angle on rail centre-line


              rail_web_thick_mm:=(1+5/16)*inscale;

              fish_calcs;

            end;


     // C&L code131 bullhead....

    if dxf_form.cl_131_rail_radiobutton.Checked=True
       then begin

              rail_section_option:=4;

              rail_fish_angle:=2;    // estimated

              rail_web_top_mm:=(2+5/16)*inscale;                     //  estimated from rail top to intersection fish angle on rail centre-line
              rail_web_bottom_mm:=rail_depth_mm-(1+11/16)*inscale;   //  estimated from rail top to intersection fish angle on rail centre-line

              rail_web_thick_mm:=0.44;

              // other dims match BS-95R

              fish_calcs;

            end;




    if dxf_form.custom_rail_radiobutton.Checked=True
       then begin

              rail_section_option:=99;

              rail_depth_mm:=custom_rail_depth*inscale;  // 2D TEMPLATE SETTING MAY DIFFER  (cpi.rail_height_pi - inclined rail calcs)

              rail_head_width_mm:=custom_rail_head_width*inscale;

              rail_corner_rad_mm:=custom_rail_corner_rad*inscale;

              rail_foot_width_mm:=custom_rail_foot_width*inscale;

              rail_fish_angle:=custom_rail_fish_angle;    // 1:n    arbitrary

              rail_web_top_mm:=custom_rail_web_top*inscale;                      //  from rail top to intersection fish angle on rail centre-line
              rail_web_bottom_mm:=rail_depth_mm-custom_rail_web_bottom*inscale;  //  from rail top to intersection fish angle on rail centre-line


              rail_web_thick_mm:=custom_rail_web_thick*inscale;

              fish_calcs;

            end;

  end;//with

end;
//______________________________________________________________________________

procedure Tdxf_form.stl_repair_buttonClick(Sender: TObject);

begin
  go_to_url('https://www.formware.co/onlinestlrepair');
end;
//______________________________________________________________________________

procedure Tdxf_form.timbers_only_fdm_buttonClick(Sender: TObject);    // 228a

begin
  rails_combo.ItemIndex:=0;

  chairs_combo.ItemIndex:=0;
  chair_bolts_combo.ItemIndex:=0;

  timbout_combo.ItemIndex:=14;       // brown timber outline              colour not used in 3-D
  timbout_kerf_combo.ItemIndex:=3;   // green timber laser kerf outline   colour not used in 3-D

  sockets_combo.ItemIndex:=9;        // silver
  sockets_kerf_combo.ItemIndex:=5;   // blue chair sockets laser kerf outline    colour not used in 3-D

  flanges_combo.ItemIndex:=8;        // grey
  soleplates_combo.ItemIndex:=12;   // maroon
  webs_combo.ItemIndex:=8;           // grey
  splints_combo.ItemIndex:=8;        // grey
  clips_combo.ItemIndex:=3;          // green

  if assemblers_checkbox.Checked=True
     then shapes_bgnd_combo.ItemIndex:=11   // orange
     else shapes_bgnd_combo.ItemIndex:=0;

  plugs_checkbox.Checked:=False;
  pyramids_checkbox.Checked:=False;
  loose_jaw_pyramids_checkbox.Checked:=False;

  brick_slabs_radio.Checked:=True;

  switch_drive_checkbox.Checked:=True;

  timbers_fdm_bullet_shape.Visible:=True;
  timbers_laser_bullet_shape.Visible:=False;
  chairs_bullet_shape.Visible:=False;
  reset_both_bullet_shape.Visible:=False;

  _3d_fdm_radiobutton.Checked:=True;    // assume FDM
  _3d_options_click(False);

end;
//______________________________________________________________________________

procedure Tdxf_form.timbers_only_laser_buttonClick(Sender: TObject);

begin
  omit_all_button.Click;  // all off except ...

  timbout_kerf_combo.ItemIndex:=3;   // green timber laser kerf outline
  sockets_kerf_combo.ItemIndex:=5;   // blue chair sockets laser kerf outline

  if kerfs_only_checkbox.Checked=False         // add normal outlines
     then begin
            timbout_combo.ItemIndex:=14;       // brown timber outline
            sockets_combo.ItemIndex:=9;        // silver socket outline
          end;

  plugs_checkbox.Checked:=False;
  pyramids_checkbox.Checked:=False;
  loose_jaw_pyramids_checkbox.Checked:=False;

  switch_drive_checkbox.Checked:=False;

  brick_slabs_radio.Checked:=True;

  timbers_fdm_bullet_shape.Visible:=False;
  timbers_laser_bullet_shape.Visible:=True;
  chairs_bullet_shape.Visible:=False;
  reset_both_bullet_shape.Visible:=False;

  _2d_radiobutton.Checked:=True;    // assume DXF 2-D

  _3d:=False;

  dxf_radio.Checked:=True;

  file_type_groupbox.Enabled:=False;
  dxf_radio.Enabled:=False;
  stl_radio.Enabled:=False;
  dxf_stl_both_radio.Enabled:=False;

  preview_panel.Color:=$0090D0FF;                    // sand
  preview_panel.Caption:='   preview  2-D  export';

end;
//______________________________________________________________________________

procedure Tdxf_form.chairs_only_buttonClick(Sender: TObject);

begin
  rails_combo.ItemIndex:=0;          // no rails
  timbout_combo.ItemIndex:=0;        // no timber outline
  timbout_kerf_combo.ItemIndex:=0;   // no timber laser kerf outline

  chairs_combo.ItemIndex:=1;        //red   colour not used in 3-D..
  chair_bolts_combo.ItemIndex:=1;   //red

  plugs_checkbox.Checked:=True;
  pyramids_checkbox.Checked:=True;
  loose_jaw_pyramids_checkbox.Checked:=True;

  switch_drive_checkbox.Checked:=False;

  sockets_combo.ItemIndex:=0;
  sockets_kerf_combo.ItemIndex:=0;   // no chair sockets laser kerf outline
  sprues_combo.ItemIndex:=0;
  flanges_combo.ItemIndex:=0;
  soleplates_combo.ItemIndex:=0;
  webs_combo.ItemIndex:=0;
  splints_combo.ItemIndex:=0;
  clips_combo.ItemIndex:=0;

  plain_rafts_radio.Checked:=True;

  timbers_fdm_bullet_shape.Visible:=False;
  timbers_laser_bullet_shape.Visible:=False;
  chairs_bullet_shape.Visible:=True;
  reset_both_bullet_shape.Visible:=False;

  rail_label.Visible:=True;

  _3d_resin_radiobutton.Checked:=True;    // assume resin
  _3d_options_click(False);

end;
//______________________________________________________________________________

procedure Tdxf_form.reset_both_buttonClick(Sender: TObject);

begin
  combo_colour_defaults_button.Click;

  plugs_checkbox.Checked:=True;
  pyramids_checkbox.Checked:=True;
  loose_jaw_pyramids_checkbox.Checked:=True;

  plain_rafts_radio.Checked:=True;

  switch_drive_checkbox.Checked:=True;


  timbers_fdm_bullet_shape.Visible:=False;
  timbers_laser_bullet_shape.Visible:=False;
  chairs_bullet_shape.Visible:=False;
  reset_both_bullet_shape.Visible:=True;

end;
//______________________________________________________________________________

procedure Tdxf_form.normals_buttonClick(Sender: TObject);       // 241a

const
  str:string='    `03-D  chairs  plug / socket  normal  sizes`9'
            +'||Ideally this should to left set to zero. It can be used to change the basic dimensions of the chair plugs and sockets if the designed sizes are not suitable.'
            +'||Be aware that making a significant change may prevent essential functions from working as intended.';

  str3:string='       `0modify  3-D  chair  plugs`9'
            +'||Ideally this should to left set to zero. Normally the plug size remains as designed and any needed adjustments are made to the socket size.'
            +'||This setting can be used to adjust the dimensions of the chair plugs instead, if the sockets already exist.'
            +'||Be aware that making a significant change may prevent essential functions from working as intended.';

  str1:string='Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'modify  normal  plug / socket  length  by',plugsock_length_mod*inscale,False,True,False,False);  // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'modify  normal  plug / socket  width  by',plugsock_width_mod*inscale,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str3,1,'chair  plug  end  clearance  ( each  end )',plug_fit_ends,False,True,False,False);        // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str3,1,'chair  plug  side  clearance  ( each  side )',plug_fit_sides,False,True,False,False);     // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str1,1,'plug  corner  relief  -  for  3D-printed/laser  sockets',plug_corner_clear_fdm*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str1,1,'plug  corner  relief  -  for  CNC-milled  sockets',plug_corner_clear_cnc*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str1,1,'plug  end  width  -  for  3D-printed/laser  sockets',plug_end_width_fdm*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str1,1,'plug  end  width  -  for  CNC-milled  sockets',plug_end_width_cnc*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.


  if n<>7 then EXIT;

  if getdims('modify  3-D  chair  plug / socket  normals ...','',dxf_form,n,od)=True
     then begin
            plugsock_length_mod:=od[0]/inscale;
            plugsock_width_mod:=od[1]/inscale;

            plug_fit_ends:=od[2];
            plug_fit_sides:=od[3];

            plug_corner_clear_fdm:=od[4]/inscale;
            plug_corner_clear_cnc:=od[5]/inscale;

            plug_end_width_fdm:=od[6]/inscale;
            plug_end_width_cnc:=od[7]/inscale;
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.chair_press_fit_buttonClick(Sender: TObject);

const
  str0:string='PRESS-FIT socket length adjustment 1. SHORT||This is to adjust the endways press fit of short chairs, such as bridge chairs (L1 chairs), in the sockets.'
             +' Because of differential shrinkage in 3D printing, these chairs may need more or less clearance than the standard chairs to achieve the same fit.'
             +'||This dimension controls the length of the socket and can be made more negative (for a tighter press fit) or more positive (for a looser fit).'
             +'||This dimension can be further modified by means of the `0press-fit adjust`1 slider.'
             +'||rp.gif  Do not use this setting to adjust the track gauge. If the gauge is wrong, change the shrinkage settings (3D printing) or CAD scaling (laser cutting).';

  str1:string='PRESS-FIT socket length adjustment 2. NORMAL||This is to adjust the endways press fit of the standard chairs in the sockets. It should be a close fit without end-play.'
             +'||This dimension controls the length of the socket and can be made more negative (for a tighter press fit) or more positive (for a looser fit).'
             +'||This dimension can be further modified by means of the `0press-fit adjust`1 slider.'
             +'||rp.gif  Do not use this setting to adjust the track gauge. If the gauge is wrong, change the shrinkage settings (3D printing) or CAD scaling (laser cutting).';

  str6:string='PRESS-FIT socket length adjustment 3. LONG||This is to adjust the endways press fit of longer chairs, such as slide chairs (P chairs), in the sockets.'
             +' Because of differential shrinkage in 3D printing, these chairs may need more or less clearance than the standard chairs to achieve the same fit.'
             +'||This dimension controls the length of the socket and can be made more negative (for a tighter press fit) or more positive (for a looser fit).'
             +'||This dimension can be further modified by means of the `0press-fit adjust`1 slider.'
             +'||rp.gif  Do not use this setting to adjust the track gauge. If the gauge is wrong, change the shrinkage settings (3D printing) or CAD scaling (laser cutting).';

  str7:string='PRESS-FIT socket length adjustment 4. VERY LONG||This is to adjust the endways press fit of very long chairs, such as switch heel chairs and crossing chairs, in the sockets.'
             +' Because of differential shrinkage in 3D printing, these chairs may need more or less clearance than the standard chairs to achieve the same fit.'
             +'||This dimension controls the length of the socket and can be made more negative (for a tighter press fit) or more positive (for a looser fit).'
             +'||This dimension can be further modified by means of the `0press-fit adjust`1 slider.'
             +'||rp.gif  Do not use this setting to adjust the track gauge. If the gauge is wrong, change the shrinkage settings (3D printing) or CAD scaling (laser cutting).';

  str2:string='PRESS-FIT socket width adjustment.||This is to adjust the sideways fit of the chairs in the sockets (i.e. measured in the direction along the rail). It should be an easy fit but without excessive side-play.'
             +'||Wider crossing timbers may need more or less clearance than ordinary sleepers to achieve the same fit.';

  str4:string='This is the depth of the socket when the `0blind sockets`1 option is in force. The default depth is equivalent to 8.41/64" inches full-size.';


var
  n:integer;
  od:Toutdim;

begin
  press_fit_radio.Checked:=True;

     putdim(str0,1,'PRESS-FIT :  short  socket  end  clearance  ( each  end )',press_short_socket_fit_ends,False,True,False,False);            // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str1,1,'PRESS-FIT :  normal  socket  end  clearance  ( each  end )',press_socket_fit_ends,False,True,False,False);                 // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str6,1,'PRESS-FIT :  long  socket  end  clearance  ( each  end )',press_long_socket_fit_ends,False,True,False,False);              // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str7,1,'PRESS-FIT :  very  long  socket  end  clearance  ( each  end )',press_very_long_socket_fit_ends,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str2,1,'PRESS-FIT :  socket  side  clearance  on  sleepers  ( each  side )',press_socket_fit_sides_sl,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str2,1,'PRESS-FIT :  socket  side  clearance  on  timbers  ( each  side )',press_socket_fit_sides_timb,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

  n:=putdim(str4,1,'socket  depth  ( blind  sockets )',socket_depth*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

  if n<>6 then EXIT;

  modify_prompt_font(0,2);  // reduce fonts for long captions ...   241b
  modify_prompt_font(1,3);
  modify_prompt_font(2,2);
  modify_prompt_font(3,3);
  
  modify_prompt_font(4,3);
  modify_prompt_font(5,3);

  if getdims('adjust  3D  socket  size  PRESS-FIT  ...','',dxf_form,n,od)=True
     then begin
            press_short_socket_fit_ends:=od[0];
            press_socket_fit_ends:=od[1];
            press_long_socket_fit_ends:=od[2];
            press_very_long_socket_fit_ends:=od[3];

            press_socket_fit_sides_sl:=od[4];
            press_socket_fit_sides_timb:=od[5];

            socket_depth:=od[6]/inscale;
          end;

  modify_prompt_font(0,-2);   // restore fonts ... 241b
  modify_prompt_font(1,-3);
  modify_prompt_font(2,-2);
  modify_prompt_font(3,-3);

  modify_prompt_font(4,-3);
  modify_prompt_font(5,-3);

end;
//______________________________________________________________________________

procedure Tdxf_form.chair_snap_fit_buttonClick(Sender: TObject);

const
  str1:string='    `0SNAP-FIT socket length adjustment`9'
             +'||This is to adjust the endways fit of the snap-fit chairs in the sockets. They should be a close fit without end-play.'
             +'||This dimension controls the length of the socket and can be reduced or made negative (for a tighter snap fit) or increased (for a looser fit).'
             +'||rp.gif  Do not use this setting to adjust the track gauge. If the gauge is wrong, change the shrinkage settings (3D printing) or CAD scaling (laser cutting).';

  str2:string='    `0SNAP-FIT socket width adjustment`9'
             +'||This is to adjust the sideways fit of the snap-fit chairs in the sockets (i.e. measured in the direction along the rail).'
             +'||For snap-fitting the socket walls need to flex to permit the chairs to be inserted. Some trial and error on this setting may be needed to achieve a working snap-fit.'
             +'||Because of the stiffer socket walls on wider crossing timbers, they may need more clearance than ordinary sleepers to achieve the same result.'
             +'||The end result after snap-fitting should be a close fitting chair without excessive side-play.';

  str3:string='Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
  snap_fit_radio.Checked:=True;

     putdim(str1,1,'SNAP-FIT :  socket  end  clearance  ( each  end )',snap_socket_fit_ends,False,True,False,False);            // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str2,1,'SNAP-FIT :  socket  side  clearance  on  sleepers  ( each  side )',snap_socket_fit_sides_sl,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str2,1,'SNAP-FIT :  socket  side  clearance  on  timbers  ( each  side )',snap_socket_fit_sides_timb,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str3,1,'SNAP-FIT :  amount  of  undercut  in  socket  wall',snap_socket_undercut*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str3,1,'SNAP-FIT :  depth  to  top  of  socket  undercut',snap_undercut_depth*inscale,True,True,False,False);     // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str3,1,'SNAP-FIT :  depth  to  bottom  of  socket  undercut',snap_clearcut_depth*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

  if n<>5 then EXIT;

  modify_prompt_font(1,3);     // reduce fonts for long captions ..   241b
  modify_prompt_font(2,3);

  if getdims('adjust  3D  socket  size  SNAP-FIT  ...','',dxf_form,n,od)=True
     then begin
            snap_socket_fit_ends:=od[0];

            snap_socket_fit_sides_sl:=od[1];
            snap_socket_fit_sides_timb:=od[2];

            snap_socket_undercut:=od[3]/inscale;
            snap_undercut_depth:=od[4]/inscale;
            snap_clearcut_depth:=od[5]/inscale;
          end;

  modify_prompt_font(1,-3);  // restore fonts ..   241b
  modify_prompt_font(2,-3);
end;
//______________________________________________________________________________

procedure Tdxf_form.chair_clip_fit_buttonClick(Sender: TObject);

const
  str1:string='    `0CLIP-FIT socket length adjustment`9'
             +'||This is to adjust the endways fit of the clip-fit chairs in the sockets. They should be a close fit without end-play.'
             +'||This dimension controls the length of the socket and can be reduced or made negative (for a tighter clip fit) or increased (for a looser fit).'
             +'||rp.gif  Do not use this setting to adjust the track gauge. If the gauge is wrong, change the shrinkage settings (3D printing) or CAD scaling (laser cutting).';

  str2:string='    `0CLIP-FIT socket width adjustment`9'
             +'||This is to adjust the sideways fit of the clip-fit chairs in the sockets (i.e. measured in the direction along the rail).'
             +'||The clip-fit clearance can be set differently for crossing timbers from ordinary sleepers if required.'
             +'||The end result after clip-fitting should be a close fitting chair without excessive side-play.';

  str3:string='Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
  clip_fit_radio.Checked:=True;

     putdim(str1,1,'CLIP-FIT :  socket  end  clearance  ( each  end )',clip_socket_fit_ends,False,True,False,False);            // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str2,1,'CLIP-FIT :  socket  side  clearance  on  sleepers  ( each  side )',clip_socket_fit_sides_sl,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str2,1,'CLIP-FIT :  socket  side  clearance  on  timbers  ( each  side )',clip_socket_fit_sides_timb,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str3,1,'CLIP-FIT :  amount  of  undercut  in  socket  wall',clip_socket_undercut*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str3,1,'CLIP-FIT :  depth  to  top  of  socket  undercut',clip_undercut_depth*inscale,True,True,False,False);     // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str3,1,'CLIP-FIT :  depth  to  bottom  of  socket  undercut',clip_clearcut_depth*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

  if n<>5 then EXIT;

  modify_prompt_font(1,3);     // reduce fonts for long captions ..   241b
  modify_prompt_font(2,3);

  if getdims('adjust  3D  socket  size  CLIP-FIT  ...','',dxf_form,n,od)=True
     then begin
            clip_socket_fit_ends:=od[0];

            clip_socket_fit_sides_sl:=od[1];
            clip_socket_fit_sides_timb:=od[2];

            clip_socket_undercut:=od[3]/inscale;
            clip_undercut_depth:=od[4]/inscale;
            clip_clearcut_depth:=od[5]/inscale;
          end;

  modify_prompt_font(1,-3);  // restore fonts ..   241b
  modify_prompt_font(2,-3);
end;

//______________________________________________________________________________

procedure Tdxf_form.press_fit_plug_depths_buttonClick(Sender: TObject);

const
  str5:string='PRESS-FIT :  This is the effective depth of the plug part below the chair base.';
  str8:string='PRESS-FIT :  This depth is slightly more than the effective depth to assist 3-D printing and break-off from the support pyramids.';
  str:string='PRESS-FIT :  Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str5,1,'PRESS-FIT :  effective  plug  depth',press_plug_total_depth*inscale,True,True,False,False);                    // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str8,1,'PRESS-FIT :  break - off  plug  depth  at  centre',press_plug_extended_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.  237a

     putdim(str,1,'PRESS-FIT :  plug  taper  start  depth',press_plug_taper_depth*inscale,True,True,False,False);           // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'PRESS-FIT :  plug  inset  start  depth',press_plug_inset_depth*inscale,True,True,False,False);           // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'PRESS-FIT :  plug  upper  inset  width',press_plug_inset_clear_upper*inscale,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'PRESS-FIT :  plug  bottom  inset  width',press_plug_inset_clear_bottom*inscale,False,True,False,False);  // negative ok, no preset, zero ok, don't terminate on zero.

  n:=putdim(str,1,'locator  plug  depth',locator_plug_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  if n<>6 then EXIT;

  if getdims('adjust  3-D  PRESS-FIT  plug  depths  and  tapers ...','',dxf_form,n,od)=True
     then begin
            press_plug_total_depth:=od[0]/inscale;
            press_plug_extended_depth:=od[1]/inscale;   // 237a

            press_plug_taper_depth:=od[2]/inscale;
            press_plug_inset_depth:=od[3]/inscale;

            press_plug_inset_clear_upper:=od[4]/inscale;
            press_plug_inset_clear_bottom:=od[5]/inscale;

            locator_plug_depth:=od[6]/inscale;
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.snap_fit_plug_depths_buttonClick(Sender: TObject);   // 241b

const
  str5:string='SNAP-FIT :  This is the effective depth of the plug part below the chair base.';
  str8:string='SNAP-FIT :  This depth is slightly more than the effective depth to assist 3-D printing and break-off from the support pyramids.';
  str:string='SNAP-FIT :  Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str5,1,'SNAP-FIT :  effective  plug  depth',snap_plug_total_depth*inscale,True,True,False,False);                    // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str8,1,'SNAP-FIT :  break - off  plug  depth  at  centre',snap_plug_extended_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.  237a

     putdim(str,1,'SNAP-FIT :  plug  taper  start  depth',snap_plug_taper_depth*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'SNAP-FIT :  plug  inset  start  depth',snap_plug_inset_depth*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'SNAP-FIT :  plug  tang  top  depth',snap_plug_overcut_depth*inscale,True,True,False,False);          // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'SNAP-FIT :  plug  tang  jut  width',snap_plug_overcut*inscale,False,True,False,False);                 // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'SNAP-FIT :  plug  upper  inset  width',snap_plug_inset_clear_upper*inscale,False,True,False,False);      // negative ok, no preset, zero ok, don't terminate on zero.
  n:=putdim(str,1,'SNAP-FIT :  plug  bottom  inset  width',snap_plug_inset_clear_bottom*inscale,False,True,False,False);    // negative ok, no preset, zero ok, don't terminate on zero.

  if n<>7 then EXIT;

  if getdims('adjust  3-D  SNAP-FIT  plug  depths  and  tapers ...','',dxf_form,n,od)=True
     then begin
            snap_plug_total_depth:=od[0]/inscale;
            snap_plug_extended_depth:=od[1]/inscale;   // 237a

            snap_plug_taper_depth:=od[2]/inscale;
            snap_plug_inset_depth:=od[3]/inscale;
            snap_plug_overcut_depth:=od[4]/inscale;

            snap_plug_overcut:=od[5]/inscale;

            snap_plug_inset_clear_upper:=od[6]/inscale;
            snap_plug_inset_clear_bottom:=od[7]/inscale;
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.clip_fit_plug_depths_buttonClick(Sender: TObject);   // 241b

const
  str5:string='CLIP-FIT :  This is the effective depth of the plug part below the chair base.';
  str8:string='CLIP-FIT :  This depth is slightly more than the effective depth to assist 3-D printing and break-off from the support pyramids.';
  str:string='CLIP-FIT :  Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str5,1,'CLIP-FIT :  effective  plug  depth',clip_plug_total_depth*inscale,True,True,False,False);                    // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str8,1,'CLIP-FIT :  break - off  plug  depth  at  centre',clip_plug_extended_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.  237a

     putdim(str,1,'CLIP-FIT :  plug  taper  start  depth',clip_plug_taper_depth*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'CLIP-FIT :  plug  inset  start  depth',clip_plug_inset_depth*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'CLIP-FIT :  plug  tang  top  depth',clip_tang_overcut_depth*inscale,True,True,False,False);          // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'CLIP-FIT :  plug  tang  jut  width',clip_tang_overcut*inscale,False,True,False,False);                 // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'CLIP-FIT :  plug  upper  inset  width',clip_plug_inset_clear_upper*inscale,False,True,False,False);     // negative ok, no preset, zero ok, don't terminate on zero.
  n:=putdim(str,1,'CLIP-FIT :  plug  bottom  inset  width',clip_plug_inset_clear_bottom*inscale,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

  if n<>7 then EXIT;

  if getdims('adjust  3-D  CLIP-FIT  plug  depths  and  tapers ...','',dxf_form,n,od)=True
     then begin
            clip_plug_total_depth:=od[0]/inscale;
            clip_plug_extended_depth:=od[1]/inscale;

            clip_plug_taper_depth:=od[2]/inscale;
            clip_plug_inset_depth:=od[3]/inscale;
            clip_tang_overcut_depth:=od[4]/inscale;

            clip_tang_overcut:=od[5]/inscale;

            clip_plug_inset_clear_upper:=od[6]/inscale;
            clip_plug_inset_clear_bottom:=od[7]/inscale;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.extend_plug_buttonClick(Sender: TObject);    // 241b

var
  n:integer;
  od:Toutdim;

  clip_extended_tang_depth:extended;  // inches full-size
  extend_by:extended;                 // inches full-size
  str:string;

begin
  str:='    `0extending  plug  depth  for  thin  materials`9'
      +'||The clip-fit plugs can be extended in depth so that the tangs can engage with the underside of thin timbers.'
      +'||Enter the thickness of the timbers. Some trial and error is likely to be needed, and/or adjustment to the resin shrinkage settings.'
      +'||If no other changes have been made to the plug depth settings, this can be undone by setting the dimension to '+FormatFloat('0.0#',clip_tang_default_depth*inscale)+' mm.';

  clip_extended_tang_depth:=clip_tang_overcut_depth;  // init

  n:=putdim(str,1,'CLIP-FIT :  extend  top  of  tang  down  to',clip_extended_tang_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('extend  3-D  CLIP-FIT  tang  depth  for  thin  materials ...','',dxf_form,n,od)=True
     then begin
            clip_extended_tang_depth:=od[0]/inscale;

            extend_by:=clip_extended_tang_depth-clip_tang_overcut_depth;

            clip_plug_total_depth:=clip_plug_total_depth+extend_by;
            clip_plug_extended_depth:=clip_plug_extended_depth+extend_by;

            clip_plug_taper_depth:=clip_plug_taper_depth+extend_by;
            clip_plug_inset_depth:=clip_plug_inset_depth+extend_by;
            clip_tang_overcut_depth:=clip_tang_overcut_depth+extend_by;

            clip_tang_roof_front_depth:=clip_tang_roof_front_depth+extend_by;
            clip_tang_roof_back_depth:=clip_tang_roof_back_depth+extend_by;

            clip_tang_floor_depth:=clip_tang_floor_depth+extend_by;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.supports_buttonClick(Sender: TObject);

const
  str:string='please refer to Templot Club user forum';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'chair  support  pyramid  height  (low)',pyramid_height_low,True,True,False,False);          // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'chair  support  pyramid  height  (high)',pyramid_height_high,True,True,False,False);        // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'chair  support  pyramid  top  side  inset  from  centre',pyramid_top_side_inset*inscale,False,True,False,False);      // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'chair  support  pyramid  top  end  inset  from  plug',pyramid_top_end_inset*inscale,False,True,False,False);          // negative ok, no preset, zero ok, don't terminate on zero.

  n:=putdim(str,1,'loose-jaw  support  pyramid  height',pyramid_height_pin,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.


  if n<>4 then EXIT;

  if getdims('3-D  chair  supports ...','',dxf_form,n,od)=True
     then begin
            pyramid_height_low:=od[0];
            pyramid_height_high:=od[1];

            pyramid_top_side_inset:=od[2]/inscale;
            pyramid_top_end_inset:=od[3]/inscale;

            pyramid_height_pin:=od[4];   // 236d
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.rafts_buttonClick(Sender: TObject);

const
  str:string='please refer to Templot Club user forum';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'support  raft  flange  overhang',raft_flange,True,True,False,False); // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'support  raft  thickness',raft_thick*2,True,True,False,False);       // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'support  raft  label  text  height',raft_label_char_thickness,True,True,False,False);   // negative no, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'bed  of  nails  height',nails_height,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'nails  top  radius',nails_toprad,True,True,False,False);             // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'nails  bottom  radius',nails_botrad,True,True,False,False);          // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'nails  spacing  on  X',nailx_spacing,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str,1,'nails  spacing  on  Y',naily_spacing,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.

  if n<>7 then EXIT;

  if getdims('3-D  raft  dimensions ...','',dxf_form,n,od)=True
     then begin
            raft_flange:=od[0];     // mm
            raft_thick:=od[1]/2;    // mm thickness of each layer

            raft_label_char_thickness:=od[2];

            nails_height:=od[3];    // mm

            nails_toprad:=od[4];    // mm
            nails_botrad:=od[5];    // mm

            nailx_spacing:=od[6];   // mm
            naily_spacing:=od[7];   // mm


          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.plate_thickness_buttonClick(Sender: TObject);

const
  str:string='please refer to Templot Club user forum';

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim(str,1,'2D  alignment  plate  thickness',alignment_plate_thick_mm,True,True,True,False); // no negative, no preset, no zero, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('2D  alignment  plate  thickness ...','',dxf_form,n,od)=True
     then begin
            alignment_plate_thick_mm:=od[0];
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.set_custom_rail_buttonClick(Sender: TObject);

const
  str:string='please refer to Templot Club user forum';

var
  n:integer;
  od:Toutdim;

begin
  with math_form do begin
    Caption:='    custom  rail  section ...';
    big_label.Caption:=insert_crlf_str('||Before entering the dimensions for your custom rail section, be sure you have set your model gauge/scale for use with this rail.'

                                     +'|||Your dimensions measured from the rail will be converted to the equivalent full-size prototype dimensions for internal use.'
                                     +'||Enter your rail measurements in mm. To enter the dimensions in inches instead, prefix them with a letter i.'

                                     +'||To enter prototype dimensions in inches instead of model dimesions, prefix the dimensions with the letter P.'
                                     +' To enter prototype dimensions in mm, prefix the dimensions with the letters PM.'

                                     +'|||But first enter below a short name for your custom rail section.');

    math_editbox.Text:=custom_section_name_str;

    do_show_modal(math_form);

    Caption:='    TEMPLOT';   // reset math_form caption.

    if ModalResult=mrOK
       then begin
              custom_section_name_str:=Trim(math_editbox.Text);
            end
       else EXIT;

  end;//with

     putdim(str,1,       'overall  section  height',custom_rail_depth*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,               'head  width',custom_rail_head_width*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1, 'rail-head  corner  radius',custom_rail_corner_rad*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,               'foot  width',custom_rail_foot_width*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,             'web  thickness',custom_rail_web_thick*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,      'fish  centre  from  top',custom_rail_web_top*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'fish  centre  from  bottom',custom_rail_web_bottom*inscale,  True,True,False,False);      // no negative, no preset, zero ok, don't terminate on zero.

  n:=putdim(str,0,                  'fish  angle  1: ',custom_rail_fish_angle,  True,True,True,False);       // no negative, no preset, no zero, don't terminate on zero.

  if n<>7 then EXIT;

  if getdims('3-D  custom  rail  section ...','',dxf_form,n,od)=True
     then begin
                  custom_rail_depth:=od[0]/inscale;
             custom_rail_head_width:=od[1]/inscale;
             custom_rail_corner_rad:=od[2]/inscale;
             custom_rail_foot_width:=od[3]/inscale;
              custom_rail_web_thick:=od[4]/inscale;
                custom_rail_web_top:=od[5]/inscale;
             custom_rail_web_bottom:=od[6]/inscale;
             custom_rail_fish_angle:=od[7];
          end;

  if custom_rail_fish_angle<minfp then custom_rail_fish_angle:=2.75;    // no div by zero

  custom_rail_radiobutton.Caption:='custom: '+custom_section_name_str;
  custom_rail_radiobutton.Checked:=True;
end;
//______________________________________________________________________________

procedure Tdxf_form.load_custom_buttonClick(Sender: TObject);

begin
  load_custom_3d_data('');
end;
//______________________________________________________________________________

procedure Tdxf_form.save_custom_buttonClick(Sender: TObject);

begin
  save_custom_3d_data;
end;
//______________________________________________________________________________

procedure Tdxf_form.timber_depth_buttonClick(Sender: TObject);

const
  str:string='For FDM 3D printing, timbering depths need to match the layer setting in your slicing software. Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'3-D  full  timber  depth  ( thickness )',timber_thick*inscale,True,True,False,False);          // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'3-D  timber  web / flange  depth  ( thickness )',flange_depth*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'3-D  timber  side  flange  width',side_flange_width_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'3-D  timber  end  flange  width',end_flange_width*inscale,True,True,False,False);     // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'3-D  timber  web  integrity  overlap',web_integrity_overlap*inscale,False,True,False,False);        // negative ok, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'3-D  timber  flange  integrity  overlap',flange_integrity_overlap*inscale,False,True,False,False);  // negative ok, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'3-D  width  of  rebate  around  sockets',socket_chamfer*inscale,True,True,False,False);        // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str,1,'3-D  depth  of  rebate  around  sockets',socket_chamfer_depth*inscale,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

  if n<>7 then EXIT;

  if getdims('3-D  timbering  sizes ...','',dxf_form,n,od)=True
     then begin
            timber_thick:=od[0]/inscale;

            flange_depth:=od[1]/inscale;
            side_flange_width_mm:=od[2];  // /inscale;    244d
            end_flange_width:=od[3]/inscale;

            web_integrity_overlap:=od[4]/inscale;
            flange_integrity_overlap:=od[5]/inscale;

            socket_chamfer:=od[6]/inscale;
            socket_chamfer_depth:=od[7]/inscale;
          end;

  redraw(True);     // show flanges
end;
//______________________________________________________________________________

procedure Tdxf_form.drive_ribs_buttonClick(Sender: TObject);    // 243b

const
  str1:string='Please refer to the Templot Club user forum.';
  str2:string='For FDM 3D printing, timbering depths need to match the layer setting in your slicing software. Please refer to the Templot Club user forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str1,1,'3-D  switch  drive  rib  width',               switch_slider_rib_width_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str2,1,'3-D  switch  drive  rib  top  depth',      switch_slider_rib_top_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str2,1,'3-D  switch  drive  rib  mid  depth',      switch_slider_rib_mid_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str2,1,'3-D  switch  drive  rib  bottom  depth',switch_slider_rib_bottom_depth*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  if n<>3 then EXIT;

  if getdims('3-D  switch  drive  ribs ...','',dxf_form,n,od)=True
     then begin
            switch_slider_rib_width_mm:=od[0]; //  /inscale;

            switch_slider_rib_top_depth:=od[1]/inscale;
            switch_slider_rib_mid_depth:=od[2]/inscale;
            switch_slider_rib_bottom_depth:=od[3]/inscale;
          end;

  redraw(True);     // show ribs
end;
//______________________________________________________________________________

procedure Tdxf_form.soleplate_size_buttonClick(Sender: TObject);      // 236b

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',2,'3-D  soleplate  thickness  ( full-size  inches )',soleplate_thick,True,True,False,False);     // no negative, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',2,'3-D  soleplate  width  ( full-size  inches )',soleplate_width,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim('please refer to Templot Club forum',2,'3-D  soleplate  end  rib  size  ( full-size  inches )',soleplate_rib,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

  if n<>2 then EXIT;

  if getdims('3-D  switch  soleplate  size ...','',dxf_form,n,od)=True
     then begin
            soleplate_thick:=od[0];
            soleplate_width:=od[1];
            soleplate_rib:=od[2];
          end;

  redraw(True);     // show changes
end;
//______________________________________________________________________________

procedure Tdxf_form.splints_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'3-D  brick  splints  depth  ( thickness )',splint_depth*inscale,True,True,False,False);      // negative no, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'3-D  brick  splints  width',splint_width*inscale,True,True,False,False);                     // negative no, no preset, zero ok, don't terminate on zero.

     putdim('please refer to Templot Club forum',1,'3-D  brick  slabs  depth  ( thickness )',slab_depth*inscale,True,True,False,False);          // negative no, no preset, zero ok, don't terminate on zero.

     putdim('please refer to Templot Club forum',1,'3-D  brick  label  tab  width',label_tab_width*inscale,True,True,False,False);                        // negative no, no preset, zero ok, don't terminate on zero.

  n:=putdim('please refer to Templot Club forum',1,'3-D  brick  label  tab  text  height',label_char_thickness*inscale,True,True,False,False);           // negative no, no preset, zero ok, don't terminate on zero.

  if n<>4 then EXIT;

  if getdims('3-D  brick  splints  /  label  /  slabs ...','',dxf_form,n,od)=True
     then begin
            splint_depth:=od[0]/inscale;
            splint_width:=od[1]/inscale;

            slab_depth:=od[2]/inscale;

            label_tab_width:=od[3]/inscale;

            label_char_thickness:=od[4]/inscale;
          end;

  redraw(True);     // show line shapes as splints
end;
//______________________________________________________________________________

procedure Tdxf_form.webs_sprues_buttonClick(Sender: TObject);    // 235a

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'3-D  web  width  normal',web_width*inscale,True,True,False,False);              // no negative, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'3-D  web  width  flexi-track',web_width_flexi*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

     putdim('please refer to Templot Club forum',1,'3-D  sprue  depth  ( thickness )',sprue_thick*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'3-D  sprue  length',sprue_length*inscale,True,True,False,False);                // no negative, no preset, zero ok, don't terminate on zero.

     putdim('please refer to Templot Club forum',1,'3-D  sprue  width',sprue_width*inscale,True,True,False,False);                  // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim('please refer to Templot Club forum',1,'3-D  sprue  runner  width',sprue_runner_width*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  if n<>5 then EXIT;

  if getdims('3-D  webs  and  sprues ...','',dxf_form,n,od)=True
     then begin
            web_width:=od[0]/inscale;
            web_width_flexi:=od[1]/inscale;

            sprue_thick:=od[2]/inscale;
            sprue_length:=od[3]/inscale;
            sprue_width:=od[4]/inscale;
            sprue_runner_width:=od[5]/inscale;
          end;

  redraw(True);     // show webs/sprues
end;
//______________________________________________________________________________

procedure Tdxf_form.dropper_ridge_buttonClick(Sender: TObject);      // 241f

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'dropper-wire  ridge  space  at  top',dropper_ridge_spacing_top_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'dropper-wire  ridge  space  at  bottom',dropper_ridge_spacing_bottom_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  n:=putdim('please refer to Templot Club forum',1,'dropper-wire  ridge  height',dropper_ridge_height*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  if n<>2 then EXIT;

  if getdims('3-D  dropper-wire  ridges ...','',dxf_form,n,od)=True
     then begin
            dropper_ridge_spacing_top_mm:=od[0];
            dropper_ridge_spacing_bottom_mm:=od[1];

            dropper_ridge_height:=od[2]/inscale;
          end;

  redraw(True);     // show ridges
end;
//______________________________________________________________________________

procedure Tdxf_form.clips_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'3-D  connector  clip  overall  depth  ( thickness )',clip_depth_mm,True,True,False,False);       // no negative, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'3-D  connector  clip  bottom  depth  ( thickness )',clip_foot_depth_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'3-D  connector  clip  bottom  offset',clip_foot_offset_mm,False,True,False,False);               // negative ok, no preset, zero ok, don't terminate on zero.

     putdim('please refer to Templot Club forum',1,'3-D  connector  tommy  bar  corner  relief',clip_top_corner_mm,True,True,False,False);           // no negative, no preset, zero ok, don't terminate on zero.

     putdim('please refer to Templot Club forum',1,'3-D  connector  claw / bar  end  clearance',clip_ends_clear*inscale,False,True,False,False);     // negative ok, no preset, zero ok, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'3-D  connector  claw / bar  side  clearance',clip_sides_clear*inscale,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

  n:=putdim('please refer to Templot Club forum',1,'3-D  connector  clip  hole  size',clip_hole_mm,True,True,False,False);                           // no negative, no preset, zero ok, don't terminate on zero.

  if n<>6 then EXIT;

  if getdims('3-D  brick  connector  clip ...','',dxf_form,n,od)=True
     then begin
            clip_depth_mm:=od[0];
            clip_foot_depth_mm:=od[1];
            clip_foot_offset_mm:=od[2];

            clip_top_corner_mm:=od[3];

            clip_ends_clear:=od[4]/inscale;
            clip_sides_clear:=od[5]/inscale;

            clip_hole_mm:=od[6];
          end;

  redraw(True);     // show target marks as clips
end;
//______________________________________________________________________________

procedure Tdxf_form.kerf_buttonClick(Sender: TObject);

const
  str:string='    `02-D  cutter kerf  width`9'
            +'||Enter the width of the 2-D cutter kerf in mm. This is the width of the slot made by the cutter.'
            +'||In 2-D files the timber outline and chair socket outlines will be adjusted all round by half the entered dimension.'
            +' The adjusted data will be exported in the `0timber outlines (kerf)`1 and `0chair sockets (kerf)`1 DXF layers.'
            +'||If a positive dimension is entered, the cutter is assumed to be outside the timber outline and inside the socket outline.'
            +'||If zero is entered, no adjustment for the cutter kerf will be made.'
            +'||After changing this setting, you must rebuild the background templates for the change to take effect.'
            +'||Do not use this setting to adjust the fit of the chair plug in the socket - adjust this setting to achieve the correct timber outline size, and then click the `0chair/socket fit...`1 button.'
            +'||This setting has no effect in 3-D files.';
var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'2-D  cutter  kerf  width',cutter_kerf_mm,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

  n:=putdim('Please refer to the Templot Club user forum.',1,'2-D  socket  undercut  extra  kerf  ( each  side )',kerf_extra_undercut_mm,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

  if n<>1 then EXIT;

  if getdims('2-D  cutter  kerf  widths ...','',dxf_form,n,od)=True
     then begin
            cutter_kerf_mm:=od[0];
            kerf_extra_undercut_mm:=od[1];
          end;

  redraw(True);     // show kerf lines
end;
//______________________________________________________________________________

procedure Tdxf_form.filing_jig_radioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if filing_jig_radio.Checked=True
     then begin
            _3d_fdm_radiobutton.Checked:=True;    // assume FDM for filing jigs
            _3d_options_click(False);

            all_option_radio.Checked:=True;           // by-pass brick/group alerts

            _3d:=True;
            file_type_groupbox.Enabled:=True;
            dxf_radio.Enabled:=True;
            stl_radio.Enabled:=True;
            dxf_stl_both_radio.Enabled:=True;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.tweezer_tips_radioMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  if tweezer_tips_radio.Checked=True
     then begin
            _3d_resin_radiobutton.Checked:=True;    // assume resin printing for filing jigs
            _3d_options_click(False);

            all_option_radio.Checked:=True;           // by-pass brick/group alerts

            _3d:=True;
            file_type_groupbox.Enabled:=True;
            dxf_radio.Enabled:=True;
            stl_radio.Enabled:=True;
            dxf_stl_both_radio.Enabled:=True;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.fret_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim('please refer to Templot Club forum',1,'3-D  timber  flange  clearance',flange_offset*inscale,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('3-D  timbering  fret ...','',dxf_form,n,od)=True
     then begin
            flange_offset:=od[0]/inscale;
          end;
end;
//______________________________________________________________________________

procedure set_all_combo_colours(colour:integer);

begin
  with dxf_form do begin

    // radcentres_combo   default always out - otherwise CAD progs scale down extents to fit
    // sprues_combo  default off
    // sleeperend_combo  default off   233c

    rails_combo.ItemIndex:=colour;
    adjrails_combo.ItemIndex:=colour;
    tkclines_combo.ItemIndex:=colour;
    timbout_combo.ItemIndex:=colour;
    timbout_kerf_combo.ItemIndex:=colour;
    timbcent_combo.ItemIndex:=colour;
    tbnum_combo.ItemIndex:=colour;
    gmarks_combo.ItemIndex:=colour;
    radmarks_combo.ItemIndex:=colour;
    joints_combo.ItemIndex:=colour;
    shapes_bgnd_combo.ItemIndex:=colour;
    dot_bgnd_combo.ItemIndex:=colour;
    text_combo.ItemIndex:=colour;
    chairs_combo.ItemIndex:=colour;
    chair_bolts_combo.ItemIndex:=colour;
    sockets_combo.ItemIndex:=colour;
    sockets_kerf_combo.ItemIndex:=colour;
    flanges_combo.ItemIndex:=colour;
    soleplates_combo.ItemIndex:=colour;
    webs_combo.ItemIndex:=colour;
    splints_combo.ItemIndex:=colour;
    clips_combo.ItemIndex:=colour;
    symbols_combo.ItemIndex:=colour;
    dropper_id_combo.ItemIndex:=colour;

  end;//with
end;
//______________________________________________________________________________

procedure Tdxf_form.omit_all_buttonClick(Sender:TObject);

begin
  set_all_combo_colours(0);
end;
//______________________________________________________________________________

procedure Tdxf_form.all_black_buttonClick(Sender: TObject);

begin
  set_all_combo_colours(7);
end;
//______________________________________________________________________________

procedure Tdxf_form.all_red_buttonClick(Sender: TObject);

begin
  set_all_combo_colours(1);
end;
//______________________________________________________________________________

procedure Tdxf_form.all_blue_buttonClick(Sender: TObject);

begin
  set_all_combo_colours(5);
end;
//______________________________________________________________________________

procedure Tdxf_form.combo_colour_defaults_buttonClick(Sender:TObject);

begin
  radcentres_combo.ItemIndex:=0;   // omit      otherwise CAD progs scale down to fit on loading.

  sprues_combo.ItemIndex:=0;       // omit      default off

  sleeperend_combo.ItemIndex:=0;   // omit      default off     233c

  rails_combo.ItemIndex:=7;        // black
  adjrails_combo.ItemIndex:=8;     // grey
  tkclines_combo.ItemIndex:=6;     // magenta
  timbout_combo.ItemIndex:=14;     // brown timber outline                       colour not used in 3-D
  timbout_kerf_combo.ItemIndex:=3; // green timber laser kerf outline  2nd cut   colour not used in 3-D
  timbcent_combo.ItemIndex:=4;     // cyan
  tbnum_combo.ItemIndex:=3;        // green
  gmarks_combo.ItemIndex:=1;       // red
  radmarks_combo.ItemIndex:=3;     // green
  joints_combo.ItemIndex:=7;       // black
  shapes_bgnd_combo.ItemIndex:=11; // orange
  dot_bgnd_combo.ItemIndex:=1;     // red
  text_combo.ItemIndex:=5;         // blue
  chairs_combo.ItemIndex:=11;      // orange
  chair_bolts_combo.ItemIndex:=12; // maroon
  sockets_combo.ItemIndex:=9;      // silver
  sockets_kerf_combo.ItemIndex:=5; // blue chair sockets laser kerf outline 1st cut    colour not used in 3-D
  flanges_combo.ItemIndex:=8;      // grey
  soleplates_combo.ItemIndex:=12;  // maroon
  webs_combo.ItemIndex:=8;         // grey
  splints_combo.ItemIndex:=8;      // grey
  clips_combo.ItemIndex:=3;        // green
  symbols_combo.ItemIndex:=11;     // orange
  dropper_id_combo.ItemIndex:=11;  // orange
end;
//______________________________________________________________________________

procedure Tdxf_form.marker_colour_panelClick(Sender: TObject);

begin
  marker_colour_panel.Color:=get_colour('set  the  marker  colour  to  select  which  templates  will  be  included  in  the  brick',marker_colour_panel.Color);

  brick_option_radio.Checked:=True;  // assume he wants the brick
end;
//______________________________________________________________________________

procedure Tdxf_form.grbl_buttonClick(Sender: TObject);     // 228b

const
  header_str:string='G90'+#13+#10+'G1Z2.0F100.0'+#13+#10+'M3S';

var
  n:integer;
  s,mf_str,grbl_str:string;

  grbl_list:TStringList;

begin
  with grbl_file_dialog do begin

    if user_load_custom_path=''
       then InitialDir:=exe_str+'DXF-FILES\'
       else InitialDir:=user_load_custom_path;

    Title:='    modify  G  code  file  for  GRBL ...';
    Filter:='G code (.nc)|*.nc';
    DefaultExt:='.nc';

  end;//with

  if grbl_file_dialog.Execute=True
     then grbl_str:=grbl_file_dialog.FileName
     else EXIT;

  if FileExists(grbl_str)=False
     then begin
            show_modal_message('error: file does not exist');
            user_load_custom_path:='';
            EXIT;
          end
     else user_load_custom_path:=ExtractFilePath(grbl_str);  // for next time


  if alert(7,'    modify  for  GRBL',
             'Do you want to modify G code in this file:||`0'+grbl_str+'`f||for GRBL CNC machine ?',
            '','','','','no  -  cancel','yes',0)=5
     then EXIT;

  grbl_list:=TStringList.Create;

  grbl_list.LoadFromFile(grbl_str);

  s:=grbl_list.Text;

  n:=POS('M03S',s);

  if n>0
     then begin
            Delete(s,1,n+3);

            s:=header_str+s;

            s:=StringReplace(s,'S',' S',[rfReplaceAll]);
            s:=StringReplace(s,'F',' F',[rfReplaceAll]);
            s:=StringReplace(s,'X',' X',[rfReplaceAll]);
            s:=StringReplace(s,'Y',' Y',[rfReplaceAll]);
            s:=StringReplace(s,'Z',' Z',[rfReplaceAll]);

            s:=StringReplace(s,'G1'+#10,'',[rfReplaceAll]);       // remove blank lines
            s:=StringReplace(s,'G1'+#13+#10,'',[rfReplaceAll]);   // remove blank lines

            s:=StringReplace(s,'M05','G0 X0.0 Y0.0'+#13+#10+'M5',[]);   // return to zero, spindle off
            s:=StringReplace(s,'M02','M2',[]);                          // program end


            s:=AdjustLineBreaks(s);

            grbl_list.Text:=s;

            mf_str:=StringReplace(grbl_str,'.','_modified.',[]);  // modified file name

            grbl_list.SaveToFile(mf_str);

            show_modal_message(grbl_str+#13+#13+'modified and saved to:'+#13+#13+mf_str);

          end
     else show_modal_message(grbl_str+#13+#13+'error: file unidentified or already modified');

  grbl_list.Free;
end;
//______________________________________________________________________________

procedure Tdxf_form.minibo_buttonClick(Sender: TObject);     // 232c

  // adjust X and Y for backlash

var
  mf_str,mbo_str:string;

  mbo_list:TStringList;

                    ////////////////////////////////////////////////////////////

                    procedure modify_axis(axis_str:string; bl:extended);

                       // bl=backlash mm

                    var
                      n,i:integer;
                      s:string;
                      last,next:extended;
                      rel,going_back:boolean;

                    begin
                      next:=0;   // init...
                      last:=0;
                      rel:=False;
                      going_back:=False;

                      for n:=0  to (mbo_list.Count-1) do begin

                        s:=TRIM(mbo_list.Strings[n]);

                        if s='' then CONTINUE;  // blank line

                        if POS('G28',s)>0 then CONTINUE;  // homing

                        i:=POS(';',s);

                        if i>0            // line contains a comment
                           then begin
                                  if i<3 then CONTINUE;  // comment line only
                                  s:=Copy(s,1,i-1);      // copy up to comment
                                end;

                        if (rel=False) and (POS('G91',s)>0)
                           then begin
                                  rel:=True;       // change to relative dimensioning
                                  CONTINUE;
                                end;

                        if (rel=True) and (POS('G90',s)>0)
                           then begin
                                  rel:=False;      // change to absolute dimensioning
                                  CONTINUE;
                                end;

                        if rel=True then CONTINUE; // ignore while relative dimensioning is in force

                        i:=POS(axis_str,s);  // find co-ord value

                        if i=0 then CONTINUE;  // not in this line

                        Delete(s,1,i);  // remove up to and including

                        s:=s+' ';      // add a teminator space if none

                        i:=POS(' ',s);

                        s:=Copy(s,1,i-1);  // get the value string

                        try
                          next:=StrToFloat(s);
                        except
                          CONTINUE;  // something wrong, ignore this line
                        end;

                        if axis_str<>'Z'
                           then begin

                                  if (next<last)                               // moving back
                                  or ( (going_back=True) and (next=last) )
                                     then begin
                                            going_back:=True;
                                            mbo_list.Strings[n]:=StringReplace(mbo_list.Strings[n],axis_str+s,axis_str+FormatFloat('0.######',next-bl),[]);    // modify the value
                                          end
                                     else going_back:=False;

                                  last:=next;
                                end
                           else begin
                                  if next>0.31 then mbo_list.Strings[n]:=StringReplace(mbo_list.Strings[n],axis_str+s,axis_str+FormatFloat('0.######',next+bl),[]);    // increase Z throughout (never reverses after first 0.3mm layer)
                                end;

                      end;//next n

                    end;
                    ////////////////////////////////////////////////////////////


begin
  with grbl_file_dialog do begin

    if user_load_custom_path=''
       then InitialDir:=exe_str+'DXF-FILES\'
       else InitialDir:=user_load_custom_path;

    Title:='    modify  G  code  file  for  MINIBO ...';
    Filter:='G code (.gcode)|*.gcode';
    DefaultExt:='.gcode';

  end;//with

  if grbl_file_dialog.Execute=True
     then mbo_str:=grbl_file_dialog.FileName
     else EXIT;

  if FileExists(mbo_str)=False
     then begin
            show_modal_message('error: file does not exist');
            user_load_custom_path:='';
            EXIT;
          end
     else user_load_custom_path:=ExtractFilePath(mbo_str);  // for next time


  if alert(7,'    modify  for  MINIBO',
             'Do you want to modify G code in this file:||`0'+mbo_str+'`f||for MINIBO 3D printer ?',
            '','','','','no  -  cancel','yes',0)=5
     then EXIT;

  mbo_list:=TStringList.Create;

  mbo_list.LoadFromFile(mbo_str);

  if mbo_list.Count<1
     then begin
            show_modal_message(mbo_str+#13+#13+'error: not a GCODE file');
            mbo_list.Free;
            EXIT;
          end;

  if POS('G20',mbo_list.Text)>0
     then begin
            show_modal_message(mbo_str+#13+#13+'error: file contains INCH dimensions');
            mbo_list.Free;
            EXIT;
          end;

  if bl_x<>0 then modify_axis('X',bl_x);

  if bl_y<>0 then modify_axis('Y',bl_y);

  if bl_z<>0 then modify_axis('Z',bl_z);

  mf_str:=StringReplace(mbo_str,'.','_modified.',[]);  // modified file name

  mbo_list.SaveToFile(mf_str);

  show_modal_message(mbo_str+#13+#13+'modified and saved to:'+#13+#13+mf_str);

  mbo_list.Free;
end;
//______________________________________________________________________________

procedure Tdxf_form.minibo_backlash_buttonClick(Sender: TObject);

const
  str:string='    `03D  printer  backlash  correction`9'
            +'||This function is primarily intended for backlash corrections on small 3D printers which do not support the M425 GCODE command.'
            +'||Enter a dimension in mm corresponding to the amount of backlash-error found on the relevant axis.'
            +'||This dimension will be used to modify the G-CODE file selected by clicking the `0modify G-CODE for 3D printer`z button.'
            +'||The correction required will be typically in the range 0.1mm - 0.5mm. The maximum Templot will accept is 2.0mm. Entering zero will disable corrections on that axis.'
            +'||For this function to work, the file must be formatted for absolute dimensioning in mm.'
            +'||CAUTION: Do not use this function on files formatted in inches.'
            +'||For more information please refer to the Templot Club forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'3D  printer  backlash  correction  on  X-axis',bl_x,True,True,False,False);   // no neg, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'3D  printer  backlash  correction  on  Y-axis',bl_y,True,True,False,False);   // no neg, no preset, zero ok, don't terminate on zero.
  n:=putdim(str,1,'3D  printer  backlash  correction  on  Z-axis',bl_z,True,True,False,False);   // no neg, no preset, zero ok, don't terminate on zero.

  if n<>2 then EXIT;

  if getdims('3D  printer  backlash  correction ...',str,dxf_form,n,od)=True
     then begin
            bl_x:=ABS(od[0]); if bl_x>2.0 then bl_x:=2.0;
            bl_y:=ABS(od[1]); if bl_y>2.0 then bl_y:=2.0;
            bl_z:=ABS(od[2]); if bl_z>2.0 then bl_z:=2.0;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.fdm_filament_buttonClick(Sender: TObject);     // 241c

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim('Please refer to the Templot Club forum.',1,'3D  printer  filament  diameter',filament_dia_mm,True,True,True,False);                      // no neg, no preset, no zero, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('FDM  3D  printer  filament  adjustments','',dxf_form,n,od)=True
     then begin
            filament_dia_mm:=od[0];            // 241c
          end;

  filament_checkbox.Checked:=True;    // assume she wants adjustments

  _3d_fdm_radiobutton.Checked:=True;    // assume FDM
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));

end;
//______________________________________________________________________________

procedure Tdxf_form.fdm_shrinkage_buttonClick(Sender: TObject);

const
  fdm_hot_str:string='    `0heated-bed  FDM  3D  printer  sizing  adjustments`9'
            +'||Enter the % adjustment needed to achieve the correct finished size on your FDM (filament) 3D printer having a heated build plate.'
            +'||To increase the finished size enter a more positive value. To reduce the finished size enter a less positive or negative value.'
            +'||To disable shrinkage adjustments enter zero.'
            +'||rp.gif Normally no adjustment is made to the Z-dimensions for FDM printing, so that the layer settings in the slicer can correspond to the component dimensions exactly.'
            +'||For more information please refer to the Templot Club forum.';

  fdm_cold_str:string='    `0cold-bed  FDM  3D  printer  sizing  adjustments`9'
            +'||Enter the % adjustment needed to achieve the correct finished size on your FDM (filament) 3D printer having a cold (unheated) build plate.'
            +'||To increase the finished size enter a more positive value. To reduce the finished size enter a less positive or negative value.'
            +'||To disable shrinkage adjustments enter zero.'
            +'||rp.gif Normally no adjustment is made to the Z-dimensions for FDM printing, so that the layer settings in the slicer can correspond to the component dimensions exactly.'
            +'||For more information please refer to the Templot Club forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(fdm_hot_str,4,'heated-bed  FDM  printer  adjustment  on  X-axis',(fdm_hot_shrinkage_x-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.
     putdim(fdm_hot_str,4,'heated-bed  FDM  printer  adjustment  on  Y-axis',(fdm_hot_shrinkage_y-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.
  n:=putdim(fdm_hot_str,4,'heated-bed  FDM  printer  adjustment  on  Z-axis',(fdm_hot_shrinkage_z-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.

  if n<>2 then EXIT;

  if getdims('heated-bed  FDM  3D  printer  shrinkage  adjustments','',dxf_form,n,od)=True
     then begin
            fdm_hot_shrinkage_x:=1+od[0]/100;
            fdm_hot_shrinkage_y:=1+od[1]/100;
            fdm_hot_shrinkage_z:=1+od[2]/100;
          end;

     putdim(fdm_cold_str,4,'cold-bed  FDM  printer  adjustment  on  X-axis',(fdm_cold_shrinkage_x-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.
     putdim(fdm_cold_str,4,'cold-bed  FDM  printer  adjustment  on  Y-axis',(fdm_cold_shrinkage_y-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.
  n:=putdim(fdm_cold_str,4,'cold-bed  FDM  printer  adjustment  on  Z-axis',(fdm_cold_shrinkage_z-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.

  if n<>2 then EXIT;

  if getdims('cold-bed  FDM  3D  printer  shrinkage  adjustments','',dxf_form,n,od)=True
     then begin
            fdm_cold_shrinkage_x:=1+od[0]/100;
            fdm_cold_shrinkage_y:=1+od[1]/100;
            fdm_cold_shrinkage_z:=1+od[2]/100;
          end;

  _3d_fdm_radiobutton.Checked:=True;    // assume FDM
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));

end;
//______________________________________________________________________________

procedure Tdxf_form.resin_shrinkage_buttonClick(Sender: TObject);

const
  resin_str:string='    `0resin  3D  printer  shrinkage  adjustments`9'
            +'||Enter the % shrinkage adjustment needed to achieve the correct finished size on your resin 3D printer.'
            +'||To increase the finished size enter a more positive value. To reduce the finished size enter a less positive or negative value.'
            +'||To disable shrinkage adjustments enter zero.'
            +'||For more information please refer to the Templot Club forum.';

var
  n:integer;
  od:Toutdim;

begin
     putdim(resin_str,4,'resin  printer  shrinkage  adjustment  on  X-axis',(resin_shrinkage_x-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.
     putdim(resin_str,4,'resin  printer  shrinkage  adjustment  on  Y-axis',(resin_shrinkage_y-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.
  n:=putdim(resin_str,4,'resin  printer  shrinkage  adjustment  on  Z-axis',(resin_shrinkage_z-1)*100,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.

  if n<>2 then EXIT;

  if getdims('resin  3D  printer  shrinkage  adjustments','',dxf_form,n,od)=True
     then begin
            resin_shrinkage_x:=1+od[0]/100;
            resin_shrinkage_y:=1+od[1]/100;
            resin_shrinkage_z:=1+od[2]/100;
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.zoom_brick_buttonClick(Sender: TObject);     // 234a

begin
  if keeps_list.Count<1 then EXIT;

  pad_view_fit_bgnd(2,marker_colour_panel.Color);   // 2=brick only
end;
//______________________________________________________________________________

procedure Tdxf_form.rotate_stl_by_buttonClick(Sender: TObject);   // 234d

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'STL  rotation  centre  X  dimension',stl_rot_x,False,True,False,False);   // neg ok, no preset, allow zero, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'STL  rotation  centre  Y  dimension',stl_rot_y,False,True,False,False);   // ditto.
  n:=putdim('please refer to Templot Club forum',3,'STL  rotation  angle',stl_rot_k*180/Pi,False,True,False,False);             // ditto

  if n<>2 then EXIT;

  if getdims('rotate  STL  data  relative  to  DXF  by  . . .','',dxf_form,n,od)=True
     then begin
            stl_rot_x:=od[0];
            stl_rot_y:=od[1];
            stl_rot_k:=od[2]*Pi/180;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.club_buttonClick(Sender: TObject);

begin
  go_to_templot_club;
end;
//______________________________________________________________________________

procedure Tdxf_form.loose_jaws_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'loose-jaw  slot  size  side-to-side  ( along  rail )',pin_slot_halfwide*inscale*2,True,True,False,False);  // no neg, no preset, allow zero, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'loose-jaw  slot  size  front-to-back',pin_slot_length*inscale,True,True,False,False);                      // ditto.

     putdim('please refer to Templot Club forum',1,'loose-jaw  pin  clearance  ( each  side )',loose_pin_clear_sides,False,True,False,False);      // neg ok, no preset, allow zero, don't terminate on zero.
     putdim('please refer to Templot Club forum',1,'loose-jaw  pin  clearance  ( front - inner )',loose_pin_clear_front,False,True,False,False);   // ditto.
     putdim('please refer to Templot Club forum',1,'loose-jaw  pin  clearance  ( back - outer )',loose_pin_clear_back,False,True,False,False);     // ditto.

     putdim('please refer to Templot Club forum',1,'loose-jaw  pin  bottom  taper  ( all  round )',loose_pin_bottom_taper_ins*inscale,False,True,False,False);     // ditto.

     putdim('please refer to Templot Club forum',1,'loose-jaw  rail-fit  adjust  ( negative  is  closer  fit )',0-key_thicken,False,True,False,False);    // ditto.

  n:=putdim('please refer to Templot Club forum',1,'loose-jaw  pin  depth  above  plug  bottom',loose_pin_depth_clear*inscale,False,True,False,False);    // ditto

  if n<>7 then EXIT;

  if getdims('loose  outer  jaw  -  pin / slot  . . .','',dxf_form,n,od)=True
     then begin
            pin_slot_halfwide:=od[0]/inscale/2;
            pin_slot_length:=od[1]/inscale;

            loose_pin_clear_sides:=od[2];
            loose_pin_clear_front:=od[3];
            loose_pin_clear_back:=od[4];

            loose_pin_bottom_taper_ins:=od[5]/inscale;

            key_thicken:=0-od[6];  // +ve thicken = tighter fit

            loose_pin_depth_clear:=od[7]/inscale;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.socket_indent_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim('please refer to Templot Club forum',1,'2-D  socket  ends  indented  by',socket_indent*inscale,False,True,False,False);  // negative ok, no preset, zero ok, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('2-D  socket  ends  indented  by ...','',dxf_form,n,od)=True
     then begin
            socket_indent:=od[0]/inscale;
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.nibs_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
     putdim('please refer to Templot Club forum',1,'2-D  nib  width',nib_width,True,True,False,False);    // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim('please refer to Templot Club forum',1,'2-D  nib  length',nib_length,True,True,False,False);  // no negative, no preset, zero ok, don't terminate on zero.

  if n<>1 then EXIT;

  if getdims('2-D  nibs  ...','',dxf_form,n,od)=True
     then begin
            nib_width:=od[0];         // mm...
            nib_length:=od[1];
          end;
end;
//______________________________________________________________________________

procedure Tdxf_form.snibs_buttonClick(Sender: TObject);

const
  str:string='please refer to Templot Club forum';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'2-D  1st  snibbing  extent',snib1_extent*inscale,True,True,False,False);         // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'2-D  2nd  snibbing  extent  -  turnout  TS', snib2_extent_t*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'2-D  2nd  snibbing  extent  -  plain  track',snib2_extent_p*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'2-D  2nd  snibbing  extent  -  equalized',   snib2_extent_e*inscale,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

     putdim(str,1,'2-D  TN  snib  space',tsn_snib_space_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'2-D  TF  snib  space',tsf_snib_space_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
     putdim(str,1,'2-D  MN  snib  space',msn_snib_space_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.
  n:=putdim(str,1,'2-D  MF  snib  space',msf_snib_space_mm,True,True,False,False);   // no negative, no preset, zero ok, don't terminate on zero.

  if n<>7 then EXIT;

  if getdims('2-D  snibs ...','',dxf_form,n,od)=True
     then begin
            snib1_extent:=od[0]/inscale;

            snib2_extent_t:=od[1]/inscale;
            snib2_extent_p:=od[2]/inscale;
            snib2_extent_e:=od[3]/inscale;

            tsn_snib_space_mm:=od[4];
            tsf_snib_space_mm:=od[5];
            msn_snib_space_mm:=od[6];
            msf_snib_space_mm:=od[7];
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.edit_preview_buttonClick(Sender: TObject);

begin
  with export_preview_form do begin

    preview_3d_edit.Text:=preview_3d_app_str;
    preview_2d_edit.Text:=preview_2d_app_str;

    if do_show_modal(export_preview_form)=mrOK
       then begin
              preview_3d_app_str:=preview_3d_edit.Text;
              preview_2d_app_str:=preview_2d_edit.Text;
            end;
  end;//with
end;
//______________________________________________________________________________

procedure Tdxf_form.fw_widen_buttonClick(Sender: TObject);

var
  n:integer;
  od:Toutdim;

begin
  n:=putdim('for use with gauge-widening - please refer to Templot Club forum',1,'modify  check - rail  flangeway  gap  by',fw_mod_for_gw,False,True,False,False);   // neg ok, no preset, zero ok, don't terminate on zero.

  if n<>0 then EXIT;

  if getdims('modify  check-rail  flangeway  gap  by ...','',pad_form,n,od)=True
     then begin
            fw_mod_for_gw:=od[0];

            if fw_mod_for_gw<>0 then show_modal_message('n.b. Setting a modified check-rail flangeway will apply to all exported templates.');
          end;

end;
//______________________________________________________________________________

procedure Tdxf_form.plug_fit_trackbarChange(Sender: TObject);

var
  canv:TControlCanvas;
  focus_rect:TRect;

begin
  canv:=TControlCanvas.Create;
  canv.Control:=plug_fit_trackbar;

  canv.pen.Color:=dxf_form.Color;
  canv.Brush.Style:=bsClear;

  focus_rect:=Rect(0,0,plug_fit_trackbar.Width,plug_fit_trackbar.Height);

  canv.Rectangle(focus_rect);   // remove it focus rectangle.
  canv.Free;

  fit_label.Caption:=IntToStr(plug_fit_trackbar.Position);
end;
//______________________________________________________________________________

procedure Tdxf_form.control_settings_buttonClick(Sender: TObject);

begin
  pad_form.chairs_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tdxf_form.filament_checkboxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    // 241c

begin
  _3d_fdm_radiobutton.Checked:=True;    // assume FDM
  _3d_options_click((tweezer_tips_radio.Checked=False) and (filing_jig_radio.Checked=False));
end;
//______________________________________________________________________________

procedure Tdxf_form.show_settings_buttonClick(Sender: TObject);     // 241c

begin
  ClientWidth:=1160;
  ClientHeight:=790;

  show_settings_button.Visible:=False;
  hide_settings_button.Visible:=True;
  datestamp_label.Visible:=True;
  dxf_3d_page_control.Visible:=True;
  exp_panel.Visible:=True;

  dxf_showing_settings:=True;
end;
//______________________________________________________________________________

procedure Tdxf_form.hide_settings_buttonClick(Sender: TObject);

begin
  hide_settings_button.Visible:=False;
  datestamp_label.Visible:=False;
  dxf_3d_page_control.Visible:=False;
  exp_panel.Visible:=False;

  show_settings_button.Visible:=True;

  ClientWidth:=320;
  ClientHeight:=460;

  dxf_showing_settings:=False;
end;
//______________________________________________________________________________

procedure Tdxf_form.plates_settings_buttonClick(Sender: TObject);

begin
  chairs_only_button.Click;
  alignment_plates_radio.Checked:=True;      // switched off in chairs_only button
  pyramids_checkbox.Checked:=False;
  chairs_combo.ItemIndex:=0;
  chair_bolts_combo.ItemIndex:=0;
end;
//______________________________________________________________________________

procedure Tdxf_form.change_to_press_fit_buttonClick(Sender: TObject);

begin
  press_fit_radio.Checked:=True;
end;
//______________________________________________________________________________

function get_next_timber_along(str:string):string;  // 244a

  // enter with timber number string, return next timber number along template (same prefix)

begin
  RESULT:=Copy(str,1,1)+IntToStr(StrToIntDef(Copy(str,2,3),-1)+1);
end;
//______________________________________________________________________________

procedure Tdxf_form.rail_section_buttonClick(Sender: TObject);

begin
  dxf_3d_page_control.ActivePage:=rails_tab_sheet;
  show_settings_button.Click;
  rail_label.Visible:=True;
end;
//______________________________________________________________________________

procedure Tdxf_form.emgs_75_rail_radiobuttonClick(Sender: TObject);

begin
  set_rail_label;
  rail_label.Visible:=True;
end;
//______________________________________________________________________________

procedure Tdxf_form.rail_labelClick(Sender: TObject);

begin
  rail_section_button.Click;
end;
//______________________________________________________________________________

initialization

  line_type_str[0]:='CONTINUOUS|';
  line_type_str[1]:='DASHED|';
  line_type_str[2]:='HIDDEN|';
  line_type_str[3]:='CENTER|';
  line_type_str[4]:='DOT|';
  line_type_str[5]:='DASHDOT|';

  layer_str[ 0]:='RAILS|';
  layer_str[ 1]:='ADJTRACK|';
  layer_str[ 2]:='CENTLINE|';
  layer_str[ 3]:='TIMBOUTL|';
  layer_str[ 4]:='SLEEPEND|';
  layer_str[ 5]:='TIMBCENT|';
  layer_str[ 6]:='GDMARKS|';
  layer_str[ 7]:='RADMARKS|';
  layer_str[ 8]:='RADCENTS|';
  layer_str[ 9]:='JOINTS|';
  layer_str[10]:='SBGSHAPE|';
  layer_str[11]:='DBGSHAPE|';
  layer_str[12]:='INFOTEXT|';
  layer_str[13]:='TIMBNUMB|';
  layer_str[14]:='RAILS3D|';     // 3-D rail section
  layer_str[15]:='CHBOLTHD|';
  layer_str[16]:='CHBASE|';
  layer_str[17]:='TIMBER3D|';    // 3-D timbers
  layer_str[18]:='CHSEAT|';
  layer_str[19]:='CHBOLTBO|';
  layer_str[20]:='CHINJAW|';
  layer_str[21]:='CHOUTJAW|';
  layer_str[22]:='CHKEYS|';
  layer_str[23]:='CHSOCKET|';    // chair sockets
  layer_str[24]:='TIMBSPRU|';    // timber sprues
  layer_str[25]:='TIMBFLNG|';    // timber side, end flanges
  layer_str[26]:='SOLEPLAT|';    // switch sole plates
  layer_str[27]:='TIMBWEBS|';    // timber webs
  layer_str[28]:='BKSPLINT|';    // brick splints
  layer_str[29]:='BKCONN|';      // brick connectors
  layer_str[30]:='SYMBOLS|';     // dropper symbols
  layer_str[31]:='DROPID|';      // dropper ID text
  layer_str[32]:='KERFTIMB|';    // timber outline with laser kerf adjustment
  layer_str[33]:='KERFSOCK|';    // chair sockets with laser kerf adjustment
  layer_str[34]:='CHPLUG|';      // chair plugs
  layer_str[35]:='SUPPORT|';     // support pyramid

//______________________________________________________________________________

end.

