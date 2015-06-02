unit in0k_hintDOC_exp_IProHTML;

{$mode objfpc}{$H+}

interface

uses Graphics, sysutils,
    in0k_hintDOC,in0k_hintDOC_core_Token,in0k_hintDOC_expM0_toHTML;

type

  tIn0k_hintDOC_exp_IProHTML_core=class(tIn0k_hintDOC_expM0T0)
  {$region --- inSide superCommon functions ---------------------- /fold }
   protected //< стандартные вызовы
     function _std_TEXT_BR(const{%H-}W:rIn0k_hintDOC_ExpWRK; const{%H-}i_Node:tIn0k_himtDOC_Item; const{%H-}contEXT:pointer):string; inline;
  {$endRegion}
  {$region --- функции генерирования обобщенной HTML разметка ---- /fold }
  protected
    function _gHtml_Color_(const color:tColor):string;
    function _gHtml_Prprt_(const name,value:string):string;
    function _gHtml_PrCLR_(const name:string; const color:tColor):string;
  protected
    function _gHtml_TAG_IMG_(const W,H:integer):string;
  protected
    function _gHtml_TAG_TD_(const color:tColor):string;                       overload;
    function _gHtml_TAG_TD_(const color:tColor; const height:integer):string; overload;
    function _gHtml_TAG_TD_width_(const width:integer):string;
  {$endRegion}
  {$region --- функции генерирования спец. HTML разметки --------- /fold }
  protected
    function _gHtml_tdBefo_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
    function _gHtml_tdAfte_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
  protected
    function _gHtml_ROW_WIDTHS_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
    function _gHtml_ROW_border_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):string;
    function _gHtml_ROW_grid_H_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):string;
    function _gHtml_ROW_grid_B_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
  protected
    function _gHtml_TBL_height_(const Height:integer):string;
  {$endRegion}
  {%region --- eITM_NODE CA (строка Таблици) - /fold }
  protected
    function  process_NODE_CA_wrkCPTN_befo(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; out   context:pointer; const prntCnt:pointer):string; override;
    function  process_NODE_CA_wrkCPTN_afte(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; var   context:pointer):string; override;
    //---
    function  process_NODE_CA_wrkARTC_befo(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; out   context:pointer; const prntCnt:pointer):string; override;
    function  process_NODE_CA_wrkARTC_afte(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; var   context:pointer):string; override;
    //---
    function  process_NODE_CA_wrkCAPT     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function  process_NODE_CA_wrkARTC     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function  process_NODE_CA_wrkBODY     (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  {%endregion}
  {%region --- eITM_NODE DD (строка Таблици) - /fold }
  protected
    function  process_NODE_DD_wrkDFND_befo(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; out  context:pointer; const prntCnt:pointer):string; override;
    function  process_NODE_DD_wrkDFND_afte(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; var  context:pointer):string; override;
    //---
    function  process_NODE_DD_wrkDTLS_befo(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; out  context:pointer; const prntCnt:pointer):string; override;
    function  process_NODE_DD_wrkDTLS_afte(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; var  context:pointer):string; override;
    //---
    function  process_NODE_DD_wrkBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string; override;
    //---
    function  process_NODE_DD_befo   (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; out crtData:pointer; const prntD:pointer):string; override;
    function  process_NODE_DD_btwn_DD(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const  data:pointer):string; override;
    function  process_NODE_DD_btwn_DB(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const  data:pointer):string; override;
    function  process_NODE_DD_afte   (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; var dstData:pointer):string; override;
  {%endregion}
  {%region --- eITM_SCTN TBL       (ТАБЛИЦА) - /fold }
  protected
    function  getText_tblBODY_btwn_NN(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;  override;
    function  process_tblBODY_work   (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; const contEXT:pointer):string; override;
  protected //< eITM_SCTN as table (ЗАГОЛОВОК таблици)
    function  getText_tblHEAD_Caption(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; const contEXT:pointer):string; override;
    function  process_tblHEAD_work   (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; const contEXT:pointer):string; override;
  protected //< eITM_SCTN as table (ГРУППА-таблица)
    function  process_sctnTBL_befo   (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; out   contEXT:pointer; const prntCXT:pointer):string; override;
    function  process_sctnTBL_work   (const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  {%endregion}
  {%region --- eITM_SCTN PAR      (ПАРАГРАФ) - /fold }
  protected //< Заголовок ПАРАГРАФА
    function  process_sctnPAR_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; override;
    function  process_sctnPAR_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:tIn0k_himtDOC_Item; var   contEXT:pointer):string; override;
    function  getText_sctnPAR_btwn_CA     (const W:rIn0k_hintDOC_ExpWRK; const I_SCTN:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function  process_sctnPAR_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; override;
    function  process_sctnPAR_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:tIn0k_himtDOC_Item; var   contEXT:pointer):string; override;
  {%endregion}
  {%region --- eITM_ROOT  (КОРЕНЬ документа) - /fold }
  protected
    function  process_docHEAD_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const itmCPT:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; override;
    function  process_docHEAD_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const itmCPT:tIn0k_himtDOC_Item; var   contEXT:pointer):string; override;
    function  getText_docHEAD_btwn_CA     (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
    function  process_docHEAD_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const itmART:tIn0k_himtDOC_Item; out   contEXT:pointer; const prntCXT:pointer):string; override;
    function  process_docHEAD_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const itmART:tIn0k_himtDOC_Item; var   contEXT:pointer):string; override;
  protected
    function  process_HintDoc_work        (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  protected
    function  getText_docCNTN_btwn_CS     (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  protected
    function  getText_HintDoc_btwn_HC     (const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string; override;
  {%endregion}
  protected // перебиваем РОДИЕТЕЛЯ для НАШЕЙ генерации
    function execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string; OVERRIDE;
  end;

 tIn0k_hintDOC_exp_IProHTML=class(tIn0k_hintDOC_exp_IProHTML_core)
  protected // перебиваем РОДИЕТЕЛЯ для НАШЕЙ генерации
    function execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string; OVERRIDE;
  end;

implementation

type
 rIn0k_hintDOC_exp_IProHTML_context=record
    C:pIn0k_hintDOC_expM0T0__GRP; //< текущая настройка для таблици
    R:integer;                    //< типа номер строки
  end;
 pIn0k_hintDOC_exp_IProHTML_context=^rIn0k_hintDOC_exp_IProHTML_context;

{$region --- текстовые константы применяемые в HTML разметке ----- /fold }

const //< символы

  _cHtmlSmb_SRT    ='<';
  _cHtmlSmb_CLS    ='/';
  _cHtmlSmb_END    ='>';
  _cHtmlSmb_space  =' ';
  _cHtmlSmb_quotes ='"';
  _cHtmlSmb_equal  ='=';
  _cHtmlSmb_sharp  ='#';
  _cHtmlSmb_NOL    ='0';


const //< целые слова

  _cHtmlWrd_100prc  ='100%';
  _cHtmlWrd_width   ='width';
  _cHtmlWrd_heiht   ='height';
  _cHtmlWrd_bgcolor ='bgcolor';
  _cHtmlWrd_colSpan ='colspan';
  _cHtmlWrd_algn    ='align';
  _cHtmlWrd_left    ='left';
  _cHtmlWrd_valign  ='valign';
  _cHtmlWrd_baseline='baseline';
   //---
  _cHtmlWrd_border     ='border';
  _cHtmlWrd_cellpadding='cellpadding';
  _cHtmlWrd_cellspacing='cellspacing';

const //< названия тегов

  _cHtmlTag_html_='html';
  _cHtmlTag_body_='body';
  _cHtmlTag_BR_  ='br';
  _cHtmlTag_IMG_ ='img';
  _cHtmlTag_TR_  ='tr';
  _cHtmlTag_TD_  ='td';
  _cHtmlTag_TBL_ ='table';

const //< "самостоятельные" ТЕГИ

  _cHtml_TAG_HTML_srt_=_cHtmlSmb_SRT+_cHtmlTag_html_+_cHtmlSmb_END;
  _cHtml_TAG_HTML_end_=_cHtmlSmb_SRT+_cHtmlSmb_CLS+_cHtmlTag_html_+_cHtmlSmb_END;

  _cHtml_TAG_BODY_srt_=_cHtmlSmb_SRT+_cHtmlTag_body_+_cHtmlSmb_END;
  _cHtml_TAG_BODY_end_=_cHtmlSmb_SRT+_cHtmlSmb_CLS+_cHtmlTag_body_+_cHtmlSmb_END;

  _cHtml_TAG_SHY='&shy;';
  _cHtml_TAG_BR_=_cHtmlSmb_SRT+_cHtmlTag_BR_+_cHtmlSmb_END;

  _cHtml_TAG_TD_srt_=_cHtmlSmb_SRT+_cHtmlTag_TD_+_cHtmlSmb_END;
  _cHtml_TAG_TD_end_=_cHtmlSmb_SRT+_cHtmlSmb_CLS+_cHtmlTag_TD_+_cHtmlSmb_END;
  _cHtml_TAG_TD_    =_cHtml_TAG_TD_srt_+_cHtml_TAG_TD_end_;

  _cHtml_TAG_TR_srt_=_cHtmlSmb_SRT+_cHtmlTag_TR_+_cHtmlSmb_END;
  _cHtml_TAG_TR_end_=_cHtmlSmb_SRT+_cHtmlSmb_CLS+_cHtmlTag_TR_+_cHtmlSmb_END;
  _cHtml_TAG_TR_    =_cHtml_TAG_TR_srt_+_cHtml_TAG_TR_end_;

  _cHtml_TAG_TBL_srt_=_cHtmlSmb_SRT+_cHtmlTag_TBL_+_cHtmlSmb_END;
  _cHtml_TAG_TBL_end_=_cHtmlSmb_SRT+_cHtmlSmb_CLS+_cHtmlTag_TBL_+_cHtmlSmb_END;
  _cHtml_TAG_TBLCsrt_=_cHtmlSmb_SRT+_cHtmlTag_TBL_+
                      _cHtmlSmb_space+_cHtmlWrd_border+_cHtmlSmb_equal+_cHtmlSmb_quotes+_cHtmlSmb_NOL+_cHtmlSmb_quotes+
                      _cHtmlSmb_space+_cHtmlWrd_cellpadding+_cHtmlSmb_equal+_cHtmlSmb_quotes+_cHtmlSmb_NOL+_cHtmlSmb_quotes+
                      _cHtmlSmb_space+_cHtmlWrd_cellspacing+_cHtmlSmb_equal+_cHtmlSmb_quotes+_cHtmlSmb_NOL+_cHtmlSmb_quotes+
                      _cHtmlSmb_END;

{$endRegion}

{$region --- функции генерирования обобщенной HTML разметка ------ /fold }

function tIn0k_hintDOC_exp_IProHTML_core._gHtml_Color_(const color:tColor):string;
var tmp:TColor;
begin {todo: найти менее велосипедный вариант}
    tmp:=ColorToRGB(color);
    result:=_cHtmlSmb_sharp+ IntToHex( tmp , 6 );
                //IntToHex( Red  ( tmp ), 2 ) +
                //IntToHex( Green( tmp ), 2 ) +
                //IntToHex( blue ( tmp ), 2 ) ;
end;

{генерируем: свойство тега}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_Prprt_(const name,value:string):string;
begin
    if value<>''
    then result:=_cHtmlSmb_space+name+_cHtmlSmb_equal+_cHtmlSmb_quotes+value+_cHtmlSmb_quotes
    else result:='';
end;

{генерируем: свойство тега ЦВЕТ}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_PrCLR_(const name:string; const color:tColor):string;
begin
    result:='';
    if (color<>clDefault)and(color<>clNone) then begin
        result:=_gHtml_Prprt_(name,_gHtml_Color_(color));
    end;
end;

//------------------------------------------------------------------------------

{генерируем: пустую картинку указанного размера}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_TAG_IMG_(const W,H:integer):string;
begin
    result:='';
    if (W>=0)or(H>=0) then begin
        if W>=0 then result:=result+_gHtml_Prprt_(_cHtmlWrd_width,IntToStr(W));
        if H>=0 then result:=result+_gHtml_Prprt_(_cHtmlWrd_heiht,IntToStr(H));
        result:=_cHtmlSmb_SRT+_cHtmlTag_IMG_+result+_cHtmlSmb_END;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{генерируем: ячейку таблици с ЦВЕТОМ фона (ячейни НИЧЕГО не содержит)}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_TAG_TD_(const color:tColor):string;
begin
    result:=_cHtmlSmb_SRT+_cHtmlTag_TD_+
            _gHtml_PrCLR_(_cHtmlWrd_bgcolor,color)+
            _cHtmlSmb_END+
            _cHtml_TAG_TD_end_;
end;

{генерируем: ячейку таблици с ЦВЕТОМ фона и высотой (ячейни НИЧЕГО не содержит)}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_TAG_TD_(const color:tColor; const height:integer):string;
begin
    result:=_cHtmlSmb_SRT+_cHtmlTag_TD_+
            _gHtml_Prprt_(_cHtmlWrd_heiht  , inttostr(height))+
            _gHtml_PrCLR_(_cHtmlWrd_bgcolor, color)+
            _cHtmlSmb_END+
            _gHtml_TAG_IMG_(0,height)+
            _cHtml_TAG_TD_end_;
end;

{генерируем: ячейку таблици с шириной (ячейни содержит картинку "распорку")}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_TAG_TD_width_(const width:integer):string;
const _c_html_TAG_TR_WIDTHS_imgHeight=1;
begin
    result:=_cHtmlSmb_SRT+_cHtmlTag_TD_;
        if (width>=0)   then result:=result+' '+_gHtml_Prprt_(_cHtmlWrd_width,IntToStr(width))
        else
        if (width=-100) then result:=result+' '+_gHtml_Prprt_(_cHtmlWrd_width,_cHtmlWrd_100prc);
    result:=result+_cHtmlSmb_END;
    result:=result+_gHtml_TAG_IMG_(width,_c_html_TAG_TR_WIDTHS_imgHeight);
    result:=result+_cHtml_TAG_TD_end_;
end;

{$endRegion}

{$region --- функции генерирования спец. HTML разметки ----------- /fold }

{}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_tdBefo_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
begin
    result:=                               CFG^.BefoAfte_Cell.befo;
    if result='' then result:=CfgGrp_COMMON(W)^.BefoAfte_Cell.befo;
end;

{}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_tdAfte_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
begin
    result:=                               CFG^.BefoAfte_Cell.afte;
    if result='' then result:=CfgGrp_COMMON(W)^.BefoAfte_Cell.afte;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{строка таблици с УСТАНОВЛЕННЫМИ значениями ШИРИНЫ колонок}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_ROW_WIDTHS_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
begin
    result:=_cHtml_TAG_TR_srt_
                +_gHtml_TAG_TD_width_(cfgGRP_BrdLFT_Width(W,CFG))
                +_gHtml_TAG_TD_width_(cfgGRP_Indnt_DFND_L(W,CFG))
                +_gHtml_TAG_TD_width_(1)
                +_gHtml_TAG_TD_width_(cfgGRP_Indnt_DFND_R(W,CFG))
                +_gHtml_TAG_TD_width_(cfgGRP_Grid_V_Width(W,CFG))
                +_gHtml_TAG_TD_width_(cfgGRP_Indnt_DTLS_L(W,CFG))
                +_gHtml_TAG_TD_width_(-100)
                +_gHtml_TAG_TD_width_(cfgGRP_Indnt_DTLS_R(W,CFG))
                +_gHtml_TAG_TD_width_(cfgGRP_Border_Width(W,CFG,false))
           +_cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core._gHtml_ROW_border_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):string;
var size:integer;
begin
    result:='';
    size:=cfgGRP_Border_Width(W,CFG,GRP);
    if size>0 then begin
        result:=_cHtml_TAG_TR_srt_
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,0,GRP),size)
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,1,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,2,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,3,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,4,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,5,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,6,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,7,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,CFG,8,GRP))
               +_cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
    end;
