
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

unit bgkeeps_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,

  pad_unit;

type
  Tbgkeeps_form = class(TForm)
    blue_corner_panel: TPanel;
    how_panel: TPanel;
    size_updown: TUpDown;
    colour_panel: TPanel;
    colour_patch: TImage;
    datestamp_label: TLabel;
    help_button: TButton;
    close_panel: TPanel;
    close_button: TButton;
    show_groupbox: TGroupBox;
    timber_outlines_checkbox: TCheckBox;
    timber_centres_checkbox: TCheckBox;
    gauge_faces_checkbox: TCheckBox;
    guide_marks_checkbox: TCheckBox;
    joints_checkbox: TCheckBox;
    centres_checkbox: TCheckBox;
    peg_checkbox: TCheckBox;
    outer_edges_checkbox: TCheckBox;
    template_number_checkbox: TCheckBox;
    template_name_checkbox: TCheckBox;
    reduced_ends_checkbox: TCheckBox;
    timber_infill_checkbox: TCheckBox;
    Label1: TLabel;
    timber_numbering_checkbox: TCheckBox;
    help_shape: TShape;
    apply_button: TButton;
    platforms_checkbox: TCheckBox;
    trackbed_edges_checkbox: TCheckBox;
    template_id_checkbox: TCheckBox;
    Label2: TLabel;
    bold_timber_outlines_checkbox: TCheckBox;
    chair_outlines_checkbox: TCheckBox;
    feed_droppers_checkbox: TCheckBox;
    isolation_gaps_checkbox: TCheckBox;
    stickers_checkbox: TCheckBox;
    chair_sockets_checkbox: TCheckBox;
    chair_sockets_kerf_checkbox: TCheckBox;
    timber_outlines_kerf_checkbox: TCheckBox;
    timber_outlines_flanges_checkbox: TCheckBox;
    bricks_only_timber_outlines_flanges_checkbox: TCheckBox;
    radial_centre_marks_checkbox: TCheckBox;
    dropper_ridge_marks_checkbox: TCheckBox;
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure colour_panelClick(Sender: TObject);
    procedure how_panelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure close_buttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure timber_numbering_checkboxClick(Sender: TObject);
    procedure timber_infill_checkboxClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure apply_buttonClick(Sender: TObject);
    procedure chair_outlines_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bgkeeps_form: Tbgkeeps_form;

//______________________________________________________________________________

type

    // alignment bytes added 0.81 12-06-05
    // needed in Delphi5 because Delphi2 aligned boundaries

  Txstr=double;   // 245b  11/06/2024


  Txstr_pex=record     // 245a
         x:Txstr;      //extended as double
         y:Txstr;      //extended as double
       end;

  Texp_info=record  // 233a  3D experimental stuff

              chair_key_max_offset_infile:extended;

              spare_flag1:boolean;
              spare_flag2:boolean;
              spare_flag3:boolean;
              spare_flag4:boolean;

              fw_modify_for_gw_infile:extended;  // modify MS check flangeway for gauge-widening

              slider1_str_infile:string[4];   // 1st slider on timber  5 bytes each 244a...
              slider2_str_infile:string[4];   // 2nd slider on timber
              slider3_str_infile:string[4];   // 3rd slider on timber
              slider4_str_infile:string[4];   // 4th slider on timber
              slider5_str_infile:string[4];   // 5th slider on timber

              spare_str:string[8];        // 244a  9 bytes spare

            end;//record

  Txstr_exp_info=record   // 245a

                    chair_key_max_offset_infile:Txstr;  //extended as double ;

                    spare_flag1:boolean;
                    spare_flag2:boolean;
                    spare_flag3:boolean;
                    spare_flag4:boolean;

                    fw_modify_for_gw_infile:Txstr;  //extended as double ;  // modify MS check flangeway for gauge-widening

                    slider1_str_infile:string[4];   // 1st slider on timber  5 bytes each 244a...
                    slider2_str_infile:string[4];   // 2nd slider on timber
                    slider3_str_infile:string[4];   // 3rd slider on timber
                    slider4_str_infile:string[4];   // 4th slider on timber
                    slider5_str_infile:string[4];   // 5th slider on timber

                    spare_str:string[8];        // 244a  9 bytes spare

                 end;//xstr record

//______________________________________________________________________________

  Tshove_for_file=record    // Used in the SHOVE DATA BLOCKS in the 071 files.
                            // But not used within the program - see shove_data instead.
                            // Conversion takes place in 071 on loading.

                    sf_str:string[6];           // timber number string.

                    alignment_byte_1:byte;      // D5 0.81 12-06-05

                    sf_shove_data:Tshove_data;  // all the data.

                  end;//record
