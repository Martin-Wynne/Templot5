
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

   This file was derived from Templot2 version 244d

*)

unit chairs_unit;

   // 2D and 3D data for chairs

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, chair_frame_unit;

type

  { Tchairs_form }

  Tchairs_form = class(TForm)
    datestamp_label: TLabel;
    export_checkbox1: TCheckBox;
    frame_label: TLabel;
    include_checkbox0: TCheckBox;
    include_checkbox1: TCheckBox;
    include_checkbox2: TCheckBox;
    Label3: TLabel;
    export_solid_button: TButton;
    export_slots_button: TButton;
    export_loose_only_button: TButton;
    Label18: TLabel;
    cancel_button: TButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    loose_checkbox0: TCheckBox;
    modify_button: TButton;
    ok_panel: TPanel;
    ok_button: TButton;
    ok_panel_2: TPanel;
    ok_button_2: TButton;
    Button1: TButton;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    modify_match_panel: TPanel;
    Shape1: TShape;
    help_button: TButton;
    Label36: TLabel;
    Label37: TLabel;
    chairs_scrollbox: TScrollBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    frame_S1: Tchair_frame;
    frame_L1: Tchair_frame;
    frame_1P_stock: Tchair_frame;
    frame_P: Tchair_frame;
    frame_1P_switch: Tchair_frame;
    frame_CC_run: Tchair_frame;
    frame_3P_stock: Tchair_frame;
    frame_3P_switch: Tchair_frame;
    frame_CC_check: Tchair_frame;
    frame_CCLR_run: Tchair_frame;
    frame_CCLR_check: Tchair_frame;
    frame_M1: Tchair_frame;
    frame_ZY_ms: Tchair_frame;
    frame_ZY_ts: Tchair_frame;
    frame_XN_ms: Tchair_frame;
    frame_XN_ts: Tchair_frame;
    frame_XA_ms: Tchair_frame;
    frame_XA_ts: Tchair_frame;
    frame_AA_ms: Tchair_frame;
    frame_AA_ts: Tchair_frame;
    frame_DD_ms: Tchair_frame;
    frame_DD_ts: Tchair_frame;
    frame_EF_ms: Tchair_frame;
    frame_EF_ts: Tchair_frame;
    frame_BB_ms: Tchair_frame;
    frame_BB_ts: Tchair_frame;
    frame_AB_ms: Tchair_frame;
    frame_AB_ts: Tchair_frame;
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    chair_frame_all: Tchair_frame;
    frame_S1J: Tchair_frame;
    Label38: TLabel;
    frame_CD_ms: Tchair_frame;
    frame_CD_ts: Tchair_frame;
    Label2: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    frame_SC: Tchair_frame;
    frame_S1N: Tchair_frame;
    frame_L1CCLR_run: Tchair_frame;
    frame_S1O: Tchair_frame;
    frame_L1CCRL_check: Tchair_frame;
    frame_PW_wing: Tchair_frame;
    frame_PWL_run: Tchair_frame;
    frame_PW_run: Tchair_frame;
    frame_PWL_wing: Tchair_frame;
    frame_PWR_wing: Tchair_frame;
    frame_SS: Tchair_frame;
    frame_PWR_run: Tchair_frame;
    frame_MS: Tchair_frame;
    frame_SDS: Tchair_frame;
    chair_frame19: Tchair_frame;
    frame_SDP: Tchair_frame;
    chair_frame21: Tchair_frame;
    chair_frame22: Tchair_frame;
    chair_frame23: Tchair_frame;
    chair_frame24: Tchair_frame;
    frame_L1CCLR_check: Tchair_frame;
    frame_L1CC_check: Tchair_frame;
    frame_L1CCRL_run: Tchair_frame;
    frame_L1CC_run: Tchair_frame;
    Label1: TLabel;
    Label44: TLabel;
    Label49: TLabel;
    Label54: TLabel;
    chair_frame25: Tchair_frame;
    chair_frame26: Tchair_frame;
    chair_frame27: Tchair_frame;
    chair_frame28: Tchair_frame;
    Shape2: TShape;
    procedure FormCreate(Sender: TObject);
    procedure export_solid_buttonClick(Sender: TObject);
    procedure export_slots_buttonClick(Sender: TObject);
    procedure export_loose_only_buttonClick(Sender: TObject);
    procedure help_buttonClick(Sender: TObject);
    procedure modify_match_panelClick(Sender: TObject);
    procedure modify_match_panelMouseEnter(Sender: TObject);
    procedure modify_match_panelMouseLeave(Sender: TObject);
    procedure ok_panelClick(Sender: TObject);
    procedure chair_frame_allinclude_checkbox0Click(Sender: TObject);
    procedure chair_frame_allinclude_checkbox1Click(Sender: TObject);
    procedure chair_frame_allloose_checkbox0Click(Sender: TObject);
    procedure chair_frame_allexport_checkbox1Click(Sender: TObject);
    procedure chair_frame_allexport_checkbox2Click(Sender: TObject);
    procedure chair_frame_allinclude_checkbox2Click(Sender: TObject);
    procedure ok_panelMouseEnter(Sender: TObject);
    procedure ok_panelMouseLeave(Sender: TObject);
    procedure ok_panel_2MouseEnter(Sender: TObject);
    procedure ok_panel_2MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  chairs_form: Tchairs_form;


