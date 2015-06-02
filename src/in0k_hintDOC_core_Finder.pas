unit in0k_hintDOC_core_Finder;
(*
        +-+-+--+-+-+ v 0.9
        | hint DOC |
        +-+-+--+-+-+ Finder
*)

{$mode objfpc}{$H+}

interface

uses RegExpr;

type

 tIHDF_nmbr=longWord; //< поисковая арифметика

 tIn0k_hintDOC_Finder=class
  strict private
   _regExpr:TRegExpr;
    procedure _regExpr_source_SET(const text:string);                                                                 inline;
    function  _regExpr_source_GET:string;                                                                             inline;
    function  _regExpr_qMetaChars(const text:string):string;                                                          inline;
    function  _regExpr_enumDo_BGN(out tknPOS,tknLEN:tIHDF_nmbr; const expTXT:string; const Idx:tIHDF_nmbr=0):boolean; //inline;
    function  _regExpr_enumDo_nxt(out tknPOS,tknLEN:tIHDF_nmbr; const Idx:tIHDF_nmbr=0):boolean;                      inline;
  public
    constructor Create;
    destructor DESTROY; override;
  public
    property SourceText:string read _regExpr_source_GET write _regExpr_source_SET;
  public //< перечисления [ ..start -> ..next -> ..next -> .. -> FALSE]
    function Enum_chTKN_start(out POS,LEN:tIHDF_nmbr; const Token:string):boolean;
    function Enum_chTKN_next (out POS,LEN:tIHDF_nmbr):boolean;
    function Enum_Token_start(out POS,LEN:tIHDF_nmbr; const Token:string):boolean;
    function Enum_Token_next (out POS,LEN:tIHDF_nmbr):boolean;
    function Enum_SPRTR_start(out POS,LEN:tIHDF_nmbr):boolean;
    function Enum_SPRTR_next (out POS,LEN:tIHDF_nmbr):boolean;
  public //< поиски
    function Find_single_TKN (out POS,LEN:tIHDF_nmbr; const Token:string):boolean;
    function Find_string_EXT (out POS,LEN:tIHDF_nmbr):boolean;
    function Find_brackets   (out bOpnPOS,bOpnLEN,bClsPOS,bClsLEN:tIHDF_nmbr; const bOPN,bCLS:string):boolean;
    function Find_First_SMBs (out fLength:tIHDF_nmbr; const SMBs :string):boolean;
    function Find_First_LINE (out fLength:tIHDF_nmbr):boolean;
    function Find_First_WORD (out fLength:tIHDF_nmbr):boolean;
  end;

implementation

{%region --- обёртка для RegExpr --------------------------------- /fold }

procedure tIn0k_hintDOC_Finder._regExpr_source_SET(const text:string);
begin
   _regExpr.InputString:=text;
end;

