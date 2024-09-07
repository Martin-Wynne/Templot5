
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

   This file was saved from Lazarus 3.4

*)

unit custom_3d_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tcustom_3d_form }

  Tcustom_3d_form = class(TForm)
    cancel_button: TButton;
    Label1: TLabel;
    datestamp_label: TLabel;
    top_label: TLabel;
    save_sk4_button: TButton;
    custom_load_dialog: TOpenDialog;
    custom_save_dialog: TSaveDialog;
    load_sk4_button: TButton;
    sk4_memo: TMemo;
    procedure cancel_buttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure load_sk4_buttonClick(Sender: TObject);
    procedure save_sk4_buttonClick(Sender: TObject);
  private

  public

  end;

var
  custom_3d_form: Tcustom_3d_form;

  user_save_custom_path:string='';
  user_load_custom_path:string='';


  procedure load_custom_3d_data(str:string);   // 555a   MW 19-JULY-2024
  procedure save_custom_3d_data;               // 555a   MW 19-JULY-2024


implementation

{$BOOLEVAL ON}

{$R *.lfm}

uses
  control_room, math_unit, dxf_unit, xml_unit;

{ Tcustom_3d_form }

var
  sk4_str:string='';
  sk4_param_str:string='';

  xml_save_doc:TNativeXml;

//______________________________________________________________________________

procedure save_custom_3d_data;

var
  data_node,header_node:TXmlNode;


                    ////////////////////////////////////////////////////////////

                    function create_named_node(parent_node:TXmlNode; name_str:string):TXmlNode;

                    begin
                      RESULT:=TXmlNode.CreateName(xml_save_doc,name_str);
                      parent_node.NodeAdd(RESULT);
                    end;

                    ////////////////////////////////////////////////////////////