type
  T_2d_data=record     // chairing data for 2D (base outlines, corner rads, screw/bolt centres) ...

     //  1=S1 chair
     //  2=P chair
     //  3=
     //  4=
     //  5=L1 bridge chair
     //  6=M1 bridge chair
     //  7=S1J joint chair

     //  8=S1O half-bolted chair outer
     //  9=S1N half-bolted chair inner

     //  10=switch block chair stock rail half

     //  11=switch block chair switch rail half, type 1 (no jaw)     A B C D switches  1PR and 2PR
     //  12=switch block chair switch rail half, type 2 (normal key) A B C D E F switches
     //  13=switch block chair switch rail half, type 3 (inner key)  E F switches 1PR and 2PR

     //  14=CCW  check flare-in
     //  15=CC   check rail
     //  16=CCE  chec k flare-out

     //  17=
     //  18=
     //  19=
     //  20=

        // V-crossing chairs...

     //  21=ZY
     //  22=XN
     //  23=XA
     //  24=AA
     //  25=AB
     //  26=BB/BC
     //  27=CD
     //  28=EF

     //  98=FG dummy chair  foot groove        234a
     //  99=RG dummy chair  rail head groove   234a


              // chair code 1,  S1 ordinary chairs   Standard Railway Equipment 1926  S1 ordinary chairs ...

              S1_chair_outlong:extended;        // from gauge-face
              S1_chair_inlong:extended;         // chair total length 14.1/2"
              S1_chair_halfwide:extended;       // chair width 8" /2

              S1_chair_crad_inner:extended;     // corner rad 1"
              S1_chair_crad_outer:extended;

                    // screw/bolt centres ...

              S1_inbolt_1x:extended;
              S1_inbolt_2x:extended;

              S1_outbolt_1x:extended;
              S1_outbolt_2x:extended;

              S1_bolts_from_end:extended;


              // chair code 5,  L1 bridge chairs ...

              L1_chair_outlong:extended;        // Standard Railway Equipment 1926  L1 bridge chairs
              L1_chair_inlong:extended;         // chair total length 10.1/2"
              L1_chair_halfwide:extended;       // chair width 11"  /2
              L1_chair_jaw_halfwide:extended;   // chair jaw   4"   /2

              L1_chair_crad_inner:extended;     // base corner rad
              L1_chair_crad_outer:extended;

                    // screw/bolt centres ...

              L1_inbolt_1x:extended;
              L1_inbolt_2x:extended;

              L1_outbolt_1x:extended;
              L1_outbolt_2x:extended;

              L1_bolts_from_end:extended;


              // chair code 2,  P slide chairs ...

              P_chair_outlong:extended;        // from gauge-face
              P_chair_inlong:extended;         // chair inner length

              P_chair_inlong_mod:extended;     // modified for increased model switch opening

              P_chair_halfwide:extended;       // chair width 8" /2

              P_chair_crad_inner:extended;     // corner rad 1"
              P_chair_crad_outer:extended;

                    // screw/bolt centres ...

              P_inbolt_1x:extended;
              P_inbolt_2x:extended;

              P_outbolt_1x:extended;
              P_outbolt_2x:extended;

              P_bolts_from_end:extended;


              // chair code 10,  SC fictional 4-bolt ordinary chairs ...

              SC_chair_outlong:extended;
              SC_chair_inlong:extended;
              SC_chair_halfwide:extended;

              SC_inbolt_1x:extended;
              SC_inbolt_2x:extended;

              SC_outbolt_1x:extended;
              SC_outbolt_2x:extended;

              SC_bolts_from_end:extended;

              SC_chair_crad_inner:extended;
              SC_chair_crad_outer:extended;


              // chair_code 11,  block slide chairs 1 & 2 (no inner jaws) ...

              inner_trim_stock_rail:extended;
              mid_jaw_space:extended;

              PLR1_chair_outlong:extended;
              PLR1_chair_inlong:extended;
              PLR1_block_slide_chair_inlong:extended;
              PLR1_chair_halfwide:extended;

              PLR1_inbolt_1x:extended;
              PLR1_inbolt_2x:extended;

              PLR1_outbolt_1x:extended;
              PLR1_outbolt_2x:extended;

              PLR1_bolts_from_end:extended;

              PLR1_chair_crad_inner:extended;
              PLR1_chair_crad_outer:extended;


              // check rail chairs ...

              // chair_code  15 ordinary check chairs ...

              CC_chair_outlong:extended;

              CC_chair_halfwide:extended;

              CC_inbolt_1x:extended;
              CC_inbolt_2x:extended;

              CC_outbolt_1x:extended;
              CC_outbolt_2x:extended;

              CC_bolts_from_end:extended;

              CC_chair_crad_inner:extended;
              CC_chair_crad_outer:extended;


                   // V-crossing 8" rectangular chairs ...     239a

                   // chair_codes 21,27,28  ZY CD EF

              X_chair_outlong:extended;   // later calculated

              X_chair_inlong:extended;    // later calculated

              X_chair_halfwide:extended;

              X_inbolt_1x:extended;
              X_inbolt_2x:extended;

              X_outbolt_1x:extended;
              X_outbolt_2x:extended;

              X_bolts_from_end:extended;

              X_chair_crad_inner:extended;
              X_chair_crad_outer:extended;

              X_seat_top_halfwide:extended;


                // V-crossing wide-middle chairs ...     239a

                // temp represented as wider rectangular chairs, 9.25" wide

              xing_chair_end_from_rail:extended;  // 245a

                   // chair_codes 22,23,24,25,26  XN XA AA AB BB/BC

                   // XN...

              XN_chair_outlong:extended;

              XN_chair_halfwide:extended;

              XN_chair_mid_halfwide_near:extended;  // 245a  wide mid section is 10.5" wide
              XN_chair_mid_halfwide_far:extended;   // 245a

              XN_inbolt_1x:extended;
              XN_inbolt_2x:extended;

              XN_outbolt_1x:extended;
              XN_outbolt_2x:extended;

              XN_bolts_from_end:extended;

              XN_chair_crad_inner:extended;
              XN_chair_crad_outer:extended;

              XN_seat_top_halfwide:extended;

                   // XA...

              XA_chair_outlong:extended;

              XA_chair_halfwide:extended;

              XA_chair_mid_halfwide_near:extended;  // 245a temp wide mid section is 10.5" wide
              XA_chair_mid_halfwide_far:extended;   // 245a

              XA_inbolt_1x:extended;
              XA_inbolt_2x:extended;

              XA_outbolt_1x:extended;
              XA_outbolt_2x:extended;

              XA_bolts_from_end:extended;

              XA_chair_crad_inner:extended;
              XA_chair_crad_outer:extended;

              XA_seat_top_halfwide:extended;

                   // AA slab & bracket 244d

              AA_slab_outlong_near:extended;
              AA_slab_outlong_far:extended;
              AA_halfwide_near:extended;
              AA_slab_halfwide_far:extended;

                   // chair_code=12 ,  3P..9P block heel chairs (with inner jaw) ...

              PLR3_chair_outlong:extended;
              PLR3_block_heel_chair_inlong:extended;

              PLR3_chair_halfwide:extended;

              PLR3_inbolt_1x:extended;
              PLR3_inbolt_2x:extended;

              PLR3_outbolt_1x:extended;
              PLR3_outbolt_2x:extended;

              PLR3_bolts_from_end:extended;

              PLR3_chair_crad_inner:extended;
              PLR3_chair_crad_outer:extended;

              PLR3_seat_top_halfwide:extended;   // 3P..11P switch heel block chairs, switch rail seat



                   // chair_code 7, S1J joint chairs ...

              S1J_chair_outlong:extended;
              S1J_chair_inlong:extended;
              S1J_chair_halfwide:extended;

              S1J_inbolt_1x:extended;
              S1J_inbolt_2x:extended;

              S1J_outbolt_1x:extended;
              S1J_outbolt_2x:extended;

              S1J_bolts_from_end:extended;

              S1J_chair_crad_inner:extended;
              S1J_chair_crad_outer:extended;


              // chair code 98,  FG foot groove dummy chairs ...

              FG_chair_halfwide:extended;       // chair width

              FG_chair_crad_inner:extended;     // corner rad
              FG_chair_crad_outer:extended;

                    // screw/bolt centres ...

              FG_inbolt_1x:extended;
              FG_inbolt_2x:extended;

              FG_outbolt_1x:extended;
              FG_outbolt_2x:extended;

              FG_bolts_from_end:extended;


              // chair code 99,  RG rail groove dummy chairs ...

              RG_chair_halfwide:extended;       // chair width

              RG_chair_crad_inner:extended;     // corner rad
              RG_chair_crad_outer:extended;

                    // screw/bolt centres ...

              RG_inbolt_1x:extended;
              RG_inbolt_2x:extended;

              RG_outbolt_1x:extended;
              RG_outbolt_2x:extended;

              RG_bolts_from_end:extended;


            end;//record T_2d_data

  T_3d_data=record       // chairing data for 3D (chair jaws, thicknesses, heights) ...

              seat_thickness:extended;       // full-size inches chair seating thickness   1.75"

              chair_plinth_thick:extended;      // chair plinth is a nominal area inside the outline perimeter
                                                // (rectangle on corner rad centres, nominal socket rectangle for Plug Track)
              L1_chair_plinth_thick:extended;
              P_chair_plinth_thick:extended;
              SC_CC_chair_plinth_thick:extended;
              X_chair_plinth_thick:extended;

              AA_slab_plinth_thick:extended;  // 244e

              chair_plinth_spacing:extended;

              chair_edge_thick:extended;

              L1_chair_edge_thick:extended;
              P_chair_edge_thick:extended;
              SC_CC_chair_edge_thick:extended;
              X_chair_edge_thick:extended;

              outer_jaw_face:extended;   // outer jaw from gauge-face  (3.15/16" for vertical rail)

              boss_height:extended;         // inches full-size up from base of chair...
              ferrule_height:extended;
              bolt_head_height:extended;

              boss_dia:extended;
              hole_dia:extended;            // ferrule dia


              key_length:extended;
              key_deformation:extended;  // 235b
              key_pad_taper:extended;

              sj_key_pad_length:extended;   // 237a solid jaw key ..
              lj_key_pad_length:extended;   // 237a loose jaw key ..



              //-------------------

              // S1 ordinary chair

              S1_seat_top_halfwide:extended;    // almost full width  7.7/8"  /2


                // S1 outer jaw (2 ribs) ...

              S1_outjaw_height_top:extended;       // from base


                // top x-section...

              S1_outjaw_half_width_top:extended;

              S1_outjaw_half_rib_space_top:extended;    // half-width between ribs

              S1_outjaw_rib_depth_top:extended;
              S1_outjaw_rib_width_top:extended;
              S1_outjaw_rib_rad_top:extended;
              S1_outjaw_fillet_rad_top:extended;
              S1_outjaw_depth_top:extended;        // behind ribs


                // middle x-section ...

              S1_outjaw_half_width_mid:extended;

              S1_outjaw_height_mid:extended;       // from base

              S1_outjaw_half_rib_space_mid:extended;    // half-width between ribs

              S1_outjaw_rib_depth_mid:extended;
              S1_outjaw_rib_width_mid:extended;
              S1_outjaw_rib_rad_mid:extended;
              S1_outjaw_fillet_rad_mid:extended;

              S1_outjaw_depth_mid:extended;        // behind ribs

              S1_outjaw_slope_mid:extended;   // side slope 1:n from top


                // seat x-section...

              S1_outjaw_half_width_seat:extended;

              S1_outjaw_half_rib_space_seat:extended;    // half-width between ribs

              S1_outjaw_rib_depth_seat:extended;
              S1_outjaw_rib_width_seat:extended;
              S1_outjaw_rib_rad_seat:extended;
              S1_outjaw_fillet_rad_seat:extended;

              S1_outjaw_depth_seat:extended;     // behind ribs

              S1_outjaw_slope_seat:extended;   // side slope 1:n from middle


                // plinth x-section ...

              S1_outjaw_half_width_plinth:extended;

              S1_outjaw_depth_plinth:extended;     // behind ribs

              S1_outjaw_half_rib_space_plinth:extended; // half-width between ribs
              S1_outjaw_rib_depth_plinth:extended;
              S1_outjaw_rib_width_plinth:extended;
              S1_outjaw_rib_rad_plinth:extended;
              S1_outjaw_fillet_rad_plinth:extended;

              S1_outjaw_slope_plinth:extended;   // side slope 1:n from seat

              //-------------------

                // S1 inner jaw (1 rib) ...

              S1_injaw_height_insert_top:extended;    // top of inner jaw
              S1_injaw_height_insert_bot:extended;    // bottom of insert

              S1_injaw_height_stand:extended;     // fixed stand part (remainder of jaw height is an insert in the rail web)
              S1_injaw_height_upmid:extended;
              S1_injaw_height_lomid:extended;

              S1_injaw_slope_insert:extended;   // top of inner jaw
              S1_injaw_slope_stand:extended;    // side slope 1:n from top
              S1_injaw_slope_upmid:extended;    // side slope 1:n from stand
              S1_injaw_slope_lomid:extended;    // side slope 1:n from upper middle
              S1_injaw_slope_seat:extended;     // side slope 1:n from mid
              S1_injaw_slope_plinth:extended;   // side slope 1:n from seat


                 // insert x-section...

              S1_injaw_half_width_insert_top:extended;
              S1_injaw_half_width_insert_bot:extended;

              S1_injaw_depth_insert:extended;

                // stand x-section...

              S1_injaw_half_width_stand:extended;

              S1_injaw_side_space_stand:extended;

              S1_injaw_fillet_rad_stand:extended;
              S1_injaw_depth_stand:extended;        // behind rib
              S1_injaw_corner_rad_stand:extended;


                // upper middle x-section (top of rib)   (233d level with web face lower)...

              S1_injaw_half_width_upmid:extended;

              S1_injaw_side_space_upmid:extended;

              S1_injaw_fillet_rad_upmid:extended;
              S1_injaw_depth_upmid:extended;       // behind rib
              S1_injaw_corner_rad_upmid:extended;


                // lower middle x-section ...        (233d level with rail foot)...

              S1_injaw_half_width_lomid:extended;

              S1_injaw_side_space_lomid:extended;

              S1_injaw_fillet_rad_lomid:extended;
              S1_injaw_depth_lomid:extended;     // behind rib
              S1_injaw_corner_rad_lomid:extended;


                // seat x-section ...

              S1_injaw_half_width_seat:extended;

              S1_injaw_side_space_seat:extended;

              S1_injaw_fillet_rad_seat:extended;
              S1_injaw_depth_seat:extended;     // behind rib
              S1_injaw_corner_rad_seat:extended;


                // plinth x-section ...

              S1_injaw_half_width_plinth:extended;

              S1_injaw_side_space_plinth:extended;

              S1_injaw_fillet_rad_plinth:extended;
              S1_injaw_depth_plinth:extended;     // behind rib
              S1_injaw_corner_rad_plinth:extended;


              // L1 bridge chair

              L1_seat_top_halfwide:extended;

                // L1 outer jaw (no ribs) ...

              L1_outjaw_height_top:extended;       // from base

              L1_outjaw_height_edge:extended;

              L1_outjaw_corner_rad_top:extended;

              L1_outjaw_corner_rad_edge:extended;

                // L1 top x-section...

              L1_outjaw_half_width_top:extended;

              L1_outjaw_depth_top:extended;

                // L1 edge x-section ...

              L1_outjaw_half_width_edge:extended;

              L1_outjaw_depth_edge:extended;

              //-------------------

              // P switch slide chair

              P_jaw_depth_top:extended;
              P_jaw_depth_bot:extended;

              P_jaw_half_width_top:extended;
              P_jaw_half_width_mid:extended;    // at bottom of spacer

              P_seat_top_halfwide:extended;

                 // P inner

              P_seat_table_radius:extended;          // slide table width 7" /2
              P_table_rad_centre_from_end:extended;  // slide table rad centre 5.875" from chair end    was 6"

              //---------------------

              // S1J joint chair

              S1J_seat_top_halfwide:extended;    // almost full width  9.7/8"  /2

              //---------------

              // PLR switch block chairs

              PLR1_seat_top_halfwide:extended;   // allow angled insertion on chair 8" wide - 7.5" /2   1P and 2P chairs
              PLR1_table_top_halfwide:extended;  // slide table width 7" /2

              PLR1_table_corner_radius:extended;                // corners 1" rad
              PLR1_table_rad_centres_from_gauge_face:extended;  // slide table rad centre 1.5" from gauge face

              //------------------------------

                // SC outer jaw (1 rib, 2 bolts) ...       Switch and Crossing  chair outers

              SC_outjaw_height_top:extended;       // from base

                // top x-section...

              SC_outjaw_half_width_top:extended;

              SC_outjaw_rib_rad_top:extended;
              SC_outjaw_corner_rad_top:extended;
              SC_outjaw_fillet_rad_top:extended;

              SC_outjaw_depth_top:extended;        // behind rib

              SC_outjaw_rib_side_top:extended;
              SC_outjaw_rib_end_top:extended;

                // middle x-section ...

              SC_outjaw_half_width_mid:extended;

              SC_outjaw_height_mid:extended;       // from base

              SC_outjaw_rib_side_mid:extended;
              SC_outjaw_rib_end_mid:extended;

              SC_outjaw_rib_rad_mid:extended;
              SC_outjaw_corner_rad_mid:extended;
              SC_outjaw_fillet_rad_mid:extended;

              SC_outjaw_depth_mid:extended;        // behind rib

              SC_outjaw_slope_mid:extended;   // side slope 1:n from top


                // seat x-section...

              SC_outjaw_half_width_seat:extended;

              SC_outjaw_rib_rad_seat:extended;
              SC_outjaw_corner_rad_seat:extended;
              SC_outjaw_fillet_rad_seat:extended;

              SC_outjaw_rib_side_seat:extended;
              SC_outjaw_rib_end_seat:extended;

              SC_outjaw_depth_seat:extended;     // behind ribs

              SC_outjaw_slope_seat:extended;   // side slope 1:n from middle


                // plinth x-section ...

              SC_outjaw_half_width_plinth:extended;

              SC_outjaw_depth_plinth:extended;     // behind rib

              SC_outjaw_rib_rad_plinth:extended;
              SC_outjaw_corner_rad_plinth:extended;
              SC_outjaw_fillet_rad_plinth:extended;

              SC_outjaw_rib_side_plinth:extended;
              SC_outjaw_rib_end_plinth:extended;

              SC_outjaw_slope_plinth:extended;   // side slope 1:n from seat

              //-------------------


            end;//record  T_3d_data

