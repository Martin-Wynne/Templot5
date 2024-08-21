
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

unit gaps_unit;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  StdCtrls, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, ComCtrls;

type

  { Tgaps_form }

  Tgaps_form = class(TForm)
    hide_panel: TPanel;
    hide_button: TButton;
    help_shape: TShape;
    help_button: TButton;
    Label1: TLabel;
    Label12: TLabel;
    slide_button: TButton;
    blue_corner_panel: TPanel;
    size_updown: TUpDown;
    colour_panel: TPanel;
    colour_patch: TImage;
    symbol_on_check_rail_checkbox: TCheckBox;
    add_symbol_button: TButton;
    delete_symbol_button: TButton;
    modify_symbol_button: TButton;
    delete_all_symbols_button: TButton;
    symbol_id_edit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    replace_fill_colour_label: TLabel;
    gap_colour_panel: TPanel;
    gap_colour_button: TButton;
    symbols_retain_on_mint_checkbox: TCheckBox;
    symbols_retain_on_make_checkbox: TCheckBox;
    Label6: TLabel;
    symbols_visible_listbox: TListBox;
    size_panel: Tpanel;
    small_radio: TRadioButton;
    medium_radio: TRadioButton;
    large_radio: TRadioButton;
    giant_radio: TRadioButton;
    radio_shape: TShape;
    sticker_radio: TRadioButton;
    gap_radio: TRadioButton;
    dropper_radio: TRadioButton;
    Label5: TLabel;
    Label4: TLabel;
    dropper_colour_panel: TPanel;
    dropper_colour_button: TButton;
    Label7: TLabel;
    sticker_colour_panel: TPanel;
    sticker_colour_button: TButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    show_hide_button: TButton;
    rail_panel: TPanel;
    rail_4_radio: TRadioButton;
    rail_3_radio: TRadioButton;
    rail_2_radio: TRadioButton;
    rail_1_radio: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure hide_buttonClick(Sender: TObject);
    procedure size_updownClick(Sender: TObject; Button: TUDBtnType);
    procedure colour_panelClick(Sender: TObject);
    procedure symbol_id_editClick(Sender: TObject);
    procedure symbol_id_editExit(Sender: TObject);
    procedure delete_all_symbols_buttonClick(Sender: TObject);
    procedure slide_buttonClick(Sender: TObject);
    procedure add_symbol_buttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gap_colour_buttonClick(Sender: TObject);
    procedure symbols_visible_listboxClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure dropper_colour_buttonClick(Sender: TObject);
    procedure sticker_colour_buttonClick(Sender: TObject);
    procedure symbols_visible_listboxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure show_hide_buttonClick(Sender: TObject);
    procedure symbols_visible_listboxExit(Sender: TObject);
    procedure delete_symbol_buttonClick(Sender: TObject);
    procedure modify_symbol_buttonClick(Sender: TObject);
    procedure help_buttonClick(Sender: TObject);
    procedure rail_1_radioClick(Sender: TObject);
    procedure rail_2_radioClick(Sender: TObject);
    procedure rail_3_radioClick(Sender: TObject);
    procedure rail_4_radioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  gaps_form:Tgaps_form;

  highlit_symbol:integer=-1;

procedure update_symbols_dialog;
procedure symbols_visible_listbox_clicked(n:integer);
procedure delete_all_symbols;
function a_symbol_selected:boolean;
procedure set_radio_shape(rail:integer);
procedure delete_existing_symbols_by_code(symbol_code:integer); //  239a

//______________________________________________________________________________

implementation

{$R *.lfm}

uses
  pad_unit,math_unit,keep_select,bgkeeps_unit,colour_unit,alert_unit,control_room;

//______________________________________________________________________________

procedure Tgaps_form.FormCreate(Sender: TObject);

begin
  pad_form.InsertControl(gaps_form);

  ClientWidth:=660;
  ClientHeight:=424;

  AutoScroll:=True;
end;
//______________________________________________________________________________

