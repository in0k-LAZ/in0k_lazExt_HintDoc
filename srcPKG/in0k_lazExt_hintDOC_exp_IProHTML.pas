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

{$define In0k_lazExt_hintDOC_exp_IProHTML__useGlobalTABLE}

{$ifDEF In0k_lazExt_hintDOC_exp_IProHTML__useGlobalTABLE}

    {.$define In0k_lazExt_hintDOC_exp_IProHTML__showGlobalTABLE}

    {.$define In0k_lazExt_hintDOC_exp_IProHTML__GlobalTABLE_width_300}
    {$define In0k_lazExt_hintDOC_exp_IProHTML__GlobalTABLE_width_400}
    {.$define In0k_lazExt_hintDOC_exp_IProHTML__GlobalTABLE_width_500}

{$endIf}

const
    {$ifDEF In0k_lazExt_hintDOC_exp_IProHTML__showGlobalTABLE}
   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_border_='1';
    {$else}
   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_border_='0';
    {$endIf}

    {$if   DEFINED(In0k_lazExt_hintDOC_exp_IProHTML__GlobalTABLE_width_300)}
   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_width_='300';
    {$elif DEFINED(In0k_lazExt_hintDOC_exp_IProHTML__GlobalTABLE_width_500)}
   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_width_='500';
    {$else}
   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_width_='400';
    {$endIf}

   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__tableGLB_OPN_='<table border='+_cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_border_+' cellpadding=0 cellspacing=0><tr><td width='+_cTXT__In0k_lazExt_hintDOC_exp_IProHTML__table_width_+'>';
   _cTXT__In0k_lazExt_hintDOC_exp_IProHTML__tableGLB_CLS_='</td></tr></table>';


function tIn0k_lazExt_hintDOC_exp_IProHTML.execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;
begin
    {$ifDEF In0k_lazExt_hintDOC_exp_IProHTML__useGlobalTABLE}
    result:=_cTXT__In0k_lazExt_hintDOC_exp_IProHTML__tableGLB_OPN_+inherited+_cTXT__In0k_lazExt_hintDOC_exp_IProHTML__tableGLB_CLS_;
    {$else}
    result:=inherited;
    {$endIf}
end;

end.

