unit in0k_hintDOC;

{$mode objfpc}{$H+}

interface

uses
  in0k_hintDOC_core_Token,
  in0k_hintDOC_core_Object;

type //<------------------------------------------------------------------------
  tIn0k_himtDOC_eRAW=eInkHD_RAW;

  tIn0k_himtDOC_Item=tInkHD_ITM;
  tIn0k_himtDOC_eITM=eInkHD_ITM;

  function In0k_himtDOC_eITM__NAME(eITM:tIn0k_himtDOC_eITM):string;
  function In0k_himtDOC_eRAW__NAME(eRAW:tIn0k_himtDOC_eRAW):string;

type //<------------------------------------------------------------------------
  tIn0k_hintDOC_Object=class(tInkHDo)
  public
    property LBLs_First:pointer                read _LBLs_root;
    property LBL_next[node:pointer]:pointer    read _LBL_next;
    property LBL_CHRs[node:pointer]:string     read _LBL_CHRs;
    property LBL_CNT [node:pointer]:PtrUInt    read _LBL_Cnt;
  public
    property RAWs_First:pointer                read _RAWs_root;
    property RAW_next[node:pointer]:pointer    read _raw_next;
    property RAW_eRaw[node:pointer]:eInkHD_RAW read _raw_eRaw;
    property RAW_Pos [node:pointer]:longWord   read _raw_Pos;
    property RAW_Len [node:pointer]:longWord   read _raw_Len;
  public
    property ITMs_Root:pointer                 read _ITMs_root;
    property ITM_next[node:pointer]:pointer    read _ITM_next;
    property ITM_chld[node:pointer]:pointer    read _ITM_chld;
    property ITM_eItm[node:pointer]:eInkHD_ITM read _ITM_eItm;
    property ITM_ePRC[node:pointer]:eInkHD_PRC read _itm_get_ePRC;
    property ITM_eLXM[node:pointer]:eInkHD_RAW read _itm_LEXEME;
  end;

type //<------------------------------------------------------------------------
 tIn0k_hintDOC_Parser=class(tInkHDp);

type //<------------------------------------------------------------------------


 //rIn0k_hintDOC_ExpCXT
 rIn0k_hintDOC_ExpWRK=record {CXT}
    obj:tIn0k_hintDOC_Object; //< объект для экспорта
    cnf:pointer;              //< настройки экспорта
    cxt:pointer;              //< контекст выполнения экспорта
    R  :integer;
  end;
 pIn0k_hintDOC_ExpWRK=^rIn0k_hintDOC_ExpWRK;

 tIn0k_hintDOC_Export=class(tInkHDg)
  protected
    function ITM_next      (const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):tInkHD_ITM;
    function ITM_eItm      (const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):eInkHD_ITM;
    function ITM_CntntFirst(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):tInkHD_ITM;
    function ITM_fndInCntnt(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM; const eITM:eInkHD_ITM):tInkHD_ITM;
  protected
    procedure ITM_set_prcOK       (const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM);
  protected
    function ITM_notNil_prcNO     (const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):boolean;
    function ITM_notNil_prcNO_eITM(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM; const eITM:eInkHD_ITM):boolean;
    function ITM_haveHEADER       (const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):boolean;
  protected
    function ITM_collectStripTXT  (const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):string;
  protected
    function prepare_calc_PRC(const w:rIn0k_hintDOC_ExpWRK):boolean; virtual;
    function execute_GENerate(const w:rIn0k_hintDOC_ExpWRK):string;  virtual;
  public
    function Generate(const hintDOC:tIn0k_hintDOC_Object; const Settings:pointer):string;
  end;

implementation

{$region --- inLine DeBUG consts  - /fold}
const
  _cDeBUG_errMsg_WOBJ_nil_='w.obj==nil';
  _cDeBUG_errMsg_ITEM_nil_='ITM==nil';
{$endRegion}

function In0k_himtDOC_eRAW__NAME(eRAW:tIn0k_himtDOC_eRAW):string;
begin
    result:=in0k_hintDOC_coreRAW__Name(eRAW);
