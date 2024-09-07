
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

unit jigs_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  // StdCtrls;
  StdCtrls, ExtCtrls;


type

  { Tjigs_form }

  Tjigs_form = class(TForm)
    jigs_panel: Tpanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    rail_type_panel: Tpanel;
    bh_radio: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    xing_panel: Tpanel;
    Label1: TLabel;
    Label2: TLabel;
    xing_angle_as_control_radio: TRadioButton;
    xing_angle_entered_radio: TRadioButton;
    xing_angle_edit: TEdit;
    switch_panel: Tpanel;
    xing_radio: TRadioButton;
    switch_radio: TRadioButton;
    dims_panel: Tpanel;
    ok_button: TButton;
    datestamp_label: TLabel;
    xing_control_label: TLabel;
    north_checkbox: TCheckBox;
    south_checkbox: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    part_thickness_edit: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    bolt_hole_edit: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    rail_head_width_edit: TEdit;
    rail_fb_foot_width_edit: TEdit;
    groove_depth_edit: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    rail_code_edit: TEdit;
    knuckle_radio: TRadioButton;
    Label17: TLabel;
    Label18: TLabel;
    kn_groove_depth_edit: TEdit;
    knuckle_guide_checkbox: TCheckBox;
    panel2: Tpanel;
    Label4: TLabel;
    switch_control_label: TLabel;
    switch_angle_as_control_radio: TRadioButton;
    switch_angle_entered_radio: TRadioButton;
    switch_angle_edit: TEdit;
    back_radio: TRadioButton;
    front_panel: Tpanel;
    Label19: TLabel;
    Label20: TLabel;
    slope_angle_edit: TEdit;
    angled_base_checkbox: TCheckBox;
    front_left_radio: TRadioButton;
    front_right_radio: TRadioButton;
    top_pad_checkbox: TCheckBox;
    set_top_pad_button: TButton;
    procedure FormCreate(Sender: TObject);
    procedure xing_angle_editMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure switch_angle_editMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure xing_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure switch_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure front_left_radioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure front_right_radioMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure back_radioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure set_top_pad_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  jigs_form: Tjigs_form;

  function dxf_filing_jigs(var dxf_file:TextFile):boolean;

  procedure dxf_tweezer_tips(var dxf_file:TextFile);

//______________________________________________________________________________

implementation

{$R *.lfm}

uses
  Math, control_room, pad_unit, math_unit, dxf_unit, entry_sheet, alert_unit;

var
  top_pad_thick_mm:extended=0.16;
  top_pad_width_mm:extended=15.0;

  jig_size_str:string='';

//______________________________________________________________________________

procedure jig_label(left_hand,smaller,bold:boolean; orgy,z1,z2:extended; str:string; var dxf_file:TextFile);

var
  a:integer;


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

                procedure seven_seg(str:string);    // draw numbers 7-seg style on brick label     234a

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
                  orgx:extended;
                  p1,p2,p3,p4:Tpex;

                  blscale:extended;

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

                                    write_3d_solid_rectangle(p1,p2,p3,p4,z1,z2, 12);   // layer 12 TEXT
                                  end;
                                  //============================================

                begin
                  if bold=True
                     then blscale:=0.53         // to fit label space
                     else blscale:=0.44;

                  if smaller=True then blscale:=0.40;

                  for n:=1 to Length(str) do begin
                    num_char:=str[n];

                    orgx:=(n-1)*6.25*blscale;  // character spacing

                    if left_hand=False
                       then orgx:=orgx-27;

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


begin
  seven_seg(str);
end;
//______________________________________________________________________________

function dxf_filing_jigs(var dxf_file:TextFile):boolean;

