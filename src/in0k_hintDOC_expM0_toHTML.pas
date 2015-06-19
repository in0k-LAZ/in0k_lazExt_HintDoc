unit in0k_hintDOC_expM0_toHTML;

{$mode objfpc}{$H+}

{$define In0k_hintDOC_expM0T0_EOL}

{

    |0|1| 2 |3|4|5| 6 |7|8|
    |0|1|     4.1     |7|8|

     0 - цветная полоска (линия СЕТКИ)
     1 - отступ слева               paddng_defi_L
     2 - ОПРЕДЕЛЕНИЕ                defi
     3 - отступ справа              paddng_defi_R
     4 - вертикальная линия СЕТКИ
     5 - отступ слева               paddng_desc_L
     6 - ОПИСАНИЕ                   desc
     7 - отступ справа              paddng_desc_R
     8 - линия СЕТКИ

}



interface

uses Graphics, sysutils, strutils, in0k_hintDOC, in0k_hintDOC_core_Token,
    in0k_hintDOC_export_Mode0;


{%region --- настройти для ЭКСПОРТА ------------------------------ /fold }
type

  // ОБОрачивалка для текста
 rIn0k_hintDOC_expM0T0__BTA=record
    befo:string;
    afte:string;
  end;
 pIn0k_hintDOC_expM0T0__BTA=^rIn0k_hintDOC_expM0T0__BTA;

 // настройки: линии сетки таблици ТИП#00
 rIn0k_hintDOC_expM0T0__grpBrd00=record
    width:integer; //< ширина линии
    color:TColor;  //< ОСНОВНОЙ цвет линии
    clr00:TColor;  //< цвет линии для ВЛОЖЕННОЙ
 end;
 pIn0k_hintDOC_expM0T0__grpBrd00=^rIn0k_hintDOC_expM0T0__grpBrd00;

 rIn0k_hintDOC_expM0T0__8CLRs=record
    color:TColor;  //< ОСНОВНОЙ цвет линии (по умолчанию)
    clr00:TColor;  //< [col#0]
    clr01:TColor;  //< [col#1]
    clr02:TColor;  //< [col#2]
    clr03:TColor;  //< [col#3]
    clr04:TColor;  //< [col#4]
    clr05:TColor;  //< [col#5]
    clr06:TColor;  //< [col#6]
    clr07:TColor;  //< [col#7]
    clr08:TColor;  //< [col#8]
 end;
 pIn0k_hintDOC_expM0T0__8CLRs=^rIn0k_hintDOC_expM0T0__8CLRs;

  // настройки: линии сетки таблици ТИП#01
 rIn0k_hintDOC_expM0T0__8GBrd=record
    size:integer; //< ширина линии
    clrs:rIn0k_hintDOC_expM0T0__8CLRs;
 end;
 pIn0k_hintDOC_expM0T0__8GBrd=^rIn0k_hintDOC_expM0T0__8GBrd;

  // настройка для таблици
 rIn0k_hintDOC_expM0T0__GRP=record
    //<--- Заголовок
    Header_Text:string;

    //<--- граница таблици (РАМКА)
    Border     :rIn0k_hintDOC_expM0T0__8GBrd;
    BrdInL     :rIn0k_hintDOC_expM0T0__8GBrd;

    //<--- "Левая ПОЛОСКА" таблици [col#0]
    BrdLFT_size       :integer; //< ширина левой полоски
    BrdLFT_clrs_single:tColor;  //< основной цвет
    BrdLFT_clrs_header:tColor;  //< цвет в шапке
    BrdLFT_clrs_inline:tColor;  //< цвет для inLine

    //<--- "вертикальная линия сетки" [col#4]
    GridVLine_size       :integer;
    GridVLine_clrs_single:TColor;
    GridVLine_clrs_inline:TColor;

    //<--- "горизонтальная линия сетки"
    GridHLine:rIn0k_hintDOC_expM0T0__8GBrd; //< между строками ОСНОВНОЙ
    GridHBtwn:rIn0k_hintDOC_expM0T0__8GBrd; //< между ОСНОВНОЙ и ВЛОЖЕННОЙ
    GridHInLN:rIn0k_hintDOC_expM0T0__8GBrd; //< между строками ВЛОЖЕННОЙ

    //<--- цветовая диференцация строк
    Row_Color_00:tColor;
    Row_Color_01:tColor;

    //<--- отступы
    Indent_DFND_L:integer;  //< [col#1]
    Indent_DFND_R:integer;  //< [col#3]
    Indent_DTLS_L:integer;  //< [col#5]
    Indent_DTLS_R:integer;  //< [col#7]

    //<--- оборотки для текстов
    BefoAfte_Cell:rIn0k_hintDOC_expM0T0__BTA;
    //---
    BefoAfte_DEFI:rIn0k_hintDOC_expM0T0__BTA;
    BefoAfte_DESC:rIn0k_hintDOC_expM0T0__BTA;
    BefoAfte_CAPT:rIn0k_hintDOC_expM0T0__BTA;
    BefoAfte_ARTC:rIn0k_hintDOC_expM0T0__BTA;
 end;
 pIn0k_hintDOC_expM0T0__GRP=^rIn0k_hintDOC_expM0T0__GRP;

 rIn0k_hintDOC_expM0T0__Config=record
    document_CAPT_BTA:rIn0k_hintDOC_expM0T0__BTA;
    document_ARTC_BTA:rIn0k_hintDOC_expM0T0__BTA;
    sections_CAPT_BTA:rIn0k_hintDOC_expM0T0__BTA;
    sections_ARTC_BTA:rIn0k_hintDOC_expM0T0__BTA;
    //---
    grpCOMMON:rIn0k_hintDOC_expM0T0__GRP; //<
    group_EXC:rIn0k_hintDOC_expM0T0__GRP;
    group_PRM:rIn0k_hintDOC_expM0T0__GRP;
    group_RET:rIn0k_hintDOC_expM0T0__GRP;
    group_VAL:rIn0k_hintDOC_expM0T0__GRP;
 end;
 pIn0k_hintDOC_expM0T0__Config=^rIn0k_hintDOC_expM0T0__Config;