procedure Tgaps_form.hide_buttonClick(Sender: TObject);

begin
  Hide;
end;
//______________________________________________________________________________

procedure Tgaps_form.FormHide(Sender: TObject);

begin
  highlit_symbol:=-1;
  radio_shape.Visible:=False;
  pad_form.show_locator_menu_entry.Checked:=False;
  redraw(True);
end;
//______________________________________________________________________________

procedure Tgaps_form.size_updownClick(Sender: TObject; Button: TUDBtnType);

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

procedure Tgaps_form.colour_panelClick(Sender: TObject);

begin
  Color:=get_colour('choose  a  new  window  colour  for  the  symbols  dialog',Color);
end;
//______________________________________________________________________________

procedure Tgaps_form.symbol_id_editClick(Sender: TObject);

begin
  pad_form.KeyPreview:=False;
  symbol_id_edit.SetFocus;
end;
//______________________________________________________________________________

procedure Tgaps_form.symbol_id_editExit(Sender: TObject);

begin
  pad_form.KeyPreview:=True;  // reset
end;
//______________________________________________________________________________

function any_symbols:integer;

begin
  RESULT:=Length(current_symbols);
end;
//______________________________________________________________________________

function a_symbol_selected:boolean;

begin
  RESULT:=(any_symbols>0) and (gaps_form.symbols_visible_listbox.ItemIndex>-1);
end;
//______________________________________________________________________________

procedure update_symbols_dialog;

var
  n,sel:integer;

begin
  with gaps_form do begin

   modify_symbol_button.Enabled:=(any_symbols>0);
   delete_symbol_button.Enabled:=(any_symbols>0);
   delete_all_symbols_button.Enabled:=(any_symbols>0);

    if plain_track=True
       then begin
              rail_1_radio.Caption:='1.  MS  running  rail';
              rail_2_radio.Enabled:=False;
              rail_3_radio.Enabled:=False;
              rail_4_radio.Caption:='4.  TS  running  rail';
            end
       else begin
              rail_1_radio.Caption:='1.  main-road         stock  rail';
              rail_2_radio.Enabled:=True;
              rail_3_radio.Enabled:=True;
              rail_4_radio.Caption:='4.  turnout-road    stock  rail';
            end;

    if (locator_rail<1) or (locator_rail>4)
       then locator_rail:=1;

    rail_1_radio.Checked:=(locator_rail=1);
    rail_2_radio.Checked:=(locator_rail=2);
    rail_3_radio.Checked:=(locator_rail=3);
    rail_4_radio.Checked:=(locator_rail=4);

    set_radio_shape(locator_rail);

    sel:=symbols_visible_listbox.ItemIndex;

    symbols_visible_listbox.Items.Clear;

    if Length(current_symbols)>0
       then for n:=0 to Length(current_symbols)-1 do symbols_visible_listbox.Items.Add(current_symbols[n].symbol_data.symb_list_str);

    if (sel>-1) and (sel<symbols_visible_listbox.Items.Count)      // keep it selected
       then symbols_visible_listbox.ItemIndex:=sel;

  end;//with form
end;
//______________________________________________________________________________

procedure delete_all_symbols;

var
  n:integer;

begin
  if any_symbols<1 then EXIT;

  SetLength(current_symbols,0);

  gaps_form.symbols_visible_listbox.Items.Clear;

  redraw(True);
end;
//______________________________________________________________________________

procedure Tgaps_form.delete_all_symbols_buttonClick(Sender: TObject);

begin
  if alert(7,'      delete  all  symbols ?',
             'You are about to delete all the symbols from this template.',
             '','','','','cancel','delete  all  symbols',0)=5
     then EXIT;

  delete_all_symbols;

  update_symbols_dialog;
end;
//______________________________________________________________________________

procedure Tgaps_form.slide_buttonClick(Sender: TObject);

begin
  set_radio_shape(locator_rail);

  pad_form.move_locator_menu_entry.Click;
end;
//______________________________________________________________________________