var
  n:integer;

  p:array [0..104] of Tpex;

  xing_angle,switch_angle:extended;

  rail_height,rail_head_width,rail_fb_foot_width:extended;

  zb,zm,zt:extended;     // base, middle, top

  z_groove,kn_z_groove:extended;

  h:extended;  // half-screw hole

  split_offset,base_offset:extended;  // switch front slope

  jlen:extended;  // jig length

  str,v_xing_str,xing_str:string;

  xing_jig,switch_back,switch_front,left_hand,knuckle_only:boolean;

  pl:extended;  // planing length

  knuckle_len,knuckle_cen,knuckle_rad:extended;

  upper_part:boolean;

  part_thickness,bolt_hole,slope_angle:extended;

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

                procedure set_p(n:integer; x,y:extended);

                begin
                  p[n].x:=x;
                  p[n].y:=y;
                end;
                ////////////////////////////////////////////////////////////////

                procedure do_file(n1:integer; z1:extended; n2:integer; z2:extended; n3:integer; z3:extended; n4:integer; z4:extended);

                var
                  layer:integer;

                begin
                  if upper_part=True
                     then layer:=6       // colour as GDMARKS
                     else layer:=16;     // colour as CHBASE

                  Write(dxf_file,dxf_3dface_pex( p[n1],z1, p[n2],z2, p[n3],z3, p[n4],z4, layer,0));
                end;
                ////////////////////////////////////////////////////////////////

                procedure do_knuckle_rad(pcentre:Tpex; rad,ram:extended; pstart:integer);

                var
                  n:integer;
                  nk,kstep:extended;

                begin

                  kstep:=ARCTAN(1/ram)/20;  // turn per step

                  for n:=0 to 20 do begin   // 21 points p50 to p70

                    nk:=n*kstep;

                    p[pstart+n].x:=pcentre.x+rad*SIN(nk);
                    p[pstart+n].y:=pcentre.y-rad*COS(nk);

                  end;//next
                end;
                ////////////////////////////////////////////////////////////////

                procedure do_half_jig(half:integer);

                var
                  n:integer;
                  zkn:extended;

                begin

                  upper_part:=False;     // lower base part first

                  if knuckle_only=True
                     then begin
                            write_3d_solid_rectangle(  p[1], p[47], p[29],  p[2], zb, zm, 16);
                            write_3d_solid_rectangle( p[46], p[42], p[44], p[45], zb, zm, 16);
                          end
                     else begin

                              // inside holes ...

                                // west screw hole ...

                            do_file(  4,zb,  5,zb,  5,zt,  4,zt);  // west
                            do_file(  5,zb,  6,zb,  6,zt,  5,zt);  // north
                            do_file(  6,zb,  7,zb,  7,zt,  6,zt);  // east
                            do_file(  7,zb,  4,zb,  4,zt,  7,zt);  // south

                                // east screw hole ...

                            do_file(   8,zb,   9,zb,   9,zt,   8,zt);  // west
                            do_file(   9,zb,  10,zb,  10,zt,   9,zt);  // north
                            do_file(  10,zb,  11,zb,  11,zt,  10,zt);  // east
                            do_file(  11,zb,   8,zb,   8,zt,  11,zt);  // south

                                // clamp hole ...

                            if switch_front=True
                               then begin
                                      do_file(  30,zb,  93,zb,  31,zt,  30,zt);  // west
                                      do_file(  32,zb,  30,zb,  30,zt,  32,zt);  // north
                                      do_file(  32,zb,  94,zb,  33,zt,  32,zt);  // east
                                      do_file(  93,zb,  94,zb,  33,zt,  31,zt);  // south
                                    end
                               else begin
                                      do_file(  30,zb,  31,zb,  31,zt,  30,zt);  // west
                                      do_file(  32,zb,  30,zb,  30,zt,  32,zt);  // north
                                      do_file(  33,zb,  32,zb,  32,zt,  33,zt);  // east
                                      do_file(  31,zb,  33,zb,  33,zt,  31,zt);  // south
                                    end;

                              // lower part ...

                                // base and mid faces ...

                            if switch_front=True
                               then begin
                                      do_file(  91,zb, 81,zb,  5,zb,  4,zb);  // A base  slope
                                      do_file(  81,zb, 82,zb, 10,zb,  5,zb);  // B base  slope
                                      do_file(  82,zb, 92,zb, 11,zb, 10,zb);  // C base  slope

                                      do_file( 95,zm, 77,zm,  5,zm,  4,zm);  // A mid
                                      do_file( 77,zm, 80,zm, 10,zm,  5,zm);  // B mid
                                      do_file( 80,zm, 96,zm, 11,zm, 10,zm);  // C mid

                                      do_file( 92,zb, 91,zb, 93,zb, 94,zb);  // D base
                                      do_file( 96,zm, 95,zm, 97,zm, 98,zm);  // D mid

                                      do_file(  6,zb, 30,zb, 93,zb,  7,zb);  // K base
                                      do_file(  6,zm, 30,zm, 97,zm,  7,zm);  // K mid

                                      do_file( 32,zb,  9,zb,  8,zb, 94,zb);  // L base
                                      do_file( 32,zm,  9,zm,  8,zm, 98,zm);  // L mid

                                      do_file(  7,zb, 93,zb, 91,zb,  4,zb);  // M base
                                      do_file(  7,zm, 97,zm, 95,zm,  4,zm);  // M mid

                                      do_file(  8,zb, 11,zb, 92,zb, 94,zb);  // N base
                                      do_file(  8,zm, 11,zm, 96,zm, 98,zm);  // N mid


                                    end
                               else begin
                                      do_file(  0,zb,  1,zb,  5,zb,  4,zb);  // A base
                                      do_file(  1,zb,  2,zb, 10,zb,  5,zb);  // B base
                                      do_file(  2,zb,  3,zb, 11,zb, 10,zb);  // C base

                                      do_file(  0,zm, 37,zm,  5,zm,  4,zm);  // A mid
                                      do_file( 37,zm, 38,zm, 10,zm,  5,zm);  // B mid
                                      do_file( 38,zm,  3,zm, 11,zm, 10,zm);  // C mid

                                      do_file(  3,zb,  0,zb, 31,zb, 33,zb);  // D base
                                      do_file(  3,zm,  0,zm, 31,zm, 33,zm);  // D mid

                                      do_file(  6,zb, 30,zb, 31,zb,  7,zb);  // K base
                                      do_file(  6,zm, 30,zm, 31,zm,  7,zm);  // K mid

                                      do_file( 32,zb,  9,zb,  8,zb, 33,zb);  // L base
                                      do_file( 32,zm,  9,zm,  8,zm, 33,zm);  // L mid

                                      do_file(  7,zb, 31,zb,  0,zb,  4,zb);  // M base
                                      do_file(  7,zm, 31,zm,  0,zm,  4,zm);  // M mid

                                      do_file(  8,zb, 11,zb,  3,zb, 33,zb);  // N base
                                      do_file(  8,zm, 11,zm,  3,zm, 33,zm);  // N mid

                                    end;

                                // sides ...

                            if switch_front=True
                               then begin
                                      do_file(  91,zb,  81,zb,  77,zm,  95,zm);  // west
                                      do_file(  81,zb,  82,zb,  80,zm,  77,zm);  // angled north
                                      do_file(  82,zb,  92,zb,  96,zm,  80,zm);  // east
                                      do_file(  92,zb,  91,zb,  95,zm,  96,zm);  // south
                                    end
                               else begin
                                      do_file(  0,zb,  1,zb,  37,zm,  0,zm);   // west
                                      do_file(  1,zb,  2,zb,  38,zm, 37,zm);   // north
                                      do_file(  2,zb,  3,zb,   3,zm,  38,zm);  // east
                                      do_file(  3,zb,  0,zb,   0,zm,   3,zm);  // south
                                    end;

                          end;


                  // upper part ...

                  upper_part:=True;

                  if knuckle_only=True
                       then begin
                              zkn:=zt-0.2;       // 0.2 arbitrary   dropped top of arc

                              write_3d_solid_rectangle(  p[1], p[46], p[19], p[19], zb, zkn, 6);   // base to dropped top

                              write_3d_solid_rectangle( p[46], p[42], p[43], p[50], zm, zt, 14);   // mid to top

                              write_3d_solid_rectangle(  p[1], p[19], p[48],  p[2], zm, zt, 14);   // mid to top
                              write_3d_solid_rectangle( p[20], p[71], p[72], p[49], zm, zt, 14);   // mid to top

                              for n:=50 to 69 do begin

                                do_file( n,zb, n+1,zb, 46,zb, 46,zb);      // base arc step
                                do_file( n,zkn, n+1,zkn, 46,zkn, 46,zkn);  // dropped top arc step

                                do_file( n,zkn, n+1,zkn, n+1,zb, n,zb);    // edge of arc step
                              end;

                              v_xing_str:=FormatFloat('0.0#',xing_angle);

                              if Length(v_xing_str)<5
                                 then xing_str:='1in '+v_xing_str   // more space on label
                                 else xing_str:='1in'+v_xing_str;

                              jig_label(False,False,True,  p[73].y, zm,zm+MIN(0.45,zt-zm), xing_str, dxf_file);

                            end
                       else begin

                                    // mid and top faces ...

                              do_file(  12,zm,  20,zm,  5,zm,  4,zm);  // A mid
                              do_file(  12,zt,  20,zt,  5,zt,  4,zt);  // A top

                              if switch_back=True
                                 then begin
                                        do_file(  17,zm,  10,zm, 5,zm,  5,zm);  // B mid
                                        do_file(  17,zt,  10,zt, 5,zt,  5,zt);  // B top

                                        do_file(  17,zm,  3,zm, 11,zm, 10,zm);  // C mid

                                        do_file(  17,zt,  3,zt, 11,zt, 10,zt);  // C top

                                       do_file(  3,zm,   0,zm,  34,zm,  33,zm);  // D mid
                                       do_file(  3,zt,   0,zt,  34,zt,  33,zt);  // D top

                                      end
                                 else if switch_front=True
                                         then begin
                                                do_file(  17,zm,  10,zm, 5,zm,  5,zm);  // B mid
                                                do_file(  17,zt,  10,zt, 5,zt,  5,zt);  // B top

                                                do_file( 80,zm, 79,zm, 17,zm, 10,zm);  // BC mid
                                                do_file( 2,zt,  76,zt, 17,zt, 10,zt);  // BC top

                                                do_file( 80,zm, 96,zm, 11,zm, 10,zm);  // C mid
                                                do_file(  2,zt,  3,zt, 11,zt, 10,zt);  // C top

                                                do_file( 96,zm,  95,zm,  97,zm,  98,zm);  // D mid
                                                do_file(  3,zt,   0,zt,  31,zt,  33,zt);  // D top

                                                do_file( 14,zm, 34,zm,  95,zm, 97,zm);  // Z mid
                                                do_file( 14,zt, 34,zt,   0,zt, 31,zt);  // Z top

                                              end
                                         else begin      // vee rails...
                                                do_file(  17,zm,  2,zm, 10,zm,  5,zm);  // B mid
                                                do_file(  17,zt,  2,zt, 10,zt,  5,zt);  // B top

                                                do_file(  2,zm,  3,zm, 11,zm, 10,zm);  // C mid
                                                do_file(  2,zt,  3,zt, 11,zt, 10,zt);  // C top

                                                do_file(  3,zm,   0,zm,  34,zm,  33,zm);  // D mid
                                                do_file(  3,zt,   0,zt,  34,zt,  33,zt);  // D top

                                              end;


                              if switch_front=True
                                 then begin
                                        do_file( 77,zm, 78,zm, 36,zm,  19,zm);   // F mid

                                        do_file( 13,zm, 30,zm, 97,zm,  14,zm);  // K mid

                                        do_file( 32,zm,  9,zm,  8,zm,  98,zm);  // L mid

                                        do_file(  8,zm, 11,zm,  96,zm, 98,zm);  // N mid
                                      end
                                 else begin
                                        do_file(  1,zm, 35,zm, 36,zm,  19,zm);  // F mid

                                        do_file( 13,zm, 30,zm, 31,zm,  14,zm);  // K mid

                                        do_file( 32,zm,  9,zm,  8,zm,  33,zm);  // L mid

                                        do_file(  8,zm, 11,zm,  3,zm,  33,zm);  // N mid
                                      end;

                              do_file(  1,zt,  35,zt,  36,zt,  19,zt);  // F top

                              do_file(  5,zm,  20,zm,  17,zm,  17,zm);  // G triangle mid
                              do_file(  5,zt,  20,zt,  17,zt,  17,zt);  // G triangle top

                              do_file(  4,zm,   7,zm,  13,zm,  12,zm);  // J triangle mid
                              do_file(  4,zt,   7,zt,  13,zt,  12,zt);  // J triangle top


                              do_file( 13,zt, 30,zt, 31,zt,  14,zt);  // K top

                              do_file( 32,zt,  9,zt,  8,zt,  33,zt);  // L top

                              do_file(  7,zm,  6,zm, 30,zm,  13,zm);  // M mid
                              do_file(  7,zt,  6,zt, 30,zt,  13,zt);  // M top

                              do_file(  8,zt, 11,zt,  3,zt, 33,zt);  // N top


                                    // upper part sides ...

                              if switch_front=True
                                 then begin
                                        do_file(  77,zm,  19,zm,  19,zt,   1,zt);  // F west slope
                                        do_file(  77,zm,  78,zm,  35,zt,   1,zt);  // F north slope
                                        do_file(  78,zm,  36,zm,  36,zt,  35,zt);  // F east slope

                                        do_file(  34,zm,  95,zm,   0,zt,  34,zt);  // D west

                                      end
                                 else begin
                                        do_file(   1,zm,  19,zm,  19,zt,   1,zt);     // F west
                                        do_file(  35,zm,   1,zm,   1,zt,  35,zt);     // F north
                                        do_file(  35,zm,  36,zm,  36,zt,  35,zt);     // F east

                                        do_file(  34,zm,   0,zm,   0,zt,  34,zt);     // D west

                                      end;

                              do_file(  36,zm,  19,zm,  19,zt,  36,zt);     // F angle

                              do_file(  12,zm,  20,zm,  20,zt,  12,zt);     // A west

                              do_file(  20,zm,  17,zm,  17,zt,  20,zt);     // G angle

                              if switch_back=True
                                 then begin                                           // no side on B for switch
                                        do_file(  17,zm,   3,zm,   3,zt,  17,zt);     // C east
                                        do_file(   3,zm,   0,zm,   0,zt,   3,zt);     // D south
                                      end
                                 else if switch_front=True
                                         then begin
                                                do_file(  17,zm,   79,zm,   76,zt,  17,zt);  // BC face already filed slope
                                                do_file(  80,zm,   79,zm,   76,zt,   2,zt);  // BC north slope
                                                do_file(  80,zm,   96,zm,    3,zt,   2,zt);  // C east slope
                                                do_file(  96,zm,   95,zm,    0,zt,   3,zt);  // D south
                                              end
                                         else begin   // vee rails
                                                do_file(   2,zm,  17,zm,  17,zt,   2,zt);     // B north
                                                do_file(   2,zm,   3,zm,   3,zt,   2,zt);     // C east
                                                do_file(   3,zm,   0,zm,   0,zt,   3,zt);     // D south
                                              end;

                              do_file(  34,zm,  14,zm,  14,zt,  34,zt);     // D north  label space
                              do_file(  14,zm,  13,zm,  13,zt,  14,zt);     // H west   label space
                              do_file(  13,zm,  12,zm,  12,zt,  13,zt);     // J south  label space


                                  // add knuckle bend guide part ...

                              if (xing_jig=True) and (jigs_form.knuckle_guide_checkbox.Checked=True)
                                 then begin
                                        write_3d_solid_rectangle(  p[1], p[46], p[19], p[19], zb, zt, 6);   // base to top

                                        write_3d_solid_rectangle( p[46], p[42], p[43], p[50], zb, zt, 6);   // base to top

                                        for n:=50 to 69 do begin

                                          do_file( n,zb, n+1,zb, 46,zb, 46,zb);  // base arc step
                                          do_file( n,zt, n+1,zt, 46,zt, 46,zt);  // top arc step

                                          do_file( n,zt, n+1,zt, n+1,zb, n,zb);  // edge of arc step
                                        end;

                                      end;


                                  // add tabs if doing both parts ...

                              if (jigs_form.north_checkbox.Checked=True) and (jigs_form.south_checkbox.Checked=True)
                                 then begin
                                        if switch_front=True
                                           then begin
                                                  write_3d_solid_rectangle(  p[99], p[21], p[22], p[23], zb, zb+1.5, 16);
                                                  write_3d_solid_rectangle( p[100], p[24], p[25], p[26], zb, zb+1.5, 16);
                                                end
                                           else begin
                                                  write_3d_solid_rectangle( p[0], p[21], p[22], p[23], zb, zb+1.5, 16);
                                                  write_3d_solid_rectangle( p[3], p[24], p[25], p[26], zb, zb+1.5, 16);
                                                end;
                                      end;

                                  // top spacer pad ...  243b

                              if ((switch_front=True) or (switch_back=True))
                              and (jigs_form.top_pad_checkbox.Checked=True)

                                 then write_3d_solid_rectangle(p[101], p[102], p[103], p[104], zt, zt+top_pad_thick_mm, 22);         // 22 = CHKEYS

                                  // labels

                              v_xing_str:=FormatFloat('0.0#',xing_angle);

                              if Length(v_xing_str)<5
                                 then xing_str:='1in '+v_xing_str   // more space on label
                                 else xing_str:='1in'+v_xing_str;

                              if xing_jig=True
                                 then begin

                                       if half=1
                                          then begin
                                                  jig_label(left_hand,False,True,  p[28].y, zm,zm+MIN(0.45,zt-zm), xing_str, dxf_file);                                 // 3 * 0.15mm layers
                                                  jig_label(left_hand,False,False, p[27].y, zm,zm+MIN(0.45,zt-zm), ' CODE '+jigs_form.rail_code_edit.Text, dxf_file)    //IntToStr(Round(rail_height*1000/25.4)), dxf_file);
                                                end;

                                       if half=2
                                          then begin
                                                 jig_label(left_hand,False,False, p[28].y, zm,zm+MIN(0.45,zt-zm), xing_str, dxf_file);
                                                 jig_label(left_hand,True,False,  p[27].y, zm,zm+MIN(0.45,zt-zm), ' '+FormatFloat('0.00',rail_head_width)+' '+FormatFloat('0.00',z_groove), dxf_file);
                                               end;
                                      end
                                 else begin
                                        str:=' '; // init
                                        if ABS(switch_angle-24)<minfp then str:=' A';
                                        if ABS(switch_angle-32)<minfp then str:=' B';
                                        if ABS(switch_angle-40)<minfp then str:=' C';
                                        if ABS(switch_angle-48)<minfp then str:=' D';
                                        if ABS(switch_angle-64)<minfp then str:=' E';
                                        if ABS(switch_angle-80)<minfp then str:=' F';

                                        if half=1
                                           then begin
                                                  jig_label(left_hand,False,False, p[28].y, zm,zm+MIN(0.45,zt-zm), ' '+xing_str, dxf_file);
                                                  jig_label(left_hand,True,False,  p[27].y, zm,zm+MIN(0.45,zt-zm), ' '+FormatFloat('0.00',rail_head_width)+' '+FormatFloat('0.00',z_groove), dxf_file);
                                                end;

                                        if half=2
                                           then begin
                                                  if switch_front=True
                                                     then begin
                                                            if left_hand=True
                                                               then jig_label(left_hand,False,False, p[27].y, zm,zm+MIN(0.66,zt-zm), ' LH Front', dxf_file)
                                                               else jig_label(left_hand,False,False, p[27].y, zm,zm+MIN(0.66,zt-zm), ' RH Front', dxf_file);
                                                          end
                                                     else jig_label(left_hand,False,False, p[27].y, zm,zm+MIN(0.66,zt-zm), ' BACK OF', dxf_file);

                                                  jig_label(left_hand,False,True,  p[28].y, zm,zm+MIN(0.66,zt-zm), str+' BLADE', dxf_file);

                                                end;
                                      end;

                            end;

                end;
                ////////////////////////////////////////////////////////////////

                procedure do_one_half_switch_front(second:boolean);

                begin
                    split_offset:=z_groove*TAN(slope_angle*Pi/180);  // front filing slope angle..
                    base_offset:=zm*TAN(slope_angle*Pi/180);

                    if second=True   // dims apply at top of second half -- blade top
                       then begin
                              split_offset:=0-split_offset;
                              base_offset:=0-base_offset;
                            end;

                    pl:=rail_head_width*switch_angle;

                    xing_angle:=pl/(rail_head_width-inscale);     // 1" already removed from back

                    jlen:=pl+xing_angle+40;    // length of jig   40 = 20mm offset at toe, 20mm grip at heel.

                    set_p( 15,      20,  33 );   // hole centres  mm
                    set_p( 16, jlen-20,  33 );

                    set_p(  0,     0,   0 );   // outline  mm
                    set_p(  1,     0,  50 );
                    set_p(  2,  jlen,  50 );
                    set_p(  3,  jlen,   0 );

                    p[37]:=p[1];
                    p[38]:=p[2];
                    p[39]:=p[1];
                    p[40]:=p[2];

                    set_p(  4,  p[15].x-h,  p[15].y-h );    // hole corners   mm
                    set_p(  5,  p[15].x-h,  p[15].y+h );
                    set_p(  6,  p[15].x+h,  p[15].y+h );
                    set_p(  7,  p[15].x+h,  p[15].y-h );

                    set_p(  8,  p[16].x-h,  p[16].y-h );
                    set_p(  9,  p[16].x-h,  p[16].y+h );
                    set_p( 10,  p[16].x+h,  p[16].y+h );
                    set_p( 11,  p[16].x+h,  p[16].y-h );

                    set_p( 12,  0,    27 );   // label space
                    set_p( 13, 27.88, 27 );   // match angle on clamp hole
                    set_p( 14, 25,    12 );
                    set_p( 34,  0,    12 );

                      // angle calcs ...

                    set_p( 18, p[2].x-20-pl,  50 );   // 20mm from end of jig is rail tip


                    set_p( 17, p[18].x, p[2].y-rail_head_width );

                    set_p( 76, p[18].x+pl, p[2].y );     // face already filed


                    set_p( 35, p[18].x-xing_angle, p[18].y   );   // 1mm min knife edge
                    set_p( 36, p[35].x,            p[35].y-1 );   // 1mm min knife edge

                    set_p( 19, 0, p[1].y-p[18].x/xing_angle );
                    set_p( 20, 0, p[19].y-rail_head_width );

                    set_p( 77,  p[1].x, p[1].y+split_offset );   // front filing angle
                    set_p( 78, p[35].x, p[35].y+split_offset );  // front filing angle

                    set_p( 79, p[76].x+switch_angle*split_offset, p[76].y+split_offset );   // front filing angle

                    set_p( 80,  p[2].x, p[2].y+split_offset );   // front filing angle

                       // label lines ...

                    set_p( 27, 0, 14.5 );    // trial and error to fit label space
                    set_p( 28, 0, 21.5 );

                       // clamp hole ...

                    set_p( 30,      35,  p[6].y   );
                    set_p( 31,      30, p[34].y-1 );
                    set_p( 32, jlen-35,  p[9].y   );
                    set_p( 33, jlen-30, p[34].y-1 );

                       // base outline ...

                    set_p( 81, p[1].x, p[1].y+split_offset+base_offset );
                    set_p( 82, p[2].x, p[2].y+split_offset+base_offset );

                    if jigs_form.angled_base_checkbox.Checked=True     // 241f
                       then begin
                              set_p( 91 ,   p[0].x,   p[0].y+split_offset+base_offset );
                              set_p( 92 ,   p[3].x,   p[3].y+split_offset+base_offset );
                              set_p( 93 ,  p[31].x,  p[31].y+split_offset+base_offset );
                              set_p( 94 ,  p[33].x,  p[33].y+split_offset+base_offset );

                              set_p( 95 ,   p[0].x,   p[0].y+split_offset );
                              set_p( 96 ,   p[3].x,   p[3].y+split_offset );
                              set_p( 97 ,  p[31].x,  p[31].y+split_offset );
                              set_p( 98 ,  p[33].x,  p[33].y+split_offset );
                            end
                       else begin
                              set_p( 91 ,   p[0].x,   p[0].y );
                              set_p( 92 ,   p[3].x,   p[3].y );
                              set_p( 93 ,  p[31].x,  p[31].y );
                              set_p( 94 ,  p[33].x,  p[33].y );

                              set_p( 95 ,   p[0].x,   p[0].y );
                              set_p( 96 ,   p[3].x,   p[3].y );
                              set_p( 97 ,  p[31].x,  p[31].y );
                              set_p( 98 ,  p[33].x,  p[33].y );
                            end;

                            
                       // link tabs ...     3mm sq x 1.5mm thick

                    set_p( 99, 0, p[91].y+3  );
                    set_p( 21, 0, p[91].y-10 );
                    set_p( 22, 5, p[91].y-10 );
                    set_p( 23, 5, p[91].y+3  );

                    set_p( 100, p[3].x,   p[92].y+3  );
                    set_p( 24,  p[3].x-5, p[92].y+3  );
                    set_p( 25,  p[3].x-5, p[92].y-10 );
                    set_p( 26,  p[3].x,   p[92].y-10 );

                       // top spacing pad ...   243b

                    set_p(101, p[2].x-top_pad_width_mm, p[2].y-rail_head_width*2 );
                    set_p(102, p[2].x,                  p[2].y-rail_head_width*2 );
                    set_p(103, p[3].x,                  p[3].y+0.4 );
                    set_p(104, p[3].x-top_pad_width_mm, p[3].y+0.4 );

                end;
                ////////////////////////////////////////////////////////////////


