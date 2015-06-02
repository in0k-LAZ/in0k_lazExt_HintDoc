unit in0k_lazExt_HintDOC;

{$mode objfpc}{$H+}

interface

uses IDEHelpIntf, IDEHelpIntf_docFromComment,
    Graphics,
    in0k_hintDOC,
    in0k_lazExt_hintDOC_exp_IProHTML, in0k_hintDOC_expM0_toHTML;

function in0k_lazExt_HintDOC_TextSrcInlineDocToHTML(const Text:string; out htmlText:string):boolean;

implementation

var _Parser_:tIn0k_hintDOC_Parser;
    _Export_:tIn0k_lazExt_hintDOC_exp_IProHTML;


procedure setExportSettings(var STNG:tIn0k_lazExt_hintDOC_exp_IProHTML_SETTINGS);
begin
    In0k_hintDOC_expM0T0__Config__Init(@STNG);

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
end;

function in0k_lazExt_HintDOC_TextSrcInlineDocToHTML(const Text:string; out htmlText:string):boolean;
var hinDoc:tIn0k_hintDOC_Object;
var STNG:tIn0k_lazExt_hintDOC_exp_IProHTML_SETTINGS;
begin
    result  :=false;
    htmlText:='';
    //---
    setExportSettings(STNG);
    //---
    hinDoc:=tIn0k_hintDOC_Object.Create(Text);
   _Parser_.PARSE(hinDoc);
    htmlText:=_Export_.Generate(hinDoc,@STNG);
    //---
    hinDoc.FREE;
    //
    result:=true;
    //if result<>'' then result:=result+LineEnding;
end;

initialization
  _Parser_:=tIn0k_hintDOC_Parser.Create;
  _Export_:=tIn0k_lazExt_hintDOC_exp_IProHTML.Create;

finalization
  _Parser_.FREE;
  _Export_.FREE;
end.