end;

function tIn0k_hintDOC_exp_IProHTML_core._gHtml_ROW_grid_H_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP; const GRP:tIn0k_himtDOC_Item):string;
var size:integer;
begin
    result:='';
    size:=cfgGRP_Grid_H_Width(W,CFG,GRP);
    if size>0 then begin
        result:=_cHtml_TAG_TR_srt_
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,0,GRP),size)
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,1,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,2,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,3,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,4,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,5,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,6,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,7,GRP))
                +_gHtml_TAG_TD_(cfgGRP_Grid_H_ClrNN(W,CFG,8,GRP))
               +_cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
    end;
end;

function tIn0k_hintDOC_exp_IProHTML_core._gHtml_ROW_grid_B_(const W:rIn0k_hintDOC_ExpWRK; const CFG:pIn0k_hintDOC_expM0T0__GRP):string;
var size:integer;
begin
    result:='';
    size:=cfgGRP_Grid_B_Width(W,CFG);
    if size>0 then begin
        result:=_cHtml_TAG_TR_srt_
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,0),size)
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,1))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,2))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,3))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,4))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,5))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,6))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,7))
                +_gHtml_TAG_TD_(cfgGRP_Grid_B_ClrNN(W,CFG,8))
               +_cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

{генерируем: таблица с указанной высотой, в качестве горизонтального разделителя}
function tIn0k_hintDOC_exp_IProHTML_core._gHtml_TBL_height_(const Height:integer):string;
begin
    result:=_cHtml_TAG_TBLCsrt_+_cHtml_TAG_TR_srt_+_cHtml_TAG_TD_srt_
            +_gHtml_TAG_IMG_(1,Height)+
            _cHtml_TAG_TD_end_+_cHtml_TAG_TR_end_+_cHtml_TAG_TBL_end_;