//______________________________________________________________________________

  Trail_info=record     // rail settings  17-1-00

              flared_ends_ri:integer;  // 0=straight bent, 1=straight machined

              spare_int1:integer;

              knuckle_code_ri:integer;      // 214a 0=normal, -1=sharp, 1=use custom knuckle_radius_ri
              knuckle_radius_ri:extended;   // 214a custom setting - inches full-size

              custom_switch_opening_infile:extended;    // 233a inches full-size
              use_custom_switch_opening_flag:boolean;   // 233a

              spare_bool2:boolean;

              isolated_crossing_sw:boolean; //  217a

                           // rail switches ..

              k_diagonal_side_check_rail_sw:boolean;    // added 0.93.a
              k_main_side_check_rail_sw:boolean;        // added 0.93.a

              switch_drive_sw:boolean;   // 0.82.a  13-10-06

                          // rail switches...

              track_centre_lines_sw:        boolean;
              turnout_road_stock_rail_sw:   boolean;
              turnout_road_check_rail_sw:   boolean;
              turnout_road_crossing_rail_sw:boolean;
              crossing_vee_sw:              boolean;
              main_road_crossing_rail_sw:   boolean;
              main_road_check_rail_sw:      boolean;
              main_road_stock_rail_sw:      boolean;

              alignment_byte_1:byte;   // D5 0.81 12-06-05
              alignment_byte_2:byte;   // D5 0.81 12-06-05


            end;//record

  Txstr_rail_info=record

                    flared_ends_ri:integer;  // 0=straight bent, 1=straight machined

                    spare_int1:integer;

                    knuckle_code_ri:integer;      // 214a 0=normal, -1=sharp, 1=use custom knuckle_radius_ri
                    knuckle_radius_ri:Txstr;      //extended as double ;   // 214a custom setting - inches full-size

                    custom_switch_opening_infile:Txstr;       //extended as double ;    // 233a inches full-size
                    use_custom_switch_opening_flag:boolean;   // 233a

                    spare_bool2:boolean;

                    isolated_crossing_sw:boolean; //  217a

                    // rail switches ..

                    k_diagonal_side_check_rail_sw:boolean;    // added 0.93.a
                    k_main_side_check_rail_sw:boolean;        // added 0.93.a

                    switch_drive_sw:boolean;   // 0.82.a  13-10-06

                    // rail switches...

                    track_centre_lines_sw:        boolean;
                    turnout_road_stock_rail_sw:   boolean;
                    turnout_road_check_rail_sw:   boolean;
                    turnout_road_crossing_rail_sw:boolean;
                    crossing_vee_sw:              boolean;
                    main_road_crossing_rail_sw:   boolean;
                    main_road_check_rail_sw:      boolean;
                    main_road_stock_rail_sw:      boolean;

                    alignment_byte_1:byte;   // D5 0.81 12-06-05
                    alignment_byte_2:byte;   // D5 0.81 12-06-05

               end;//xstr record



  Tproto_info=record

                name_str_pi:string[15];       // gauge designation: 9 chars max actually used


                spare_str1_pi:string[74];     // 239a 75 bytes spare


                keys_on_outer_jaws_pi:boolean;  // 238a


                scale_pi     :extended;       // mm per ft.
                gauge_pi     :extended;       // mm.
                fw_pi        :extended;       // mm flangeway.
                fwe_pi       :extended;       // mm flangeway end (flangeway+flare).
                xing_fl_pi   :extended;       // mm length of flares (not h-d).
                railtop_pi   :extended;       // mm width of rail top (and bottom if bullhead).
                trtscent_pi  :extended;       // mm track centres, turnout side.
                trmscent_pi  :extended;       // mm ditto, main side.
                retcent_pi   :extended;       // mm ditto, return curve.
                min_radius_pi:extended;       // mm minimum radius for check.


                spare_str2_pi:string[49];    // 239a 50 bytes spare

                s1j_on_j1_pi:boolean;        // 238a

                rail_seats_pi:boolean;
                slab_bracket_pi:boolean;
                s1j_on_wing_pi:boolean;

                temp_wrong_k_xing_pi:boolean;   // 244a temporary for customizing

                nose_clamp_pi:boolean;
                temp_dd_parallel_wing_pi:boolean;
                xing_filler_pi:boolean;

                ms_snibs_pi:boolean;
                ts_snibs_pi:boolean;


                tbwide_pi    :extended;       // inches full-size width of turnout timbers.
                slwide_pi    :extended;       // inches full-size width of plain sleepers (not at rail joints 212a).

                xtimbsp_pi   :extended;   // !!! disused in 0.75.a 14-10-01. inches full-size timber-spacing at crossing.
                                          // retained in files when loaded by versions prior to 0.75.a

                ftimbspmax_pi:extended;       // inches full-size max timber-spacing for closure space.

                tb_pi        :extended;       // plain sleeper length mm.

                      // added in version 0.71.a 11-5-01...

                mainside_ends_pi:       boolean;    //  True=main side ends in line,
                                                    //  False=ends centralized.


                jt_slwide_pi:single;       // !!! single. inches full-size width of plain sleepers at rail joints. // 212a


                ccl_ccr_variable_pi:boolean;  // 243a  CCL  CCR  check rail end chair option

                random_end_pi:          extended;    //  amount of timber-end randomising.

                tb_end_offset_pi:extended;  // 232a

                random_angle_pi:        extended;    //  amount of timber_angle randomising.

                                 // new check and wing dimensioning : v:0.71.a 24-5-01...

                ck_ms_working1_pi:        extended;   // full-size inches - size 1 MS check rail working length (back from "A").
                ck_ms_working2_pi:        extended;   // full-size inches - size 2 MS check rail working length (back from "A").
                ck_ms_working3_pi:        extended;   // full-size inches - size 3 MS check rail working length (back from "A").

                ck_ts_working_mod_pi:     extended;   // full-size inches - TS check rail working length modifier.
                                                         // out of use 0.94.a but loaded in old files.

                ck_ms_ext1_pi:            extended;   // full-size inches - size 1 MS check rail extension length (forward from "A").
                ck_ms_ext2_pi:            extended;   // full-size inches - size 2 MS check rail extension length (forward from "A").

                ck_ts_ext_mod_pi:         extended;   // full-size inches - TS check rail extension length modifier.
                                                         // out of use 0.94.a but loaded in old files.

                wing_ms_reach1_pi:        extended;   // full-size inches - size 1 MS wing rail reach length (forward from "A").
                wing_ms_reach2_pi:        extended;   // full-size inches - size 2 MS wing rail reach length (forward from "A").

                wing_ts_reach_mod_pi:     extended;   // full-size inches - TS wing rail reach length modifier.

                   // new rail section dims 0.71.a...

                railbottom_pi:          extended;    // mm width of railfoot (FB).
                rail_height_pi:         extended;    // full-size inches rail height

                rail_seat_height_pi:extended;    // 235a full-size inches seating thickness above timber

                old_tb_pi:              extended;    // inches full-size (unlike tb_pi which is mm). used internally for gauge changes (no meaning in file).

                rail_inclination_pi:    extended;    // radians.

                ts_joint_offset_pi:extended;     // full-size inches  227a
                ms_joint_offset_pi:extended;     // full-size inches  227a

                tv_joint_offset_pi:extended;     // full-size inches  227a
                mv_joint_offset_pi:extended;     // full-size inches  227a


                spare_float6:extended;

                spare_int:integer;

                spare_byte1:byte;
                spare_byte2:byte;

              end;//record

  Txstr_proto_info=record    // 245a

                      name_str_pi:string[15];       // gauge designation: 9 chars max actually used


                      spare_str1_pi:string[74];     // 239a 75 bytes spare


                      keys_on_outer_jaws_pi:boolean;  // 238a


                      scale_pi     :Txstr;  //extended as double ;       // mm per ft.
                      gauge_pi     :Txstr;  //extended as double ;       // mm.
                      fw_pi        :Txstr;  //extended as double ;       // mm flangeway.
                      fwe_pi       :Txstr;  //extended as double ;       // mm flangeway end (flangeway+flare).
                      xing_fl_pi   :Txstr;  //extended as double ;       // mm length of flares (not h-d).
                      railtop_pi   :Txstr;  //extended as double ;       // mm width of rail top (and bottom if bullhead).
                      trtscent_pi  :Txstr;  //extended as double ;       // mm track centres, turnout side.
                      trmscent_pi  :Txstr;  //extended as double ;       // mm ditto, main side.
                      retcent_pi   :Txstr;  //extended as double ;       // mm ditto, return curve.
                      min_radius_pi:Txstr;  //extended as double ;       // mm minimum radius for check.


                      spare_str2_pi:string[49];    // 239a 50 bytes spare

                      s1j_on_j1_pi:boolean;        // 238a

                      rail_seats_pi:boolean;
                      slab_bracket_pi:boolean;
                      s1j_on_wing_pi:boolean;

                      temp_wrong_k_xing_pi:boolean;   // 244a temporary for customizing

                      nose_clamp_pi:boolean;
                      temp_dd_parallel_wing_pi:boolean;
                      xing_filler_pi:boolean;

                      ms_snibs_pi:boolean;
                      ts_snibs_pi:boolean;


                      tbwide_pi    :Txstr;  //extended as double ;       // inches full-size width of turnout timbers.
                      slwide_pi    :Txstr;  //extended as double ;       // inches full-size width of plain sleepers (not at rail joints 212a).

                      xtimbsp_pi   :Txstr;  //extended as double ;   // !!! disused in 0.75.a 14-10-01. inches full-size timber-spacing at crossing.
                      // retained in files when loaded by versions prior to 0.75.a

                      ftimbspmax_pi:Txstr;  //extended as double ;       // inches full-size max timber-spacing for closure space.

                      tb_pi        :Txstr;  //extended as double ;       // plain sleeper length mm.

                      // added in version 0.71.a 11-5-01...

                      mainside_ends_pi:       boolean;    //  True=main side ends in line,
                      //  False=ends centralized.


                      jt_slwide_pi:single;       // !!! single. inches full-size width of plain sleepers at rail joints. // 212a


                      ccl_ccr_variable_pi:boolean;  // 243a  CCL  CCR  check rail end chair option

                      random_end_pi:          Txstr;  //extended as double ;    //  amount of timber-end randomising.

                      tb_end_offset_pi:Txstr;  //extended as double ;  // 232a

                      random_angle_pi:        Txstr;  //extended as double ;    //  amount of timber_angle randomising.

                      // new check and wing dimensioning : v:0.71.a 24-5-01...

                      ck_ms_working1_pi:        Txstr;  //extended as double ;   // full-size inches - size 1 MS check rail working length (back from "A").
                      ck_ms_working2_pi:        Txstr;  //extended as double ;   // full-size inches - size 2 MS check rail working length (back from "A").
                      ck_ms_working3_pi:        Txstr;  //extended as double ;   // full-size inches - size 3 MS check rail working length (back from "A").

                      ck_ts_working_mod_pi:     Txstr;  //extended as double ;   // full-size inches - TS check rail working length modifier.
                      // out of use 0.94.a but loaded in old files.

                      ck_ms_ext1_pi:            Txstr;  //extended as double ;   // full-size inches - size 1 MS check rail extension length (forward from "A").
                      ck_ms_ext2_pi:            Txstr;  //extended as double ;   // full-size inches - size 2 MS check rail extension length (forward from "A").

                      ck_ts_ext_mod_pi:         Txstr;  //extended as double ;   // full-size inches - TS check rail extension length modifier.
                      // out of use 0.94.a but loaded in old files.

                      wing_ms_reach1_pi:        Txstr;  //extended as double ;   // full-size inches - size 1 MS wing rail reach length (forward from "A").
                      wing_ms_reach2_pi:        Txstr;  //extended as double ;   // full-size inches - size 2 MS wing rail reach length (forward from "A").

                      wing_ts_reach_mod_pi:     Txstr;  //extended as double ;   // full-size inches - TS wing rail reach length modifier.

                      // new rail section dims 0.71.a...

                      railbottom_pi:          Txstr;  //extended as double ;    // mm width of railfoot (FB).
                      rail_height_pi:         Txstr;  //extended as double ;    // full-size inches rail height

                      rail_seat_height_pi:Txstr;  //extended as double ;    // 235a full-size inches seating thickness above timber

                      old_tb_pi:              Txstr;  //extended as double ;    // inches full-size (unlike tb_pi which is mm). used internally for gauge changes (no meaning in file).

                      rail_inclination_pi:    Txstr;  //extended as double ;    // radians.

                      ts_joint_offset_pi:Txstr;  //extended as double ;     // full-size inches  227a
                      ms_joint_offset_pi:Txstr;  //extended as double ;     // full-size inches  227a

                      tv_joint_offset_pi:Txstr;  //extended as double ;     // full-size inches  227a
                      mv_joint_offset_pi:Txstr;  //extended as double ;     // full-size inches  227a


                      // 245b spare_float6:Txstr;  //extended as double ;

                      spare_int:integer;

                      spare_byte1:byte;
                      spare_byte2:byte;

                   end;//xstr record
//______________________________________________________________________________

  Ttransform_info=record             //  datums, shifts and rotations ...

                datum_y:       extended;  // y_datum, y datum point (green dot).

                x_go_limit:    extended;  // (nyi) print cropping limits (paper inches)...
                x_stop_limit:  extended;

                transforms_apply:boolean; // !!! no longer used.  // False = ignore transform data.

                alignment_byte_1:byte;   // D5 0.81 12-06-05

                x1_shift:      extended;  //  mm    shift info...
                y1_shift:      extended;  //  mm
                k_shift:       extended;  //  radians.
                x2_shift:      extended;  //  mm
                y2_shift:      extended;  //  mm

                peg_pos:       Tpex;      //  mm  peg position.

                alignment_byte_2:byte;   // D5 0.81 12-06-05
                alignment_byte_3:byte;   // D5 0.81 12-06-05

                peg_point_code:integer;   //  peg_code.
                peg_point_rail:integer;   //  peg_rail.

                mirror_on_x:   boolean;   //  True= invert on x.
                mirror_on_y:   boolean;   //  True= invert on y. (swap hand).

                exp_info:Texp_info;  // 233a  experimental stuff

              end;//record

  Txstr_transform_info=record

                          datum_y:       Txstr;  //extended as double ;  // y_datum, y datum point (green dot).

                          x_go_limit:    Txstr;  //extended as double ;  // (nyi) print cropping limits (paper inches)...
                          x_stop_limit:  Txstr;  //extended as double ;

                          transforms_apply:boolean; // !!! no longer used.  // False = ignore transform data.

                          alignment_byte_1:byte;   // D5 0.81 12-06-05

                          x1_shift:      Txstr;  //extended as double ;  //  mm    shift info...
                          y1_shift:      Txstr;  //extended as double ;  //  mm
                          k_shift:       Txstr;  //extended as double ;  //  radians.
                          x2_shift:      Txstr;  //extended as double ;  //  mm
                          y2_shift:      Txstr;  //extended as double ;  //  mm

                      xstr_peg_pos:Txstr_pex;      //  mm  peg position.

                          alignment_byte_2:byte;   // D5 0.81 12-06-05
                          alignment_byte_3:byte;   // D5 0.81 12-06-05

                          peg_point_code:integer;   //  peg_code.
                          peg_point_rail:integer;   //  peg_rail.

                          mirror_on_x:   boolean;   //  True= invert on x.
                          mirror_on_y:   boolean;   //  True= invert on y. (swap hand).

                      xstr_exp_info:Txstr_exp_info;  // 233a  experimental stuff

                       end;//xstr record