var
  _2d_data:T_2d_data;
  _3d_data:T_3d_data;

  chair_frames:array of Tchair_frame;      // 241a

  chair_option_clicked:integer=2;  // 239a    init defaults - export pin slots

  procedure init_2d_rea;    // init default 2D chair data  (called from templot_init)
  procedure init_3d_rea;    // init 3D data

//______________________________________________________________________________

implementation

{$R *.lfm}

uses
  control_room, pad_unit, math_unit, keep_select, dxf_unit, alert_unit, bgkeeps_unit, help_sheet;

//______________________________________________________________________________

procedure init_2d_rea;    // init default REA 2D chair data  (called from templot_init)

begin
  with _2d_data do begin

      // length dims from gauge-face

    S1_chair_outlong:=9.25;     // Standard Railway Equipment 1926  S1 ordinary chairs
    S1_chair_inlong:=5.25;      // chair length 14.1/2"
    S1_chair_halfwide:=4;       // chair width 8" wide/2

    S1_inbolt_1x:=0-2;          // REA y always 1.75" in from end of chair
    S1_inbolt_2x:=2;

    S1_outbolt_1x:=0;           // one outer screw/bolt on chair centre-line
    S1_outbolt_2x:=0;           // if 2nd bolt same as 1st bolt, it is omitted

    S1_bolts_from_end:=1.75;    // 1.75" on all REA chair screws

    S1_chair_crad_inner:=1;     // corner rad 1"
    S1_chair_crad_outer:=1;


    S1J_chair_outlong:=9.25;     // Standard Railway Equipment 1926  S1J joint chairs
    S1J_chair_inlong:=5.25;      // chair length 14.1/2"
    S1J_chair_halfwide:=5;       // chair width 10" wide/2

    S1J_inbolt_1x:=0-2;          // REA y always 1.75" in from end of chair
    S1J_inbolt_2x:=2;

    S1J_outbolt_1x:=0;           // one outer screw/bolt on chair centre-line
    S1J_outbolt_2x:=0;           // if 2nd bolt same as 1st bolt, it is omitted

    S1J_bolts_from_end:=1.75;    // 1.75" on all REA chair screws

    S1J_chair_crad_inner:=1;     // corner rad 1"
    S1J_chair_crad_outer:=1;


    L1_chair_outlong:=7;        // Standard Railway Equipment 1926  L1 bridge chairs
    L1_chair_inlong:=3.5;       // chair length 10.1/2"
    L1_chair_halfwide:=5.5;     // chair width 11" /2
    L1_chair_jaw_halfwide:=2;   // chair jaw   4"  /2

    L1_inbolt_1x:=0-3.75;       //  REA always 1.75" in from end of chair
    L1_inbolt_2x:=3.75;

    L1_outbolt_1x:=0-3.75;
    L1_outbolt_2x:=3.75;

    L1_bolts_from_end:=1.75;    // 1.75" on all REA chair screws

    L1_chair_crad_inner:=1.75;  // corner rad 1.75"
    L1_chair_crad_outer:=1.75;


    P_chair_outlong:=9.25;    // same as S1
    P_chair_inlong:=8.75;     // P chair length 18"   modified later (math_unit) for model switches:

    P_chair_inlong_mod:=P_chair_inlong;   // P_chair_inlong+(switch_opening-4.25)

    P_chair_halfwide:=4;      // chair width 8" wide/2

    P_inbolt_1x:=0-2;
    P_inbolt_2x:=2;

    P_outbolt_1x:=0-2;        // two outer bolts for P chair
    P_outbolt_2x:=2;

    P_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    P_chair_crad_inner:=1;    // corner rad 1"
    P_chair_crad_outer:=1;


         // SC chairs ...       fictional 4-bolt ordinary chairs

    SC_chair_outlong:=9.25;    // same as S1
    SC_chair_inlong:=5.25;     // chair length 14.1/2"  samw as S1
    SC_chair_halfwide:=4;      // chair width 8" wide/2

    SC_inbolt_1x:=0-2;         // two inner bolts
    SC_inbolt_2x:=2;

    SC_outbolt_1x:=0-2;        // two outer bolts
    SC_outbolt_2x:=2;

    SC_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    SC_chair_crad_inner:=1;    // square corner in centre
    SC_chair_crad_outer:=1;    // outer corner rad 1"



     // block chairs ...

        // block slide chairs 1 & 2 (no inner jaw) ...

    inner_trim_stock_rail:=1+9/16;  // inches arbitrary    from  stock-rail gauge-face
    mid_jaw_space:=7/8;             // inches allow space between mid jaws for flexing of loose mid-jaw      chairs 3P , 4P , EF

    PLR1_block_slide_chair_inlong:=5+9/16;  // to ensure clear screw boss on TS side   from stock-rail gauge face. to be adjusted for the switch offset

    PLR1_chair_outlong:=9.25;   // same as S1

    PLR1_chair_inlong:=1+9/16;  // arbitrary    from  stock-rail gauge-face  injaw cropped to this     adjusted later from offset for chair base

    PLR1_chair_halfwide:=4;     // chair width 8" wide/2

    PLR1_inbolt_1x:=0-2;
    PLR1_inbolt_2x:=2;

    PLR1_outbolt_1x:=0-2;
    PLR1_outbolt_2x:=2;

    PLR1_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    PLR1_chair_crad_inner:=1;
    PLR1_chair_crad_outer:=1;


     // block heel chairs 3..9 ...

    PLR3_block_heel_chair_inlong:=5+11/32;  // to ensure clear screw boss on TS side     5.375;  // from stock-rail gauge face. to be adjusted for the switch offset

    PLR3_chair_outlong:=9.25;   // same as S1

    PLR3_chair_halfwide:=4;     // chair width 8" wide/2

    PLR3_inbolt_1x:=0-2;
    PLR3_inbolt_2x:=2;

    PLR3_outbolt_1x:=0-2;
    PLR3_outbolt_2x:=2;

    PLR3_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    PLR3_chair_crad_inner:=1;
    PLR3_chair_crad_outer:=1;

    PLR3_seat_top_halfwide:=PLR3_chair_halfwide-5/16;  // allow angled insertion on chair 8" wide


      // ordinary check chairs ...       237a


    CC_chair_outlong:=9.25;   // same as S1     CC chair length 19.75"
    CC_chair_halfwide:=4;     // chair width 8" wide/2

    CC_inbolt_1x:=0-2;
    CC_inbolt_2x:=2;

    CC_outbolt_1x:=0-2;        // two outer bolts for check chairs
    CC_outbolt_2x:=2;

    CC_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    CC_chair_crad_inner:=1;    // inner corner rad 1"
    CC_chair_crad_outer:=1;    // outer corner rad 1"



      // V-crossing 8" rectangular chairs ...     239a

      // chair_codes 21,27,28   ZY , CD , EF

    X_chair_outlong:=9.25;     // default same as S1  later re-calculated

    X_chair_inlong:=5.25;      // default same as S1  later re-calculated

    X_chair_halfwide:=4;     // chair width 8" wide/2

    X_inbolt_1x:=0-2;
    X_inbolt_2x:=2;

    X_outbolt_1x:=0-2;        // two outer bolts for crossing chairs
    X_outbolt_2x:=2;

    X_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    X_chair_crad_inner:=1;    // inner corner rad 1"
    X_chair_crad_outer:=1;    // outer corner rad 1"

    X_seat_top_halfwide:=X_chair_halfwide-7/8;  // allow angled insertion on chair



      // V-crossing wide-middle chairs ...     239a

      // temp represented as wider rectangular chairs, 9.1/2" wide, with increased corner rad

      // chair_codes 22,23,24,25,26  XN , XA , AA , AB , BB/BC

    xing_chair_end_from_rail:=6.5;  // 245a  all sizes, from outer edge of rail to end of chair, at chair centre-line
                                    // used to calculate middle widened area of 8-sided chairs

    XN_chair_outlong:=9.25;     // same as S1

    XN_chair_halfwide:=4.75;   // chair width 9.1/2" wide/2

    XN_chair_mid_halfwide_near:=5.25;  // 245a  wide mid section is 10.5" wide
    XN_chair_mid_halfwide_far:=5.25;   // 245a

    XN_inbolt_1x:=0-2;
    XN_inbolt_2x:=2;

    XN_outbolt_1x:=0-2;        // two outer bolts for crossing chairs
    XN_outbolt_2x:=2;

    XN_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    XN_chair_crad_inner:=2.5;    // inner corner rad 2.5"   increased for wider chair
    XN_chair_crad_outer:=2.5;    // outer corner rad 2.5"   increased for wider chair

    XN_seat_top_halfwide:=XN_chair_halfwide-1/8;



    XA_chair_outlong:=9.25;     // same as S1

    XA_chair_halfwide:=4.75;   // chair width 9.1/2" wide/2

    XA_chair_mid_halfwide_near:=5.25;  // 245a  wide mid section is 10.5" wide
    XA_chair_mid_halfwide_far:=5.25;   // 245a

    XA_inbolt_1x:=0-2;
    XA_inbolt_2x:=2;

    XA_outbolt_1x:=0-2;        // two outer bolts for crossing chairs
    XA_outbolt_2x:=2;

    XA_bolts_from_end:=1.75;   // 1.75" on all REA chair screws

    XA_chair_crad_inner:=2.5;    // inner corner rad 2.5"   increased for wider chair
    XA_chair_crad_outer:=2.5;    // outer corner rad 2.5"   increased for wider chair

    XA_seat_top_halfwide:=XA_chair_halfwide-1;    // allow skewed insertion on chair base


       // over-rides for Exactoscale pips (5.75" dia, 2.875" rad, offset 1.645" towards cess)  ...

    // comment out for chairs ...
{
    chair_plinth_thick:=0.5;
    chair_edge_thick:=0.5;
    timber_thick:=4.75;

    S1_chair_outlong:=2.875+1.645;
    S1_chair_inlong:=2.875-1.645;
    S1_chair_halfwide:=2.875;

    S1_chair_mid_halfwide_near:=0;
    S1_chair_mid_halfwide_far:=0;

    S1_chair_crad_inner:=2.875;
    S1_chair_crad_outer:=2.875;
}
    // end comment out


        // 234a ...

        // code 98   dummy chair for foot-groove socket  5.5" foot  2.75" head  ...

    FG_chair_halfwide:=4;        // chair width 8" wide/2

    FG_inbolt_1x:=0-2;          // as REA y always 1.75" in from end of chair
    FG_inbolt_2x:=2;

    FG_outbolt_1x:=0;           // one outer screw/bolt on chair centre-line
    FG_outbolt_2x:=0;           // if 2nd bolt same as 1st bolt, it is omitted

    FG_bolts_from_end:=1.75;    // 1.75" as on all REA chair screws

    FG_chair_crad_inner:=1;     // corner rad 1"
    FG_chair_crad_outer:=1;


        // code 99   dummy chair for rail-head-groove socket  2.75" head ...

    RG_chair_halfwide:=4;    // chair width 8" wide/2

    RG_inbolt_1x:=0-2;       // as REA y always 1.75" in from end of chair
    RG_inbolt_2x:=2;

    RG_outbolt_1x:=0;        // one outer screw/bolt on chair centre-line
    RG_outbolt_2x:=0;        // if 2nd bolt same as 1st bolt, it is omitted

    RG_bolts_from_end:=1.75;    // 1.75" as on all REA chair screws

    RG_chair_crad_inner:=1;     // corner rad 1"
    RG_chair_crad_outer:=1;


  end;//with