procedure In0k_hintDOC_expM0T0__Config__Init(const value:pIn0k_hintDOC_expM0T0__Config);

procedure In0k_hintDOC_expM0T0__Config__Init_in0k(const value:pIn0k_hintDOC_expM0T0__Config);


{%endregion}

type

 tIn0k_hintDOC_expM0T0=class(tIn0k_hintDOC_expM0)
  protected
    function itemGRP_inline_(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item):boolean;
    function itemGRP_single_(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item):boolean;
  protected
    {%region --- работа с КОНФИГУРАЦИЕЙ -------------------------- /fold }
  protected
    function CfgGrp_COMMON(const W:rIn0k_hintDOC_ExpWRK):pIn0k_hintDOC_expM0T0__GRP;
    function CfgGrp_itmGRP(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer):pIn0k_hintDOC_expM0T0__GRP;
  protected         //cerrent
                   // actual

    function cfgGRP_Header_Title(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
    function cfgGRP_BrdHDR_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):tColor; overload;
    function cfgGRP_BrdHDR_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):tColor; overload;
  protected
    function cfgGRP_Border_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):integer; overload;
    function cfgGRP_Border_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):integer; overload;
    function cfgGRP_Border_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GroupIs_InLine:boolean):tColor; overload;
    function cfgGRP_Border_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GRP:tIn0k_himtDOC_Item):tColor; overload;
    function cfgGRP_BrdLFT_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
    function cfgGRP_BrdLFT_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):tColor; overload;
    function cfgGRP_BrdLFT_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):tColor; overload;
  protected
    function cfgGRP_Grid_V_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
    function cfgGRP_Grid_V_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):tColor; overload;
    function cfgGRP_Grid_V_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):tColor; overload;
  protected
    function cfgGRP_Grid_H_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):integer; overload;
    function cfgGRP_Grid_H_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):integer; overload;
    function cfgGRP_Grid_H_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GroupIs_InLine:boolean):tColor; overload;
    function cfgGRP_Grid_H_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GRP:tIn0k_himtDOC_Item):tColor; overload;
  protected
    function cfgGRP_Grid_B_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
    function cfgGRP_Grid_B_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte):tColor;
  protected
    function cfgGRP_Row_BG_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:integer):tColor;
  protected
    function cfgGRP_Indnt_DFND_L(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
    function cfgGRP_Indnt_DFND_R(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
    function cfgGRP_Indnt_DTLS_L(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
    function cfgGRP_Indnt_DTLS_R(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
  {%endregion}
  protected
    function Text_to_HTML(const text:string):string;
  protected
    function getText_NODE_CA_CAPTION(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function getText_NODE_CA_ARTICLE(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  protected
    function getText_NODE_DD_DEFINED(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function getText_NODE_DD_DETAILS(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  protected
    function getText_sctnPAR_Caption(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function getText_sctnPAR_Article(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  protected
    function getText_docHEAD_Caption(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function getText_docHEAD_Article(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  protected // перебиваем РОДИЕТЕЛЯ для НАШЕЙ генерации
    function  execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;   OVERRIDE;
  end;


implementation

{%region --- настройти для ЭКСПОРТА ------------------------------ /fold }

procedure In0k_hintDOC_expM0T0__BTA__Init(const value:pIn0k_hintDOC_expM0T0__BTA);
begin
    with value^ do begin
        befo:='';
        afte:='';
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure In0k_hintDOC_expM0T0__8CLRs__Init(const value:pIn0k_hintDOC_expM0T0__8CLRs);
begin
    with value^ do begin
        color:=clDefault;
        clr00:=color;
        clr01:=color;
        clr02:=color;
        clr03:=color;
        clr04:=color;
        clr05:=color;
        clr06:=color;
        clr07:=color;
        clr08:=color;
    end;
end;

function In0k_hintDOC_expM0T0__8CLRs__getColor(const value:rIn0k_hintDOC_expM0T0__8CLRs):tColor;
begin
    result:=value.color;
end;

function In0k_hintDOC_expM0T0__8CLRs__getClrNN(const value:rIn0k_hintDOC_expM0T0__8CLRs; const NN:byte):tColor;
begin
    with value do begin
        case NN of
          0: result:=clr00;
          1: result:=clr01;
          2: result:=clr02;
          3: result:=clr03;
          4: result:=clr04;
          5: result:=clr05;
          6: result:=clr06;
          7: result:=clr07;
          8: result:=clr08;
        else result:=color;
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure In0k_hintDOC_expM0T0__8GBrd__Init(const value:pIn0k_hintDOC_expM0T0__8GBrd);
begin
    with value^ do begin
        size:=-1;
        In0k_hintDOC_expM0T0__8CLRs__Init(@clrs);
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure In0k_hintDOC_expM0T0__GRP__Init(const value:pIn0k_hintDOC_expM0T0__GRP);
begin
    with value^ do begin
        Header_Text:='';
        //---
        In0k_hintDOC_expM0T0__8GBrd__Init(@Border);
        In0k_hintDOC_expM0T0__8GBrd__Init(@BrdInL);
        //---
        BrdLFT_size       :=-1;
        BrdLFT_clrs_single:=clDefault;
        BrdLFT_clrs_header:=clDefault;
        BrdLFT_clrs_inline:=clDefault;
        //---
        GridVLine_size       :=-1;
        GridVLine_clrs_single:=clDefault;
        GridVLine_clrs_inline:=clDefault;
        //---
        In0k_hintDOC_expM0T0__8GBrd__Init(@GridHLine);
        In0k_hintDOC_expM0T0__8GBrd__Init(@GridHBtwn);
        In0k_hintDOC_expM0T0__8GBrd__Init(@GridHInLN);
        //---
        Row_Color_00:=clDefault;
        Row_Color_01:=clDefault;
        //---
        Indent_DFND_L:=-1;
        Indent_DFND_R:=-1;
        Indent_DTLS_L:=-1;
        Indent_DTLS_R:=-1;
        //<--- оборотки для текстов
        In0k_hintDOC_expM0T0__BTA__Init(@BefoAfte_Cell);
        In0k_hintDOC_expM0T0__BTA__Init(@BefoAfte_DEFI);
        In0k_hintDOC_expM0T0__BTA__Init(@BefoAfte_DESC);
        In0k_hintDOC_expM0T0__BTA__Init(@BefoAfte_CAPT);
        In0k_hintDOC_expM0T0__BTA__Init(@BefoAfte_ARTC);
    end;
end;

procedure In0k_hintDOC_expM0T0__Config__Init(const value:pIn0k_hintDOC_expM0T0__Config);
begin
    with value^ do begin
        In0k_hintDOC_expM0T0__BTA__Init(@document_CAPT_BTA);
        In0k_hintDOC_expM0T0__BTA__Init(@document_CAPT_BTA);
        In0k_hintDOC_expM0T0__BTA__Init(@document_ARTC_BTA);
        In0k_hintDOC_expM0T0__BTA__Init(@sections_CAPT_BTA);
        In0k_hintDOC_expM0T0__BTA__Init(@sections_ARTC_BTA);
        //---
        In0k_hintDOC_expM0T0__GRP__Init(@grpCOMMON);
        In0k_hintDOC_expM0T0__GRP__Init(@group_EXC);
        In0k_hintDOC_expM0T0__GRP__Init(@group_PRM);
        In0k_hintDOC_expM0T0__GRP__Init(@group_RET);
        In0k_hintDOC_expM0T0__GRP__Init(@group_VAL);
    end;
end;

procedure In0k_hintDOC_expM0T0__Config__Init_in0k(const value:pIn0k_hintDOC_expM0T0__Config);
begin
    In0k_hintDOC_expM0T0__Config__Init(value);
    //---
    value^.document_CAPT_BTA.befo:='<b>';
    value^.document_CAPT_BTA.afte:='</b>';
    value^.document_ARTC_BTA.befo:='';
    value^.document_ARTC_BTA.afte:='';
    //---
    value^.sections_CAPT_BTA.befo:='<font size=-2>';
    value^.sections_CAPT_BTA.afte:='</font>';
    value^.sections_ARTC_BTA.befo:='<font size=-2>';
    value^.sections_ARTC_BTA.afte:='</font>';
    //---
    value^.group_EXC.Header_Text:='<font color="#F4511E" size="-2">&nbsp;<b>исключения</b></font>';
    value^.group_EXC.BrdLFT_clrs_single  :=$FF7043;
    value^.group_EXC.GridHLine.clrs.clr00:=$FF7043;
    value^.group_EXC.GridHInLN.clrs.clr00:=$FF7043;
    value^.group_EXC.GridHBtwn.clrs.clr00:=$FF7043;
    value^.group_EXC.BefoAfte_DEFI.befo:='<font face="Consolas" color="#BF360C"><b>';
    value^.group_EXC.BefoAfte_DEFI.afte:='</b></font>';
    //---
    value^.group_PRM.Header_Text:='<font color="#43A047" size="1">&nbsp;<b>параметры</b></font>';
    value^.group_PRM.BrdLFT_clrs_single   :=$66BB6A;
    value^.group_PRM.GridHLine.clrs.clr01 :=$66BB6A;
    value^.group_PRM.BefoAfte_DEFI.befo:='<font face="Consolas" color="#1B5E20"><b>';
    value^.group_PRM.BefoAfte_DEFI.afte:='</b></font>';
    //---
    value^.group_RET.Header_Text:='<font color="#039BE5" size="-2">&nbsp;<b>результат</b></font>';
    value^.group_RET.BrdLFT_clrs_single  :=$29B6F6;
    value^.group_RET.GridHLine.clrs.clr00:=$29B6F6;
    value^.group_RET.GridHInLN.clrs.clr00:=$29B6F6;
    value^.group_RET.GridHBtwn.clrs.clr00:=$29B6F6;
    value^.group_RET.BefoAfte_DEFI.befo:='<font face="Consolas" color="#01579B"><b>';
    value^.group_RET.BefoAfte_DEFI.afte:='</b></font>';
    //---
    value^.group_VAL.Header_Text:='';//'<font color="#606060" size="-2">&nbsp;значения</font>';
    value^.group_VAL.BrdLFT_clrs_single:=$8D6E63;
    value^.group_VAL.BefoAfte_DEFI.befo:='<font face="Consolas" color="#4E342E"><b>';
    value^.group_VAL.BefoAfte_DEFI.afte:='</b></font>';
    //---
    value^.grpCOMMON.BefoAfte_Cell.befo:='<font size="-2">';
    value^.grpCOMMON.BefoAfte_Cell.afte:='</font>';
    //---
    value^.grpCOMMON.BefoAfte_DEFI.befo:='<font face="Consolas" color="#333333"><b>';
    value^.grpCOMMON.BefoAfte_DEFI.afte:='</b></font>';
    value^.grpCOMMON.BefoAfte_DESC.befo:='';//'<font size="-2">';
    value^.grpCOMMON.BefoAfte_DESC.afte:='';//'</font>';
    //---
    value^.grpCOMMON.BefoAfte_CAPT.befo:='<b>';
    value^.grpCOMMON.BefoAfte_CAPT.afte:='</b>';
    value^.grpCOMMON.BefoAfte_ARTC.befo:='';//'<font size="-2">';
    value^.grpCOMMON.BefoAfte_ARTC.afte:='';//'</font>';

    value^.grpCOMMON.BrdLFT_clrs_header:=clDefault;
    //-----------------
    value^.grpCOMMON.BrdLFT_size:=3;
    value^.grpCOMMON.BrdLFT_clrs_single:=$dddddd;
    value^.grpCOMMON.BrdLFT_clrs_inline:=clDefault;
    //-----------------

    value^.grpCOMMON.Border.size:=1;
    value^.grpCOMMON.Border.clrs.color:=$aaaaaa;
    value^.grpCOMMON.brdInL.size:=0;
    value^.grpCOMMON.BrdInL.CLRs.color:=clDefault;

    value^.grpCOMMON.GridVLine_size:=1;
    value^.grpCOMMON.GridVLine_clrs_single:=$bbbbbb;
    value^.grpCOMMON.GridVLine_clrs_inline:=$dddddd;

    value^.grpCOMMON.GridHLine.size:=1;
    value^.grpCOMMON.GridHLine.clrs.color:=$bbbbbb;
    value^.grpCOMMON.GridHInLN.size:=1;
    value^.grpCOMMON.GridHInLN.clrs.color:=$dddddd;

    value^.grpCOMMON.GridHBtwn.size:=1;
    value^.grpCOMMON.GridHBtwn.clrs.color:=$cccccc;

    value^.grpCOMMON.Indent_DFND_L:=1;
    value^.grpCOMMON.Indent_DFND_R:=1;
    value^.grpCOMMON.Indent_DTLS_L:=1;
    value^.grpCOMMON.Indent_DTLS_R:=1;

    value^.grpCOMMON.Row_Color_00:=$fbfbfb;
    value^.grpCOMMON.Row_Color_01:=$fefefe;
end;

{%endregion}


{%region --- tIn0k_hintDOC_expM0T0 -------------------------------- /fold}

function tIn0k_hintDOC_expM0T0.itemGRP_inline_(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item):boolean;
var tmp:tIn0k_himtDOC_Item;
begin
    result:=false;
    //---
    tmp:=obj_item_getParent_itmNODE(w.obj,i_Node);
    if Assigned(tmp) then begin
        if obj_item_NODE_Type(w.obj,tmp)=itmNODE_hasCA then begin
            result:=true;
        end;
    end;
end;

function tIn0k_hintDOC_expM0T0.itemGRP_single_(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item):boolean;
begin
    result:=not itemGRP_inline_(W,i_Node);
end;


{%region --- _CONFIG_ -------------------------------- /fold}

{$ifOpt D+}
const
  _cDebugMSG__W_C__isNIL='w.cnf===nil';
  _cDebugMSG__W_O__isNIL='w.obj===nil';
  _cDebugMSG__CFG__isNIL='CFG===nil';
  _cDebugMSG__GRP__isNIL='CFG===nil';
{$endIf}

{получить ОБЩИЕ настройки для таблиц}
function tIn0k_hintDOC_expM0T0.CfgGrp_COMMON(const W:rIn0k_hintDOC_ExpWRK):pIn0k_hintDOC_expM0T0__GRP;
begin
    {$ifOpt D+}
      Assert(Assigned(w.cnf),_cDebugMSG__W_C__isNIL);
    {$endIf}
    result:=@(pIn0k_hintDOC_expM0T0__Config(w.cnf)^.grpCOMMON);
end;

{получить настройки для таблици КОНКРЕТНОГО типа}
function tIn0k_hintDOC_expM0T0.CfgGrp_itmGRP(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer):pIn0k_hintDOC_expM0T0__GRP;
var tmpRAW:tIn0k_himtDOC_eRAW;
begin
    result:=nil;
    //--- определяем что это и какого типа
    if _itm_eItm(w.obj,itmGRP)=ITM_SCTN then tmpRAW:=_itm_SCTN_NODEs(w.obj,itmGRP)
    else tmpRAW:=_itm_NODE_eRAW(w.obj,itmGRP);
    //--- берем соответ настройку
    case tmpRAW of
        eRAW_tkn_EXC: result:=@(pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_EXC);
        eRAW_tkn_PRM: result:=@(pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_PRM);
        eRAW_tkn_RET: result:=@(pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_RET);
        eRAW_tkn_VAL: result:=@(pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_VAL);
    end;
end;

//------------------------------------------------------------------------------

{ Заголовок таблици
  --- текст, который должен содержаться в ЗАГОЛОВКЕ
}
function tIn0k_hintDOC_expM0T0.cfgGRP_Header_Title(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
begin
    result:=CFG^.Header_Text;
    if result='' then begin
        result:=CfgGrp_COMMON(W)^.Header_Text;
    end;
end;

{ Заголовок таблици
  --- цвет ЛЕвОЙ полоски [col#0]
}
function tIn0k_hintDOC_expM0T0.cfgGRP_BrdHDR_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if GroupIs_InLine then begin
        if result=clDefault then result:=             CFG^.BrdLFT_clrs_header;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.BrdLFT_clrs_header;
    end;
        if result=clDefault then result:=             CFG^.BrdLFT_clrs_single;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.BrdLFT_clrs_single;
end;

{ Заголовок таблици
  --- цвет ЛЕвОЙ полоски [col#0]
}
function tIn0k_hintDOC_expM0T0.cfgGRP_BrdHDR_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_BrdHDR_Color(W,CFG,itemGRP_inline_(W,GRP));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{граница таблици: ширина линии}
function tIn0k_hintDOC_expM0T0.cfgGRP_Border_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if GroupIs_InLine then begin
        if result=-1 then result:=             CFG^.BrdInL.size;
        if result=-1 then result:=CfgGrp_COMMON(W)^.BrdInL.size;
    end;
        if result=-1 then result:=             CFG^.Border.size;
        if result=-1 then result:=CfgGrp_COMMON(W)^.Border.size;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Border_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_Border_Width(W,CFG,itemGRP_inline_(W,GRP));
end;

{граница таблици: цвет линии}
function tIn0k_hintDOC_expM0T0.cfgGRP_Border_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GroupIs_InLine:boolean):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if GroupIs_InLine then begin
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(             CFG^.BrdInL.CLRs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(             CFG^.BrdInL.CLRs);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(CfgGrp_COMMON(W)^.BrdInL.CLRs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(CfgGrp_COMMON(W)^.BrdInL.CLRs);
    end;
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(             CFG^.Border.clrs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(             CFG^.Border.clrs);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(CfgGrp_COMMON(W)^.Border.clrs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(CfgGrp_COMMON(W)^.Border.clrs);
end;

{граница таблици: цвет линии}
function tIn0k_hintDOC_expM0T0.cfgGRP_Border_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GRP:tIn0k_himtDOC_Item):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_Border_ClrNN(W,CFG,idx,itemGRP_inline_(W,GRP));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{граница таблици: ширина ПОлоски СЛЕВА}
function tIn0k_hintDOC_expM0T0.cfgGRP_BrdLFT_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=              CFG^.BrdLFT_size;
    if result=-1 then result:=CfgGrp_COMMON(W)^.BrdLFT_size;
end;

{граница таблици: цвет ПОлоски СЛЕВА}
function tIn0k_hintDOC_expM0T0.cfgGRP_BrdLFT_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if GroupIs_InLine then begin
        if result=clDefault then result:=             CFG^.BrdLFT_clrs_inline;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.BrdLFT_clrs_inline;
    end;
        if result=clDefault then result:=             CFG^.BrdLFT_clrs_single;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.BrdLFT_clrs_single;
end;

{граница таблици: цвет ПОлоски СЛЕВА}
function tIn0k_hintDOC_expM0T0.cfgGRP_BrdLFT_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_BrdLFT_Color(W,CFG,itemGRP_inline_(W,GRP));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_V_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=             CFG^.GridVLine_size;
    if result=-1 then result:=CfgGrp_COMMON(W)^.GridVLine_size;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_V_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if GroupIs_InLine then begin
        if result=clDefault then result:=             CFG^.GridVLine_clrs_inline;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.GridVLine_clrs_inline;
    end;
        if result=clDefault then result:=             CFG^.GridVLine_clrs_single;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.GridVLine_clrs_single;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_V_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_Grid_V_Color(W,CFG,itemGRP_inline_(W,GRP));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_H_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GroupIs_InLine:boolean):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if GroupIs_InLine then begin
        if result=-1 then result:=             CFG^.GridHInLN.size;
        if result=-1 then result:=CfgGrp_COMMON(W)^.GridHInLN.size;
    end
    else begin
        if result=-1 then result:=             CFG^.GridHLine.size;
        if result=-1 then result:=CfgGrp_COMMON(W)^.GridHLine.size;
    end;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_H_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_Grid_H_Width(W,CFG,itemGRP_inline_(W,GRP))
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_H_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GroupIs_InLine:boolean):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if GroupIs_InLine then begin
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(             CFG^.GridHInLN.clrs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(             CFG^.GridHInLN.clrs);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(CfgGrp_COMMON(W)^.GridHInLN.clrs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(CfgGrp_COMMON(W)^.GridHInLN.clrs);
    end;
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(             CFG^.GridHLine.clrs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(             CFG^.GridHLine.clrs);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(CfgGrp_COMMON(W)^.GridHLine.clrs,idx);
        if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(CfgGrp_COMMON(W)^.GridHLine.clrs);
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_H_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte; const GRP:tIn0k_himtDOC_Item):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
      Assert(Assigned(GRP),_cDebugMSG__GRP__isNIL);
    {$endIf}
    result:=cfgGRP_Grid_H_ClrNN(W,CFG,idx,itemGRP_inline_(W,GRP));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_B_Width(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=             CFG^.GridHBtwn.size;
    if result=-1 then result:=CfgGrp_COMMON(W)^.GridHBtwn.size;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Grid_B_ClrNN(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:byte):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(             CFG^.GridHBtwn.clrs,idx);
    if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(             CFG^.GridHBtwn.clrs);
    if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getClrNN(CfgGrp_COMMON(W)^.GridHBtwn.clrs,idx);
    if result=clDefault then result:=In0k_hintDOC_expM0T0__8CLRs__getColor(CfgGrp_COMMON(W)^.GridHBtwn.clrs);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{фоновый цвет строки}
function tIn0k_hintDOC_expM0T0.cfgGRP_Row_BG_Color(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const idx:integer):tColor;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=clDefault;
    if (idx and $01)=$01 then begin
        if result=clDefault then result:=             CFG^.Row_Color_01;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.Row_Color_01;
    end
    else begin
        if result=clDefault then result:=             CFG^.Row_Color_00;
        if result=clDefault then result:=CfgGrp_COMMON(W)^.Row_Color_00;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0T0.cfgGRP_Indnt_DFND_L(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=             CFG^.Indent_DFND_L;
    if result=-1 then result:=CfgGrp_COMMON(W)^.Indent_DFND_L;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Indnt_DFND_R(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=             CFG^.Indent_DTLS_R;
    if result=-1 then result:=CfgGrp_COMMON(W)^.Indent_DTLS_R;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Indnt_DTLS_L(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=             CFG^.Indent_DTLS_L;
    if result=-1 then result:=CfgGrp_COMMON(W)^.Indent_DTLS_L;
end;

function tIn0k_hintDOC_expM0T0.cfgGRP_Indnt_DTLS_R(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):integer;
begin
    {$ifOpt D+}
      Assert(Assigned(CFG),_cDebugMSG__CFG__isNIL);
    {$endIf}
    result:=-1;
    if result=-1 then result:=             CFG^.Indent_DTLS_R;
    if result=-1 then result:=CfgGrp_COMMON(W)^.Indent_DTLS_R;
end;

{%endregion}



function tIn0k_hintDOC_expM0T0.Text_to_HTML(const text:string):string;
begin
    result:=text;
    result:=AnsiReplaceStr(result,'&','&amp;');
    result:=AnsiReplaceStr(result,'<','&lt;');
    result:=AnsiReplaceStr(result,'>','&gt;');
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0T0.getText_NODE_CA_CAPTION(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.getText_NODE_CA_ARTICLE(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.getText_NODE_DD_DEFINED(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.getText_NODE_DD_DETAILS(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.gettext_sctnPAR_Caption(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.gettext_sctnPAR_Article(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.getText_docHEAD_Caption(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

function tIn0k_hintDOC_expM0T0.getText_docHEAD_Article(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:pointer; const contEXT:pointer):string;
begin
    result:=Text_to_HTML(inherited);
end;

{%endregion}

function tIn0k_hintDOC_expM0T0.execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;
begin
    {$ifOpt D+}
      Assert(Assigned(w.cnf),_cDebugMSG__W_C__isNIL);
    {$endIf}
    result:=inherited;
end;

end.

