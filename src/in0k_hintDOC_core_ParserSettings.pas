unit in0k_hintDOC_core_parserSettings;

{$mode objfpc}{$H+}

{/$define _DEBUG_}

{$ifnDef _DEBUG_}
    {$define _INLINE_}
{$endIf}

interface

uses
  Classes, SysUtils;


type

   // Настройки для ПАРСЕРА
 tInkHD_parserSettings=record
    tokenLabel:string; //< выбранный МеткаТокена (если="" => НЕ установлен)
    tokenStart:string; //< начальный токен, ПОСЛЕ которого парсим
    tokenFinal:string; //< конечный токен, ДО которого парсим
    tokenStrEX:string; //< токен "Строки-РАСШИРИТЕЛЬ"
    //---
    tokenStartMustBe:boolean; //< начальный токен ДОЛЖЕН быть
    tokenFinalMustBe:boolean; //< конечный токен ДОЛЖЕН быть
    //---
    extractStringEXT:boolean; //< выделять "символ Строки-РАСШИРИТЕЛЬ"
  end;
 pInkHD_parserSettings=^tInkHD_parserSettings;

//-------------------------------------

procedure InkHD_parserSettings_CLR(const obj:pInkHD_parserSettings);
function  InkHD_parserSettings_CRT:pInkHD_parserSettings;
procedure InkHD_parserSettings_CRT(out   obj:pInkHD_parserSettings);
procedure InkHD_parserSettings_DST(const obj:pInkHD_parserSettings);

//---

procedure InkHD_parserSettings_SET__tokenLabel(const obj:pInkHD_parserSettings; const value:string); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__tokenLabel(const obj:pInkHD_parserSettings):string;              {$ifDef _INLINE}inline;{$endIf}

procedure InkHD_parserSettings_SET__tokenStart(const obj:pInkHD_parserSettings; const value:string); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__tokenStart(const obj:pInkHD_parserSettings):string;              {$ifDef _INLINE}inline;{$endIf}

procedure InkHD_parserSettings_SET__tokenFinal(const obj:pInkHD_parserSettings; const value:string); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__tokenFinal(const obj:pInkHD_parserSettings):string;              {$ifDef _INLINE}inline;{$endIf}

procedure InkHD_parserSettings_SET__tokenStrEX(const obj:pInkHD_parserSettings; const value:string); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__tokenStrEX(const obj:pInkHD_parserSettings):string;              {$ifDef _INLINE}inline;{$endIf}

//---

procedure InkHD_parserSettings_SET__tokenStartMustBe(const obj:pInkHD_parserSettings; const value:boolean); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__tokenStartMustBe(const obj:pInkHD_parserSettings):boolean;              {$ifDef _INLINE}inline;{$endIf}

procedure InkHD_parserSettings_SET__tokenFinalMustBe(const obj:pInkHD_parserSettings; const value:boolean); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__tokenFinalMustBe(const obj:pInkHD_parserSettings):boolean;              {$ifDef _INLINE}inline;{$endIf}

procedure InkHD_parserSettings_SET__extractStringEXT(const obj:pInkHD_parserSettings; const value:boolean); {$ifDef _INLINE}inline;{$endIf}
function  InkHD_parserSettings_GET__extractStringEXT(const obj:pInkHD_parserSettings):boolean;              {$ifDef _INLINE}inline;{$endIf}

implementation

procedure InkHD_parserSettings_CLR(const obj:pInkHD_parserSettings);
begin
    with obj^ do begin
        tokenLabel:='';
        tokenStart:='';
        tokenFinal:='';
        tokenStrEX:='';
        //---
        tokenStartMustBe:=false;
        tokenFinalMustBe:=false;
        extractStringEXT:=false;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function InkHD_parserSettings_CRT:pInkHD_parserSettings;
begin
    new(result);
    InkHD_parserSettings_CLR(result);
end;

procedure InkHD_parserSettings_CRT(out obj:pInkHD_parserSettings);
begin
    obj:=InkHD_parserSettings_CRT;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure InkHD_parserSettings_DST(const obj:pInkHD_parserSettings);
begin
    {$ifDef _DEBUG_}
        Assert( Assigned(obj) ,'InkHD_parserSettings_DST: obj isNULL');
    {$endIf}
    InkHD_parserSettings_CLR(obj); //< параноя
    dispose(obj)
end;

//------------------------------------------------------------------------------

procedure InkHD_parserSettings_SET__tokenLabel(const obj:pInkHD_parserSettings; const value:string);
begin
    obj^.tokenLabel:=value;
end;

function InkHD_parserSettings_GET__tokenLabel(const obj:pInkHD_parserSettings):string;
begin
    result:=obj^.tokenLabel;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure InkHD_parserSettings_SET__tokenStart(const obj:pInkHD_parserSettings; const value:string);
begin
    obj^.tokenStart:=value;
end;

function InkHD_parserSettings_GET__tokenStart(const obj:pInkHD_parserSettings):string;
begin
    result:=obj^.tokenStart;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure InkHD_parserSettings_SET__tokenFinal(const obj:pInkHD_parserSettings; const value:string);
begin
    obj^.tokenFinal:=value;
end;

function InkHD_parserSettings_GET__tokenFinal(const obj:pInkHD_parserSettings):string;
begin
    result:=obj^.tokenFinal;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure InkHD_parserSettings_SET__tokenStrEX(const obj:pInkHD_parserSettings; const value:string);
begin
    obj^.tokenStrEX:=value;
end;

function InkHD_parserSettings_GET__tokenStrEX(const obj:pInkHD_parserSettings):string;
begin
    result:=obj^.tokenStrEX;
end;

//------------------------------------------------------------------------------

procedure InkHD_parserSettings_SET__tokenStartMustBe(const obj:pInkHD_parserSettings; const value:boolean);
begin
    obj^.tokenStartMustBe:=value;
end;

function InkHD_parserSettings_GET__tokenStartMustBe(const obj:pInkHD_parserSettings):boolean;
begin
    result:=obj^.tokenStartMustBe;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure InkHD_parserSettings_SET__tokenFinalMustBe(const obj:pInkHD_parserSettings; const value:boolean);
begin
    obj^.tokenFinalMustBe:=value;
end;

function InkHD_parserSettings_GET__tokenFinalMustBe(const obj:pInkHD_parserSettings):boolean;
begin
    result:=obj^.tokenFinalMustBe;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure InkHD_parserSettings_SET__extractStringEXT(const obj:pInkHD_parserSettings; const value:boolean);
begin
    obj^.extractStringEXT:=value;
end;

function InkHD_parserSettings_GET__extractStringEXT(const obj:pInkHD_parserSettings):boolean;
begin
    result:=obj^.extractStringEXT;
end;

end.

