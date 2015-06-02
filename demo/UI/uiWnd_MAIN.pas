unit uiWnd_MAIN;

{$mode objfpc}{$H+}

interface

uses in0k_hintDOC,
     in0k_hintDOC_expM0_toHTML,
     in0k_hintDOC_exp_IProHTML,
     //in0k_lazExt_hintDOC_exp_IProHTML,
in0k_hintDOC_core_Token,

      uiWnd_parseTree,uiWnd_htmlResult, windows,
Classes, SysUtils, FileUtil, Forms,      LCLProc,
  Controls, Graphics, Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type

  { Twnd_MAIN }

  Twnd_MAIN = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
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
    Memo1: TMemo;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    hintDOC_Object.SourceText:=memo1.Text;
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

//------------------------------------------------------------------------------

procedure Twnd_MAIN.setExportSettings(var STNG:rIn0k_hintDOC_expM0T0__Config);
begin
    In0k_hintDOC_expM0T0__Config__Init(@STNG);
    //In0k_hintDOC_expM0T0_GRP__INIT(@STNG.val);
    //In0k_hintDOC_expM0T0_GRP__INIT(@STNG.prm);
    //In0k_hintDOC_expM0T0_GRP__INIT(@STNG.ret);
    //I/n0k_hintDOC_expM0T0_GRP__INIT(@STNG.exc);
    //In0k_hintDOC_expM0T0_GRP__INIT(@STNG.CMM);

    STNG.document_CAPT_BTA.befo:='<b>';
    STNG.document_CAPT_BTA.afte:='</b>';
    STNG.document_ARTC_BTA.befo:='';
    STNG.document_ARTC_BTA.afte:='';
    //---
    STNG.sections_CAPT_BTA.befo:='<font size=-2>';
    STNG.sections_CAPT_BTA.afte:='</font>';
    STNG.sections_ARTC_BTA.befo:='<font size=-2>';
    STNG.sections_ARTC_BTA.afte:='</font>';
    //---
    STNG.group_EXC.Header_Text:='<font color="#C66C8F" size="-2">&nbsp;исключения</font>';
    STNG.group_EXC.BrdLFT_clrs_single  :=$8F6CC6;
    STNG.group_EXC.GridHLine.clrs.clr00:=$8F6CC6;
    STNG.group_EXC.GridHInLN.clrs.clr00:=$8F6CC6;
    STNG.group_EXC.GridHBtwn.clrs.clr00:=$8F6CC6;
    //---
    STNG.group_PRM.Header_Text:='<font color="#8FC66C" size="1">&nbsp;параметры</font>';
    STNG.group_PRM.BrdLFT_clrs_single   :=$6CC68F;
    STNG.group_PRM.GridHLine.clrs.clr01 :=$6CC68F;
    //---
    STNG.group_RET.Header_Text:='<font color="#6C8FC6" size="-2">&nbsp;результат</font>';
    STNG.group_RET.BrdLFT_clrs_single  :=$C68F6C;
    STNG.group_RET.GridHLine.clrs.clr00:=$C68F6C;
    STNG.group_RET.GridHInLN.clrs.clr00:=$C68F6C;
    STNG.group_RET.GridHBtwn.clrs.clr00:=$C68F6C;
    //---
    STNG.group_VAL.Header_Text:='';//'<font color="#606060" size="-2">&nbsp;значения</font>';
    STNG.group_VAL.BrdLFT_clrs_single:=$606060;

    //---
    //STNG.grpCOMMON.lFT_Width:='3';
    //STNG.grpCOMMON.lFT_Color:='';
    //STNG.grpCOMMON.captCLR  :='#dddddd';
    //---
    //---
    //STNG.grpCOMMON.celLineV_width:='1';
    //STNG.grpCOMMON.celLineV_color:='#dddddd';
    //STNG.grpCOMMON.celLineG_width:='1';
    //STNG.grpCOMMON.celLineG_color:='#dddddd';

    //---
    STNG.grpCOMMON.BefoAfte_Cell.befo:='<font size="-2">';
    STNG.grpCOMMON.BefoAfte_Cell.afte:='</font>';
    //---
    STNG.grpCOMMON.BefoAfte_DEFI.befo:='<font face="Consolas" color="#333333"><b>';
    STNG.grpCOMMON.BefoAfte_DEFI.afte:='</b></font>';
    STNG.grpCOMMON.BefoAfte_DESC.befo:='';//'<font size="-2">';
    STNG.grpCOMMON.BefoAfte_DESC.afte:='';//'</font>';
    //---
    STNG.grpCOMMON.BefoAfte_CAPT.befo:='<b>';
    STNG.grpCOMMON.BefoAfte_CAPT.afte:='</b>';
    STNG.grpCOMMON.BefoAfte_ARTC.befo:='';//'<font size="-2">';
    STNG.grpCOMMON.BefoAfte_ARTC.afte:='';//'</font>';


   // STNG.grpCOMMON.BRD_Width:='5';
   // STNG.grpCOMMON.BRD_Color:='#eeeeee';


    STNG.grpCOMMON.BrdLFT_clrs_header:=clDefault;
    //-----------------
    STNG.grpCOMMON.BrdLFT_size:=3;
    STNG.grpCOMMON.BrdLFT_clrs_single:=$dddddd;
    STNG.grpCOMMON.BrdLFT_clrs_inline:=clDefault;
    //-----------------

    STNG.grpCOMMON.Border.size:=1;
    STNG.grpCOMMON.Border.clrs.color:=$aaaaaa;
    STNG.grpCOMMON.brdInL.size:=0;
    STNG.grpCOMMON.BrdInL.CLRs.color:=clDefault;

    STNG.grpCOMMON.GridVLine_size:=1;
    STNG.grpCOMMON.GridVLine_clrs_single:=$bbbbbb;
    STNG.grpCOMMON.GridVLine_clrs_inline:=$dddddd;

    STNG.grpCOMMON.GridHLine.size:=1;
    STNG.grpCOMMON.GridHLine.clrs.color:=$bbbbbb;
    STNG.grpCOMMON.GridHInLN.size:=1;
    STNG.grpCOMMON.GridHInLN.clrs.color:=$dddddd;

    STNG.grpCOMMON.GridHBtwn.size:=1;
    STNG.grpCOMMON.GridHBtwn.clrs.color:=$cccccc;

    STNG.grpCOMMON.Indent_DFND_L:=1;
    STNG.grpCOMMON.Indent_DFND_R:=1;
    STNG.grpCOMMON.Indent_DTLS_L:=1;
    STNG.grpCOMMON.Indent_DTLS_R:=1;

    STNG.grpCOMMON.Row_Color_00:=$fbfbfb;
    STNG.grpCOMMON.Row_Color_01:=$fefefe;

    {STNG.CMM.CellLV_single_width:= 1;
    STNG.CMM.CellLV_single_color:=$ee0000;
    STNG.CMM.CellLV_inline_width:= 1;
    STNG.CMM.CellLV_inline_color:=$00ee00;

    STNG.CMM.CellLH_single_pMode:= 0;
    STNG.CMM.CellLH_single_width:= 1;
    STNG.CMM.CellLH_single_color:=$0000ee;
    STNG.CMM.CellLH_inline_pMode:= 1;
    STNG.CMM.CellLH_inline_width:= 1;
    STNG.CMM.CellLH_inline_color:=$eeee00; }

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
    memo1.SelStart :=ls;//i;
    memo1.SelLength:=lc;//1;//   sLen;
end;


end.

