unit in0k_hintDOC_core_Object;
(*
        +-+-+--+-+-+
        | hint DOC |
        +-+-+--+-+-+
*)
{$mode objfpc}{$H+}

interface

uses LazUTF8, sysutils, {strutils,} in0k_hintDOC_core_Token, in0k_hintDOC_core_Finder;

type

 eInkHD_RAW=tIn0k_hintDOC_core_eRAW;
 eInkHD_ITM=tIn0k_hintDOC_core_eItm;
 eInkHD_PRC=tIn0k_hintDOC_ePRC;
 tInkHD_RAW=pointer;
 tInkHD_ITM=pointer;
 tInkHD_LBL=pointer;

 tInkHDO=class
  private //< это все во время работы используется
   _wrk_rawNodes:tInkHD_RAW;    //< список первичных разделений
   _wrk_itmNodes:tInkHD_ITM;    //< список первичных разделений
   _wrk_lblNodes:tInkHD_LBL;    //< список найденных метокТокенов
   _wrk_tknLabel:string;        //< рабочая МеткаТокена
   //_wrk_StartPOS:longWord;      //< позиция НАЧАЛА разбора
   //_wrk_FinalPOS:longWord;      //< позиция ЗАВЕРШЕНИЯ разбора
  private
   _wrk_parsed  :boolean;       //< оно ОТПАРСЕНО
    procedure _CLR_WRK_;  //< очистить ВСЕ что наработали
  protected
    //function _wrk_StartFinal_isVAlid:boolean;

  {%region --- работа с очередью LBLs ----------------------------- /fold}
  strict private //< работа с "список первичных разделений"
    procedure _wrk_LBLs_INiT;
    procedure _wrk_LBLs_CLR;
    procedure _wrk_LBLs_ordINS(const node:pointer);
  protected
    procedure _wrk_LBLs_reOrde;
    procedure _wrk_LBLs_addLBL(const text:string);
    function  _wrk_LBLs_getMAX:string;
  protected
    function  _LBLs_root:pointer; //< получить указател на НАЧАЛО очереди
  protected //< свойства конкретного узла
    function  _LBL_next(const node:pointer):pointer;
    function  _LBL_CHRs(const node:pointer):string;
    function  _LBL_Cnt (const node:pointer):PtrUInt;
  {%endregion}
  {%region --- работа с очередью RAWs ----------------------------- /fold}
  strict private
    procedure _wrk_RAWs_INiT;
    procedure _wrk_RAWs_CLR;
  private //< работа с "список первичных разделений"
    function  _wrk_RAWs_TST(const pos,len:longWord; const eRaw:eInkHD_RAW):tInkHD_RAW;
    function  _wrk_RAWs_ADD(const pos,len:longWord; const eRaw:eInkHD_RAW):tInkHD_RAW;
    function  _wrk_RAWs_CLP(const node:tInkHD_RAW; const cliplen:longWord):tInkHD_RAW;
    function  _wrk_RAWs_CLP_start(const node:tInkHD_RAW; const clipPOS:longWord; const newERaw:eInkHD_RAW):tInkHD_RAW; overload;
    function  _wrk_RAWs_CLP_start(const node:tInkHD_RAW; const clipPOS:longWord                          ):tInkHD_RAW; overload;
    function  _wrk_RAWs_CLP_final(const node:tInkHD_RAW; const clipPOS:longWord; const newERaw:eInkHD_RAW):tInkHD_RAW; overload;
    function  _wrk_RAWs_CLP_final(const node:tInkHD_RAW; const clipPOS:longWord                          ):tInkHD_RAW; overload;
  protected
    function  _RAWs_root:pointer; //< получить указател на НАЧАЛО очереди
  protected //< свойства конкретного узла
    function  _raw_next(const node:tInkHD_RAW):tInkHD_RAW; inline;
    function  _raw_Pos (const node:tInkHD_RAW):longWord;   inline;
    function  _raw_Len (const node:tInkHD_RAW):longWord;   inline;
    function  _raw_eRaw(const node:tInkHD_RAW):eInkHD_RAW; //inline;
    function  _raw_gVAL(const node:tInkHD_RAW):boolean;    //< группа для ЗНАЧЕНИЙ
  {%endregion}
  {%region --- работа с деревом ITMs ------------------------------ /fold}
  strict private
    procedure _wrk_ITMs_INiT;
    procedure _wrk_ITMs_clrDST(var itm:tInkHD_ITM);
    procedure _wrk_ITMs_CLR;
  private
    procedure _wrk_ITMs_setPRC(const itm:tInkHD_ITM; const value:tIn0k_hintDOC_ePRC);
  protected
    procedure _wrk_ITMs_setPRC(const value:tIn0k_hintDOC_ePRC);
    function  _wrk_ITMs_getPRC:tIn0k_hintDOC_ePRC;
    procedure _wrk_ITMs_ndfPRC;
  private //< вставка узлов
    procedure _ITM_ins_nextLast(var   target:tInkHD_ITM; const node:tInkHD_ITM);
    procedure _ITM_ins_cldrFrst(const target:tInkHD_ITM; const node:tInkHD_ITM);
    procedure _ITM_ins_cldrLast(const target:tInkHD_ITM; const node:tInkHD_ITM);
    procedure _ITM_ins_inContnt(const target:tInkHD_ITM; const node:tInkHD_ITM);
    procedure _ITM_rplc_to_CHLD(const target:tInkHD_ITM; var   node:tInkHD_ITM);
  private //< СОЗДАНИЕ новых узлов
    function  _ITM_crt_RAW(const nRAW:tInkHD_RAW; const eImp:eInkHD_RAW):tInkHD_ITM; overload;
    function  _ITM_crt_RAW(const nRAW:tInkHD_RAW):tInkHD_ITM;                        overload;
    function  _ITM_crt_ITM(const eItm:eInkHD_ITM; const nRAW:tInkHD_RAW):tInkHD_ITM; overload;
    function  _ITM_crt_ITM(const eItm:eInkHD_ITM):tInkHD_ITM;                        overload;
  protected //< корень дерева
    function  _ITMs_root:pointer;
  protected //< навигация
    function  _itm_next(const node:tInkHD_ITM):tInkHD_ITM;
    function  _itm_chld(const node:tInkHD_ITM):tInkHD_ITM;
    function  _itm_eItm(const node:tInkHD_ITM):eInkHD_ITM;
    function  _itm_eRAW(const node:tInkHD_ITM):eInkHD_RAW;
  protected //< служебный ПРС
    procedure _itm_set_ePRC(const node:tInkHD_ITM; const value:eInkHD_PRC);
    function  _itm_get_ePRC(const node:tInkHD_ITM):eInkHD_PRC;
  protected //< поиск в детях
   function   _itm_NODE_CRT (const lexeme,content:tInkHD_RAW):tInkHD_ITM;
   function   _itm_SCTN_CRT (const lexeme,content:tInkHD_RAW):tInkHD_ITM;
  protected //< поиск в детях
    function  _itm_TOKEN_eRAW(const node:tInkHD_ITM):eInkHD_RAW;
    function  _itm_NODE_eRAW (const node:tInkHD_ITM):eInkHD_RAW;
    function  _itm_SCTN_eRAW (const node:tInkHD_ITM):eInkHD_RAW;
    function  _itm_SCTN_NODEs(const node:tInkHD_ITM):eInkHD_RAW;

    function  _itm_NODE_TYPE (const item:tInkHD_ITM):tIn0k_hintDOC_core_itemNode_TYPE;


  protected //< поиск в детях
    function  _itm_LEXEME    (const node:tInkHD_ITM):eInkHD_RAW;

  protected //< поиск в детях
    function  _itm_fndChild(const item:tInkHD_ITM; eItm:eInkHD_ITM):tInkHD_ITM; overload;
    function  _itm_fndChild(const node:tInkHD_ITM; eRaw:eInkHD_RAW):tInkHD_ITM; overload;
    function  _itm_fndCntnt(const item:tInkHD_ITM):tInkHD_ITM;
    function  _itm_rawCntnt(const node:tInkHD_ITM):tInkHD_RAW;
    function  _itm_rawCntnt(const node:tInkHD_ITM; out Cntnt:tInkHD_ITM):tInkHD_RAW;
    function  _itm_grp_eItm(const node:tInkHD_ITM):eInkHD_ITM;
    //function  _itm_sct_eRaw(const node:tInkHD_ITM):eInkHD_RAW;
  {%endregion}
  protected
    procedure _wrk_ROOT_CRT(out rootItm:tInkHD_ITM; out rootRaw:tInkHD_RAW);
  //----------------------------------------------------------------------------
  private //< это что мы обрабатываем
   _sourceText:string; //< исходник, что именно парсим
   _tokenLabel:string; //< выбранный МеткаТокена
   _tokenStart:string; //< начальный токен, ПОСЛЕ которого парсим
   _tokenFinal:string; //< конечный токен, ДО которого парсим
   _tokenStartMustBe:boolean; //< начальный токен ДОЛЖЕН быть
   _tokenFinalMustBe:boolean; //< конечный токен ДОЛЖЕН быть
   _extractStringEXT:boolean; //< выделять "символ Строки-РАСШИРИТЕЛЬ"
    function  _get_source_ALL:string; inline;
    function  _get_source_RAW(const raw:pointer):string; //inline;
    function  _get_sourceText(const pos,len:longWord):string;// inline;
    procedure _set_sourceText(const value:string);
    procedure _set_tokenLabel(const value:string);
    procedure _set_tokenStart(const value:string);
    procedure _set_tokenFinal(const value:string);
    procedure _set_tokenStartMustBe(const value:boolean);
    procedure _set_tokenFinalMustBe(const value:boolean);
  //----------------------------------------------------------------------------
  public
    constructor Create(const srcText:string); overload;
    destructor DESTROY; override;
  public //< основные свойства
    property  PARSED:boolean read _wrk_parsed; //< все ПРОПАРСЕНО? иль нет?
    property  SourceText:string read _sourceText write _set_sourceText; //< исходник, что именно парсим
    property  TokenLabel:string read _tokenLabel write _set_tokenLabel; //< выбранная МеткаТокена
    property  TokenStart:string read _tokenStart write _set_tokenStart; //< начальный токен, ПОСЛЕ которого парсим
    property  TokenFinal:string read _tokenFinal write _set_tokenFinal; //< конечный токен, ДО которого парсим
    property  TokenStartMustBe:boolean read _tokenStartMustBe write _set_tokenStartMustBe; //< начальный токен ДОЛЖЕН быть
    property  TokenFinalMustBe:boolean read _tokenFinalMustBe write _set_tokenFinalMustBe; //< конечный токен ДОЛЖЕН быть
  end;

 tInkHDF=tIn0k_hintDOC_Finder;


 rInkHDOL=record
    obj:tInkHDO; //< объект, над которым работаем
    lxr:tInkHDF; //< чем работаем на оюъектом
  end;

 tInkHDP_enumAllTokenLXMs__fCallBack=procedure(const context:pointer; const obj:tInkHDO; const lxr:tInkHDF; const eRaw:eInkHD_RAW; const SMBs:string);

 tInkHDP_byteIDX=tIHDF_nmbr;        //< индекс БАЙТа
 tInkHDP_byteCNT=tInkHDP_byteIDX; //< кол-во БАЙТ

 rInkHDP_BP=record //< processing brackets
    bOpnPOS:tInkHDP_byteIDX;
    bOpnLEN:tInkHDP_byteCNT;
    bClsPOS:tInkHDP_byteIDX;
    bClsLEN:tInkHDP_byteCNT;
  end;
 pInkHDP_BP=^rInkHDP_BP;

 tInkHDP=class//(tInkHD_core)
  protected
    function  _obj_getCntnt_RAW(const OL:rInkHDOL; const node:tInkHD_ITM):tInkHD_RAW;
  protected
    procedure _lxr_setSrcTxtALL(const OL:rInkHDOL);
    procedure _lxr_setSourceTxt(const OL:rInkHDOL; const sourceTxt:string);
    procedure _lxr_setSrcTxtRAW(const OL:rInkHDOL; const node:tInkHD_RAW);
    function  _lxr_setSrcTxtITM(const OL:rInkHDOL; const node:tInkHD_ITM):boolean;
    procedure _enumAllTokenLXMs(const OL:rInkHDOL; const context:pointer; const fnk:tInkHDP_enumAllTokenLXMs__fCallBack);
  {%region --- поиск метокТокена ---------------------------------- /fold}
  protected
    procedure _parseF0_fill_LBLsList(const OL:rInkHDOL);
  protected
    procedure _execute_parseF0      (const OL:rInkHDOL);
  {%endregion}
  protected
    function _parse00_makeROOT(const OL:rInkHDOL):boolean;
    function _parse01_slct_LBL(const OL:rInkHDOL):boolean;
    //function _parse_I_findLXMs(const OL:rInkHDOL; const SRC:tInkHD_ITM):boolean;
  {%region --- работа аля'Lex ------------------------------------- /fold}
  protected //< поиск и заполение Первичных-УЗЛОВ
    procedure _parseS0_fill_nodesText (const obj:tInkHDO);
    procedure _parseS0_fill_nodesText0(const OL:rInkHDOL; const RAW:tInkHD_RAW; const finalPos:longWord);
  protected //< поиск и заполение Первичных-УЗЛОВ
    procedure _parseS0_find_lexemes    (const OL:rInkHDOL; const ITM:tInkHD_ITM; stratPos:longword);
    procedure _parseS0_find_lexeme_LINE(const OL:rInkHDOL; const startPos:longword);
    procedure _parseS0_find_lexeme_SMBs(const OL:rInkHDOL; const startPos:longword; const eRaw:eInkHD_RAW; const SMBs:string);

    //procedure _processing_rawContent__prepare_RawLST(const OL:rInkHDOL; const Source:tInkHD_ITM);

  protected //<
    procedure _processing_rawContent                (const OL:rInkHDOL; const SRC:tInkHD_ITM);
    procedure _processing_rawContent__insert_in_SCTN(const OL:rInkHDOL; const Parent:tInkHD_ITM; const Token,Cntnt:tInkHD_RAW; var SCTN:tInkHD_ITM);
    procedure _processing_rawContent__insert_as_SCTN(const OL:rInkHDOL; const Parent:tInkHD_ITM; const Token,Cntnt:tInkHD_RAW; var SCTN:tInkHD_ITM);
    procedure _processing_rawContent__pickOut_global(const OL:rInkHDOL; const Source:tInkHD_ITM; const startRAW:tInkHD_RAW; const stopPos:longWord);
  protected //<
    function  _processing_rawContent__pickOut_topTXT_cutSrvSMB  (const OL:rInkHDOL; const Source:tInkHD_RAW; const l:tInkHDP_byteCNT; out tmpLBL:tInkHD_RAW):boolean;
       //                                                 extension
//    procedure _processing_rawContent__pickOut_topTXT_strEXTSNфыв_parce_AS_0A(const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT; out itm_cpt,itm_art:tInkHD_ITM);
    procedure _processing_rawContent__pickOut_topTXT_parce_AS_0A(const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT; out itm_cpt,itm_art:tInkHD_ITM);
    procedure _processing_rawContent__pickOut_topTXT_parce_AS_CA(const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT; out itm_cpt,itm_art:tInkHD_ITM);
    procedure _processing_rawContent__pickOut_topTXT_parce_AS_DD(const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT; out itm_dfn,itm_dsc:tInkHD_ITM);
    function  _processing_rawContent__pickOut_topTXT_parce_Mode (const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT):tIn0k_hintDOC_FTPM;
    function  _processing_rawContent__pickOut_topTXT_FIND       (const OL:rInkHDOL; const Source:tInkHD_ITM; out  itmText:tInkHD_ITM; out rawTxt:tInkHD_RAW):boolean;
    function  _processing_rawContent__pickOut_topTXT_present    (const OL:rInkHDOL; const Source:tInkHD_ITM; out  eRaw_forSelectMODE:eInkHD_RAW):boolean;
    procedure _processing_rawContent__pickOut_topTXT            (const OL:rInkHDOL; const Source:tInkHD_ITM);
    procedure _processing_rawContent__pickOut_strEXT            (const OL:rInkHDOL; const Source:tInkHD_ITM);
    //    procedure _processing_rawContent__pickOut_topTXT_strEXTSNфыв_parce_AS_0A(const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT; out itm_cpt,itm_art:tInkHD_ITM);
  protected //< работа со скобками
    function  _processing_brackets_excPAIR(const OL:rInkHDOL; const Source:tInkHD_RAW; const brk_OPN,brk_CLS:string):boolean;
    procedure _processing_brackets_exclude(const OL:rInkHDOL; const Source:tInkHD_RAW; var   BP:rInkHDP_BP);
    procedure _processing_brackets_addITMs(const OL:rInkHDOL; const Parent:tInkHD_ITM; const BP:rInkHDP_BP);

    {%endregion}
  {%region --- работа аля'Yacc ------------------------------------ /fold}
  protected //<
    //function _exclude_brackets(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_RAW;
  protected //<             cptn text
    //procedure _parseS1_find_stringEXT(const OL:rInkHDOL; const node:tInkHD_RAW; const src_ITM:tInkHD_ITM);
    //procedure _parseS1_fnd2MK_TtlTxt_0(const OL:rInkHDOL; const node:tInkHD_RAW; out iTTL,iTXT:tInkHD_ITM);
    //procedure _parseS1_find_TTL_TXT_0(const OL:rInkHDOL; const node:tInkHD_RAW; out iTTL,iTXT:tInkHD_ITM);
    //procedure _parseS1_find_TTL_TXT_1(const OL:rInkHDOL; const node:tInkHD_RAW; out iTTL,iTXT:tInkHD_ITM);
//    procedure _parseS1_find_Titl_Text(const OL:rInkHDOL; const node:tInkHD_RAW; out Titl,Text:tInkHD_ITM);
    //procedure _parseS1_find_Name_Note(const OL:rInkHDOL; const node:tInkHD_RAW; out Name,Note:tInkHD_ITM);
  protected //<
    //function  _parseS1_make_lex2Token(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
//    function  _parseS1_make_prt_TiTxt(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
    //function  _parseS1_make_grp_TiTxt(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
    //function  _parseS1_make_TTL_TST_0(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
    //function  _parseS1_make_sct_TiTxt(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
    //function  _parseS1_make_tkn_NmNte(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
  protected //<
    //procedure _execute_parseS1       (const OL:rInkHDOL);
  {%endregion}
  protected //<
    function  _processing_NODE(const OL:rInkHDOL; const NODE:tInkHD_ITM):boolean;
  public
    procedure PARSE(const hintDOC_Object:tInkHDO);
  end;

 rInkHDgW=record
    O:tInkHDO; //< объект парсинга
    S:pointer; //< настройки экспорта
  end;

 tInkHDg=class//(tInkHD_core)
  protected //< обход структуры
    function  obj_ITMs_root(const obj:tInkHDO):tInkHD_ITM;                       inline;
    function  obj_ITM_next (const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM; inline;
    function  obj_ITM_chld (const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM; inline;
    function  obj_ITM_eItm (const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_ITM; inline;
    //-------
    function _itm_next(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM; inline;
    function _itm_eItm(const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_ITM; inline;
    function _itm_getContent(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
    function _itm_CntntFirst(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
    function _itm_fndInCntnt(const obj:tInkHDO; const itm:tInkHD_ITM; const eItm:eInkHD_ITM):tInkHD_ITM;
    //-------
    function _itm_notNil_prcNO     (const obj:tInkHDO; const itm:tInkHD_ITM):boolean; inline;
    function _itm_notNil_prcNO_eITM(const obj:tInkHDO; const itm:tInkHD_ITM; const eITM:eInkHD_ITM):boolean; inline;
    function _itm_haveHEADER       (const obj:tInkHDO; const itm:tInkHD_ITM):boolean; inline;

  protected
    function  obj_ITM_haveHEADER(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;

  protected
    procedure obj_ITMs_ndfPRC(const obj:tInkHDO);
    function  obj_ITMs_getPRC(const obj:tInkHDO):eInkHD_PRC;
    procedure obj_ePRC_set   (const obj:tInkHDO; const itm:tInkHD_ITM; const value:eInkHD_PRC);
    function  obj_ePRC_get   (const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_PRC;
  protected
    function  obj_item_getParent_itmNODE(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
  protected
    function  obj_item_in_NODE      (const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
    function  obj_item_in_NODE_DD   (const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
    function  obj_item_in_NODE_CA   (const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
  protected
    function  obj_item_is_eItm      (const obj:tInkHDO; const itm:tInkHD_ITM; const eItm:eInkHD_ITM):boolean;
    procedure obj_item_set_PRC_OK   (const obj:tInkHDO; const itm:tInkHD_ITM);
    function  obj_item_notNil_PRC_OK(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
    function  obj_item_notNil_PRC_NO(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
    function  obj_item_isGrp_ForNODE(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;

  protected

    function  obj_item_NODE_Type         (const obj:tInkHDO; const itm:tInkHD_ITM):tIn0k_hintDOC_core_itemNode_TYPE;
    function  obj_item_has_DefinedDetails(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
    function  obj_item_has_CaptionArticle(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;


//    function  obj_item_isGrp_ForSCTN(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
  protected
    function  obj_fndChild (const obj:tInkHDO; const itm: pointer;   const child_eItm:eInkHD_ITM):pointer;
    function  obj_fndCntnt (const obj:tInkHDO; const itm: pointer):pointer;
    function  obj_InContent(const obj:tInkHDO; const itm:tInkHD_ITM; const child_eItm:eInkHD_ITM):pointer;
    function  obj_GRP_eItm (const obj:tInkHDO; const grp:tInkHD_ITM):eInkHD_ITM;

    function  _itm_SCTN_NODEs (const obj:tInkHDO; const grp:tInkHD_ITM):eInkHD_RAW;
    function  _itm_NODE_eRAW  (const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_RAW;
  protected
   function   _itm_SCTN_is_PAR(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
   function   _itm_SCTN_is_TBL(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
  protected
    function  obj_itemRAW_getText(const obj:tInkHDO; const raw:tInkHD_ITM):string;
    function  obj_collect_rawText(const obj:tInkHDO; const itm:tInkHD_ITM):string;
    function  obj_collectStripTXT(const obj:tInkHDO; const itm:tInkHD_ITM):string;
  end;

procedure unitTest__tin0k_hintDOC__setPARSED(In0k_hintDOC:tInkHDO); inline;

implementation

{%region --- tInkHDO --------------------------------------------- /fold }

constructor tInkHDO.Create(const srcText:string);
begin
   _sourceText:=srcText;
   _tokenLabel:='';      //< по умолчанию будем искать из текста
   _tokenStart:='';
   _tokenFinal:='';
   _tokenStartMustBe:=false;
   _tokenFinalMustBe:=false;
   _extractStringEXT:=true;
    //---
   _wrk_LBLs_INiT;
   _wrk_RAWs_INiT;
   _wrk_ITMs_INiT;
   _CLR_WRK_;
end;

destructor tInkHDO.DESTROY;
begin
   _CLR_WRK_;
end;

//------------------------------------------------------------------------------

function tInkHDO._get_source_ALL:string; inline;
begin
    result:=_sourceText;
end;

function tInkHDO._get_sourceText(const pos,len:longWord):string;
begin
    {$ifopt d+}
        if (len=0) then begin
            result:=''
        end
       else
        if (pos>=length(_sourceText))
        then begin
            result:=''
        end
       else
        if (pos+Len>length(_sourceText))
        then begin
            result:=''
        end
       else
    {$endif}


    result:=Copy(_sourceText,pos+1,len);
end;

function tInkHDO._get_source_RAW(const raw:pointer):string;
begin
    result:=_get_sourceText(_raw_Pos(raw),_raw_Len(raw));
end;


procedure tInkHDO._set_sourceText(const value:string);
begin
    if value<>_sourceText then begin
      _sourceText:=value;
      _CLR_WRK_;
    end;
end;

procedure tInkHDO._set_tokenLabel(const value:string);
begin
    if value<>_tokenLabel then begin
      _tokenLabel:=value;
      _CLR_WRK_;
    end;
end;

procedure tInkHDO._set_tokenStart(const value:string);
begin
    if value<>_tokenStart then begin
      _tokenStart:=value;
      _CLR_WRK_;
    end;
end;

procedure tInkHDO._set_tokenFinal(const value:string);
begin
    if value<>_tokenFinal then begin
      _tokenFinal:=value;
      _CLR_WRK_;
    end;
end;

procedure tInkHDO._set_tokenStartMustBe(const value:boolean);
begin
    if value<>_tokenStartMustBe then begin
      _tokenStartMustBe:=value;
      _CLR_WRK_;
    end;
end;

procedure tInkHDO._set_tokenFinalMustBe(const value:boolean);
begin
    if value<>_tokenFinalMustBe then begin
      _tokenFinalMustBe:=value;
      _CLR_WRK_;
    end;
end;

//------------------------------------------------------------------------------

{%region `tIn0k_hintDOC` - очередь _tokenCharsList ---------------- /fold}

{---}{%region --- _tknCHRsNODE_ - упорядоченная очередь --------- /fold}

type
 _pTknCHRsNODE_=^_rTknCHRsNODE_;
 _rTknCHRsNODE_=record
   next:_pTknCHRsNODE_; //< следующий в очереди
   CHRs: string;        //< собсно символ
   cnt : PtrUInt;       //< скока раз встретили
  end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function _TknCHRsNODE_CRT(const nCHRs:string; const nCnt:PtrUInt):_pTknCHRsNODE_; {$ifdef _INLINE_} inline; {$endif}
begin
   new(result);
   with result^ do begin
      next:=nil;
      CHRs:=nCHRs;
      cnt :=nCnt;
   end;
end;

procedure _TknCHRsNODE_DST(const item:_pTknCHRsNODE_); {$ifdef _INLINE_} inline; {$endif}
begin
   dispose(item);
end;

//------------------------------------------------------------------------------

function _TknCHRsNODE_getNext(const item:pointer):pointer; {$ifdef _INLINE_} inline; {$endif}
begin
   result:=_pTknCHRsNODE_(item)^.next;
end;

procedure _TknCHRsNODE_setNext(const item,next:pointer);   {$ifdef _INLINE_} inline; {$endif}
begin
   _pTknCHRsNODE_(item)^.next:=next;
end;

//------------------------------------------------------------------------------

function _TknCHRsNODE_get_KEY(const item:pointer):pointer;  {$ifdef _INLINE_} inline; {$endif}
begin
    result:=item;
end;

function _TknCHRsNODE_KEYsCMP(const key1,key2:pointer):integer; {$ifdef _INLINE_} inline; {$endif}
begin
   if _pTknCHRsNODE_(key1)^.cnt>_pTknCHRsNODE_(key2)^.cnt
   then result:=1
  else
   if _pTknCHRsNODE_(key1)^.cnt<_pTknCHRsNODE_(key2)^.cnt
   then result:=-1
  else begin
       result:=0
   end;
end;

{---}{%endRegion}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$MACRO ON}//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__GetNext:=_TknCHRsNODE_getNext}// - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__SetNext:=_TknCHRsNODE_setNext}// - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__NodeDST:=_TknCHRsNODE_DST}// - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__Get_KEY:=_TknCHRsNODE_get_KEY}// - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__KEYsCMP:=_TknCHRsNODE_KEYsCMP}// - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._wrk_LBLs_INiT;
begin
   _wrk_lblNodes:=nil;
end;

procedure tInkHDO._wrk_LBLs_CLR;
var tmp:pointer; //< для удобства навигации
{$deFine _m_protoInkLLo_FF__tmp_POINTER:=tmp}
{$deFine _M_protoInkLLo_FF__var_FIRST  :=_wrk_lblNodes}
begin //< для удобства навигации
{$I protoInkLLo_bodyFNC_FF__CLEAR.inc}
end;

procedure tInkHDO._wrk_LBLs_ordINS(const node:pointer);
var tmp:pointer;
{$deFine _M_protoInkLLo_06v1__tmp_POINTER:=tmp}
{$deFine _M_protoInkLLo_06v1__var_FIRST:=_wrk_lblNodes}
{$deFine _M_protoInkLLo_06v1__cst_NODE := node}
begin //< для удобства навигации
   {$I protoInkLLo_bodyFNC_06v1__insNode.inc}
end;

{добавить найденную "меткуТокена"
 ~prm text найденная меткаТокена
}
procedure tInkHDO._wrk_LBLs_addLBL(const text:string);
var tmp:_pTknCHRsNODE_;
begin
    tmp:=_wrk_lblNodes;
    // исчем УЖЕ созданную и увеличиваем счетчик
    while tmp<>nil do begin
        if text=tmp^.CHRs then begin
            inc(tmp^.cnt);
            BREAK;
        end;
        tmp:=tmp^.next;
    end;
    // если такой еще нет, то создаем и добавляем
    if tmp=nil then begin
       tmp:=_TknCHRsNODE_CRT(text,1);
       tmp^.next:=_wrk_lblNodes;
      _wrk_lblNodes:=tmp;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$MACRO OFF}// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{переСОРТИРОВАТЬ список.                                                 <
    ---
    Сортировать список Найденных-МетокТокенов с учетом их частоты встречаемости.
    В результате, самый первый -- самый часто встречаемый.
}
procedure tInkHDO._wrk_LBLs_reOrde;
var tmp,tm1:_pTknCHRsNODE_;
begin
    tmp:=_wrk_lblNodes;
   _wrk_lblNodes:=nil;
    while tmp<>nil do begin
        tm1:=tmp^.next;
        tmp^.next:=nil;
       _wrk_LBLs_ordINS(tmp);
        //-->
        tmp:=tm1;
    end;
end;

{получить меткуТокена, встреченную БОЛЬШЕЕ кол-во раз}
function tInkHDO._wrk_LBLs_getMAX:string;
begin
    result:='';
    if _wrk_lblNodes<>nil then begin
        result:=_pTknCHRsNODE_(_wrk_lblNodes)^.CHRs;
    end;
end;

//------------------------------------------------------------------------------

function tInkHDO._LBLs_root:pointer;
begin
    result:=_wrk_lblNodes;
end;

function tInkHDO._LBL_next(const node:pointer):pointer;
begin
    result:=_pTknCHRsNODE_(node)^.next;
end;

function tInkHDO._LBL_CHRs(const node:pointer):string;
begin
    result:=_pTknCHRsNODE_(node)^.CHRs;
end;

function tInkHDO._LBL_Cnt(const node:pointer):PtrUInt;
begin
    result:=_pTknCHRsNODE_(node)^.cnt;
end;

{%endRegion}

{%region `tIn0k_hintDOC` - очередь RAW ---------------------------- /fold}

{---}{%region --- _rawNODE_ - упорядоченная очередь --------- /fold}

type
 _pRawNODE_=^_rRawNODE_;
 _rRawNODE_=record
   next:_pRawNODE_;  //< следующий в очереди
   pos : longword;   //< начало в строке исходнике
   len : longword;   //< длина
   eRaw: eInkHD_RAW; //< "тип" токена
  end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function _ImpNode_CRT(const T:eInkHD_RAW; const P,L:integer):_pRawNODE_; {$ifdef _INLINE_} inline; {$endif}
begin
    new(result);
    with result^ do begin
       next:=nil;
       pos :=P;
       len :=L;
       eRaw:=T;
    end;
end;

procedure _ImpNode_DST(const item:_pRawNODE_); {$ifdef _INLINE_} inline; {$endif}
begin
    dispose(item);
end;

//------------------------------------------------------------------------------

function _ImpNode_getNext(const item:pointer):pointer; {$ifdef _INLINE_} inline; {$endif}
begin
    result:=_pRawNODE_(item)^.next;
end;

procedure _ImpNode_setNext(const item,next:pointer);   {$ifdef _INLINE_} inline; {$endif}
begin
    _pRawNODE_(item)^.next:=next;
end;

//------------------------------------------------------------------------------

function _ImpNode_get_KEY(const item:pointer):pointer;  {$ifdef _INLINE_} inline; {$endif}
begin
    result:=item;
end;

function _ImpNode_KEYsCMP(const key1,key2:pointer):integer; {$ifdef _INLINE_} inline; {$endif}
begin
    if _pRawNODE_(key1)^.pos<_pRawNODE_(key2)^.pos
    then result:=1
   else
    if _pRawNODE_(key1)^.pos>_pRawNODE_(key2)^.pos
    then result:=-1
   else begin
        result:=0
    end;
end;

{---}{%endRegion}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$MACRO ON}//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__GetNext:=_ImpNode_getNext}// - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__SetNext:=_ImpNode_setNext}// - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__NodeDST:=_ImpNode_DST}// - - - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__Get_KEY:=_ImpNode_get_KEY}// - - - - - - - - -
{$deFine _M_protoInkLLo_blockFNK__KEYsCMP:=_ImpNode_KEYsCMP}// - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._wrk_RAWs_INiT;
begin
   _wrk_rawNodes:=nil;
end;

procedure tInkHDO._wrk_RAWs_CLR;
var tmp:pointer; //< для удобства навигации
{$deFine _m_protoInkLLo_FF__tmp_POINTER:=tmp}
{$deFine _M_protoInkLLo_FF__var_FIRST  :=_wrk_rawNodes}
begin //< для удобства навигации
{$I protoInkLLo_bodyFNC_FF__CLEAR.inc}
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._wrk_RAWs_TST(const pos,len:longWord; const eRaw:eInkHD_RAW):tInkHD_RAW;
begin
    result:=_wrk_rawNodes;
    while result<>nil do begin
        if (_pRawNODE_(result)^.eRaw<>eRAW_TEXT)and(_pRawNODE_(result)^.pos<=pos)and(pos+len<=_pRawNODE_(result)^.pos+_pRawNODE_(result)^.len)
        then begin
             //result:=nil;
             break;
        end;
        result:=_pRawNODE_(result)^.next;
    end;
end;

function tInkHDO._wrk_RAWs_ADD(const pos,len:longWord; const eRaw:eInkHD_RAW):tInkHD_RAW;
var tmp:pointer;
{$deFine _M_protoInkLLo_06v1__tmp_POINTER:=tmp}
{$deFine _M_protoInkLLo_06v1__var_FIRST:=_wrk_rawNodes}
{$deFine _M_protoInkLLo_06v1__cst_NODE := result}
begin //< для удобства навигации
   result:=_ImpNode_CRT(eRaw,pos,len);
   {$I protoInkLLo_bodyFNC_06v1__insNode.inc}
end;

{"откусываем" от узла НАЧАЛО, в результате ОТКУШЕННОЕ}
function tInkHDO._wrk_RAWs_CLP(const node:tInkHD_RAW; const cliplen:longWord):tInkHD_RAW;
begin
   with _pRawNODE_(node)^ do begin
       if cliplen<len then begin
           // изменяем ИСХОДНЫЙ
           pos:=pos+cliplen;
           len:=len-cliplen;
           // создаем новый и вставляем
           result:=_wrk_RAWs_ADD(pos-cliplen,cliplen,eRaw);
       end
       else result:=nil;
   end;
end;

function tInkHDO._wrk_RAWs_CLP_start(const node:tInkHD_RAW; const clipPos:longWord; const newERaw:eInkHD_RAW):tInkHD_RAW;
begin
    with _pRawNODE_(node)^ do begin
        if clipPos<len then begin
            // изменяем ИСХОДНЫЙ
            pos:=pos+clipPos;
            len:=len-clipPos;
            // создаем новый и вставляем
            result:=_wrk_RAWs_ADD(pos-clipPos,clipPos,newERaw);
        end
        else result:=nil;
    end;
end;

function tInkHDO._wrk_RAWs_CLP_start(const node:tInkHD_RAW; const clipPOS:longWord):tInkHD_RAW;
begin
    result:=_wrk_RAWs_CLP_start(node,clipPOS,_pRawNODE_(node)^.eRaw);
end;

function tInkHDO._wrk_RAWs_CLP_final(const node:tInkHD_RAW; const clipPos:longWord; const newERaw:eInkHD_RAW):tInkHD_RAW;
begin
    with _pRawNODE_(node)^ do begin
        if clipPos<len then begin
            // создаем новый и вставляем
            result:=_wrk_RAWs_ADD(pos+clipPos,len-clipPos,newERaw);
            // изменяем ИСХОДНЫЙ
            len:=clipPos;
        end
        else begin
            result:=nil;
        end;
    end;
end;

function tInkHDO._wrk_RAWs_CLP_final(const node:tInkHD_RAW; const clipPOS:longWord):tInkHD_RAW;
begin
    result:=_wrk_RAWs_CLP_final(node,clipPOS,_pRawNODE_(node)^.eRaw);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$MACRO OFF}// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._RAWs_root:pointer;
begin
    result:=_wrk_rawNodes;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._raw_next(const node:tInkHD_RAW):tInkHD_RAW;
begin
    if Assigned(node)
    then result:=_pRawNODE_(node)^.next
    else result:=nil;
end;

function tInkHDO._raw_Pos(const node:tInkHD_RAW):longWord;
begin
    if Assigned(node)
    then result:=_pRawNODE_(node)^.pos
    else result:= 0;
end;

function tInkHDO._raw_Len(const node:tInkHD_RAW):longWord;
begin
    if Assigned(node)
    then result:=_pRawNODE_(node)^.len
    else result:= 0;
end;

function tInkHDO._raw_eRaw(const node:tInkHD_RAW):eInkHD_RAW;
begin
    if Assigned(node)
    then result:=_pRawNODE_(node)^.eRaw
    else result:= eRAW_NDF;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._raw_gVAL(const node:tInkHD_RAW):boolean;
begin
    result:=false;
    if (node<>nil)and(_pRawNODE_(node)^.next<>nil)
    and(_pRawNODE_(node)^.next^.eRaw=eRAW_tkn_VAL)
    then result:=TRUE;
end;

{%endregion}

{%region `tIn0k_hintDOC` - "синтактическое" дерево ---------------- /fold}

{---}{%region --- _itmNODE_ - дерево ------------------------ /fold}

type
 _pItmNODE_=^_rItmNODE_;
 _rItmNODE_=record
   prnt:_pItmNODE_; //< родитель
   next:_pItmNODE_; //< следующий в очереди
   chld:_pItmNODE_; //< первый ребёнок
   eItm: eInkHD_ITM;//< "тип" токена
   ePrc: tIn0k_hintDOC_ePRC
 end;

//------------------------------------------------------------------------------

function _ItmNODE_getPrnt(const node:pointer):pointer; {$ifdef _INLINE_} inline; {$endif}
begin
    result:=_pItmNODE_(node)^.prnt;
end;

procedure _ItmNODE_setPrnt(const node,prnt:pointer);   {$ifdef _INLINE_} inline; {$endif}
begin
   _pItmNODE_(node)^.prnt:=prnt;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function _ItmNODE_getNext(const node:pointer):pointer; {$ifdef _INLINE_} inline; {$endif}
begin
    result:=_pItmNODE_(node)^.next;
end;

procedure _ItmNODE_setNext(const node,next:pointer);   {$ifdef _INLINE_} inline; {$endif}
begin
   _pItmNODE_(node)^.next:=next;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function _ItmNODE_getChld(const node:pointer):pointer; {$ifdef _INLINE_} inline; {$endif}
begin
    result:=_pItmNODE_(node)^.chld;
end;

procedure _ItmNODE_setChld(const node,chld:pointer);   {$ifdef _INLINE_} inline; {$endif}
begin
   _pItmNODE_(node)^.chld:=chld;
end;

//------------------------------------------------------------------------------

procedure _ItmNODE_DST(const node:_pItmNODE_);
begin
   dispose(node);
end;

//------------------------------------------------------------------------------

function _ItmNODE_CRT_00(const eItm:eInkHD_ITM):_pItmNODE_;
begin
    new(result);
    with result^ do begin
       prnt:=nil;
       next:=nil;
       chld:=nil;
    end;
    result^.eItm:=eItm;
end;

function _ItmNODE_CRT_0C(const eItm:eInkHD_ITM; const chld:pointer):_pItmNODE_;
begin
    result:=_ItmNODE_CRT_00(eItm);
    result^.chld:=chld;
end;

function _ItmNODE_CRT_N0(const eItm:eInkHD_ITM; const next:pointer):_pItmNODE_;
begin
    result:=_ItmNODE_CRT_00(eItm);
    result^.next:=next;
end;

//------------------------------------------------------------------------------

function _ItmNODE_rawCRT(const node:_pRawNODE_):_pItmNODE_;
begin
    result:=_ItmNODE_CRT_0C(ITM_raw,node);
end;

{%endregion}

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$MACRO ON}//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$deFine _M_protoInkLLs_blockFNK__GetNext:=_ItmNODE_getNext}// - - - - - - - - -
{$deFine _M_protoInkLLs_blockFNK__SetNext:=_ItmNODE_setNext}// - - - - - - - - -
{.$deFine _M_protoInkLLs_blockFNK__nodeDST:=''} //< чтобы ПОМНИТЬ
{$deFine _M_protoInkLLo_blockFNK__KEYsCMP:=_ImpNode_KEYsCMP}// - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._wrk_ITMs_INiT;
begin
   _wrk_itmNodes:=nil;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._wrk_ITMs_clrDST(var itm:tInkHD_ITM);
var tmp:_pItmNODE_;
begin
    tmp:=itm;
    //---
    if not (_pItmNODE_(tmp)^.eItm in [ITM_raw,ITM_NDF]) then begin
        if tmp^.chld<>nil then _wrk_ITMs_clrDST(tmp^.chld);
    end;
    if tmp^.next<>nil then _wrk_ITMs_clrDST(tmp^.next);
    //---
   _ItmNODE_DST(tmp);
    itm:=nil;
end;

procedure tInkHDO._wrk_ITMs_CLR;
begin  {todo: перейти на НЕ рекурсивный алгоритм}
    if Assigned(_wrk_itmNodes) then begin
       _wrk_ITMs_clrDST(_wrk_itmNodes);
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._wrk_ITMs_setPRC(const itm  :tInkHD_ITM; const value:tIn0k_hintDOC_ePRC);
var tmp:_pItmNODE_;
begin
    tmp:=itm;
    //---
    if not (_pItmNODE_(tmp)^.eItm in [ITM_raw,ITM_NDF]) then begin
        if tmp^.chld<>nil then _wrk_ITMs_setPRC(tmp^.chld,value);
    end;
    if tmp^.next<>nil then _wrk_ITMs_setPRC(tmp^.next,value);
    //---
   _pItmNODE_(itm)^.ePrc:=value;
end;


procedure tInkHDO._wrk_ITMs_setPRC(const value:tIn0k_hintDOC_ePRC);
begin  {todo: перейти на НЕ рекурсивный алгоритм}
    if Assigned(_wrk_itmNodes) then begin
       _wrk_ITMs_setPRC(_wrk_itmNodes,value);
    end;
end;

function tInkHDO._wrk_ITMs_getPRC:tIn0k_hintDOC_ePRC;
begin
    result:=PRC_ndf;
    if Assigned(_ITMs_root) then begin
        result:=_itm_get_ePRC(_ITMs_root);
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._wrk_ITMs_ndfPRC;
begin
   _wrk_ITMs_setPRC(PRC_ndf);
end;

//------------------------------------------------------------------------------

procedure tInkHDO._ITM_ins_nextLast(var target:pointer; const node:pointer);
var tmp:pointer;
{$deFine _m_protoInkLLs_09v1__tmp_POINTER:=tmp}
{$deFine _M_protoInkLLs_09v1__var_FIRST  :=target}
{$deFine _M_protoInkLLs_09v1__cst_LIST   :=node}
begin //< для удобства навигации
  // _ItmNODE_setPrnt(node,_ItmNODE_getPrnt(target));
    {$I protoInkLLs_bodyFNC_09v1__insLast.inc}
end;

procedure tInkHDO._ITM_ins_cldrFrst(const target:tInkHD_ITM; const node:tInkHD_ITM);
{$ifDef inkLLsimple_fncHeadMessage}{$message 'inkLLs_insNodeFirst'}{$endIF}
{$deFine _M_protoInkLLs_06__var_FIRST:=_pItmNODE_(target)^.chld}
{$deFine _M_protoInkLLs_06__cst_NODE :=Node}
begin //< для удобства навигации
   _ItmNODE_setPrnt(node,target);
    {$I protoInkLLs_bodyFNC_06__insFirst.inc}
end;

procedure tInkHDO._ITM_ins_cldrLast(const target:pointer; const node:pointer);
begin
   _ItmNODE_setPrnt(node,target);
   _ITM_ins_nextLast(_pItmNODE_(target)^.chld,node)
end;

procedure tInkHDO._ITM_ins_inContnt(const target:tInkHD_ITM; const node:tInkHD_ITM);
var tmp:tInkHD_ITM;
begin
    tmp:=_itm_fndCntnt(target);
    if tmp=nil then begin
        tmp:=_ITM_crt_ITM(ITM_content);
       _ITM_ins_cldrLast(target,tmp);
    end;
    //---
   _ITM_ins_cldrLast(tmp,node);
end;

procedure tInkHDO._ITM_rplc_to_CHLD(const target:tInkHD_ITM; var node:tInkHD_ITM);
var tmp:pointer;
begin

    tmp:=_itm_chld(node);
    if tmp<>nil then begin
        //--- замыкаем
        while _itm_next(tmp)<>nil do begin
           _ItmNODE_setPrnt(tmp,_ItmNODE_getPrnt(target));
            tmp:=_itm_next(tmp);
        end;
       _pItmNODE_(tmp)^.next:=_itm_next(target);
        //--- окончательно
        tmp:=_itm_chld(node);

       _pItmNODE_(node)^.next:=_pItmNODE_(target)^.chld; //< временное хранение
        //-------
       _pItmNODE_(target)^.eItm:=_pItmNODE_(tmp)^.eItm;
       _pItmNODE_(target)^.ePrc:=_pItmNODE_(tmp)^.ePrc;
       _pItmNODE_(target)^.chld:=_pItmNODE_(tmp)^.chld;
       _pItmNODE_(target)^.next:=_pItmNODE_(tmp)^.next;
        //-------
       _pItmNODE_(tmp)^ .next:=nil;
       _pItmNODE_(tmp)^ .chld:=nil;//.._pItmNODE_(node)^.next;
     //  _pItmNODE_(node)^.next:=nil;
        //----
       _wrk_ITMs_clrDST(node);
    end;
end;


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{$MACRO OFF}// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._ITM_crt_RAW(const nRAW:tInkHD_RAW; const eImp:eInkHD_RAW):tInkHD_ITM;
begin
    result:=_ItmNODE_rawCRT(nRAW);
   _pRawNODE_(nRAW)^.eRaw:=eImp;
end;

function tInkHDO._ITM_crt_RAW(const nRAW:tInkHD_RAW):tInkHD_ITM;
begin
    result:=_ItmNODE_rawCRT(nRAW);
end;

function tInkHDO._ITM_crt_ITM(const eItm:eInkHD_ITM; const nRAW:tInkHD_RAW):tInkHD_ITM; overload;
begin
    result:=_ItmNODE_CRT_0C(eItm,_ItmNODE_rawCRT(nRAW));
end;

function tInkHDO._ITM_crt_ITM(const eItm:eInkHD_ITM):tInkHD_ITM;
begin
    result:=_ItmNODE_CRT_00(eItm);
end;

//------------------------------------------------------------------------------

function tInkHDO._ITMs_root:pointer;
begin
    result:=_wrk_itmNodes;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._itm_next(const node:tInkHD_ITM):tInkHD_ITM;
begin
    result:=_pItmNODE_(node)^.next;
end;

function tInkHDO._itm_chld(const node:tInkHD_ITM):tInkHD_ITM;
begin
    result:=_pItmNODE_(node)^.chld;
end;

function tInkHDO._itm_eItm(const node:tInkHD_ITM):eInkHD_ITM;
begin
    result:=_pItmNODE_(node)^.eItm;
end;

{получить тип ВЛОЖЕННОГО RAW элемента}
function tInkHDO._itm_eRAW(const node:tInkHD_ITM):eInkHD_RAW;
begin
    result:=eRAW_NDF;
    if _itm_eItm(node)=itm_raw then begin
        if _itm_chld(node)<>nil then begin
            result:=_raw_eRaw(_itm_chld(node));
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDO._itm_set_ePRC(const node:tInkHD_ITM; const value:eInkHD_PRC);
begin
   _pItmNODE_(node)^.ePrc:=value;
end;

function tInkHDO._itm_get_ePRC(const node:tInkHD_ITM):eInkHD_PRC;
begin
    result:=_pItmNODE_(node)^.ePrc;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._itm_NODE_CRT(const lexeme,content:tInkHD_RAW):tInkHD_ITM;
begin
    result:=_ITM_crt_ITM(eITM_NODE);
    if lexeme <>nil then _ITM_ins_cldrFrst(result,_ITM_crt_ITM(ITM_token,lexeme));
    if content<>nil then _ITM_ins_inContnt(result,_ITM_crt_RAW(content));
end;


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._itm_SCTN_CRT(const lexeme,content:tInkHD_RAW):tInkHD_ITM;
begin
    result:=_ITM_crt_ITM(ITM_SCTN);
    if lexeme <>nil then _ITM_ins_cldrFrst(result,_ITM_crt_ITM(ITM_token,lexeme));
    if content<>nil then _ITM_ins_inContnt(result,_ITM_crt_RAW(content));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._itm_NODE_TYPE(const item:tInkHD_ITM):tIn0k_hintDOC_core_itemNode_TYPE;
var tmp:tInkHD_ITM;
begin
    result:=itmNODE_false;
    if _itm_eItm(item)=eITM_NODE then begin
        result:=itmNODE_clean;
        tmp:=_itm_fndCntnt(item);
        if Assigned(tmp) then begin
            //---
            if (NIL<>_itm_fndChild(tmp,eITM_defined))or
               (NIL<>_itm_fndChild(tmp,eITM_details))
            then begin
                result:=itmNODE_hasDD;
            end;
            //---
            if (NIL<>_itm_fndChild(tmp,eITM_article))or
               (NIL<>_itm_fndChild(tmp,eITM_caption))
            then begin
                if result=itmNODE_clean then result:=itmNODE_hasCA
                else result:=itmNODE_mixed;
            end;
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._itm_TOKEN_eRAW(const node:tInkHD_ITM):eInkHD_RAW;
var tmp:tInkHD_ITM;
begin
  {$ifOpt D+}
    Assert( Assigned(node)          ,'node: NOT define');
    Assert(_itm_eItm(node)=ITM_token,'node: eITM<>ITM_token');
  {$endIf}
    result:=eRAW_NDF;
    tmp:=_itm_chld(tmp);
    while Assigned(tmp) do begin
        result:=_itm_eRAW(tmp);
        if NOT (result in [eRAW_NDF,eRAW_lblTkn])
        then break;
        result:=eRAW_NDF;
        tmp:=_itm_next(tmp);
    end;
end;

function tInkHDO._itm_NODE_eRAW(const node:tInkHD_ITM):eInkHD_RAW;
var tmp:pointer;
begin
  {$ifOpt D+}
    Assert( Assigned(node)          ,'node: NOT define');
    Assert(_itm_eItm(node)=eITM_NODE,'node: eITM<>eITM_NODE');
  {$endIf}
    result:=eRAW_NDF;
    tmp:=_itm_fndChild(node,ITM_token);
    if Assigned(tmp) then result:=_itm_TOKEN_eRAW(tmp);
end;

function tInkHDO._itm_SCTN_eRAW(const node:tInkHD_ITM):eInkHD_RAW;
var tmp:pointer;
begin
  {$ifOpt D+}
    Assert( Assigned(node)         ,'node: NOT define');
    Assert(_itm_eItm(node)=ITM_SCTN,'node: eITM<>ITM_SCTN');
  {$endIf}
    result:=eRAW_NDF;
    tmp:=_itm_fndChild(node,ITM_token);
    if Assigned(tmp) then result:=_itm_TOKEN_eRAW(tmp)
    else begin //< определяем тип по ПЕРВОМУ вложенному УЗЛЕ
        tmp:=_itm_fndCntnt(node);
        if Assigned(tmp) then begin
            tmp:=_itm_fndChild(tmp,eITM_NODE);
            if Assigned(tmp) then result:=_itm_NODE_eRAW(tmp)
        end;
    end;
end;

function tInkHDO._itm_SCTN_NODEs(const node:tInkHD_ITM):eInkHD_RAW;
var tmp:pointer;
begin
  {$ifOpt D+}
    Assert( Assigned(node)         ,'node: NOT define');
    Assert(_itm_eItm(node)=ITM_SCTN,'node: eITM<>ITM_SCTN');
  {$endIf}
    result:=eRAW_NDF;
    if  Assigned(node) then begin //< определяем тип по ПЕРВОМУ вложенному УЗЛЕ
        tmp:=_itm_fndCntnt(node);
        if Assigned(tmp) then begin
            tmp:=_itm_fndChild(tmp,eITM_NODE);
            if Assigned(tmp) then result:=_itm_NODE_eRAW(tmp)
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function  tInkHDO._itm_LEXEME(const node:tInkHD_ITM):eInkHD_RAW;
begin
    case _itm_eItm(node) of
    eITM_NODE:result:=_itm_NODE_eRAW(node);
    ITM_SCTN :result:=_itm_SCTN_eRAW(node) ;
    else result:=eRAW_NDF;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tInkHDO._itm_fndChild(const item:tInkHD_ITM; eItm:eInkHD_ITM):tInkHD_ITM;
begin
    result:= _pItmNODE_(item)^.chld;
    while result<>nil do begin
        if _pItmNODE_(result)^.eItm=eItm then break;
        result:=_pItmNODE_(result)^.next;
    end;
end;

function tInkHDO._itm_fndChild(const node:tInkHD_ITM; eRaw:eInkHD_RAW):tInkHD_RAW;
begin
    result:= _pItmNODE_(node)^.chld;
    while result<>nil do begin
        if (_pItmNODE_(result)^.eItm=itm_raw) and
           (_pItmNODE_(result)^.chld<>nil) and
           (_pRawNODE_(_pItmNODE_(result)^.chld)^.eRaw=eRaw)
        then begin
            result:=_pItmNODE_(result)^.chld;
            break;
        end;
        result:=_pItmNODE_(result)^.next;
    end;
end;

function tInkHDO._itm_fndCntnt(const item:tInkHD_ITM):tInkHD_ITM;
begin
    result:=_itm_fndChild(item,ITM_content);
end;


function  tInkHDO._itm_rawCntnt(const node:tInkHD_ITM; out Cntnt:tInkHD_ITM):tInkHD_RAW;
begin
    Cntnt:=_itm_fndCntnt(node);
    if Cntnt<>nil then begin
        result:=_itm_chld(Cntnt);
        if result<>nil then begin
            if (_itm_eRAW(Result)=eRAW_TEXT)
            then result:=_itm_chld(result)
            else result:= nil;
        end;
    end
    else result:=nil;
end;

function tInkHDO._itm_rawCntnt(const node:tInkHD_ITM):tInkHD_RAW;
var tmp:tInkHD_ITM;
begin
    result:=_itm_rawCntnt(node,tmp);
end;

function tInkHDO._itm_grp_eItm(const node:tInkHD_ITM):eInkHD_ITM;
var tmp:_pItmNODE_;
begin {todo: ПЕРЕДЕЛАТЬ}
    result:=ITM_NDF;
    if Assigned(node) then begin
        case _pItmNODE_(node)^.eItm of
        ITM_SCTN: begin
            tmp:=_pItmNODE_(node)^.chld;
            while tmp<>nil do begin
                if tmp^.eItm=ITM_content then begin
                    tmp:=tmp^.chld;
                    if tmp<>nil then result:=tmp^.eItm;
                    BREAK;
                end;
                //--->
                tmp:=tmp^.next;
            end;
        end;
        itm_RET: result:=itm_RET;
        itm_EXC: result:=itm_EXC;
        end;
    end;
end;

{%endregion}

//------------------------------------------------------------------------------

procedure tInkHDO._wrk_ROOT_CRT(out rootItm:tInkHD_ITM; out rootRaw:tInkHD_RAW);
begin
    {$ifOpt D+}
        Assert(self._wrk_itmNodes=nil,'_wrk_itmNodes MAST be NiL');
        Assert(self._wrk_rawNodes=nil,'_wrk_rawNodes MAST be NiL');
    {$endIf}
   _wrk_itmNodes:=_ITM_crt_ITM(ITM_ROOT);
   _wrk_RAWs_ADD(0,length(_sourceText),eRAW_TEXT);
   _ITM_ins_inContnt(_wrk_itmNodes, _ItmNODE_rawCRT(_wrk_rawNodes));
    //---
    rootItm:=_wrk_itmNodes;
    rootRaw:=_wrk_rawNodes;
end;

//------------------------------------------------------------------------------

procedure tInkHDO._CLR_WRK_;
begin
   _wrk_parsed:=FALSE;
    //---
   _wrk_ITMs_CLR;
   _wrk_RAWs_CLR;
   _wrk_LBLs_CLR;
    //---
   //_wrk_StartPOS:=0;
   //_wrk_FinalPOS:=high(longWord);
end;

//------------------------------------------------------------------------------

{function tInkHDO._wrk_StartFinal_isVAlid:boolean;
begin
    result:=(0<=_wrk_StartPOS)and
            (_wrk_StartPOS<_wrk_FinalPOS)and
            (_wrk_FinalPOS<=length(_sourceText));
end;}

//------------------------------------------------------------------------------

{процедура для проведения ЮнитТЕСТОВ}
procedure unitTest__tin0k_hintDOC__setPARSED(In0k_hintDOC:tInkHDO);
begin
    {$hint you use the "terrible" procedure. its use is permitted ONLY from unitTests.}
    In0k_hintDOC._wrk_parsed:=true;
end;

{%endregion --- tInkHDO}

{%region --- tInkHDP ---------------------------------------------- /fold}

procedure tInkHDP._lxr_setSourceTxt(const OL:rInkHDOL; const sourceTxt:string);
begin
    OL.lxr.SourceText:=sourceTxt;
end;

procedure tInkHDP._lxr_setSrcTxtALL(const OL:rInkHDOL);
begin
   _lxr_setSourceTxt(OL,OL.obj._get_source_ALL);
end;

procedure tInkHDP._lxr_setSrcTxtRAW(const OL:rInkHDOL; const node:tInkHD_RAW);
begin
   _lxr_setSourceTxt(OL,OL.obj._get_source_RAW(node));
end;


function tInkHDP._obj_getCntnt_RAW(const OL:rInkHDOL; const node:tInkHD_ITM):tInkHD_RAW;
begin
    result:=OL.obj._itm_fndCntnt(node);
    if result<>nil then begin
        result:=OL.obj._itm_fndChild(result,eRAW_TEXT);
    end;
end;

{
 находим КОНТЕКСТ, в нутри него eRAW_TEXT
}
function tInkHDP._lxr_setSrcTxtITM(const OL:rInkHDOL; const node:tInkHD_ITM):boolean;
var tmp:pointer;
begin
    tmp:=_obj_getCntnt_RAW(OL,node);
    if tmp<>nil
    then _lxr_setSrcTxtRAW(OL,tmp)
    else _lxr_setSourceTxt(OL,'');
end;

//------------------------------------------------------------------------------

{@ Перечислить ВСЕ лексемы токенов.                                      <
    пройти по ВСЕМ лексемам ВСЕХ токенов, и для каждого вызвать callBack Функцию
    @prm OL  агрегатор указателей
    @prm fnk вызываемая функция
}
procedure tInkHDP._enumAllTokenLXMs(const OL:rInkHDOL; const context:pointer; const fnk:tInkHDP_enumAllTokenLXMs__fCallBack);
var tmp_eRaw:eInkHD_RAW;
var listOfLexems:string;
    currentLexem:string;
begin
    for tmp_eRaw:=low(eInkHD_RAW) to High(eInkHD_RAW) do begin
        listOfLexems:=in0k_hintDOC_coreRAW_listOfLexemes(tmp_eRaw);
        while listOfLexems<>'' do begin
            currentLexem:=in0k_hintDOC_coreRAW_excludeLexeme(listOfLexems);
            if currentLexem<>'' then fnk(context,ol.obj,ol.lxr,tmp_eRaw,currentLexem);
        end;
    end;
end;

//------------------------------------------------------------------------------

{---}{%region --- поиск метокТокена ------------------------- /fold}

procedure _parseF0_fill_LBLsList_fCB(const context:pointer; const obj:tInkHDO; const lxr:tInkHDF; const eRaw:eInkHD_RAW; const LXM:string);
var tmpPOS:longword;
    tmpLEN:longword;
    tmpSTR:string;
begin
    if lxr.Enum_chTKN_start(tmpPOS,tmpLEN,LXM) then begin
        repeat
            tmpSTR:=copy(lxr.SourceText,tmpPOS+1,tmpLEN);
            obj._wrk_LBLs_addLBL(tmpSTR);//obj._get_sourceText(tmpPOS,tmpLEN));
        until not lxr.Enum_chTKN_next(tmpPOS,tmpLEN);
    end
end;

procedure tInkHDP._parseF0_fill_LBLsList(const OL:rInkHDOL);
begin
   _lxr_setSrcTxtITM(OL,OL.obj._ITMs_root);
   _enumAllTokenLXMs(OL, nil,@_parseF0_fill_LBLsList_fCB);
    OL.obj._wrk_LBLs_reOrde;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{@поиск "служебного" символа.                                            <
 проходим по всем токенам, берем символ стоящий перед ним и составляем частотный
 список. символ набравшый максимальное количесво вхождений будет служебным.
 ---
 этот алгоритм - эвристика
}
procedure tInkHDP._execute_parseF0(const OL:rInkHDOL);
begin
    with OL do begin
        if obj._tokenLabel<>'' then begin
            obj._wrk_tknLabel:=obj._tokenLabel;
        end
        else begin
           _parseF0_fill_LBLsList(OL);
            obj._wrk_LBLs_reOrde;
            if obj._wrk_lblNodes<>nil
            then obj._wrk_tknLabel:=obj._wrk_LBLs_getMAX
            else obj._wrk_tknLabel:='@'
        end;
    end;
end;

{%endregion}

{---}{%region --- работа аля'Lex ---------------------------- /fold}

procedure tInkHDP._parseS0_fill_nodesText(const obj:tInkHDO);
var tmp:_pRawNODE_;
begin
    tmp:=_pRawNODE_(obj._wrk_rawNodes);
    if tmp<>nil then begin
        if tmp^.POS>0 then obj._wrk_RAWs_ADD(0,tmp^.POS,eRAW_TEXT);
        while tmp^.next<>nil do begin
            if tmp^.eRaw<>eRAW_TEXT then begin
               obj._wrk_RAWs_ADD(tmp^.POS+tmp^.LEN,tmp^.next^.POS-(tmp^.POS+tmp^.LEN),eRAW_TEXT);
            end;
            tmp:=tmp^.next; //<--->
        end;
    end;
end;

procedure tInkHDP._parseS0_fill_nodesText0(const OL:rInkHDOL; const RAW:tInkHD_RAW; const finalPos:longWord);
var tmp:_pRawNODE_;
    lst: longword;
begin
    //--- заполняем промежутки типом "ТЕКСТ"
    tmp:=OL.obj._raw_next(RAW);
    if (tmp<>nil)and(OL.obj._raw_Pos(tmp)<finalPos) then begin
       _pRawNODE_(RAW)^.len:=OL.obj._raw_Pos(tmp)-OL.obj._raw_Pos(RAW);
        lst:=OL.obj._raw_Pos(tmp)+OL.obj._raw_Len(tmp);
        //---
        tmp:=OL.obj._raw_next(tmp);
        while (tmp<>nil)and(OL.obj._raw_Pos(tmp)<finalPos) do begin
            ol.obj._wrk_RAWs_ADD(lst,OL.obj._raw_Pos(tmp)-lst,eRAW_TEXT);
            lst:=OL.obj._raw_Pos(tmp)+OL.obj._raw_Len(tmp);
            tmp:=OL.obj._raw_next(tmp);
        end;
        //--- замыкающий
        if (lst<finalPos) then begin
            ol.obj._wrk_RAWs_ADD(lst,finalPos-lst,eRAW_TEXT);
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDP._parseS0_find_lexeme_LINE(const OL:rInkHDOL; const startPos:longword);
var tmpPOS:longword;
    tmpLEN:longword;
begin
    with OL do begin
        if lxr.enum_SPRTR_start(tmpPOS,tmpLEN) then begin
            repeat
                obj._wrk_RAWs_ADD(startPos+tmpPOS,tmpLEN,eRAW_LINE);
            until not lxr.enum_SPRTR_next(tmpPOS,tmpLEN);
        end;
    end;
end;

procedure tInkHDP._parseS0_find_lexeme_SMBs(const OL:rInkHDOL; const startPos:longword; const eRaw:eInkHD_RAW; const SMBs:string);
var tmpPOS:longword;
    tmpLEN:longword;
begin
    with OL do begin
        if lxr.Enum_Token_start(tmpPOS,tmpLEN,OL.obj._wrk_tknLabel+SMBs) then begin
            repeat
                if obj._wrk_RAWs_TST(startPos+tmpPOS,tmpLEN,eRaw) =nil
                then obj._wrk_RAWs_ADD(startPos+tmpPOS,tmpLEN,eRaw);
            until not lxr.Enum_Token_next(tmpPOS,tmpLEN);
        end;
    end;
end;

procedure tInkHDP._parseS0_find_lexemes(const OL:rInkHDOL; const ITM:tInkHD_ITM; stratPos:longword);
var tmp_eRaw:eInkHD_RAW;
var listOfLexems:string;
    currentLexem:string;
begin
    //---
    if ol.obj._itm_eItm(ITM)=ITM_ROOT then begin
       _parseS0_find_lexeme_LINE(OL,stratPos); //< исчем ВСЕ линии
    end;
    //---
    for tmp_eRaw:=low(eInkHD_RAW) to High(eInkHD_RAW) do begin
        if in0k_hintDOC_coreRAW_in_coreITM(tmp_eRaw, OL.obj._itm_eItm(ITM)) then begin
            listOfLexems:=in0k_hintDOC_coreRAW_listOfLexemes(tmp_eRaw);
            while listOfLexems<>'' do begin
                currentLexem:=in0k_hintDOC_coreRAW_excludeLexeme(listOfLexems);
                if currentLexem<>'' then _parseS0_find_lexeme_SMBs(OL,stratPos,tmp_eRaw,currentLexem);
            end;
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure tInkHDP._processing_rawContent(const OL:rInkHDOL; const SRC:tInkHD_ITM);
var content:tInkHD_ITM;
    src_Raw:tInkHD_RAW;
var BP:rInkHDP_BP;

    finPOS :longword;
    tmp    :pointer;
    lstPOS :longword;
begin
    src_Raw:=OL.obj._itm_rawCntnt(SRC,content);
    if (src_Raw<>nil) then begin
            // выделяем откр/закр скобок (если они есть)
           _processing_brackets_exclude(ol,src_Raw, BP);
           // _lxr_setSrcTxtRAW(ol,src_Raw); //< оно по ходу уже НЕ надо
            //--- исчем ВСЕ лексемы (токены по именам)
           _parseS0_find_lexemes(OL,SRC,OL.obj._raw_Pos(src_Raw));

            finPOS:=OL.obj._raw_Pos(src_Raw)+OL.obj._raw_Len(src_Raw);
           _parseS0_fill_nodesText0(OL,src_Raw,finPOS);

           _processing_rawContent__pickOut_global(OL,SRC,src_Raw,finPOS);

           _processing_rawContent__pickOut_topTXT(OL,SRC);

            // вставим узлы откр/закр скобок (если они были)
           _processing_brackets_addITMs(ol,content, BP);

             {    //--- заполняем промежутки типом "ТЕКСТ"
            tmp:=OL.obj._raw_next(src_Raw);
            if (tmp<>nil)and(OL.obj._raw_Pos(tmp)<finPOS) then begin
               _pRawNODE_(src_Raw)^.len:=OL.obj._raw_Pos(tmp)-OL.obj._raw_Pos(src_Raw);
                lstPOS:=OL.obj._raw_Pos(tmp)+OL.obj._raw_Len(tmp);
                //---
                tmp:=OL.obj._raw_next(tmp);
                while (tmp<>nil)and(OL.obj._raw_Pos(tmp)<finPOS) do begin
                    ol.obj._wrk_RAWs_ADD(lstPOS,OL.obj._raw_Pos(tmp)-lstPOS,eRAW_TEXT);
                    lstPOS:=OL.obj._raw_Pos(tmp)+OL.obj._raw_Len(tmp);
                    tmp:=OL.obj._raw_next(tmp);
                end;
                //--- замыкающий
                if (lstPOS<finPOS)and
                   ((tmp=nil)or(OL.obj._raw_Pos(tmp)=finPOS))
                then begin
                    ol.obj._wrk_RAWs_ADD(lstPOS,finPOS-lstPOS,eRAW_TEXT);
                end;
            end;
            end;
        }
    end;
end;


{function tInkHDP._itm_sct_eRaw(const OL:rInkHDOL; const node:tInkHD_ITM):eInkHD_RAW;
var tmp:pointer;
begin
    tmp:=OL.obj._itm_fndCntnt(node);
    if tmp<>nil then begin
        tmp:=OL.obj._itm_chld(tmp);
        if tmp<>nil
    end;


end;}

procedure tInkHDP._processing_rawContent__insert_in_SCTN(const OL:rInkHDOL; const Parent:tInkHD_ITM; const Token,Cntnt:tInkHD_RAW; var SCTN:tInkHD_ITM);
begin
    if ((SCTN=nil)or(OL.obj._itm_SCTN_eRAW(SCTN)<>ol.obj._raw_eRaw(Token)))
    or ((OL.obj._raw_eRaw(Token)=eRAW_LINE))
    then begin
        SCTN:=OL.obj._ITM_crt_ITM(ITM_SCTN);
        OL.obj._ITM_ins_inContnt(Parent,SCTN);
    end;
    //---
    OL.obj._ITM_ins_inContnt(SCTN,OL.obj._itm_NODE_CRT(Token,Cntnt));
end;

procedure tInkHDP._processing_rawContent__insert_as_SCTN(const OL:rInkHDOL; const Parent:tInkHD_ITM; const Token,Cntnt:tInkHD_RAW; var SCTN:tInkHD_ITM);
begin
    SCTN:=OL.obj._itm_SCTN_CRT(Token,Cntnt);
    OL.obj._ITM_ins_inContnt(Parent,SCTN);
end;


procedure tInkHDP._processing_rawContent__pickOut_global(const OL:rInkHDOL; const Source:tInkHD_ITM; const startRAW:tInkHD_RAW; const stopPos:longWord);
var tmpSCTN:tInkHD_ITM; //< текущая секция
    tmpNode:tInkHD_RAW;
    tmpText:tInkHD_RAW;
begin
    tmpSCTN:=nil;
    tmpNode:=startRAW;
    //----
    while (tmpNode<>nil)and(OL.obj._raw_Pos(tmpNode)<stopPos) do begin
        //--- выделяем контент принадлежащий tmpNode (сразу за ним идет)
        tmpText:=OL.obj._raw_next(tmpNode);
        if (tmpText<>nil)and(OL.obj._raw_eRaw(tmpText)<>eRAW_TEXT)
        then tmpText:=nil; //< от ОБЯЗАТЕЛЬНО должен быть текстом
        //--- встраиваем в структуру родителя
        if in0k_hintDOC_coreRAW_isNODE(OL.obj._raw_eRaw(tmpNode))
        then _processing_rawContent__insert_in_SCTN(OL,Source,tmpNode,tmpText,tmpSCTN)
       else
        if (OL.obj._raw_eRaw(tmpNode)=eRAW_LINE)
        then _processing_rawContent__insert_as_SCTN(OL,Source,tmpNode,tmpText,tmpSCTN)
       else begin
            // ничего не нашли для вставки, по идее такого не должно быть
        end;
        //---> шаг вперед
        if tmpText<>nil
        then tmpNode:=OL.obj._raw_next(tmpText)
        else tmpNode:=OL.obj._raw_next(tmpNode)
    end;
end;

//------------------------------------------------------------------------------

{%region --- выделение основных текстов --------------------------- /fold}

function tInkHDP._processing_rawContent__pickOut_topTXT_cutSrvSMB(const OL:rInkHDOL; const Source:tInkHD_RAW; const l:tInkHDP_byteCNT; out tmpLBL:tInkHD_RAW):boolean;
begin
    if l>0 then tmpLBL:=OL.obj._wrk_RAWs_CLP_start(Source,l,eRAW_lblTKN)
    else tmpLBL:=nil;
    result:=tmpLBL<>nil;
end;


// самый простой случай, все в "статью"
procedure tInkHDP._processing_rawContent__pickOut_topTXT_parce_AS_0A(const OL:rInkHDOL; const Source:tInkHD_RAW; const l:tInkHDP_byteCNT; out itm_cpt,itm_art:tInkHD_ITM);
var tmpLBL:tInkHD_RAW;
begin
    if _processing_rawContent__pickOut_topTXT_cutSrvSMB(OL,Source,l,tmpLBL) then begin
       _lxr_setSrcTxtRAW(OL,Source);
    end;
    //---
    itm_cpt:=nil;
    itm_art:=OL.obj._ITM_crt_ITM(eITM_article);
             OL.obj._ITM_ins_cldrFrst(itm_art,OL.obj._ITM_crt_RAW(Source));
             if Assigned(tmpLBL) then begin
                OL.obj._ITM_ins_cldrFrst(itm_art,OL.obj._ITM_crt_RAW(tmpLBL));
             end;
end;

procedure tInkHDP._processing_rawContent__pickOut_topTXT_parce_AS_CA(const OL:rInkHDOL; const Source:tInkHD_RAW; const l:tInkHDP_byteCNT; out itm_cpt,itm_art:tInkHD_ITM);
var tmpLBL:tInkHD_RAW;
    tmpLEN:tInkHDP_byteCNT;
begin
    itm_cpt:=nil;
    itm_art:=nil;
    //---
    if _processing_rawContent__pickOut_topTXT_cutSrvSMB(OL,Source,l,tmpLBL) then begin
       _lxr_setSrcTxtRAW(OL,Source);
    end;
    //--- собираем значения
    if OL.lxr.Find_First_LINE(tmpLEN) and (tmpLEN>0) then begin
        if tmpLEN<_pRawNODE_(Source)^.len then begin
            itm_cpt:=OL.obj._ITM_crt_ITM(eITM_caption,ol.obj._wrk_RAWs_CLP_start(Source,tmpLEN));
            itm_art:=OL.obj._ITM_crt_ITM(eITM_article,Source);
        end
        else begin //< это тока имя
            itm_cpt:=OL.obj._ITM_crt_ITM(eITM_article,Source);
        end;
    end;
    //--- вставляем метку токена в "ЗАГОЛОВОК"
    if tmpLBL<>nil then begin
        if itm_cpt=nil then itm_cpt:=OL.obj._ITM_crt_ITM(eITM_caption);
        OL.obj._ITM_ins_cldrFrst(itm_cpt,OL.obj._ITM_crt_RAW(tmpLBL));
    end;
end;

procedure tInkHDP._processing_rawContent__pickOut_topTXT_parce_AS_DD(const OL:rInkHDOL; const Source:tInkHD_RAW; const l:tInkHDP_byteCNT; out itm_dfn,itm_dsc:tInkHD_ITM);
var tmpLEN:tInkHDP_byteCNT;
begin
    itm_dfn:=nil;
    itm_dsc:=nil;
    //---
    if OL.lxr.Find_First_WORD(tmpLEN) and (tmpLEN>0) then begin
        if tmpLEN<_pRawNODE_(Source)^.len then begin
            itm_dfn:=OL.obj._ITM_crt_ITM(eITM_defined,ol.obj._wrk_RAWs_CLP_start(Source,tmpLEN));
            itm_dsc:=OL.obj._ITM_crt_ITM(eITM_details,Source);
        end
        else begin //< это тока имя
            itm_dfn:=OL.obj._ITM_crt_ITM(eITM_defined,Source);
        end;
    end
    {$ifOPT D+}
    else begin
       Assert(false,'not Found');
    end;
    {$endIf}
end;

function tInkHDP._processing_rawContent__pickOut_topTXT_parce_Mode (const OL:rInkHDOL; const Source:tInkHD_ITM; const l:tInkHDP_byteCNT):tIn0k_hintDOC_FTPM;
var tmp_eRAW:eInkHD_RAW;
begin
    tmp_eRAW:=eRAW_NDF;
 {   case OL.obj._itm_eItm(Source) of
      ITM_ROOT: ;
     eITM_NODE: ;
      ITM_SCTN: ;
    end;
    end;}

end;

function tInkHDP._processing_rawContent__pickOut_topTXT_FIND(const OL:rInkHDOL; const Source:tInkHD_ITM; out itmText:tInkHD_ITM; out rawTxt:tInkHD_RAW):boolean;
begin
    result:=false;
    itmText:=OL.obj._itm_fndCntnt(Source);
    if itmText<>nil then begin
        itmText:=OL.obj._itm_chld(itmText);
        while itmText<>nil do begin
            if OL.obj._itm_eItm(itmText)=itm_raw then begin
                rawTxt:=OL.obj._itm_chld(itmText);
                if OL.obj._raw_eRaw(rawTxt)=eRAW_TEXT then begin
                    result:=true;
                    break;
                end;
            end;
            //--->
            itmText:=OL.obj._itm_next(itmText);
        end;
    end;
end;

function tInkHDP._processing_rawContent__pickOut_topTXT_present(const OL:rInkHDOL; const Source:tInkHD_ITM; out eRaw_forSelectMODE:eInkHD_RAW):boolean;
begin
    case ol.obj._itm_eItm(Source) of
        ITM_ROOT:begin
                eRaw_forSelectMODE:=eRAW_NDF;
                result:=true;
            end;
        eITM_NODE:begin
                eRaw_forSelectMODE:=OL.obj._itm_NODE_eRAW(Source);
                result:=eRaw_forSelectMODE<>eRAW_NDF;
            end;
        ITM_SCTN:begin
                eRaw_forSelectMODE:=OL.obj._itm_SCTN_eRAW(Source);
                result:=eRaw_forSelectMODE=eRAW_LINE;
            end;
        else begin
            result:=FALSE;
        end;
    end;
end;


{}
procedure tInkHDP._processing_rawContent__pickOut_topTXT(const OL:rInkHDOL; const Source:tInkHD_ITM);
var eRaw_forSelectMODE:eInkHD_RAW;
    SelectMODE:tIn0k_hintDOC_FTPM;
    selectSrvSMB:boolean;
var tmpROOT:tInkHD_ITM;
var itmText:tInkHD_ITM;
    rawText:tInkHD_RAW;
var BP:rInkHDP_BP;// bOpnPOS,bOpnLEN,bClsPOS,bClsLEN:longWord;

    len:tInkHDP_byteCNT;
var itm00:tInkHD_ITM;
var itm01:tInkHD_ITM;
begin
    // не для всех узлов мы это делаем
    if _processing_rawContent__pickOut_topTXT_present(OL,Source,eRaw_forSelectMODE) then begin
        if _processing_rawContent__pickOut_topTXT_FIND(OL,Source,itmText,rawText) then begin
           _pItmNODE_(itmText)^.chld:=NIL;
            //---
           _processing_brackets_exclude(OL,rawText, BP);
            if ol.lxr.Find_First_SMBs(len,ol.obj._wrk_tknLabel)
            then begin
                SelectMODE:=in0k_hintDOC_coreITM_parseTopTEXT_spcl(eRaw_forSelectMODE,selectSrvSMB);
                if not selectSrvSMB then len:=0;
            end
            else begin
                SelectMODE:=in0k_hintDOC_coreITM_parseTopTEXT_sngl(eRaw_forSelectMODE);
            end;
            //---
            case SelectMODE of
                FTPM_CA:_processing_rawContent__pickOut_topTXT_parce_AS_CA(OL,rawText,len,itm00,itm01);
                FTPM_0A:_processing_rawContent__pickOut_topTXT_parce_AS_0A(OL,rawText,len,itm00,itm01);
                FTPM_DD:_processing_rawContent__pickOut_topTXT_parce_AS_DD(OL,rawText,len,itm00,itm01);
            end;
            tmpROOT:=OL.obj._ITM_crt_ITM(ITM_ROOT); //< временное хранилище
            if itm01<>nil then begin
                OL.obj._ITM_ins_cldrFrst(tmpROOT,itm01);
               _processing_rawContent__pickOut_strEXT(OL,itm01);
            end;
            if itm00<>nil then begin
                OL.obj._ITM_ins_cldrFrst(tmpROOT,itm00);
               _processing_rawContent__pickOut_strEXT(OL,itm00);
            end;
            //---
           _processing_brackets_addITMs(OL,tmpROOT, BP);
            //---
            OL.obj._ITM_rplc_to_CHLD(itmText,tmpROOT);
        end;
    end;
end;

{выделить "Расширитель Строки"}
procedure tInkHDP._processing_rawContent__pickOut_strEXT(const OL:rInkHDOL; const Source:tInkHD_ITM);
var tmp,tmq:pointer;
var POS,LEN:tIHDF_nmbr;
begin
    if OL.obj._itm_eItm(Source) in [eITM_article,eITM_caption] then begin
        tmp:=OL.obj._itm_fndChild(Source,eRAW_TEXT);
        if Assigned(tmp) then begin
           _lxr_setSrcTxtRAW(OL,tmp);
            if OL.lxr.Find_string_EXT(POS,LEN) then begin
                // агась, нашли таки -- выделяем
                tmq:=OL.obj._wrk_RAWs_CLP_final(tmp,POS);
                tmp:=OL.obj._wrk_RAWs_CLP_start(tmq,LEN,eRAW_strEXT);
                //---
                OL.obj._ITM_ins_cldrLast(Source,OL.obj._ITM_crt_RAW(tmp));
                OL.obj._ITM_ins_cldrLast(Source,OL.obj._ITM_crt_RAW(tmq));
            end;
        end;
    end;
end;

{%endregion}

{%region --- работа со скобками ----------------------------------- /fold}

// исем открывающую и закрывающую и уменьшаем размер RAW
function tInkHDP._processing_brackets_excPAIR(const OL:rInkHDOL; const Source:tInkHD_RAW; const brk_OPN,brk_CLS:string):boolean;
var bOpnPOS,bOpnLEN,bClsPOS,bClsLEN:longWord;
begin
    result:=OL.lxr.Find_brackets(bOpnPOS,bOpnLEN,bClsPOS,bClsLEN, brk_OPN,brk_CLS);
    if result then begin //< угу ... паримся
       _pRawNODE_(Source)^.pos:=_pRawNODE_(Source)^.pos+bOpnPOS-1+bOpnLEN;
       _pRawNODE_(Source)^.len:= bClsPOS-1-(bOpnPOS-1+bOpnLEN);
    end;
end;

// проходим по ВСЕМ парам скобок, пока не перестанет искаться
procedure tInkHDP._processing_brackets_exclude(const OL:rInkHDOL; const Source:tInkHD_RAW; var BP:rInkHDP_BP);
var beenFound:boolean;
begin {todo : делать по НАБОРУ скобок}
    //--- запоминаем с чего начали
    BP.bOpnPOS:=OL.obj._raw_Pos(Source);
    BP.bClsLEN:=OL.obj._raw_Len(Source);
    //--- собственно поиск
    repeat
       _lxr_setSrcTxtRAW(ol,Source);
        beenFound:=false
            or _processing_brackets_excPAIR(OL,Source, '(',')')
            or _processing_brackets_excPAIR(OL,Source, '[',']')
            or false;
    until not beenFound;
    //--- расчет начал и концов
    if (BP.bOpnPOS<OL.obj._raw_Pos(Source))and(OL.obj._raw_Len(Source)<BP.bClsLEN)
    then begin //< ага-ага ... вырезаем
        BP.bOpnPOS:=BP.bOpnPOS;
        BP.bOpnLEN:=OL.obj._raw_Pos(Source)-BP.bOpnPOS;
        //---
        BP.bClsPOS:=OL.obj._raw_Pos(Source)+OL.obj._raw_Len(Source);
        BP.bClsLEN:=BP.bClsLEN-BP.bOpnLEN-OL.obj._raw_Len(Source);
    end
    else begin
        BP.bOpnLEN:=0;
        BP.bClsLEN:=0;
    end;
end;

procedure tInkHDP._processing_brackets_addITMs(const OL:rInkHDOL; const Parent:tInkHD_ITM; const BP:rInkHDP_BP);
begin
    if (0<BP.bOpnLEN)and(0<BP.bClsLEN) then begin
        OL.obj._ITM_ins_cldrFrst(Parent,OL.obj._ITM_crt_RAW(OL.obj._wrk_RAWs_ADD(BP.bOpnPOS,BP.bOpnLEN,eRAW_brkOpn)));
        OL.obj._ITM_ins_cldrLast(Parent,OL.obj._ITM_crt_RAW(OL.obj._wrk_RAWs_ADD(BP.bClsPOS,BP.bClsLEN,eRAW_brkCls)));
    end;
end;

{%endregion}


{%endregion}

function tInkHDP._parse00_makeROOT(const OL:rInkHDOL):boolean;
var itmROOT:tInkHD_ITM;
    rawROOT:tInkHD_RAW;
    tmp_raw:tInkHD_RAW;
    tmp_itm:tInkHD_ITM;
    tmq_itm:tInkHD_ITM;
    tknPOS,tknLEN:longWord;
begin
    result:=TRUE;
    OL.obj._wrk_ROOT_CRT(itmROOT,rawROOT);
    //--- поговорим о НАЧАЛЬНОМ токене
    if result and (OL.obj.TokenStart<>'') then begin
       _lxr_setSrcTxtITM(ol,itmROOT);
        if OL.lxr.Find_single_TKN(tknPOS,tknLEN,OL.obj.TokenStart) then begin
            //--- СОБИРАЕМ узел СТАРТ
            tmq_itm:=OL.obj._ITM_crt_ITM(eITM_doc_START);
            // токен
            tmp_raw:=OL.obj._wrk_RAWs_CLP_start(rawROOT,tknPOS+tknLEN,eRaw_docOPN);
            tmp_itm:=OL.obj._ITM_crt_ITM(ITM_token,tmp_raw);
            OL.obj._ITM_ins_cldrFrst (tmq_itm,tmp_itm);
            // текст ПЕРЕД ним
            if tknPOS>0 then begin
                tmp_raw:=OL.obj._wrk_RAWs_CLP_start(tmp_raw,tknPOS,eRAW_TEXT);
                tmp_itm:=OL.obj._ITM_crt_ITM(Itm_SRV,tmp_raw);
                OL.obj._ITM_ins_cldrFrst (tmq_itm,tmp_itm);
            end;
            //--- добавляем в структуру
            OL.obj._ITM_ins_cldrFrst(itmROOT,tmq_itm);
        end
        else begin
            if OL.obj.TokenStartMustBe then begin
                result:=false;
            end;
        end;
    end;
    //--- поговорим о ФИНАЛЬНОМ токене
    if result and (OL.obj.TokenFinal<>'') then begin
       _lxr_setSrcTxtITM(ol,itmROOT);
        if OL.lxr.Find_single_TKN(tknPOS,tknLEN,OL.obj.TokenFinal) then begin
            //--- СОБИРАЕМ узел ФИНАЛ
            tmq_itm:=OL.obj._ITM_crt_ITM(eITM_doc_FINAL);
            // токен
            tmp_raw:=OL.obj._wrk_RAWs_CLP_final(rawROOT,tknPOS,eRAW_docCLS);
            tmp_itm:=OL.obj._ITM_crt_ITM(ITM_token,tmp_raw);
            OL.obj._ITM_ins_cldrFrst(tmq_itm,tmp_itm);
            // текст ПОСЛЕ него
            if tknLEN<_pRawNODE_(tmp_raw)^.len then begin
                tmp_raw:=OL.obj._wrk_RAWs_CLP_final(tmp_raw,tknLEN,eRAW_TEXT);
                tmp_itm:=OL.obj._ITM_crt_ITM(Itm_SRV,tmp_raw);
                OL.obj._ITM_ins_cldrLast (tmq_itm,tmp_itm);
            end;
            //--- добавляем в структуру
            OL.obj._ITM_ins_cldrLast(itmROOT,tmq_itm);
        end
        else begin
            if OL.obj.TokenFinalMustBe then begin
                result:=false;
            end;
        end;
    end;
end;

function tInkHDP._parse01_slct_LBL(const OL:rInkHDOL):boolean;
begin
    if OL.obj._tokenLabel<>'' then begin
        OL.obj._wrk_tknLabel:=OL.obj._tokenLabel;
    end
    else begin
       _parseF0_fill_LBLsList(OL);  //<
        if OL.obj._wrk_lblNodes<>nil
        then OL.obj._wrk_tknLabel:=OL.obj._wrk_LBLs_getMAX
        else OL.obj._wrk_tknLabel:=in0k_hintDOC_labelToken;
    end;
end;

{function tInkHDP._parse_I_findLXMs(const OL:rInkHDOL; const ITM:tInkHD_ITM):boolean;
begin
    //
end;}

{---}{%region --- работа аля'Yacc --------------------------- /fold}




{выделить "символ Строки-Расширитель"                                    <
  @prm node     первичный-Узел, который рассматриваем на предмет наличия
                "Удлинителя строки"
  @prm src_ITM  узел-Структуры, в который в конечном итоге вставим найденные
                и дополнительно созданные Первичные-УЗЛЫ
}
(*procedure tInkHDP._parseS1_find_stringEXT(const OL:rInkHDOL; const node:tInkHD_RAW; const src_ITM:tInkHD_RAW);
var extPos:longWord;
    extLen:longWord;
begin
  with OL do begin
    if Assigned(node) then begin
       _lxr_setSrcTxtRAW(OL,node);
        if lxr.Find_string_EXT(extPos,extLen) then begin //< онбнаружен "символ Строки-Расширитель"
            if extPos+extLen=_pRawNODE_(node)^.len then begin //< в конце
                obj._ITM_ins_cldrLast(src_ITM,obj._ITM_crt_RAW(obj._wrk_RAWs_CLP(node,extPos),eRAW_TEXT));
                obj._ITM_ins_cldrLast(src_ITM,obj._ITM_crt_RAW(node,eRAW_strEXT));
            end
            else begin //< он где-то в середине текста
                obj._ITM_ins_cldrLast(src_ITM,obj._ITM_crt_RAW(obj._wrk_RAWs_CLP(node,extPos),eRAW_TEXT));
                obj._ITM_ins_cldrLast(src_ITM,obj._ITM_crt_RAW(obj._wrk_RAWs_CLP(node,extLen),eRAW_strEXT));
                obj._ITM_ins_cldrLast(src_ITM,obj._ITM_crt_RAW(node,eRAW_TEXT));
            end;
        end
        else begin //< ничего нет, сплошной текст
            obj._ITM_ins_cldrLast(src_ITM,obj._ITM_crt_RAW(node,eRAW_TEXT));
        end;
    end;
  end;
end;*)

{@Выделить Заголовок-Текст [тип0].
  Заголовок ДОЛЖЕН быть отмечен служебным символом, стоящим в начале текста.
  ---
  Используется при разборе HEADER.
}
(*procedure tInkHDP._parseS1_find_TTL_TXT_0(const OL:rInkHDOL; const node:tInkHD_RAW; out iTTL,iTXT:tInkHD_ITM);
var len:longword;
    leF:LongWord;
    tmp:pointer;
begin
    iTTL:=nil;
    iTXT:=nil;
    with OL do begin
        if Assigned(node) and (_pRawNODE_(node)^.eRaw=eRAW_TEXT) then begin
           _lxr_setSrcTxtRAW(OL,node);
            if lxr.TextFindFirst_srvSMB(len,obj._wrk_tknLabel) then begin
                //--- создаем ТИТЛ и выделяем (вставляем в него) служебный символ
                iTTL:=obj._ITM_crt_ITM(Itm_Title);
                obj._ITM_ins_cldrLast(iTTL,obj._ITM_crt_RAW(obj._wrk_RAWs_CLP(node,len),eRAW_lblTKN));
                //--- выделяем ПЕРВУЮ строку (которая и ЕСТЬ заголовок)
               _lxr_setSrcTxtRAW(OL,node);
                if lxr.TextFindFirst_LINE01(leF) then begin
                    if lef<_pRawNODE_(node)^.len then begin
                        // текс МНОГО строчный и нашли начало ОПИСАНИЯ
                        tmp :=obj._wrk_RAWs_CLP(node,leF);
                        iTXT:=obj._ITM_crt_ITM(ITM_Text,node);
                    end
                    else begin //< ОДНОСТРОЙНЫЙ => ТОЛЬКО заголовок
                        tmp:=node;
                    end;
                    if OL.obj._extractStringEXT
                    then _parseS1_find_stringEXT(OL,tmp,iTTL)
                    else  ol.obj._ITM_ins_cldrLast(iTTL,obj._ITM_crt_RAW(tmp,eRAW_TEXT));
                end;
            end
            else begin //< все ... это ПРОСТО описание
                iTXT:=obj._ITM_crt_ITM(Itm_Text);
                if OL.obj._extractStringEXT
                then _parseS1_find_stringEXT(OL,node,iTXT)
                else  ol.obj._ITM_ins_cldrLast(iTXT,obj._ITM_crt_RAW(node,eRAW_TEXT));
            end;
        end;
    end;
end; *)

{@Выделить Заголовок-Текст [тип1].
  Заголовком считается ПЕРВАЯ строка до символ(а|ов) перевода строки
  ---
  Используется при разборе PRM.
}
(*procedure tInkHDP._parseS1_find_TTL_TXT_1(const OL:rInkHDOL; const node:tInkHD_RAW; out iTTL,iTXT:tInkHD_ITM);
var len:LongWord;
//    leF:longword;
    tmp:pointer;
begin
    iTTL:=nil;
    iTXT:=nil;
    with OL do begin
        if Assigned(node) and (_pRawNODE_(node)^.eRaw=eRAW_TEXT) then begin
           _lxr_setSrcTxtRAW(OL,node);
            if lxr.TextFindFirst_LINE01(len) then begin
                iTTL:=obj._ITM_crt_ITM(Itm_Title);
                    if len<_pRawNODE_(node)^.len then begin
                        // текс МНОГО строчный и нашли начало ОПИСАНИЯ
                        tmp :=obj._wrk_RAWs_CLP(node,len);
                        iTXT:=obj._ITM_crt_ITM(ITM_Text,node);
                    end
                    else begin //< ОДНОСТРОЙНЫЙ => ТОЛЬКО заголовок
                        tmp:=node;
                    end;
                    if OL.obj._extractStringEXT
                    then _parseS1_find_stringEXT(OL,tmp,iTTL)
                    else  ol.obj._ITM_ins_cldrLast(iTTL,obj._ITM_crt_RAW(tmp,eRAW_TEXT));
            end
            else begin //< все ... это ПРОСТО описание
                iTXT:=obj._ITM_crt_ITM(Itm_Text);
                if OL.obj._extractStringEXT
                then _parseS1_find_stringEXT(OL,node,iTXT)
                else  ol.obj._ITM_ins_cldrLast(iTXT,obj._ITM_crt_RAW(node,eRAW_TEXT));
            end;
        end;
    end;
end;*)


(*procedure tInkHDP._parseS1_find_Titl_Text(const OL:rInkHDOL; const node:tInkHD_RAW; out Titl,Text:tInkHD_ITM);
var len:longword;
    leF:longword;
    tmp:pointer;
begin
    Titl:=nil;
    Text:=nil;
   { with OL do begin
        if Assigned(node) and (_pRawNODE_(node)^.eRaw=eRAW_TEXT) then begin
           _lxr_setSrcTxtRAW(OL,node);
            if lxr.TextFindFirst_srvSMB(len,obj._wrk_tknLabel) then begin
                //--- создаем ТИТЛ и выделяем (вставляем в него) служебный символ
                Titl:=obj._ITM_crt_ITM(Itm_Title);
                obj._ITM_ins_cldrLast(Titl,obj._ITM_crt_RAW(obj._wrk_RAWs_CLP(node,len),eRAW_lblTKN));
                //--- выделяем ПЕРВУЮ строку (которая и ЕСТЬ заголовок)
               _lxr_setSrcTxtRAW(OL,node);
                if lxr.TextFindFirst_LINE01(leF,obj._wrk_tknLabel) then begin
                    if lef<_pRawNODE_(node)^.len then begin
                        // текс МНОГО строчный и нашли начало ОПИСАНИЯ
                        tmp :=obj._wrk_RAWs_CLP(node,leF);
                        Text:=obj._ITM_crt_ITM(ITM_Text,node);
                    end
                    else begin //< ОДНОСТРОЙНЫЙ => ТОЛЬКО заголовок
                        tmp:=node;
                    end;
                    if OL.obj._extractStringEXT
                    then _parseS1_find_stringEXT(OL,tmp,Titl)
                    else  ol.obj._ITM_ins_cldrLast(Titl,obj._ITM_crt_RAW(tmp,eRAW_TEXT));
                end;
            end
            else begin //< все ... это ПРОСТО описание
                Text:=obj._ITM_crt_ITM(Itm_Text);
                if OL.obj._extractStringEXT
                then _parseS1_find_stringEXT(OL,node,Text)
                else  ol.obj._ITM_ins_cldrLast(Text,obj._ITM_crt_RAW(node,eRAW_TEXT));
            end;
        end;
    end; }
end;    *)


{function tInkHDP._exclude_brackets(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_RAW;
var bOpnPOS,bOpnLEN,bClsPOS,bClsLEN:longWord;
    tmp:tInkHD_RAW;
begin
    result:=node;
    if (node<>nil) and (OL.obj._raw_eRaw(node)=eRAW_TEXT) then begin
       _lxr_setSrcTxtRAW(OL,node);
        if OL.lxr.TextFind_brackets('(',')',bOpnPOS,bOpnLEN,bClsPOS,bClsLEN) and (bOpnPOS=1)then begin
           tmp:=OL.obj._wrk_RAWs_CLP(node,bOpnPOS+bOpnLEN-1);
          _pRawNODE_(tmp)^.eRaw:=eRAW_brkOpn;
           //
           result:=OL.obj._wrk_RAWs_CLP(node,bClsPOS-(bOpnPOS+bOpnLEN)-1);
           //--
          _pRawNODE_(node)^.eRaw:=eRAW_brkCls;
        end;
    end;
end; }


(*procedure tInkHDP._parseS1_find_Name_Note(const OL:rInkHDOL; const node:tInkHD_RAW; out Name,Note:tInkHD_ITM);
var len:longword;
    tmp:tInkHD_RAW;
begin
{    Name:=nil;
    Note:=nil;
    with OL do begin
        if (node<>nil) and (obj._raw_eRaw(node)=eRAW_TEXT) then begin
           tmp:=_exclude_brackets(OL,node);
          _lxr_setSrcTxtRAW(OL,tmp);
//            LXR.TextFind_brackets();//           _parseS1_find_Name_Note


            if lxr.TextFindFirst_WORD(len) and (len>0) then begin
                if len<_pRawNODE_(tmp)^.len then begin
                    Name:=obj._ITM_crt_ITM(Itm_Name,obj._wrk_RAWs_CLP(tmp,len));
                    Note:=obj._ITM_crt_ITM(Itm_Note,tmp);
                end
                else begin //< это тока имя
                    Name:=obj._ITM_crt_ITM(Itm_Name,tmp);
                end;
            end
            else begin
               // эм ... чЁли нет ниче?
            end;
        end;
    end;}
end; *)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

(*function tInkHDP._parseS1_make_lex2Token(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
var len:longword;
    pos:longword;
    tmp:pointer;
begin
    result:=nil;
  with OL do begin
    if Assigned(node) and ( in0k_hintDOC_coreRAW_haveLexemes(obj._raw_eRaw(node))) then begin
       _lxr_setSrcTxtRAW(OL,node);
        if lxr.enum_Lexem_start(pos,len,obj._wrk_tknLabel) then begin
            result:=obj._ITM_crt_ITM(ITM_token);
            //---
            tmp:=obj._wrk_RAWs_CLP(node,len);
            tmp:=obj._ITM_crt_RAW(tmp,eRAW_lblTKN);
            obj._ITM_ins_cldrLast(result,tmp);
            //---
            tmp:=obj._ITM_crt_RAW(node);
            obj._ITM_ins_cldrLast(result,tmp);
        end;
    end;
  end;
end; *)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

(*function tInkHDP._parseS1_make_prt_TiTxt(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
var tmpTitl:pointer;
    tmpText:pointer;
    tmp    :pointer;
begin
    result:=nil;
    with OL do begin
       _parseS1_find_Titl_Text(OL,node, tmpTitl,tmpText);
        //-----
        if (tmpTitl<>nil)or(tmpText<>nil) then begin
            if tmpTitl<>nil then obj._ITM_ins_nextLast(result,tmpTitl);
            if tmpText<>nil then begin
                tmp:=obj._ITM_crt_ITM(ITM_content);
                obj._ITM_ins_cldrLast(tmp,tmpText);
                obj._ITM_ins_nextLast(result,tmp);
            end;
        end;
    end;
end; *)

(*function tInkHDP._parseS1_make_grp_TiTxt(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
var tmpTitl:tInkHD_RAW;
    tmpText:tInkHD_RAW;
begin
    result:=nil;
    with OL do begin
       _parseS1_find_TTL_TXT_0(OL,node, tmpTitl,tmpText);
        //-----
        if (tmpTitl<>nil)or(tmpText<>nil) then begin
            if tmpTitl<>nil then obj._ITM_ins_nextLast(result,tmpTitl);
            if tmpText<>nil then obj._ITM_ins_nextLast(result,tmpText);
        end;
    end;
end;*)


{Поиск и создание узлов Заголовок->Текст [тип0].                         <
    @ret сформированная структура iTTL->iTXT
}
(*function tInkHDP._parseS1_make_TTL_TST_0(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
var tmpTitl:tInkHD_RAW;
    tmpText:tInkHD_RAW;
begin
    result:=nil;
    with OL do begin
       _parseS1_find_TTL_TXT_0(OL,node, tmpTitl,tmpText);
        //-----
        if (tmpTitl<>nil)or(tmpText<>nil) then begin
            if tmpTitl<>nil then obj._ITM_ins_nextLast(result,tmpTitl);
            if tmpText<>nil then obj._ITM_ins_nextLast(result,tmpText);
        end;
    end;
end;*)

{Поиск Заголовок-Текст для секции SECTION.                               <
    @ret сформированная структура iTTL->iTXT
    ---
    отличается от `_parseS1_make_hdr_TiTxt` способом поиска ЗАГОЛОВКА
}
(*function tInkHDP._parseS1_make_sct_TiTxt(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
var tmpTitl:tInkHD_RAW;
    tmpText:tInkHD_RAW;
begin
    result:=nil;
    with OL do begin
       _parseS1_find_TTL_TXT_1(OL,node, tmpTitl,tmpText);
        //-----
        if (tmpTitl<>nil)or(tmpText<>nil) then begin
            if tmpTitl<>nil then obj._ITM_ins_nextLast(result,tmpTitl);
            if tmpText<>nil then obj._ITM_ins_nextLast(result,tmpText);
        end;
    end;
end; *)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

(*function tInkHDP._parseS1_make_tkn_NmNte(const OL:rInkHDOL; const node:tInkHD_RAW):tInkHD_ITM;
var tmpName:tInkHD_RAW;
    tmpNote:tInkHD_RAW;
begin
    result:=nil;
  with OL do begin
   _parseS1_find_Name_Note(OL,node, tmpName,tmpNote);
    //-----
    if (tmpName<>nil)or(tmpNote<>nil) then begin
        if tmpName<>nil then obj._ITM_ins_nextLast(result,tmpName);
        if tmpNote<>nil then obj._ITM_ins_nextLast(result,tmpNote);
    end;
  end;
end;*)

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

(*procedure tInkHDP._execute_parseS1(const OL:rInkHDOL);
var //< ОЧЕНЬ внутренние переменные
  __cur_PRT__:tInkHD_ITM;
  __cur_GRP__:tInkHD_ITM;
  __lst_PRM__:tInkHD_ITM;
  __cur_gVAL_:tInkHD_ITM;

    {%region inLineFNC /fold}

    procedure __cur_PART__CLS__;
    begin
      __cur_PRT__:=nil;
    end;

    function __cur_PART__get__:tInkHD_ITM;
    begin
        if not Assigned(__cur_PRT__) then begin
          __cur_PRT__:=OL.obj._ITM_crt_ITM(ITM_section);
            OL.obj._ITM_ins_cldrLast(OL.obj._ITMs_root,__cur_PRT__);
        end;
        result:=__cur_PRT__
    end;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    procedure __lst_PRM__set__(ITM:tInkHD_ITM);
    begin
        if (ITM<>nil)and(_pItmNODE_(ITM)^.eItm=itm_PRM)
        then __lst_PRM__:=ITM
        else __lst_PRM__:=nil;
    end;

    procedure __lst_PRM__clr__;
    begin
      __lst_PRM__set__(nil);
    end;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    procedure __cur_GROUP__set__(GRP:tInkHD_ITM{; RAW:tInkHD_RAW});
    begin
        //if (raw<>nil)and(_pRawNODE_(raw)^.next<>nil)
        //and(_pRawNODE_(raw)^.next^.eRaw=eRAW_tkn_VAL)
        //then begin //< это группа для переменных идет
      __cur_GRP__:=GRP;

        //end;
    end;

    procedure __cur_GROUP__CLS__;
    begin
      __cur_GROUP__set__(nil);
    end;

    function __cur_GROUP__get__(eITM:eInkHD_ITM):tInkHD_ITM;
    var grp_eITM:eInkHD_ITM;
    begin
        grp_eITM:=ITM_NDF;
        if (__cur_GRP__<>nil) then begin
            grp_eITM:= OL.obj._itm_grp_eItm(__cur_GRP__);
            if grp_eITM=ITM_NDF //< тоесть она есть, тока еще не заполнена
            then grp_eITM:=eITM;
        end;
        //----
        if grp_eITM<>eITM then begin
            // создаем новую и всталяем
          __cur_GRP__:=OL.obj._ITM_crt_ITM(itm_GRP);
            OL.obj._ITM_ins_inContnt(__cur_PART__get__,__cur_GRP__);
        end;
        result:=__cur_GRP__;
    end;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    procedure __cur_gVAL_set__(ITM:tInkHD_ITM);
    begin
       __cur_gVAL_:=ITM;
    end;

    procedure __cur_gVAL_CLS__;
    begin
      __cur_gVAL_set__(nil);
    end;

    function __cur_gVAL_get__(eITM:eInkHD_ITM):tInkHD_ITM;
    begin
        result:=__cur_gVAL_;
        if result=nil then begin
          __cur_gVAL_:=OL.obj._ITM_crt_ITM(itm_GRP);
            if (__lst_PRM__<>nil)
            then OL.obj._ITM_ins_inContnt(__lst_PRM__,__cur_gVAL_)
            else OL.obj._ITM_ins_inContnt(__cur_GROUP__get__(itm_VAL),__cur_gVAL_);
            result:=__cur_gVAL_;
        end;
    end;

    {%endregion}

var imp:tInkHD_RAW;
    im0:tInkHD_RAW;
    itm:tInkHD_ITM;
    it0:tInkHD_ITM;
    //it1:tInkHD_ITM;
begin
    //
  __cur_PART__CLS__;
  __cur_GROUP__CLS__;
  with OL do begin
    obj._wrk_itmNodes:=obj._ITM_crt_ITM(ITM_ROOT);



    imp:=obj._wrk_rawNodes;
    if Assigned(imp)and(_pRawNODE_(imp)^.eRaw<>eRAW_NDF) then begin
        // 1. выделяем название (титл) и описание (оно ДОЛЖНО лежать в eRAW_TEXT)
        if _pRawNODE_(imp)^.eRaw=eRAW_TEXT then begin
            itm:=_parseS1_make_TTL_TST_0(OL,imp);
            if Assigned(imp) then begin
                // оборачиваем в узЕл ЗАГОЛОВОК
                it0:=obj._ITM_crt_ITM(ITM_HEAD);
                obj._ITM_ins_cldrLast(obj._ITMs_root,it0);
                obj._ITM_ins_inContnt(it0,itm);
                // сдвигаем маркер ДАЛЬШЕ
                imp:=obj._raw_next(imp);
            end;
        end;
        itm:=nil;
        // 2. идем по всем остальным нодам
        while imp<>nil do begin

            if _pRawNODE_(imp)^.eRaw=eRAW_LINE then begin
                // новая СЕКЦИЯ обозначенный пользователем
              __cur_PART__CLS__;
              __cur_GROUP__CLS__;
//              __cur_gVAL_CLS__;
              __cur_gVAL_CLS__;
                it0:=obj._ITM_crt_ITM(ITM_token,imp);
                obj._ITM_ins_cldrLast(__cur_PART__get__,it0);
                //---
                im0:=obj._raw_next(imp);
                if (im0<>nil)and(_pRawNODE_(im0)^.eRaw=eRAW_TEXT) then begin
                    itm:=_parseS1_make_sct_TiTxt(OL,im0);
                    if itm<>nil then obj._ITM_ins_inContnt(__cur_PART__get__,itm);
                    //--->
                    imp:=im0;
                end;


            end
           else
            if (in0k_hintDOC_coreRAW2ITM(_pRawNODE_(imp)^.eRaw)<>ITM_NDF) then begin
                //--- СОЗДАЕМ узел --------------------------------
                it0:=obj._ITM_crt_ITM(in0k_hintDOC_coreRAW2ITM(_pRawNODE_(imp)^.eRaw));
                // если у такого узла есть ЛЕКСЕМЫ, то вставляем их в узел
                if in0k_hintDOC_coreRAW_haveLexemes(_pRawNODE_(imp)^.eRaw) then begin
                    itm:=_parseS1_make_lex2Token(OL,imp);
                    if itm<>nil then begin
                        obj._ITM_ins_cldrLast(it0,itm);
                    end;
                end;
                //--- заполняем КОНТЕНТ
                if in0k_hintDOC_coreRAW_withDescription(_pRawNODE_(imp)^.eRaw) then begin
                    im0:=obj._raw_next(imp);
                    if (im0<>nil)and(_pRawNODE_(im0)^.eRaw=eRAW_TEXT) then begin
                        if in0k_hintDOC_coreRAW_parseAsTitleNode(_pRawNODE_(imp)^.eRaw)
                        then itm:=_parseS1_make_grp_TiTxt(OL,im0)
                        else itm:=_parseS1_make_tkn_NmNte(OL,im0);
                        if itm<>nil then obj._ITM_ins_inContnt(it0,itm);
                        //--->
                        imp:=im0;
                    end;
                end
                else begin
                    itm:=obj._ITM_crt_RAW(imp);
                    obj._ITM_ins_cldrLast(it0,itm);
                end;
                //--- вставляем --------------------------------
                if _pItmNODE_(it0)^.eItm=itm_GRP then begin
                    if (__lst_PRM__<>nil)and(obj._raw_gVAL(imp))
                    then begin
                      __cur_gVAL_set__(it0);
                        obj._ITM_ins_inContnt(__lst_PRM__,it0);
                    end
                    else begin
                      __cur_gVAL_CLS__;
                      __cur_GROUP__set__(it0);
                        obj._ITM_ins_inContnt(__cur_PART__get__,it0);
                    end;
                end
               else
                if _pItmNODE_(it0)^.eItm=itm_VAL then begin
                    obj._ITM_ins_inContnt(__cur_gVAL_get__(_pItmNODE_(it0)^.eItm),it0);
                end
               else begin
                  __cur_gVAL_CLS__;
                  __lst_PRM__set__(it0);
                    if in0k_hintDOC_coreITM_isGrpED(_pItmNODE_(it0)^.eItm) then begin
                        obj._ITM_ins_inContnt(__cur_GROUP__get__(_pItmNODE_(it0)^.eItm),it0);
                    end
                    else begin
                        if in0k_hintDOC_coreITM_isGroUP(_pItmNODE_(it0)^.eItm)
                        then __cur_GROUP__set__(it0)
                        else __cur_GROUP__CLS__;
                        obj._ITM_ins_inContnt(__cur_PART__get__,it0);

                        if in0k_hintDOC_coreITM_isGroUPForVAL(_pItmNODE_(it0)^.eItm)
                        then begin
                           __cur_gVAL_set__(it0);
                        end;

                    end;
               end;
            end;
            imp:=obj._raw_next(imp);
        end;
    end;
  end;
end;*)

{%endregion}

//------------------------------------------------------------------------------

function tInkHDP._processing_NODE(const OL:rInkHDOL; const NODE:tInkHD_ITM):boolean;
var tmp:tInkHD_ITM;
begin
    //--- обрабатываем САМ узел
   _processing_rawContent(ol,NODE);
    //--- идем по его ВНОВЬ созданным детям ВНУТРИ контента
    tmp:=OL.obj._itm_fndCntnt(NODE);
    if tmp<>nil then begin
        tmp:=OL.obj._itm_chld(tmp);
        while tmp<>nil do begin
            if OL.obj._itm_eItm(tmp)<>itm_raw
            then _processing_NODE(OL,tmp);
            tmp:=OL.obj._itm_next(tmp);
        end;
    end;
end;


procedure tInkHDP.PARSE(const hintDOC_Object:tInkHDO);
var OL:rInkHDOL;
    itm:tInkHD_ITM;
begin
    hintDOC_Object._CLR_WRK_;
    //---
    OL.obj:=hintDOC_Object;
    OL.lxr:=tInkHDF.Create;
    try
        // делаем корень
       _parse00_makeROOT(OL);
        // выбираем СЛУЖЕБНЫЙ символ
       _parse01_slct_LBL(OL);
        //---
        itm:=OL.obj._ITMs_root;
        // ПАРСИМся
       _processing_NODE(ol,itm);
        // отчитываемся
        hintDOC_Object._wrk_parsed:=true;
    except// что-то пошло не так
        hintDOC_Object._CLR_WRK_;
    end;
    OL.lxr.FREE;
end;

{%endregion --- tInkHDP}

{%region --- tInkHDG ---------------------------------------------- /fold}

function tInkHDg.obj_ITMs_root(const obj:tInkHDO):tInkHD_ITM;
begin
    result:=obj._ITMs_root;
end;

function tInkHDg.obj_ITM_next(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=obj._itm_next(itm);
end;

function tInkHDg.obj_ITM_chld(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=obj._itm_chld(itm);
end;

function tInkHDg.obj_ITM_eItm(const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_ITM;
begin
    result:=obj._itm_eItm(itm);
end;

//------------------------------------------------------------------------------

{ @ Навигация по узлу.
  получить СЛЕДУЮЩИЙ узел
}
function tInkHDg._itm_next(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=obj._itm_next(itm);
end;

function tInkHDg._itm_eItm(const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_ITM;
begin
    result:=obj._itm_eItm(itm);
end;

{ @ Навигация по узлу.
  получить вложенные узел контента (ITM_content)
}
function tInkHDg._itm_getContent(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=obj._itm_fndCntnt(itm);
end;

{ @ Навигация по узлу.
  получить ПЕРВОГО ребёнка вложенного контента (ITM_content)
}
function tInkHDg._itm_CntntFirst(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
begin
    result:=obj._itm_fndCntnt(itm);
    if Assigned(result) then result:=obj._itm_chld(result);
end;

{ @ Навигация по узлу.
  получить ПЕРВЫЙ встреченный во вложенном контенте с типом
}
function tInkHDg._itm_fndInCntnt(const obj:tInkHDO; const itm:tInkHD_ITM; const eItm:eInkHD_ITM):tInkHD_ITM;
begin  {todo: по ходу это гдето есть ... наджо найти}
    result:=obj._itm_fndCntnt(itm);
    if Assigned(result) then result:=obj._itm_fndChild(result,eItm);
end;


//------------------------------------------------------------------------------

{ @ Проверка узла.
  узел существует и еще НЕ обработан
}
function tInkHDg._itm_notNil_prcNO(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
begin
    result:=Assigned(itm) and //< он СУЩЕСТВУЕТ
            (obj_ePRC_get(obj,itm)=PRC_No)//< он НЕ обработан
end;

{ @ Проверка узла.
  узел существует, еще НЕ обработан и соответствующего типа
}
function tInkHDg._itm_notNil_prcNO_eITM(const obj:tInkHDO; const itm:tInkHD_ITM; const eITM:eInkHD_ITM):boolean;
begin
    result:=_itm_notNil_prcNO(obj,itm) and
            ((eItm=ITM_NDF)or(obj_ITM_eItm(obj,itm)=eItm)) //< нужного типа
end;

{ @ Проверка узла.
  внутри узла присутствует eITM_caption или eITM_article
}
function tInkHDg._itm_haveHEADER(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
var tmp:tInkHD_ITM;
begin
    result:=false;
    tmp:=obj._itm_fndCntnt(itm);
    if Assigned(tmp) then begin
        tmp:=obj._itm_chld(tmp);
        while Assigned(tmp) do begin
            if obj._itm_eItm(tmp) in [eITM_caption,eITM_article] then begin
                result:=true;
                break;
            end;
            tmp:=obj._itm_next(tmp);
        end;
    end;
end;







































































function tInkHDg.obj_ITM_haveHEADER(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
var tmp:tInkHD_ITM;
begin
    result:=false;
    tmp:=obj._itm_fndCntnt(itm);
    if Assigned(tmp) then begin
        tmp:=obj._itm_chld(tmp);
        while Assigned(tmp) do begin
            if obj._itm_eItm(tmp) in [eITM_caption,eITM_article] then begin
                result:=true;
                break;
            end;
            tmp:=obj._itm_next(tmp);
        end;
    end;
end;


//---

{ установить во ВСЕ узлы-Структуры значение `PRC=ndf`}
procedure tInkHDg.obj_ITMs_ndfPRC(const obj:tInkHDO);
begin
    obj._wrk_ITMs_ndfPRC;
end;

//---

function tInkHDg.obj_ITMs_getPRC(const obj:tInkHDO):eInkHD_PRC;
begin
    result:=obj._wrk_ITMs_getPRC;
end;

procedure tInkHDg.obj_ePRC_set(const obj:tInkHDO; const itm:tInkHD_ITM; const value:eInkHD_PRC);
begin
    obj._itm_set_ePRC(itm,value);
end;

procedure tInkHDg.obj_item_set_PRC_OK(const obj:tInkHDO; const itm:tInkHD_ITM);
begin
    obj_ePRC_set(obj,itm,PRC_OK)
end;

//---

function tInkHDg.obj_item_is_eItm(const obj:tInkHDO; const itm:tInkHD_ITM; const eItm:eInkHD_ITM):boolean;
begin
    result:=obj_ITM_eItm(obj,itm)=eItm;
end;

//---

{поиск: найти БЛИЖАЙШИЙ родительский узел типа eITM_NODE}
function tInkHDg.obj_item_getParent_itmNODE(const obj:tInkHDO; const itm:tInkHD_ITM):tInkHD_ITM;
var tmp:pointer;
begin
    result:=_ItmNODE_getPrnt(itm);
    while result<>nil do begin
        if obj._itm_eItm(result)=eITM_NODE then break;
        result:=_ItmNODE_getPrnt(result);
    end;
end;

{проверка: узел вложен в узел}
function tInkHDg.obj_item_in_NODE(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
begin
    result:=obj_item_getParent_itmNODE(obj,itm)<>NIL;
end;

{проверка: узел вложен в узел NODE_DD}
function tInkHDg.obj_item_in_NODE_DD(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
var tmp:pointer;
begin
    result:=false;
    tmp:=_ItmNODE_getPrnt(itm);
    while tmp<>nil do begin
        if obj._itm_eItm(tmp)=eITM_NODE then begin
            result:=obj_item_has_DefinedDetails(obj,tmp);
            break;
        end;
        tmp:=_ItmNODE_getPrnt(tmp);
    end;
end;

{проверка: узел вложен в узел NODE_CA}
function tInkHDg.obj_item_in_NODE_CA(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
var tmp:pointer;
begin
    result:=false;
    tmp:=_ItmNODE_getPrnt(itm);
    while tmp<>nil do begin
        if obj._itm_eItm(tmp)=eITM_NODE then begin
            result:=obj_item_has_CaptionArticle(obj,tmp);
            break;
        end;
        tmp:=_ItmNODE_getPrnt(tmp);
    end;
end;

//---

function tInkHDg.obj_ePRC_get(const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_PRC;
begin
    result:=obj._itm_get_ePRC(itm);
end;

function tInkHDg.obj_item_notNil_PRC_OK(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
begin
    result:=Assigned(itm) and (obj_ePRC_get(obj,itm)=PRC_OK);
end;

function tInkHDg.obj_item_notNil_PRC_NO(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
begin
    result:=Assigned(itm) and (obj_ePRC_get(obj,itm)=PRC_No);
end;


function tInkHDg.obj_item_isGrp_ForNODE(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
begin
    result:=obj._itm_SCTN_NODEs(itm)<>eRAW_NDF;
end;

//---

function tInkHDg.obj_item_NODE_Type(const obj:tInkHDO; const itm:tInkHD_ITM):tIn0k_hintDOC_core_itemNode_TYPE;
begin
    result:=obj._itm_NODE_TYPE(itm);
end;

{проверка: узел во ВЛОЖЕННОМ КОНТЕНТЕ имеет узлы Defined или Details}
function tInkHDg.obj_item_has_DefinedDetails(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
{todo: возможна оптимизация по скорости (за счет использования внутренней переменной для content)}
begin
    result:=(nil<>obj_InContent(obj,itm,eITM_defined))or
            (nil<>obj_InContent(obj,itm,eITM_details));
end;

{проверка: узел во ВЛОЖЕННОМ КОНТЕНТЕ имеет узлы Caption или Article}
function tInkHDg.obj_item_has_CaptionArticle(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
{todo: возможна оптимизация по скорости (за счет использования внутренней переменной для content)}
begin
    result:=(nil<>obj_InContent(obj,itm,eITM_article))or
            (nil<>obj_InContent(obj,itm,eITM_caption));
end;

//---

function tInkHDg.obj_fndChild(const obj:tInkHDO; const itm:pointer; const child_eItm:eInkHD_ITM):pointer;
begin
    result:=obj_ITM_chld(obj,itm);
    while result<>nil do begin
        if obj._itm_eItm(result)=child_eItm then break;
        result:=obj_ITM_next(obj,result);
    end;
end;

function tInkHDg.obj_fndCntnt(const obj:tInkHDO; const itm: pointer):pointer;
begin
    result:=obj._itm_fndCntnt(itm);
end;

{поиск узла определенного типа во ВЛОЖЕННОМ узле КОНТЕНТ}
function tInkHDg.obj_InContent(const obj:tInkHDO; const itm:tInkHD_ITM; const child_eItm:eInkHD_ITM):pointer;
begin
    result:=obj._itm_fndCntnt(itm);
    if Assigned(result) then result:=obj._itm_fndChild(result,child_eItm);
end;

function tInkHDg.obj_GRP_eItm(const obj:tInkHDO; const grp:tInkHD_ITM):eInkHD_ITM;
begin
    result:=obj._itm_grp_eItm(grp);
end;

function tInkHDg._itm_SCTN_NODEs (const obj:tInkHDO; const grp:tInkHD_ITM):eInkHD_RAW;
begin
    result:=obj._itm_SCTN_eRAW(grp);
end;

function tInkHDg._itm_NODE_eRAW(const obj:tInkHDO; const itm:tInkHD_ITM):eInkHD_RAW;
begin
    result:=obj._itm_NODE_eRAW(itm);
end;

function  tInkHDg._itm_SCTN_is_PAR(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
var tmp:tInkHD_ITM;
begin
    result:=false;
    if obj._itm_eItm(itm)=ITM_SCTN then begin
        //--- в нем ДОЛЖЕН лежать токен типа ---
        tmp:=obj._itm_fndChild(itm,ITM_token);
        if tmp<>nil then begin
            result:=assigned(obj._itm_fndChild(tmp,eRAW_LINE))
        end;
    end;
end;

function tInkHDg._itm_SCTN_is_TBL(const obj:tInkHDO; const itm:tInkHD_ITM):boolean;
begin
    result:=obj._itm_SCTN_NODEs(itm)<>eRAW_NDF
end;


{Текст RAW узла.
 вернуть текст узла, при условии что это RAW узел}
function tInkHDg.obj_itemRAW_getText(const obj:tInkHDO; const raw:tInkHD_ITM):string;
var tmp:tInkHD_RAW;
begin
    result:='';
    if obj_ITM_eItm(obj,raw)=itm_raw then begin
        tmp:=obj_ITM_chld(obj,raw);
        if Assigned(tmp)
        then result:=obj._get_source_RAW(tmp);
    end;
end;

//---

const cInkHDg_smbs_between_RawTexts=' ';

{СОБРАТЬ RAW-тексты.
 пройти по всем потомкам и собрать ВСЕ raw тексты}
function tInkHDg.obj_collect_rawText(const obj:tInkHDO; const itm:tInkHD_ITM):string;
var tmp:pointer;
begin {todo: уйти от рекурсии}
    result:='';
    if obj_ITM_eItm(obj,itm)=itm_raw then begin
        tmp:=obj_ITM_chld(obj,itm);
        if (tmp<>nil)and(obj._raw_eRaw(tmp)=eRAW_TEXT)
        then result:=obj_itemRAW_getText(obj,itm)
    end
    else begin
        tmp:=obj_ITM_chld(obj,itm);
        while tmp<>nil do begin
            result:=result+cInkHDg_smbs_between_RawTexts+obj_collect_rawText(obj,tmp);
            tmp:=obj_ITM_next(obj,tmp);
        end;
    end;
end;


function DelSpace1(const S: string): string;
var
  i: Integer;
begin
  Result:=S;
  for i:=Length(Result) downto 2 do
    if (Result[i]=' ') and (Result[I-1]=' ') then
      Delete(Result,I,1);
end;


function Text_to_nude(const text:string):string;
begin
    result:=text;
    result:=StringReplace(result,#1 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#2 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#3 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#4 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#5 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#6 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#7 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#8 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#9 ,' ',[rfReplaceAll]);
    result:=StringReplace(result,#10,' ',[rfReplaceAll]);
    result:=StringReplace(result,#11,' ',[rfReplaceAll]);
    result:=StringReplace(result,#12,' ',[rfReplaceAll]);
    result:=StringReplace(result,#13,' ',[rfReplaceAll]);
    result:=StringReplace(result,#14,' ',[rfReplaceAll]);
    result:=StringReplace(result,#15,' ',[rfReplaceAll]);
    result:=StringReplace(result,#16,' ',[rfReplaceAll]);
    result:=StringReplace(result,#17,' ',[rfReplaceAll]);
    result:=StringReplace(result,#18,' ',[rfReplaceAll]);
    result:=StringReplace(result,#19,' ',[rfReplaceAll]);
    result:=StringReplace(result,#20,' ',[rfReplaceAll]);
    result:=StringReplace(result,#21,' ',[rfReplaceAll]);
    result:=StringReplace(result,#22,' ',[rfReplaceAll]);
    result:=StringReplace(result,#23,' ',[rfReplaceAll]);
    result:=StringReplace(result,#24,' ',[rfReplaceAll]);
    result:=StringReplace(result,#25,' ',[rfReplaceAll]);
    result:=StringReplace(result,#26,' ',[rfReplaceAll]);
    result:=StringReplace(result,#27,' ',[rfReplaceAll]);
    result:=StringReplace(result,#28,' ',[rfReplaceAll]);
    result:=StringReplace(result,#29,' ',[rfReplaceAll]);
    result:=StringReplace(result,#30,' ',[rfReplaceAll]);
    result:=StringReplace(result,#31,' ',[rfReplaceAll]);
    result:=DelSpace1(trim(result));
end;


function tInkHDg.obj_collectStripTXT(const obj:tInkHDO; const itm:tInkHD_ITM):string;
var tmp:pointer;
    str:string;
begin {todo: уйти от рекурсии}
    result:='';
    if obj_ITM_eItm(obj,itm)=itm_raw then begin
        tmp:=obj_ITM_chld(obj,itm);
        if (tmp<>nil)and(obj._raw_eRaw(tmp)=eRAW_TEXT)
        then result:=Text_to_nude(obj_itemRAW_getText(obj,itm))
    end
    else begin
        tmp:=obj_ITM_chld(obj,itm);
        while tmp<>nil do begin
            str:=obj_collectStripTXT(obj,tmp);
            if (str<>'')and(result<>'') then result:=result+cInkHDg_smbs_between_RawTexts;
            result:=result+str;
            tmp:=obj_ITM_next(obj,tmp);
        end;
    end;
end;


{%endregion}

end.