end;

{$endRegion}

{$region --- inSide superCommon functions - /fold }

function tIn0k_hintDOC_exp_IProHTML_core._std_TEXT_BR(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_cHtml_TAG_BR_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
end;

{$endRegion}

{%region --- eITM_NODE CA     (CPTN-BefoAfte_ARTC) - /fold }

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkCPTN_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:pointer; out context:pointer; const prntCnt:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(prntCnt),'prntCnt ===nil');
    {$endIf}
    context:=prntCnt;
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_CAPT.befo;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_CAPT.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkCPTN_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:pointer; var context:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(context),'context ===nil');
    {$endIf}
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_CAPT.afte;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_CAPT.afte;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkARTC_befo(const W:rIn0k_hintDOC_ExpWRK; const i_Node:pointer; out context:pointer; const prntCnt:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(prntCnt),'prntCnt ===nil');
    {$endIf}
    context:=prntCnt;
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_ARTC.befo;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_ARTC.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkARTC_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:pointer; var context:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(context),'context ===nil');
    {$endIf}
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_ARTC.afte;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_ARTC.afte;
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkCAPT(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const context:pointer):string;
begin
    result:=_cHtml_TAG_TR_srt_;
    //--- доп Ячейки
    result:=result+_gHtml_TAG_TD_(cfgGRP_BrdLFT_Color(W,context,i_NODE));
    result:=result+_gHtml_TAG_TD_(cfgGRP_Row_BG_Color(W,context,W.R));
    //--- ячейка с данными (ОТКРЫВАЮЩИЙ ТЕГ)
    result:=result+_cHtmlSmb_SRT+_cHtmlTag_TD_;
    result:=result+_gHtml_PrCLR_(_cHtmlWrd_bgcolor,cfgGRP_Row_BG_Color(W,context,W.R));
    result:=result+_gHtml_Prprt_(_cHtmlWrd_colSpan,'5');
    result:=result+_gHtml_Prprt_(_cHtmlWrd_algn  ,_cHtmlWrd_left);
    result:=result+_cHtmlSmb_END+_gHtml_tdBefo_(W,context);
    //--- сами Данные
    result:=result+inherited;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkARTC(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const context:pointer):string;
