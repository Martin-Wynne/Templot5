
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

unit map_loader_unit;     // 215a  load map from web as tiles directly into picture shapes

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Clipbrd;

// OT2024  HTTPSend;

type

  { Tmap_loader_form }

  Tmap_loader_form = class(TForm)
    datestamp_label: TLabel;
    location_groupbox: TGroupBox;
    os_grid_radio_button: TRadioButton;
    lat_lon_radio_button: TRadioButton;
    os_easting_edit: TEdit;
    os_northing_edit: TEdit;
    os_letters_edit: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lon_edit: TEdit;
    lat_edit: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    load_tiles_button: TButton;
    Label19: TLabel;
    extend_area_groupbox: TGroupBox;
    add_top_button: TButton;
    add_left_button: TButton;
    add_right_button: TButton;
    add_bottom_button: TButton;
    Shape2: TShape;
    crop_area_groupbox: TGroupBox;
    Shape3: TShape;
    crop_top_button: TButton;
    crop_left_button: TButton;
    crop_right_button: TButton;
    crop_bottom_button: TButton;
    background_shapes_button: TButton;
    delete_button: TButton;
    Label20: TLabel;
    Label21: TLabel;
    name_edit: TEdit;
    name_listbox: TListBox;
    list_label: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    info_label: TLabel;
    url_radio_button: TRadioButton;
    url_edit: TEdit;
    Label25: TLabel;
    stop_button: TButton;
    current_map_label: TLabel;
    close_panel: TPanel;
    close_button: TButton;
    pause_button: TButton;
    t_55_label: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    osm_radio_button: TRadioButton;
    tf_radio_button: TRadioButton;
    tf_style_groupbox: TGroupBox;
    tfm_radio: TRadioButton;
    tfp_radio: TRadioButton;
    tfo_radio: TRadioButton;
    Label23: TLabel;
    nls_county_radio_button: TRadioButton;
    nls_natgrid50_radio_button: TRadioButton;
    county_combo: TComboBox;
    next_county_combo: TComboBox;
    load_new_label1: TLabel;
    Label17: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    zoom_to_map_button: TButton;
    nls_london_radio_button: TRadioButton;
    clarity_button: TButton;
    Shape4: TShape;
    Label18: TLabel;
    os_coverage_button: TButton;
    nls_coverage_button: TButton;
    nls_natgrid25_radio_button: TRadioButton;
    tiles_button: TButton;
    nls_town125_radio_button: TRadioButton;
    nls_town60_radio_button: TRadioButton;
    Label10: TLabel;
    Label15: TLabel;
    remove_borders_checkbox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Label6Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label14MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure location_groupboxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lon_editEnter(Sender: TObject);
    procedure os_letters_editEnter(Sender: TObject);
