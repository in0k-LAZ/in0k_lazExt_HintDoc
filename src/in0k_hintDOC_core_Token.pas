unit in0k_hintDOC_core_Token;

{$mode objfpc}{$H+}

interface

uses typinfo;

const in0k_hintDOC_labelToken='@';

type


 tIn0k_hintDOC_FTPM=
  (
    FTPM_CA, //< заголовок, статья
    FTPM_0A, //< статья ТОЛЬКО
    FTPM_DD  //< отперделение описание
  );



 tIn0k_hintDOC_ePRC=
  (
    PRC_OK, //< УЖЕ обработан
    PRC_No, //< еще НЕ обрабатывался
    {}//--- непонятно и неизвестно что
    PRC_ndf //< НЕ определеный
  );


 tIn0k_hintDOC_core_eRAW=
  (
    {0}//--- СЛУЖЕБНЫЕ "типы"

    eRaw_docOPN,  //< токен ОТКРЫВАЮЩИЙ документ
    eRAW_docCLS,  //< токен ЗАКРЫВАЮЩИЙ документ
    eRAW_brkOpn,  //< токен ОТКРЫВАЮЩая скобка
    eRAW_brkCls,  //< токен ЗАКРЫВАЮЩИЙ скобка
    eRAW_lblTKN,  //< метка Токена (слежебный символ обозначающи НАЧАЛО токена)
    eRAW_strEXT,  //< метка УДЛИНИТЕЛЯ (extension) строки
    eRAW_srvTXT,  //< выделеный служебный текст

    {1}//--- ОСНОВНЫЕ типы (ВСТРОЕННЫЕ)

    eRAW_TEXT,    //< просто некий ТЕКСТ
    eRAW_LINE,    //< линия разделитель (пример строка:" === ")

    {2}//--- ПОЛЬЗОВАТЕЛЬСКИЕ:настраивать в `in0k_hintDOC_coreRAW_listOfLexemes`

    eRAW_tkn_VAL, //< специальная ОБЯЗАТЕЛЬНАЯ
    eRAW_tkn_PRM, //<
    eRAW_tkn_RET, //<
    eRAW_tkn_EXC, //<

    {3}//--- непонятно и неизвестно что
    eRAW_NDF      //< НЕ определеный
  );
 tIn0k_hintDOC_core_eRAWs=set of tIn0k_hintDOC_core_eRAW;



 tIn0k_hintDOC_core_itemNode_TYPE=(
    itmNODE_false,
    itmNODE_clean,
    itmNODE_hasDD,
    itmNODE_hasCA,
    itmNODE_mixed
    //itmNODE_other  //<
 );

  tIn0k_hintDOC_core_eItm=(
    itm_raw,    //< внутри указатель на объект описывающий положение в строке
    Itm_SRV,    //< некий сервисный узел (влючает в себя itm_raw)
    //---
    Itm_Text,   //<
    Itm_Title,  //<
    Itm_Name,   //<
    Itm_Note,   //<
    //---
    ITM_ROOT,   //< КОРЕНЬ распарсенного документа
    eITM_doc_START,
    eITM_doc_FINAL,
    eITM_NODE,




    eITM_caption,  //< заголовок, для статья
    eITM_article,  //< текстовка   (описание)

    eITM_defined,  //< определяемое  (термин)
    eITM_details,  //< подробности (описание)


    ITM_HEAD,   //< секция типа ЗАГОЛОВОК
    ITM_section,//< секция типа Просто СЕКЦИЯ
    ITM_SCTN,   //< секция типа Просто СЕКЦИЯ

    //---
    ITM_token,  //< разобранный токен по лексемам
    ITM_content,//< информационное наполнение
    {}//---


    ITM_PRG,    //< параграф
    //ITM_SCT,    //< группа (набор) однотипных
    ITM_GRP,    //< группа (набор) однотипных
    itm_PRM,    //<
    itm_RET,    //<
    itm_EXC,    //<
    itm_VAL,    //<
    {}//--- СПЕЦИАЛЬНЫЕ, быть они должны
    ITM_NDF     //< неизвестно что
  );


const

  cIn0k_hintDOC_core_eRAW_withDescription:tIn0k_hintDOC_core_eRAWs=
    [
        //RAW_lxm_GRP,
        //RAW_line,
        eRAW_tkn_PRM,
        eRAW_tkn_VAL,
        eRAW_tkn_RET,
        eRAW_tkn_EXC
    ];


  cIn0k_hintDOC_core_eRAW_parceAsTitleNote:tIn0k_hintDOC_core_eRAWs=
    [
     eRAW_tkn_RET,
     eRAW_tkn_EXC
    ];