//______________________________________________________________________________

  Tplatform_trackbed_info=record

              adjacent_edges_keep:boolean;    // False=adjacent tracks,  True=trackbed edges and platform edges.

              draw_ms_trackbed_edge_keep:boolean;
              draw_ts_trackbed_edge_keep:boolean;

              spare_bool1:boolean;

              OUT_OF_USE_trackbed_width_ins_keep:extended;    // 180 inches full-size 15ft.  // not used 215a  TS and MS separated, see below

              draw_ts_platform_keep:boolean;
              draw_ts_platform_start_edge_keep:boolean;
              draw_ts_platform_end_edge_keep:boolean;
              draw_ts_platform_rear_edge_keep:boolean;

              platform_ts_front_edge_ins_keep:extended;      // centre-line to platform front edge 57 inches   4ft-9in  215a
              platform_ts_start_width_ins_keep:extended;
              platform_ts_end_width_ins_keep:extended;

              platform_ts_start_mm_keep:extended;
              platform_ts_length_mm_keep:extended;


              draw_ms_platform_keep:boolean;
              draw_ms_platform_start_edge_keep:boolean;
              draw_ms_platform_end_edge_keep:boolean;
              draw_ms_platform_rear_edge_keep:boolean;

              platform_ms_front_edge_ins_keep:extended;      // centre-line to platform front edge 57 inches   4ft-9in  215a
              platform_ms_start_width_ins_keep:extended;
              platform_ms_end_width_ins_keep:extended;

              platform_ms_start_mm_keep:extended;
              platform_ms_length_mm_keep:extended;

              OUT_OF_USE_cess_width_ins_keep:extended;            // 206a     // not used 215a  TS and MS separated, see below
              OUT_OF_USE_draw_trackbed_cess_edge_keep:boolean;    // 206a     // not used 215a  TS and MS separated, see below

                // platform skews added 207a...

              platform_ms_start_skew_mm_keep:extended;      // 207a
              platform_ms_end_skew_mm_keep:extended;        // 207a

              platform_ts_start_skew_mm_keep:extended;      // 207a
              platform_ts_end_skew_mm_keep:extended;        // 207a


              spare_bool2:boolean;
              spare_bool3:boolean;
              spare_bool4:boolean;
              spare_bool5:boolean;
              spare_bool6:boolean;
              spare_bool7:boolean;
              spare_bool8:boolean;

                  // new trackbed edge functions 215a ...   split MS and TS settings  -  using Single floats to fit available file space ...

              trackbed_ms_width_ins_keep:Single;
              trackbed_ts_width_ins_keep:Single;

              cess_ms_width_ins_keep:Single;
              cess_ts_width_ins_keep:Single;

              draw_ms_trackbed_cess_edge_keep:boolean;
              draw_ts_trackbed_cess_edge_keep:boolean;

              spare1:boolean;
              spare2:boolean;                        // 215a

              trackbed_ms_start_mm_keep:extended;    // 215a
              trackbed_ms_length_mm_keep:extended;   // 215a

              trackbed_ts_start_mm_keep:extended;    // 215a
              trackbed_ts_length_mm_keep:extended;   // 215a

            end;//record  Tplatform_trackbed_info


  Txstr_platform_trackbed_info=record    // 245a

                                  adjacent_edges_keep:boolean;    // False=adjacent tracks,  True=trackbed edges and platform edges.

                                  draw_ms_trackbed_edge_keep:boolean;
                                  draw_ts_trackbed_edge_keep:boolean;

                                  spare_bool1:boolean;

                                  OUT_OF_USE_trackbed_width_ins_keep:Txstr;  //extended as double ;    // 180 inches full-size 15ft.  // not used 215a  TS and MS separated, see below

                                  draw_ts_platform_keep:boolean;
                                  draw_ts_platform_start_edge_keep:boolean;
                                  draw_ts_platform_end_edge_keep:boolean;
                                  draw_ts_platform_rear_edge_keep:boolean;

                                  platform_ts_front_edge_ins_keep:Txstr;  //extended as double ;      // centre-line to platform front edge 57 inches   4ft-9in  215a
                                  platform_ts_start_width_ins_keep:Txstr;  //extended as double ;
                                  platform_ts_end_width_ins_keep:Txstr;  //extended as double ;

                                  platform_ts_start_mm_keep:Txstr;  //extended as double ;
                                  platform_ts_length_mm_keep:Txstr;  //extended as double ;


                                  draw_ms_platform_keep:boolean;
                                  draw_ms_platform_start_edge_keep:boolean;
                                  draw_ms_platform_end_edge_keep:boolean;
                                  draw_ms_platform_rear_edge_keep:boolean;

                                  platform_ms_front_edge_ins_keep:Txstr;  //extended as double ;      // centre-line to platform front edge 57 inches   4ft-9in  215a
                                  platform_ms_start_width_ins_keep:Txstr;  //extended as double ;
                                  platform_ms_end_width_ins_keep:Txstr;  //extended as double ;

                                  platform_ms_start_mm_keep:Txstr;  //extended as double ;
                                  platform_ms_length_mm_keep:Txstr;  //extended as double ;

                                  OUT_OF_USE_cess_width_ins_keep:Txstr;  //extended as double ;            // 206a     // not used 215a  TS and MS separated, see below
                                  OUT_OF_USE_draw_trackbed_cess_edge_keep:boolean;    // 206a     // not used 215a  TS and MS separated, see below

                                  // platform skews added 207a...

                                  platform_ms_start_skew_mm_keep:Txstr;  //extended as double ;      // 207a
                                  platform_ms_end_skew_mm_keep:Txstr;  //extended as double ;        // 207a

                                  platform_ts_start_skew_mm_keep:Txstr;  //extended as double ;      // 207a
                                  platform_ts_end_skew_mm_keep:Txstr;  //extended as double ;        // 207a


                                  spare_bool2:boolean;
                                  spare_bool3:boolean;
                                  spare_bool4:boolean;
                                  spare_bool5:boolean;
                                  spare_bool6:boolean;
                                  spare_bool7:boolean;
                                  spare_bool8:boolean;

                                  // new trackbed edge functions 215a ...   split MS and TS settings  -  using Single floats to fit available file space ...

                                  trackbed_ms_width_ins_keep:Single;
                                  trackbed_ts_width_ins_keep:Single;

                                  cess_ms_width_ins_keep:Single;
                                  cess_ts_width_ins_keep:Single;

                                  draw_ms_trackbed_cess_edge_keep:boolean;
                                  draw_ts_trackbed_cess_edge_keep:boolean;

                                  spare1:boolean;
                                  spare2:boolean;                        // 215a

                                  trackbed_ms_start_mm_keep:Txstr;  //extended as double ;    // 215a
                                  trackbed_ms_length_mm_keep:Txstr;  //extended as double ;   // 215a

                                  trackbed_ts_start_mm_keep:Txstr;  //extended as double ;    // 215a
                                  trackbed_ts_length_mm_keep:Txstr;  //extended as double ;   // 215a

                               end;//xstr record

//______________________________________________________________________________

  Talignment_info=record              //  curving and transition info...

               curving_flag:   boolean;    // !!! no longer used 0.77.a !!! True=curved, False=straight.
                                           // but needed for check on loading older files.
                                           // - all templates now curved (straight=max_rad).

               trans_flag:     boolean;    // True=transition, False=fixed radius curving

               fixed_rad:      extended;   // fixed radius mm.
               trans_rad1:     extended;   // first transition radius mm.
               trans_rad2:     extended;   // second transition radius mm.
               trans_length:   extended;   // length of transition mm.
               trans_start:    extended;   // start of transition mm.
               rad_offset:     extended;   // curving line offset mm. no longer used

               alignment_byte_1:byte;   // D5 0.81 12-06-05
               alignment_byte_2:byte;   // D5 0.81 12-06-05

               tanh_kmax:double;        // factor for mode 2 slews.
                                        // !!! double used because only 8 bytes available in existing file format

               slewing_flag:   boolean;   // slewing flag.
               cl_only_flag:   boolean;   // draw track centre-line only for bgnd

               slew_type:byte;            // !!! byte used because only 1 byte available in existing file format 1-11-99

               dummy_template_flag:boolean;  // 212a

               slew_start:     extended;  // slewing zone start mm.
               slew_length:    extended;  // slewing zone length mm.
               slew_amount:    extended;  // amount of slew mm.


               cl_options_code_int:integer;            // 206a
               cl_options_custom_offset_ext:extended;  // 206a

                // 216a ...

               reminder_flag:boolean;
               reminder_colour:integer;

               reminder_str:string[200];

               osk_match_kn:extended;  // 226a

               total_length_of_sleepering:extended;  // 226a  no room elsewhere for this mod
               file_number_of_timbers:integer;       // 226a
               file_number_of_sleepers:integer;      // 226a

               spare_bool1:boolean;                  // 226a
               spare_bool2:boolean;                  // 226a


               spare_int:integer;

	     end;//record

  Txstr_alignment_info=record

                        curving_flag:   boolean;    // !!! no longer used 0.77.a !!! True=curved, False=straight.
                        // but needed for check on loading older files.
                        // - all templates now curved (straight=max_rad).

                        trans_flag:     boolean;    // True=transition, False=fixed radius curving

                        fixed_rad:      Txstr;  //extended as double ;   // fixed radius mm.
                        trans_rad1:     Txstr;  //extended as double ;   // first transition radius mm.
                        trans_rad2:     Txstr;  //extended as double ;   // second transition radius mm.
                        trans_length:   Txstr;  //extended as double ;   // length of transition mm.
                        trans_start:    Txstr;  //extended as double ;   // start of transition mm.
                        rad_offset:     Txstr;  //extended as double ;   // curving line offset mm. no longer used

                        alignment_byte_1:byte;   // D5 0.81 12-06-05
                        alignment_byte_2:byte;   // D5 0.81 12-06-05

                        tanh_kmax:double;        // factor for mode 2 slews.
                                                 // !!! double used because only 8 bytes available in existing file format

                        slewing_flag:   boolean;   // slewing flag.
                        cl_only_flag:   boolean;   // draw track centre-line only for bgnd

                        slew_type:byte;            // !!! byte used because only 1 byte available in existing file format 1-11-99

                        dummy_template_flag:boolean;  // 212a

                        slew_start:     Txstr;  //extended as double ;  // slewing zone start mm.
                        slew_length:    Txstr;  //extended as double ;  // slewing zone length mm.
                        slew_amount:    Txstr;  //extended as double ;  // amount of slew mm.

                        cl_options_code_int:integer;            // 206a
                        cl_options_custom_offset_ext:Txstr;  //extended as double ;  // 206a

                        // 216a ...

                        reminder_flag:boolean;
                        reminder_colour:integer;

                        reminder_str:string[200];

                        osk_match_kn:Txstr;  //extended as double ;  // 226a

                        total_length_of_sleepering:Txstr;  //extended as double ;  // 226a  no room elsewhere for this mod
                        file_number_of_timbers:integer;       // 226a
                        file_number_of_sleepers:integer;      // 226a

                        spare_bool1:boolean;                  // 226a
                        spare_bool2:boolean;                  // 226a

                        spare_int:integer;

                       end;//xstr record

