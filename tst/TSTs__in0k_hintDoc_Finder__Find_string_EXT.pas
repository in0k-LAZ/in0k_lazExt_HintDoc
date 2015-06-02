unit TSTs__in0k_hintDoc_Finder__Find_string_EXT;
(*$define testCase -- пометка для gitExtensions-Statickics что это ТЕСТs
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit, testregistry, sysutils,
  in0k_hintDOC_core_Finder;

type

 tTST__in0k_hintDoc_tLexer__Find_string_EXT=class(TTestCase)
  protected
   _FND_:tIn0k_hintDOC_Finder;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  protected
    procedure _test_(const strTEST:string; const MSG:string);
    procedure _nTst_(const strTEST:string; const MSG:string);

  published
    procedure Test_notFind_Single_Line_X;
  published
    procedure Test_notFind_singlLine_5X5;
    procedure Test_notFind_singlLine_iXj;
    procedure Test_notFind_multyLine_iXj;
  published
    procedure Test_Find_Single_Line_0X;
    procedure Test_Find_Single_Line_1X;
    procedure Test_Find_Single_Line_2X;
    procedure Test_Find_Single_Line_3X;
    procedure Test_Find_Single_Line_4X;
    procedure Test_Find_Single_Line_5X;
  end;

implementation

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.SetUp;
begin
   _FND_:=tIn0k_hintDOC_Finder.Create;
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.TearDown;
begin
   _FND_.Free;
end;

//------------------------------------------------------------------------------

const cTest_strEXT_chr   ='<';
const cTest_befo_strEXT_1=' ';
const cTest_befo_strEXT_2='  ';
const cTest_befo_strEXT_3='   ';
const cTest_befo_strEXT_4='    ';
const cTest_befo_strEXT_5='     ';

const cTest_safetySTRING ='a sdf asdf asdf asd f';
//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT._test_(const strTEST:string; const MSG:string);
var str:string;
   fRes:boolean;
   fPOS:tIHDF_nmbr;
   fLEN:tIHDF_nmbr;
begin
   _FND_.SourceText:=strTEST;
    fRes:=_FND_.Find_string_EXT(fPOS,fLEN);
    //---
    AssertTrue  (MSG+' NOT found',fRes);
    str:=copy(strTEST,fPOS+1,fLEN);
    str:=trim(str);
    AssertEquals(MSG+' DIF found',str,cTest_strEXT_chr);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT._nTst_(const strTEST:string; const MSG:string);
var str:string;
   fRes:boolean;
   fPOS:tIHDF_nmbr;
   fLEN:tIHDF_nmbr;
begin
   _FND_.SourceText:=strTEST;
    fRes:=_FND_.Find_string_EXT(fPOS,fLEN);
    //---
    AssertFalse(MSG+' FOUND (fPOS="'+inttostr(fPOS)+'"; fLEN="'+inttostr(fLEN)+'")',fRes);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_notFind_Single_Line_X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING;
    g:='0x0';
   _nTst_(s,g);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_notFind_SinglLine_5X5;
var s:string;
    g:string;
begin
    s:=cTest_befo_strEXT_5+cTest_safetySTRING+cTest_befo_strEXT_5;
    g:='5x5';
   _nTst_(s,g);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_notFind_SinglLine_iXj;
var i,j:integer;
var s:string;
    g:string;
begin
    for i:=0 to 5 do begin
      for j:=0 to 5 do begin
        s:='';
        g:='';
        //---
        case i of
          1:s:=s+cTest_befo_strEXT_1;
          2:s:=s+cTest_befo_strEXT_2;
          3:s:=s+cTest_befo_strEXT_3;
          4:s:=s+cTest_befo_strEXT_4;
          5:s:=s+cTest_befo_strEXT_5;
        end;
        case i of
          0:g:=g+'0';
          1:g:=g+'1';
          2:g:=g+'2';
          3:g:=g+'3';
          4:g:=g+'4';
          5:g:=g+'5';
        end;
        //---
        s:=s+cTest_safetySTRING;
        g:=g+'x';
        //---
        case j of
          1:s:=s+cTest_befo_strEXT_1;
          2:s:=s+cTest_befo_strEXT_2;
          3:s:=s+cTest_befo_strEXT_3;
          4:s:=s+cTest_befo_strEXT_4;
          5:s:=s+cTest_befo_strEXT_5;
        end;
        case j of
          0:g:=g+'0';
          1:g:=g+'1';
          2:g:=g+'2';
          3:g:=g+'3';
          4:g:=g+'4';
          5:g:=g+'5';
        end;
      end;
    end;
   _nTst_(s,g);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_notFind_multyLine_iXj;
var i,j:integer;
var s:string;
    g:string;
begin
    for i:=0 to 5 do begin
      for j:=0 to 5 do begin
        s:='';
        g:='';
        //---
        case i of
          1:s:=s+LineEnding;
          2:s:=s+LineEnding+LineEnding;
          3:s:=s+LineEnding+LineEnding+LineEnding;
          4:s:=s+LineEnding+LineEnding+LineEnding+LineEnding;
          5:s:=s+LineEnding+LineEnding+LineEnding+LineEnding+LineEnding;
        end;
        case i of
          0:g:=g+'0';
          1:g:=g+'1';
          2:g:=g+'2';
          3:g:=g+'3';
          4:g:=g+'4';
          5:g:=g+'5';
        end;
        //---
        s:=s+cTest_safetySTRING;
        g:=g+'x';
        //---
        case j of
          1:s:=s+LineEnding;
          2:s:=s+LineEnding+LineEnding;
          3:s:=s+LineEnding+LineEnding+LineEnding;
          4:s:=s+LineEnding+LineEnding+LineEnding+LineEnding;
          5:s:=s+LineEnding+LineEnding+LineEnding+LineEnding+LineEnding;
        end;
        case j of
          0:g:=g+'0';
          1:g:=g+'1';
          2:g:=g+'2';
          3:g:=g+'3';
          4:g:=g+'4';
          5:g:=g+'5';
        end;
      end;
    end;
   _nTst_(s,g);
end;

//------------------------------------------------------------------------------

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_Find_Single_Line_0X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING+cTest_strEXT_chr;
    g:='';
   _nTst_(s,g);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_Find_Single_Line_1X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING+cTest_befo_strEXT_1+cTest_strEXT_chr;
    g:='';
   _nTst_(s,g);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_Find_Single_Line_2X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING+cTest_befo_strEXT_2+cTest_strEXT_chr;
    g:='';
   _test_(s,g);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_Find_Single_Line_3X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING+cTest_befo_strEXT_3+cTest_strEXT_chr;
    g:='';
   _test_(s,g);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_Find_Single_Line_4X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING+cTest_befo_strEXT_4+cTest_strEXT_chr;
    g:='';
   _test_(s,g);
end;

procedure tTST__in0k_hintDoc_tLexer__Find_string_EXT.Test_Find_Single_Line_5X;
var s:string;
    g:string;
begin
    s:=cTest_safetySTRING+cTest_befo_strEXT_5+cTest_strEXT_chr;
    g:='';
   _test_(s,g);
end;

initialization
    RegisterTest('in0k_hintDoc.in0k_hintDoc_tLexer',tTST__in0k_hintDoc_tLexer__Find_string_EXT);
end.