begin

  with dxf_form do begin     // in case no export yet done ...

    if bs95r_radiobutton.Checked=True then rail_section_option:=0;
    if emgs_75_rail_radiobutton.Checked=True then rail_section_option:=1;
    if smp_75_rail_radiobutton.Checked=True then rail_section_option:=2;
    if peco_124_rail_radiobutton.Checked=True then rail_section_option:=3;
    if cl_131_rail_radiobutton.Checked=True then rail_section_option:=4;
    if cl_125_rail_radiobutton.Checked=True then rail_section_option:=5;

    if custom_rail_radiobutton.Checked=True then rail_section_option:=99;

    try
      chair_web_adjustment:=StrToFloat(Trim(dxf_form.chair_adjust_edit.Text));
    except
      show_modal_message('error: chair fit adjustment must be a valid number with no spaces or other text');
      EXIT;
    end;

  end;//with

  xml_save_doc:=TNativeXml.CreateName('SK4');
  xml_save_doc.UseFullNodes:=True;
  xml_save_doc.XmlFormat:=xfReadable;      // insert CRLF after each sub-node

  xml_save_doc.WriteOnDefault:=True;       // ignore defaults and always write anyway
  xml_save_doc.FloatSignificantDigits:=9;  // sig digs in floats

  header_node:=create_named_node(xml_save_doc.Root,'HEADER');

  with header_node do begin

    WriteString('data_title','Templot custom 3D data','');
    WriteString('templot_version',round_str(program_version/100,2)+version_build,'');
    WriteString('file_date',DateTimeToStr(Now),'');

  end;//with header

  data_node:=create_named_node(xml_save_doc.Root,'DATA');

          // write out the data...

  with data_node do begin

    // rail section

    WriteInteger('rail_option',rail_section_option,0);   // 244d preserve legacy files after variable name change

    WriteString('custom_section_name_str',custom_section_name_str,'');

    WriteFloat('custom_rail_depth',custom_rail_depth,0);
    WriteFloat('custom_rail_head_width',custom_rail_head_width,0);

    WriteFloat('custom_rail_corner_rad',custom_rail_corner_rad,0);
    WriteFloat('custom_rail_foot_width',custom_rail_foot_width,0);

    WriteFloat('custom_rail_fish_angle',custom_rail_fish_angle,0);
    WriteFloat('custom_rail_web_thick',custom_rail_web_thick,0);

    WriteFloat('custom_rail_web_top',custom_rail_web_top,0);
    WriteFloat('custom_rail_web_bottom',custom_rail_web_bottom,0);

    WriteFloat('seat_thick',seat_thick,0);                                           // 555b
    WriteFloat('normal_timber_thick',normal_timber_thick,0);   //  MW
    WriteFloat('cot_timber_thick',cot_timber_thick,0);         //  MW

    WriteFloat('soleplate_thick',soleplate_thick,0);                                 // 555b
    WriteFloat('soleplate_width',soleplate_width,0);                                 // 555b
    WriteFloat('soleplate_rib',soleplate_rib,0);                                     // 555b

    WriteFloat('switch_slider_rib_width_mm',switch_slider_rib_width_mm,0);           // 555b
    WriteFloat('switch_slider_rib_top_depth',switch_slider_rib_top_depth,0);         // 555b
    WriteFloat('switch_slider_rib_mid_depth',switch_slider_rib_mid_depth,0);         // 555b
    WriteFloat('switch_slider_rib_bottom_depth',switch_slider_rib_bottom_depth,0);   // 555b

    WriteFloat('sprue_thick',sprue_thick,0);                                         // 555b
    WriteFloat('sprue_length',sprue_length,0);                                       // 555b
    WriteFloat('sprue_width',sprue_width,0);                                         // 555b
    WriteFloat('sprue_runner_width',sprue_runner_width,0);                           // 555b

    WriteFloat('web_length',web_length,0);                                           // 555b
    WriteFloat('web_width',web_width,0);                                             // 555b
    WriteFloat('web_width_flexi',web_width_flexi,0);                                 // 555b

    WriteFloat('web_integrity_overlap',web_integrity_overlap,0);                     // 555b
    WriteFloat('flange_integrity_overlap',flange_integrity_overlap,0);               // 555b

    WriteFloat('side_flange_width_mm',side_flange_width_mm,0);                       // 555b
    WriteFloat('end_flange_width',end_flange_width,0);                               // 555b
    WriteFloat('flange_offset',flange_offset,0);                                     // 555b

    WriteFloat('normal_flange_depth',normal_flange_depth,0);  // MW
    WriteFloat('cot_flange_depth',cot_flange_depth,0);        // MW

    WriteFloat('dropper_ridge_spacing_top_mm',dropper_ridge_spacing_top_mm,0);       // 555b
    WriteFloat('dropper_ridge_spacing_bottom_mm',dropper_ridge_spacing_bottom_mm,0); // 555b
    WriteFloat('dropper_ridge_height',dropper_ridge_height,0);                       // 555b

    // connector clips

    WriteFloat('clip_shaft_width',clip_shaft_width,0);                               // 555b
    WriteFloat('clip_top_width',clip_top_width,0);                                   // 555b
    WriteFloat('clip_top_width',clip_top_width,0);                                   // 555b
    WriteFloat('clip_top_corner_mm',clip_top_corner_mm,0);                           // 555b
    WriteFloat('clip_arms_width',clip_arms_width,0);                                 // 555b
    WriteFloat('clip_outers_width',clip_outers_width,0);                             // 555b
    WriteFloat('clip_outers_length',clip_outers_length,0);                           // 555b
    WriteFloat('clip_ends_clear_mm',clip_ends_clear_mm,0);        // MW
    WriteFloat('clip_sides_clear_mm',clip_sides_clear_mm,0);      // MW
    WriteFloat('clip_hole_mm',clip_hole_mm,0);                                       // 555b
    WriteFloat('clip_depth_mm',clip_depth_mm,0);                                     // 555b
    WriteFloat('clip_foot_depth_mm',clip_foot_depth_mm,0);                           // 555b
    WriteFloat('clip_foot_offset_mm',clip_foot_offset_mm,0);                         // 555b

    // splints

    WriteFloat('normal_splint_depth',normal_splint_depth,0);      // MW
    WriteFloat('cot_splint_depth',cot_splint_depth,0);            // MW

    WriteFloat('splint_width',splint_width,0);                                       // 555b

    WriteFloat('normal_slab_depth',normal_slab_depth,0);          // MW
    WriteFloat('cot_slab_depth',cot_slab_depth,0);                // MW

    WriteFloat('label_tab_width',label_tab_width,0);                                 // 555b

    WriteFloat('normal_label_char_thickness',normal_label_char_thickness,0);     // MW
    WriteFloat('cot_label_char_thickness',cot_label_char_thickness,0);           // MW

    WriteFloat('plugsock_length_mod',plugsock_length_mod,0);                         // 555b
    WriteFloat('plugsock_width_mod',plugsock_width_mod,0);                           // 555b

    WriteFloat('socket_chamfer',socket_chamfer,0);                                   // 555b
    WriteFloat('socket_chamfer_depth',socket_chamfer_depth,0);                       // 555b

    WriteFloat('socket_depth',socket_depth,0);                                       // 555b

    // snap fit chairs

    WriteFloat('snap_socket_fit_sides_sl',snap_socket_fit_sides_sl,0);               // 555b
    WriteFloat('snap_socket_fit_sides_timb',snap_socket_fit_sides_timb,0);           // 555b

    WriteFloat('snap_socket_fit_ends',snap_socket_fit_ends,0);                       // 555b

    WriteFloat('snap_socket_undercut',snap_socket_undercut,0);                       // 555b
    WriteFloat('snap_undercut_depth',snap_undercut_depth,0);                         // 555b
    WriteFloat('snap_clearcut_depth',snap_clearcut_depth,0);                         // 555b


    // clip fit chairs

    WriteFloat('clip_socket_fit_sides_sl',clip_socket_fit_sides_sl,0);               // 555b
    WriteFloat('clip_socket_fit_sides_timb',clip_socket_fit_sides_timb,0);           // 555b

    WriteFloat('clip_socket_fit_ends',clip_socket_fit_ends,0);                       // 555b

    WriteFloat('clip_socket_undercut',clip_socket_undercut,0);                       // 555b
    WriteFloat('clip_undercut_depth',clip_undercut_depth,0);                         // 555b
    WriteFloat('clip_clearcut_depth',clip_clearcut_depth,0);                         // 555b

    WriteFloat('clip_socket_flap_top_depth',clip_socket_flap_top_depth,0);           // 555b
    WriteFloat('clip_socket_flap_top_length',clip_socket_flap_top_length,0);         // 555b

    WriteFloat('clip_socket_flap_jut_length',clip_socket_flap_jut_length,0);         // 555b
    WriteFloat('clip_socket_flap_rear_length',clip_socket_flap_rear_length,0);       // 555b

    WriteFloat('clip_socket_flap_clear_width',clip_socket_flap_clear_width,0);       // 555b

    WriteFloat('clip_tang_end_space',clip_tang_end_space,0);                         // 555b

    // press fit chairs

    WriteFloat('press_socket_fit_sides_sl',press_socket_fit_sides_sl,0);             // 555b
    WriteFloat('press_socket_fit_sides_timb',press_socket_fit_sides_timb,0);         // 555b


    // negative interference fit ...

    WriteFloat('press_short_socket_fit_ends',press_short_socket_fit_ends,0);         // 555b
    WriteFloat('press_socket_fit_ends',press_socket_fit_ends,0);                     // 555b
    WriteFloat('press_long_socket_fit_ends',press_long_socket_fit_ends,0);           // 234e
    WriteFloat('press_very_long_socket_fit_ends',press_very_long_socket_fit_ends,0); // 555b

    // snap fit plugs

    WriteFloat('snap_plug_taper_depth',snap_plug_taper_depth,0);                     // 555b
    WriteFloat('snap_plug_inset_depth',snap_plug_inset_depth,0);                     // 555b
    WriteFloat('snap_plug_total_depth',snap_plug_total_depth,0);                     // 555b
    WriteFloat('snap_plug_extended_depth',snap_plug_extended_depth,0);               // 555b

    WriteFloat('snap_plug_overcut',snap_plug_overcut,0);                             // 555b
    WriteFloat('snap_plug_overcut_depth',snap_plug_overcut_depth,0);                 // 555b

    WriteFloat('snap_plug_inset_clear_upper',snap_plug_inset_clear_upper,0);         // 234e
    WriteFloat('snap_plug_inset_clear_bottom',snap_plug_inset_clear_bottom,0);       // 555b

    // clip fit plugs

    WriteFloat('clip_plug_taper_depth',clip_plug_taper_depth,0);                     // 555b
    WriteFloat('clip_plug_inset_depth',clip_plug_inset_depth,0);                     // 555b
    WriteFloat('clip_plug_total_depth',clip_plug_total_depth,0);                     // 555b
    WriteFloat('clip_plug_extended_depth',clip_plug_extended_depth,0);               // 555b

    WriteFloat('clip_plug_inset_clear_upper',clip_plug_inset_clear_upper,0);         // 555b
    WriteFloat('clip_plug_inset_clear_bottom',clip_plug_inset_clear_bottom,0);       // 555b

    // press fit plugs

    WriteFloat('press_plug_taper_depth',press_plug_taper_depth,0);                   // 555b
    WriteFloat('press_plug_inset_depth',press_plug_inset_depth,0);                   // 555b
    WriteFloat('press_plug_total_depth',press_plug_total_depth,0);                   // 555b
    WriteFloat('press_plug_extended_depth',press_plug_extended_depth,0);             // 555b

    WriteFloat('press_plug_inset_clear_upper',press_plug_inset_clear_upper,0);       // 234e
    WriteFloat('press_plug_inset_clear_bottom',press_plug_inset_clear_bottom,0);     // 555b

    // clip tangs

    WriteFloat('clip_tang_overcut',clip_tang_overcut,0);                             // 555b
    WriteFloat('clip_tang_roof_front_depth',clip_tang_roof_front_depth,0);           // 555b
    WriteFloat('clip_tang_roof_back_depth',clip_tang_roof_back_depth,0);             // 555b
    WriteFloat('clip_tang_floor_depth',clip_tang_floor_depth,0);                     // 555b
    WriteFloat('clip_tang_default_depth',clip_tang_default_depth,0);                 // 555b
    WriteFloat('clip_tang_overcut_depth',clip_tang_overcut_depth,0);                 // 555b

    // plugs

    WriteFloat('locator_plug_depth',locator_plug_depth,0);                           // 555b

    WriteFloat('plug_corner_clear_fdm',plug_corner_clear_fdm,0);                     // 555b
    WriteFloat('plug_corner_clear_cnc',plug_corner_clear_cnc,0);                     // 555b

    WriteFloat('plug_end_width_fdm',plug_end_width_fdm,0);                           // 555b
    WriteFloat('plug_end_width_cnc',plug_end_width_cnc,0);                           // 555b

    WriteFloat('plug_fit_sides',plug_fit_sides,0);                                   // 555b
    WriteFloat('plug_fit_ends',plug_fit_ends,0);                                     // 555b

    // support pyramids

    WriteFloat('pyramid_height_low',pyramid_height_low,0);                           // 555b
    WriteFloat('pyramid_height_high',pyramid_height_high,0);                         // 555b

    WriteFloat('pyramid_taper',pyramid_taper,0);                                     // 555b
    WriteFloat('pyramid_top_end_inset',pyramid_top_end_inset,0);                     // 555b

    WriteFloat('pyramid_top_side_inset',pyramid_top_side_inset,0);                   // 555b
    WriteFloat('shrink_gauge_spacing',shrink_gauge_spacing,0);                       // 555b

    // loose jaw pins

    WriteFloat('pyramid_height_pin',pyramid_height_pin,0);                           // 555b

    WriteFloat('pin_slot_halfwide',pin_slot_halfwide,0);                             // 555b
    WriteFloat('pin_slot_length',pin_slot_length,0);                                 // 555b

    WriteFloat('loose_pin_clear_sides',loose_pin_clear_sides,0);                     // 555b

    WriteFloat('loose_pin_clear_front',loose_pin_clear_front,0);                     // 555b
    WriteFloat('loose_pin_clear_back',loose_pin_clear_back,0);                       // 555b

    WriteFloat('loose_pin_bottom_taper_ins',loose_pin_bottom_taper_ins,0);           // 555b

    WriteFloat('key_thicken',key_thicken,0);                                         // 555b

    WriteFloat('loose_pin_depth_clear',loose_pin_depth_clear,0);                     // 555b

    WriteFloat('loose_pin_bottom_chamfer_clear',loose_pin_bottom_chamfer_clear,0);   // 555b

    WriteFloat('slot_angle',slot_angle,0);                                           // 555b

    // raft

    WriteFloat('raft_thick',raft_thick,0);                                           // 555b

    WriteFloat('raft_flange',raft_flange,0);                                         // 555b

    WriteFloat('raft_label_char_thickness',raft_label_char_thickness,0);             // 555b

    WriteFloat('alignment_plate_thick_mm',alignment_plate_thick_mm,0);               // 555b

    // filament

    WriteFloat('filament_dia_mm',filament_dia_mm,0);                                 // 555b

    WriteFloat('filament_adjust',filament_adjust,0);                                 // 555b

    // flangeway

    WriteFloat('fw_correction_xing',fw_correction_xing,0);                           // 555b

    WriteFloat('fw_correction_check',fw_correction_check,0);                         // 555b

    WriteFloat('fw_tweak_xing',fw_tweak_xing,0);                                     // 555b

    WriteFloat('fw_tweak_check',fw_tweak_check,0);                                   // 555b

    // 2D cutter kerf

    WriteFloat('cutter_kerf_mm',cutter_kerf_mm,0);                                   // 555b

    WriteFloat('kerf_extra_undercut_mm',kerf_extra_undercut_mm,0);                   // 555b

    // socket ends indented by ...

    WriteFloat('socket_indent',socket_indent,0);                                     // 555b

    // nibs

    WriteFloat('nib_width',nib_width,0);                                             // 555b

    WriteFloat('nib_length',nib_length,0);                                           // 555b

    // snibs

    WriteFloat('snib1_extent',snib1_extent,0);                                       // 555b

    WriteFloat('snib2_extent_t',snib2_extent_t,0);                                   // 555b

    WriteFloat('snib2_extent_p',snib2_extent_p,0);                                   // 555b

    WriteFloat('snib2_extent_e',snib2_extent_e,0);                                   // 555b

    WriteFloat('tsn_snib_space_mm',tsn_snib_space_mm,0);                             // 555b

    WriteFloat('tsf_snib_space_mm',tsf_snib_space_mm,0);                             // 555b

    WriteFloat('msn_snib_space_mm',msn_snib_space_mm,0);                             // 555b

    WriteFloat('msf_snib_space_mm',msf_snib_space_mm,0);                             // 555b

    // nails

    WriteFloat('nails_height',nails_height,0);                                       // 555b

    WriteFloat('nails_toprad',nails_toprad,0);                                       // 555b

    WriteFloat('nails_botrad',nails_botrad,0);                                       // 555b

    WriteFloat('nailx_spacing',nailx_spacing,0);                                     // 555b

    WriteFloat('naily_spacing',naily_spacing,0);                             	       // 555b

    // shrinkage FDM - heated bed

    WriteFloat('fdm_hot_shrinkage_x',fdm_hot_shrinkage_x,0);                         // 555b

    WriteFloat('fdm_hot_shrinkage_y',fdm_hot_shrinkage_y,0);                         // 555b

    WriteFloat('fdm_hot_shrinkage_z',fdm_hot_shrinkage_z,0);                         // 555b

    WriteFloat('fdm_rail_foot_factor',fdm_rail_foot_factor,0);                       // FDM chairs (COT track)  MW

    WriteFloat('fdm_rail_web_factor',fdm_rail_web_factor,0);                         // FDM chairs (COT track)  MW

    // shrinkage FDM - cold bed

    WriteFloat('fdm_cold_shrinkage_x',fdm_cold_shrinkage_x,0);                       // 555b

    WriteFloat('fdm_cold_shrinkage_y',fdm_cold_shrinkage_y,0);                       // 555b

    WriteFloat('fdm_cold_shrinkage_z',fdm_cold_shrinkage_z,0);                       // 555b

    // shrinkage Resin

    WriteFloat('resin_shrinkage_x',resin_shrinkage_x,0);                             // 555b

    WriteFloat('resin_shrinkage_y',resin_shrinkage_y,0);                             // 555b

    WriteFloat('resin_shrinkage_z',resin_shrinkage_z,0);                             // 555b

    // minibo backlash correction

    WriteFloat('bl_x',bl_x,0);                             // 555b

    WriteFloat('bl_y',bl_y,0);                             // 555b

    WriteFloat('bl_z',bl_z,0);                             // 555b

     // rotate STL by

    WriteFloat('stl_rot_x',stl_rot_x,0);                                             // 555b

    WriteFloat('stl_rot_y',stl_rot_y,0);                                             // 555b

    WriteFloat('stl_rot_k',stl_rot_k,0);                                             // 555b

     // fw widen

    WriteFloat('fw_mod_for_gw',fw_mod_for_gw,0);                                     // 555b


    WriteFloat('chair_web_adjustment',chair_web_adjustment,0);                       // 555b

  end;//with node

  with custom_3d_form do begin

    sk4_memo.Text:=xml_save_doc.WriteToString;

    save_sk4_button.Visible:=True;
    load_sk4_button.Visible:=False;

    top_label.Caption:='preview  custom  3D  data  before  saving';

  end;//with

  do_show_modal(custom_3d_form);

  xml_save_doc.Free;