// OT2024    procedure load_tiles_buttonClick(Sender: TObject);
    procedure background_shapes_buttonClick(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label24MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure delete_buttonClick(Sender: TObject);
    procedure add_top_buttonClick(Sender: TObject);
    procedure name_editChange(Sender: TObject);
    procedure name_listboxClick(Sender: TObject);
    procedure add_bottom_buttonClick(Sender: TObject);
    procedure add_left_buttonClick(Sender: TObject);
    procedure add_right_buttonClick(Sender: TObject);
    procedure osm_radio_buttonClick(Sender: TObject);
    procedure nls_london_radio_buttonClick(Sender: TObject);
    procedure nls_6inch_radio_buttonClick(Sender: TObject);
    procedure url_editEnter(Sender: TObject);
    procedure stop_buttonClick(Sender: TObject);
    procedure close_buttonClick(Sender: TObject);
    procedure pause_buttonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure crop_top_buttonClick(Sender: TObject);
    procedure crop_right_buttonClick(Sender: TObject);
    procedure crop_bottom_buttonClick(Sender: TObject);
    procedure crop_left_buttonClick(Sender: TObject);
    procedure url_editClick(Sender: TObject);
    procedure name_editClick(Sender: TObject);
    procedure lon_editClick(Sender: TObject);
    procedure lat_editClick(Sender: TObject);
    procedure os_letters_editClick(Sender: TObject);
    procedure os_easting_editClick(Sender: TObject);
    procedure os_northing_editClick(Sender: TObject);
    procedure info_labelMouseMove(Sender: TObject; Shift:TShiftState; X,Y:Integer);
    procedure tf_radio_buttonClick(Sender: TObject);
    procedure info_labelClick(Sender: TObject);
    procedure zoom_to_map_buttonClick(Sender: TObject);
    procedure nls_county_radio_buttonClick(Sender: TObject);
    procedure nls_natgrid50_radio_buttonClick(Sender: TObject);
// OT2024    procedure clarity_buttonClick(Sender: TObject);
    procedure os_coverage_buttonClick(Sender: TObject);
    procedure nls_coverage_buttonClick(Sender: TObject);
    procedure nls_natgrid25_radio_buttonClick(Sender: TObject);
    procedure tiles_buttonClick(Sender: TObject);
    procedure nls_town60_radio_buttonClick(Sender: TObject);
    procedure nls_town125_radio_buttonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  map_loader_form: Tmap_loader_form;

  map_src_code:integer=0;

             // 0=NLS historic 25-inch (tiled)      1=NLS 50-inch (tiled)       2=Thunderforest(tiled)     3=OpenStreetMap(tiled)     4=NLS 60-inch (tiled)

             // 5=NLS modern 25-inch(tiled)         6=NLS town plans 60-inch    7=NLS town plans 125-inch              //no longer used 8=URL(screenshot)

  procedure map_loader_form_update;

  function format_his_name:string;

// OT2024  function parse_url(str:string; var zoom_level:integer; var lat_lon:Tlat_lon):boolean;

  function check_browser_zoom:boolean;


implementation

{$R *.lfm}

uses
  Math, control_room, bgnd_unit, pad_unit, grid_unit, math_unit, entry_sheet, alert_unit, help_sheet, gauge_unit;
// OT2024  map_clarity_unit;


var
  xtile_min,ytile_min,xtile_max,ytile_max:integer;

  xtile_min_p1,ytile_min_p1,xtile_max_p1,ytile_max_p1:Tpex;
  xtile_min_p2,ytile_min_p2,xtile_max_p2,ytile_max_p2:Tpex;

  location_code:integer=0;     // 0=long/lat 1=OS Grid  2=from URL

  map_tile_count_x:integer=0;
  map_tile_count_y:integer=0;

  map_tile_size_mm:extended=0;

  map_num_tiles_x:integer=0;
  map_num_tiles_y:integer=0;

  map_org_x:extended=0;
  map_org_y:extended=0;

  map_name_str:string='';

  tile_name_str:string='';    // 'map::'(1-5) + user name (padded with trailing spaces to 15 chars, 6-20) + map_src_code(21) + 'T'or'S'(tiled/screenshot)(22) + zoom_level(padded with trailing spaces to 2, 23-24) + separator'#'(25) + xtile_str(padded with trailing spaces to 10, 26-35) + separator'#'(36) + ytile_str(padded to 10, 37-46).
                              // total 46 characters. string index as above.

  getting_tile:boolean=False;  // global lock

  abort_map:boolean=False;

  map_loading_in_progress:boolean=False;
  stop_loading:boolean=False;
  pause_loading:boolean=False;

  base_width:extended=4000;   // arbitrary init ...
  base_height:extended=2000;

  map_exists:boolean=False;    // 227a

  manual_tile_url_str:string='';  // 229d

  nls_legal_done:boolean=False;  // 233d

  function get_tile_extents(map_str:string):boolean;forward;

//______________________________________________________________________________

procedure Tmap_loader_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=956;
  ClientHeight:=752;

  AutoScroll:=True;

end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label3Click(Sender: TObject);

begin
  Label3.Font.color:=clBlue;
  go_to_url('https://www.thunderforest.com/');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label4Click(Sender: TObject);

begin
  Label4.Font.color:=clBlue;
  go_to_url('https://www.thunderforest.com/maps/transport-dark/');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label5Click(Sender: TObject);

begin
  Label5.Font.color:=clBlue;
  go_to_url('https://openstreetmap.org');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label6Click(Sender: TObject);

begin
  Label6.Font.color:=clBlue;
  go_to_url('https://openstreetmap.org/about');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label14Click(Sender: TObject);

begin
  Label14.Font.color:=clBlue;
  go_to_url('https://maps.nls.uk/geo/explore/#zoom=15&lat=51.9996&lon=-0.9989&layers=10');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label24Click(Sender: TObject);

begin
  Label24.Font.color:=clBlue;
  go_to_url('https://maps.nls.uk/');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label25Click(Sender: TObject);

begin
  go_to_url('https://maps.nls.uk/os/6inch-2nd-and-later/index.html');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.location_groupboxMouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label14.Font.color:=clBlue;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label3MouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label3.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label4MouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label4.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label5MouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label5.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label6MouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label6.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label14MouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label14.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.Label24MouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label24.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.FormMouseMove(Sender:TObject; Shift:TShiftState; X,Y:Integer);

begin
  Label3.Font.color:=clBlue;
  Label4.Font.color:=clBlue;
  Label5.Font.color:=clBlue;
  Label6.Font.color:=clBlue;
  Label14.Font.color:=clBlue;

  Label24.Font.color:=clBlue;

  info_label.Font.color:=clBlue;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.lon_editEnter(Sender: TObject);     // also lat edit Enter , lat_lon radio click

begin
  location_code:=0;  // 0=long/lat,  1=OS Grid,  2=URL

  lat_lon_radio_button.Checked:=True;

  lon_edit.Font.Color:=clBlue;
  lat_edit.Font.Color:=clBlue;

  url_edit.Font.Color:=clGray;

  os_letters_edit.Font.Color:=clGray;
  os_easting_edit.Font.Color:=clGray;
  os_northing_edit.Font.Color:=clGray;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.os_letters_editEnter(Sender: TObject);

begin
  location_code:=1;  // 0=long/lat,  1=OS Grid,  2=URL

  os_grid_radio_button.Checked:=True;

  lon_edit.Font.Color:=clGray;
  lat_edit.Font.Color:=clGray;

  url_edit.Font.Color:=clGray;

  os_letters_edit.Font.Color:=clBlue;
  os_easting_edit.Font.Color:=clBlue;
  os_northing_edit.Font.Color:=clBlue;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.url_editEnter(Sender: TObject);

begin
  location_code:=2;  // 0=long/lat,  1=OS Grid,  2=URL

  url_radio_button.Checked:=True;

  lon_edit.Font.Color:=clGray;
  lat_edit.Font.Color:=clGray;

  os_letters_edit.Font.Color:=clGray;
  os_easting_edit.Font.Color:=clGray;
  os_northing_edit.Font.Color:=clGray;

  url_edit.Font.Color:=clBlue;
end;
//______________________________________________________________________________

function format_his_name:string;

var
  n:integer;
  name_str:string;

begin
  RESULT:='';  // init

  name_str:=Copy(Trim(map_loader_form.name_edit.Text)+'                    ',1,15);  // pad with spaces to 15 characters

     // check and remove any UTF or control chars in his name ..

  for n:=1 to Length(name_str) do begin
    if (Ord(name_str[n])<32) or (Ord(name_str[n])>127) or (name_str[n]='#') then name_str[n]:='_';    // # is our separator
  end;//next

  RESULT:=name_str;
end;
//______________________________________________________________________________

procedure got_tile;

var
  new_shape:Tbgnd_shape;
  n:integer;

  load_picture:TPicture;

begin

  new_shape:=init_bgnd_shape;  // 234b

  with new_shape do begin

       // defaults ...

    shape_name:=tile_name_str;    // global

    shape_code:=-1;   // -1=picture
    shape_style:=0;   // not used

    wrap_offset:=0;
    show_transparent:=False;        // map_loader_form.transparent_checkbox.Checked;  // map_transparent;
    picture_is_metafile:=False;

    hide_bits:=0;       // normal visibility
    option_bits:=$80;   // msb=1  tile

    p1.x:=map_org_x+map_tile_count_x*map_tile_size_mm;
    p1.y:=map_org_y+(map_num_tiles_y-map_tile_count_y-1)*map_tile_size_mm;

    p2.x:=p1.x+map_tile_size_mm;    // square ..
    p2.y:=p1.y+map_tile_size_mm;

    rect_rot:=0;  // 234b

  end;//with

  with bgnd_form.bgnd_shapes_listbox do begin

    n:=Items.AddObject(new_shape.shape_name,Tbgshape.Create);  // create and insert a new entry in the shapes list.

    Tbgshape(Items.Objects[n]).bgnd_shape:=new_shape;          // put data in list.

    ItemIndex:=n;                                              // make it current.

    with Tbgshape(Items.Objects[n]) do begin

      bgimage:=Tbgimage.Create;     // create new image  3-2-01.

      with bgimage.image_shape do begin

        image_bitmap:=TBitmap.Create;
        rotated_bitmap:=TBitmap.Create;

(* // OT2024

        image_metafile:=TMetafile.Create;    // 213b
        rotated_metafile:=TMetafile.Create;  // 213b
*)
        rotated_picture:=TPicture.Create;

        load_picture:=TPicture.Create; //0.93.a

        try
          case map_src_code of
            0,1,4,5,6,7: load_picture.LoadFromFile(exe_str+'internal\tile\nls_tile.png');        // NLS PNG
                      2: load_picture.LoadFromFile(exe_str+'internal\tile\tfp_tile.png');        // Thunderforest PNG
                      3: load_picture.LoadFromFile(exe_str+'internal\tile\osm_tile.png');        // OpenStreetMap PNG
                    else load_picture.LoadFromFile(exe_str+'internal\empty_picture.bmp');        // ??? invalid map_src_code for tiled maps
          end;//case

          image_bitmap.Assign(load_picture.Graphic);

          image_bitmap.PixelFormat:=pf24bit;  // for deeper zooming  (was probably 32 bit)

          image_width:=image_bitmap.Width;
          image_height:=image_bitmap.Height;

        finally
          load_picture.Free;
        end;//try
      end;//with
    end;//with

    copy_draw_to_pad; // remove any previous highlighting

    ItemIndex:=n;
    draw_bg_shapes(pad_form.Canvas,ItemIndex,clRed);   // show new bitmap and highlight in red, directly on the pad.
  end;//with

  shapes_saved:=False;      // need a resave.
  shapes_current_state;

  do_rollback:=False;       // no need to put this change in rollback register on redraw.
  redraw(True);
end;
//______________________________________________________________________________

function obtain_tile_from_server(zoom_str,xtile_str,ytile_str:string):boolean;


var
  map_str,get_map_str:string;
  http_count:integer;

  http_result:Boolean;
// OT2024  http_sender:THTTPSend;
  file_str:string;

  no_tile_str:string;

  county_str:string;

  str,z_str:string;

  map_server_list:TStringList;

              //////////////////////////////////////////////////////////////////

              function get_a_tile(co_str:string):boolean;

              var
                short_co_str:string;
                map_list_index:integer;

              begin
                RESULT:=False;    // init

                (* // OT2024

                   // 0=NLS historic 25-inch (tiled)      1=NLS 50-inch (tiled)       2=Thunderforest(tiled)     3=OpenStreetMap(tiled)     4=NLS 60-inch (tiled)

                   // 5=NLS modern 25-inch(tiled)         6=NLS town plans 60-inch    7=NLS town plans 125-inch              //no longer used 8=URL(screenshot)

                if map_src_code=0   // NLS 25-inch
                   then begin
                          DeleteFile(exe_str+'internal\tile\nls_tile.png');  // if it already exists
                          file_str:=exe_str+'internal\tile\nls_tile.png';    // save file to

                          short_co_str:=StringReplace(co_str,'shire','',[]);

                          with map_server_list do begin

                            Clear;

                            if manual_tile_url_str<>'' then Add(manual_tile_url_str);   // try this one first

                            if co_str<>'Scotland'   // search England & Wales first...
                               then begin

                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata2/os/25_inch/'+short_co_str);

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata3/os/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+short_co_str);


                                      co_str:=LowerCase(co_str);                  // and again all lower case...
                                      short_co_str:=LowerCase(short_co_str);

                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata2/os/25_inch/'+short_co_str);

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata3/os/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+short_co_str);


                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/wales');

                                      Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/Shrop_Derby');


                                      Add('http://geo.nls.uk/mapdata3/os/25_inch_holes_england');   // 229d    Manchester

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/holes_england');
                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/holes_england');

                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/scotland_1');
                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/scotland_2');

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/scotland_1');
                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/scotland_2');

                                      Add('http://geo.nls.uk/mapdata3/os/scotland_1250_country');
                                      Add('http://geo.nls.uk/mapdata2/os/scotland_1250_country');

                                      Add('http://geo.nls.uk/mapdata3/os/scotland_1250_2500_1969');
                                      Add('http://geo.nls.uk/mapdata2/os/scotland_1250_2500_1969');

                                    end
                               else begin     // search Sctotland first...

                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/scotland_1');
                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/scotland_2');

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/scotland_1');
                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/scotland_2');

                                      Add('http://geo.nls.uk/mapdata3/os/scotland_1250_country');
                                      Add('http://geo.nls.uk/mapdata2/os/scotland_1250_country');

                                      Add('http://geo.nls.uk/mapdata3/os/scotland_1250_2500_1969');
                                      Add('http://geo.nls.uk/mapdata2/os/scotland_1250_2500_1969');

                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata2/os/25_inch/'+short_co_str);

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata3/os/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+short_co_str);


                                      co_str:=LowerCase(co_str);                  // and again all lower case...
                                      short_co_str:=LowerCase(short_co_str);

                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata2/os/25_inch/'+short_co_str);

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://geo.nls.uk/mapdata3/os/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/'+short_co_str);

                                      Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+co_str);
                                      if short_co_str<>co_str then Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/'+short_co_str);


                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/wales');

                                      Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/Shrop_Derby');

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch_holes_england');   // 229d    Manchester

                                      Add('http://geo.nls.uk/mapdata3/os/25_inch/holes_england');
                                      Add('http://geo.nls.uk/mapdata2/os/25_inch/holes_england');

                                    end;

                            Add('http://geo.nls.uk/mapdata3/os/25_inch/gloucester');
                            Add('http://geo.nls.uk/mapdata3/os/25_inch/gloucester_1st');
                            Add('http://geo.nls.uk/mapdata3/os/25_inch/gloucester_2nd');
                            Add('http://geo.nls.uk/mapdata3/os/25_inch/gloucester_3rd');
                            Add('http://geo.nls.uk/mapdata3/os/25_inch/gloucester_additions');

                            Add('http://geo.nls.uk/mapdata2/os/25_inch/gloucester');
                            Add('http://geo.nls.uk/mapdata2/os/25_inch/gloucester_1st');
                            Add('http://geo.nls.uk/mapdata2/os/25_inch/gloucester_2nd');
                            Add('http://geo.nls.uk/mapdata2/os/25_inch/gloucester_3rd');
                            Add('http://geo.nls.uk/mapdata2/os/25_inch/gloucester_additions');

                            Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/gloucester');
                            Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/gloucester_1st');
                            Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/gloucester_2nd');
                            Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/gloucester_3rd');
                            Add('http://mapseries-tilesets.s3.amazonaws.com/25_inch/gloucester_additions');

                            Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/gloucester');
                            Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/gloucester_1st');
                            Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/gloucester_2nd');
                            Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/gloucester_3rd');
                            Add('http://mapseries-tilesets.s2.amazonaws.com/25_inch/gloucester_additions');

                          end;//with

                        end;//code 0

                if map_src_code=1    // NLS 50-inch
                   then begin
                          DeleteFile(exe_str+'internal\tile\nls_tile.png');  // if it already exists
                          file_str:=exe_str+'internal\tile\nls_tile.png';    // save file to

                          with map_server_list do begin

                            Clear;

                            if manual_tile_url_str<>'' then Add(manual_tile_url_str);   // try this one first

                            Add('http://mapseries-tilesets.s3.amazonaws.com/london_1940s');

                            Add('http://mapseries-tilesets.s3.amazonaws.com/edinburgh_1250');

                            Add('http://mapseries-tilesets.s3.amazonaws.com/os/scotland_1250_country');

                          end;//with

                        end;//code 1

                if map_src_code=5    // NLS modern 25-inch
                   then begin
                          DeleteFile(exe_str+'internal\tile\nls_tile.png');  // if it already exists
                          file_str:=exe_str+'internal\tile\nls_tile.png';    // save file to

                          with map_server_list do begin

                            Clear;

                            if manual_tile_url_str<>'' then Add(manual_tile_url_str);   // try this one first

                            Add('http://mapseries-tilesets.s3.amazonaws.com/scotland_2500_doubles');

                            Add('http://geo.nls.uk/mapdata2/os/2500_1970');

                          end;//with

                        end;//code 5


                   // 0=NLS historic 25-inch (tiled)      1=NLS 50-inch (tiled)       2=Thunderforest(tiled)     3=OpenStreetMap(tiled)     4=NLS 60-inch (tiled)

                   // 5=NLS modern 25-inch(tiled)         6=NLS town plans 60-inch    7=NLS town plans 125-inch              //no longer used 8=URL(screenshot)

                if (map_src_code=6) or (map_src_code=7)   // NLS town plans 60-inch   or 125-inch
                   then begin
                          DeleteFile(exe_str+'internal\tile\nls_tile.png');  // if it already exists
                          file_str:=exe_str+'internal\tile\nls_tile.png';    // save file to

                          with map_server_list do begin

                            Clear;

                            if manual_tile_url_str<>'' then Add(manual_tile_url_str);   // try this one first

                            Add('http://geo.nls.uk/mapdata3/os/town_england/North');

                            Add('http://geo.nls.uk/mapdata3/os/town_england/Midlands_East');

                            Add('http://geo.nls.uk/mapdata3/os/town_england/Midlands_West');

                            Add('http://geo.nls.uk/mapdata3/os/town_england/South');

                            Add('http://geo.nls.uk/mapdata3/os/town_england/Wales');

                                // more needed...

                            Add('http://geo.nls.uk/mapdata3/os/town_england/Bolton');
                            Add('http://geo.nls.uk/mapdata3/os/town_england/Swindon');

                          end;//with

                        end;//code 6 or 7


                if map_src_code=2     // Thunderforest
                   then begin
                          DeleteFile(exe_str+'internal\tile\tfp_tile.png');                                                   // if it already exists
                          file_str:=exe_str+'internal\tile\tfp_tile.png';          // save file to
                          if map_loader_form.tfp_radio.Checked=True
                             then map_str:='http://tile.thunderforest.com/pioneer/'+zoom_str+'/'+xtile_str+'/'+ytile_str+'.png?apikey=8511e4ab37b84c44bd55d19c08df49e5'
                             else if map_loader_form.tfo_radio.Checked=True
                                     then map_str:='http://tile.thunderforest.com/outdoors/'+zoom_str+'/'+xtile_str+'/'+ytile_str+'.png?apikey=8511e4ab37b84c44bd55d19c08df49e5'
                                     else map_str:='http://tile.thunderforest.com/transport-dark/'+zoom_str+'/'+xtile_str+'/'+ytile_str+'.png?apikey=8511e4ab37b84c44bd55d19c08df49e5';   // where from
                        end;

                if map_src_code=3    // OpenStreetMap
                   then begin
                          DeleteFile(exe_str+'internal\tile\osm_tile.png');                                             // if it already exists
                          file_str:=exe_str+'internal\tile\osm_tile.png';    // save file to

                            // OSM transport map uses Thundeforest version...

                          map_str:='http://tile.thunderforest.com/transport/'+zoom_str+'/'+xtile_str+'/'+ytile_str+'.png?apikey=8511e4ab37b84c44bd55d19c08df49e5';
                        end;

                if map_src_code=4    // NLS 60-inch London
                   then begin
                          DeleteFile(exe_str+'internal\tile\nls_tile.png');                                             // if it already exists
                          file_str:=exe_str+'internal\tile\nls_tile.png';    // save file to

                          map_str:='http://mapseries-tilesets.s3.amazonaws.com/london_1890s/'+zoom_str+'/'+xtile_str+'/'+ytile_str+'.png';
                        end;

                if (map_src_code=0) or (map_src_code=1) or (map_src_code=5) or (map_src_code=6) or (map_src_code=7)
                   then begin
                          with map_server_list do begin
                            for map_list_index:=0 to (Count-1) do begin

                              get_map_str:=Strings[map_list_index]+'/'+zoom_str+'/'+xtile_str+'/'+ytile_str+'.png';

                              http_sender:=THTTPSend.Create;

                              http_result:=http_sender.HTTPMethod('GET',get_map_str);

                              if (http_sender.ResultCode>=100) and (http_sender.ResultCode<=299)
                                 then begin
                                        http_sender.Document.SaveToFile(file_str);

                                        got_tile;              // put in background shapes

                                        getting_tile:=False;   // ready for another one    global

                                        RESULT:=True;
                                        abort_map:=False;      // more tiles ok
                                        http_sender.Free;

                                        BREAK;
                                      end
                                 else begin
                                        http_sender.Free;

                                        Sleep(5);

                                        CONTINUE;

                                      end;

                            end;//next server
                          end;//with
                        end

                   else begin   // other codes    2, 3, 4

                          http_sender:=THTTPSend.Create;

                          http_result:=http_sender.HTTPMethod('GET',map_str);

                          if (http_sender.ResultCode>=100) and (http_sender.ResultCode<=299)
                             then begin
                                    http_sender.Document.SaveToFile(file_str);

                                    got_tile;              // put in background shapes

                                    getting_tile:=False;   // ready for another one    global

                                    RESULT:=True;
                                    abort_map:=False;      // more tiles ok
                                  end;

                          http_sender.Free;
                        end;