end;
//______________________________________________________________________________

procedure init_3d_rea;   // init REA chair data

  // use control template for scaling

begin

  with _3d_data do begin  // REA defaults ...

      // all full-size inches ...

    chair_plinth_thick:=0.875;     // chair plinth is a nominal area inside the outline perimeter rectangle (half seat thickness)
    L1_chair_plinth_thick:=0.500;
    P_chair_plinth_thick:=1.250;
    SC_CC_chair_plinth_thick:=1.125;
    X_chair_plinth_thick:=1.125;

    AA_slab_plinth_thick:=1.75;   // 244e slab & bracket base thickness

    chair_edge_thick:=0.375;
    L1_chair_edge_thick:=0.500;   // 236d  same as plinth
    P_chair_edge_thick:=0.375;
    SC_CC_chair_edge_thick:=0.375;
    X_chair_edge_thick:=0.375;

    chair_plinth_spacing:=1.0;  // from chair outline to edge of plinth

    seat_thickness:=1.75;     // seating thickness under rail

    key_length:=6;          // 6" keys for REA
    key_deformation:=7/64;  // 235b    7/64" squashed between rail and chair jaw   (ensures integrity in STL file)
    key_pad_taper:=0.25;    // non-prototype taper fit to model rail   1/4" = 3 thou end clearance in 4mm/ft scale

      // key for solid jaws ..

    sj_key_pad_length:=1.25; // 1.25" non-prototype max area of full key thickness for easier sliding fit to model rail

      // key for loose jaws ..

    lj_key_pad_length:=key_length-1.0;  // 5" non-prototype max area of full key thickness


    S1_seat_top_halfwide:=3+15/16;

    S1J_seat_top_halfwide:=4+15/16;

    L1_seat_top_halfwide:=3+15/16;  // L1 seat top same as S1


    P_jaw_depth_top:=1;        // 1"      in front of spacer
    P_jaw_depth_bot:=3+7/16;   // 3.7/16" in front of spacer

    P_jaw_half_width_top:=2;
    P_jaw_half_width_mid:=2.7;    // at bottom of spacer

    P_seat_top_halfwide:=3+15/16;   // P seat top same as S1      232c

    P_seat_table_radius:=3.5;            // table total width 7"    232c
    P_table_rad_centre_from_end:=5.875;  // radiused inner end of table 5.875" from end of chair



    PLR1_seat_top_halfwide:=3.75;   // allow angled insertion on chair 8" wide
    PLR1_table_top_halfwide:=3.5;   // slide table width 7" /2

    PLR1_table_corner_radius:=1;                  // corners 1" rad
    PLR1_table_rad_centres_from_gauge_face:=1.5;  // slide table rad centre 1.5" from gauge face


    boss_height:=1+1/2;        // inches full-size from base of chair...
    ferrule_height:=1+5/8;
    bolt_head_height:=2+13/16;

    boss_dia:=2.125;
    hole_dia:=1+35/64;    // or ferrule dia

    outer_jaw_face:=3+15/16;  // inches from gauge-face (vertical rail)

    with rail_section_data_mm do begin

         // outer top ...

      S1_outjaw_height_top:=seat_thickness+rail_web_face_top_from_rail_bot_mm/inscale-1/32;  //REA (95R inclined)= 5+11/16;    jaw top is 1/32" below key top, mod for vertical rail    // from base

      S1_outjaw_depth_top:=0.5;  // behind ribs


      S1_outjaw_half_rib_space_top:=1+3/8;  // half-width between ribs (bolt space)
      S1_outjaw_rib_width_top:=5/8;         // i.e. total jaw top half-width = half_rib_space + rib_width = 1.3/8 + 5/8 = 2"

      S1_outjaw_half_width_top:=S1_outjaw_half_rib_space_top+S1_outjaw_rib_width_top;  // used to match inner jaw width to outer

      S1_outjaw_rib_depth_top:=0.25;
      S1_outjaw_rib_rad_top:=S1_outjaw_rib_width_top/2-3/16;
      S1_outjaw_fillet_rad_top:=S1_outjaw_rib_depth_top-S1_outjaw_rib_rad_top-1/64;

      S1_outjaw_slope_mid:=17.5;  // side slope 1:17.5 down from top to middle
      S1_outjaw_slope_seat:=9;    // side slope 1:9 down from middle to seat
      S1_outjaw_slope_plinth:=5;  // side slope 1:5 down from seat to plinth

         // outer middle ..

      S1_outjaw_height_mid:=2+7/8;     // from base

      S1_outjaw_depth_mid:=1+7/16;     // behind ribs   increased from dwg to allow for vertical rail

      S1_outjaw_half_rib_space_mid:=1+3/8; // half-width between ribs constant (bolt space)
      S1_outjaw_rib_depth_mid:=5/8;

      S1_outjaw_rib_width_mid:=S1_outjaw_rib_width_top+(S1_outjaw_height_top-S1_outjaw_height_mid)/S1_outjaw_slope_mid;  // make side angle on jaw

      S1_outjaw_half_width_mid:=S1_outjaw_half_rib_space_mid+S1_outjaw_rib_width_mid;  // used to match inner jaw width to outer

      S1_outjaw_rib_rad_mid:=S1_outjaw_rib_width_mid/2-5/32;
      S1_outjaw_fillet_rad_mid:=S1_outjaw_rib_depth_mid-S1_outjaw_rib_rad_mid-1/32;


         // outer seat ...

      S1_outjaw_depth_seat:=1+15/16;   // behind ribs

      S1_outjaw_half_rib_space_seat:=1+3/8; // half-width between ribs constant (bolt space)
      S1_outjaw_rib_depth_seat:=15/16;

      S1_outjaw_rib_width_seat:=S1_outjaw_rib_width_mid+(S1_outjaw_height_mid-seat_thickness)/S1_outjaw_slope_seat;  // make side angle on jaw

      S1_outjaw_half_width_seat:=S1_outjaw_half_rib_space_seat+S1_outjaw_rib_width_seat;  // used to match inner jaw width to outer

      S1_outjaw_rib_rad_seat:=S1_outjaw_rib_width_seat/2-1/8;
      S1_outjaw_fillet_rad_seat:=S1_outjaw_rib_depth_seat-S1_outjaw_rib_rad_seat-1/16;


         // outer plinth ...

      S1_outjaw_depth_plinth:=2+1/4;  // behind ribs    236d for loose-jaw

      S1_outjaw_half_rib_space_plinth:=1+3/8; // half-width between ribs  constant (bolt space)

      S1_outjaw_rib_depth_plinth:=1+3/4;   // 236d for loose jaw

      S1_outjaw_rib_width_plinth:=S1_outjaw_rib_width_seat+(seat_thickness-chair_plinth_thick)/S1_outjaw_slope_plinth;    // make side angle on jaw

      S1_outjaw_half_width_plinth:=S1_outjaw_half_rib_space_plinth+S1_outjaw_rib_width_plinth;  // used to match inner jaw width to outer

      S1_outjaw_rib_rad_plinth:=S1_outjaw_rib_width_plinth/2-1/16;

      S1_outjaw_fillet_rad_plinth:=S1_outjaw_rib_depth_plinth-S1_outjaw_rib_rad_plinth-3/32;

      //------------------------------------------------------------------------

      // S1 and L1 inner jaw (1 rib) ...

              // inner jaw heights ...

      S1_injaw_height_insert_top:=5+5/16;    // top of jaw       from base
      S1_injaw_height_stand:=4+23/32;        // top of stand     from base        2.3/4" from rail top  (flange clearance)


      S1_injaw_height_insert_bot:=seat_thickness+(rail_foot_depth_mm+(rail_foot_width_mm-rail_web_thick_mm)/2/rail_fish_angle)/inscale;    // web face, bottom of insert   from base

      S1_injaw_height_upmid:=S1_injaw_height_insert_bot;  // 233d level with rail web face lower

      S1_injaw_height_lomid:=seat_thickness+rail_foot_depth_mm/inscale;    // full rib         from base


             // make side angle on inner jaw to match outer ...

      S1_injaw_half_width_insert_top:=S1_outjaw_half_width_top+(S1_outjaw_height_top-S1_injaw_height_insert_top)/S1_outjaw_slope_mid;

      S1_injaw_half_width_stand:=S1_outjaw_half_width_top+(S1_outjaw_height_top-S1_injaw_height_stand)/S1_outjaw_slope_mid;
      S1_injaw_half_width_upmid:=S1_outjaw_half_width_top+(S1_outjaw_height_top-S1_injaw_height_upmid)/S1_outjaw_slope_mid;

      S1_injaw_half_width_insert_bot:=S1_outjaw_half_width_top+(S1_outjaw_height_top-S1_injaw_height_insert_bot)/S1_outjaw_slope_mid;

      S1_injaw_half_width_lomid:=S1_outjaw_half_width_mid+(S1_outjaw_height_mid-S1_injaw_height_lomid)/S1_outjaw_slope_seat;

      S1_injaw_half_width_seat:=S1_outjaw_half_width_seat;
      S1_injaw_half_width_plinth:=S1_outjaw_half_width_plinth;

      S1_injaw_side_space_lomid:=S1_injaw_half_width_lomid-1/2;  // 1/2" rib rad at lomid - use same side space for other sections

    end;//with rail section

    S1_injaw_depth_insert:=1/8;      // from gauge-face in towards web (clearance for locking bars, etc.)

      // stand x-section (no rib) ...

    S1_injaw_side_space_stand:=S1_injaw_side_space_lomid;  //S1_injaw_half_width_stand-1/8;
    S1_injaw_fillet_rad_stand:=3/16;
    S1_injaw_depth_stand:=1/8;        // from gauge-face at stand
    S1_injaw_corner_rad_stand:=1/8;


      // upper middle x-section (top of rib) ...

    S1_injaw_side_space_upmid:=S1_injaw_side_space_lomid;
    S1_injaw_fillet_rad_upmid:=3/16;
    S1_injaw_depth_upmid:=3/4;           // behind rib   reduced from dwg to allow for vertical rail
    S1_injaw_corner_rad_upmid:=1/8;


      // lower middle x-section ...

    S1_injaw_fillet_rad_lomid:=3/16;
    S1_injaw_depth_lomid:=1+9/16;         // behind rib   reduced from dwg to allow for vertical rail
    S1_injaw_corner_rad_lomid:=1/8;


      // seat x-section ...

    S1_injaw_side_space_seat:=S1_injaw_side_space_lomid;
    S1_injaw_fillet_rad_seat:=3/16;
    S1_injaw_depth_seat:=2;              // behind rib
    S1_injaw_corner_rad_seat:=1/8;


      // plinth x-section ...

    S1_injaw_side_space_plinth:=S1_injaw_side_space_lomid;
    S1_injaw_fillet_rad_plinth:=3/16;
    S1_injaw_depth_plinth:=3+1/16;       // behind rib
    S1_injaw_corner_rad_plinth:=1/8;

    //--------------------------------------------------------------------------

       // L1 outer ...

    L1_outjaw_height_top:=seat_thickness+rail_section_data_mm.rail_web_face_top_from_rail_bot_mm/inscale-1/32;  // REA (95R inclined)= 5+11/16;    jaw top is 1/32" below key top, mod for vertical rail    // from base

    L1_outjaw_height_edge:=L1_chair_edge_thick;

      // L1 top x-section...

    L1_outjaw_half_width_top:=2;      // jaw 4" wide

    L1_outjaw_depth_top:=3/4;

    L1_outjaw_corner_rad_top:=1/8;

      // L1 edge x-section ...

    try
      L1_outjaw_half_width_edge:=L1_outjaw_half_width_top+(S1_outjaw_half_width_seat-L1_outjaw_half_width_top)*(L1_outjaw_height_top-L1_outjaw_height_edge)/(L1_outjaw_height_top-seat_thickness);      // side slope to match S1
      L1_outjaw_half_width_edge:=L1_outjaw_half_width_edge-1/16; // 236d ensure loose jaw clears screw boss
    except
      L1_outjaw_half_width_edge:=L1_outjaw_half_width_top;
    end;

    L1_outjaw_depth_edge:=_2d_data.L1_chair_outlong-1/8;     // 1/8" inside to allow some gauge adjustment

    L1_outjaw_corner_rad_edge:=1/4;  // 1/4" rad

      //--------------

      // SC outer jaw (1 rib, 2 bolts) ...       Switch and Crossing  chair outers

    SC_outjaw_height_top:=S1_outjaw_height_top; // REA (95R inclined)= 5+11/16;    jaw top is 1/32" below key top, mod for vertical rail    // from base

    SC_outjaw_depth_top:=S1_outjaw_depth_top;   // behind ribs

    SC_outjaw_half_width_top:=S1_outjaw_half_width_top; // used to match inner jaw width to outer

    SC_outjaw_rib_rad_top:=1/16;
    SC_outjaw_corner_rad_top:=1/8;
    SC_outjaw_fillet_rad_top:=1/16;

    SC_outjaw_rib_side_top:=0;
    SC_outjaw_rib_end_top:=3/8;

    SC_outjaw_slope_mid:=S1_outjaw_slope_mid;        // side slope 1:17.5 down from top to middle
    SC_outjaw_slope_seat:=S1_outjaw_slope_seat;      // side slope 1:9 down from middle to seat
    SC_outjaw_slope_plinth:=S1_outjaw_slope_plinth;  // side slope 1:5 down from seat to plinth

         // SC outer middle ..

    SC_outjaw_height_mid:=S1_outjaw_height_mid;  // from base

    SC_outjaw_depth_mid:=S1_outjaw_depth_mid;    // behind ribs   increased from dwg to allow for vertical rail

    SC_outjaw_half_width_mid:=S1_outjaw_half_width_mid; // used to match inner jaw width to outer

    SC_outjaw_rib_rad_mid:=S1_outjaw_rib_rad_mid;
    SC_outjaw_corner_rad_mid:=1/8;
    SC_outjaw_fillet_rad_mid:=S1_outjaw_fillet_rad_mid;

    SC_outjaw_rib_side_mid:=0;
    SC_outjaw_rib_end_mid:=11/32;

         // outer seat ...

    SC_outjaw_depth_seat:=1+15/16;

    SC_outjaw_half_width_seat:=S1_outjaw_half_width_seat;  // used to match inner jaw width to outer

    SC_outjaw_rib_rad_seat:=S1_outjaw_rib_rad_seat;
    SC_outjaw_corner_rad_seat:=1/8;
    SC_outjaw_fillet_rad_seat:=S1_outjaw_fillet_rad_seat;

    SC_outjaw_rib_side_seat:=0;
    SC_outjaw_rib_end_seat:=5/16;

         // outer plinth ...

    SC_outjaw_depth_plinth:=2+1/4;

    SC_outjaw_half_width_plinth:=3;  // used to match inner jaw width to outer

    SC_outjaw_rib_rad_plinth:=S1_outjaw_rib_rad_plinth;
    SC_outjaw_corner_rad_plinth:=1/8;
    SC_outjaw_fillet_rad_plinth:=S1_outjaw_fillet_rad_plinth;

    SC_outjaw_rib_side_plinth:=0;
    SC_outjaw_rib_end_plinth:=9/32;

    //-------------------



  end;//with