end;
//______________________________________________________________________________

procedure load_custom_3d_data(str:string);   // 555a   MW 19-JULY-2024

var
  load_sk4_list:TStringList;

begin
  with custom_3d_form do begin
    if str<>''
       then sk4_str:=str    // exe parameter
       else begin
              with custom_load_dialog do begin

                if user_load_custom_path=''
                   then InitialDir:=exe_str+'DXF-FILES\'
                   else InitialDir:=user_load_custom_path;

                Title:='    load  custom  data  from ...';
                Filter:='custom data (.sk4)|*.sk4';
                DefaultExt:='.sk4';

                if Execute=True
                   then sk4_str:=FileName
                   else EXIT;

               end;//with
            end;

    if FileExists(sk4_str)=False
       then begin
              show_modal_message('error: file does not exist');
              user_load_custom_path:='';
              EXIT;
            end
       else user_load_custom_path:=ExtractFilePath(sk4_str);  // for next time

    load_sk4_list:=TStringList.Create;
    load_sk4_list.LoadFromFile(sk4_str);      // get the XML file as text

    sk4_memo.Text:=load_sk4_list.Text;

    load_sk4_list.Free;

    save_sk4_button.Visible:=False;
    load_sk4_button.Visible:=True;

    top_label.Caption:='preview  custom  3D  data  file';

  end;//with

  do_show_modal(custom_3d_form);
