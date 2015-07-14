unit uiWnd_MAIN;

{$mode objfpc}{$H+}

interface

uses in0k_hintDOC,
     in0k_hintDOC_expM0_toHTML,
     in0k_hintDOC_exp_IProHTML,
     //in0k_lazExt_hintDOC_exp_IProHTML,
in0k_hintDOC_core_Token,
    //---
     uiWnd_parseTEXT,
     uiWnd_parseTree,
     uiWnd_htmlResult,
    //---
     BasicCodeTools,

     windows,
Classes, SysUtils, FileUtil, SynMemo, Forms,      LCLProc,
  Controls, Graphics, Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type

  { Twnd_MAIN }

  Twnd_MAIN = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FontDialog1: TFontDialog;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    SynMemo1: TSynMemo;
    SynMemo2: TSynMemo;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
  protected
    procedure _lbs_spd_parse_CLR;
    procedure _lbs_spd_parse_set(inKernel,inUser:TFILETIME);
    procedure _lbs_spd_exprt_CLR;
    procedure _lbs_spd_exprt_set(inKernel,inUser:TFILETIME);
  public
    procedure SRC_Select(const sPos,sLen:longWord);
  protected
   _expCFG:rIn0k_hintDOC_expM0T0__Config;
   _expSTR:string;
    procedure _do_PARSE;
    procedure _do_Exprt;
  protected
    function  _source2parsing_(const srcText:string):string;
    procedure _srcEdt2prcEdit_;
    function  _srcEdt_getPrcT_:string;
  public
    procedure setExportSettings(var STNG:rIn0k_hintDOC_expM0T0__Config);
  public
    hintDOC_Object:tIn0k_hintDOC_Object;
    hintDOC_Parcer:tIn0k_hintDOC_Parser;
    hintDOC_toHTML:tIn0k_hintDOC_exp_IProHTML;
  end;


  //tHread


var wnd_MAIN: Twnd_MAIN;

implementation


{текст "Hint from Comment" преобразовать в "формат" HTML        <
    парсим текст по средством регулярных выражений
    @prm(sourceText исходный текст в котором пытаемся найти НАШ формат)
    @prm(inkDoc_Pos начальная позиция найденного фрагмента)
    @prm(inkDoc_len длинна найденного фрагмента)
    @prm(htmlText   результат работы функции в формате HTML)
    @ret(false критическая ошибка, НИЧЕГО не смогли поделать, или этотого фрагмента нет)
    ---
    не совсем аккуратное (в смысле кода и кода html). и вооббще, надо сделать
    нормальный парсинг и синтактическим деревом для отлова вложенных скобок.
}

//123456789_123456789_123456789_123456789_123456789_123456789_123456789_123456789_
{incDoc>- asdf asdf df dsadf ad fd
        -
sadfas asd asdf ad as
@grp(qwer asdf asdf asdf )
    @prm(qwer asdf asdf asdf )
    @prm(qwer asdf asdf asdf )
@grp(qwer asdf asdf asdf )
    @prm(qwer asdf asdf asdf )
        @val(qwer asdf asdf asdf )
        @val(qwer asdf asdf asdf )
    @prm(qwer asdf asdf asdf )
@ret(qwer asdf asdf asdf )
@exc(qwer asdf asdf asdf )
    =======
sadfas asd asdf ad as
sadfas asd asdf ad as
sadfas asd asdf ad as
sadfas asd asdf ad as
  -----
asd asd asdf
sad fasdf sadf
asdf asd
888888

<incDoc}


{$R *.lfm}

{:Reconfigure communication parameters on the fly. You must be connected to
     port before!
     @param(baud Define connection speed. Baud rate can be from 50 to 4000000
      bits per second. (it depends on your hardware!))
     @param(bits Number of bits in communication.)
     @param(parity Define communication parity (N - None, O - Odd, E - Even, M - Mark or S - Space).)
     @param(stop Define number of stopbits. Use constants @link(SB1),
      @link(SB1andHalf) and @link(SB2).)
     @param(softflow Enable XON/XOFF handshake.)
     @param(hardflow Enable CTS/RTS handshake.)}




{ Twnd_MAIN }

{Описание для примера
    @prm var1 перемнная номер раз
    @prm var2 значение задает поведение функции
        @val 1 работаем по варианту №1
        @val 2 второй вариант
    @prm var3 начальное значение

    @ret возвращает некое числовое значение
        @val >0 результат вычислений
        @val  0 нет решения
        @val -1 начальные данные не корректны

    @exc
        @val tMyEXC1 что-то пошло не так
        @val tMyEXC1 вообще все упало
    ----
    тут можно еще что-нибудь написать
}
function test(var1,var2,var3:integer):integer;
begin
    //
