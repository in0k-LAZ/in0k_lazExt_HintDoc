unit uiWnd_parseTEXT;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, Forms, Controls, Graphics, Dialogs;

type

  { Twnd_parseTEXT }

  Twnd_parseTEXT = class(TForm)
    SynMemo1: TSynMemo;
  private
    { private declarations }
  public
    procedure parseText_CLEAR;
    procedure parseText_SET(const aText:string);
  end;

var wnd_parseTEXT:Twnd_parseTEXT;

procedure uiWnd_parseText_SHOW;
procedure uiWnd_parseText_Clear;
procedure uiWnd_parseText_SET(const text:string);

implementation

procedure uiWnd_parseText_SHOW;
begin
    if not Assigned(wnd_parseTEXT) then begin
        wnd_parseTEXT:=Twnd_parseTEXT.Create(Application);
    end;
    wnd_parseTEXT.Show;
    wnd_parseTEXT.BringToFront;
end;

procedure uiWnd_parseText_Clear;
begin
    if Assigned(wnd_parseTEXT) then begin
        wnd_parseTEXT.parseText_CLEAR;
    end;
end;

procedure uiWnd_parseText_SET(const text:string);
begin
    if Assigned(wnd_parseTEXT) then begin
        wnd_parseTEXT.parseText_SET(text);
    end;
end;

//------------------------------------------------------------------------------

{$R *.lfm}

procedure Twnd_parseTEXT.parseText_CLEAR;
begin
    SynMemo1.Clear;
end;

procedure Twnd_parseTEXT.parseText_SET(const aText:string);
begin
    SynMemo1.Text:=aText;
end;

end.