begin
  RESULT:=False;  // init

  if (jigs_form.north_checkbox.Checked=False) and (jigs_form.south_checkbox.Checked=False) and (jigs_form.knuckle_radio.Checked=False)
     then begin
            show_modal_message('invalid request: north part and/or south part must be selected');
            EXIT;
          end;

  for n:=0 to High(p) do set_p(n,0,0);   // init empty array

  slope_angle:=0; // init

  with jigs_form do begin

    switch_back:=(switch_radio.Checked and back_radio.Checked);

    switch_front:=(switch_radio.Checked) and ( (front_left_radio.Checked) or (front_right_radio.Checked) );

    if switch_front=True
       then left_hand:=front_left_radio.Checked
       else left_hand:=True;                      // default for other jigs

    knuckle_only:=knuckle_radio.Checked;

    xing_jig:=(switch_back=False) and (switch_front=False) and (knuckle_only=False);

    try
      part_thickness:=ABS(StrToFloat(Trim(part_thickness_edit.Text)));
    except
      show_modal_message('Error:'+#13+'the part thickness must be a valid number with no spaces, units or other text');
      EXIT;
    end;

    if part_thickness<minfp
       then begin
              show_modal_message('Error:'+#13+'the part thickness cannot be zero');
              EXIT;
            end;

    try
      bolt_hole:=ABS(StrToFloat(Trim(bolt_hole_edit.Text)));
    except
      show_modal_message('Error:'+#13+'the bolt hole dimension must be a valid number with no spaces, units or other text');
      EXIT;
    end;

    if switch_front=True
       then begin
              try
                slope_angle:=ABS(StrToFloat(Trim(slope_angle_edit.Text)));
              except
                show_modal_message('Error:'+#13+'the front slope angle must be a valid number with no spaces, units or other text');
                EXIT;
              end;
            end;

    if xing_angle_as_control_radio.Checked=True
       then xing_angle:=ABS(k3n)                   // RAM crossing angle
       else begin
              try
                xing_angle:=ABS(StrToFloat(Trim(xing_angle_edit.Text)));
              except
                show_modal_message('Error:'+#13+'unit angles must be a valid number with no spaces or other text'+#13+'do not enter the "1:" ratio part of the unit angle');
                EXIT;
              end;
            end;

    if xing_angle<minfp
       then begin
              show_modal_message('Error:'+#13+'the unit crossing angle cannot be zero');
              EXIT;
            end;

    if (switch_angle_as_control_radio.Checked=True) and (gaunt=False)
       then switch_angle:=ABS(k1n)                 // RAM planing angle (at toe)
       else begin
              if gaunt=True
                 then begin
                        show_modal_message('Error:'+#13+'the control template is a gaunt turnout - which does not have a switch');
                        EXIT;
                      end;

              try
                switch_angle:=ABS(StrToFloat(Trim(switch_angle_edit.Text)));
              except
                show_modal_message('Error:'+#13+'angles must be a valid number with no spaces or other text'+#13+'do not enter the "1:" ratio part of the unit angle');
                EXIT;
              end;
            end;

    if switch_angle<minfp
       then begin
              show_modal_message('Error:'+#13+'the switch toe angle cannot be zero');
              EXIT;
            end;

    try
      z_groove:=ABS(StrToFloat(Trim(groove_depth_edit.Text)));
      rail_head_width:=ABS(StrToFloat(Trim(rail_head_width_edit.Text)));
      rail_fb_foot_width:=ABS(StrToFloat(Trim(rail_fb_foot_width_edit.Text)));
      kn_z_groove:=ABS(StrToFloat(Trim(kn_groove_depth_edit.Text)));
    except
      show_modal_message('Error:'+#13+'rail dimensions in mm must be a valid number with no spaces, units or other text');
      EXIT;
    end;

  end;//with

  v_xing_str:=FormatFloat('0.0#',xing_angle);

  if (xing_jig=True) or (knuckle_only=True)
     then jig_size_str:='1 in '+v_xing_str
     else begin
            str:=' '; // init
            if ABS(switch_angle-24)<minfp then str:=' A';
            if ABS(switch_angle-32)<minfp then str:=' B';
            if ABS(switch_angle-40)<minfp then str:=' C';
            if ABS(switch_angle-48)<minfp then str:=' D';
            if ABS(switch_angle-64)<minfp then str:=' E';
            if ABS(switch_angle-80)<minfp then str:=' F';

            jig_size_str:=str; // 243b

          end;

  if jigs_form.knuckle_radio.Checked=true
     then begin
            if alert(7,'    files  for  track-building  tools',
                       'You are about to create a 3D DXF/STL file for a'
                      +'|| `0knuckle bend gauge - angle '+jig_size_str+'`9'
                      +'|||`0• ALL the settings for 3D track will be ignored.`3',
                        '','','','','cancel','continue',0)=5
               then EXIT;
          end
     else begin

            if jigs_form.xing_radio.Checked=True
               then str:='crossing vee rail - angle '+jig_size_str
               else if jigs_form.back_radio.Checked=True
                       then str:='switch blade back - size'+jig_size_str+' blade'
                       else if jigs_form.front_left_radio.Checked=True
                               then str:='switch blade Left-side front - size'+jig_size_str+' blade'
                               else str:='switch blade Right-side front - size'+jig_size_str+' blade';

            if alert(7,'    files  for  track-building  tools',
                       'You are about to create a 3D DXF/STL file for a'
                      +'||  filing jig for'
                      +'|| `0'+str+'`9'
                      +'|||`0• ALL the settings for 3D track will be ignored.`3',
                        '','','','','cancel','continue',0)=5
               then EXIT;
          end;

  zb:=0;                      // base

  if knuckle_only=True
     then begin
            zt:=3*kn_z_groove;     // 3 arbitrary    overall thickness
            zm:=zt-kn_z_groove;    // below groove
          end
     else begin
            zt:=part_thickness;    // top face
            zm:=zt-z_groove;       // lower part
          end;

  h:=bolt_hole/2;   // half square  bash

  knuckle_rad:=rail_head_width*xing_angle*12/2.75;   // knuckle rad is angle in ft     prototype rail 2.75" wide

  knuckle_len:=knuckle_rad*SIN(ARCTAN(1/xing_angle));
  knuckle_cen:=knuckle_rad*COS(ARCTAN(1/xing_angle));

  jlen:=100; // init  jig length

  if xing_jig=True
     then begin
            if xing_angle<3.9
               then jlen:=75
               else if xing_angle<14.9
                       then jlen:=85;
          end;

  if knuckle_only=True
     then jlen:=30*rail_head_width;   // shank part

  upper_part:=False;  // init

  if switch_back=True        // back switch planing
     then begin

            pl:=rail_head_width*switch_angle;

            xing_angle:=switch_angle*2.75;       // use jig xing_angle for back planing angle (prototype 1" depth in 2.75" rail - down to rail web)

            jlen:=pl+xing_angle+40;    // length of jig   40 = 20mm offset at toe, 20mm grip at heel.

            set_p( 15,      20,  33 );   // hole centres  mm
            set_p( 16, jlen-20,  33 );

            set_p(  0,     0,   0 );   // outline  mm
            set_p(  1,     0,  50 );
            set_p(  2,  jlen,  50 );
            set_p(  3,  jlen,   0 );

            p[37]:=p[1];
            p[38]:=p[2];
            p[39]:=p[1];
            p[40]:=p[2];

            set_p(  4,  p[15].x-h,  p[15].y-h );    // hole corners   mm
            set_p(  5,  p[15].x-h,  p[15].y+h );
            set_p(  6,  p[15].x+h,  p[15].y+h );
            set_p(  7,  p[15].x+h,  p[15].y-h );

            set_p(  8,  p[16].x-h,  p[16].y-h );
            set_p(  9,  p[16].x-h,  p[16].y+h );
            set_p( 10,  p[16].x+h,  p[16].y+h );
            set_p( 11,  p[16].x+h,  p[16].y-h );

            set_p( 12,  0,    25 );   // label space
            set_p( 13, 27.88, 25 );   // match angle on clamp hole
            set_p( 14, 25,    10 );
            set_p( 34,  0,    10 );

              // angle calcs ...

            set_p( 18, p[2].x-20-pl,  50 );   // rail tip 20mm from end of jig

            try
              set_p( 17, p[2].x, p[2].y-rail_head_width+(p[2].x-p[18].x)/xing_angle );
            except
              show_modal_message('Error:'+#13+'unable to calculate the jig dimensions - check the switch angle');
              EXIT;
            end;

            set_p( 35, p[18].x-xing_angle, p[18].y   );   // 1mm min knife edge
            set_p( 36, p[35].x,            p[35].y-1 );   // 1mm min knife edge

            set_p( 19, 0, p[1].y-p[18].x/xing_angle );
            set_p( 20, 0, p[17].y-p[2].x/xing_angle );

               // link tabs ...     3mm sq x 1.5mm thick

            set_p( 21, 0, 0-5 );
            set_p( 22, 5, 0-5 );
            set_p( 23, 5,   0 );

            set_p( 24, p[3].x-5,   0 );
            set_p( 25, p[3].x-5, 0-5 );
            set_p( 26, p[3].x,   0-5 );

               // label lines ...

            set_p( 27, 0, 12.5 );    // trial and error to fit label space
            set_p( 28, 0, 19.5 );

               // clamp hole ...

            set_p( 30,      35,  p[6].y );
            set_p( 31,      30, p[34].y );
            set_p( 32, jlen-35,  p[9].y );
            set_p( 33, jlen-30, p[34].y );


               // top spacing pad ...   243b

            set_p(101, p[2].x-top_pad_width_mm, p[2].y-rail_head_width*2 );
            set_p(102, p[2].x,                  p[2].y-rail_head_width*2 );
            set_p(103, p[3].x,                  p[3].y+0.4 );
            set_p(104, p[3].x-top_pad_width_mm, p[3].y+0.4 );


          end
     else if switch_front=True    // switch front planing
             then begin
                    do_one_half_switch_front(False);    // first half
                  end
             else begin    // crossing ... and knuckle only

                    set_p( 15,      20,  33 );   // hole centres  mm
                    set_p( 16, jlen-15,  33 );

                    set_p(  0,    0,   0 );   // outline  mm
                    set_p(  1,    0,  50 );
                    set_p(  2, jlen,  50 );
                    set_p(  3, jlen,   0 );

                            // not needed ...
                            
                          set_p( 37,  p[1].x,  p[1].y );
                          set_p( 38,  p[2].x,  p[2].y );

                          set_p( 39,  p[1].x,  p[1].y );
                          set_p( 40,  p[2].x,  p[2].y );

                    set_p(  4,  p[15].x-h,  p[15].y-h );    // hole corners   mm
                    set_p(  5,  p[15].x-h,  p[15].y+h );
                    set_p(  6,  p[15].x+h,  p[15].y+h );
                    set_p(  7,  p[15].x+h,  p[15].y-h );

                    set_p(  8,  p[16].x-h,  p[16].y-h );
                    set_p(  9,  p[16].x-h,  p[16].y+h );
                    set_p( 10,  p[16].x+h,  p[16].y+h );
                    set_p( 11,  p[16].x+h,  p[16].y-h );

                    set_p( 12,  0,    25 );   // label space
                    set_p( 13, 27.88, 25 );   // match angle on clamp hole
                    set_p( 14, 25,    10 );
                    set_p( 34,  0,    10 );

                      // angle calcs ...

                    if xing_angle<3.9
                       then set_p( 17, MIN(24*xing_angle,16+13*xing_angle),  50 )
                       else set_p( 17,                             jlen-20,  50 );

                    try
                      set_p( 18, p[17].x-rail_head_width/SIN(ARCTAN(1/xing_angle)),  50 );
                    except
                      show_modal_message('Error:'+#13+'unable to calculate the jig dimensions - check the crossing angle');
                      EXIT;
                    end;

                    set_p( 35, p[18].x-xing_angle, p[18].y   );   // 1mm min knife edge
                    set_p( 36, p[35].x,            p[35].y-1 );   // 1mm min knife edge

                    if knuckle_only=True
                       then begin
                              set_p(19, 0, p[1].y-8*rail_head_width );
                              set_p(20, 0, p[19].y-rail_head_width/COS(ARCTAN(1/xing_angle)) );

                              set_p(71,    0, p[1].y-18*rail_head_width );     // 18 arbitrary
                              set_p(72, jlen,                   p[71].y );

                              set_p(29, jlen, p[72].y-10 );
                              set_p(47,    0, p[29].y );

                              set_p(48, jlen, p[19].y+jlen/xing_angle );
                              set_p(49, jlen, p[20].y+jlen/xing_angle );

                              set_p(73,    0, p[71].y-7 );

                            end
                       else begin
                              set_p( 19, 0, p[1].y-p[18].x/xing_angle );
                              set_p( 20, 0, p[1].y-p[17].x/xing_angle );
                            end;

                       // link tabs ...     3mm sq x 1.5mm thick

                    set_p( 21, 0, 0-5 );
                    set_p( 22, 5, 0-5 );
                    set_p( 23, 5,   0 );

                    set_p( 24, p[3].x-5,   0 );
                    set_p( 25, p[3].x-5, 0-5 );
                    set_p( 26, p[3].x,   0-5 );

                       // label lines ...

                    set_p( 27, 0, 12.5 );    // trial and error to fit label space
                    set_p( 28, 0, 19.5 );

                       // clamp hole ...

                    set_p( 30,      35,  p[6].y );
                    set_p( 31,      30, p[34].y );
                    set_p( 32, jlen-30,  p[9].y );
                    set_p( 33, jlen-25, p[34].y );


                       // knuckle bend guide ...

                    set_p(41,   0-knuckle_len, p[19].y+knuckle_cen );   // knuckle rad centre

                    set_p(42, 0-3*knuckle_len, p[1].y  );                     // 3 arbitrary
                    set_p(43,         p[42].x, p[41].y-knuckle_rad );
                    set_p(44,         p[42].x, p[43].y-rail_head_width );
                    set_p(45,         p[41].x, p[44].y );
                    set_p(46,         p[41].x, p[1].y  );

                    do_knuckle_rad( p[41], knuckle_rad, xing_angle, 50);   // set p 50..70


                  end;

  RESULT:=True;

  if knuckle_only=True
     then begin
            do_half_jig(1);      // north only
            EXIT;
          end;

  if left_hand=False
     then for n:=0 to High(p) do p[n].x:=0-p[n].x;

  if jigs_form.north_checkbox.Checked=True then do_half_jig(1);      // first half

  if switch_front=True
     then begin
            do_one_half_switch_front(True);    // second half - recalculate slopes

            if left_hand=False
               then for n:=0 to High(p) do p[n].x:=0-p[n].x;

            for n:=0 to High(p) do p[n].y:=0-12-p[n].y;       // 12 arbitrary
          end
     else for n:=0 to High(p) do p[n].y:=p[21].y*2-p[n].y;

  for n:=27 to 28 do p[n].y:=p[n].y-3.5;      // shift mirrored labels 3.5mm

  if jigs_form.south_checkbox.Checked=True then do_half_jig(2);      // second half

end;
//______________________________________________________________________________

procedure old_dxf_jigs(var dxf_file:TextFile);

  var
    p:array [0..24] of Tpex;

    z1,z2:extended;

  begin

           // 1:5 filing jig...

    z1:=10;
    z2:=10.8;

    p[0].x:=0;     p[0].y:=0;

    p[1].x:=143;   p[1].y:=0;
    p[2].x:=145;   p[2].y:=28;
    p[3].x:=0;     p[3].y:=28;

    p[4].x:=12;    p[4].y:=17;
    p[5].x:=18;    p[5].y:=17;
    p[6].x:=18;    p[6].y:=11;
    p[7].x:=12;    p[7].y:=11;

    p[8].x:=114;   p[8].y:=17;
    p[9].x:=120;   p[9].y:=17;
    p[10].x:=120;  p[10].y:=11;
    p[11].x:=114;  p[11].y:=11;

    p[12].x:=120;      p[12].y:=28;
    p[13].x:=120-4.69; p[13].y:=28;

    p[14].x:=0;     p[14].y:=4;
    p[15].x:=0;     p[15].y:=4+0.938;

    p[16].x:=18;    p[16].y:=28;
    p[17].x:=114;   p[17].y:=28;
    p[18].x:=114;   p[18].y:=0;
    p[19].x:=18;    p[19].y:=0;

    p[20].x:=143;   p[20].y:=5;   // 5 = 1:5 notch code..
    p[21].x:=145;   p[21].y:=5;

         //  bottom of jig...

    Write(dxf_file,dxf_3dface_pex( p[0],0,  p[7],0,  p[4],0,  p[3],0,  17,0));   // A
    Write(dxf_file,dxf_3dface_pex( p[3],0,  p[4],0,  p[5],0,  p[16],0, 17,0));   // B
    Write(dxf_file,dxf_3dface_pex( p[0],0,  p[19],0, p[6],0,  p[7],0,  17,0));   // C

    Write(dxf_file,dxf_3dface_pex( p[19],0, p[18],0, p[17],0, p[16],0, 17,0));   // D


    Write(dxf_file,dxf_3dface_pex( p[2],0,  p[17],0, p[8],0,  p[9],0,  17,0));   // E
    Write(dxf_file,dxf_3dface_pex( p[20],0, p[21],0, p[2],0,  p[9],0,  17,0));   // F
    Write(dxf_file,dxf_3dface_pex( p[18],0, p[1],0,  p[10],0, p[11],0, 17,0));   // G
    Write(dxf_file,dxf_3dface_pex( p[1],0, p[20],0,  p[9],0,  p[10],0, 17,0));   // H

         //  top of lower section...

    Write(dxf_file,dxf_3dface_pex( p[0],z1,  p[7],z1,  p[4],z1,  p[3],z1,  17,0));   // A
    Write(dxf_file,dxf_3dface_pex( p[3],z1,  p[4],z1,  p[5],z1,  p[16],z1, 17,0));   // B
    Write(dxf_file,dxf_3dface_pex( p[0],z1,  p[19],z1, p[6],z1,  p[7],z1,  17,0));   // C

    Write(dxf_file,dxf_3dface_pex( p[19],z1, p[18],z1, p[17],z1, p[16],z1, 17,0));   // D


    Write(dxf_file,dxf_3dface_pex( p[2],z1,  p[17],z1, p[8],z1,  p[9],z1,  17,0));   // E
    Write(dxf_file,dxf_3dface_pex( p[20],z1, p[21],z1, p[2],z1,  p[9],z1,  17,0));   // F
    Write(dxf_file,dxf_3dface_pex( p[18],z1, p[1],z1,  p[10],z1, p[11],z1, 17,0));   // G
    Write(dxf_file,dxf_3dface_pex( p[1],z1, p[20],z1,  p[9],z1,  p[10],z1, 17,0));   // H

         // sides of lower section...

    Write(dxf_file,dxf_3dface_pex( p[0],z1, p[3],z1,  p[3],0,  p[0],0, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[3],z1, p[2],z1,  p[2],0,  p[3],0, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[2],z1, p[21],z1, p[21],0, p[2],0, 17,0));

    Write(dxf_file,dxf_3dface_pex( p[21],z1, p[20],z1, p[20],0, p[21],0, 17,0));     // notch..
    Write(dxf_file,dxf_3dface_pex( p[20],z1, p[1],z1,  p[1],0,  p[20],0, 17,0));

    Write(dxf_file,dxf_3dface_pex( p[1],z1,  p[0],z1,  p[0],0,  p[1],0,  17,0));

         // inside faces of hole 1...

    Write(dxf_file,dxf_3dface_pex( p[7],z2, p[4],z2, p[4],0, p[7],0, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[4],z2, p[5],z2, p[5],0, p[4],0, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[5],z2, p[6],z2, p[6],0, p[5],0, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[6],z2, p[7],z2, p[7],0, p[6],0, 17,0));

        // inside faces of hole 2...

    Write(dxf_file,dxf_3dface_pex( p[11],z2, p[8],z2,  p[8],0,  p[11],0, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[8],z2,  p[9],z2,  p[9],0,  p[8],0,  17,0));
    Write(dxf_file,dxf_3dface_pex( p[9],z2,  p[10],z2, p[10],0, p[9],0,  17,0));
    Write(dxf_file,dxf_3dface_pex( p[10],z2, p[11],z2, p[11],0, p[10],0, 17,0));

       // left upper section, bottom face...

    Write(dxf_file,dxf_3dface_pex( p[15],z1, p[7],z1,  p[4],z1,  p[3],z1,  17,0));   // A
    Write(dxf_file,dxf_3dface_pex( p[3],z1,  p[4],z1,  p[5],z1,  p[16],z1, 17,0));   // B
    Write(dxf_file,dxf_3dface_pex( p[15],z1, p[13],z1, p[6],z1,  p[7],z1,  17,0));   // C
    Write(dxf_file,dxf_3dface_pex( p[16],z1, p[5],z1,  p[6],z1,  p[13],z1, 17,0));   // D

       // left upper section, top surface...

    Write(dxf_file,dxf_3dface_pex( p[15],z2, p[7],z2,  p[4],z2,  p[3],z2,  17,0));   // A
    Write(dxf_file,dxf_3dface_pex( p[3],z2,  p[4],z2,  p[5],z2,  p[16],z2, 17,0));   // B
    Write(dxf_file,dxf_3dface_pex( p[15],z2, p[13],z2, p[6],z2,  p[7],z2,  17,0));   // C
    Write(dxf_file,dxf_3dface_pex( p[16],z2, p[5],z2,  p[6],z2,  p[13],z2, 17,0));   // D

         // left upper section, sides...

    Write(dxf_file,dxf_3dface_pex( p[15],z1, p[13],z1, p[13],z2, p[15],z2, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[3],z1,  p[13],z1, p[13],z2, p[3],z2,  17,0));
    Write(dxf_file,dxf_3dface_pex( p[15],z1, p[3],z1,  p[3],z2,  p[15],z2, 17,0));



       // right upper section, bottom face...

    Write(dxf_file,dxf_3dface_pex( p[8],z1,  p[9],z1,  p[2],z1,  p[12],z1, 17,0));   // E
    Write(dxf_file,dxf_3dface_pex( p[9],z1,  p[20],z1, p[21],z1, p[2],z1,  17,0));   // F

    Write(dxf_file,dxf_3dface_pex( p[1],z1,  p[20],z1, p[9],z1, p[10],z1,  17,0));   // J

    Write(dxf_file,dxf_3dface_pex( p[11],z1, p[10],z1, p[1],z1,  p[0],z1,  17,0));   // G
    Write(dxf_file,dxf_3dface_pex( p[11],z1, p[8],z1,  p[14],z1, p[0],z1,  17,0));   // H
    Write(dxf_file,dxf_3dface_pex( p[8],z1,  p[12],z1, p[14],z1, p[14],z1, 17,0));   // I

       // right upper section, top surface...

    Write(dxf_file,dxf_3dface_pex( p[8],z2,  p[9],z2,  p[2],z2,  p[12],z2, 17,0));   // E
    Write(dxf_file,dxf_3dface_pex( p[9],z2,  p[20],z2, p[21],z2, p[2],z2,  17,0));   // F

    Write(dxf_file,dxf_3dface_pex( p[1],z2,  p[20],z2, p[9],z2, p[10],z2,  17,0));   // J

    Write(dxf_file,dxf_3dface_pex( p[11],z2, p[10],z2, p[1],z2,  p[0],z2,  17,0));   // G
    Write(dxf_file,dxf_3dface_pex( p[11],z2, p[8],z2,  p[14],z2, p[0],z2,  17,0));   // H
    Write(dxf_file,dxf_3dface_pex( p[8],z2,  p[12],z2, p[14],z2, p[14],z2, 17,0));   // I

         // right upper section, sides...

    Write(dxf_file,dxf_3dface_pex( p[0],z1,  p[1],z1,  p[1],z2,  p[0],z2,  17,0));
    Write(dxf_file,dxf_3dface_pex( p[1],z1,  p[20],z1, p[20],z2, p[1],z2,  17,0));
    Write(dxf_file,dxf_3dface_pex( p[20],z1, p[21],z1, p[21],z2, p[20],z2, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[21],z1, p[2],z1,  p[2],z2,  p[21],z2, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[2],z1,  p[12],z1, p[12],z2, p[2],z2,  17,0));
    Write(dxf_file,dxf_3dface_pex( p[12],z1, p[14],z1, p[14],z2, p[12],z2, 17,0));
    Write(dxf_file,dxf_3dface_pex( p[14],z1, p[0],z1,  p[0],z2,  p[14],z2, 17,0));

end;
//______________________________________________________________________________

procedure dxf_tweezer_tips(var dxf_file:TextFile);    // 236d

type
  T3p=record
         x:extended;
         y:extended;
         z:extended;
       end;

var
  t:array[0..18] of T3p;      // tip section

  s:array[0..40] of T3p;      // shank section

  y1,y2,z1,z2,hh:extended;

  h1,h2:Tpex;  // hole centres

  n:integer;



                               /////////////////////////////////////////////////

                               function dxf_3dface_3p(p1,p2,p3,p4:T3p):string;

                               begin
                                 RESULT:=dxf_3dface(p1.x,p1.y,p1.z, p2.x,p2.y,p2.z, p3.x,p3.y,p3.z, p4.x,p4.y,p4.z, 21,0);
                               end;
                               /////////////////////////////////////////////////


begin

     // tip ...

  y1:=0;
  y2:=0.9;

  t[0].x:=0;
  t[0].z:=0;

  t[1].x:=6.0;
  t[1].z:=6.0;

  t[2].x:=6.0;
  t[2].z:=10.0;

  t[3].x:=t[2].x-0.3;
  t[3].z:=t[2].z;

  t[4].x:=t[3].x;
  t[4].z:=t[3].z-0.4;

  t[5].x:=t[4].x-0.65;
  t[5].z:=t[4].z;

  t[6].x:=t[5].x-0.1;
  t[6].z:=t[5].z+0.4;

  t[7].x:=4.65;
  t[7].z:=t[2].z;

  t[8].x:=0;
  t[8].z:=6.0;

  for n:=0 to 8 do begin
    t[n].y:=y1;

    t[n+10].x:=t[n].x;
    t[n+10].y:=y2;
    t[n+10].z:=t[n].z;
  end;//next

      // near face of tip ...

  Write(dxf_file,dxf_3dface_3p(t[0],t[1],t[5],t[8]));    // A
  Write(dxf_file,dxf_3dface_3p(t[8],t[5],t[6],t[7]));    // B
  Write(dxf_file,dxf_3dface_3p(t[1],t[4],t[5],t[5]));    // C
  Write(dxf_file,dxf_3dface_3p(t[1],t[2],t[3],t[4]));    // D

      // far face of tip ...

  Write(dxf_file,dxf_3dface_3p(t[10],t[11],t[15],t[18]));    // A
  Write(dxf_file,dxf_3dface_3p(t[18],t[15],t[16],t[17]));    // B
  Write(dxf_file,dxf_3dface_3p(t[11],t[14],t[15],t[15]));    // C
  Write(dxf_file,dxf_3dface_3p(t[11],t[12],t[13],t[14]));    // D

      // sides of tip ...

  Write(dxf_file,dxf_3dface_3p(t[10],t[11],t[1],t[0]));    // AA
  Write(dxf_file,dxf_3dface_3p(t[11],t[12],t[2],t[1]));    // DD1
  Write(dxf_file,dxf_3dface_3p(t[12],t[13],t[3],t[2]));    // DD2
  Write(dxf_file,dxf_3dface_3p(t[13],t[14],t[4],t[3]));    // DD3
  Write(dxf_file,dxf_3dface_3p(t[14],t[15],t[5],t[4]));    // CC
  Write(dxf_file,dxf_3dface_3p(t[15],t[16],t[6],t[5]));    // BB1
  Write(dxf_file,dxf_3dface_3p(t[16],t[17],t[7],t[6]));    // BB2
  Write(dxf_file,dxf_3dface_3p(t[17],t[18],t[8],t[7]));    // BB3

  Write(dxf_file,dxf_3dface_3p(t[18],t[10],t[0],t[8]));    // AS  shank

     // end of tip

     // shank ...

  h2.x:=0-10.0;   // hole centres ..
  h2.y:=6.5;

  h1.x:=h2.x-7.16;
  h1.y:=h2.y+3.58;

  hh:=1.1;  // half-hole size   hole 2.2mm sq.


  z1:=0;
  z2:=6.0;

  s[0].x:=0;
  s[0].y:=0;

  s[1].x:=0-6.0;
  s[1].y:=0;

  s[2].x:=0-22.0;
  s[2].y:=8.0;

  s[3].x:=s[2].x+3.58;
  s[3].y:=s[2].y+7.16;

  s[4].x:=0-6.0;
  s[4].y:=8.94;

  s[5].x:=0;
  s[5].y:=0.9;

        // hole corners ...

  s[20].x:=h1.x+hh;
  s[20].y:=h1.y+hh;

  s[21].x:=h1.x+hh;
  s[21].y:=h1.y-hh;

  s[22].x:=h1.x-hh;
  s[22].y:=h1.y-hh;

  s[23].x:=h1.x-hh;
  s[23].y:=h1.y+hh;



  s[24].x:=h2.x+hh;
  s[24].y:=h2.y+hh;

  s[25].x:=h2.x+hh;
  s[25].y:=h2.y-hh;

  s[26].x:=h2.x-hh;
  s[26].y:=h2.y-hh;

  s[27].x:=h2.x-hh;
  s[27].y:=h2.y+hh;

  for n:=0 to 5 do begin      // outlines
    s[n].z:=z1;

    s[n+10].x:=s[n].x;
    s[n+10].y:=s[n].y;
    s[n+10].z:=z2;
  end;//next

  for n:=20 to 27 do begin      // sq holes
    s[n].z:=z1;

    s[n+10].x:=s[n].x;
    s[n+10].y:=s[n].y;
    s[n+10].z:=z2;
  end;//next

      // faces of shank ...

  Write(dxf_file,dxf_3dface_3p(s[10],s[11],s[1],s[0]));    // E1
  Write(dxf_file,dxf_3dface_3p(s[11],s[12],s[2],s[1]));    // F1
  Write(dxf_file,dxf_3dface_3p(s[12],s[13],s[3],s[2]));    // F2
  Write(dxf_file,dxf_3dface_3p(s[13],s[14],s[4],s[3]));    // F3
  Write(dxf_file,dxf_3dface_3p(s[14],s[15],s[5],s[4]));    // E2
  Write(dxf_file,dxf_3dface_3p(s[15],s[10],s[0],s[5]));    // ET   tip

      // near side of shank wth sq holes ...

  Write(dxf_file,dxf_3dface_3p(s[0],s[5],s[4],s[1]));    // E

  Write(dxf_file,dxf_3dface_3p(s[1], s[4], s[24], s[25]));   // FA
  Write(dxf_file,dxf_3dface_3p(s[2], s[26],s[25], s[1]));    // FB
  Write(dxf_file,dxf_3dface_3p(s[2], s[22],s[21], s[26]));   // FC
  Write(dxf_file,dxf_3dface_3p(s[3], s[23],s[22], s[2]));    // FD
  Write(dxf_file,dxf_3dface_3p(s[4], s[20],s[23], s[3]));    // FE
  Write(dxf_file,dxf_3dface_3p(s[4], s[24],s[27], s[20]));   // FF
  Write(dxf_file,dxf_3dface_3p(s[20],s[27],s[26], s[21]));   // FG

      // far side of shank wth sq holes ...

  Write(dxf_file,dxf_3dface_3p(s[10],s[15],s[14],s[11]));    // E

  Write(dxf_file,dxf_3dface_3p(s[11], s[14], s[34], s[35]));   // FA
  Write(dxf_file,dxf_3dface_3p(s[12], s[36], s[35], s[11]));   // FB
  Write(dxf_file,dxf_3dface_3p(s[12], s[32], s[31], s[36]));   // FC
  Write(dxf_file,dxf_3dface_3p(s[13], s[33], s[32], s[12]));   // FD
  Write(dxf_file,dxf_3dface_3p(s[14], s[30], s[33], s[13]));   // FE
  Write(dxf_file,dxf_3dface_3p(s[14], s[34], s[37], s[30]));   // FF
  Write(dxf_file,dxf_3dface_3p(s[30], s[37], s[36], s[31]));   // FG

     // sides of holes ...

  Write(dxf_file,dxf_3dface_3p(s[20], s[30], s[31], s[21]));
  Write(dxf_file,dxf_3dface_3p(s[21], s[31], s[32], s[22]));
  Write(dxf_file,dxf_3dface_3p(s[22], s[32], s[33], s[23]));
  Write(dxf_file,dxf_3dface_3p(s[23], s[33], s[30], s[20]));

  Write(dxf_file,dxf_3dface_3p(s[24], s[34], s[35], s[25]));
  Write(dxf_file,dxf_3dface_3p(s[25], s[35], s[36], s[26]));
  Write(dxf_file,dxf_3dface_3p(s[26], s[36], s[37], s[27]));
  Write(dxf_file,dxf_3dface_3p(s[27], s[37], s[34], s[24]));

end;
//______________________________________________________________________________


procedure Tjigs_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=928;
  ClientHeight:=514;

  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Tjigs_form.xing_angle_editMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  xing_angle_entered_radio.Checked:=True;
end;
//______________________________________________________________________________

procedure Tjigs_form.switch_angle_editMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  switch_angle_entered_radio.Checked:=True;
end;
//______________________________________________________________________________

procedure Tjigs_form.xing_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  // also knuckle bend MouseDown

begin
  xing_panel.Visible:=True;
  switch_panel.Visible:=False;
end;
//______________________________________________________________________________

procedure Tjigs_form.switch_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  xing_panel.Visible:=False;
  switch_panel.Visible:=True;
end;
//______________________________________________________________________________

procedure Tjigs_form.front_left_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  front_panel.Visible:=True;
end;
//______________________________________________________________________________

procedure Tjigs_form.front_right_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  front_panel.Visible:=True;
end;
//______________________________________________________________________________

procedure Tjigs_form.back_radioMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

begin
  front_panel.Visible:=False;
end;
//______________________________________________________________________________

procedure Tjigs_form.set_top_pad_buttonClick(Sender: TObject);

const
  str:string='please refer to Templot Club user forum';

var
  n:integer;
  od:Toutdim;

begin
     putdim(str,1,'switch  jig  -  top  spacing  pad  thickness',top_pad_thick_mm,True,True,True,False); // no negative, no preset, no zero, don't terminate on zero.
  n:=putdim(str,1,'switch  jig  -  top  spacing  pad  width',    top_pad_width_mm,True,True,True,False); // no negative, no preset, no zero, don't terminate on zero.

  if n<>1 then EXIT;

  if getdims('switch  jig  -  top  spacing  pad . . .','',jigs_form,n,od)=True
     then begin
            top_pad_thick_mm:=od[0];
            top_pad_width_mm:=od[1];
          end;
end;
//______________________________________________________________________________

end.