end;
//______________________________________________________________________________

procedure Tchairs_form.FormCreate(Sender: TObject);

begin
  AutoScroll:=True;

  ClientWidth:=964;
  ClientHeight:=704;

  SetLength(chair_frames,50);  // 244a temp 0..49


  chair_frames[0]:=frame_S1;
  chair_frames[1]:=frame_S1J;

  chair_frames[2]:=frame_L1;

  chair_frames[3]:=frame_P;

  chair_frames[4]:=frame_1P_stock;
  chair_frames[5]:=frame_1P_switch;

  chair_frames[6]:=frame_3P_stock;
  chair_frames[7]:=frame_3P_switch;

  chair_frames[8]:=frame_CC_run;
  chair_frames[9]:=frame_CC_check;

  chair_frames[10]:=frame_CCLR_run;
  chair_frames[11]:=frame_CCLR_check;

  chair_frames[12]:=frame_M1;

  chair_frames[13]:=frame_ZY_ms;
  chair_frames[14]:=frame_ZY_ts;

  chair_frames[15]:=frame_XN_ms;
  chair_frames[16]:=frame_XN_ts;

  chair_frames[17]:=frame_XA_ms;
  chair_frames[18]:=frame_XA_ts;

  chair_frames[19]:=frame_AA_ms;
  chair_frames[20]:=frame_AA_ts;

  chair_frames[21]:=frame_AB_ms;
  chair_frames[22]:=frame_AB_ts;

  chair_frames[23]:=frame_BB_ms;
  chair_frames[24]:=frame_BB_ts;

  chair_frames[25]:=frame_CD_ms;
  chair_frames[26]:=frame_CD_ts;

  chair_frames[27]:=frame_DD_ms;
  chair_frames[28]:=frame_DD_ts;

  chair_frames[29]:=frame_EF_ms;
  chair_frames[30]:=frame_EF_ts;

  chair_frames[31]:=frame_SC;

  chair_frames[32]:=frame_S1O;
  chair_frames[33]:=frame_S1N;

  chair_frames[34]:=frame_L1CCLR_run;
  chair_frames[35]:=frame_L1CCLR_check;

  chair_frames[36]:=frame_L1CC_run;
  chair_frames[37]:=frame_L1CC_check;

  chair_frames[38]:=frame_L1CCRL_run;
  chair_frames[39]:=frame_L1CCRL_check;

  chair_frames[40]:=frame_PW_run;
  chair_frames[41]:=frame_PW_wing;

  chair_frames[42]:=frame_PWL_run;
  chair_frames[43]:=frame_PWL_wing;

  chair_frames[44]:=frame_PWR_run;
  chair_frames[45]:=frame_PWR_wing;

  chair_frames[46]:=frame_SS;
  chair_frames[47]:=frame_MS;

  chair_frames[48]:=frame_SDP;
  chair_frames[49]:=frame_SDS;