end;


procedure Twnd_MAIN.FormCreate(Sender: TObject);
begin
   hintDOC_Object:=tIn0k_hintDOC_Object.Create;
   hintDOC_Object.TokenStart:='<START>';
   hintDOC_Object.TokenFinal:='<fiNAL>';


   hintDOC_Parcer:=tIn0k_hintDOC_Parser.Create;
   hintDOC_toHTML:=tIn0k_hintDOC_exp_IProHTML.Create;
   //---
  _lbs_spd_exprt_CLR;
  _lbs_spd_parse_CLR;
end;

procedure Twnd_MAIN.FormDestroy(Sender: TObject);
begin
   hintDOC_toHTML.Free;
   hintDOC_Parcer.Free;
   hintDOC_Object.Free;
end;

procedure Twnd_MAIN.TabSheet2Show(Sender: TObject);
begin
   _srcEdt2prcEdit_;
end;

//------------------------------------------------------------------------------

const cTextNDF='---';

procedure Twnd_MAIN._lbs_spd_parse_CLR;
begin
    label3.Caption:=cTextNDF;
    label10.Visible:=false;
    label9 .Visible:=false;
    label8 .Visible:=false;
    label7 .Visible:=false;
    label6 .Visible:=false;
end;

procedure Twnd_MAIN._lbs_spd_parse_set(inKernel,inUser:TFILETIME);
begin
    label3 .Caption:=inttostr(inKernel.dwLowDateTime+inUser.dwLowDateTime);
    label7 .Caption:=inttostr(inKernel.dwLowDateTime);
    label9 .Caption:=inttostr(inUser  .dwLowDateTime);
    //---
    label6 .Visible:=true;
    label7 .Visible:=true;
    label8 .Visible:=true;
    label9 .Visible:=true;
    label10.Visible:=true;
end;

procedure Twnd_MAIN._lbs_spd_exprt_CLR;
begin
    label5.Caption:=cTextNDF;
    label15.Visible:=false;
    label14.Visible:=false;
    label13.Visible:=false;
    label12.Visible:=false;
    label11.Visible:=false;
end;

procedure Twnd_MAIN._lbs_spd_exprt_set(inKernel,inUser:TFILETIME);
begin
    label5 .Caption:=inttostr(inKernel.dwLowDateTime+inUser.dwLowDateTime);
    label12.Caption:=inttostr(inKernel.dwLowDateTime);
    label14.Caption:=inttostr(inUser  .dwLowDateTime);
    //---
    label11.Visible:=true;
    label12.Visible:=true;
    label13.Visible:=true;
    label14.Visible:=true;
    label15.Visible:=true;
end;

//------------------------------------------------------------------------------

// имитируем работу Lazarus`а при вытягивании комментария из исходников.
// --- вообще говоря пользуемся теми же процедурами, что должно хорошо
//     сказаться на достоверности результата
function Twnd_MAIN._source2parsing_(const srcText:string):string;
var src_Length  :integer;
    CommentStart:integer;
    NestedComments:boolean;
begin
    Result:='';
    src_Length:=length(srcText);
    if src_Length>0 then begin
        NestedComments:=true;
        CommentStart:=0;
        while CommentStart<src_Length do begin
            CommentStart:=FindNextComment(srcText,CommentStart,src_Length);
            if CommentStart<src_Length then begin
                Result:=Result+ExtractCommentContent(srcText,CommentStart, NestedComments,true,true,true)+LineEnding;
            end
            else BREAK;
            //>--
            CommentStart:=FindCommentEnd(srcText,CommentStart,NestedComments);
        end;
    end;
end;

//------------------------------------------------------------------------------

procedure Twnd_MAIN._srcEdt2prcEdit_;
begin
    SynMemo2.Text:=_source2parsing_(SynMemo1.Text);
end;

function Twnd_MAIN._srcEdt_getPrcT_:string;
begin
   _srcEdt2prcEdit_;
    result:=SynMemo2.Text;
end;

//------------------------------------------------------------------------------

type
 tMyParseTHREAD=class(TThread)
  protected
    procedure Execute; override;
  public
    constructor Create;
  end;