function in0k_hintDOC_coreRAW_listOfLexemes(const eIMP:tIn0k_hintDOC_core_eRAW):string;
function in0k_hintDOC_coreRAW_excludeLexeme(var listOfLexemes:string):string;
function in0k_hintDOC_coreRAW_haveLexemes  (const eIMP:tIn0k_hintDOC_core_eRAW):boolean;

function in0k_hintDOC_coreRAW_in_coreITM   (const eRAW:tIn0k_hintDOC_core_eRAW; const eITM:tIn0k_hintDOC_core_eItm):boolean;


function in0k_hintDOC_coreRAW_withDescription (const eRaw:tIn0k_hintDOC_core_eRAW):boolean;
function in0k_hintDOC_coreRAW_parseAsTitleNode(const eRaw:tIn0k_hintDOC_core_eRAW):boolean;

function in0k_hintDOC_coreRAW_isNODE      (const eRaw:tIn0k_hintDOC_core_eRAW):boolean;

function in0k_hintDOC_coreRAW2ITM          (const eRaw:tIn0k_hintDOC_core_eRAW):tIn0k_hintDOC_core_eItm;



function in0k_hintDOC_coreITM_parseTopTEXT_sngl(const eRaw:tIn0k_hintDOC_core_eRAW):tIn0k_hintDOC_FTPM;
function in0k_hintDOC_coreITM_parseTopTEXT_spcl(const eRaw:tIn0k_hintDOC_core_eRAW; out selectSrvSMB:boolean):tIn0k_hintDOC_FTPM;

function in0k_hintDOC_coreITM_isGrpED  (const eITM:tIn0k_hintDOC_core_eItm):boolean;
function in0k_hintDOC_coreITM_isGroUP  (const eITM:tIn0k_hintDOC_core_eItm):boolean;
function in0k_hintDOC_coreITM_isGroUPForVAL(const eITM:tIn0k_hintDOC_core_eItm):boolean;

function in0k_hintDOC_coreRAW__Name(const eRaw:tIn0k_hintDOC_core_eRAW):string;
function in0k_hintDOC_coreITM__Name(const eItm:tIn0k_hintDOC_core_eItm):string;

procedure unitTest__in0k_hintDOC_core_RAW;

implementation

const //< символ РАЗДЕЛИТЕЛЬ написаний токенов
  _cHDLXMD_   ='|';
  _cHDLXMD_len=length(_cHDLXMD_);
const //< списки НАПИСАНИЙ
  _cHDLXMs_grp_='grp'+_cHDLXMD_+'group';
  _cHDLXMs_prm_='prm'+_cHDLXMD_+'param';
  _cHDLXMs_ret_='returns'+_cHDLXMD_+'return'+_cHDLXMD_+'ret';
  _cHDLXMs_exc_='exc'+_cHDLXMD_+'raises';
  _cHDLXMs_val_='val'+_cHDLXMD_+'value';

//   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -

function in0k_hintDOC_coreRAW_listOfLexemes(const eIMP:tIn0k_hintDOC_core_eRAW):string;
begin
    case eIMP of
        eRAW_tkn_PRM :result:=_cHDLXMs_prm_;
        //RAW_lxm_GRP :result:=_cHDLXMs_grp_;
        eRAW_tkn_RET :result:=_cHDLXMs_ret_;
        eRAW_tkn_EXC :result:=_cHDLXMs_exc_;
        eRAW_tkn_VAL :result:=_cHDLXMs_val_;
        else         result:='';
    end;
end;

//   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -

function in0k_hintDOC_coreRAW_isNODE      (const eRaw:tIn0k_hintDOC_core_eRAW):boolean;
begin

    case eRaw of
        eRAW_tkn_PRM ,
        eRAW_tkn_RET ,
        eRAW_tkn_EXC ,
        eRAW_tkn_VAL :result:=true;
        else         result:=false;
    end;



end;