//______________________________________________________________________________


  Tplain_track_info=record     // plain-track record includes user-defined peg data...

                 pt_custom:boolean;        // custom plain track flag.

                 alignment_byte_1:byte;   // D5 0.81 12-06-05
                 alignment_byte_2:byte;   // D5 0.81 12-06-05
                 alignment_byte_3:byte;   // D5 0.81 12-06-05

                 list_index:integer;
                 rail_length:extended;         // rail length in inches.

                 alignment_byte_4:byte;   // D5 0.81 12-06-05
                 alignment_byte_5:byte;   // D5 0.81 12-06-05

                 sleepers_per_length:integer;                     // number of sleepers per length.
                 sleeper_centres:array[0..psleep_c] of extended;  // spacings in inches for custom.


                 rail_joints_code:integer;   // 0=normal, 1=staggered, -1=none (cwr).


                 // user-defined peg data - here for expediency... (enough spares)..

                 user_peg_rail:integer;   // 13-3-01

                 pt_spare_flag1:boolean;
                 pt_spare_flag2:boolean;
                 pt_spare_flag3:boolean;

                 user_peg_data_valid:boolean;    // 13-3-01 ...

                 user_pegx:extended;
                 user_pegy:extended;
                 user_pegk:extended;

                 pt_spacing_name_str:string[200];     // 17-1-01

                 alignment_byte_6:byte;   // D5 0.81 12-06-05

                 pt_tb_rolling_percent:extended;      // 0.76.a  17-5-02.

                 gaunt_sleeper_mod_inches:extended;       // 0.93.a ex 0.81

                 pt_blanking_length:extended;    // 229a  pt_blank  mm

                 pt_spare_ext2:extended;
                 pt_spare_ext1:extended;

                 alignment_byte_7:byte;   // D5 0.81 12-06-05

                 waybeams_template_flag:boolean;   // 235a

               end;//record

  Txstr_plain_track_info=record     //245a

                          pt_custom:boolean;        // custom plain track flag.

                          alignment_byte_1:byte;   // D5 0.81 12-06-05
                          alignment_byte_2:byte;   // D5 0.81 12-06-05
                          alignment_byte_3:byte;   // D5 0.81 12-06-05

                          list_index:integer;
                          rail_length:Txstr;  //extended as double ;         // rail length in inches.

                          alignment_byte_4:byte;   // D5 0.81 12-06-05
                          alignment_byte_5:byte;   // D5 0.81 12-06-05

                          sleepers_per_length:integer;                     // number of sleepers per length.
                          sleeper_centres:array[0..psleep_c] of Txstr;  //extended as double ;  // spacings in inches for custom.


                          rail_joints_code:integer;   // 0=normal, 1=staggered, -1=none (cwr).


                          // user-defined peg data - here for expediency... (enough spares)..

                          user_peg_rail:integer;   // 13-3-01

                          pt_spare_flag1:boolean;
                          pt_spare_flag2:boolean;
                          pt_spare_flag3:boolean;

                          user_peg_data_valid:boolean;    // 13-3-01 ...

                          user_pegx:Txstr;  //extended as double ;
                          user_pegy:Txstr;  //extended as double ;
                          user_pegk:Txstr;  //extended as double ;

                          pt_spacing_name_str:string[200];     // 17-1-01

                          alignment_byte_6:byte;   // D5 0.81 12-06-05

                          pt_tb_rolling_percent:Txstr;  //extended as double ;      // 0.76.a  17-5-02.

                          gaunt_sleeper_mod_inches:Txstr;  //extended as double ;       // 0.93.a ex 0.81

                          pt_blanking_length:Txstr;  //extended as double ;    // 229a  pt_blank  mm

                          // 245b pt_spare_ext2:Txstr;  //extended as double ;
                          // 245b pt_spare_ext1:Txstr;  //extended as double ;

                          alignment_byte_7:byte;   // D5 0.81 12-06-05

                          waybeams_template_flag:boolean;   // 235a

                         end;//xstr record
  //________________________________________________

  //  these record types apply to turnouts only...

  Tswitch_info=record      // switch stuff...

            old_size:        integer;       // old index into list of switches (pre 0.77.a).
            sw_name_str:     string[100];   // name of switch.

            spare_bool1:boolean;
            spare_bool2:boolean;
            spare_bool3:boolean;

            sw_pattern:integer;                // type of switch.
            planing:extended;                  // (B) planing length (inches).
            planing_angle:extended;            // unit planing angle.
            switch_radius_inchormax:extended;  // switch radius (inches!) (or max_rad (in mm) for straight switch).
            switch_rail:extended;              // (C) length of switch rail (inches).
            stock_rail:extended;               // (S) length of stock rail (inches).
            heel_lead_inches:extended;         // (L) lead to heel (incl. planing) (inches).
            heel_offset_inches:extended;       // (H) heel-offset (inches).
            switch_front_inches:extended;      // stock-rail-end to toe (inches).
            planing_radius:extended;           // planing radius for double-curved switch.
            sleeper_j1:extended;               // first switch-front sleeper spacing back from TOE (NEGATIVE inches).
            sleeper_j2:extended;               // second switch-front sleeper spacing back from the first (NEGATIVE inches).

            timber_centres:array[0..swtimbco_c] of extended;  // list of timber centres (in inches).

            group_code:integer;    //  which group of switches.        0.77.a  7-6-02.
            size_code:integer;     //  size within group (1=shortest). 0.77.a  7-6-02.

            joggle_depth:extended;    //  depth of joggle. 0.71.a 13-4-01.
            joggle_length:extended;   //  length of joggle in front of toe (+ve). 0.71.a 13-4-01.

            group_count:integer;      // number of switches in this group (max size_code in this group, min size is always 1).

            joggled_stock_rail:boolean;

            num_block_slide_chairs_in_T:byte;  // 241a
            num_block_heel_chairs_in_T:byte;   // 241a

            alignment_byte_6:byte;   // D5 0.81 12-06-05

            spare_int2:integer;
            spare_int1:integer;

            valid_data:boolean;        // True = valid data here. 0.77.a 9-6-02...
            front_timbered:boolean;    // True = switch front sleepers are timber width.

            num_bridge_chairs_main_rail:byte;     // not used in experimental chairing
            num_bridge_chairs_turnout_rail:byte;  // not used in experimental chairing

            fb_tip_offset:extended;   // 0.76.a  2-1-02. fbtip dimension (FB foot from gauge-face at tip).

            sleeper_j3:extended;   //  third switch-front sleeper spacing back from the second (NEGATIVE inches).
            sleeper_j4:extended;   //  fourth switch-front sleeper spacing back from the third (NEGATIVE inches).
            sleeper_j5:extended;   //  fifth switch-front sleeper spacing back from the fourth (NEGATIVE inches).

            spare_float4:extended;
            spare_float3:extended;
            spare_float2:extended;
            spare_float1:extended;

            spare_str:string[200];

            num_slide_chairs:byte;           // 214a
            num_block_slide_chairs:byte;     // 214a
            num_block_heel_chairs:byte;      // 214a

          end;//record

  Txstr_switch_info=record

                      old_size:        integer;       // old index into list of switches (pre 0.77.a).
                      sw_name_str:     string[100];   // name of switch.

                      spare_bool1:boolean;
                      spare_bool2:boolean;
                      spare_bool3:boolean;

                      sw_pattern:integer;                // type of switch.
                      planing:Txstr;  //extended as double ;                  // (B) planing length (inches).
                      planing_angle:Txstr;  //extended as double ;            // unit planing angle.
                      switch_radius_inchormax:Txstr;  //extended as double ;  // switch radius (inches!) (or max_rad (in mm) for straight switch).
                      switch_rail:Txstr;  //extended as double ;              // (C) length of switch rail (inches).
                      stock_rail:Txstr;  //extended as double ;               // (S) length of stock rail (inches).
                      heel_lead_inches:Txstr;  //extended as double ;         // (L) lead to heel (incl. planing) (inches).
                      heel_offset_inches:Txstr;  //extended as double ;       // (H) heel-offset (inches).
                      switch_front_inches:Txstr;  //extended as double ;      // stock-rail-end to toe (inches).
                      planing_radius:Txstr;  //extended as double ;           // planing radius for double-curved switch.
                      sleeper_j1:Txstr;  //extended as double ;               // first switch-front sleeper spacing back from TOE (NEGATIVE inches).
                      sleeper_j2:Txstr;  //extended as double ;               // second switch-front sleeper spacing back from the first (NEGATIVE inches).

                      timber_centres:array[0..swtimbco_c] of Txstr;  //extended as double ;  // list of timber centres (in inches).

                      group_code:integer;    //  which group of switches.        0.77.a  7-6-02.
                      size_code:integer;     //  size within group (1=shortest). 0.77.a  7-6-02.

                      joggle_depth:Txstr;  //extended as double ;    //  depth of joggle. 0.71.a 13-4-01.
                      joggle_length:Txstr;  //extended as double ;   //  length of joggle in front of toe (+ve). 0.71.a 13-4-01.

                      group_count:integer;      // number of switches in this group (max size_code in this group, min size is always 1).

                      joggled_stock_rail:boolean;

                      num_block_slide_chairs_in_T:byte;  // 241a
                      num_block_heel_chairs_in_T:byte;   // 241a

                      alignment_byte_6:byte;   // D5 0.81 12-06-05

                      spare_int2:integer;
                      spare_int1:integer;

                      valid_data:boolean;        // True = valid data here. 0.77.a 9-6-02...
                      front_timbered:boolean;    // True = switch front sleepers are timber width.

                      num_bridge_chairs_main_rail:byte;     // not used in experimental chairing
                      num_bridge_chairs_turnout_rail:byte;  // not used in experimental chairing

                      fb_tip_offset:Txstr;  //extended as double ;   // 0.76.a  2-1-02. fbtip dimension (FB foot from gauge-face at tip).

                      sleeper_j3:Txstr;  //extended as double ;   //  third switch-front sleeper spacing back from the second (NEGATIVE inches).
                      sleeper_j4:Txstr;  //extended as double ;   //  fourth switch-front sleeper spacing back from the third (NEGATIVE inches).
                      sleeper_j5:Txstr;  //extended as double ;   //  fifth switch-front sleeper spacing back from the fourth (NEGATIVE inches).

                      // 245b spare_float4:Txstr;  //extended as double ;
                      // 245b spare_float3:Txstr;  //extended as double ;
                      // 245b spare_float2:Txstr;  //extended as double ;
                      // 245b spare_float1:Txstr;  //extended as double ;

                      spare_str:string[200];

                      num_slide_chairs:byte;           // 214a
                      num_block_slide_chairs:byte;     // 214a
                      num_block_heel_chairs:byte;      // 214a

                    end;//xste record

