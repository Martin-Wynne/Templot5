
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

unit create_y_turnout;

{$MODE Delphi}

{$ALIGN OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Htmlview, StdCtrls, HtmlGlobals;

type

  { Tcreate_y_form }

  Tcreate_y_form = class(TForm)
    y_html_viewer1: THTMLViewer;
    y_html_viewer2: THTMLViewer;
    datestamp_label: TLabel;
    more_info_button: TButton;
    cancel_button: TButton;
    make_y_button: TButton;
    very_short_radio: TRadioButton;
    short_radio: TRadioButton;
    normal_radio: TRadioButton;
    long_radio: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure HotSpotClick(Sender: TObject; const SRC: ThtString; var Handled: Boolean);
    procedure more_info_buttonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  create_y_form: Tcreate_y_form;

implementation

{$R *.lfm}

uses
  ShellAPI,math_unit,help_sheet;

const
  online_url_str:string='https://85a.uk/templot/companion/info.php?ref=114';

  str1:string='green_panel_begin tree.gif  Y-turnouts are sometimes used in yards and sidings, but not usually found in running lines.'
             +'||If your turnout is in a running line, it is likely that it should be an ordinary handed turnout having contraflexure, not a Y-turnout. Cancel this and instead simply set the curving radius negative. green_panel_end'

             +'|green_panel_begin tree.gif  This function creates an improvised symmetrical Y-turnout.'
             +'||It will be comprised of 2 separate templates - a shortened turnout template and a modified irregular half-diamond template.'
             +'||rp.gif  This means the `0shift group`1 functions must be used if you wish to move it. It is better to start with the switch front already aligned in the required finished position.'
             +' For more information click the `0more information online`1 button.'
             +'||rp.gif  Do not use the `0F5`2 mouse action to adjust the size of the Y-turnout. Use `0F9`2 instead to adjust the V-crossing angle only.'
             +' After which it will be necessary to re-establish the symmetry - click the `0geometry > force contraflexure symmetry`1 menu item.'

             +'||If a fully prototypical symmetrical turnout is wanted, it would be necessary to construct it from multiple partial templates instead. green_panel_end';

   str2:string='              `0make improvised Y-turnout`9'

             +'||Start with a normal turnout in the control template.'
             +'||The switch front can be aligned to other templates and can include approach track. But any exit track|or alignments at the V-crossing will be lost and will need to be re-done.'
             +'||Select the required Y-turnout size from'
             +'|`0VERY SHORT`1    `0SHORT`1    `0NORMAL`1    `0LONG`1'
             +'||The actual size will depend on the starting switch size and V-crossing angle. For more information click the `0more information online`1 button. If the result is not suitable, click `0cancel`1 and try a different size.'
             +'||The V-crossing exits will be curved.'
             +'||If straight exits are required, this can be done by setting `0geometry > exit length > minimum`1 and pegging on separate straight exit templates.';

//______________________________________________________________________________

procedure Tcreate_y_form.FormCreate(Sender: TObject);

begin
  ClientWidth:=1000;
  ClientHeight:=624;
  AutoScroll:=False;

  Font.Size:=8;

end;

procedure Tcreate_y_form.HotSpotClick(Sender: TObject; const SRC: ThtString; var Handled: Boolean);

begin
  do_html_hotspot(SRC);
end;

//______________________________________________________________________________

procedure Tcreate_y_form.more_info_buttonClick(Sender: TObject);

begin
  if ShellExecute(0,'open',PChar(online_url_str),nil,nil,SW_SHOWNORMAL)<=32
     then show_modal_message('Sorry, unable to open your browser window and connect to the Templot web site.'
                     +#13+#13+'Please check your internet connection.');
end;
//______________________________________________________________________________

procedure Tcreate_y_form.FormShow(Sender: TObject);

  // can't be in formCreate because html_dots_per_inch not yet scaled (in startup unit)

begin
  y_html_viewer1.LoadFromString(convert_tagged_string_to_html(0,$00FFE8C8,str1,True,True));
  y_html_viewer2.LoadFromString(convert_tagged_string_to_html(0,$00FFE8C8,str2,True,True));
end;
//______________________________________________________________________________

end.