*) // OT2024

              end;
              //////////////////////////////////////////////////////////////////

              procedure get_county_tile_loc;

              begin
                county_str:=StringReplace(county_str,'Gloucestershire early','gloucester',[]);
                county_str:=StringReplace(county_str,'Devon early','devon',[]);
                county_str:=StringReplace(county_str,'Somerset early','somerset1',[]);
                county_str:=StringReplace(county_str,'Wiltshire early','wiltshire',[]);

                county_str:=StringReplace(county_str,'Gloucestershire later','gloucester2nd',[]);
                county_str:=StringReplace(county_str,'Devon later','devon2nd',[]);
                county_str:=StringReplace(county_str,'Somerset later','somerset',[]);
                county_str:=StringReplace(county_str,'Wiltshire later','wiltshire2nd',[]);

                county_str:=StringReplace(county_str,'Gloucestershire 1920s','gloucester_3rd',[]);

              end;
              //////////////////////////////////////////////////////////////////


begin
  RESULT:=False;    // init
  abort_map:=True;  // init fail

  if map_src_code>7 then EXIT;   // ??? not a tiled map

  bgnd_form.picture_borders_checkbox.Checked:=True;     // 233d  show tile borders while loading

  Sleep(5);  // don't call server more than once every 5ms.

  http_count:=0;  // init reset

  repeat
    if getting_tile=False
      then BREAK
      else Sleep(100);   // wait for previous tile to finish    1/10th second

    INC(http_count);
    if http_count>120    // 12 seconds
       then begin
              ShowMessage('Sorry, unable to obtain the map tile. The server is taking too long to respond.'+#13+#13+'Please check your internet connection.');
              EXIT;
            end;

  until 0<>0;

  getting_tile:=True;        // global lock

     // create shape name = map name (padded with spaces to 20 chars) + map_src_code(1) + spare(1) + zoom_level(padded to 2) + separator(#) + xtile_str(padded to 10) + separator(#) + ytile_str(padded to 10).

  tile_name_str:=map_name_str+Copy(IntToStr(map_src_code),1,1)+'T'+Copy(zoom_str+'  ',1,2)+'#'+Copy(xtile_str+'          ',1,10)+'#'+Copy(ytile_str+'          ',1,10);

  map_str:='';      // init
  get_map_str:='';

  map_server_list:=TStringList.Create;

  if map_src_code=0   // NLS 25-inch
     then begin
            with map_loader_form.county_combo do begin
              if ItemIndex<0
                 then county_str:='Scotland'  // default if not selected
                 else begin
                        county_str:=Trim(Items.Strings[ItemIndex]);
                        get_county_tile_loc;
                      end;
            end;//with

            if get_a_tile(county_str)=False      // try again in next county
               then begin
                      with map_loader_form.next_county_combo do begin
                        if ItemIndex<0
                           then county_str:='Scotland'  // default if not selected
                           else begin
                                  county_str:=Trim(Items.Strings[ItemIndex]);
                                  get_county_tile_loc;
                                end;
                      end;//with

                      RESULT:=get_a_tile(county_str);
                    end
               else RESULT:=True;

          end
     else RESULT:=get_a_tile('');     // ignore county for other map codes

  if RESULT=False
     then begin
            no_tile_str:='Sorry, unable to obtain the map tiles.';

            if map_src_code=0  // 25-inch
               then no_tile_str:=no_tile_str+#13+#13+'You may have set a location for 25-inch County Series maps which does not match the selected county.';

            no_tile_str:=no_tile_str+#13+#13+'You may have set a location outside the area covered by the selected map series.';

            no_tile_str:=no_tile_str+#13+#13+'You may have set a location or not yet supported in Templot.';

            no_tile_str:=no_tile_str+#13+#13+'Otherwise please check your internet connection, or try again later.';

            no_tile_str:=no_tile_str+#13+#13+'If you continue to have difficulty, please post a message on the Templot Club forum quoting the map location.';

            show_modal_message(no_tile_str);

            getting_tile:=False;  // reset global lock
          end;

  map_server_list.Free;

end;
//______________________________________________________________________________

procedure zoom_to_map;

var
  n:integer;

  shape_str:string;

  wl_factor:extended;
  margin_factor:extended;

begin
  map_name_str:='map::'+format_his_name;    // global

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count<1 then EXIT;   // no shapes ???

    for n:=0 to Count-1 do begin

      if Pos(map_name_str,Strings[n])=1
         then begin
                shape_str:=Strings[n];

                if shape_str[22]='T'    // tiles
                   then begin
                           if get_tile_extents(map_name_str)=False
                              then begin
                                     ShowMessage('error - Sorry, unable to identify all map tiles.');
                                     EXIT;
                                   end;

                           if screeny<minfp then EXIT;         // ??
                           wl_factor:=screenx/screeny;

                           margin_factor:=1.10;         // arbitrary 10% extra for margins.

                           screenx:=(xtile_max_p2.x-xtile_min_p1.x)*margin_factor;

                               // ytile_min at top!!!

                           if screenx<((ytile_min_p2.y-ytile_max_p1.y)*margin_factor*wl_factor) then screenx:=(ytile_min_p2.y-ytile_max_p1.y)*margin_factor*wl_factor;

                           if screenx<screenx_min then screenx:=screenx_min; // minimum for screen width (max zoom in).
                           if screenx>screenx_max then screenx:=screenx_max; // maximum zoom out.

                             // centralize on pad..

                          zoom_offsetx:=xtile_min_p1.x-(screenx-(xtile_max_p2.x-xtile_min_p1.x))/2;
                          if wl_factor>minfp then zoom_offsety:=ytile_max_p1.y-(screenx/wl_factor-(ytile_min_p2.y-ytile_max_p1.y))/2;

                          pad_form.lock_scaling_menu_entry.Click;       // lock pad zoom.

                          BREAK;
                        end;
              end;
    end;//next
  end;//with

  redraw(True);
end;
//______________________________________________________________________________
(* // OT2024

function parse_url(str:string; var zoom_level:integer; var lat_lon:Tlat_lon):boolean;

      // get zoom and latitude from URL ...
var
  n:integer;
  zoom_str,lat_str,lon_str:string;

begin
  RESULT:=False;  // init

  if (Pos('maps.nls.uk',str)=0)
  and (Pos('openstreetmap.org',str)=0)
  and (Pos('google.co.uk/maps',str)=0)
  and (Pos('google.com/maps',str)=0)
  and (Pos('ordnancesurvey.co.uk',str)=0)

     then begin
            ShowMessage('error - Invalid URL.'+#13+#13+'Only NLS, OpenStreetMap, Google, OrdnanceSurvey map pages are supported.');
            EXIT;
          end;

  if Pos('maps.nls.uk',str)<>0
     then begin

            n:=Pos('#zoom=',str);
            Delete(str,1,n+5);

            n:=Pos('&lat=',str);
            zoom_str:=Copy(str,1,n-1);

            Delete(str,1,n+4);

            n:=Pos('&lon=',str);
            lat_str:=Copy(str,1,n-1);

            Delete(str,1,n+4);

            n:=Pos('&',str);
            lon_str:=Copy(str,1,n-1);

            n:=Pos('&marker=',str);    // modify lat/lon if marker present

            if n>0
               then begin
                      Delete(str,1,n+7);

                      n:=Pos(',',str);
                      lat_str:=Copy(str,1,n-1);

                      Delete(str,1,n);
                      lon_str:=str;
                    end;

            try
              zoom_level:=Round(StrToFloat(Trim(zoom_str)));
              lat_lon.lat:=StrToFloat(Trim(lat_str));
              lat_lon.lon:=StrToFloat(Trim(lon_str));
            except
              ShowMessage('error - Unable to read NLS URL.'+#13+#13+'Copy it from your browser address bar when displaying a map at the required location.');
              EXIT;
            end;//try

          end;

  if Pos('openstreetmap.org',str)<>0
     then begin
            n:=Pos('#map=',str);
            Delete(str,1,n+4);

            n:=Pos('/',str);
            zoom_str:=Copy(str,1,n-1);

            Delete(str,1,n);

            n:=Pos('/',str);
            lat_str:=Copy(str,1,n-1);

            Delete(str,1,n);

            lon_str:=str;

            try
              zoom_level:=Round(StrToFloat(Trim(zoom_str)));
              lat_lon.lat:=StrToFloat(Trim(lat_str));
              lat_lon.lon:=StrToFloat(Trim(lon_str));
            except
              ShowMessage('error - Unable to read OpenStreetMap URL.'+#13+#13+'Copy it from your browser address bar when displaying a map at the required location.');
              EXIT;
            end;//try

          end;

  if Pos('google.co',str)<>0
     then begin
            n:=Pos('/maps/@',str);
            Delete(str,1,n+6);

            n:=Pos(',',str);
            lat_str:=Copy(str,1,n-1);

            Delete(str,1,n);

            n:=Pos(',',str);
            lon_str:=Copy(str,1,n-1);

            Delete(str,1,n);

            n:=Pos('z',str);
            zoom_str:=Copy(str,1,n-1);

            try
              zoom_level:=Round(StrToFloat(Trim(zoom_str)));
              lat_lon.lat:=StrToFloat(Trim(lat_str));
              lat_lon.lon:=StrToFloat(Trim(lon_str));
            except
              ShowMessage('error - Unable to read Google URL.'+#13+#13+'Copy it from your browser address bar when displaying a map at the required location.');
              EXIT;
            end;//try

          end;

  if Pos('osmaps.ordnancesurvey.co.uk',str)<>0
     then begin
            n:=Pos('.co.uk/',str);
            Delete(str,1,n+6);

            n:=Pos(',',str);
            lat_str:=Copy(str,1,n-1);

            Delete(str,1,n);

            n:=Pos(',',str);
            lon_str:=Copy(str,1,n-1);

            Delete(str,1,n);

            zoom_str:=Copy(str,1,2);

            try
              zoom_level:=Round(StrToFloat(Trim(zoom_str)));
              lat_lon.lat:=StrToFloat(Trim(lat_str));
              lat_lon.lon:=StrToFloat(Trim(lon_str));
            except
              ShowMessage('error - Unable to read Ordnance Survey URL.'+#13+#13+'Copy it from your browser address bar when displaying a map at the required location.');
              EXIT;
            end;//try

          end;

  RESULT:=True;
end;
//______________________________________________________________________________


procedure map_buttons_click(tiled:boolean);

const
  size_help_str:string='Enter the required size of the map on the trackpad.'
                    +'||Do not start with too large a size, otherwise you may end up waiting for hundreds of tiles to load.'
                    +'||The map area can be easily increased later by adding additional rows and columns of tiles.|| ';

label
  123;

var
  os_grid_org:Tos_grid;

  lat_lon_org:Tlat_lon;

  grid_str:string;

  xtile_str,ytile_str,zoom_str:string;

  xtile_org,ytile_org:extended;

  numtilesx,numtilesy:extended;

  numx,numy:integer;

  zoom_level:integer;

  dummy_zoom:integer;

  lat_radians:extended;

  xscaling,yscaling:extended;

  mapx,mapy:integer;

  i,n:integer;
  od:Toutdim;

  new_shape:Tbgnd_shape;

  lat_long_entry:boolean;

  bgnd_shapes_text_str,name_str:string;

  easting_str,northing_str:string;

  east,north:integer;

  load_picture:TPicture;

  wl_factor,max_long,min_long,max_wide,min_wide,margin_factor:extended;

  web_str:string;

  url_str:string;

  seconds:integer;

begin
  new_shape:=init_bgnd_shape;  // 234b

  with map_loader_form do begin
    if (gauge_i=t_T55_i) and (scale=5.5) and (g=25.4)
       then begin
              if alert(7,'    using  T-55  gauge',
                 'You are currently using the fictional T-55 start-up gauge and scale.'
                +'||Have you forgotten to set your model scale ?'
                +'||Your intended model scale must first be set in order for maps to be scaled (sized) correctly.'
                +'||<SPAN STYLE="COLOR:RED;">• DO NOT</SPAN> change the model scale after adding maps - they will <SPAN STYLE="COLOR:RED;">NOT</SPAN> be re-sized to match.',
                 '','','','continue  using  T-55','cancel','',0)=5
                 then EXIT;
            end
       else t_55_label.Hide;

    pause_button.Caption:='pause';  // reset if stopped after pause.

    if map_loading_in_progress=True then EXIT;

    if nls_county_radio_button.Checked=True
         then map_src_code:=0

    else if nls_natgrid25_radio_button.Checked=True
         then map_src_code:=5

    else if nls_town60_radio_button.Checked=True
         then map_src_code:=6

    else if nls_town125_radio_button.Checked=True
         then map_src_code:=7

    else if nls_natgrid50_radio_button.Checked=True
         then map_src_code:=1

    else if tf_radio_button.Checked=True
         then map_src_code:=2

    else if osm_radio_button.Checked=True
         then map_src_code:=3

    else if nls_london_radio_button.Checked=True
         then map_src_code:=4

    else begin
           ShowMessage('Please select a map to load.');
           EXIT;
         end;


    if (nls_legal_done=False) and (map_src_code<>2) and (map_src_code<>3)    // 233d
       then begin
              repeat
                i:=alert(2,'    National  Library  of  Scotland',
                           '`0National Library of Scotland  -  Copyright`9'
                          +'||The National Library of Scotland make their historic maps available under a Creative Commons licence'
                          +' and provided always that they are clearly marked "©&nbsp;<i>Reproduced with the permission of the National Library of Scotland</i>" in any re-use or public display.'
                          +'||If you make any public or commercial use of these maps please ensure that you are complying with the terms of the licence.',
                           '','','','read  licence  information  on  NLS  web  site  > > >  ','cancel  -  do  not  load  NLS  maps','I  understand  and  agree',0);

                if i=4 then go_to_url('https://maps.nls.uk/copyright.html');

                if i=5 then EXIT;

              until i<>4;

              nls_legal_done:=True;
            end;

    bgnd_shapes_text_str:=bgnd_form.bgnd_shapes_listbox.Items.Text;

    name_str:=format_his_name;

    if Trim(name_str)=''
       then begin
              ShowMessage('Please enter a name for the map, of up to 15 characters.');
              EXIT;
            end;

    map_name_str:='map::'+name_str;    // global

    if Pos(map_name_str,bgnd_shapes_text_str)<>0     // ??? should not get here
       then begin
              ShowMessage('Error - there is already one or more background shapes with the name: "'+map_name_str+'"'
                 +#13+#13+'Please enter a different name. Simply adding a suffix should be sufficient, for example: '+name_str+'-A'
                 +#13+#13+'(Providing the new name does not exceed 15 characters.)');
              EXIT;
            end;

    grid_str:='';   //init

    case location_code of

         0: begin      // long/lat
              try
                lat_lon_org.lon:=StrToFloat(lon_edit.Text);
                lat_lon_org.lat:=StrToFloat(lat_edit.Text);
              except
                ShowMessage('Error - longitude or latitude is not valid.');
                EXIT;
              end;//try

              if (ABS(lat_lon_org.lon)>180) or (ABS(lat_lon_org.lat)>85)
                 then begin
                        ShowMessage('Error - longitude or latitude is outside the valid range.');
                        EXIT;
                      end;
            end;

         1: begin      // entered OS Grid ...

              easting_str:=Trim(os_easting_edit.Text);
              northing_str:=Trim(os_northing_edit.Text);

              if (Length(easting_str)=6) and (Length(northing_str)=6)      // 6-digits, no letters needed
                  then begin
                         try
                           east:=StrToInt(easting_str);
                           north:=StrToInt(northing_str);
                         except
                           ShowMessage('Invalid OS Grid reference.'+#13+#13+'Grid numbers must contain valid digits 0-9 only.');
                           got_osgrid:=False;
                           EXIT;
                         end;//try

                            // modify by -100, 25 metres, arbitrary for better result...

                         os_grid_org.easting:=east-100;
                         os_grid_org.northing:=north+25;

                         got_osgrid:=True;
                       end
                  else begin      // letters and up to 5 digits ..

                         os_grid_org:=parse_os_grid(0-100,25,Trim(os_letters_edit.Text),easting_str,northing_str);    // in web_browser_unit

                         if got_osgrid=False then EXIT;  // invalid grid letters
                       end;

              lat_lon_org:=os_grid_to_lat_lon(os_grid_org.easting,os_grid_org.northing);
            end;


         2: begin                                           //  get from URL
              url_str:=LowerCase(Trim(url_edit.Text));

              if parse_url(url_str,dummy_zoom,lat_lon_org)=False then EXIT;           // zoom ignored in URL, get location only
            end;

       else begin                                       // ???
              ShowMessage('error finding location');
              EXIT;
            end;

    end;//case

         // get model space...

    map_org_x:=0;   // init  ...
    map_org_y:=0;

             // 0=NLS historic 25-inch (tiled)      1=NLS 50-inch (tiled)       2=Thunderforest(tiled)     3=OpenStreetMap(tiled)     4=NLS 60-inch (tiled)

             // 5=NLS modern 25-inch(tiled)         6=NLS town plans 60-inch    7=NLS town plans 125-inch              //no longer used 8=URL(screenshot)

    case map_src_code of   // init ...

      0,5: begin
             base_width:=1000*scale;
             base_height:=500*scale;
           end;

    1,2,3: begin
             base_width:=500*scale;
             base_height:=250*scale;
           end;

      4,6: begin
             base_width:=250*scale;
             base_height:=125*scale;
           end;

      else begin                             // 7
             base_width:=125*scale;
             base_height:=62.5*scale;
           end;

    end;//case

    123:

    putdim('Enter the required position for the bottom-left corner of the map on the trackpad.',1,'map  corner  X  position  ( from  left )',map_org_x,False,True,False,False);     // negative ok, no preset, zero ok, don't terminate on zero.
    putdim('Enter the required position for the bottom-left corner of the map on the trackpad.',1,'map  corner  Y  position  ( from  bottom )',map_org_y,False,True,False,False);   // negative ok, no preset, zero ok, don't terminate on zero.

    putdim(size_help_str,1,'width  of  mapped  area',base_width,True,True,True,False);     // no negative, no preset, no zero, don't terminate on zero.
 n:=putdim(size_help_str,1,'height  of  mapped  area',base_height,True,True,True,False);   // no negative, no preset, no zero, don't terminate on zero.

    if n<>3 then EXIT;

    if getdims('map  size  and  position','',pad_form,n,od)=True
       then begin
              map_org_x:=od[0];   // global
              map_org_y:=od[1];   // global

              base_width:=ABS(od[2]);
              base_height:=ABS(od[3]);
            end
       else EXIT;  // cancelled

            //end;

    zoom_level:=18;  // default

    case map_src_code of                     // trial and error ...

                // tiled ...

          0: zoom_level:=18;   // NLS historic 25-inch
          1: zoom_level:=19;   // NLS-50-inch
          2: zoom_level:=19;   // Thunderforest
          3: zoom_level:=19;   // OSM
          4: zoom_level:=20;   // NLS 60-inch
          5: zoom_level:=18;   // NLS modern 25-inch
          6: zoom_level:=20;   // NLS towns 60-inch   233d..
          7: zoom_level:=21;   // NLS towns 125-inch

        else zoom_level:=18;   // ???
    end;//case

    zoom_str:=IntToStr(zoom_level);

    xscaling:=Power(2,zoom_level);
    yscaling:=Power(2,zoom_level-1);

        // org tile ...

    lat_radians:=lat_lon_org.lat*Pi/180;
    xtile_org:=xscaling*((lat_lon_org.lon+180)/360);                             // in tile units (floats) ..
    ytile_org:=yscaling*(1-(LN(TAN(lat_radians)+(1/COS(lat_radians)) )/Pi));

    map_tile_size_mm:=ABS(156543033.928*COS(lat_lon_org.lat*Pi/180)*256*scale/304.8/Power(2,zoom_level));  //resolution = 156543.033928 metres/pixel * cos(latitude) / (2 ^ zoomlevel)
                                                                                                           // 156543.03392804096153584694438047
    numtilesx:=base_width/map_tile_size_mm;  // floats
    numtilesy:=base_height/map_tile_size_mm;

    map_num_tiles_x:=do_truncx(numtilesx)+1;     // globals  +1 to ensure coverage
    map_num_tiles_y:=do_truncx(numtilesy)+1;

    numx:=map_num_tiles_x;  // locals for loop
    numy:=map_num_tiles_y;

    if (numx*numy)>200
       then begin
              Screen.Cursor:=crDefault;
              show_modal_message('Map too large. Your map area would require '+IntToStr(numx*numy)+' image tiles.'
                                 +#13+#13+'Having more than 200 tiles may take too long to load and may overload the tile server if loaded in one go.'
                                 +#13+#13+'Please try again by setting a smaller map area. It can be extended later by adding extra rows and columns of tiles.');
              goto 123;
            end;


    if (numx*numy)>50
       then begin
              Screen.Cursor:=crDefault;
              show_modal_message('Large map area. Your map area would require '+IntToStr(numx*numy)+' image tiles.'
                                +#13+#13+'Having more than 50 tiles may take a long time to load.'
                                +#13+#13+'You may want to cancel this and set a smaller map area. It can be extended later by adding extra rows and columns of tiles.');
            end;

    seconds:=Ceil(numx*numy/4);

    if alert(7,'    ready  to  load  map',
               'You are about to load '+IntToStr(numx*numy)+' map image tiles.'
              +'||The map can be extended later if needed by adding extra rows and columns of tiles.'
              +'||If the map is satisfactory you can save your background shapes so that you don''t need to load the map from the server again in future, or remember the settings.',
               '','','','','cancel','continue  -  load  map',0)=5

       then EXIT;

       // first zoom pad to map area ...

    if screeny<minfp then EXIT;         // ??
    wl_factor:=screenx/screeny;

    max_long:=map_org_x+base_width;
    min_long:=map_org_x;

    max_wide:=map_org_y+base_height;
    min_wide:=map_org_y;

    margin_factor:=1.10;               // arbitrary 10% extra for margins

    screenx:=(max_long-min_long)*margin_factor;

    if screenx<((max_wide-min_wide)*margin_factor*wl_factor) then screenx:=(max_wide-min_wide)*margin_factor*wl_factor;

    if screenx<screenx_min then screenx:=screenx_min; // minimum for screen width (max zoom in).
    if screenx>screenx_max then screenx:=screenx_max; // maximum zoom out.

               // centralize on pad..

    zoom_offsetx:=min_long-(screenx-(max_long-min_long))/2;
    if wl_factor>minfp then zoom_offsety:=min_wide-(screenx/wl_factor-(max_wide-min_wide))/2;

    pad_form.lock_scaling_menu_entry.Click;  // lock pad zoom.
    redraw(False);


       // adjust from centre to NW corner origin for tiles ..

    xtile_org:=xtile_org-numtilesx/2;
    ytile_org:=ytile_org-numtilesy/2;

    map_loading_in_progress:=True;
    stop_loading:=False;
    pause_loading:=False;

    load_tiles_button.Hide;

    pause_button.Show;
    stop_button.Show;

    Screen.Cursor:=crAppStart;

    try

      for mapy:=0 to numy-1 do begin     // tile row

        map_tile_count_y:=mapy;   // global

        for mapx:=0 to numx-1 do begin   // tile column


          map_tile_count_x:=mapx;   // global

          xtile_str:=IntToStr(do_truncx(xtile_org+mapx));
          ytile_str:=IntToStr(do_truncx(ytile_org+mapy));

          if obtain_tile_from_server(zoom_str,xtile_str,ytile_str)=False
             then EXIT;

          if abort_map=True    // from internet_fail
             then begin
                    abort_map:=False;  // for next time
                    EXIT;
                  end;

          redraw(False);   // show map loading

          if stop_loading=True then EXIT;

          repeat
            Application.ProcessMessages;
          until (pause_loading=False) or (stop_loading=True);

        end;//next column
      end;// next row

         // add the copyright label ...

      with new_shape do begin

           // defaults ...

        shape_name:=map_name_str+' copyright notice';

        shape_code:=-1;   // -1=picture
        shape_style:=0;   // not used

        wrap_offset:=0;
        show_transparent:=False;
        picture_is_metafile:=False;

        hide_bits:=0;       // normal visibility
        option_bits:=0;     // byte;

        rect_rot:=0;  // 234b
      end;//with

      with bgnd_form.bgnd_shapes_listbox do begin

        n:=Items.AddObject(new_shape.shape_name,Tbgshape.Create);  // create and insert a new entry in the shapes list.

        Tbgshape(Items.Objects[n]).bgnd_shape:=new_shape;          // put data in list.

        ItemIndex:=n;                                              // make it current.

        with Tbgshape(Items.Objects[n]) do begin

          bgimage:=Tbgimage.Create;

          with bgimage.image_shape do begin

            image_bitmap:=TBitmap.Create;
            rotated_bitmap:=TBitmap.Create;

            image_metafile:=TMetafile.Create;    // 213b
            rotated_metafile:=TMetafile.Create;  // 213b

            rotated_picture:=TPicture.Create;

            load_picture:=TPicture.Create; //0.93.a

            try
              case map_src_code of
                0,1,4,5,6,7: load_picture.LoadFromFile(exe_str+'internal\tile\nls_copyright.png');        // NLS PNG
                          2: load_picture.LoadFromFile(exe_str+'internal\tile\tfp_copyright.png');        // Thunderforest PNG
                          3: load_picture.LoadFromFile(exe_str+'internal\tile\osm_copyright.png');        // OpenStreetMap PNG
                        else load_picture.LoadFromFile(exe_str+'internal\empty_picture.bmp');        // ??? invalid map_src_code for tiled maps
              end;//case

              image_bitmap.Assign(load_picture.Graphic);

              image_bitmap.PixelFormat:=pf24bit;

              image_width:=image_bitmap.Width;
              image_height:=image_bitmap.Height;

              bgnd_shape.p1.x:=map_org_x+base_width-map_tile_size_mm;
              bgnd_shape.p1.y:=map_org_y;

              bgnd_shape.p2.x:=map_org_x+base_width;
              bgnd_shape.p2.y:=bgnd_shape.p1.y+map_tile_size_mm*image_height/image_width;


            finally
              load_picture.Free;
            end;//try

          end;//with image shape
        end;//with object
      end;//with listbox

         // add the map label ...

      with new_shape do begin
        shape_name:=map_name_str;

        hide_bits:=0;     // 214a  normal visibility
        option_bits:=0;   // byte;
        shape_code:=3;    // 3=label
        shape_style:=0;   // 0=transparent/empty

        wrap_offset:=0;                   // default (used only for image wrapping)
        show_transparent:=False;          // default (used only for images)
        picture_is_metafile:=False;       // default (used only for images) //213b

        p1.x:=map_org_x;                  // top left
        p1.y:=map_org_y+base_height;

        p2.x:=0;
        p2.y:=0;

        rect_rot:=0;  // 234b
      end;//with

      with bgnd_form.bgnd_shapes_listbox do begin
        with Items do begin
          n:=AddObject(new_shape.shape_name,Tbgshape.Create);  // create and insert a new line in the shapes list.

          Tbgshape(Objects[n]).bgimage:=nil;
          Tbgshape(Objects[n]).bgnd_shape:=new_shape;          // put data in list.
        end;//with
      end;//with

         // add the map rectangle ...

      with new_shape do begin
        shape_name:=map_name_str+' rectangle';

        hide_bits:=0;     // 214a  normal visibility
        option_bits:=0;   // byte;
        shape_code:=1;    // 1=rectangle
        shape_style:=0;   // 0=transparent/empty

        wrap_offset:=0;                   // default (used only for image wrapping)
        show_transparent:=False;          // default (used only for images)
        picture_is_metafile:=False;       // default (used only for images) //213b

        p1.x:=map_org_x;
        p1.y:=map_org_y;

        p2.x:=p1.x+base_width;
        p2.y:=p1.y+base_height;

        rect_rot:=0;  // 234b
      end;//with

      with bgnd_form.bgnd_shapes_listbox do begin
        with Items do begin
          n:=AddObject(new_shape.shape_name,Tbgshape.Create);  // create and insert a new line in the shapes list.

          Tbgshape(Objects[n]).bgimage:=nil;
          Tbgshape(Objects[n]).bgnd_shape:=new_shape;          // put data in list.

          ItemIndex:=n;                                        // make it current.
        end;//with
      end;//with

      shapes_saved:=False;   // need a fresh save.

    finally

      bgnd_form.picture_borders_checkbox.Checked:= NOT map_loader_form.remove_borders_checkbox.Checked;  // 233d  remove tile borders if not wanted

      shapes_current_state;  // update the form.

      redraw(False);

      if bgnd_form.bgnd_shapes_listbox.Items.Count>0
         then pad_form.fit_shapes_menu_entry.Click;

      Screen.Cursor:=crDefault;

      map_loading_in_progress:=False;

      stop_button.Hide;
      pause_button.Hide;

      map_loader_form_update;

      map_loader_form.Show;
      map_loader_form.BringToFront;

    end;//try
  end;//with form  
end;
//______________________________________________________________________________

procedure Tmap_loader_form.load_tiles_buttonClick(Sender: TObject);

begin
  map_buttons_click(True);
end;
//______________________________________________________________________________
*)

procedure Tmap_loader_form.background_shapes_buttonClick(Sender: TObject);

begin
  do_bgnd(False);  // False = show new shape tab
end;
//______________________________________________________________________________

procedure map_loader_form_update;

var
  bgnd_shapes_text_str,shape_name_str,shape_str:string;

  found_str,list_str:string;
  n:integer;

  server:integer;

begin

  if NOT ( (gauge_i=t_T55_i) and (scale=5.5) and (g=25.4) )
     then map_loader_form.t_55_label.Hide;

  map_loader_form.stop_button.Hide;
  map_loader_form.pause_button.Hide;

    // see if map already exists ...

  bgnd_shapes_text_str:=bgnd_form.bgnd_shapes_listbox.Items.Text;

  shape_name_str:='map::'+format_his_name;

  if Pos(shape_name_str,bgnd_shapes_text_str)<>0      // map exists
     then begin
            map_exists:=True;

            map_loader_form.load_tiles_button.Hide;
            map_loader_form.load_new_label1.Visible:=True;   // 227a

            map_loader_form.delete_button.Enabled:=True;
            map_loader_form.zoom_to_map_button.Enabled:=True;
            map_loader_form.clarity_button.Enabled:=True;

                // update current map ...

            with bgnd_form.bgnd_shapes_listbox.Items do begin
              for n:=0 to Count-1 do begin

              if Pos(shape_name_str,Strings[n])=1
                 then begin

                        shape_str:=Strings[n];

                        with map_loader_form do begin

                          current_map_label.Caption:='';  // init

                          if Length(shape_str)<>46 then CONTINUE;      // not a map tile  (label, copyright, rectangle, screenshot)

                          server:=StrToInt(shape_str[21]);

                          case server of
                             0: current_map_label.Caption:=nls_county_radio_button.Caption;
                             1: current_map_label.Caption:=nls_natgrid50_radio_button.Caption;
                             2: current_map_label.Caption:=tf_radio_button.Caption;
                             3: current_map_label.Caption:=osm_radio_button.Caption;
                             4: current_map_label.Caption:=nls_london_radio_button.Caption;
                             5: current_map_label.Caption:=nls_natgrid25_radio_button.Caption;
                             6: current_map_label.Caption:=nls_town60_radio_button.Caption;
                             7: current_map_label.Caption:=nls_town125_radio_button.Caption;
                          end;//case

                          extend_area_groupbox.Visible:=True;
                          crop_area_groupbox.Visible:=True;

                        end;//with

                        BREAK;
                      end;
              end;//next
            end;//with

          end
     else begin

            map_loader_form.current_map_label.Caption:='';

            map_loader_form.county_combo.Enabled:=map_loader_form.nls_county_radio_button.Checked;
            map_loader_form.next_county_combo.Enabled:=map_loader_form.nls_county_radio_button.Checked;

            map_loader_form.tfm_radio.Enabled:=map_loader_form.tf_radio_button.Checked;
            map_loader_form.tfp_radio.Enabled:=map_loader_form.tf_radio_button.Checked;
            map_loader_form.tfo_radio.Enabled:=map_loader_form.tf_radio_button.Checked;

            if (map_loader_form.nls_county_radio_button.Checked=True)
            or (map_loader_form.nls_natgrid25_radio_button.Checked=True)
            or (map_loader_form.nls_natgrid50_radio_button.Checked=True)
            or (map_loader_form.nls_town60_radio_button.Checked=True)
            or (map_loader_form.nls_town125_radio_button.Checked=True)
            or (map_loader_form.nls_london_radio_button.Checked=True)
            or (map_loader_form.osm_radio_button.Checked=True)
            or (map_loader_form.tf_radio_button.Checked=True)

               then map_loader_form.load_tiles_button.Show;

            map_loader_form.load_new_label1.Visible:=False; // 227a

            map_loader_form.delete_button.Enabled:=False;

            map_loader_form.zoom_to_map_button.Enabled:=False;

            map_loader_form.clarity_button.Enabled:=False;

            map_loader_form.extend_area_groupbox.Visible:=False;
            map_loader_form.crop_area_groupbox.Visible:=False;

          end;

  with map_loader_form do begin
    Label3.Font.color:=clBlue;
    Label4.Font.color:=clBlue;
    Label5.Font.color:=clBlue;
    Label6.Font.color:=clBlue;
    Label14.Font.color:=clBlue;

    Label24.Font.color:=clBlue;

    info_label.Font.color:=clBlue;
  end;//with

       // fill list with existing maps ...

  map_loader_form.name_listbox.Items.Clear;

  try
    with bgnd_form.bgnd_shapes_listbox.Items do begin
      if Count<1 then EXIT;   // no shapes ???

      for n:=0 to Count-1 do begin

        if Pos('map::',Strings[n])=1
           then begin
                  found_str:=Strings[n];
                  list_str:=Trim(Copy(found_str,6,15));

                  if map_loader_form.name_listbox.Items.IndexOf(list_str)=-1
                     then map_loader_form.name_listbox.Items.Add(list_str);
                end;
      end;//next
    end;//with

  finally
    map_loader_form.name_listbox.Visible:=(map_loader_form.name_listbox.Items.Count>0);
    map_loader_form.list_label.Visible:=map_loader_form.name_listbox.Visible;

  end;//try
end;
//______________________________________________________________________________

procedure Tmap_loader_form.name_editChange(Sender: TObject);

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.delete_buttonClick(Sender: TObject);

var
  n:integer;
  bgnd_shapes_text_str,name_str,shape_name_str:string;

begin
  bgnd_shapes_text_str:=bgnd_form.bgnd_shapes_listbox.Items.Text;

  name_str:=format_his_name;

  shape_name_str:='map::'+name_str;

  if Pos(shape_name_str,bgnd_shapes_text_str)<>0
     then begin
            if alert(7,'    delete  map  '+name_str,
                       '      '+name_str
                      +'||You are about to delete this map from the background shapes.'
                      +'||It is not possible to restore a map which has been deleted.'
                      +'||Are you sure you want to delete this map ?',
                       '','','','yes  -  delete  map','no  -  cancel','',0)=5 then EXIT;
          end
     else begin
            ShowMessage('Error: map '+name_str+' not found.');
            EXIT;
          end;

  try
    with bgnd_form.bgnd_shapes_listbox do begin
      with Items do begin
        if Count<1 then EXIT;

        n:=0;   // init

        repeat

          if Pos(shape_name_str,Strings[n])<>0
             then begin
                    free_shape_object(n);  // free any picture bitmaps and the shape object.
                    Delete(n);             // delete the entry.
                  end
             else INC(n);

        until n>(Count-1);

        shapes_saved:=(Count<1);   // need a fresh save unless all gone.

      end;//with

      ItemIndex:=0;
    end;//with

  finally
    map_loader_form_update;

    shapes_current_state;
    do_rollback:=False;       // no need to put this change in rollback register on redraw.
    redraw(True);
  end;//try
end;
//______________________________________________________________________________

procedure Tmap_loader_form.name_listboxClick(Sender: TObject);

begin
  if name_listbox.ItemIndex>-1 then name_edit.Text:=name_listbox.Items.Strings[name_listbox.ItemIndex];
end;
//______________________________________________________________________________

function get_tile_extents(map_str:string):boolean;

var
  n:integer;
  shape_str:string;

  xtile,ytile:integer;

  xmin,xmax,ymin,ymax:integer;

begin
  RESULT:=False;  // init

  xmin:=1000000000;
  ymin:=1000000000;

  xmax:=0-1000000000;
  ymax:=0-1000000000;

    // init globals ...

  xtile_min_p1.x:=minfp;
  ytile_min_p1.x:=minfp;
  xtile_max_p1.x:=minfp;
  ytile_max_p1.x:=minfp;
  xtile_min_p2.x:=minfp;
  ytile_min_p2.x:=minfp;
  xtile_max_p2.x:=minfp;
  ytile_max_p2.x:=minfp;

  xtile_min_p1.y:=minfp;
  ytile_min_p1.y:=minfp;
  xtile_max_p1.y:=minfp;
  ytile_max_p1.y:=minfp;
  xtile_min_p2.y:=minfp;
  ytile_min_p2.y:=minfp;
  xtile_max_p2.y:=minfp;
  ytile_max_p2.y:=minfp;

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count<1 then EXIT;   // no shapes ???

    for n:=0 to Count-1 do begin

      if Pos(map_str,Strings[n])=1
         then begin
                shape_str:=Strings[n];
                if Length(shape_str)<>46 then CONTINUE;      // not a map tile  (label, copyright, rectangle)

                xtile:=StrToInt(Trim(Copy(shape_str,26,10)));
                ytile:=StrToInt(Trim(Copy(shape_str,37,10)));

                if xmax<xtile
                   then begin
                          xmax:=xtile;                                        // update tile limits
                          xtile_max_p1:=Tbgshape(Objects[n]).bgnd_shape.p1;   // and update globals
                          xtile_max_p2:=Tbgshape(Objects[n]).bgnd_shape.p2;
                        end;

                if xmin>xtile
                   then begin
                          xmin:=xtile;
                          xtile_min_p1:=Tbgshape(Objects[n]).bgnd_shape.p1;
                          xtile_min_p2:=Tbgshape(Objects[n]).bgnd_shape.p2;
                        end;

                if ymax<ytile
                   then begin
                          ymax:=ytile;
                          ytile_max_p1:=Tbgshape(Objects[n]).bgnd_shape.p1;
                          ytile_max_p2:=Tbgshape(Objects[n]).bgnd_shape.p2;
                        end;

                if ymin>ytile
                   then begin
                          ymin:=ytile;
                          ytile_min_p1:=Tbgshape(Objects[n]).bgnd_shape.p1;
                          ytile_min_p2:=Tbgshape(Objects[n]).bgnd_shape.p2;
                        end;
              end;

    end;//next

  end;//with

  if (xmax>=xmin) and (ymax>=ymin)    // set global tile limits ...

     and (xtile_min_p1.x<>minfp)
     and (ytile_min_p1.x<>minfp)
     and (xtile_max_p1.x<>minfp)
     and (ytile_max_p1.x<>minfp)
     and (xtile_min_p2.x<>minfp)
     and (ytile_min_p2.x<>minfp)
     and (xtile_max_p2.x<>minfp)
     and (ytile_max_p2.x<>minfp)

     and (xtile_min_p1.y<>minfp)
     and (ytile_min_p1.y<>minfp)
     and (xtile_max_p1.y<>minfp)
     and (ytile_max_p1.y<>minfp)
     and (xtile_min_p2.y<>minfp)
     and (ytile_min_p2.y<>minfp)
     and (xtile_max_p2.y<>minfp)
     and (ytile_max_p2.y<>minfp)

     then begin
            xtile_min:=xmin;
            ytile_min:=ymin;

            xtile_max:=xmax;
            ytile_max:=ymax;

            RESULT:=True;
          end;
end;
//______________________________________________________________________________

procedure add_row(top_row:boolean);

var
  n:integer;
  server_code,zoom_level:integer;
  numx,numy,mapx:integer;
  xtile_org:integer;

  shape_str:string;
  xtile_str,ytile_str,zoom_str:string;

begin
  map_name_str:='map::'+format_his_name;    // global

  server_code:=-1; // init
  zoom_level:=-1;  // init;

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count<1 then EXIT;   // no shapes ???

    for n:=0 to Count-1 do begin

      if Pos(map_name_str,Strings[n])=1
         then begin
                shape_str:=Strings[n];
                if Length(shape_str)<>46 then CONTINUE;      // not a map tile  (label, copyright, rectangle, screenshot)

                server_code:=StrToInt(shape_str[21]);
                zoom_level:=StrToInt(Trim(Copy(shape_str,23,2)));

                BREAK;
              end;
    end;//next
  end;//with

  if (get_tile_extents(map_name_str)=False) or (server_code=-1) or (zoom_level=-1)
     then begin
            ShowMessage('error - Sorry, unable to identify all map tiles.');
            EXIT;
          end;

  Screen.Cursor:=crHourGlass;

  map_tile_size_mm:=ABS(ytile_min_p2.x-ytile_min_p1.x);

  map_org_x:=xtile_min_p1.x;         // align left on pad

  if top_row=True
     then begin
            ytile_str:=IntToStr(ytile_min-1);             // y tiles count from top
            map_org_y:=ytile_min_p1.y+map_tile_size_mm;   // pad grid from bottom
          end
     else begin
            ytile_str:=IntToStr(ytile_max+1);             // bottom row
            map_org_y:=ytile_max_p1.y-map_tile_size_mm;
          end;

  map_num_tiles_y:=1;                // 1 row to add
  map_tile_count_y:=0;               // first row only

  xtile_org:=xtile_min;

  numx:=ABS(xtile_max-xtile_min)+1;

  numy:=1;                           // 1 row

  map_src_code:=server_code;         // global

  zoom_str:=IntToStr(zoom_level);

  try
    for mapx:=0 to numx-1 do begin   // tile column

      map_tile_count_x:=mapx;        // global

      xtile_str:=IntToStr(xtile_org+mapx);

      if obtain_tile_from_server(zoom_str,xtile_str,ytile_str)=False
         then EXIT;

      redraw(False);   // show map loading

    end;//next tile

  finally
    bgnd_form.picture_borders_checkbox.Checked:= NOT map_loader_form.remove_borders_checkbox.Checked;  // 233d  remove tile borders if not wanted

    Screen.Cursor:=crDefault;
    redraw(True);
  end;//try

end;
//______________________________________________________________________________

procedure Tmap_loader_form.add_top_buttonClick(Sender: TObject);

begin
  add_row(True);     // True = at top
end;
//______________________________________________________________________________

procedure Tmap_loader_form.add_bottom_buttonClick(Sender: TObject);

begin
  add_row(False);    // False = at bottom
end;
//______________________________________________________________________________

procedure add_column(left_column:boolean);

var
  n:integer;
  server_code,zoom_level:integer;
  numx,numy,mapy:integer;
  ytile_org:integer;

  shape_str:string;
  xtile_str,ytile_str,zoom_str:string;

begin
  map_name_str:='map::'+format_his_name;    // global

  server_code:=-1; // init
  zoom_level:=-1;  // init;

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count<1 then EXIT;   // no shapes ???

    for n:=0 to Count-1 do begin

      if Pos(map_name_str,Strings[n])=1
         then begin
                shape_str:=Strings[n];
                if Length(shape_str)<>46 then CONTINUE;      // not a map tile  (label, copyright, rectangle, screenshot)

                server_code:=StrToInt(shape_str[21]);
                zoom_level:=StrToInt(Trim(Copy(shape_str,23,2)));

                BREAK;
              end;
    end;//next
  end;//with

  if (get_tile_extents(map_name_str)=False) or (server_code=-1) or (zoom_level=-1)
     then begin
            ShowMessage('error - Sorry, unable to identify all map tiles.');
            EXIT;
          end;

  Screen.Cursor:=crHourGlass;

  map_tile_size_mm:=ABS(ytile_min_p2.x-ytile_min_p1.x);

  map_org_y:=ytile_max_p1.y;

  if left_column=True
     then begin
            xtile_str:=IntToStr(xtile_min-1);
            map_org_x:=xtile_min_p1.x-map_tile_size_mm;
          end
     else begin
            xtile_str:=IntToStr(xtile_max+1);
            map_org_x:=xtile_max_p1.x+map_tile_size_mm;
          end;

  map_num_tiles_x:=1;                // 1 column to add
  map_tile_count_x:=0;               // first column only

  numy:=ABS(ytile_max-ytile_min)+1;   // 1 column
  map_num_tiles_y:=numy;              // global

  ytile_org:=ytile_min;

  numx:=1;

  map_src_code:=server_code;             // global

  zoom_str:=IntToStr(zoom_level);

  try
    for mapy:=0 to numy-1 do begin   // tile column

      map_tile_count_y:=mapy;        // global

      ytile_str:=IntToStr(ytile_org+mapy);

      if obtain_tile_from_server(zoom_str,xtile_str,ytile_str)=False
         then EXIT;

      redraw(False);   // show map loading

    end;//next tile

  finally
    bgnd_form.picture_borders_checkbox.Checked:= NOT map_loader_form.remove_borders_checkbox.Checked;  // 233d  remove tile borders if not wanted

    Screen.Cursor:=crDefault;
    redraw(True);
  end;//try

end;
//______________________________________________________________________________

procedure Tmap_loader_form.add_left_buttonClick(Sender: TObject);

begin
  add_column(True);
end;
//______________________________________________________________________________

procedure Tmap_loader_form.add_right_buttonClick(Sender: TObject);

begin
  add_column(False);
end;
//______________________________________________________________________________

procedure Tmap_loader_form.nls_county_radio_buttonClick(Sender: TObject);        // 227a

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.nls_natgrid25_radio_buttonClick(Sender: TObject);      // 227a

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.nls_natgrid50_radio_buttonClick(Sender: TObject);       // 227a

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.nls_town60_radio_buttonClick(Sender: TObject);  // 233d

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.nls_town125_radio_buttonClick(Sender: TObject);   // 233d

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.nls_london_radio_buttonClick(Sender: TObject);

begin
  map_loader_form_update;
end;
//______________________________________________________________________________


procedure Tmap_loader_form.osm_radio_buttonClick(Sender: TObject);

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.tf_radio_buttonClick(Sender: TObject);   // 227a

begin
  map_loader_form_update;
end;
//______________________________________________________________________________


procedure Tmap_loader_form.nls_6inch_radio_buttonClick(Sender: TObject);

begin
  map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.stop_buttonClick(Sender: TObject);

begin
  stop_loading:=True;

  pause_button.Caption:='pause';  // reset if stopped after pause.
end;
//______________________________________________________________________________

procedure Tmap_loader_form.pause_buttonClick(Sender: TObject);

begin
  pause_loading:= NOT pause_loading;

  if pause_loading=True then pause_button.Caption:='continue'
                        else pause_button.Caption:='pause';
end;
//______________________________________________________________________________

procedure Tmap_loader_form.close_buttonClick(Sender: TObject);

begin
  Hide;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.FormActivate(Sender: TObject);

begin
  if map_loading_in_progress=False then map_loader_form_update;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.info_labelClick(Sender: TObject);

begin
  info_label.Font.color:=clBlue;
  go_to_url('https://85a.uk/templot/companion/get_map_from_the_web.php');
end;
//______________________________________________________________________________

procedure crop_row_or_column(which_tiles:integer);

  // which tiles  0=top row  1=right column  2=bottom row  3=left column  (clockwise)

var
  n:integer;
  server_code,zoom_level:integer;

  shape_str:string;
  xtile_str,ytile_str,crop_tile_str:string;

  pos_loc:integer;

begin
  map_name_str:='map::'+format_his_name;    // global

  server_code:=-1; // init
  zoom_level:=-1;  // init;

  with bgnd_form.bgnd_shapes_listbox.Items do begin
    if Count<1 then EXIT;   // no shapes ???

    for n:=0 to Count-1 do begin

      if Pos(map_name_str,Strings[n])=1
         then begin
                shape_str:=Strings[n];
                if Length(shape_str)<>46 then CONTINUE;      // not a map tile  (label, copyright, rectangle, screenshot)

                server_code:=StrToInt(shape_str[21]);
                zoom_level:=StrToInt(Trim(Copy(shape_str,23,2)));

                BREAK;
              end;
    end;//next
  end;//with

  if (get_tile_extents(map_name_str)=False) or (server_code=-1) or (zoom_level=-1)
     then begin
            ShowMessage('error - Sorry, unable to identify all map tiles.');
            EXIT;
          end;

  case which_tiles of

      0: begin crop_tile_str:=IntToStr(ytile_min); pos_loc:=36; end;   // top row   y tiles count from top

      1: begin crop_tile_str:=IntToStr(xtile_max); pos_loc:=25; end;   // right column

      2: begin crop_tile_str:=IntToStr(ytile_max); pos_loc:=36; end;   // bottom row

      3: begin crop_tile_str:=IntToStr(xtile_min); pos_loc:=25; end;   // left column

    else EXIT;  // ???
  end;//case

   // delete all matching tiles ...

  try

    with bgnd_form.bgnd_shapes_listbox do begin
      with Items do begin
        if Count<1 then EXIT;

        n:=0;   // init

        repeat

          if Pos('#'+crop_tile_str,Strings[n])=pos_loc  // position in shape name string
             then begin
                    free_shape_object(n);  // free the picture bitmaps and the shape object.
                    Delete(n);             // delete the entry.
                  end
             else INC(n);

        until n>(Count-1);

        shapes_saved:=(Count<1);   // need a fresh save unless all gone.

      end;//with

      ItemIndex:=0;
    end;//with

    if get_tile_extents(map_name_str)=False                // no tiles remaining?
       then begin                                          // delete the map entirely, rectangle, label
              with bgnd_form.bgnd_shapes_listbox do begin
                with Items do begin
                  if Count<1 then EXIT;

                  n:=0;   // init

                  repeat

                    if Pos(map_name_str,Strings[n])<>0
                       then begin
                              free_shape_object(n);  // free any picture bitmaps and the shape object.
                              Delete(n);             // delete the entry.
                            end
                       else INC(n);

                  until n>(Count-1);

                  shapes_saved:=(Count<1);   // need a fresh save unless all gone.

                end;//with

                ItemIndex:=0;
              end;//with
            end;

  finally
    map_loader_form_update;

    shapes_current_state;
    do_rollback:=False;       // no need to put this change in rollback register on redraw.
    redraw(True);
  end;//try
end;
//______________________________________________________________________________

procedure Tmap_loader_form.crop_top_buttonClick(Sender: TObject);

begin
  crop_row_or_column(0);
end;
//_____________________________

procedure Tmap_loader_form.crop_right_buttonClick(Sender: TObject);

begin
  crop_row_or_column(1);
end;
//_____________________________

procedure Tmap_loader_form.crop_bottom_buttonClick(Sender: TObject);

begin
  crop_row_or_column(2);
end;
//_____________________________

procedure Tmap_loader_form.crop_left_buttonClick(Sender: TObject);

begin
  crop_row_or_column(3);
end;
//______________________________________________________________________________

function check_browser_zoom:boolean;

var
  window_handle:HWND;
  device_context:HDC;

  grab_bmp:TBitmap;

  window_rect:TRect;

  grab_width,grab_height:integer;

  i,n:integer;

  row,col:integer;

  wait_count:integer;

begin
     // test zoom setting   -   display test image, then grab it as a screenshot ...

  RESULT:=False;  // init

// OT2024  web_map_help_form.Hide;
// OT2024  map_loader_form.Hide;

  Screen.Cursor:=crHourGlass;

(*  // OT2024


  if web_browser_form.Showing=False then web_browser_form.Show;       // calling Show resets the page zoom.

  if web_browser_form.ClientWidth<480   // allow for scrollbars
     then begin
            web_browser_form.ClientWidth:=480;
            Application.ProcessMessages;
          end;
*)

  Screen.Cursor:=crHourGlass;

  Application.ProcessMessages;

  wait_count:=running_counter;

(* // OT2024

  web_browser_form.web_browser.Navigate('file:///'+exe_str+'internal\test_zoom_page.html');

  repeat
    Application.ProcessMessages;

  until (web_browser_form.web_browser.Busy=False) or ((running_counter-wait_count)>40);  // wait 8 seconds max
*)

  Screen.Cursor:=crDefault;

  Application.ProcessMessages;   // once more

  window_handle:=GetForegroundWindow;

  Windows.GetClientRect(window_handle,window_rect);
  device_context:=GetDC(window_handle);

  grab_width:=window_rect.Right-window_rect.Left;
  grab_height:=window_rect.Bottom-window_rect.Top;

  if (grab_width<1) or (grab_height<1) then EXIT;  // ???

  grab_bmp:=TBitmap.Create;

  grab_bmp.Width:=grab_width;
  grab_bmp.Height:=grab_height;

  row:=0;  // keep compiler happy
  col:=0;

  try
    BitBlt(grab_bmp.Canvas.Handle,0,0,grab_width,grab_height,device_context,0,0,SRCCOPY);

    for i:=0 to 16 do begin

      for n:=0 to 16 do begin

        if grab_bmp.Canvas.Pixels[n,i]=clRed      // find top row of actual image in screenshot
           then begin
                  row:=i;
                  col:=n;
                  EXIT;
                end;

      end;//next n
    end;//next i


  finally
    with grab_bmp.Canvas do begin

       if (Pixels[col+396,row]<>clRed) or (Pixels[col+397,row]<>clGreen) or (Pixels[col+398,row]<>clBlue)

          then RESULT:=False
          else RESULT:=True;

    end;//with

    grab_bmp.Free;

    ReleaseDC(window_handle,device_context);

// OT2024    web_browser_form.Hide;

    Screen.Cursor:=crDefault;
  end;//try
end;
//______________________________________________________________________________

procedure Tmap_loader_form.url_editClick(Sender: TObject);

begin
  url_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.name_editClick(Sender: TObject);

begin
  name_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.lon_editClick(Sender: TObject);

begin
  lon_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.lat_editClick(Sender: TObject);

begin
  lat_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.os_letters_editClick(Sender: TObject);

begin
  os_letters_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.os_easting_editClick(Sender: TObject);

begin
  os_easting_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.os_northing_editClick(Sender: TObject);

begin
  os_northing_edit.SelectAll;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.info_labelMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

begin
  info_label.Font.color:=clRed;
end;
//______________________________________________________________________________

procedure Tmap_loader_form.zoom_to_map_buttonClick(Sender: TObject);

begin
  if map_exists=True then zoom_to_map;
end;
//______________________________________________________________________________
(* // OT2024

procedure Tmap_loader_form.clarity_buttonClick(Sender: TObject);

begin
  map_clarity_form.Show;
end;
//______________________________________________________________________________
*)

procedure Tmap_loader_form.nls_coverage_buttonClick(Sender: TObject);

begin
  go_to_url('https://maps.nls.uk/geo/explore/#zoom=6&lat=54.81502&lon=-4.05493&layers=168&b=4');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.os_coverage_buttonClick(Sender: TObject);

begin
  go_to_url('https://maps.nls.uk/geo/records/#zoom=7&lat=54.3182&lon=-3.8462&layers=0&b=1&point=0,0');
end;
//______________________________________________________________________________

procedure Tmap_loader_form.tiles_buttonClick(Sender: TObject);       // 229d

begin
  with math_form do begin
    Caption:='    Map  Tile  URL ...';
    big_label.Caption:=insert_crlf_str('|      Map Tile URL'
                                    +'||If you know what you are doing, enter below the URL for a map tile server.'
                                    +'||Otherwise click Cancel.');
    math_editbox.Text:='';

    do_show_modal(math_form);    // 212a

    if ModalResult=mrOK
       then manual_tile_url_str:=Trim(math_editbox.Text);

    Caption:='    TEMPLOT';   // reset form caption.
  end;//with
end;
//______________________________________________________________________________

end.