end;

function In0k_himtDOC_eITM__NAME(eITM:tIn0k_himtDOC_eITM):string;
begin
    result:=in0k_hintDOC_coreITM__Name(eITM);
end;

//<------------------------------------------------------------------------

{ @ первичная подготовка.
    провести продготовку-проверку и выяснить а стоит ли вообще запускать
    процедуру экспорта
    @ret
      @val true  возможено проведение экпорта
      @val false экспорт НЕ возможен или БЕЗсмыслелен
}
function tIn0k_hintDOC_Export.prepare_calc_PRC(const w:rIn0k_hintDOC_ExpWRK):boolean;
begin
    obj_ITMs_ndfPRC(w.obj); //< очищаем флаги обработки
    result:=FALSE;          //< говорим что генерировать НЕЧЕГО
end;

{ @ процедура ЭКСПОРТА.
    @ret документ в виде "форматированной" строки
}
function tIn0k_hintDOC_Export.execute_GENerate(const w:rIn0k_hintDOC_ExpWRK):string;
begin
    result:='';
end;

{ @ Генерировать строку для ЭКПОРТА.


}
function tIn0k_hintDOC_Export.Generate(const hintDOC:tIn0k_hintDOC_Object; const Settings:pointer):string;
var w:rIn0k_hintDOC_ExpWRK;
begin
    w.obj:=hintDOC;
    W.cnf:=Settings;
    //---
    {$ifOpt D+}
      Assert(Assigned(w.obj), _cDeBUG_errMsg_WOBJ_nil_);
    {$endIf}
    //---
    if Assigned(w.obj) and prepare_calc_PRC(W)
    then result:=execute_GENerate(W)
    else result:=''
end;

//------------------------------------------------------------------------------

{ @ Навигация по узлу.
  получить СЛЕДУЮЩИЙ узел
}
function tIn0k_hintDOC_Export.ITM_next(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=_itm_next(w.obj,itm);
end;


function tIn0k_hintDOC_Export.ITM_eItm(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):eInkHD_ITM;
begin
    result:=_itm_eItm(w.obj,itm);
end;

{ @ Навигация по узлу.
  получить ПЕРВОГО ребёнка вложенного контента (ITM_content)
}
function tIn0k_hintDOC_Export.ITM_CntntFirst(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=_itm_CntntFirst(w.obj,itm);
end;

function tIn0k_hintDOC_Export.ITM_fndInCntnt(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM; const eITM:eInkHD_ITM):tInkHD_ITM;
begin
    result:=_itm_fndInCntnt(w.obj,itm,eITM);
end;

//------------------------------------------------------------------------------

procedure tIn0k_hintDOC_Export.ITM_set_prcOK(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM);
begin
    obj_ePRC_set(w.obj,itm,PRC_OK)
end;

//------------------------------------------------------------------------------

{ @ Проверка узла.
  узел существует и еще НЕ обработан
}
function tIn0k_hintDOC_Export.ITM_notNil_prcNO(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):boolean;
begin
    result:=_itm_notNil_prcNO(w.obj,itm);
end;

{ @ Проверка узла.
  узел существует, еще НЕ обработан и соответствующего типа
}
function tIn0k_hintDOC_Export.ITM_notNil_prcNO_eITM(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM; const eITM:eInkHD_ITM):boolean;
begin
    result:=_itm_notNil_prcNO_eITM(w.obj,itm,eITM);
end;

{ @ Проверка узла.
  внутри узла присутствует eITM_caption или eITM_article
}
function tIn0k_hintDOC_Export.ITM_haveHEADER(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):boolean;
begin
    result:=_itm_haveHEADER(w.obj,itm);
end;

function tIn0k_hintDOC_Export.ITM_collectStripTXT(const w:rIn0k_hintDOC_ExpWRK; const itm:tInkHD_ITM):string;
begin
    result:=obj_collectStripTXT(w.obj,itm);
end;

end.