//______________________________________________________________________________

  Tcrossing_info=record        // crossing stuff...

              pattern:           integer;     // 0=straight, 1=curviform, 2=parallel, -1=generic.

              sl_mode:           integer;     // 0=auto_fit, 1=use fixed_sl.
              retcent_mode:      integer;     // 0=return centres as adjacent track, 1=use custom centres.
              k3n_unit_angle:    extended;    // k3n angle in units.
              fixed_st:          extended;    // length of knuckle straight. mm.

              spare_int3:        integer;

              hd_timbers_code:   integer;     // extended half-diamond timbers for slip road.
              hd_vchecks_code:   integer;     // shortening code for half-diamond v-crossing check rails.

              k_check_length_1:  extended;    // length of size 1 k-crossing check rail (inches).
              k_check_length_2:  extended;    // length of size 2 k-crossing check rail (inches).
              k_check_mod_ms:    extended;    // main side modifer.
              k_check_mod_ds:    extended;    // diamond side modifer.
              k_check_flare:     extended;    // length of flare on k-crossing check rails.

              curviform_timbering_keep:boolean;  // 215a

              simplified_short_angle_keep:boolean;  // 228a

              main_road_code:integer;      //  length of main-side exit road

              tandem_timber_code:integer;   //   218a

                  // 0.75.a  9-10-01...

              blunt_nose_width:    extended;    // full-size inches.
              blunt_nose_to_timb:  extended;    // full-size inches - to "A" timber centre.

              vee_joint_half_spacing: extended;    // full-size inches - rail overlap at vee point rail joint.
              wing_joint_spacing:     extended;    // full-size inches - timber spacing at wing rail joint.

              wing_timber_spacing: extended;    // full-size inches - timber spacing for wing rail front part of crossing (up to "A").
              vee_timber_spacing:  extended;    // full-size inches - timber spacing for vee point rail part of crossing (on from "A").

                   // number of timbers spanned by vee rail incl. "A" timber.

              vee_joint_space_co1:byte;
              vee_joint_space_co2:byte;
              vee_joint_space_co3:byte;
              vee_joint_space_co4:byte;
              vee_joint_space_co5:byte;
              vee_joint_space_co6:byte;

                   // number of timbers spanned by wing rail front excl. "A" timber...

              wing_joint_space_co1:byte;
              wing_joint_space_co2:byte;
              wing_joint_space_co3:byte;
              wing_joint_space_co4:byte;
              wing_joint_space_co5:byte;
              wing_joint_space_co6:byte;

              spare_flag1:boolean;
              spare_flag2:boolean;

              main_road_endx_infile:extended;  // 217a


              hdkn_unit_angle:extended;    // half-diamond hdkn angle in units.

              spare_str2:string[159];  // 160 bytes   was patch_info:Tcheck_flare_info_081;  // 234e not used

              k_custom_wing_long_keep:extended;   // 0.95.a inches full-size k-crossing wing rails
              k_custom_point_long_keep:extended;  // 0.95.a inches full-size k-crossing point rails   NYI

              use_k_custom_wing_rails_keep:boolean;   // 0.95.a
              use_k_custom_point_rails_keep:boolean;  // 0.95.a  NYI

              spare_str:string[10];    // 0.95.a was 30

              generic_was_short_swapped_keep:boolean;  // 228a

            end;//record

  Txstr_crossing_info=record

                        pattern:           integer;     // 0=straight, 1=curviform, 2=parallel, -1=generic.

                        sl_mode:           integer;     // 0=auto_fit, 1=use fixed_sl.
                        retcent_mode:      integer;     // 0=return centres as adjacent track, 1=use custom centres.
                        k3n_unit_angle:    Txstr;  //extended as double ;    // k3n angle in units.
                        fixed_st:          Txstr;  //extended as double ;    // length of knuckle straight. mm.

                        spare_int3:        integer;

                        hd_timbers_code:   integer;     // Txstr;  //extended as double  half-diamond timbers for slip road.
                        hd_vchecks_code:   integer;     // shortening code for half-diamond v-crossing check rails.

                        k_check_length_1:  Txstr;  //extended as double ;    // length of size 1 k-crossing check rail (inches).
                        k_check_length_2:  Txstr;  //extended as double ;    // length of size 2 k-crossing check rail (inches).
                        k_check_mod_ms:    Txstr;  //extended as double ;    // main side modifer.
                        k_check_mod_ds:    Txstr;  //extended as double ;    // diamond side modifer.
                        k_check_flare:     Txstr;  //extended as double ;    // length of flare on k-crossing check rails.

                        curviform_timbering_keep:boolean;  // 215a

                        simplified_short_angle_keep:boolean;  // 228a

                        main_road_code:integer;      //  length of main-side exit road

                        tandem_timber_code:integer;   //   218a

                        // 0.75.a  9-10-01...

                        blunt_nose_width:    Txstr;  //extended as double ;    // full-size inches.
                        blunt_nose_to_timb:  Txstr;  //extended as double ;    // full-size inches - to "A" timber centre.

                        vee_joint_half_spacing: Txstr;  //extended as double ;    // full-size inches - rail overlap at vee point rail joint.
                        wing_joint_spacing:     Txstr;  //extended as double ;    // full-size inches - timber spacing at wing rail joint.

                        wing_timber_spacing: Txstr;  //extended as double ;    // full-size inches - timber spacing for wing rail front part of crossing (up to "A").
                        vee_timber_spacing:  Txstr;  //extended as double ;    // full-size inches - timber spacing for vee point rail part of crossing (on from "A").

                        // number of timbers spanned by vee rail incl. "A" timber.

                        vee_joint_space_co1:byte;
                        vee_joint_space_co2:byte;
                        vee_joint_space_co3:byte;
                        vee_joint_space_co4:byte;
                        vee_joint_space_co5:byte;
                        vee_joint_space_co6:byte;

                        // number of timbers spanned by wing rail front excl. "A" timber...

                        wing_joint_space_co1:byte;
                        wing_joint_space_co2:byte;
                        wing_joint_space_co3:byte;
                        wing_joint_space_co4:byte;
                        wing_joint_space_co5:byte;
                        wing_joint_space_co6:byte;

                        spare_flag1:boolean;
                        spare_flag2:boolean;

                        main_road_endx_infile:Txstr;  //extended as double ;  // 217a


                        hdkn_unit_angle:Txstr;  //extended as double ;    // half-diamond hdkn angle in units.

                        spare_str2:string[159];  // 160 bytes   was patch_info:Tcheck_flare_info_081;  // 234e not used

                        k_custom_wing_long_keep:Txstr;  //extended as double ;   // 0.95.a inches full-size k-crossing wing rails
                        k_custom_point_long_keep:Txstr;  //extended as double ;  // 0.95.a inches full-size k-crossing point rails   NYI

                        use_k_custom_wing_rails_keep:boolean;   // 0.95.a
                        use_k_custom_point_rails_keep:boolean;  // 0.95.a  NYI

                        spare_str:string[10];    // 0.95.a was 30

                        generic_was_short_swapped_keep:boolean;  // 228a

                      end;//xstr record

//______________________________________________________________________________

  Tturnout_info1=record          // data for the turnout size...

                   plain_track_flag: boolean;      //  True=plain track only.

                   rolled_in_sleepered_flag:boolean;  // 223a

                   front_timbers_flag:boolean;     //  218a

                   approach_rails_only_flag:boolean;   //  218a

                   hand:             integer;      //  hand of turnout.
                   timbering_flag:   boolean;      //  True = equalized timbering.

                   switch_timbers_flag:boolean;    //  218a
                   closure_timbers_flag:boolean;   //  218a
                   xing_timbers_flag:boolean;      //  218a

                   exit_timbering:   integer;      //  exit timbering style.
                   turnout_road_code:integer;      //  length of turnout exit road.

                   turnout_length:   extended;     //  turnoutx.
                   origin_to_toe:    extended;     //  xorg.
                   step_size:        extended;     //  incx. (use saved step-size on reloading - not default).

                   turnout_road_is_adjustable:boolean;  // 211a

                   turnout_road_is_minimum:boolean;     // 217a

                 end;//tturnout_info1 record

  Txstr_turnout_info1=record   // 245a

                        plain_track_flag: boolean;      //  True=plain track only.

                        rolled_in_sleepered_flag:boolean;  // 223a

                        front_timbers_flag:boolean;     //  218a

                        approach_rails_only_flag:boolean;   //  218a

                        hand:             integer;      //  hand of turnout.
                        timbering_flag:   boolean;      //  True = equalized timbering.

                        switch_timbers_flag:boolean;    //  218a
                        closure_timbers_flag:boolean;   //  218a
                        xing_timbers_flag:boolean;      //  218a

                        exit_timbering:   integer;      //  exit timbering style.
                        turnout_road_code:integer;      //  length of turnout exit road.

                        turnout_length:   Txstr;  //extended as double ;     //  turnoutx.
                        origin_to_toe:    Txstr;  //extended as double ;     //  xorg.
                        step_size:        Txstr;  //extended as double ;     //  incx. (use saved step-size on reloading - not default).

                        turnout_road_is_adjustable:boolean;  // 211a

                        turnout_road_is_minimum:boolean;     // 217a

                      end;//xstr record

//______________________________________________________________________________                      


  Thdk_check_rail_info=record         // K-crossing check and wing rail lengths. 0.79.a

                        k_check_ms_1:        extended;   // full-size inches - size 1 MS k-crossing check rail length.
                        k_check_ms_2:        extended;   // full-size inches - size 2 MS k-crossing check rail length.

                        k_check_ds_1:        extended;   // full-size inches - size 1 DS k-crossing check rail length.
                        k_check_ds_2:        extended;   // full-size inches - size 2 DS k-crossing check rail length.
                     end;//record

  Txstr_hdk_check_rail_info=record     // 245a
                              k_check_ms_1:Txstr;  //extended as double ;   // full-size inches - size 1 MS k-crossing check rail length.
                              k_check_ms_2:Txstr;  //extended as double ;   // full-size inches - size 2 MS k-crossing check rail length.

                              k_check_ds_1:Txstr;  //extended as double ;   // full-size inches - size 1 DS k-crossing check rail length.
                              k_check_ds_2:Txstr;  //extended as double ;   // full-size inches - size 2 DS k-crossing check rail length.
                            end;//xstr record

