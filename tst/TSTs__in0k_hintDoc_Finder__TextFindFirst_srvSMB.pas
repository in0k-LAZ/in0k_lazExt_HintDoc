unit TSTs__in0k_hintDoc_Finder__TextFindFirst_srvSMB;
(*$define testCase -- пометка для gitExtensions-Statickics что это ТЕСТs
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit, testregistry,
  in0k_hintDOC_core_Finder;

type

 tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB=class(TTestCase)
  protected
   _FND_:tIn0k_hintDOC_Finder;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  protected
    procedure _test_(const strBefo,strAfte:string);
    procedure _nTst_(const strBefo,strAfte:string); overload;
    procedure _nTst_(const strBefo_strAfte:string); overload;
  published
    procedure Test_001;
    procedure Test_002;
    procedure Test_003;
    procedure Test_004;
    procedure Test_005;
    procedure Test_006;
    procedure Test_007;
    procedure Test_008;
    procedure Test_009;
    procedure Test_010;
  published
    procedure Test_501;
    procedure Test_502;
    procedure Test_503;
    procedure Test_504;
    procedure Test_505;
    procedure Test_506;
    procedure Test_507;
    procedure Test_508;
    procedure Test_509;
    procedure Test_510;
  published
    procedure Test_601;
    procedure Test_602;
    procedure Test_603;
    procedure Test_604;
    procedure Test_605;
    procedure Test_606;
    procedure Test_607;
    procedure Test_608;
    procedure Test_609;
    procedure Test_610;
  published
    procedure Test_701;
    procedure Test_702;
    procedure Test_703;
    procedure Test_704;
    procedure Test_705;
    procedure Test_706;
    procedure Test_707;
    procedure Test_708;
    procedure Test_709;
    procedure Test_710;
  published
    procedure Test_801;
    procedure Test_802;
    procedure Test_803;
    procedure Test_804;
    procedure Test_805;
    procedure Test_806;
    procedure Test_807;
    procedure Test_808;
    procedure Test_809;
    procedure Test_810;
  published
    procedure Test_901;
    procedure Test_902;
    procedure Test_903;
    procedure Test_904;
    procedure Test_905;
    procedure Test_906;
    procedure Test_907;
    procedure Test_908;
    procedure Test_909;
    procedure Test_910;
  published
    procedure Test_t501;
    procedure Test_t502;
    procedure Test_t503;
    procedure Test_t504;
    procedure Test_t505;
    procedure Test_t506;
    procedure Test_t507;
    procedure Test_t508;
    procedure Test_t509;
    procedure Test_t510;
  published
    procedure Test_t601;
    procedure Test_t602;
    procedure Test_t603;
    procedure Test_t604;
    procedure Test_t605;
    procedure Test_t606;
    procedure Test_t607;
    procedure Test_t608;
    procedure Test_t609;
    procedure Test_t610;
  published
    procedure Test_t701;
    procedure Test_t702;
    procedure Test_t703;
    procedure Test_t704;
    procedure Test_t705;
    procedure Test_t706;
    procedure Test_t707;
    procedure Test_t708;
    procedure Test_t709;
    procedure Test_t710;
  published
    procedure Test_t801;
    procedure Test_t802;
    procedure Test_t803;
    procedure Test_t804;
    procedure Test_t805;
    procedure Test_t806;
    procedure Test_t807;
    procedure Test_t808;
    procedure Test_t809;
    procedure Test_t810;
  published
    procedure Test_t901;
    procedure Test_t902;
    procedure Test_t903;
    procedure Test_t904;
    procedure Test_t905;
    procedure Test_t906;
    procedure Test_t907;
    procedure Test_t908;
    procedure Test_t909;
    procedure Test_t910;
  end;

implementation

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.SetUp;
begin
   _FND_:=tIn0k_hintDOC_Finder.Create;
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.TearDown;
begin
   _FND_.Free;
end;

//------------------------------------------------------------------------------

const cTest_srvSMB_chr='@';
const cTest_srvSMB_len=length(cTest_srvSMB_chr);
const cLineEnding=LineEnding;
const clineProbel='        ';

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB._test_(const strBefo,strAfte:string);
var str:string;
    res:boolean;
    len:LongWord;
begin
    str:=strBefo+cTest_srvSMB_chr+strAfte;
   _FND_.SourceText:=str;
    res:=_FND_.Find_First_SMBs(len,cTest_srvSMB_chr);
    //---
    AssertTrue  (res);
    AssertEquals(len,length(strBefo)+cTest_srvSMB_len);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB._nTst_(const strBefo,strAfte:string);
var str:string;
    res:boolean;
    len:LongWord;
begin
    str:=strBefo+cTest_srvSMB_chr+strAfte;
   _FND_.SourceText:=str;
    res:=_FND_.Find_First_SMBs(len,cTest_srvSMB_chr);
    //---
    AssertFalse(res);
end;


procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB._nTst_(const strBefo_strAfte:string);
var str:string;
    res:boolean;
    len:LongWord;
begin
    str:=strBefo_strAfte;
   _FND_.SourceText:=str;
    res:=_FND_.Find_First_SMBs(len,cTest_srvSMB_chr);
    //---
    AssertFALSE(res);
end;


//------------------------------------------------------------------------------

const
  cTXT_test='test test test';
    //---
  cTXT_B01='';
  cTXT_B02=clineProbel;
  cTXT_B03=cLineEnding;
  cTXT_B04=clineProbel+cLineEnding;
  cTXT_B05=clineProbel+cLineEnding+clineProbel;
  cTXT_B06=clineProbel+cLineEnding+clineProbel+cLineEnding;
  cTXT_B07=cLineEnding;
  cTXT_B08=cLineEnding+clineProbel;
  cTXT_B09=cLineEnding+clineProbel+cLineEnding;
  cTXT_B10=cLineEnding+clineProbel+cLineEnding+clineProbel;
    //---
  cTXT_Bt01=cTXT_B01+cTXT_test;
  cTXT_Bt02=cTXT_B02+cTXT_test;
  cTXT_Bt03=cTXT_B03+cTXT_test;
  cTXT_Bt04=cTXT_B04+cTXT_test;
  cTXT_Bt05=cTXT_B05+cTXT_test;
  cTXT_Bt06=cTXT_B06+cTXT_test;
  cTXT_Bt07=cTXT_B07+cTXT_test;
  cTXT_Bt08=cTXT_B08+cTXT_test;
  cTXT_Bt09=cTXT_B09+cTXT_test;
  cTXT_Bt10=cTXT_B10+cTXT_test;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_001;
begin
   _nTst_(cTXT_B01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_002;
begin
   _nTst_(cTXT_B02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_003;
begin
   _nTst_(cTXT_B03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_004;
begin
   _nTst_(cTXT_B04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_005;
begin
   _nTst_(cTXT_B05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_006;
begin
   _nTst_(cTXT_B06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_007;
begin
   _nTst_(cTXT_B07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_008;
begin
   _nTst_(cTXT_B08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_009;
begin
   _nTst_(cTXT_B09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_010;
begin
   _nTst_(cTXT_B10);
end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_501;
begin
   _test_(cTXT_B01,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_502;
begin
   _test_(cTXT_B02,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_503;
begin
   _test_(cTXT_B03,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_504;
begin
   _test_(cTXT_B04,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_505;
begin
   _test_(cTXT_B05,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_506;
begin
   _test_(cTXT_B06,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_507;
begin
   _test_(cTXT_B07,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_508;
begin
   _test_(cTXT_B08,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_509;
begin
   _test_(cTXT_B09,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_510;
begin
   _test_(cTXT_B10,'');
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_601;
begin
   _test_('',cTXT_B01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_602;
begin
   _test_('',cTXT_B02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_603;
begin
   _test_('',cTXT_B03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_604;
begin
   _test_('',cTXT_B04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_605;
begin
   _test_('',cTXT_B05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_606;
begin
   _test_('',cTXT_B06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_607;
begin
   _test_('',cTXT_B07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_608;
begin
   _test_('',cTXT_B08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_609;
begin
   _test_('',cTXT_B09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_610;
begin
   _test_('',cTXT_B10);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_701;
begin
   _test_(cTXT_B01,cTXT_B01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_702;
begin
   _test_(cTXT_B02,cTXT_B02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_703;
begin
   _test_(cTXT_B03,cTXT_B03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_704;
begin
   _test_(cTXT_B04,cTXT_B04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_705;
begin
   _test_(cTXT_B05,cTXT_B05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_706;
begin
   _test_(cTXT_B06,cTXT_B06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_707;
begin
   _test_(cTXT_B07,cTXT_B07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_708;
begin
   _test_(cTXT_B08,cTXT_B08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_709;
begin
   _test_(cTXT_B09,cTXT_B09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_710;
begin
   _test_(cTXT_B10,cTXT_B10);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_801;
begin
   _test_(cTXT_B10,cTXT_B01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_802;
begin
   _test_(cTXT_B09,cTXT_B02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_803;
begin
   _test_(cTXT_B08,cTXT_B03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_804;
begin
   _test_(cTXT_B07,cTXT_B04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_805;
begin
   _test_(cTXT_B06,cTXT_B05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_806;
begin
   _test_(cTXT_B05,cTXT_B06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_807;
begin
   _test_(cTXT_B04,cTXT_B07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_808;
begin
   _test_(cTXT_B03,cTXT_B08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_809;
begin
   _test_(cTXT_B02,cTXT_B09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_810;
begin
   _test_(cTXT_B01,cTXT_B10);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_901;
begin
   _test_(cTXT_B01,cTXT_B10);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_902;
begin
   _test_(cTXT_B02,cTXT_B09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_903;
begin
   _test_(cTXT_B03,cTXT_B08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_904;
begin
   _test_(cTXT_B04,cTXT_B07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_905;
begin
   _test_(cTXT_B05,cTXT_B06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_906;
begin
   _test_(cTXT_B06,cTXT_B05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_907;
begin
   _test_(cTXT_B07,cTXT_B04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_908;
begin
   _test_(cTXT_B08,cTXT_B03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_909;
begin
   _test_(cTXT_B09,cTXT_B02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_910;
begin
   _test_(cTXT_B10,cTXT_B01);
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t501;
begin
   _nTst_(cTXT_Bt01,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t502;
begin
   _nTst_(cTXT_Bt02,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t503;
begin
   _nTst_(cTXT_Bt03,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t504;
begin
   _nTst_(cTXT_Bt04,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t505;
begin
   _nTst_(cTXT_Bt05,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t506;
begin
   _nTst_(cTXT_Bt06,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t507;
begin
   _nTst_(cTXT_Bt07,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t508;
begin
   _nTst_(cTXT_Bt08,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t509;
begin
   _nTst_(cTXT_Bt09,'');
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t510;
begin
   _nTst_(cTXT_Bt10,'');
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t601;
begin
   _test_('',cTXT_Bt01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t602;
begin
   _test_('',cTXT_Bt02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t603;
begin
   _test_('',cTXT_Bt03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t604;
begin
   _test_('',cTXT_Bt04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t605;
begin
   _test_('',cTXT_Bt05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t606;
begin
   _test_('',cTXT_Bt06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t607;
begin
   _test_('',cTXT_Bt07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t608;
begin
   _test_('',cTXT_Bt08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t609;
begin
   _test_('',cTXT_Bt09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t610;
begin
   _test_('',cTXT_Bt10);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t701;
begin
   _test_(cTXT_B01,cTXT_Bt01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t702;
begin
   _test_(cTXT_B02,cTXT_Bt02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t703;
begin
   _test_(cTXT_B03,cTXT_Bt03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t704;
begin
   _test_(cTXT_B04,cTXT_Bt04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t705;
begin
   _test_(cTXT_B05,cTXT_Bt05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t706;
begin
   _test_(cTXT_B06,cTXT_Bt06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t707;
begin
   _test_(cTXT_B07,cTXT_Bt07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t708;
begin
   _test_(cTXT_B08,cTXT_Bt08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t709;
begin
   _test_(cTXT_B09,cTXT_Bt09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t710;
begin
   _test_(cTXT_B10,cTXT_Bt10);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t801;
begin
   _test_(cTXT_B10,cTXT_Bt01);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t802;
begin
   _test_(cTXT_B09,cTXT_Bt02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t803;
begin
   _test_(cTXT_B08,cTXT_Bt03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t804;
begin
   _test_(cTXT_B07,cTXT_Bt04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t805;
begin
   _test_(cTXT_B06,cTXT_Bt05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t806;
begin
   _test_(cTXT_B05,cTXT_Bt06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t807;
begin
   _test_(cTXT_B04,cTXT_Bt07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t808;
begin
   _test_(cTXT_B03,cTXT_Bt08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t809;
begin
   _test_(cTXT_B02,cTXT_Bt09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t810;
begin
   _test_(cTXT_B01,cTXT_Bt10);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t901;
begin
   _test_(cTXT_B01,cTXT_Bt10);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t902;
begin
   _test_(cTXT_B02,cTXT_Bt09);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t903;
begin
   _test_(cTXT_B03,cTXT_Bt08);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t904;
begin
   _test_(cTXT_B04,cTXT_Bt07);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t905;
begin
   _test_(cTXT_B05,cTXT_Bt06);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t906;
begin
   _test_(cTXT_B06,cTXT_Bt05);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t907;
begin
   _test_(cTXT_B07,cTXT_Bt04);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t908;
begin
   _test_(cTXT_B08,cTXT_Bt03);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t909;
begin
   _test_(cTXT_B09,cTXT_Bt02);
end;

procedure tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB.Test_t910;
begin
   _test_(cTXT_B10,cTXT_Bt01);
end;

initialization
    RegisterTest('in0k_hintDoc.in0k_hintDoc_tLexer',tTST__in0k_hintDoc_tLexer__TextFindFirst_srvSMB);
end.