end;
//______________________________________________________________________________

procedure Tchairs_form.export_solid_buttonClick(Sender: TObject);   // 238a

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set checkboxes

    chair_frames[n].include_checkbox0.Checked:=True;    // include inner jaw
    chair_frames[n].include_checkbox1.Checked:=True;    // include outer jaw

    chair_frames[n].loose_checkbox0.Checked:=False;     // outer jaw is not loose

    chair_frames[n].export_checkbox1.Checked:=False;    // don't export loose jaw

    chair_frames[n].export_checkbox2.Checked:=True;     // export rail seat

    chair_frames[n].include_checkbox2.Checked:=True;    // include key

  end;//next frame

  chair_option_clicked:=1;
end;
//______________________________________________________________________________

procedure Tchairs_form.export_slots_buttonClick(Sender: TObject);    // 238a

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set checkboxes ...

    chair_frames[n].include_checkbox0.Checked:=True;    // include inner jaw
    chair_frames[n].include_checkbox1.Checked:=False;   // don't include outer jaw

    chair_frames[n].loose_checkbox0.Checked:=True;      // outer jaw is loose

    chair_frames[n].export_checkbox1.Checked:=False;    // don't export loose jaw

    chair_frames[n].export_checkbox2.Checked:=True;     // export rail seat

    chair_frames[n].include_checkbox2.Checked:=False;   // don't include key

  end;//next frame

  chair_frames[5].include_checkbox1.Checked:=True;   // over-ride include unkeyed outer jaw on switch rail heel slide chairs 1P..2P

  chair_option_clicked:=2;