//______________________________________________________________________________


  Tvee_check_rail_info=record         // V-crossing check and wing rail lengths. 0.79.a

                        v_check_ms_working1:        extended;   // full-size inches - size 1 MS check rail working length (back from "A").
                        v_check_ms_working2:        extended;   // full-size inches - size 2 MS check rail working length (back from "A").
                        v_check_ms_working3:        extended;   // full-size inches - size 3 MS check rail working length (back from "A").

                        v_check_ts_working1:        extended;   // full-size inches - size 1 TS check rail working length (back from "A").
                        v_check_ts_working2:        extended;   // full-size inches - size 2 TS check rail working length (back from "A").
                        v_check_ts_working3:        extended;   // full-size inches - size 3 TS check rail working length (back from "A").

                        v_check_ms_ext1:            extended;   // full-size inches - size 1 MS check rail extension length (forward from "A").
                        v_check_ms_ext2:            extended;   // full-size inches - size 2 MS check rail extension length (forward from "A").

                        v_check_ts_ext1:            extended;   // full-size inches - size 1 TS check rail extension length (forward from "A").
                        v_check_ts_ext2:            extended;   // full-size inches - size 2 TS check rail extension length (forward from "A").

                        v_wing_ms_reach1:           extended;   // full-size inches - size 1 MS wing rail reach length (forward from "A").
                        v_wing_ms_reach2:           extended;   // full-size inches - size 2 MS wing rail reach length (forward from "A").

                        v_wing_ts_reach1:           extended;   // full-size inches - size 1 TS wing rail reach length (forward from "A").
                        v_wing_ts_reach2:           extended;   // full-size inches - size 2 TS wing rail reach length (forward from "A").
                     end;//record

                     
  Txstr_vee_check_rail_info=record   // 245a

                              v_check_ms_working1:        Txstr;  //extended as double ;   // full-size inches - size 1 MS check rail working length (back from "A").
                              v_check_ms_working2:        Txstr;  //extended as double ;   // full-size inches - size 2 MS check rail working length (back from "A").
                              v_check_ms_working3:        Txstr;  //extended as double ;   // full-size inches - size 3 MS check rail working length (back from "A").

                              v_check_ts_working1:        Txstr;  //extended as double ;   // full-size inches - size 1 TS check rail working length (back from "A").
                              v_check_ts_working2:        Txstr;  //extended as double ;   // full-size inches - size 2 TS check rail working length (back from "A").
                              v_check_ts_working3:        Txstr;  //extended as double ;   // full-size inches - size 3 TS check rail working length (back from "A").

                              v_check_ms_ext1:            Txstr;  //extended as double ;   // full-size inches - size 1 MS check rail extension length (forward from "A").
                              v_check_ms_ext2:            Txstr;  //extended as double ;   // full-size inches - size 2 MS check rail extension length (forward from "A").

                              v_check_ts_ext1:            Txstr;  //extended as double ;   // full-size inches - size 1 TS check rail extension length (forward from "A").
                              v_check_ts_ext2:            Txstr;  //extended as double ;   // full-size inches - size 2 TS check rail extension length (forward from "A").

                              v_wing_ms_reach1:           Txstr;  //extended as double ;   // full-size inches - size 1 MS wing rail reach length (forward from "A").
                              v_wing_ms_reach2:           Txstr;  //extended as double ;   // full-size inches - size 2 MS wing rail reach length (forward from "A").

                              v_wing_ts_reach1:           Txstr;  //extended as double ;   // full-size inches - size 1 TS wing rail reach length (forward from "A").
                              v_wing_ts_reach2:           Txstr;  //extended as double ;   // full-size inches - size 2 TS wing rail reach length (forward from "A").

                            end;//xstr record

//______________________________________________________________________________

  Tcheck_end_diff=record    // 0.94.a
                    len_diff:extended;   // length differ  inches f-s
                    flr_diff:extended;   // flare length   inches f-s
                    gap_diff:extended;   // end gap        model mm

                    type_diff:byte;      // 0=no diff   1=change to bent flare    2=change to machined flare   3= change to no flare
                  end;//record

  Txstr_check_end_diff=record    // 0.94.a
                        len_diff:Txstr;  //extended as double ;   // length differ  inches f-s
                        flr_diff:Txstr;  //extended as double ;   // flare length   inches f-s
                        gap_diff:Txstr;  //extended as double ;   // end gap        model mm

                        type_diff:byte;      // 0=no diff   1=change to bent flare    2=change to machined flare   3= change to no flare
                       end;//xstr record


  Tcheck_diffs=record    // 0.94.a
                 end_diff_mw:Tcheck_end_diff;
                 end_diff_me:Tcheck_end_diff;
                 end_diff_mr:Tcheck_end_diff;
                 end_diff_tw:Tcheck_end_diff;
                 end_diff_te:Tcheck_end_diff;
                 end_diff_tr:Tcheck_end_diff;
                 end_diff_mk:Tcheck_end_diff;
                 end_diff_dk:Tcheck_end_diff;
               end;//record

  Txstr_check_diffs=record    // 0.94.a
                 xstr_end_diff_mw:Txstr_check_end_diff;
                 xstr_end_diff_me:Txstr_check_end_diff;
                 xstr_end_diff_mr:Txstr_check_end_diff;
                 xstr_end_diff_tw:Txstr_check_end_diff;
                 xstr_end_diff_te:Txstr_check_end_diff;
                 xstr_end_diff_tr:Txstr_check_end_diff;
                 xstr_end_diff_mk:Txstr_check_end_diff;
                 xstr_end_diff_dk:Txstr_check_end_diff;
               end;//xstr record

//______________________________________________________________________________

  Tturnout_info2=record
                   switch_info:      Tswitch_info;      //  all the switch dimensions.
                   crossing_info:    Tcrossing_info;    //  all the crossing dimensions.
                   plain_track_info: Tplain_track_info; //  need the plain track info for approach and exit tracks.

                   diamond_auto_code:integer;      // 0.77.a 0=auto, 1=fixed diamond, 2=switch diamond.

                   bonus_timber_count:integer;     // 0.76.a number of bonus timbers.

                   equalizing_fixed_flag:boolean;  // equalizing style 1-4-00
                   no_timbering_flag:boolean;      // no timbering option 7-9-00

                   angled_on_flag:boolean;         // angled-on style 29-7-01.

                   chairing_flag:boolean;          // 214a

                   start_draw_x:extended;          // startx.

                   timber_length_inc:extended;     // timbinc timber length step size.

                   //------
                   omit_switch_front_joints:boolean;  // 0.79.a
                   omit_switch_rail_joints:boolean;
                   omit_stock_rail_joints:boolean;
                   omit_wing_rail_joints:boolean;
                   omit_vee_rail_joints:boolean;
                   omit_k_crossing_stock_rail_joints:boolean;

                   omit_ts_exit_joints:boolean;    // 227a
                   omit_ms_exit_joints:boolean;    // 227a

                   use_all_bridge_chairs_flag:boolean;     // 230a

                   diamond_switch_timbering_flag:boolean;  // 213a

                   //------


                   gaunt_flag:boolean;    // True = gaunt template 0.81.a

                   diamond_proto_timbering_flag:boolean;    // 0.77.b

                   semi_diamond_flag:boolean;      // True = half-diamond template.
                   diamond_fixed_flag:boolean;     // True = fixed-diamond.


                   hdk_check_rail_info:Thdk_check_rail_info;

                   vee_check_rail_info:Tvee_check_rail_info;

                   turnout_road_endx_infile:extended;   // 209a length of turnout road from CTRL-1

                   key_direction_infile:integer;      // 233a   0=random/towards joint, 1=forwards, -1=backwards
                   keys_towards_joint_flag:boolean;   // 233a

                   omit_ts_plain_track_joints:boolean;    // 227a  also for turnout approach and exit track
                   omit_ms_plain_track_joints:boolean;    // 227a  also for turnout approach and exit track

                   smallest_radius_stored:extended; // 208a needed for box data -- not loaded to the control

                   dpx_stored:extended;      // 208a needed for ID number creation -- not loaded to the control
                   ipx_stored:extended;      // 208a needed for ID number creation -- not loaded to the control
                   fpx_stored:extended;      // 208a needed for ID number creation -- not loaded to the control


                   gaunt_offset_inches:extended;  // 0.81

                      // 219a  include connectors for XTrackCAD in export DXF file  -- not loaded to the control  ...

                   xtc_connector_0:boolean;  // CTRL-0  nyi
                   xtc_connector_t:boolean;  // TEXITP  nyi
                   xtc_connector_9:boolean;  // CTRL-9  nyi

                 end;//Tturnout_info2 record

  Txstr_turnout_info2=record

                    xstr_switch_info:      Txstr_switch_info;      //  all the switch dimensions.
                    xstr_crossing_info:    Txstr_crossing_info;    //  all the crossing dimensions.
                    xstr_plain_track_info: Txstr_plain_track_info; //  need the plain track info for approach and exit tracks.

                        diamond_auto_code:integer;      // 0.77.a 0=auto, 1=fixed diamond, 2=switch diamond.

                        bonus_timber_count:integer;     // 0.76.a number of bonus timbers.

                        equalizing_fixed_flag:boolean;  // equalizing style 1-4-00
                        no_timbering_flag:boolean;      // no timbering option 7-9-00

                        angled_on_flag:boolean;         // angled-on style 29-7-01.

                        chairing_flag:boolean;          // 214a

                        start_draw_x:Txstr;  //extended as double ;          // startx.

                        timber_length_inc:Txstr;  //extended as double ;     // timbinc timber length step size.

                        //------
                        omit_switch_front_joints:boolean;  // 0.79.a
                        omit_switch_rail_joints:boolean;
                        omit_stock_rail_joints:boolean;
                        omit_wing_rail_joints:boolean;
                        omit_vee_rail_joints:boolean;
                        omit_k_crossing_stock_rail_joints:boolean;

                        omit_ts_exit_joints:boolean;    // 227a
                        omit_ms_exit_joints:boolean;    // 227a

                        use_all_bridge_chairs_flag:boolean;     // 230a

                        diamond_switch_timbering_flag:boolean;  // 213a

                        //------


                        gaunt_flag:boolean;    // True = gaunt template 0.81.a

                        diamond_proto_timbering_flag:boolean;    // 0.77.b

                        semi_diamond_flag:boolean;      // True = half-diamond template.
                        diamond_fixed_flag:boolean;     // True = fixed-diamond.


                    xstr_hdk_check_rail_info:Txstr_hdk_check_rail_info;

                    xstr_vee_check_rail_info:Txstr_vee_check_rail_info;

                        turnout_road_endx_infile:Txstr;  //extended as double ;   // 209a length of turnout road from CTRL-1

                        key_direction_infile:integer;      // 233a   0=random/towards joint, 1=forwards, -1=backwards
                        keys_towards_joint_flag:boolean;   // 233a

                        omit_ts_plain_track_joints:boolean;    // 227a  also for turnout approach and exit track
                        omit_ms_plain_track_joints:boolean;    // 227a  also for turnout approach and exit track

                        smallest_radius_stored:Txstr;  //extended as double ; // 208a needed for box data -- not loaded to the control

                        dpx_stored:Txstr;  //extended as double ;      // 208a needed for ID number creation -- not loaded to the control
                        ipx_stored:Txstr;  //extended as double ;      // 208a needed for ID number creation -- not loaded to the control
                        fpx_stored:Txstr;  //extended as double ;      // 208a needed for ID number creation -- not loaded to the control


                        gaunt_offset_inches:Txstr;  //extended as double ;  // 0.81

                        // 219a  include connectors for XTrackCAD in export DXF file  -- not loaded to the control  ...

                        xtc_connector_0:boolean;  // CTRL-0  nyi
                        xtc_connector_t:boolean;  // TEXITP  nyi
                        xtc_connector_9:boolean;  // CTRL-9  nyi

                      end;//xstr record

