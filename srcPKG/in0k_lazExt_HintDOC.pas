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
    In0k_hintDOC_expM0T0__Config__Init_in0k(@STNG);
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
end;

initialization
  _Parser_:=tIn0k_hintDOC_Parser.Create;
  _Export_:=tIn0k_lazExt_hintDOC_exp_IProHTML.Create;

finalization
  _Parser_.FREE;
  _Export_.FREE;
end.

