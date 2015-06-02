unit in0k_lazExt_hintDOC_exp_IProHTML;

{$mode objfpc}{$H+}

interface

uses in0k_hintDOC, in0k_hintDOC_expM0_toHTML, in0k_hintDOC_core_Token, in0k_hintDOC_exp_IProHTML;

type

 tIn0k_lazExt_hintDOC_exp_IProHTML_SETTINGS=rIn0k_hintDOC_expM0T0__Config;

 tIn0k_lazExt_hintDOC_exp_IProHTML=class(tIn0k_hintDOC_exp_IProHTML_core)
  protected
    // перебиваем РОДИЕТЕЛЯ для НАШЕЙ генерации
    function execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string; OVERRIDE;
  end;

implementation

function tIn0k_lazExt_hintDOC_exp_IProHTML.execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;
begin
    result:=inherited;
end;

end.