//______________________________________________________________________________

                    //!!! Tkeep_dims has the shove timber data omitted.  v:0.71.a  29-4-01.

  Tbox_dims1=record
                box_ident:string[11];   // first 12 bytes. 0.81

                now_time:integer;      // date/time/random code at which template added to keep box. (from Delphi float format - fractional days since 1-1-1900).
                                       // this is used to detect duplicates on loading.

                keep_date:string[20];   // ditto as conventional strings.
                keep_time:string[20];

                top_label:         string[100];  // template info label.
                project_for:       string[50];   // was who_for    project title string for the boxful. (read only from the last template in the box).

                reference_string:  string[100];  // template name.

                this_was_control_template:boolean;   // 0.93.a

                rail_info:          Trail_info;  // 23-5-01.

                auto_restore_on_startup:boolean;      // these two only read from the first keep in the file..
                ask_restore_on_startup:boolean;

                //---------------------

                pre077_bgnd_flag:boolean;  // no longer used, 0.77.a 2-sep-02. When true, this keep is to be drawn on the background.

                timbering_brick_flag:boolean;   // 234a  this template is a member of a timbering brick

                templot_version:integer;   // program version number (*100, e.g Templot v:1.3 = 130).

                file_format_code:integer;  // 221a  0= D5 format,    1= OT format

                gauge_index: integer;      // current index into the gauge list.

                gauge_exact: Boolean;      // nyi  // If true this is an exact-scale template.
                gauge_custom:Boolean;      // nyi  // If true this is (or was when saved) a custom gauge setting.

                proto_info:           Tproto_info;    // !!! modified for 0.71.a 11-5-01. was Tgauge_info.

                railtop_inches:extended;    // full-size inches railtop width - was spare_float1:extended;
                railbottom_inches:extended; // full-size inches railbottom width - was spare_float2:extended;

                use_all_RG_chairs_flag:boolean;     // 234a
                use_all_FG_chairs_flag:boolean;     // 234a

                version_as_loaded:integer;      // mod 0.78.d  14-Feb-2003. the version number as loaded.

                bgnd_code_077:integer;          // 0=unused, 1=bgnd, -1=library   0.77.a  2-Sep-02.

                print_mapping_colour:integer;   // 0.76.a  27-10-01
                pad_marker_colour:integer;      // 0.76.a  27-10-01

                use_print_mapping_colour:boolean;
                use_pad_marker_colour:boolean;

                use_all_SC_chairs_flag:boolean;    // 237a

                spare_bool2:boolean;

                spare_int2:integer;

                 //  0.79.a 20-05-06  -- saved grid info -- read from last template only...

                grid_units_code:integer;

                x_grid_spacing:extended;
                y_grid_spacing:extended;

                total_length_of_timbering:extended;   // 0.96.a

                id_number:integer;         // 208a
                id_number_str:string[7];   // 208a     -N00000

                spare_boolean1:boolean;    // 208a
                spare_boolean2:boolean;    // 208a


                transform_info:         Ttransform_info;

                platform_trackbed_info: Tplatform_trackbed_info;  // 0.93.a  was check_rail_mints:Tcheck_rail_mints;

                align_info:             Talignment_info;


                rail_type:integer;     // 0=no rails, 1=head only (bullhead), 2=head+foot (flatbottom)

                fb_kludge_template_code:integer;       // 0.94.a   0=normal template, 1=inner foot lines, 2=outer foot lines

                box_save_done:boolean;   // read only from first keep on restore previous contents. 23-6-00 v:0.62.a

                uninclined_rails:boolean;      // True = rails vertical.

                disable_f7_snap:boolean;       //  0.82.a

                spare_bool4:boolean;

                mod_text_x:extended;     // (mm) label position modifiers..
                mod_text_y:extended;

                flatbottom_width:extended;     // width of flatbottom rail base (mm)


                check_diffs:Tcheck_diffs;      // 0.94.a check rail end modifiers - 248 bytes


                retain_diffs_on_make_flag:boolean;    // 0.94.a check rail diffs
                retain_diffs_on_mint_flag:boolean;    // 0.94.a check rail diffs

                retain_entry_straight_on_make_flag:boolean;   // 213a
                retain_entry_straight_on_mint_flag:boolean;   // 213a

                    // 0.94.a timber shoving mods..

                retain_shoves_on_make_flag:boolean;
                retain_shoves_on_mint_flag:boolean;

                turnout_info1: Tturnout_info1;

               end;//record


  Txstr_box_dims1=record     // as above with extended floats as doubles  245a

                    box_ident:string[11];   // first 12 bytes. 0.81

                    now_time:integer;      // date/time/random code at which template added to keep box. (from Delphi float format - fractional days since 1-1-1900).
                                           // this is used to detect duplicates on loading.

                    keep_date:string[20];   // ditto as conventional strings.
                    keep_time:string[20];

                    top_label:         string[100];  // template info label.
                    project_for:       string[50];   // was who_for    project title string for the boxful. (read only from the last template in the box).

                    reference_string:  string[100];  // template name.

                    this_was_control_template:boolean;   // 0.93.a

                xstr_rail_info:Txstr_rail_info;  // 23-5-01.

                    auto_restore_on_startup:boolean;      // these two only read from the first keep in the file..
                    ask_restore_on_startup:boolean;

                    //---------------------

                    pre077_bgnd_flag:boolean;  // no longer used, 0.77.a 2-sep-02. When true, this keep is to be drawn on the background.

                    timbering_brick_flag:boolean;   // 234a  this template is a member of a timbering brick

                    templot_version:integer;   // program version number (*100, e.g Templot v:1.3 = 130).

                    file_format_code:integer;  // 221a  0= D5 format,    1= OT format

                    gauge_index: integer;      // current index into the gauge list.

                    gauge_exact: Boolean;      // nyi  // If true this is an exact-scale template.
                    gauge_custom:Boolean;      // nyi  // If true this is (or was when saved) a custom gauge setting.

                xstr_proto_info:Txstr_proto_info;    // !!! modified for 0.71.a 11-5-01. was Tgauge_info.

                    railtop_inches:Txstr;     //extended as double ; // full-size inches railtop width - was spare_float1:extended;
                    railbottom_inches:Txstr;  //extended as double ; // full-size inches railbottom width - was spare_float2:extended;

                    use_all_RG_chairs_flag:boolean;     // 234a
                    use_all_FG_chairs_flag:boolean;     // 234a

                    version_as_loaded:integer;      // mod 0.78.d  14-Feb-2003. the version number as loaded.

                    bgnd_code_077:integer;          // 0=unused, 1=bgnd, -1=library   0.77.a  2-Sep-02.

                    print_mapping_colour:integer;   // 0.76.a  27-10-01
                    pad_marker_colour:integer;      // 0.76.a  27-10-01

                    use_print_mapping_colour:boolean;
                    use_pad_marker_colour:boolean;

                    use_all_SC_chairs_flag:boolean;    // 237a

                    spare_bool2:boolean;

                    spare_int2:integer;

                    //  0.79.a 20-05-06  -- saved grid info -- read from last template only...

                    grid_units_code:integer;

                    x_grid_spacing:Txstr;  //extended as double ;
                    y_grid_spacing:Txstr;  //extended as double ;

                    total_length_of_timbering:Txstr;  //extended as double ;   // 0.96.a

                    id_number:integer;         // 208a
                    id_number_str:string[7];   // 208a     -N00000

                    spare_boolean1:boolean;    // 208a
                    spare_boolean2:boolean;    // 208a


                xstr_transform_info:Txstr_transform_info;

                xstr_platform_trackbed_info:Txstr_platform_trackbed_info;  // 0.93.a  was check_rail_mints:Tcheck_rail_mints;

                xstr_align_info:Txstr_alignment_info;


                    rail_type:integer;     // 0=no rails, 1=head only (bullhead), 2=head+foot (flatbottom)

                    fb_kludge_template_code:integer;       // 0.94.a   0=normal template, 1=inner foot lines, 2=outer foot lines

                    box_save_done:boolean;   // read only from first keep on restore previous contents. 23-6-00 v:0.62.a

                    uninclined_rails:boolean;      // True = rails vertical.

                    disable_f7_snap:boolean;       //  0.82.a

                    spare_bool4:boolean;

                    mod_text_x:Txstr;  //extended as double ;     // (mm) label position modifiers..
                    mod_text_y:Txstr;  //extended as double ;

                    flatbottom_width:Txstr;  //extended as double ;     // width of flatbottom rail base (mm)


                xstr_check_diffs:Txstr_check_diffs;      // 0.94.a check rail end modifiers - 248 bytes


                    retain_diffs_on_make_flag:boolean;    // 0.94.a check rail diffs
                    retain_diffs_on_mint_flag:boolean;    // 0.94.a check rail diffs

                    retain_entry_straight_on_make_flag:boolean;   // 213a
                    retain_entry_straight_on_mint_flag:boolean;   // 213a

                    // 0.94.a timber shoving mods..

                    retain_shoves_on_make_flag:boolean;
                    retain_shoves_on_mint_flag:boolean;

                xstr_turnout_info1:Txstr_turnout_info1;


                  end;//xstr record

