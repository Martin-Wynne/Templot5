unit trial_unit;

{$mode Delphi}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Ttrial_form }

  Ttrial_form = class(TForm)
    sort_button: TButton;
    widget_memo: TMemo;
    procedure widget_memoEnter(Sender: TObject);
    procedure sort_buttonClick(Sender: TObject);
  private

  public

  end;

var
  trial_form: Ttrial_form;

implementation

{$R *.lfm}

{ Ttrial_form }




procedure Ttrial_form.sort_buttonClick(Sender: TObject);

var
  widget_list:TStringList;
  n:integer;

begin
  widget_list:=TStringList.Create;

  widget_list.Text:=widget_memo.Text;

  widget_list.Sort;

  widget_memo.Clear;

  for n:=1 to widget_list.Count do widget_memo.Lines.Add(IntToStr(n)+'   '+widget_list.Strings[n-1]);

  widget_memo.Color:=clLime;

  widget_list.Free;
end;
//______________________________________________________________________________

procedure Ttrial_form.widget_memoEnter(Sender: TObject);

begin
  widget_memo.Color:=clWhite;
end;

//______________________________________________________________________________



end.