function tIn0k_hintDOC_Finder._regExpr_source_GET:string;
begin
    result:=_regExpr.InputString;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{ экранировать служебные символы                                      <
 ~prm text исходная строка
 ~ret исходная строка в которой ВСЕ служебные символы будут экранированы
}
function tIn0k_hintDOC_Finder._regExpr_QMetaChars(const text:string):string;
begin
    result:=QuoteRegExprMetaChars(text);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{ @ ПЕРЕЧИСЛЕНИЕ. начать.                                              <
    Исчем "шаблон" RegExpr в тексте. Инициализируем и проводим ПЕРВЫЙ поиск.
    @prm POS    начальный БАЙT найденного
    @prm LEN    длина найденного в БАЙТах
    @prm expTXT разыскиваемый "шаблон" RegExpr
    @prm Idx    группа в "шаблон" RegExpr, для которой получаем `POS` и `LEN`
    @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
      @val true  УСПЕШНЫЙ поиск
      @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder._regExpr_enumDo_BGN(out tknPOS,tknLEN:tIHDF_nmbr; const expTXT:string; const Idx:tIHDF_nmbr=0):boolean;
begin
   _regExpr.Expression:=expTXT;
    result:=_regExpr.ExecPos(1);
    if result then begin
        tknPOS:=_regExpr.MatchPos[Idx]-1; //< tRegExpr считает с 1(единици) => -1
        tknLEN:=_regExpr.MatchLen[Idx];
    end;
end;

{ @ ПЕРЕЧИСЛЕНИЕ. следующее.                                           <
  Поиск следующего вхождения инициализированного в `_regExpr_enumDo_BGN`.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @prm Idx группа в "шаблон" RegExpr, для которой получаем `POS` и `LEN`
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder._regExpr_enumDo_nxt(out tknPOS,tknLEN:tIHDF_nmbr; const Idx:tIHDF_nmbr=0):boolean;
begin
    result:=_regExpr.ExecNext;
    if result then begin
        tknPOS:=_regExpr.MatchPos[Idx]-1; //< tRegExpr считает с 1(единици) => -1
        tknLEN:=_regExpr.MatchLen[Idx];
    end;
end;

{%endregion}

//------------------------------------------------------------------------------

constructor tIn0k_hintDOC_Finder.Create;
begin
   _regExpr:=TRegExpr.Create;
    with _regExpr do begin
        ModifierI:=true;
        ModifierM:=true;
        ModifierS:=true;
        ModifierG:=true;
    end;
end;

destructor tIn0k_hintDOC_Finder.DESTROY;
begin
   _regExpr.Free;
   _regExpr:=nil;
    inherited;
end;

//------------------------------------------------------------------------------

{ @ "СИМВОЛ" перед "токеном". начать перечисление.                    <
  Исчем символ соящий ПЕРЕД "токеном". Инициализируем и проводим ПЕРВЫЙ поиск.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @prm Token разыскиваемая "токен"
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Enum_chTKN_start(out POS,LEN:tIHDF_nmbr; const Token:string):boolean;
begin
    result:=_regExpr_enumDo_BGN(POS,LEN,'(\S)'+_regExpr_QMetaChars(Token),1)
end;

{ @ "СИМВОЛ" перед "токеном". следующие.                              <
  Поиск следующего вхождения инициализированного в `enum_chTKN_start`.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Enum_chTKN_next(out POS,LEN:tIHDF_nmbr):boolean;
begin
    result:=_regExpr_enumDo_nxt(POS,LEN,1)
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{ @ "ТОКЕН" : начать перечисление.                                    <
  Инициализируем и проводим поиск ПЕРВОГО вхождения.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @prm Token разыскиваемая "токен"
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Enum_Token_start(out POS,LEN:tIHDF_nmbr; const Token:string):boolean;
begin
    result:=_regExpr_enumDo_BGN(POS,LEN,_regExpr_QMetaChars(Token))
end;

{ @ "ТОКЕН" : следующие.                                              <
  Поиск следующего вхождения инициализированного в `enum_Token_start`.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Enum_Token_next(out POS,LEN:tIHDF_nmbr):boolean;
begin
    result:=_regExpr_enumDo_nxt(POS,LEN);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{ @ "РАЗДЕЛИТЕЛЬНАЯ" линия : начать перечисление.                     <
  Инициализируем и проводим поиск ПЕРВОГО вхождения.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @prm Token разыскиваемая "токен"
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Enum_SPRTR_start(out POS,LEN:tIHDF_nmbr):boolean;
begin
    result:=_regExpr_enumDo_BGN(POS,LEN,'^\s*([^" "])\1{2,}')
end;

{ @ "РАЗДЕЛИТЕЛЬНАЯ" линия : следующие.                               <
  Поиск следующего вхождения инициализированного в `enum_SPRTR_start`.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Enum_SPRTR_next(out POS,LEN:tIHDF_nmbr):boolean;
begin
    result:=_regExpr_enumDo_nxt(POS,LEN);
end;

//------------------------------------------------------------------------------

{ @ Найти "токен".                                                    <
  Поиск ПЕРВОГО вхождения.
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Find_single_TKN(out POS,LEN:tIHDF_nmbr; const TOKEN:string):boolean;
begin
    result:=_regExpr_enumDo_BGN(POS,LEN,_regExpr_QMetaChars(TOKEN))
end;

{ @ Найти "Удлинитель строки".                                        <
  @prm POS начальный БАЙT найденного
  @prm LEN длина найденного в БАЙТах
  @ret параметры `POS` и `LEN` имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Find_string_EXT(out POS,LEN:tIHDF_nmbr):boolean;
begin
    with _regExpr do begin
        ModifierI:=true;
        ModifierM:=true;
        ModifierS:=true;
        ModifierG:=true;
    end;
    result:=_regExpr_enumDo_BGN(POS,LEN,'^([\n]*)([^\n]*)(\s\s\S)(\s*\n)*$',3);
end;

//------------------------------------------------------------------------------

{ @ Найти символя в НАЧАЛЕ строки.                                    <
  @prm fLength длина найденного в БАЙТах
  @prm SMBs    то, что исчем
  @ret `fLength` имеет смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Find_First_SMBs(out fLength:tIHDF_nmbr; const SMBs:string):boolean;
begin
    fLength:=0;
    result :=SMBs<>'';//false;
    if result then begin
       _regExpr.Expression:='^\s*?'+_regExpr_QMetaChars(SMBs);
        if _regExpr.ExecPos(1) and (_regExpr.MatchPos[0]=1) then begin
            // ЕСТЬ служебный символ в начале текста, отмечаем его "длину"
            fLength:=_regExpr.MatchLen[0]
        end
        else result:=false;
    end;
end;

{ @ Найти ПЕРВУЮ строку.                                              <
  @prm  fLength  длина найденного от начала
  @ret `fLength` имеет смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Find_First_LINE(out fLength:tIHDF_nmbr):boolean;
begin
    fLength:=0;
   _regExpr.Expression:='^.*?($)';
    result:=_regExpr.ExecPos(1) and (_regExpr.MatchPos[0]=1);
    if result then begin
        // ага ... нашли строку, осталось выяснить она ЕДИНСТВЕННАЯ или еще есть
        fLength:=length(_regExpr.InputString);
        // исчем вторую строку, и по её положению вычисляем длину первой
        if _regExpr.ExecNext and(_regExpr.MatchPos[0]<fLength) then begin
            fLength:=_regExpr.MatchPos[0]-1; //< tRegExpr считает с 1(единици) => -1
            // такой подход, потому что не знаем какой-какие разделители строк
            // используются и какой они длинны
        end
    end
    {$ifOPt D+}
    else begin
        Assert(false,self.ClassName+'.Find_First_LINE strange error');
        // мда ... странно ... но строк мы вообще не нашли ... какой-то касяк
    end;
    {$endif}
end;

{ @ Найти ПЕРВОЕ слово.                                               <
  @prm  fLength  длина найденного от начала
  @ret `fLength` имеет смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Find_First_WORD(out fLength:tIHDF_nmbr):boolean;
begin
    fLength:=0;
   _regExpr.Expression:='^\s*(\S{1,})\s*';
    //---
    result:=_regExpr.ExecPos(1);
    if result then begin
        fLength:=length(_regExpr.InputString);
        if _regExpr.MatchLen[0]<fLength
        then fLength:=_regExpr.MatchPos[1]+_regExpr.MatchLen[1]-1;
    end
end;

//------------------------------------------------------------------------------

{ @ ПОИСК скобок.                                                     <
  @prm bOPN символ(ы) ОТКРЫВАЮЩЕЙ скобки
  @prm bCLS символ(ы) ЗАКРЫВАЮЩЕЙ скобки
  @ret ВСЕ возвращаемые значения имеют смысл ТОЛЬКО в случае `TRUE`
    @val true  УСПЕШНЫЙ поиск
    @val false ничего НЕ нашли
}
function tIn0k_hintDOC_Finder.Find_brackets(out bOpnPOS,bOpnLEN,bClsPOS,bClsLEN:tIHDF_nmbr; const bOPN,bCLS:string):boolean;
begin
   _regExpr.ModifierM:=FALSE;
   _regExpr.Expression:='(^\s*'+_regExpr_QMetaChars(bOPN)+').*('+_regExpr_QMetaChars(bCLS)+')\s*$';
    result:=_regExpr.ExecPos(1);
    if result then begin
        bOpnPOS:=_regExpr.MatchPos[1];
        bOpnLEN:=_regExpr.MatchLen[1];
        bClsPOS:=_regExpr.MatchPos[2];
        bClsLEN:=_regExpr.MatchLen[2];
    end;
   _regExpr.ModifierM:=true;
end;

end.

