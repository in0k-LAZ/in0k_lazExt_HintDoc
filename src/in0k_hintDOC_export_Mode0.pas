unit in0k_hintDOC_export_Mode0;

{$mode objfpc}{$H+}

interface

uses in0k_hintDOC_core_Token, in0k_hintDOC;

type

 aIn0k_hintDOC_expM0_prcBEFO=function(const W:rIn0k_hintDOC_ExpWRK; const itm:tIn0k_himtDOC_Item; out crtData:pointer; const prntD:pointer):string of object;
 aIn0k_hintDOC_expM0_PROcess=function(const W:rIn0k_hintDOC_ExpWRK; const itm:tIn0k_himtDOC_Item; const  DATA:pointer):string of object;
 aIn0k_hintDOC_expM0_prcAFTE=function(const W:rIn0k_hintDOC_ExpWRK; const itm:tIn0k_himtDOC_Item; var dstData:pointer):string of object;

 tIn0k_hintDOC_expM0=class(tIn0k_hintDOC_Export)
  {$region --- inSide superCommon functions - /fold }
  protected //< стандартные вызовы
    function _std_Befo(const{%H-}W:rIn0k_hintDOC_ExpWRK; const{%H-}i_Node:tIn0k_himtDOC_Item; out  {%H-}contEXT:pointer; const prntCXT:pointer):string; inline;
    function _std_TEXT(const{%H-}W:rIn0k_hintDOC_ExpWRK; const{%H-}i_Node:tIn0k_himtDOC_Item; const{%H-}contEXT:pointer):string; inline;
    function _std_afte(const{%H-}W:rIn0k_hintDOC_ExpWRK; const{%H-}i_Node:tIn0k_himtDOC_Item; var  {%H-}contEXT:pointer):string; inline;
  protected //< групповухи
    function _fnk_BWA_(const W:rIn0k_hintDOC_ExpWRK;
                       const ITEM:tIn0k_himtDOC_Item;
                       const eItm:tIn0k_himtDOC_eITM;
                       const DATA:tIn0k_himtDOC_Item;
                       const fBefo:aIn0k_hintDOC_expM0_prcBEFO;
                       const fWork:aIn0k_hintDOC_expM0_PROcess;
                       const fAfte:aIn0k_hintDOC_expM0_prcAFTE;
                       const set_prcOk:boolean):string;
    function _fnk_FBS_(const W:rIn0k_hintDOC_ExpWRK;
                       const ITEM:tIn0k_himtDOC_Item;
                       const eItm:tIn0k_himtDOC_eITM;
                       const DATA:tIn0k_himtDOC_Item;
                       const fFrst:aIn0k_hintDOC_expM0_PROcess;
                       const fBtwn:aIn0k_hintDOC_expM0_PROcess;
                       const fScnd:aIn0k_hintDOC_expM0_PROcess;
                       const mast_BTWN:boolean;
                       const set_prcOk:boolean):string; overload;
    function _fnk_FBS_(const W:rIn0k_hintDOC_ExpWRK;
                       const ITEM:tIn0k_himtDOC_Item;
                       const eItm:tIn0k_himtDOC_eITM;
                       const DATA:tIn0k_himtDOC_Item;
                       const Frst:tIn0k_himtDOC_eITM;
                       const Scnd:tIn0k_himtDOC_eITM;
                       const fFrst:aIn0k_hintDOC_expM0_PROcess;
                       const fBtwn:aIn0k_hintDOC_expM0_PROcess;
                       const fScnd:aIn0k_hintDOC_expM0_PROcess;
                       const mast_BTWN:boolean;
                       const set_prcOk:boolean):string; overload;
    function _fnk_CNT_(const W:rIn0k_hintDOC_ExpWRK;
                       const ITEM:tIn0k_himtDOC_Item;
                       const eItm:tIn0k_himtDOC_eITM;
                       const DATA:tIn0k_himtDOC_Item;
                       const fBefo:aIn0k_hintDOC_expM0_prcBEFO;
                       const fWork:aIn0k_hintDOC_expM0_PROcess;
                       const fAfte:aIn0k_hintDOC_expM0_prcAFTE;
                       const fBtwn:aIn0k_hintDOC_expM0_PROcess):string;
    function _fnk_ITM_(const W:rIn0k_hintDOC_ExpWRK;
                       const ITEM:tIn0k_himtDOC_Item;
                       const eItm:tIn0k_himtDOC_eITM;
                       const DATA:tIn0k_himtDOC_Item;
                       const fBefo:aIn0k_hintDOC_expM0_prcBEFO;
                       const fTxt0:aIn0k_hintDOC_expM0_PROcess;
                       const fBt01:aIn0k_hintDOC_expM0_PROcess;
                       const fTxt1:aIn0k_hintDOC_expM0_PROcess;
                       const fBt12:aIn0k_hintDOC_expM0_PROcess;
                       const fTxt2:aIn0k_hintDOC_expM0_PROcess;
                       const fAfte:aIn0k_hintDOC_expM0_prcAFTE;
                       const set_prcOk:boolean):string;
  {$endRegion}
  //---
  {%region --- eITM_NODE CA     (CPTN-ARTC) - /fold }
  protected //< itmNODE CA CAPTION
    function  getText_NODE_CA_CAPTION     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkCPTN_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_CA_wrkCPTN_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkCPTN_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< itmNODE CA between CAPTION-ARTICLE
    function  getText_NODE_CA_btwn_CA     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< itmNODE CA ARTICLE
    function  getText_NODE_CA_ARTICLE     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkARTC_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_CA_wrkARTC_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkARTC_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< itmNODE CA between ARTICLE-BODY
    function  getText_NODE_CA_btwn_AB     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< itmNODE CA BODY
    function  process_NODE_CA_wrkBODY_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_CA_wrkBODY_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< itmNODE CA
    function  process_NODE_CA_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_CA_wrkCAPT     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_btwn_CA     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkARTC     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_btwn_AB     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_wrkBODY     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_CA_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  {%endregion}
  {%region --- eITM_NODE DD     (DEFI-DTLS) - /fold }
  protected //< itmNODE DD DEFINED
    function  getText_NODE_DD_DEFINED     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDFND_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDFND_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDFND_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< itmNODE DD between CAPTION-ARTICLE
    function  getText_NODE_DD_btwn_DD     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< itmNODE DD details
    function  getText_NODE_DD_DETAILS     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDTLS_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDTLS_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDTLS_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< itmNODE DD between ARTICLE-BODY
    function  getText_NODE_DD_btwn_DB     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< itmNODE DD BODY
    function  process_NODE_DD_wrkBODY_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_DD_wrkBODY_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< itmNODE DD
    function  process_NODE_DD_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDFND     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_btwn_DD     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkDTLS     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_btwn_DB     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_wrkBODY     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_NODE_DD_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  {%endregion}
  {%region --- eITM_NODE       :ОБЩИЙ вызов - /fold }
  protected //< eITM_NODE (строка в таблице): ОБЩИЙ вызов
    function  process_tknNODE_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_tknNODE_work        (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_tknNODE_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< ОБЩИе вызовы для tknNODE
    function  process_tknNODE_wrkBODY     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_tknNODE_btwn_BS     (const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  {%endregion}
  //---
  {%region --- eITM_SCTN TBL      (ТАБЛИЦА) - /fold }
  protected //< sctnTBL HEAD (ЗАГОЛОВОК таблици)
    function  getText_tblHEAD_Caption     (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_tblHEAD_befo        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_tblHEAD_work        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_tblHEAD_afte        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< между HEAD-BODY
    function  getText_sctnTBL_btwn_HB     (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< sctnTBL BODY (ТЕЛО таблици)
    function  getText_tblBODY_btwn_NN     (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_tblBODY_befo        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_tblBODY_work        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_tblBODY_afte        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< sctnTBL
    function  process_sctnTBL_befo        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_sctnTBL_work        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnTBL_afte        (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
    //------ //< process_sctnTBL_work --- FBS call
    function  process_sctnTBL_wrkF_wrkHEAD(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnTBL_wrkB_btwn_HB(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnTBL_wrkS_wrkBODY(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  {%endregion}
  {%region --- eITM_SCTN PAR     (ПАРАГРАФ) - /fold }
  protected //< Заголовок ПАРАГРАФА
    function  getText_sctnPAR_Caption     (const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_sctnPAR_Caption_work(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< между Заголовок-Статья
    function  getText_sctnPAR_btwn_CA     (const W:rIn0k_hintDOC_ExpWRK; const I_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< Статья ПАРАГРАФА
    function  getText_sctnPAR_Article     (const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_sctnPAR_Article_work(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< ШАПКА секции
    function  process_sctnPAR_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_sctnPAR_work        (const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< process_sctnPAR_work --- FBS call
    function  process_sctnPAR_wrkF_wrkCPTN(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_wrkB_btwn_TT(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_sctnPAR_wrkS_wrkARTC(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  {%endregion}
  {%region --- eITM_SCTN       :ОБЩИЙ вызов - /fold }
  protected //< формирование СЕКЦИИ
    function  GT_section_befo             (const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  GT_section_work             (const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  GT_section_afte             (const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  {%endregion}
  //---
  {%region --- eITM_ROOT HEAD ( ШАПКА док.) - /fold }
  protected //< Заголовок документа
    function  getText_docHEAD_Caption     (const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_docHEAD_Caption_work(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< между Заголовок-Статья
    function  getText_docHEAD_btwn_CA     (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< Статья документа
    function  getText_docHEAD_Article     (const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_docHEAD_Article_work(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< ШАПКА документа
    function  process_docHEAD_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_docHEAD_work        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< process_docHEAD_work --- FBS call
    function  process_docHEAD_wrkF_wrkCPTN(const W:rIn0k_hintDOC_ExpWRK; const itmCPT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_wrkB_btwn_TT(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docHEAD_wrkS_wrkARTC(const W:rIn0k_hintDOC_ExpWRK; const itmART:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  {%endregion}
  {%region --- eITM_ROOT CNTN ( СОДЕРЖИМОЕ) - /fold }
  protected //< между Заголовок-Статья
    function  getText_docCNTN_btwn_CS     (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< ШАПКА документа
    function  process_docCNTN_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_docCNTN_work        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_docCNTN_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  {%endregion}
  {%region --- eITM_ROOT (КОРЕНЬ документа) - /fold }
  protected //< между ШАПКА-СОДЕРЖИМОЕ
    function  getText_HintDoc_btwn_HC     (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  protected //< Обработка КОРНЕВОГО узла
    function  process_HintDoc_befo        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; virtual;
    function  process_HintDoc_work        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_HintDoc_afte        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; var   contEXT:pointer):string; virtual;
  protected //< process_HintDoc_work --- FBS call
    function  process_HintDoc_wrkF_wrkHEAD(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_HintDoc_wrkB_btwn_HC(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
    function  process_HintDoc_wrkS_wrkCNTN(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; virtual;
  {%endregion}
  protected // перебиваем РОДИЕТЕЛЯ для НАШЕЙ генерации
    function _prepare_calc_PRC(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer):tIn0k_hintDOC_ePRC;
    function  prepare_calc_PRC(const W:rIn0k_hintDOC_ExpWRK):boolean;  OVERRIDE;
  protected // перебиваем РОДИЕТЕЛЯ для НАШЕЙ генерации
    function  execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;   OVERRIDE;
  end;

implementation

{$region --- inLine DeBUG consts  - /fold}
const
  _cDeBUG_errMsg_WOBJ_nil_='w.obj==nil';
  _cDeBUG_errMsg_ITEM_nil_='iNode==nil';
{$endRegion}

{$region --- inSide superCommon functions                         - /fold}

{использектся для !ГАШЕНИЯ! hint`тов при компиляции о неиспользуемых параметрах}
function tIn0k_hintDOC_expM0._std_Befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    contEXT:=prntCXT;
    result :='';
end;

{использектся для !ГАШЕНИЯ! hint`тов при компиляции о неиспользуемых параметрах}
function tIn0k_hintDOC_expM0._std_TEXT(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:='';
end;

{использектся для !ГАШЕНИЯ! hint`тов при компиляции о неиспользуемых параметрах}
function tIn0k_hintDOC_expM0._std_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:='';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0._fnk_BWA_(const W:rIn0k_hintDOC_ExpWRK;
                   const ITEM:tIn0k_himtDOC_Item;
                   const eItm:tIn0k_himtDOC_eITM;
                   const DATA:tIn0k_himtDOC_Item;
                   const fBefo:aIn0k_hintDOC_expM0_prcBEFO;
                   const fWork:aIn0k_hintDOC_expM0_PROcess;
                   const fAfte:aIn0k_hintDOC_expM0_prcAFTE;
                   const set_prcOk:boolean):string;
var cstD:tIn0k_himtDOC_Item;
    strB:string;
    strW:string;
    strA:string;
begin
    result:='';
    if ITM_notNil_prcNO_eITM(W,ITEM,eItm) then begin
        strB:='';
        strW:='';
        strA:='';
        //---
        if Assigned(fBefo) then strB:=fBefo(W,ITEM,cstD,DATA);
        if Assigned(fWork) then strW:=fWork(W,ITEM,cstD);
        if Assigned(fAfte) then strA:=fAfte(W,ITEM,cstD);
        //---
        if strW<>'' then result:=strB+strW+strA;
        if set_prcOk then ITM_set_prcOK(W,ITEM); //< типа ОБРАБОТАЛИ уже
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0._fnk_FBS_(const W:rIn0k_hintDOC_ExpWRK;
                   const ITEM :tIn0k_himtDOC_Item;
                   const eItm :tIn0k_himtDOC_eITM;
                   const DATA :tIn0k_himtDOC_Item;
                   const fFrst:aIn0k_hintDOC_expM0_PROcess;
                   const fBtwn:aIn0k_hintDOC_expM0_PROcess;
                   const fScnd:aIn0k_hintDOC_expM0_PROcess;
                   const mast_BTWN:boolean;
                   const set_prcOk:boolean):string;
var sFrst:string;
    sScnd:string;
begin
    {$ifOpt D+}
      Assert(Assigned(ITEM) , _cDeBUG_errMsg_ITEM_nil_);
    {$endIf}
    result:='';
    if ITM_notNil_prcNO_eITM(W,ITEM,eItm) then begin
        sFrst:=fFrst(W,ITEM,DATA);
        sScnd:=fScnd(W,ITEM,DATA);
        if mast_BTWN or ((sFrst<>'')and(sScnd<>''))
        then result:=fBtwn(W,ITEM,DATA)
        else result:='';
        //--- ИТОГО:
        result:=sFrst+result+sScnd;              //< результат
        if set_prcOk then ITM_set_prcOK(W,ITEM); //< типа ОБРАБОТАЛИ уже
    end;
end;

function tIn0k_hintDOC_expM0._fnk_FBS_(const W:rIn0k_hintDOC_ExpWRK;
                   const ITEM:tIn0k_himtDOC_Item;
                   const eItm:tIn0k_himtDOC_eITM;
                   const DATA:tIn0k_himtDOC_Item;
                   const Frst:tIn0k_himtDOC_eITM;
                   const Scnd:tIn0k_himtDOC_eITM;
                   const fFrst:aIn0k_hintDOC_expM0_PROcess;
                   const fBtwn:aIn0k_hintDOC_expM0_PROcess;
                   const fScnd:aIn0k_hintDOC_expM0_PROcess;
                   const mast_BTWN:boolean;
                   const set_prcOk:boolean):string;
var tmp :tIn0k_himtDOC_Item;
    sFrst:string;
    sScnd:string;
begin
    {$ifOpt D+}
      Assert(Assigned(ITEM) , _cDeBUG_errMsg_ITEM_nil_);
    {$endIf}
    result:='';
    if ITM_notNil_prcNO_eITM(W,ITEM,eItm) then begin
        //--- формируем ПЕРВОЕ
        tmp:=ITM_fndInCntnt(W,ITEM,Frst);
        if ITM_notNil_prcNO(W,tmp) then begin
            sFrst:= fFrst(W,tmp,DATA);
            ITM_set_prcOK(W,tmp); //< типа ОБРАБОТАЛИ уже
        end
        else sFrst:='';
        //--- формируем ВТОРОЕ
        tmp:=ITM_fndInCntnt(W,ITEM,Scnd);
        if ITM_notNil_prcNO(W,tmp) then begin
            sScnd:= fScnd(W,tmp,DATA);
            ITM_set_prcOK(W,tmp); //< типа ОБРАБОТАЛИ уже
        end
        else sScnd  :='';
        //--- формируем РАЗДЕЛИТЕЛЬ
        if mast_BTWN or ((sFrst<>'')and(sScnd<>''))
        then result:=fBtwn(W,ITEM,DATA)
        else result:='';
        //--- ИТОГО:
        result:=sFrst+result+sScnd;              //< результат
        if set_prcOk then ITM_set_prcOK(W,ITEM); //< типа ОБРАБОТАЛИ уже
    end;
end;


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0._fnk_CNT_(const W:rIn0k_hintDOC_ExpWRK;
                   const ITEM:tIn0k_himtDOC_Item;
                   const eItm:tIn0k_himtDOC_eITM;
                   const DATA:tIn0k_himtDOC_Item;
                   const fBefo:aIn0k_hintDOC_expM0_prcBEFO;
                   const fWork:aIn0k_hintDOC_expM0_PROcess;
                   const fAfte:aIn0k_hintDOC_expM0_prcAFTE;
                   const fBtwn:aIn0k_hintDOC_expM0_PROcess):string;
var tmp:tIn0k_himtDOC_Item;
    str:string;
begin
    {$ifOpt D+}
      Assert(Assigned(ITEM) , _cDeBUG_errMsg_ITEM_nil_);
    {$endIf}
    result:='';
    if ITM_notNil_prcNO(W,ITEM) then begin
        tmp:=ITM_CntntFirst(W,ITEM);
        while Assigned(tmp) do begin
            if ITM_notNil_prcNO_eITM(W,tmp,eItm) then begin
                str:=_fnk_BWA_(W,tmp,eItm,DATA,fBefo,fWork,fAfte,true);
                if str<>'' then begin
                    if result<>'' then result:=result+fBtwn(W,ITEM,DATA);
                    result:=result+str;
                end;
            end;
            tmp:=ITM_next(W,tmp);
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0._fnk_ITM_(const W:rIn0k_hintDOC_ExpWRK;
                   const ITEM:tIn0k_himtDOC_Item;
                   const eItm:tIn0k_himtDOC_eITM;
                   const DATA:tIn0k_himtDOC_Item;
                   const fBefo:aIn0k_hintDOC_expM0_prcBEFO;
                   const fTxt0:aIn0k_hintDOC_expM0_PROcess;
                   const fBt01:aIn0k_hintDOC_expM0_PROcess;
                   const fTxt1:aIn0k_hintDOC_expM0_PROcess;
                   const fBt12:aIn0k_hintDOC_expM0_PROcess;
                   const fTxt2:aIn0k_hintDOC_expM0_PROcess;
                   const fAfte:aIn0k_hintDOC_expM0_prcAFTE;
                   const set_prcOk:boolean):string;
var cstD:tIn0k_himtDOC_Item;
    tmpS:string;
begin
    {$ifOpt D+}
      Assert(Assigned(ITEM) , _cDeBUG_errMsg_ITEM_nil_);
    {$endIf}
    result:='';
    if ITM_notNil_prcNO_eITM(W,ITEM,eItm) then begin
        if Assigned(fBefo) then result:=result+fBefo(W,ITEM,cstD,DATA);

        if Assigned(fTxt0) then result:=result+fTxt0(W,ITEM,cstD);
        if Assigned(fBt01) then result:=result+fBt01(W,ITEM,cstD);
        if Assigned(fTxt1) then result:=result+fTxt1(W,ITEM,cstD);
        //---
        if Assigned(fTxt2) then tmpS:=fTxt2(W,ITEM,cstD)
                           else tmpS:='';
        if tmpS<>'' then begin
            if Assigned(fBt12) then result:=result+fBt12(W,ITEM,cstD);
            result:=result+tmpS;
        end;
        //---
        if Assigned(fAfte) then result:=result+fAfte(W,ITEM,cstD);
        //---
        if set_prcOk then ITM_set_prcOK(W,ITEM); //< типа ОБРАБОТАЛИ уже
    end;
end;

{$endregion}

//---[ eITM_NODE ]--------------------------------------------------------------

{%region --- eITM_NODE CA     (CPTN-ARTC) - /fold }

function tIn0k_hintDOC_expM0.getText_NODE_CA_CAPTION(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var iTMP:tIn0k_himtDOC_Item;
begin
    {$ifOpt D+}
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_Node) then Assert(ITM_eItm(W,i_Node)=eITM_NODE,'i_Node <> eITM_NODE');
    {$endIf}
    iTMP:=ITM_fndInCntnt(W,i_Node,eITM_caption);
    if ITM_notNil_prcNO(W,iTMP)
    then result:=_std_TEXT(W,iTMP,contEXT)+ITM_collectStripTXT(W,iTMP)
    else result:='';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkCPTN_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkCPTN_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_CA_CAPTION(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkCPTN_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_NODE_CA_btwn_CA(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_NODE_CA_ARTICLE(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var iTMP:tIn0k_himtDOC_Item;
begin
    {$ifOpt D+}
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_Node) then Assert(ITM_eItm(W,i_Node)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    iTMP:=ITM_fndInCntnt(W,i_Node,eITM_article);
    if ITM_notNil_prcNO(W,iTMP)
    then result:=_std_TEXT(W,iTMP,contEXT)+ITM_collectStripTXT(W,iTMP)
    else result:='';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkARTC_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkARTC_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_CA_ARTICLE(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkARTC_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_NODE_CA_btwn_AB(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkBODY_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkBODY_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    if ITM_notNil_prcNO_eITM(W,i_NODE,eITM_NODE)
    then result:=process_tknNODE_wrkBODY(W,i_NODE,contEXT)
    else result:='';
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_NODE_CA_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkCAPT(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_fnk_BWA_(W,i_NODE,eITM_NODE,contEXT,@process_NODE_CA_wrkCPTN_befo,@process_NODE_CA_wrkCPTN_work,@process_NODE_CA_wrkCPTN_afte,false);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_btwn_CA(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_CA_btwn_CA(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkARTC(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_fnk_BWA_(W,i_NODE,eITM_NODE,contEXT,@process_NODE_CA_wrkARTC_befo,@process_NODE_CA_wrkARTC_work,@process_NODE_CA_wrkARTC_afte,false);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_btwn_AB(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_CA_btwn_AB(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_wrkBODY(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_fnk_BWA_(W,i_NODE,eITM_NODE,contEXT,@process_NODE_CA_wrkBODY_befo,@process_NODE_CA_wrkBODY_work,@process_NODE_CA_wrkBODY_afte,false);
end;

function tIn0k_hintDOC_expM0.process_NODE_CA_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_std_afte(W,i_Node,contEXT);
end;

{%endregion}

{%region --- eITM_NODE DD     (DFND-DTLS) - /fold }

function tIn0k_hintDOC_expM0.getText_NODE_DD_DEFINED(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var iTMP:tIn0k_himtDOC_Item;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_Node) then Assert(ITM_eItm(W,i_Node)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    iTMP:=ITM_fndInCntnt(W,i_Node,eITM_defined);
    if ITM_notNil_prcNO(W,iTMP)
    then result:=_std_TEXT(W,iTMP,contEXT)+ITM_collectStripTXT(W,iTMP)
    else result:='';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDFND_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDFND_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_DD_DEFINED(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDFND_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_NODE_DD_btwn_DD(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_NODE_DD_DETAILS(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var iTMP:tIn0k_himtDOC_Item;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_Node) then Assert(ITM_eItm(W,i_Node)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    iTMP:=ITM_fndInCntnt(W,i_Node,eITM_details);
    if ITM_notNil_prcNO(W,iTMP)
    then result:=_std_TEXT(W,iTMP,contEXT)+ITM_collectStripTXT(W,iTMP)
    else result:='';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDTLS_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDTLS_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_DD_DETAILS(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDTLS_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_NODE_DD_btwn_DB(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkBODY_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkBODY_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    if ITM_notNil_prcNO_eITM(W,i_NODE,eITM_NODE)
    then result:=process_tknNODE_wrkBODY(W,i_NODE,contEXT)
    else result:='';
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_NODE_DD_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDFND(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_fnk_BWA_(W,i_NODE,eITM_NODE,contEXT,@process_NODE_DD_wrkDFND_befo,@process_NODE_DD_wrkDFND_work,@process_NODE_DD_wrkDFND_afte,false);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_btwn_DD(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_DD_btwn_DD(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkDTLS(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_fnk_BWA_(W,i_NODE,eITM_NODE,contEXT,@process_NODE_DD_wrkDTLS_befo,@process_NODE_DD_wrkDTLS_work,@process_NODE_DD_wrkDTLS_afte,false);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_btwn_DB(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_NODE_DD_btwn_DB(W,i_Node,contEXT);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_wrkBODY(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_Node), _cDeBUG_errMsg_ITEM_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_fnk_BWA_(W,i_NODE,eITM_NODE,contEXT,@process_NODE_DD_wrkBODY_befo,@process_NODE_DD_wrkBODY_work,@process_NODE_DD_wrkBODY_afte,false);
end;

function tIn0k_hintDOC_expM0.process_NODE_DD_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE, 'i_NODE <> eITM_NODE');
    {$endIf}
    result:=_std_afte(W,i_Node,contEXT);
end;

{%endregion}

{%region --- eITM_NODE       :ОБЩИЙ вызов - /fold }

function tIn0k_hintDOC_expM0.process_tknNODE_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_Node,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_tknNODE_work(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    //------
    result:='';
    case obj_item_NODE_Type(W.obj,i_Node) of
        itmNODE_clean,
        itmNODE_hasCA:result:=_fnk_ITM_(W,i_NODE,eITM_NODE,contEXT,
                                  @process_NODE_CA_befo,
                                  @process_NODE_CA_wrkCAPT,
                                  @process_NODE_CA_btwn_CA,
                                  @process_NODE_CA_wrkARTC,
                                  @process_NODE_CA_btwn_AB,
                                  @process_NODE_CA_wrkBODY,
                                  @process_NODE_CA_afte,FALSE);
        itmNODE_hasDD:result:=_fnk_ITM_(W,i_NODE,eITM_NODE,contEXT,
                                  @process_NODE_DD_befo,
                                  @process_NODE_DD_wrkDFND,
                                  @process_NODE_DD_btwn_DD,
                                  @process_NODE_DD_wrkDTLS,
                                  @process_NODE_DD_btwn_DB,
                                  @process_NODE_DD_wrkBODY,
                                  @process_NODE_DD_afte,FALSE);
    end;
end;

function tIn0k_hintDOC_expM0.process_tknNODE_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_Node,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_tknNODE_wrkBODY(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      if Assigned(i_NODE) then Assert(ITM_eItm(W,i_NODE)=eITM_NODE,'i_NODE <> eITM_NODE');
    {$endIf}
    if ITM_CntntFirst(W,i_NODE)<>nil
    then result:=_fnk_CNT_(W,i_NODE,ITM_SCTN,contEXT,@GT_section_befo,@GT_section_work,@GT_section_afte,@process_tknNODE_btwn_BS)
    else result:='';
end;

function tIn0k_hintDOC_expM0.process_tknNODE_btwn_BS(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_NODE,contEXT);
end;

{%endregion}

//---[ eITM_SCTN ]--------------------------------------------------------------

{%region --- eITM_SCTN TBL      (ТАБЛИЦА) - /fold }

function tIn0k_hintDOC_expM0.getText_tblHEAD_Caption(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,itmGRP,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_tblHEAD_befo(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,itmGRP,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_tblHEAD_work(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_tblHEAD_Caption(W,itmGRP,contEXT);
end;

function tIn0k_hintDOC_expM0.process_tblHEAD_afte(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,itmGRP,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_tblBODY_btwn_NN(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,itmGRP,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_tblBODY_befo(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,itmGRP,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_tblBODY_work(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_CNT_(W,itmGRP,eITM_NODE,contEXT,@process_tknNODE_befo,@process_tknNODE_work,@process_tknNODE_afte,@getText_tblBODY_btwn_NN);
end;

function tIn0k_hintDOC_expM0.process_tblBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,itmGRP,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.getText_sctnTBL_btwn_HB(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const  contEXT:pointer):string;
begin
    result:=_std_TEXT(W,itmGRP,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_sctnTBL_befo(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,itmGRP,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_sctnTBL_work(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const  contEXT:pointer):string;
begin
    result:=_fnk_FBS_(W,itmGRP,ITM_SCTN,contEXT,@process_sctnTBL_wrkF_wrkHead,@process_sctnTBL_wrkB_btwn_HB,@process_sctnTBL_wrkS_wrkBODY, false,true);
end;

function tIn0k_hintDOC_expM0.process_sctnTBL_afte(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,itmGRP,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_sctnTBL_wrkF_wrkHead(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const  contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,itmGRP,ITM_SCTN,contEXT,@process_tblHEAD_befo,@process_tblHEAD_work,@process_tblHEAD_afte,FALSE);
end;

function tIn0k_hintDOC_expM0.process_sctnTBL_wrkB_btwn_HB(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const  contEXT:pointer):string;
begin
    result:= getText_sctnTBL_btwn_HB(W,itmGRP,contEXT);
end;

function tIn0k_hintDOC_expM0.process_sctnTBL_wrkS_wrkBODY(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const  contEXT:pointer):string;
begin
    //result:='';
    result:=_fnk_BWA_(W,itmGRP,ITM_SCTN,contEXT,@process_tblBODY_befo,@process_tblBODY_work,@process_tblBODY_afte,FALSE);
end;

{%endregion}

{%region --- eITM_SCTN PAR     (ПАРАГРАФ) - /fold }

function tIn0k_hintDOC_expM0.getText_sctnPAR_Caption(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(ITM_eItm(W,i_CPTN)=eITM_caption, 'i_NODE have WRONG eItm type');
    {$endIf}
    result:=_std_TEXT(W,i_CPTN,contEXT)+ITM_collectStripTXT(W,i_CPTN);
end;

function tIn0k_hintDOC_expM0.getText_sctnPAR_btwn_CA(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(ITM_eItm(W,i_SCTN)=ITM_SCTN, 'i_NODE have WRONG eItm type');
    {$endIf}
    result:=_std_TEXT(W,i_SCTN,contEXT)
end;

function tIn0k_hintDOC_expM0.getText_sctnPAR_Article(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(ITM_eItm(W,i_ARTC)=eITM_article, 'i_NODE have WRONG eItm type');
    {$endIf}
    result:=_std_TEXT(W,i_ARTC,contEXT)+ITM_collectStripTXT(W,i_ARTC);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_sctnPAR_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_CPTN,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_Caption_work(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_sctnPAR_Caption(W,i_CPTN,contEXT);
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_CPTN,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_sctnPAR_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_ARTC,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_Article_work(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:= getText_sctnPAR_Article(W,i_ARTC,contEXT);
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_ARTC,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_sctnPAR_befo(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_SCTN,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_work(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_FBS_(W,i_SCTN,ITM_SCTN,contEXT, eITM_caption,eITM_article, @process_sctnPAR_wrkF_wrkCPTN,@process_sctnPAR_wrkB_btwn_TT,@process_sctnPAR_wrkS_wrkARTC, false,true);
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_afte(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_SCTN,contEXT);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_sctnPAR_wrkF_wrkCPTN(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,i_CPTN,eITM_caption,contEXT,@process_sctnPAR_Caption_befo,@process_sctnPAR_Caption_work,@process_sctnPAR_Caption_afte,true)
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_wrkB_btwn_TT(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=getText_sctnPAR_btwn_CA(W,i_SCTN,contEXT)
end;

function tIn0k_hintDOC_expM0.process_sctnPAR_wrkS_wrkARTC(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,i_ARTC,eITM_article,contEXT,@process_sctnPAR_Article_befo,@process_sctnPAR_Article_work,@process_sctnPAR_Article_afte,true)
end;

{%endregion}

{%region --- eITM_SCTN       :ОБЩИЙ вызов - /fold }

function tIn0k_hintDOC_expM0.GT_section_befo(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_SCTN,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.GT_section_work(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:='';
    //--- выбираем как именно обрабатывать данную секцию
    if _itm_SCTN_is_PAR(W.obj,i_SCTN) then begin
        result:=_fnk_BWA_(W,i_SCTN,ITM_SCTN,contEXT,@process_sctnPAR_befo,@process_sctnPAR_work,@process_sctnPAR_afte,TRUE);
    end
   else
    if _itm_SCTN_is_TBL(W.obj,i_SCTN) then begin
        result:=_fnk_BWA_(W,i_SCTN,ITM_SCTN,contEXT,@process_sctnTBL_befo,@process_sctnTBL_work,@process_sctnTBL_afte,TRUE);
    end
   else begin //< это есть НЕ известная секция
        result:='SECTION';
    end;
end;

function tIn0k_hintDOC_expM0.GT_section_afte(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_SCTN,contEXT);
end;

{%endregion}

//---[ eITM_ROOT ]--------------------------------------------------------------

{%region --- eITM_ROOT HEAD ( ШАПКА док.) - /fold }

function tIn0k_hintDOC_expM0.getText_docHEAD_Caption(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_CPTN) and (ITM_eItm(W,i_CPTN)=eITM_caption), 'itmCTP<>eITM_caption');
    {$endIf}
    result:=_std_TEXT(W,i_CPTN,contEXT)+ITM_collectStripTXT(W,i_CPTN);
end;

function tIn0k_hintDOC_expM0.getText_docHEAD_btwn_CA(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_ROOT,contEXT);
end;

function tIn0k_hintDOC_expM0.getText_docHEAD_Article(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj) , _cDeBUG_errMsg_WOBJ_nil_);
      Assert(Assigned(i_ARTC) and (ITM_eItm(W,i_ARTC)=eITM_article), 'itmCTP<>eITM_caption');
    {$endIf}
    result:=_std_TEXT(W,i_ARTC,contEXT)+ITM_collectStripTXT(W,i_ARTC);
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.process_docHEAD_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_CPTN,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_docHEAD_Caption_work(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=getText_docHEAD_Caption(W,i_CPTN,contEXT);
end;

function tIn0k_hintDOC_expM0.process_docHEAD_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_CPTN,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_docHEAD_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_ARTC,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_docHEAD_Article_work(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=getText_docHEAD_Article(W,i_ARTC,contEXT);
end;

function tIn0k_hintDOC_expM0.process_docHEAD_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_ARTC,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_docHEAD_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_ROOT,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_docHEAD_work(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_FBS_(W,i_ROOT,ITM_ROOT,contEXT,eITM_caption,eITM_article, @process_docHEAD_wrkF_wrkCPTN,@process_docHEAD_wrkB_btwn_TT,@process_docHEAD_wrkS_wrkARTC,false,false);
end;

function tIn0k_hintDOC_expM0.process_docHEAD_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_ROOT,contEXT);
end;

//---------------------------------------------------------------------------^^^

function tIn0k_hintDOC_expM0.process_docHEAD_wrkF_wrkCPTN(const W:rIn0k_hintDOC_ExpWRK; const itmCPT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,itmCPT,eITM_caption,contEXT,@process_docHEAD_Caption_befo,@process_docHEAD_Caption_work,@process_docHEAD_Caption_afte,true)
end;

function tIn0k_hintDOC_expM0.process_docHEAD_wrkB_btwn_TT(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=getText_docHEAD_btwn_CA(W,i_ROOT,contEXT)
end;

function tIn0k_hintDOC_expM0.process_docHEAD_wrkS_wrkARTC(const W:rIn0k_hintDOC_ExpWRK; const itmART:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,itmART,eITM_article,contEXT,@process_docHEAD_Article_befo,@process_docHEAD_Article_work,@process_docHEAD_Article_afte,true)
end;

{%endregion}

{%region --- eITM_ROOT CNTN ( СОДЕРЖИМОЕ) - /fold }

function tIn0k_hintDOC_expM0.getText_docCNTN_btwn_CS(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_ROOT,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_docCNTN_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_Befo(W,i_ROOT,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_docCNTN_work(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin // проходим по всем СЕКЦИЯМ в контенте, и пытаемся чего-ниб сгенерировать
    result:=_fnk_CNT_(W,i_ROOT,ITM_SCTN,contEXT,@GT_section_befo,@GT_section_work,@GT_section_afte,@getText_docCNTN_btwn_CS);
end;

function tIn0k_hintDOC_expM0.process_docCNTN_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_ROOT,contEXT);
end;

{%endregion}

{%region --- eITM_ROOT (КОРЕНЬ документа) - /fold }

function tIn0k_hintDOC_expM0.getText_HintDoc_btwn_HC(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT(W,i_ROOT,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_HintDoc_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=_std_befo(W,i_ROOT,contEXT,prntCXT);
end;

function tIn0k_hintDOC_expM0.process_HintDoc_work(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_FBS_(W,i_ROOT,ITM_ROOT,contEXT, @process_HintDoc_wrkF_wrkHEAD,@getText_HintDoc_btwn_HC,@process_HintDoc_wrkS_wrkCNTN, false,TRUE);
end;

function tIn0k_hintDOC_expM0.process_HintDoc_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_afte(W,i_ROOT,contEXT);
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_expM0.process_HintDoc_wrkF_wrkHEAD(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,i_ROOT,ITM_ROOT,contEXT,@process_docHEAD_befo,@process_docHEAD_work,@process_docHEAD_afte,FALSE);
end;

function tIn0k_hintDOC_expM0.process_HintDoc_wrkB_btwn_HC(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=getText_HintDoc_btwn_HC(W,i_ROOT,contEXT);
end;

function tIn0k_hintDOC_expM0.process_HintDoc_wrkS_wrkCNTN(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_fnk_BWA_(W,i_ROOT,ITM_ROOT,contEXT,@process_docCNTN_befo,@process_docCNTN_work,@process_docCNTN_afte,FALSE);
end;

{%endregion}

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0.execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;
var tmp:tIn0k_himtDOC_Item;
begin
    {$ifOpt D+}
      Assert(Assigned(W.obj), _cDeBUG_errMsg_WOBJ_nil_);
    {$endIf}
    tmp:=obj_ITMs_root(W.obj);
    if obj_item_notNil_PRC_NO(W.obj,tmp)
    then result:=_fnk_BWA_(W,tmp,ITM_ROOT,nil,@process_HintDoc_befo,@process_HintDoc_work,@process_HintDoc_afte,true)
    else result:=''
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_expM0._prepare_calc_PRC(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer):tIn0k_hintDOC_ePRC;
var tmp:tIn0k_himtDOC_Item;
begin // рекурсивно обходим узлы и выставляем признак "ещЁ НЕ обрабатывался"
      // если ВЛОЖЕННЫЙ itm_raw имеет НЕ пустой текст
    result:=PRC_ndf;
    if obj_ITM_eItm(W.obj,itm)=itm_raw then begin
        if ITM_collectStripTXT(W,itm)<>'' then begin
            result:=PRC_No;
        end;
    end
    else begin
        tmp:=obj_ITM_chld(W.obj,itm);
        while tmp<>nil do begin
            if _prepare_calc_PRC(W,tmp)=PRC_No then result:=PRC_No;
            tmp:=obj_ITM_next(W.obj,tmp);
        end;
    end;
    //---
    obj_ePRC_set(W.obj,itm,result);
end;

function tIn0k_hintDOC_expM0.prepare_calc_PRC(const W:rIn0k_hintDOC_ExpWRK):boolean;
begin //< пользуемся тем что КАЖДЫЙ hintDOC имеет в корне ITM_ROOT
    result:=inherited;
   _prepare_calc_PRC(W,obj_ITMs_root(W.obj));
    result:=obj_ITMs_getPRC(W.obj)<>PRC_ndf;
end;

end.
