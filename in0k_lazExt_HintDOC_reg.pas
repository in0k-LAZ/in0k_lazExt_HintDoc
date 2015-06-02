unit in0k_lazExt_HintDOC_reg;

{$mode objfpc}{$H+}

interface

uses IDEHelpIntf, IDEHelpIntf_docFromComment, in0k_lazExt_HintDOC;

procedure Register;

implementation

procedure Register;
begin
    HelpIDE_DocFormComments_textToHTML:=@in0k_lazExt_HintDOC_TextSrcInlineDocToHTML;
end;

end.