//______________________________________________________________________________

  Tkeep_dims=record
               box_dims1:Tbox_dims1;
               turnout_info2:Tturnout_info2;
             end;//record

  Txstr_keep_dims=record                          // 245a
               xstr_box_dims1:Txstr_box_dims1;
               xstr_turnout_info2:Txstr_turnout_info2;
             end;//record

//______________________________________________________________________________

  Tfile_blocks=record             // 239a  file data in trailing blocks

                    keep_shoved_timbers:Tshoved_timbers;   // array of Tshoved_timber

                    keep_symbols:Tsymbols;                 // array of Tsymbol

                    keep_jaw_options:Tjaw_options;         // 244a    array of Tjaw_option

               end;//record


  Ttemplate_info=record       // full template data.

                    keep_dims:Tkeep_dims;      // all the template dimemsions from file

                    file_blocks:Tfile_blocks;  // 239a   and from trailing data blocks

                    bgnd_keep:Tbgnd_keep;      // drawn data if on background, not in file

                    notch_info:Tnotch;         // notch data for peg position    // 227d moved from file (Ttransform_info)

                    keep_timber_counts:Ttimber_counts;     // array of Ttimber_count

                           // dynamic arrays...    227a

                    keep_jaws:Tjaws;   // array of Tjaw    237c  for 3D chair exports
                    keep_seats:Tseats; // array of Tseat   237c  for 3D chair exports
                    keep_keys:Tkeys;   // array of Tkey    237c  for 3D chair exports
                    keep_jmods:Tjmods; // array of Tjmod   237c  for 3D chair exports

                    keep_name_str:string;
                    keep_memo_str:string;
                 end;//record



  Ttemplate=class(TPersistent)       // a whole stored template

            public                         // 0.85.a

              bg_copied:boolean;         // True=has been copied to the background. (not included in file).
              group_selected:boolean;    // True=selected as one of a group.
              was_in_group:boolean;      // 232b for printing a template now!
              new_stamp_wanted:boolean;  // True=has been shifted/rotated/mirrored, needs a new timestamp on rebuilding.

              tagged_hidden:boolean;  // 237a   prefix tagged and hidden

              snap_peg_positions:Tsnap_peg_positions;    // snapping positions for F7 shift mouse action  0.79.a  27-05-06
              boundary_info:Tboundary_info;              // 213b for extend to boundary

              bgnd_half_diamond:boolean;        // used for peg snapping checks. (also in the template_info for file).  0.79.a  27-05-06
              bgnd_plain_track:boolean;         // ditto
              bgnd_retpar:boolean;              // ditto parallel crossing
              bgnd_peg_on_zero:boolean;         // ditto Ctrl-0 or not.

              bgnd_turnoutx:extended;           // 227a  template lengths ..
              bgnd_xorg:extended;

              bgnd_is_straight:boolean;         // 228b

                   // added 205e for obtain tradius to control...

              bgnd_xing_type:integer;
              bgnd_spiral:boolean;
              bgnd_turnout_radius:extended;

              bgnd_int_geo_radius:extended;    // 227a..
              bgnd_ext_geo_radius:extended;

              bgnd_slewing:boolean;   // 227a

              bgnd_gaunt:boolean;               // 218a

              bgnd_is_in_rect:boolean;          // 218d   temp flag   template is within a rectangle (e.g. on screen)

                   // 208a temp strings used while sorting the storage box...

              sort_swap_info_str:string;
              sort_swap_memo_str:string;

                   // 211b position of name label...

              bgnd_label_x:extended;   // mm
              bgnd_label_y:extended;   // mm

              bgnd_blanked:boolean;        // 215a
              bgnd_no_xing:boolean;        // 215a

              this_is_tandem_first:boolean;  // 218a

              bgnd_timber_fill_overdraw_generated:boolean;  // 227d

              template_info:Ttemplate_info;    // all the template dimemsions from file, the created lists, and drawn data if on background

	    end;//class

//_______________________________________________________________________________


  Tswitch=class(TPersistent)       // a switch stored in the list.     0.77.a  7-6-02.

          public                         // 0.85.a

              list_switch_info:Tswitch_info;    // the data.

	  end;//class


  Troll_back=record
               valid_flag:boolean;
               rollback_info:Ttemplate_info;
               rollback_name_str:string;       // added 0.93.a
               rollback_memo_str:string;       // ...
             end;//record

//______________________________________________________________________________

var

    // dynamic arrays ...  227a

  current_shoved_timbers:Tshoved_timbers;  // array of Tshoved_timber

  current_symbols:Tsymbols;  // array of Tsymbol

  current_timber_counts:Ttimber_counts;  // array of Ttimber_count;

  current_jaws:Tjaws;     // array of Tjaw    237c  for 3D chair exports
  current_seats:Tseats;   // array of Tseat   237c  for 3D chair exports
  current_keys:Tkeys;     // array of Tkey    237c  for 3D chair exports
  current_jmods:Tjmods;   // array of Tjmod   237c  for 3D chair exports

    // static arrays ...

  rollback_reg:array[0..undo_c] of Troll_back;          // roll-back register.

  org_template:Ttemplate_info;   // 224a     default for use on importing mecbox files

  parking_bay:array[0..parking_c] of Ttemplate_info;      // parking bay.

  park_name_str:array[0..parking_c] of string;        // template names in parking bay.
  park_memo_str:array[0..parking_c] of string;        // template memo notes in parking bay.

  invalidated_zero_save:Ttemplate_info;                 // 0.93.a

  undo_notch:array[0..notch_c] of Tnotch;           // rollback notch register.   x,y,k in Tnotch.

  html_back:array[0..html_back_c] of Thtml_history;   // 0.91 history array for html viewer.

  pad_view1,pad_view2,pad_view3,pad_view4:Tpad_view_data;  // 0.91.c view pre-sets.

  cpi:Tproto_info;    // current gauge/scale and prototype settings.

  csi:Tswitch_info;   // control template switch data.  0.77.a 25-6-02.

  ccd:Tcheck_diffs;   // control template check-rail diffs  0.94.a

  gauge:array[0..gauge_indexmax_c] of Tgauge_scale;

  sleeper_count:array[0..railen_c] of integer;         // number of sleepers per rail length.
  psleep:array[0..railen_c, 0..psleep_c] of extended;  // plain track sleeper spacings.
  railen:array[0..railen_c] of extended;               // plain track rail lengths.

//______________________________________________________________________________

implementation

{$BOOLEVAL ON}

{$R *.lfm}

uses
  control_room, colour_unit, help_sheet, alert_unit, keep_select, math_unit, prefs_unit, brick_unit;

//______________________________________________________________________________

procedure Tbgkeeps_form.size_updownClick(Sender: TObject; Button: TUDBtnType);

begin
  if size_updown.Position>size_updown.Tag                          // ! position goes up, size goes down.
     then ScaleBy(9,10);                                           // scale the form contents down.

  if size_updown.Position<size_updown.Tag
     then ScaleBy(10,9);                                           // scale the form contents up.

  ClientHeight:=VertScrollBar.Range;                               // allow 4 pixel right margin.
  ClientWidth:=HorzScrollBar.Range+4;                              // don't need bottom margin - datestamp label provides this.
  ClientHeight:=VertScrollBar.Range;                               // do this twice, as each affects the other.

  size_updown.Tag:=size_updown.Position;                           // and save for the next click.
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.colour_panelClick(Sender: TObject);

begin
  Color:=get_colour('choose  a  new  window  colour  for  the  background  templates  detail',Color);
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.how_panelClick(Sender: TObject);

const
  bgkeeps_help:string='      `0Background  Templates  Detail`9'
  +'||These tick boxes let you customize the way in which the detail elements of background templates are shown on the trackpad (screen).'

  +'||If you are building a complete track plan in the background, it is often less confusing to display the background templates'
  +' in skeleton form only, with the rail outer-edges and perhaps the timbers omitted.'

  +'||Clicking the `0APPLY NOW`1 button causes the trackpad to be immediately re-drawn reflecting any changes you have made to the tick boxes.'

  +'||green_panel_begin tree.gif These tick boxes apply to the trackpad (screen) only and have no effect on the printed templates, PDF files, exported image files, sketchboard, or any other output.'
  +'||To make similar changes on the output, change the settings in the `0OUTPUT`1 menu and sub-menus.green_panel_end';

begin
  help(0,bgkeeps_help,'');
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  if Key=VK_F10
     then begin
            Key:=0;      //  otherwise selects the menus.
          end;

  if Key=VK_PAUSE then Application.Minimize;    //  hide TEMPLOT on PAUSE key.
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.close_buttonClick(Sender: TObject);

begin
  Close;
  redraw_pad(True,False);
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=900;                        // SC 19/07/2024 - was 800
  ClientHeight:=360;                       // SC 19/07/2024 - was 300
  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.timber_numbering_checkboxClick(Sender: TObject);

begin
  if (timber_numbering_checkbox.Checked=True) and (loading_his_prefs=False)  // 208a
     then alert(3,'    `0timber  numbering`9',
                  '|You have selected timber numbering to be shown on the screen for all the background templates.'
                 +'||Bear in mind that the numbers are likely to obscure most of the drawing as you zoom out.'
                 +'||green_panel_begintree.gif There is seldom any need to have the background timber numbers on the screen, timber numbering is intended primarily for printed full-size track construction templates.'
                 +'||And for the control template when using the shove timber functions.green_panel_end'
                 +'|You can change the font used for the numbers, click the `0TRACKPAD > TRACKPAD CONTROL TEMPLATE OPTIONS > FONT FOR TIMBER NUMBERING...`1 menu item.',
                  '','','','','','O K',0);
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.timber_infill_checkboxClick(Sender: TObject);

begin
  if bgkeeps_form.timber_infill_checkbox.Checked=True
     then begin
            if bgpad_timb_infill_style=0 then pad_form.bg_solid_timber_infill_menu_entry.Click;
          end;
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.FormDeactivate(Sender: TObject);

begin
 redraw_pad(True,False);
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.apply_buttonClick(Sender: TObject);

begin
  if any_bgnd=0
     then begin
            alert(6,'    no  templates  currently  on  background',
                    'There are no stored templates currently copied to the background drawing, and therefore none to have these settings applied to them.',
                    '','','','','','O K',0);
            EXIT;
          end;

  redraw_pad(True,False);
end;
//______________________________________________________________________________

procedure Tbgkeeps_form.chair_outlines_checkboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  brick_form.bgnd_chairs_checkbox.Checked:=bgkeeps_form.chair_outlines_checkbox.Checked;    // 244d
end;
//______________________________________________________________________________

end.