var tmpWidth:string;
    tmpColor:string;
var lWidth:integer;
    lColor:tColor;
begin
    //--- сами Данные + оборотка для ячейки + ячейка с данными (ЗАКРЫВАЮЩИЙ ТЕГ)
    result:=inherited+_gHtml_tdAfte_(W,context)+_cHtml_TAG_TD_end_;
    //--- доп Ячейки
    result:=result+_gHtml_TAG_TD_(cfgGRP_Row_BG_Color(W,context,W.R));
    result:=result+_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,context,8,i_NODE));
    //---
    result:=result+_cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_CA_wrkBODY(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_gHtml_ROW_grid_B_(W,contEXT)+inherited;
end;

{%endregion}

{%region --- eITM_NODE DD     (BefoAfte_DEFI-DTLS) - /fold }

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_wrkDFND_befo(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; out context:pointer; const prntCnt:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(prntCnt),'prntCnt ===nil');
    {$endIf}
    context:=prntCnt;
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_DEFI.befo;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_DEFI.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_wrkDFND_afte(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; var context:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(context),'prntCnt ===nil');
    {$endIf}
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_DEFI.afte;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_DEFI.afte;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_wrkDTLS_befo(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; out context:pointer; const prntCnt:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(prntCnt),'prntCnt ===nil');
    {$endIf}
    context:=prntCnt;
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_DESC.befo;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_DESC.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_wrkDTLS_afte(const W:rIn0k_hintDOC_ExpWRK; const itm:pointer; var context:pointer):string;
begin
    {$ifOpt D+}
      Assert(Assigned(context),'prntCnt ===nil');
    {$endIf}
    result :=pIn0k_hintDOC_expM0T0__GRP(context)^.BefoAfte_DESC.afte;
    if result='' then result := CfgGrp_COMMON(W)^.BefoAfte_DESC.afte;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_wrkBODY_afte(const W:rIn0k_hintDOC_ExpWRK; const i_Node:tIn0k_himtDOC_Item; var contEXT:pointer):string;
begin
    result:=_std_TEXT_BR(W,i_Node,contEXT)+_gHtml_TBL_height_(cfgGRP_Indnt_DTLS_L(W,contEXT));
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_befo   (const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; out crtData:pointer; const prntD:pointer):string;
var lColor:TColor; {todo: избавиться от этой переменной, она должна лежать в контектсте}
begin
    crtData:=prntD;
    lColor:=cfgGRP_Row_BG_Color(W,crtData,W.R);
    //---
    result:=_cHtml_TAG_TR_srt_;
        result:=result+_gHtml_TAG_TD_(cfgGRP_BrdLFT_Color(W,crtData,i_NODE));
        result:=result+_gHtml_TAG_TD_(lColor);
        //--- ячейка с данными (ОТКРЫВАЮЩИЙ ТЕГ)
        result:=result+_cHtmlSmb_SRT+_cHtmlTag_TD_;
        result:=result+_gHtml_PrCLR_(_cHtmlWrd_bgcolor,lColor);
        result:=result+_gHtml_Prprt_(_cHtmlWrd_algn   ,_cHtmlWrd_left);
        result:=result+_gHtml_Prprt_(_cHtmlWrd_valign ,_cHtmlWrd_baseline);
        result:=result+_cHtmlSmb_END+_gHtml_tdBefo_(W,crtData)+_cHtml_TAG_SHY;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_btwn_DD(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const data:pointer):string;
var tmpWidth:string;
    tmpColor:string;
var lWidth:integer;
    lColor:tColor;
begin
    result:=_gHtml_tdAfte_(W,Data)+_cHtml_TAG_TD_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
    lColor:=cfgGRP_Row_BG_Color(W,data,W.R);
    //---
    result:=result+_gHtml_TAG_TD_(lColor);
    result:=result+_gHtml_TAG_TD_(cfgGRP_Grid_V_Color(W,data,i_NODE));
    result:=result+_gHtml_TAG_TD_(lColor);
    //--- ячейка с данными (ОТКРЫВАЮЩИЙ ТЕГ)
    result:=result+_cHtmlSmb_SRT+_cHtmlTag_TD_;
    result:=result+_gHtml_PrCLR_(_cHtmlWrd_bgcolor,lColor);
    result:=result+_gHtml_Prprt_(_cHtmlWrd_algn   ,_cHtmlWrd_left);
    result:=result+_gHtml_Prprt_(_cHtmlWrd_valign ,_cHtmlWrd_baseline);
    result:=result+_cHtmlSmb_END+_gHtml_tdBefo_(W,Data);
    result:=result+_cHtml_TAG_SHY;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_btwn_DB(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; const  data:pointer):string;
begin
    result:=_std_TEXT_BR(W,i_NODE,data);
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_NODE_DD_afte(const W:rIn0k_hintDOC_ExpWRK; const i_NODE:pointer; var dstData:pointer):string;
var tmpWidth:string;
    tmpColor:string;
var lWidth:integer;
    lColor:tColor;
begin
    result:=_gHtml_tdAfte_(W,dstData)+_cHtml_TAG_TD_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
    //-----
    lColor:=cfgGRP_Row_BG_Color(W,dstData,W.R);
    result:=result+_gHtml_TAG_TD_(lColor);
    result:=result+_gHtml_TAG_TD_(cfgGRP_Border_ClrNN(W,dstData,8,i_NODE));
    result:=result+_cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
end;

{%endregion}

{%region --- eITM_SCTN TBL      (ТАБЛИЦА) - /fold }

function tIn0k_hintDOC_exp_IProHTML_core.getText_tblBODY_btwn_NN(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var tmp:PInteger;
begin {todo: ИЗБАВИТЬСЯ от этого инородного подхода (W.R)}
    result:=inherited+_gHtml_ROW_grid_H_(W,contEXT,itmGRP);
    if (W.R>=0) then begin
        tmp:=@W.R;
        tmp^:=tmp^+1;
    end;
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_exp_IProHTML_core.process_tblBODY_work(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; const contEXT:pointer):string;
var strBRD:string;
begin
    result:=inherited;
    if result<>'' then begin
        strBRD:=_gHtml_ROW_border_(W,contEXT,itmGRP);
        result:=strBRD+result+strBRD;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core.getText_tblHEAD_Caption(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; const contEXT:pointer):string;
begin
    case _itm_SCTN_NODEs(w.obj,itmGRP) of
        eRAW_tkn_EXC: result:=pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_EXC.Header_Text;
        eRAW_tkn_PRM: result:=pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_PRM.Header_Text;
        eRAW_tkn_RET: result:=pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_RET.Header_Text;
        eRAW_tkn_VAL: result:=pIn0k_hintDOC_expM0T0__Config(w.cnf)^.group_VAL.Header_Text;
        else          result:='';
    end;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_tblHEAD_work(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; const  contEXT:pointer):string;
begin
    if not itemGRP_inline_(W,itmGRP) then begin
        result:=inherited;
        if result<>'' then begin
            result:=_cHtml_TAG_TR_srt_+
                    _gHtml_TAG_TD_(cfgGRP_BrdHDR_Color(W,contEXT,itmGRP))+
                    _cHtml_TAG_TD_+
                     //--- ячейка с текстом заголовка
                    _cHtmlSmb_SRT+_cHtmlTag_TD_+
                    _gHtml_Prprt_(_cHtmlWrd_colSpan,'5')+
                    _gHtml_Prprt_(_cHtmlWrd_algn  ,_cHtmlWrd_left)+
                    _cHtmlSmb_END+_gHtml_tdBefo_(W,context)+
                     result+
                    _gHtml_tdAfte_(W,context)+_cHtml_TAG_TD_end_+
                     //---
                    _cHtml_TAG_TD_+
                    _cHtml_TAG_TD_+
                    _cHtml_TAG_TR_end_{$ifDef In0k_hintDOC_expM0T0_EOL}+LineEnding{$endif};
        end;
    end
    else result:='';
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function tIn0k_hintDOC_exp_IProHTML_core.process_sctnTBL_befo(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:pointer; out context:pointer; const prntCXT:pointer):string;
begin
    result:=inherited;
    if itemGRP_inline_(W,itmGRP) then begin //< как у родителя
        context:=prntCXT;
    end
    else begin
        context:=CfgGrp_itmGRP(W,itmGRP);
    end;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_sctnTBL_work(const W:rIn0k_hintDOC_ExpWRK; const itmGRP:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=inherited;
    if (result<>'')and(not itemGRP_inline_(W,itmGRP))then begin
        //--- оборачиваем в таблицу
        result:= _cHtml_TAG_TBLCsrt_+_gHtml_ROW_WIDTHS_(W,contEXT)+result+_cHtml_TAG_TBL_end_;
        //--- фигня конкретно для IPro, иначе width=100% криво работает
        result :=_cHtml_TAG_TBLCsrt_+_cHtml_TAG_TR_srt_+_cHtml_TAG_TD_srt_+
                  result+
                 _cHtml_TAG_TD_end_+_cHtml_TAG_TR_end_+_cHtml_TAG_TBL_end_;

    end;
end;

{%endregion}

{%region --- eITM_SCTN PAR     (ПАРАГРАФ) - /fold }

function tIn0k_hintDOC_exp_IProHTML_core.process_sctnPAR_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:pointer; out context:pointer; const prntCXT:pointer):string;
begin
    result:=inherited+pIn0k_hintDOC_expM0T0__Config(W.cnf)^.sections_CAPT_BTA.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_sctnPAR_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const i_CPTN:pointer; var context:pointer):string;
begin
    result:=pIn0k_hintDOC_expM0T0__Config(W.cnf)^.sections_CAPT_BTA.afte+inherited;
end;

function tIn0k_hintDOC_exp_IProHTML_core.getText_sctnPAR_btwn_CA(const W:rIn0k_hintDOC_ExpWRK; const i_SCTN:pointer; const context:pointer):string;
begin
    result:=_std_TEXT_BR(W,i_SCTN,context);
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_sctnPAR_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:pointer; out context:pointer; const prntCXT:pointer):string;
begin
    result:=inherited+pIn0k_hintDOC_expM0T0__Config(W.cnf)^.sections_ARTC_BTA.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_sctnPAR_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const i_ARTC:pointer; var context:pointer):string;