procedure Tgaps_form.add_symbol_buttonClick(Sender: TObject);

var
  n,t:integer;
  str,list_str:string;

begin

  if (locator_rail<1) or (locator_rail>4)
     then begin
            show_modal_message('Unable to add a symbol - the marker is not currently on one of the rails.'
                              +#13+#13+'Click one of the buttons to select a rail and slide the marker along it.');
            EXIT;
          end;

  str:=Trim(symbol_id_edit.Text);

  if str='GAP' then str:='---';  // don't use id from a previously selected gap

  if Length(str)>12
     then begin
            str:=Copy(str,1,12);
            show_modal_message('symbol ID is :  '+str+#13+#13+'(max 12 characters)');
          end;

  if dropper_radio.Checked=True
     then t:=0
     else if gap_radio.Checked=True
             then t:=1
             else t:=2;
  case t of
      0: list_str:='> '+str;  // dropper
      1: list_str:='| GAP';   // gap
    else list_str:='# '+str;  // sticker
  end;//case

  SetLength(current_symbols,Length(current_symbols)+1);  // create a new line in symbols list

  n:=HIGH(current_symbols);   // index to it

  with current_symbols[n].symbol_data do begin

    str:=str+'                ';              // ensure file is filled..
    list_str:=list_str+'                ';

    symb_list_str:=Copy(list_str,1,14);
    symb_id_str:=Copy(str,1,12);

    symb_check_rail:=symbol_on_check_rail_checkbox.Checked;

    case t of
        0: symb_colour:=dropper_colour_panel.Color;
        1: symb_colour:=gap_colour_panel.Color;
      else symb_colour:=sticker_colour_panel.Color;
    end;//case

    symb_type:=t;

    symb_size:=0;  // init
    if medium_radio.Checked=True then symb_size:=1;
    if large_radio.Checked=True then symb_size:=2;
    if giant_radio.Checked=True then symb_size:=3;

    symb_rail:=locator_rail;

    symb_code:=0;             // normal
    symb_spare_float:=0;

    symb_x:=locatorx-xorg;    // from CTRL-1 to allow roaming and tools>make etc.

  end;//with

  update_symbols_dialog;

  highlit_symbol:=-1; // reset

  redraw(True);
end;
//______________________________________________________________________________

procedure Tgaps_form.FormShow(Sender: TObject);

begin
  update_symbols_dialog;
end;
//______________________________________________________________________________

procedure Tgaps_form.dropper_colour_buttonClick(Sender: TObject);

begin
  dropper_colour_panel.Color:=get_colour('choose  a  dropper  colour',dropper_colour_panel.Color);
end;
//______________________________________________________________________________

procedure Tgaps_form.gap_colour_buttonClick(Sender: TObject);

begin
  gap_colour_panel.Color:=get_colour('choose  a  gap  colour',gap_colour_panel.Color);
end;
//______________________________________________________________________________

procedure Tgaps_form.sticker_colour_buttonClick(Sender: TObject);

begin
  sticker_colour_panel.Color:=get_colour('choose  a  sticker  colour',sticker_colour_panel.Color);
end;
//______________________________________________________________________________

procedure symbols_visible_listbox_clicked(n:integer);

begin
  if (n<0) or (n>(Length(current_symbols)-1)) then EXIT;

  with gaps_form do begin

    highlit_symbol:=n;  // global for highlighting

    with current_symbols[n].symbol_data do begin     // list should correspond

      case symb_type of

        0: begin
             dropper_radio.Checked:=True;
             dropper_colour_panel.Color:=symb_colour;
             symbol_id_edit.Text:=symb_id_str;
           end;

        1: begin
             gap_radio.Checked:=True;
             gap_colour_panel.Color:=symb_colour;
             symbol_id_edit.Text:='GAP';
           end;

        2: begin
             sticker_radio.Checked:=True;
             sticker_colour_panel.Color:=symb_colour;
             symbol_id_edit.Text:=symb_id_str;
           end;

      end;//case

      symbol_on_check_rail_checkbox.Checked:=symb_check_rail;

      case symb_size of

        0: small_radio.Checked:=True;
        1: medium_radio.Checked:=True;
        2: large_radio.Checked:=True;
        3: giant_radio.Checked:=True;

      end;//case

        // put locator on it ...

      locatorx:=xorg+symb_x;
      locator_rail:=symb_rail;

      set_radio_shape(locator_rail);

      pad_form.show_locator_menu_entry.Checked:=True;

    end;//with

  end;//with form

  redraw(True);  // for highlighting and update dialog
end;
//______________________________________________________________________________

procedure Tgaps_form.symbols_visible_listboxClick(Sender: TObject);

begin
  symbols_visible_listbox_clicked(symbols_visible_listbox.ItemIndex);
end;
//______________________________________________________________________________

procedure Tgaps_form.symbols_visible_listboxDrawItem(Control:TWinControl; Index:Integer; Rect:TRect; State:TOwnerDrawState);

begin
    if (Index<0) or (Index>(symbols_visible_listbox.Items.Count-1)) then EXIT;  // ???

    with (Control as TListBox).Canvas do begin

      if (odSelected in State)=True
         then begin
                Brush.Color:=$00FF7700;   // light blue
                Font.Color:=clWhite;
              end
         else begin
                Brush.Color:=$00E8E8E8;
                Font.Color:=current_symbols[Index].symbol_data.symb_colour;
              end;


      TextOut(Rect.Left,Rect.Top,(Control as TListBox).Items.Strings[Index]+'                ');

    end;//with
end;
//______________________________________________________________________________

procedure Tgaps_form.show_hide_buttonClick(Sender: TObject);

begin
  if pad_form.show_template_symbols_menu_entry.Checked=True
     then pad_form.hide_template_symbols_menu_entry.Click
     else pad_form.show_template_symbols_menu_entry.Click;    // toggle

  highlit_symbol:=-1;
  redraw(True);  // for no highlighting
end;
//______________________________________________________________________________

procedure Tgaps_form.symbols_visible_listboxExit(Sender: TObject);

begin
  highlit_symbol:=-1;
  redraw(True);  // for no highlighting
end;
//______________________________________________________________________________

procedure delete_existing_symbols_by_code(symbol_code:integer);   // if any   239a

  // code 1 is a chair options sticker

var
  n,i:integer;

begin
  if (Length(current_symbols)<1) then EXIT;

  repeat
    n:=-1;  // init

    for i:=0 to Length(current_symbols)-1 do begin

      if current_symbols[i].symbol_data.symb_code=symbol_code
         then begin
                n:=i;
                BREAK;
              end;
    end;//next

    if n>(Length(current_symbols)-1) then EXIT;  // ???

    if n<0
       then begin
              update_symbols_dialog;
              redraw(True);
              EXIT;
            end;

    if n<(Length(current_symbols)-1)    // not deleting the final element
       then for i:=n+1 to Length(current_symbols)-1 do current_symbols[i-1]:=current_symbols[i];  // shift up

    current_symbols:=Copy(current_symbols,0,Length(current_symbols)-1);  // truncate final element

  until n<0;
end;
//______________________________________________________________________________

procedure Tgaps_form.delete_symbol_buttonClick(Sender: TObject);

var
  n,i:integer;

begin
  if a_symbol_selected=False
     then begin
            show_modal_message('Click the list to select the symbol to be deleted.');
            EXIT;
          end;

  n:=symbols_visible_listbox.ItemIndex;

  if (Length(current_symbols)<1) or (n<0) or (n>(Length(current_symbols)-1)) then EXIT;

  if n<(Length(current_symbols)-1)    // not deleting the final element
     then for i:=n+1 to Length(current_symbols)-1 do current_symbols[i-1]:=current_symbols[i];  // shift up

  current_symbols:=Copy(current_symbols,0,Length(current_symbols)-1);  // truncate final element

  update_symbols_dialog;

  redraw(True);
end;
//______________________________________________________________________________

procedure Tgaps_form.modify_symbol_buttonClick(Sender: TObject);

var
  n,t:integer;
  str,list_str:string;

begin
  if a_symbol_selected=False
     then begin
            show_modal_message('Click the list to select the symbol to be modified.');
            EXIT;
          end;

  n:=symbols_visible_listbox.ItemIndex;

  str:=Trim(symbol_id_edit.Text);

  if Length(str)>12
     then begin
            str:=Copy(str,1,12);
            show_modal_message('symbol ID is :  '+str+#13+#13+'(max 12 characters)');
          end;

  if dropper_radio.Checked=True
     then t:=0
     else if gap_radio.Checked=True
             then t:=1
             else t:=2;
  case t of
      0: list_str:='> '+str;  // dropper
      1: list_str:='| GAP';   // gap
    else list_str:='# '+str;  // sticker
  end;//case

  with current_symbols[n].symbol_data do begin

    str:=str+'                ';              // ensure file is filled..
    list_str:=list_str+'                ';

    symb_list_str:=Copy(list_str,1,14);
    symb_id_str:=Copy(str,1,12);

    symb_check_rail:=symbol_on_check_rail_checkbox.Checked;

    case t of
        0: symb_colour:=dropper_colour_panel.Color;
        1: symb_colour:=gap_colour_panel.Color;
      else symb_colour:=sticker_colour_panel.Color;
    end;//case

    symb_type:=t;

    symb_size:=0;  // init
    if medium_radio.Checked=True then symb_size:=1;
    if large_radio.Checked=True then symb_size:=2;
    if giant_radio.Checked=True then symb_size:=3;

  end;//with

  update_symbols_dialog;

  highlit_symbol:=-1; // reset

  redraw(True);
end;
//______________________________________________________________________________

procedure set_radio_shape(rail:integer);

begin

  with gaps_form do begin

    case rail of

       1: begin
            radio_shape.top:=rail_panel.Top+rail_1_radio.Top+((rail_1_radio.Height-radio_shape.Height) DIV 2)+1;
            radio_shape.Visible:=True;
          end;

       2: begin
            radio_shape.top:=rail_panel.Top+rail_2_radio.Top+((rail_2_radio.Height-radio_shape.Height) DIV 2)+1;
            radio_shape.Visible:=True;
          end;

       3: begin
            radio_shape.top:=rail_panel.Top+rail_3_radio.Top+((rail_3_radio.Height-radio_shape.Height) DIV 2)+1;
            radio_shape.Visible:=True;
          end;

       4: begin
            radio_shape.top:=rail_panel.Top+rail_4_radio.Top+((rail_4_radio.Height-radio_shape.Height) DIV 2)+1;
            radio_shape.Visible:=True;
          end;

    end;//case

  end;//with form
end;
//______________________________________________________________________________

procedure Tgaps_form.help_buttonClick(Sender: TObject);

begin
  go_to_templot_companion_page('construction_symbols.php');
end;
//______________________________________________________________________________

procedure Tgaps_form.rail_1_radioClick(Sender: TObject);

begin
  locator_rail:=1;
  update_symbols_dialog;

  redraw(True);  // move locator to rail
end;
//______________________________________________________________________________

procedure Tgaps_form.rail_2_radioClick(Sender: TObject);

begin
  locator_rail:=2;
  update_symbols_dialog;

  redraw(True);  // move locator to rail
end;
//______________________________________________________________________________

procedure Tgaps_form.rail_3_radioClick(Sender: TObject);

begin
  locator_rail:=3;
  update_symbols_dialog;

  redraw(True);  // move locator to rail
end;
//______________________________________________________________________________

procedure Tgaps_form.rail_4_radioClick(Sender: TObject);

begin
  locator_rail:=4;
  update_symbols_dialog;

  redraw(True);  // move locator to rail
end;
//______________________________________________________________________________

end.