function in0k_hintDOC_coreRAW2ITM(const eRaw:tIn0k_hintDOC_core_eRAW):tIn0k_hintDOC_core_eItm;
begin
    case eRaw of
        eRAW_TEXT    :result:=Itm_Text;
        eRAW_tkn_PRM :result:=itm_PRM;
        //RAW_lxm_GRP :result:=ITM_GRP;
        eRAW_tkn_RET :result:={ITM_GRP;//}itm_RET;
        eRAW_tkn_EXC :result:={ITM_GRP;//}itm_EXC;
        eRAW_tkn_VAL :result:=itm_VAL;
        else         result:=ITM_NDF;
    end;
end;


function in0k_hintDOC_coreITM_isGrpED(const eITM:tIn0k_hintDOC_core_eItm):boolean;
begin
    result:=eITM in [itm_PRM,itm_VAL];
end;

function in0k_hintDOC_coreITM_isGroUP(const eITM:tIn0k_hintDOC_core_eItm):boolean;
begin
    result:=eITM in [itm_RET,itm_EXC];
end;

function in0k_hintDOC_coreITM_isGroUPForVAL(const eITM:tIn0k_hintDOC_core_eItm):boolean;
begin
    result:=eITM in [itm_RET,itm_EXC];
end;


//   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -

function in0k_hintDOC_coreRAW_withDescription(const eRaw:tIn0k_hintDOC_core_eRAW):boolean;
begin
    result:=eRaw in cIn0k_hintDOC_core_eRAW_withDescription;
end;

function in0k_hintDOC_coreRAW_parseAsTitleNode(const eRaw:tIn0k_hintDOC_core_eRAW):boolean;
begin
    result:=eRaw in cIn0k_hintDOC_core_eRAW_parceAsTitleNote;
end;

//   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -

function in0k_hintDOC_coreITM_parseTopTEXT_sngl(const eRaw:tIn0k_hintDOC_core_eRAW):tIn0k_hintDOC_FTPM;
begin
    case eRaw of
    eRAW_LINE: result:=FTPM_0A;
    eRAW_tkn_VAL: result:=FTPM_DD;
    eRAW_tkn_PRM: result:=FTPM_DD;
    eRAW_tkn_RET: result:=FTPM_0A;
    eRAW_tkn_EXC: result:=FTPM_0A;
    eRAW_NDF    : result:=FTPM_0A;
    end;
end;

function in0k_hintDOC_coreITM_parseTopTEXT_spcl(const eRaw:tIn0k_hintDOC_core_eRAW; out selectSrvSMB:boolean):tIn0k_hintDOC_FTPM;
begin
    selectSrvSMB:=true;
    case eRaw of
    eRAW_LINE   : result:=FTPM_CA;
    eRAW_tkn_VAL: result:=FTPM_0A;
    eRAW_tkn_PRM: result:=FTPM_0A;
    eRAW_tkn_RET: result:=FTPM_0A;
    eRAW_tkn_EXC: result:=FTPM_0A;
    eRAW_NDF    : result:=FTPM_CA;
    end;
end;

//==============================================================================

function in0k_hintDOC_coreRAW_excludeLexeme(var listOfLexemes:string):string;
var i:longword;
begin
    result:='';
    if listOfLexemes<>'' then begin
        i:=pos(_cHDLXMD_,listOfLexemes);
        if i=1 then begin
            // вообще это КАСЯК, тупо просто исключаем обработку
            listOfLexemes:='';
        end
       else
        if i>1 then begin //< ого ... их несколько
            result:=copy(listOfLexemes,1,i-1);
            delete(listOfLexemes,1,i-1+_cHDLXMD_len);
        end
       else begin //< он тут ЕДИНСТВЕННЫЙ (последний)
            result:=listOfLexemes;
            listOfLexemes:='';
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

const
  ceIMPs_haveLexemes:set of tIn0k_hintDOC_core_eRAW=[];

procedure _ceIMPs_haveLexemes_INIT_;
var eImp:tIn0k_hintDOC_core_eRAW;
begin
    ceIMPs_haveLexemes:=[];
    for eImp:=low(tIn0k_hintDOC_core_eRAW) to high(tIn0k_hintDOC_core_eRAW) do
        if in0k_hintDOC_coreRAW_listOfLexemes(eImp)<>''
            then ceIMPs_haveLexemes:=ceIMPs_haveLexemes+[eImp];
end;

function in0k_hintDOC_coreRAW_haveLexemes(const eIMP:tIn0k_hintDOC_core_eRAW):boolean;
begin
    result:=eIMP in ceIMPs_haveLexemes;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function in0k_hintDOC_coreRAW_in_coreITM(const eRAW:tIn0k_hintDOC_core_eRAW; const eITM:tIn0k_hintDOC_core_eItm):boolean;
begin
    case eITM of
//    itm_raw: ;
//    Itm_SRV: ;
//    Itm_Text: ;
//    Itm_Title: ;
//    Itm_Name: ;
//    Itm_Note: ;
    ITM_ROOT: result:=eRAW in [eRAW_tkn_PRM,eRAW_tkn_RET,eRAW_tkn_EXC];


{      ;
    eITM_doc_START: ;
    eITM_doc_FINAL: ;
    ITM_HEAD: ;
    ITM_section: ;
    ITM_SCTN: ;
    ITM_token: ;
    ITM_content: ;

    ITM_PRG: ;
    ITM_GRP: ;}
    //itm_PRM,
    //itm_RET,
    //itm_EXC : result:=eRAW in [eRAW_tkn_VAL];
    eITM_NODE: result:=eRAW in [eRAW_tkn_VAL];
        else result:=false;
    end;


end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function in0k_hintDOC_coreRAW__Name(const eRaw:tIn0k_hintDOC_core_eRAW):string;
begin
    result:=GetEnumName(TypeInfo(tIn0k_hintDOC_core_eRAW), ord(eRaw));
end;

function in0k_hintDOC_coreITM__Name(const eItm:tIn0k_hintDOC_core_eItm):string;
begin
    result:=GetEnumName(TypeInfo(tIn0k_hintDOC_core_eItm), ord(eItm));
end;

//==============================================================================
{%region --- unitTests ------------------------------------------- /fold }

const
  _c_unitTest__t0='t0';
  _c_unitTest__t1='t1';
  _c_unitTest__t2='t2';

procedure unitTest__in0k_hintDOC_core_RAW;
var SRC:string;
    tmp:string;
    crt:string;
begin
    //--------
    src:='';
    tmp:=src;
    Assert(in0k_hintDOC_coreRAW_excludeLexeme(tmp)='','in0k_hintDOC_coreRAW_excludeLexeme FAIL fo value"'+SRC+'"');
    //--------
    src:=_c_unitTest__t0;
    tmp:=src;
    Assert(in0k_hintDOC_coreRAW_excludeLexeme(tmp)=_c_unitTest__t0,'in0k_hintDOC_coreRAW_excludeLexeme FAIL fo value"'+SRC+'"');
    //--------
    src:=_c_unitTest__t0+_cHDLXMD_;
    tmp:=src;
    crt:=in0k_hintDOC_coreRAW_excludeLexeme(tmp);
    Assert(crt=_c_unitTest__t0,'in0k_hintDOC_coreRAW_excludeLexeme: step 1: FAIL fo value"'+SRC+'"');
    Assert(tmp=''             ,'in0k_hintDOC_coreRAW_excludeLexeme: step 2: FAIL fo value"'+SRC+'"');
    //--------
    src:=_cHDLXMD_+_c_unitTest__t0;
    tmp:=src;
    crt:=in0k_hintDOC_coreRAW_excludeLexeme(tmp);
    Assert(crt=''             ,'in0k_hintDOC_coreRAW_excludeLexeme: step 1: FAIL fo value"'+SRC+'"');
    Assert(tmp=''             ,'in0k_hintDOC_coreRAW_excludeLexeme: step 2: FAIL fo value"'+SRC+'"');
    //--------
    src:=_c_unitTest__t0+_cHDLXMD_+_c_unitTest__t1;
    tmp:=src;
    crt:=in0k_hintDOC_coreRAW_excludeLexeme(tmp);
    Assert(crt=_c_unitTest__t0,'in0k_hintDOC_coreRAW_excludeLexeme: step 1: FAIL fo value"'+SRC+'"');
    Assert(tmp=_c_unitTest__t1,'in0k_hintDOC_coreRAW_excludeLexeme: step 1: FAIL fo value"'+SRC+'"');
    crt:=in0k_hintDOC_coreRAW_excludeLexeme(tmp);
    Assert(crt=_c_unitTest__t1,'in0k_hintDOC_coreRAW_excludeLexeme: step 2: FAIL fo value"'+SRC+'"');
    Assert(tmp=''             ,'in0k_hintDOC_coreRAW_excludeLexeme: step 2: FAIL fo value"'+SRC+'"');
end;

procedure unitTest__in0k_hintDOC_core__TEST01;
begin
    Assert(cIn0k_hintDOC_core_eRAW_parceAsTitleNote<=cIn0k_hintDOC_core_eRAW_withDescription,'wrong value cIn0k_hintDOC_core_eRAW_parceAsTitleNote mast by sudSet of cIn0k_hintDOC_core_eRAW_withDescription');
end;

{%endregion}
//==============================================================================

initialization
   _ceIMPs_haveLexemes_INIT_;
   unitTest__in0k_hintDOC_core__TEST01;
end.