begin
    result:=pIn0k_hintDOC_expM0T0__Config(W.cnf)^.sections_ARTC_BTA.afte+inherited;
end;

{%endregion}

{%region --- eITM_ROOT (КОРЕНЬ документа) - /fold }

function tIn0k_hintDOC_exp_IProHTML_core.process_docHEAD_Caption_befo(const W:rIn0k_hintDOC_ExpWRK; const itmCPT:pointer; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=inherited+pIn0k_hintDOC_expM0T0__Config(W.cnf)^.document_CAPT_BTA.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_docHEAD_Caption_afte(const W:rIn0k_hintDOC_ExpWRK; const itmCPT:pointer; var contEXT:pointer):string;
begin
    result:=pIn0k_hintDOC_expM0T0__Config(W.cnf)^.document_CAPT_BTA.afte+inherited;
end;

function tIn0k_hintDOC_exp_IProHTML_core.getText_docHEAD_btwn_CA(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT_BR(W,i_ROOT,contEXT);
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_docHEAD_Article_befo(const W:rIn0k_hintDOC_ExpWRK; const itmART:pointer; out contEXT:pointer; const prntCXT:pointer):string;
begin
    result:=inherited+pIn0k_hintDOC_expM0T0__Config(W.cnf)^.document_ARTC_BTA.befo;
end;

function tIn0k_hintDOC_exp_IProHTML_core.process_docHEAD_Article_afte(const W:rIn0k_hintDOC_ExpWRK; const itmART:pointer; var contEXT:pointer):string;
begin
    result:=pIn0k_hintDOC_expM0T0__Config(W.cnf)^.document_ARTC_BTA.afte+inherited;
end;

//------------------------------------------------------------------------------

function  tIn0k_hintDOC_exp_IProHTML_core.process_HintDoc_work(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var tmp:pInteger;
begin
    if (W.R>0) then begin
        tmp:=@W.R;
        tmp^:=0;
    end;
    result:=inherited;
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_exp_IProHTML_core.getText_docCNTN_btwn_CS(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
var tmp:pInteger;
begin
    result:=_std_TEXT_BR(W,i_ROOT,contEXT)+_gHtml_TBL_height_(6)+_std_TEXT_BR(W,i_ROOT,contEXT);
    if (W.R>0) then begin
        tmp:=@W.R;
        tmp^:=0;
    end;
end;

//------------------------------------------------------------------------------

function tIn0k_hintDOC_exp_IProHTML_core.getText_HintDoc_btwn_HC(const W:rIn0k_hintDOC_ExpWRK; const i_ROOT:tIn0k_himtDOC_Item; const contEXT:pointer):string;
begin
    result:=_std_TEXT_BR(W,i_ROOT,contEXT)+_gHtml_TBL_height_(6)+_std_TEXT_BR(W,i_ROOT,contEXT);
end;

{%endregion}


function tIn0k_hintDOC_exp_IProHTML_core.execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;
var c:pIn0k_hintDOC_exp_IProHTML_context;
   pW:pIn0k_hintDOC_ExpWRK;
begin
    //--- создаем контекст выполнения
    pW:=@W;
    new(pIn0k_hintDOC_exp_IProHTML_context(pW^.cxt));
    with pIn0k_hintDOC_exp_IProHTML_context(pW^.cxt)^ do begin
        R:=0;
        C:=nil;
    end;
    //--- собственно РАБОТАЕМ
    result:=Inherited;
    //--- уничтожаем контекст выполнения
    with pIn0k_hintDOC_exp_IProHTML_context(pW^.cxt)^ do begin
        R:=0;
        C:=nil;
    end;
    dispose(pIn0k_hintDOC_exp_IProHTML_context(pW^.cxt));
    pIn0k_hintDOC_exp_IProHTML_context(pW^.cxt):=nil;
end;

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

function tIn0k_hintDOC_exp_IProHTML.execute_GENerate(const W:rIn0k_hintDOC_ExpWRK):string;
begin
    result:=inherited;
    if result<>'' then begin
        result:=_cHtml_TAG_HTML_srt_+_cHtml_TAG_BODY_srt_+
                 result+
                _cHtml_TAG_BODY_end_+_cHtml_TAG_HTML_end_;
    end;
end;



end.