end;
//______________________________________________________________________________

procedure Tcustom_3d_form.load_sk4_buttonClick(Sender: TObject);

var
  xml_doc:TNativeXml;
  data_node:TXmlNode;

begin
  xml_doc:=TNativeXml.Create;

  xml_doc.LoadFromFile(sk4_str);

  data_node:=xml_doc.Root.FindNode('DATA');

  with data_node do begin

    // rail section

    rail_section_option:=ReadInteger('rail_option',0);    // 244d preserve legacy files after variable name change

    custom_section_name_str:=ReadString('custom_section_name_str','');

    custom_rail_depth:=ReadFloat('custom_rail_depth',0);
    custom_rail_head_width:=ReadFloat('custom_rail_head_width',0);

    custom_rail_corner_rad:=ReadFloat('custom_rail_corner_rad',0);
    custom_rail_foot_width:=ReadFloat('custom_rail_foot_width',0);

    custom_rail_fish_angle:=ReadFloat('custom_rail_fish_angle',0);

    if custom_rail_fish_angle<minfp then custom_rail_fish_angle:=2.75;

    custom_rail_web_thick:=ReadFloat('custom_rail_web_thick',0);

    custom_rail_web_top:=ReadFloat('custom_rail_web_top',0);
    custom_rail_web_bottom:=ReadFloat('custom_rail_web_bottom',0);


    if NodeIndexOf(FindNode('seat_thick'))<>-1
       then seat_thick:=ReadFloat('seat_thick',1.75);                                           // 555b

    if NodeIndexOf(FindNode('normal_timber_thick'))<>-1
       then normal_timber_thick:=ReadFloat('normal_timber_thick',0);  // MW

    if NodeIndexOf(FindNode('cot_timber_thick'))<>-1
       then cot_timber_thick:=ReadFloat('cot_timber_thick',0);        // MW

    if NodeIndexOf(FindNode('soleplate_thick'))<>-1
       then soleplate_thick:=ReadFloat('soleplate_thick',0.48);                                 // 555b

    if NodeIndexOf(FindNode('soleplate_width'))<>-1
       then soleplate_width:=ReadFloat('soleplate_width',9);                                    // 555b

    if NodeIndexOf(FindNode('soleplate_rib'))<>-1
       then soleplate_rib:=ReadFloat('soleplate_rib',3);                                        // 555b

    if NodeIndexOf(FindNode('switch_slider_rib_width_mm'))<>-1
       then switch_slider_rib_width_mm:=ReadFloat('switch_slider_rib_width_mm',1.2);            // 555b

    if NodeIndexOf(FindNode('switch_slider_rib_top_depth'))<>-1
       then switch_slider_rib_top_depth:=ReadFloat('switch_slider_rib_top_depth',1.44);         // 555b

    if NodeIndexOf(FindNode('switch_slider_rib_mid_depth'))<>-1
       then switch_slider_rib_mid_depth:=ReadFloat('switch_slider_rib_mid_depth',2.88);         // 555b

    if NodeIndexOf(FindNode('switch_slider_rib_bottom_depth'))<>-1
       then switch_slider_rib_bottom_depth:=ReadFloat('switch_slider_rib_bottom_depth',5.76);   // 555b

    if NodeIndexOf(FindNode('sprue_thick'))<>-1
       then sprue_thick:=ReadFloat('sprue_thick',5.76);                                         // 555b

    if NodeIndexOf(FindNode('sprue_length'))<>-1
       then sprue_length:=ReadFloat('sprue_length',18);                                         // 555b

    if NodeIndexOf(FindNode('sprue_width'))<>-1
       then sprue_width:=ReadFloat('sprue_width',4);                                            // 555b

    if NodeIndexOf(FindNode('sprue_runner_width'))<>-1
       then sprue_runner_width:=ReadFloat('sprue_runner_width',8);                              // 555b

    if NodeIndexOf(FindNode('web_length'))<>-1
       then web_length:=ReadFloat('web_length',18);                                             // 555b

    if NodeIndexOf(FindNode('web_width'))<>-1
       then web_width:=ReadFloat('web_width',12);                                               // 555b

    if NodeIndexOf(FindNode('web_width_flexi'))<>-1
       then web_width_flexi:=ReadFloat('web_width_flexi',8);                                    // 555b

    if NodeIndexOf(FindNode('web_integrity_overlap'))<>-1
       then web_integrity_overlap:=ReadFloat('web_integrity_overlap',0.25);                     // 555b

    if NodeIndexOf(FindNode('flange_integrity_overlap'))<>-1
       then flange_integrity_overlap:=ReadFloat('flange_integrity_overlap',0.25);               // 555b

    if NodeIndexOf(FindNode('side_flange_width_mm'))<>-1
       then side_flange_width_mm:=ReadFloat('side_flange_width_mm',1.0);                        // 555b

    if NodeIndexOf(FindNode('end_flange_width'))<>-1
       then end_flange_width:=ReadFloat('end_flange_width',5);                                  // 555b

     if NodeIndexOf(FindNode('flange_offset'))<>-1
       then flange_offset:=ReadFloat('flange_offset',0);                                        // 555b

    if NodeIndexOf(FindNode('normal_flange_depth'))<>-1
       then normal_flange_depth:=ReadFloat('normal_flange_depth',0);     //  MW

    if NodeIndexOf(FindNode('cot_flange_depth'))<>-1
       then cot_flange_depth:=ReadFloat('cot_flange_depth',0);           //  MW

    if NodeIndexOf(FindNode('dropper_ridge_spacing_top_mm'))<>-1
       then dropper_ridge_spacing_top_mm:=ReadFloat('dropper_ridge_spacing_top_mm',0.4);        // 555b

    if NodeIndexOf(FindNode('dropper_ridge_spacing_bottom_mm'))<>-1
       then dropper_ridge_spacing_bottom_mm:=ReadFloat('dropper_ridge_spacing_bottom_mm',0.6);  // 555b

    if NodeIndexOf(FindNode('dropper_ridge_height'))<>-1
       then dropper_ridge_height:=ReadFloat('dropper_ridge_height',2.16);                       // 555b


    // brick connector clips

    if NodeIndexOf(FindNode('clip_shaft_width'))<>-1
       then clip_shaft_width:=ReadFloat('clip_shaft_width',13.5);                               // 555b

    if NodeIndexOf(FindNode('clip_top_width'))<>-1
       then clip_top_width:=ReadFloat('clip_top_width',30);                                    // 555b

    if NodeIndexOf(FindNode('clip_top_length'))<>-1
       then clip_top_length:=ReadFloat('clip_top_length',4);                                   // 555b

    if NodeIndexOf(FindNode('clip_top_corner_mm'))<>-1
       then clip_top_corner_mm:=ReadFloat('clip_top_corner_mm',0.08);                          // 555b

    if NodeIndexOf(FindNode('clip_arms_width'))<>-1
       then clip_arms_width:=ReadFloat('clip_arms_width',6);                                   // 555b

    if NodeIndexOf(FindNode('clip_outers_width'))<>-1
       then clip_outers_width:=ReadFloat('clip_outers_width',13);                              // 555b

    if NodeIndexOf(FindNode('clip_outers_length'))<>-1
       then clip_outers_length:=ReadFloat('clip_outers_length',4);                             // 555b

    if NodeIndexOf(FindNode('clip_ends_clear_mm'))<>-1
       then clip_ends_clear_mm:=ReadFloat('clip_ends_clear_mm',0);     // MW

    if NodeIndexOf(FindNode('clip_sides_clear_mm'))<>-1
       then clip_sides_clear_mm:=ReadFloat('clip_sides_clear_mm',0);   // MW

    if NodeIndexOf(FindNode('clip_hole_mm'))<>-1
       then clip_hole_mm:=ReadFloat('clip_hole_mm',1.0);                                       // 555b

    if NodeIndexOf(FindNode('clip_depth_mm'))<>-1
       then clip_depth_mm:=ReadFloat('clip_depth_mm',1.8);                                     // 555b

    if NodeIndexOf(FindNode('clip_foot_depth_mm'))<>-1
       then clip_foot_depth_mm:=ReadFloat('clip_foot_depth_mm',0.36);                          // 555b

    if NodeIndexOf(FindNode('clip_foot_offset_mm'))<>-1
       then clip_foot_offset_mm:=ReadFloat('clip_foot_offset_mm',0.3);                         // 555b


    // splints / slabs / brick labels

    if NodeIndexOf(FindNode('normal_splint_depth'))<>-1
       then normal_splint_depth:=ReadFloat('normal_splint_depth',0);      // MW

    if NodeIndexOf(FindNode('cot_splint_depth'))<>-1
       then cot_splint_depth:=ReadFloat('cot_splint_depth',0);            // MW

    if NodeIndexOf(FindNode('splint_width'))<>-1
       then splint_width:=ReadFloat('splint_width',9);                                         // 555b

    if NodeIndexOf(FindNode('normal_slab_depth'))<>-1
       then normal_slab_depth:=ReadFloat('normal_slab_depth',0);          // MW

    if NodeIndexOf(FindNode('cot_slab_depth'))<>-1
       then cot_slab_depth:=ReadFloat('cot_slab_depth',0);                // MW

    if NodeIndexOf(FindNode('label_tab_width'))<>-1
       then label_tab_width:=ReadFloat('label_tab_width',15);                                  // 555b

    if NodeIndexOf(FindNode('normal_label_char_thickness'))<>-1
       then normal_label_char_thickness:=ReadFloat('normal_label_char_thickness',0);  // MW

    if NodeIndexOf(FindNode('cot_label_char_thickness'))<>-1
       then cot_label_char_thickness:=ReadFloat('cot_label_char_thickness',0);        // MW

    // sockets

    if NodeIndexOf(FindNode('plugsock_length_mod'))<>-1
       then plugsock_length_mod:=ReadFloat('plugsock_length_mod',0);                          // 555b

    if NodeIndexOf(FindNode('plugsock_width_mod'))<>-1
       then plugsock_width_mod:=ReadFloat('plugsock_width_mod',0);                            // 555b

    if NodeIndexOf(FindNode('socket_chamfer'))<>-1
       then socket_chamfer:=ReadFloat('socket_chamfer',0.15);                                 // 555b

    if NodeIndexOf(FindNode('socket_chamfer_depth'))<>-1
       then socket_chamfer_depth:=ReadFloat('socket_chamfer_depth',0.36);                     // 555b

    if NodeIndexOf(FindNode('socket_depth'))<>-1
       then socket_depth:=ReadFloat('socket_depth',10.08);                                     // 555b

    // snap fit chairs

    if NodeIndexOf(FindNode('snap_socket_fit_sides_sl'))<>-1
       then snap_socket_fit_sides_sl:=ReadFloat('snap_socket_fit_sides_sl',0.06);             // 555b

    if NodeIndexOf(FindNode('snap_socket_fit_sides_timb'))<>-1
       then snap_socket_fit_sides_timb:=ReadFloat('snap_socket_fit_sides_timb',0.05);         // 555b

    if NodeIndexOf(FindNode('snap_socket_fit_ends'))<>-1
       then snap_socket_fit_ends:=ReadFloat('snap_socket_fit_ends',0.04);                     // 555b

    if NodeIndexOf(FindNode('snap_socket_undercut'))<>-1
       then snap_socket_undercut:=ReadFloat('snap_socket_undercut',7/16);                     // 555b

    if NodeIndexOf(FindNode('snap_undercut_depth'))<>-1
       then snap_undercut_depth:=ReadFloat('snap_undercut_depth',1.44);                       // 555b

    if NodeIndexOf(FindNode('snap_clearcut_depth'))<>-1
       then snap_clearcut_depth:=ReadFloat('snap_clearcut_depth',6);                          // 555b

    // clip socket chairs

    if NodeIndexOf(FindNode('clip_socket_fit_sides_sl'))<>-1
       then clip_socket_fit_sides_sl:=ReadFloat('clip_socket_fit_sides_sl',0.06);             // 555b

    if NodeIndexOf(FindNode('clip_socket_fit_sides_timb'))<>-1
       then clip_socket_fit_sides_timb:=ReadFloat('clip_socket_fit_sides_timb',0.05);         // 555b

    if NodeIndexOf(FindNode('clip_socket_fit_ends'))<>-1
       then clip_socket_fit_ends:=ReadFloat('clip_socket_fit_ends',0.01);                     // 555b

    if NodeIndexOf(FindNode('clip_socket_undercut'))<>-1
       then clip_socket_undercut:=ReadFloat('clip_socket_undercut',7/16);                     // 555b

    if NodeIndexOf(FindNode('clip_undercut_depth'))<>-1
       then clip_undercut_depth:=ReadFloat('clip_undercut_depth',1.44);                       // 555b

    if NodeIndexOf(FindNode('clip_clearcut_depth'))<>-1
       then clip_clearcut_depth:=ReadFloat('clip_clearcut_depth',5.5);                        // 555b

    if NodeIndexOf(FindNode('clip_socket_flap_top_depth'))<>-1
       then clip_socket_flap_top_depth:=ReadFloat('clip_socket_flap_top_depth',2.52);         // 555b

    if NodeIndexOf(FindNode('clip_socket_flap_top_length'))<>-1
       then clip_socket_flap_top_length:=ReadFloat('clip_socket_flap_top_length',3.69);       // 555b

    if NodeIndexOf(FindNode('clip_socket_flap_jut_length'))<>-1
       then clip_socket_flap_jut_length:=ReadFloat('clip_socket_flap_jut_length',1.1);        // 555b

    if NodeIndexOf(FindNode('clip_socket_flap_rear_length'))<>-1
       then clip_socket_flap_rear_length:=ReadFloat('clip_socket_flap_rear_length',0.1);      // 555b

    if NodeIndexOf(FindNode('clip_socket_flap_clear_width'))<>-1
       then clip_socket_flap_clear_width:=ReadFloat('clip_socket_flap_clear_width',1.5);      // 555b

    if NodeIndexOf(FindNode('clip_tang_end_space'))<>-1
       then clip_tang_end_space:=ReadFloat('clip_tang_end_space',5/16);                       // 555b

    // press fit chairs

    if NodeIndexOf(FindNode('press_socket_fit_sides_sl'))<>-1
       then press_socket_fit_sides_sl:=ReadFloat('press_socket_fit_sides_sl',0.05);           // 555b

    if NodeIndexOf(FindNode('press_socket_fit_sides_timb'))<>-1
       then press_socket_fit_sides_timb:=ReadFloat('press_socket_fit_sides_timb',0.04);       // 555b

       // negative interference fit ...

    if NodeIndexOf(FindNode('press_short_socket_fit_ends'))<>-1
       then press_short_socket_fit_ends:=ReadFloat('press_short_socket_fit_ends',-0.03);      // 555b

    if NodeIndexOf(FindNode('press_socket_fit_ends'))<>-1
       then press_socket_fit_ends:=ReadFloat('press_socket_fit_ends',-0.02);                  // 555b

    if NodeIndexOf(FindNode('press_long_socket_fit_ends'))<>-1
       then press_long_socket_fit_ends:=ReadFloat('press_long_socket_fit_ends',-0.01);        // 555b

    if NodeIndexOf(FindNode('press_very_long_socket_fit_ends'))<>-1
       then press_very_long_socket_fit_ends:=ReadFloat('press_very_long_socket_fit_ends',-0.01); // 555b

    // ------------

    if NodeIndexOf(FindNode('socket_indent'))<>-1
       then socket_indent:=ReadFloat('socket_indent',1/3);                                    // 555b

    // snap fit plugs

    if NodeIndexOf(FindNode('snap_plug_overcut'))<>-1
       then snap_plug_overcut:=ReadFloat('snap_plug_overcut',3/8);                            // 555b

    if NodeIndexOf(FindNode('snap_plug_overcut_depth'))<>-1
       then snap_plug_overcut_depth:=ReadFloat('snap_plug_overcut_depth',2.5);                // 555b

    if NodeIndexOf(FindNode('snap_plug_taper_depth'))<>-1
       then snap_plug_taper_depth:=ReadFloat('snap_plug_taper_depth',2);                      // 555b

    if NodeIndexOf(FindNode('snap_plug_inset_depth'))<>-1
       then snap_plug_inset_depth:=ReadFloat('snap_plug_inset_depth',3.5);                    // 555b

    if NodeIndexOf(FindNode('snap_plug_total_depth'))<>-1
       then snap_plug_total_depth:=ReadFloat('snap_plug_total_depth',7.5);                    // 555b

    if NodeIndexOf(FindNode('snap_plug_extended_depth'))<>-1
       then snap_plug_extended_depth:=ReadFloat('snap_plug_extended_depth',2.5);              // 555b

    if NodeIndexOf(FindNode('snap_plug_inset_clear_upper'))<>-1
       then snap_plug_inset_clear_upper:=ReadFloat('snap_plug_inset_clear_upper',0.25);       // 555b

    if NodeIndexOf(FindNode('snap_plug_inset_clear_bottom'))<>-1
       then snap_plug_inset_clear_bottom:=ReadFloat('snap_plug_inset_clear_bottom',7/16);     // 555b


    // clip fit plugs

    if NodeIndexOf(FindNode('clip_plug_taper_depth'))<>-1
       then clip_plug_taper_depth:=ReadFloat('clip_plug_taper_depth',2);                      // 555b

    if NodeIndexOf(FindNode('clip_plug_inset_depth'))<>-1
       then clip_plug_inset_depth:=ReadFloat('clip_plug_inset_depth',3.5);                    // 555b

    if NodeIndexOf(FindNode('clip_plug_total_depth'))<>-1
       then clip_plug_total_depth:=ReadFloat('clip_plug_total_depth',7.75);                   // 555b

    if NodeIndexOf(FindNode('clip_plug_extended_depth'))<>-1
       then clip_plug_extended_depth:=ReadFloat('clip_plug_extended_depth',8.375);            // 555b

    if NodeIndexOf(FindNode('clip_plug_inset_clear_upper'))<>-1
       then clip_plug_inset_clear_upper:=ReadFloat('clip_plug_inset_clear_upper',0.25);       // 555b

    if NodeIndexOf(FindNode('clip_plug_inset_clear_bottom'))<>-1
       then clip_plug_inset_clear_bottom:=ReadFloat('clip_plug_inset_clear_bottom',7/16);     // 555b

       // clip tangs

    if NodeIndexOf(FindNode('clip_tang_overcut'))<>-1
       then clip_tang_overcut:=ReadFloat('clip_tang_overcut',1/2);                            // 555b

    if NodeIndexOf(FindNode('clip_tang_roof_front_depth'))<>-1
       then clip_tang_roof_front_depth:=ReadFloat('clip_tang_roof_front_depth',5/4);          // 555b

    if NodeIndexOf(FindNode('clip_tang_roof_back_depth'))<>-1
       then clip_tang_roof_back_depth:=ReadFloat('clip_tang_roof_back_depth',2);              // 555b

    if NodeIndexOf(FindNode('clip_tang_floor_depth'))<>-1
       then clip_tang_floor_depth:=ReadFloat('clip_tang_floor_depth',6);                      // 555b

    if NodeIndexOf(FindNode('clip_tang_default_depth'))<>-1
       then clip_tang_default_depth:=ReadFloat('clip_tang_default_depth',2.4);                // 555b

    if NodeIndexOf(FindNode('clip_tang_overcut_depth'))<>-1
       then clip_tang_overcut_depth:=ReadFloat('clip_tang_overcut_depth',2.4);                // 555b

       // ----------

    // press fit plugs

    if NodeIndexOf(FindNode('press_plug_taper_depth'))<>-1
       then press_plug_taper_depth:=ReadFloat('press_plug_taper_depth',2);                    // 555b

    if NodeIndexOf(FindNode('press_plug_inset_depth'))<>-1
       then press_plug_inset_depth:=ReadFloat('press_plug_inset_depth',3.5);                  // 555b

    if NodeIndexOf(FindNode('press_plug_total_depth'))<>-1
       then press_plug_total_depth:=ReadFloat('press_plug_total_depth',7.75);                 // 555b

    if NodeIndexOf(FindNode('press_plug_extended_depth'))<>-1
       then press_plug_extended_depth:=ReadFloat('press_plug_extended_depth',8.375);          // 555b

    if NodeIndexOf(FindNode('press_plug_inset_clear_upper'))<>-1
       then press_plug_inset_clear_upper:=ReadFloat('press_plug_inset_clear_upper',0.25);     // 555b

    if NodeIndexOf(FindNode('press_plug_inset_clear_bottom'))<>-1
       then press_plug_inset_clear_bottom:=ReadFloat('press_plug_inset_clear_bottom',7/16);   // 555b


    // plugs

    if NodeIndexOf(FindNode('locator_plug_depth'))<>-1
       then locator_plug_depth:=ReadFloat('locator_plug_depth',36);                           // 555b

    if NodeIndexOf(FindNode('plug_corner_clear_fdm'))<>-1
       then plug_corner_clear_fdm:=ReadFloat('plug_corner_clear_fdm',0.75);                   // 555b

    if NodeIndexOf(FindNode('plug_corner_clear_cnc'))<>-1
       then plug_corner_clear_cnc:=ReadFloat('plug_corner_clear_cnc',2.25);                   // 555b

    if NodeIndexOf(FindNode('plug_end_width_fdm'))<>-1
       then plug_end_width_fdm:=ReadFloat('plug_end_width_fdm',1.5);                          // 555b

    if NodeIndexOf(FindNode('plug_end_width_cnc'))<>-1
       then plug_end_width_cnc:=ReadFloat('plug_end_width_cnc',1.0);                          // 555b

    if NodeIndexOf(FindNode('plug_fit_sides'))<>-1
       then plug_fit_sides:=ReadFloat('plug_fit_sides',0);                                    // 555b

    if NodeIndexOf(FindNode('plug_fit_ends'))<>-1
       then plug_fit_ends:=ReadFloat('plug_fit_ends',0);                                      // 555b

    // pyramids

    if NodeIndexOf(FindNode('pyramid_height_low'))<>-1
       then pyramid_height_low:=ReadFloat('pyramid_height_low',3.0);                          // 555b

    if NodeIndexOf(FindNode('pyramid_height_high'))<>-1
       then pyramid_height_high:=ReadFloat('pyramid_height_high',7.0);                        // 555b

    if NodeIndexOf(FindNode('pyramid_taper'))<>-1
       then pyramid_taper:=ReadFloat('pyramid_taper',1.25);                                   // 555b

    if NodeIndexOf(FindNode('pyramid_top_end_inset'))<>-1
       then pyramid_top_end_inset:=ReadFloat('pyramid_top_end_inset',3);                      // 555b

    if NodeIndexOf(FindNode('pyramid_top_side_inset'))<>-1
       then pyramid_top_side_inset:=ReadFloat('pyramid_top_side_inset',2);                    // 555b

    if NodeIndexOf(FindNode('shrink_gauge_spacing'))<>-1
       then shrink_gauge_spacing:=ReadFloat('shrink_gauge_spacing',3);                        // 555b

    // loose jaw pins

    if NodeIndexOf(FindNode('pyramid_height_pin'))<>-1
       then pyramid_height_pin:=ReadFloat('pyramid_height_pin',1.0);                          // 555b

    if NodeIndexOf(FindNode('pin_slot_halfwide'))<>-1
       then pin_slot_halfwide:=ReadFloat('pin_slot_halfwide',1.8);                            // 555b

    if NodeIndexOf(FindNode('pin_slot_length'))<>-1
       then pin_slot_length:=ReadFloat('pin_slot_length',1.8);                                // 555b

    if NodeIndexOf(FindNode('loose_pin_clear_sides'))<>-1
       then loose_pin_clear_sides:=ReadFloat('loose_pin_clear_sides',0.04);                   // 555b

    if NodeIndexOf(FindNode('loose_pin_clear_front'))<>-1
       then loose_pin_clear_front:=ReadFloat('loose_pin_clear_front',0.04);                   // 555b

    if NodeIndexOf(FindNode('loose_pin_clear_back'))<>-1
       then loose_pin_clear_back:=ReadFloat('loose_pin_clear_back',0.04);                     // 555b

    if NodeIndexOf(FindNode('loose_pin_bottom_taper_ins'))<>-1
       then loose_pin_bottom_taper_ins:=ReadFloat('loose_pin_bottom_taper_ins',0.09);         // 555b

    if NodeIndexOf(FindNode('key_thicken'))<>-1
       then key_thicken:=ReadFloat('key_thicken',0.05);                                       // 555b

    if NodeIndexOf(FindNode('loose_pin_depth_clear'))<>-1
       then loose_pin_depth_clear:=ReadFloat('loose_pin_depth_clear',1/8);                    // 555b

    if NodeIndexOf(FindNode('loose_pin_bottom_chamfer_clear'))<>-1
       then loose_pin_bottom_chamfer_clear:=ReadFloat('loose_pin_bottom_chamfer_clear',1.75); // 555b

    if NodeIndexOf(FindNode('slot_angle'))<>-1
       then slot_angle:=ReadFloat('slot_angle',5*Pi/180);                                     // 555b

    // raft

    if NodeIndexOf(FindNode('raft_thick'))<>-1
       then raft_thick:=ReadFloat('raft_thick',0.05);                                         // 555b

    if NodeIndexOf(FindNode('raft_flange'))<>-1
       then raft_flange:=ReadFloat('raft_flange',0.25);                                       // 555b

    if NodeIndexOf(FindNode('raft_label_char_thickness'))<>-1
       then raft_label_char_thickness:=ReadFloat('raft_label_char_thickness',1.0);            // 555b

    if NodeIndexOf(FindNode('alignment_plate_thick_mm'))<>-1
       then alignment_plate_thick_mm:=ReadFloat('alignment_plate_thick_mm',3.0);              // 555b

    // filament

    if NodeIndexOf(FindNode('filament_dia_mm'))<>-1
       then filament_dia_mm:=ReadFloat('filament_dia_mm',1.75);                               // 555b

    if NodeIndexOf(FindNode('filament_adjust'))<>-1
       then filament_adjust:=ReadFloat('filament_adjust',0);                                  // 555b

    // flangeways

    if NodeIndexOf(FindNode('fw_correction_xing'))<>-1
       then fw_correction_xing:=ReadFloat('fw_correction_xing',0);                            // 555b

    if NodeIndexOf(FindNode('fw_correction_check'))<>-1
       then fw_correction_check:=ReadFloat('fw_correction_check',0);                          // 555b

    if NodeIndexOf(FindNode('fw_tweak_xing'))<>-1
       then fw_tweak_xing:=ReadFloat('fw_tweak_xing',0);                                      // 555b

    if NodeIndexOf(FindNode('fw_tweak_check'))<>-1
       then fw_tweak_check:=ReadFloat('fw_tweak_check',0);                                    // 555b

    // kerfs

    if NodeIndexOf(FindNode('cutter_kerf_mm'))<>-1
       then cutter_kerf_mm:=ReadFloat('cutter_kerf_mm',0.2);                                  // 555b

    if NodeIndexOf(FindNode('kerf_extra_undercut_mm'))<>-1
       then kerf_extra_undercut_mm:=ReadFloat('kerf_extra_undercut_mm',0);                    // 555b

    // nibs and snibs

    if NodeIndexOf(FindNode('nib_width'))<>-1
       then nib_width:=ReadFloat('nib_width',0.6);                                            // 555b

    if NodeIndexOf(FindNode('nib_length'))<>-1
       then nib_length:=ReadFloat('nib_length',0.6);                                          // 555b

    if NodeIndexOf(FindNode('tsn_snib_space_mm'))<>-1
       then tsn_snib_space_mm:=ReadFloat('tsn_snib_space_mm',0.3);                            // 555b

    if NodeIndexOf(FindNode('tsf_snib_space_mm'))<>-1
       then tsf_snib_space_mm:=ReadFloat('tsf_snib_space_mm',0.3);                            // 555b

    if NodeIndexOf(FindNode('msn_snib_space_mm'))<>-1
       then msn_snib_space_mm:=ReadFloat('msn_snib_space_mm',0.3);                            // 555b

    if NodeIndexOf(FindNode('msf_snib_space_mm'))<>-1
       then msf_snib_space_mm:=ReadFloat('msf_snib_space_mm',0.3);                            // 555b

    if NodeIndexOf(FindNode('snib1_extent'))<>-1
       then snib1_extent:=ReadFloat('snib1_extent',6);                                        // 555b

    if NodeIndexOf(FindNode('snib2_extent_t'))<>-1
       then snib2_extent_t:=ReadFloat('snib2_extent_t',15.5);                                 // 555b

    if NodeIndexOf(FindNode('snib2_extent_p'))<>-1
       then snib2_extent_p:=ReadFloat('snib2_extent_p',10);                                   // 555b

    if NodeIndexOf(FindNode('snib2_extent_e'))<>-1
       then snib2_extent_e:=ReadFloat('snib2_extent_e',12.5);                                 // 555b


    // nails

    if NodeIndexOf(FindNode('nails_height'))<>-1
       then nails_height:=ReadFloat('nails_height',0);                                        // 555b

    if NodeIndexOf(FindNode('nails_toprad'))<>-1
       then nails_toprad:=ReadFloat('nails_toprad',0);                                        // 555b

    if NodeIndexOf(FindNode('nails_botrad'))<>-1
       then nails_botrad:=ReadFloat('nails_botrad',0);                                        // 555b

    if NodeIndexOf(FindNode('nailx_spacing'))<>-1
       then nailx_spacing:=ReadFloat('nailx_spacing',0);                                      // 555b

    if NodeIndexOf(FindNode('naily_spacing'))<>-1
       then naily_spacing:=ReadFloat('naily_spacing',0);                                      // 555b


     // shrinkage FDM - heated bed

    if NodeIndexOf(FindNode('fdm_hot_shrinkage_x'))<>-1
       then fdm_hot_shrinkage_x:=ReadFloat('fdm_hot_shrinkage_x',0);                          // 555b

    if NodeIndexOf(FindNode('fdm_hot_shrinkage_y'))<>-1
       then fdm_hot_shrinkage_y:=ReadFloat('fdm_hot_shrinkage_y',0);                          // 555b

    if NodeIndexOf(FindNode('fdm_hot_shrinkage_z'))<>-1
       then fdm_hot_shrinkage_z:=ReadFloat('fdm_hot_shrinkage_z',0);                          // 555b

    if NodeIndexOf(FindNode('fdm_rail_foot_factor'))<>-1
       then fdm_rail_foot_factor:=ReadFloat('fdm_rail_foot_factor',0);                        // FDM chairs (COT track)  MW

    if NodeIndexOf(FindNode('fdm_rail_web_factor'))<>-1
       then fdm_rail_web_factor:=ReadFloat('fdm_rail_web_factor',0);                          // FDM chairs (COT track)  MW


    // shrinkage FDM - cold bed

    if NodeIndexOf(FindNode('fdm_cold_shrinkage_x'))<>-1
       then fdm_cold_shrinkage_x:=ReadFloat('fdm_cold_shrinkage_x',0);                        // 555b

    if NodeIndexOf(FindNode('fdm_cold_shrinkage_y'))<>-1
       then fdm_cold_shrinkage_y:=ReadFloat('fdm_cold_shrinkage_y',0);                        // 555b

    if NodeIndexOf(FindNode('fdm_cold_shrinkage_z'))<>-1
       then fdm_cold_shrinkage_z:=ReadFloat('fdm_cold_shrinkage_z',0);                        // 555b

    // shrinkage Resin

    if NodeIndexOf(FindNode('resin_shrinkage_x'))<>-1
       then resin_shrinkage_x:=ReadFloat('resin_shrinkage_x',0);                              // 555b

    if NodeIndexOf(FindNode('resin_shrinkage_y'))<>-1
       then resin_shrinkage_y:=ReadFloat('resin_shrinkage_y',0);                              // 555b

    if NodeIndexOf(FindNode('resin_shrinkage_z'))<>-1
       then resin_shrinkage_z:=ReadFloat('resin_shrinkage_z',0);                              // 555b

    // minibo backlash correction

    if NodeIndexOf(FindNode('bl_x'))<>-1
       then bl_x:=ReadFloat('bl_x',0.3);                                                      // 555b

    if NodeIndexOf(FindNode('bl_y'))<>-1
       then bl_y:=ReadFloat('bl_y',0.3);                                                      // 555b

    if NodeIndexOf(FindNode('bl_z'))<>-1
       then bl_z:=ReadFloat('bl_z',0.4);                                                      // 555b

    // rotate STL by

    if NodeIndexOf(FindNode('stl_rot_x'))<>-1
       then stl_rot_x:=ReadFloat('stl_rot_x',0);                                              // 555b

    if NodeIndexOf(FindNode('stl_rot_y'))<>-1
       then stl_rot_y:=ReadFloat('stl_rot_y',0);                                              // 555b

    if NodeIndexOf(FindNode('stl_rot_k'))<>-1
       then stl_rot_k:=ReadFloat('stl_rot_k',0);                                              // 555b

    // fw widen

    if NodeIndexOf(FindNode('fw_mod_for_gw'))<>-1
       then fw_mod_for_gw:=ReadFloat('fw_mod_for_gw',0);                                      // 555b

    // other

    if NodeIndexOf(FindNode('chair_web_adjustment'))<>-1
       then chair_web_adjustment:=ReadFloat('chair_web_adjustment',0);                        // 555b

  end;//with node

  xml_doc.Free;

  with dxf_form do begin    // update DXF dialog

    chair_adjust_edit.Text:=FloatToStr(chair_web_adjustment);

    case rail_section_option of
        0: bs95r_radiobutton.Checked:=True;
        1: emgs_75_rail_radiobutton.Checked:=True;
        2: smp_75_rail_radiobutton.Checked:=True;
        3: peco_124_rail_radiobutton.Checked:=True;
        4: cl_131_rail_radiobutton.Checked:=True;
        5: dxf_form.cl_125_rail_radiobutton.Checked:=True;

       99: begin
             custom_rail_radiobutton.Checked:=True;
             custom_rail_radiobutton.Caption:='custom: '+custom_section_name_str;
           end;
    end;//case
  end;//with

  show_modal_message('Your custom data has been loaded from'+#13+#13+sk4_str);

  Close;
end;
//______________________________________________________________________________

procedure Tcustom_3d_form.save_sk4_buttonClick(Sender: TObject);

begin
  with custom_save_dialog do begin             // set up the save dialog

  if user_save_custom_path=''
  then InitialDir:=exe_str+'DXF-FILES\'
  else InitialDir:=user_save_custom_path;

  Title:='    save  custom  data  as ...';
     Filter:='custom data (.sk4)|*.sk4';
     DefaultExt:='.sk4';

     FileName:='custom_3d_data'+FormatDateTime(' yy_mm_dd hhmm ss',Date+Time)+'.sk4';

     FileName:=lower_case_filename(FileName);   // to underscores and lower case
   end;//with

   if custom_save_dialog.Execute=True           // get her file name
      then begin
             sk4_str:=custom_save_dialog.FileName;

             if invalid_85a_file_name(sk4_str)=True then EXIT;

             user_save_custom_path:=ExtractFilePath(sk4_str);   // for next time

             sk4_str:=ChangeFileExt(sk4_str,'.sk4');   // force extension

             xml_save_doc.SaveToFile(sk4_str);

             show_modal_message('Your custom data has been saved to'+#13+#13+sk4_str);
           end;

    Close;
  end;
//______________________________________________________________________________

procedure Tcustom_3d_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=740;
  ClientHeight:=736;
end;
//______________________________________________________________________________

procedure Tcustom_3d_form.cancel_buttonClick(Sender: TObject);

begin
  Close;
end;

//______________________________________________________________________________


end.