end;
//______________________________________________________________________________

procedure Tchairs_form.export_loose_only_buttonClick(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set checkboxes ...

    chair_frames[n].include_checkbox0.Checked:=False;   // don't include inner jaw
    chair_frames[n].include_checkbox1.Checked:=True;    // include outer jaw

    chair_frames[n].loose_checkbox0.Checked:=True;      // outer jaw is loose

    chair_frames[n].export_checkbox1.Checked:=True;     // export loose jaw

    chair_frames[n].export_checkbox2.Checked:=False;    // export rail seat

    chair_frames[n].include_checkbox2.Checked:=True;    // include key

  end;//next frame

  chair_frames[5].include_checkbox1.Checked:=False;   // over-ride don't include unkeyed outer jaw on switch rail heel slide chairs 1P..2P

  chair_option_clicked:=3;
end;
//______________________________________________________________________________

procedure Tchairs_form.chair_frame_allinclude_checkbox0Click(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set all checkboxes

    chair_frames[n].include_checkbox0.Checked:=chair_frame_all.include_checkbox0.Checked;    // include inner jaw

  end;//next frame

  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

procedure Tchairs_form.chair_frame_allinclude_checkbox1Click(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set all checkboxes except 5

    if n<>5 then chair_frames[n].include_checkbox1.Checked:=chair_frame_all.include_checkbox1.Checked;    // include outer jaw

  end;//next frame

  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

procedure Tchairs_form.chair_frame_allinclude_checkbox2Click(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set all checkboxes except 5

    if n<>5 then chair_frames[n].include_checkbox2.Checked:=chair_frame_all.include_checkbox2.Checked;    // include key with outer jaw

  end;//next frame

  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

procedure Tchairs_form.chair_frame_allloose_checkbox0Click(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set all checkboxes

    chair_frames[n].loose_checkbox0.Checked:=chair_frame_all.loose_checkbox0.Checked;    // loose jaws

  end;//next frame

  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

procedure Tchairs_form.chair_frame_allexport_checkbox1Click(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set all checkboxes

    chair_frames[n].export_checkbox1.Checked:=chair_frame_all.export_checkbox1.Checked;    // export loose jaws

  end;//next frame

  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

procedure Tchairs_form.chair_frame_allexport_checkbox2Click(Sender: TObject);

var
  n:integer;

begin

  for n:=0 to High(chair_frames) do begin         // set all checkboxes

    chair_frames[n].export_checkbox2.Checked:=chair_frame_all.export_checkbox2.Checked;    // export seat

  end;//next frame

  chair_option_clicked:=4;     // mixed jaws
end;
//______________________________________________________________________________

procedure Tchairs_form.modify_match_panelClick(Sender: TObject);

var
  n,m:integer;

begin
  if keeps_list.Count<1
     then begin
            alert_no_bgnd;
            EXIT;
          end;

  if (modify_button.Tag<>1) and (any_selected=0)  // not called from dxf_unit  MW 29-07-2024  555a
     then begin
            if alert_no_group=True    // alert him, and does he want all?
               then EXIT;
          end;

  if modify_button.Tag<>1   // not called from dxf_unit  MW 29-07-2024  555a
     then begin
            if alert(7,'    modify  group  to  match',
                       'You are about to modify all the currently selected group templates to match these settings.'
                      +'||This will not change the control template until you click the `0apply changes to control template`1 button.',
                       '','','','','cancel','continue  -  modify  group  to  match',0)=5 then EXIT;
          end;

  for n:=0 to (keeps_list.Count-1) do begin

    with Ttemplate(keeps_list.Objects[n]) do begin   // to next template

      if bg_copied=False then CONTINUE;       // unused, nothing to export

      if (modify_button.Tag<>1) and (group_selected=False) then CONTINUE;  // ignore if not in group and not called from dxf_unit  MW 29-07-2024  555a

      for m:=0 to HIGH(chair_frames) do begin    // update from checkboxes ...

        with template_info.file_blocks do begin

              // Tjaw_options = array of array[0..5] of boolean;     6 options each jaw type

          keep_jaw_options[m][0]:=chair_frames[m].include_checkbox0.Checked;     // include inner jaw
          keep_jaw_options[m][1]:=chair_frames[m].include_checkbox1.Checked;     // include outer jaw

          keep_jaw_options[m][2]:=chair_frames[m].loose_checkbox0.Checked;       // outer jaw is loose

          keep_jaw_options[m][3]:=chair_frames[m].export_checkbox1.Checked;      // export loose jaw only
          keep_jaw_options[m][4]:=chair_frames[m].export_checkbox2.Checked;      // export rail seat

          keep_jaw_options[m][5]:=chair_frames[m].include_checkbox2.Checked;     // include key on oter jaw

        end;//with

      end;//next m frame

    end;//with template

  end;//next template
end;
//______________________________________________________________________________

procedure Tchairs_form.help_buttonClick(Sender: TObject);

begin
  help(0,'please refer to the Templot Club forum','');   // MW temporary
end;
//______________________________________________________________________________

procedure Tchairs_form.ok_panelClick(Sender: TObject);

begin
  ModalResult:=mrOk;
end;
//______________________________________________________________________________

procedure Tchairs_form.ok_panelMouseEnter(Sender: TObject);    // MW 29-07-2024  555a

begin
  ok_panel.Color:=$00D0FFD0;
end;
//______________________________________________________________________________

procedure Tchairs_form.ok_panelMouseLeave(Sender: TObject);     // MW 29-07-2024  555a

begin
  ok_panel.Color:=$0080FF80;
end;
//______________________________________________________________________________

procedure Tchairs_form.ok_panel_2MouseEnter(Sender: TObject);    // MW 29-07-2024  555a

begin
   ok_panel_2.Color:=$00D0FFD0;
end;
//______________________________________________________________________________

procedure Tchairs_form.ok_panel_2MouseLeave(Sender: TObject);   // MW 29-07-2024  555a

begin
  ok_panel_2.Color:=$0080FF80;
end;
//______________________________________________________________________________

procedure Tchairs_form.modify_match_panelMouseEnter(Sender: TObject);   // MW 29-07-2024  555a

begin
  modify_match_panel.Color:=$00FFFFD0;
end;
//______________________________________________________________________________

procedure Tchairs_form.modify_match_panelMouseLeave(Sender: TObject);  // MW 29-07-2024  555a

begin
  modify_match_panel.Color:=$00FFD898;
end;
//______________________________________________________________________________


end.