constructor tMyParseTHREAD.Create;
begin
    inherited  Create(false);
    FreeOnTerminate:=FALSE;
end;

procedure tMyParseTHREAD.Execute;
begin
    wnd_MAIN.hintDOC_Parcer.PARSE(wnd_MAIN.hintDOC_Object);
end;

procedure Twnd_MAIN._do_PARSE;
var parseTHREAD:tMyParseTHREAD;
__lpCT__:FILETIME;
__lpET__:FILETIME;
__lpKT__:FILETIME;
__lpUT__:FILETIME;

begin
   _lbs_spd_parse_CLR;
    uiWnd_parseTree_Clear;
    //---
    hintDOC_Object.SourceText:=_srcEdt_getPrcT_;
    //---
    parseTHREAD:=tMyParseTHREAD.Create;
    parseTHREAD.WaitFor;
    GetThreadTimes(parseTHREAD.Handle,@__lpCT__,@__lpET__,@__lpKT__,@__lpUT__);
    parseTHREAD.FREE;
   _lbs_spd_parse_set(__lpKT__,__lpUT__);
    //---
    if Assigned(hintDOC_Object) then begin
        uiWnd_parseTree_SET(hintDOC_Object);
    end;
end;

//------------------------------------------------------------------------------

type
 tMyExportTHREAD=class(TThread)
  protected
    procedure Execute; override;
  public
    constructor Create;
  end;

constructor tMyExportTHREAD.Create;
begin
    inherited  Create(false);
    FreeOnTerminate:=FALSE;
end;

procedure tMyExportTHREAD.Execute;
begin
    wnd_MAIN._expSTR:=wnd_MAIN.hintDOC_toHTML.Generate(wnd_MAIN.hintDOC_Object,@wnd_MAIN._expCFG);
end;

procedure Twnd_MAIN._do_Exprt;
var exportTHREAD:tMyExportTHREAD;
__lpCT__:FILETIME;
__lpET__:FILETIME;
__lpKT__:FILETIME;
__lpUT__:FILETIME;
begin
   _do_PARSE;
   _lbs_spd_exprt_CLR;
    setExportSettings(_expCFG);
    //---
    exportTHREAD:=tMyExportTHREAD.Create;
    exportTHREAD.WaitFor;
    GetThreadTimes(exportTHREAD.Handle,@__lpCT__,@__lpET__,@__lpKT__,@__lpUT__);
    exportTHREAD.FREE;
   _lbs_spd_exprt_set(__lpKT__,__lpUT__);

    uiWnd_htmlResult_SHOW;
    if Assigned(hintDOC_Object) then begin
        uiWnd_htmlResult_SET(_expSTR);
    end;
end;

//------------------------------------------------------------------------------

procedure Twnd_MAIN.Button1Click(Sender: TObject);
begin
   _do_PARSE;
end;

procedure Twnd_MAIN.Button2Click(Sender: TObject);
begin
   _do_PARSE;
    uiWnd_parseTree_SHOW;
    if Assigned(hintDOC_Object) then begin
        uiWnd_parseTree_SET(hintDOC_Object);
    end;
end;

procedure Twnd_MAIN.Button3Click(Sender: TObject);
begin
   _do_Exprt;
end;

procedure Twnd_MAIN.Button4Click(Sender: TObject);
begin
    uiWnd_parseText_SHOW;
end;

//------------------------------------------------------------------------------

// https://www.google.ru/design/spec/style/color.html# (400/600)




procedure Twnd_MAIN.setExportSettings(var STNG:rIn0k_hintDOC_expM0T0__Config);
begin
    In0k_hintDOC_expM0T0__Config__Init_in0k(@STNG);
end;

//------------------------------------------------------------------------------

procedure Twnd_MAIN.SRC_Select(const sPos,sLen:longWord);
var s:string;
    c:string;
ls,lc:integer;
begin //
    s:=copy(hintDOC_Object.SourceText,1,sPos);
    c:=copy(hintDOC_Object.SourceText,1+sPos,sLen);
    ls:=UTF8Length(s);
    lc:=UTF8Length(c);
    //SynMemo1.SelStart :=ls;//i;
    //SynMemo1.SelEnd   :=ls+lc;//i;
    SynMemo2.SelStart :=1+sPos;//i;
    SynMemo2.SelEnd   :=1+sPos+sLen;//i;
    //SelEnd
    //SynMemo1.SelLength:=lc;//1;//   sLen;
    PageControl1.PageIndex:=1;

end;


end.

