unit TSTs__in0k_hintDoc__tIn0k_hintDOC;
(*$define testCase -- пометка для gitExtensions-Statickics что это ТЕСТs
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit, testregistry,
     in0k_hintDOC;

type

 tTST__tIn0k_hintDOC__FIRE=class(TTestCase)
  published
    procedure TEST_00;
    procedure TEST_01;
  end;

 tTST__tIn0k_hintDOC__flagPARCED=class(TTestCase)
  protected
    in0k_hintDOC:tIn0k_hintDOC_Object;
  protected
    procedure SetUp;    override;
    procedure TearDown; override;
  published
    procedure SourceText;
    procedure TokenChars;
    procedure TokenStart;
    procedure TokenFinal;
    procedure TokenStartMustBe;
    procedure TokenFinalMustBe;
  end;

implementation
uses in0k_hintDOC_core_Object;

procedure tTST__tIn0k_hintDOC__FIRE.TEST_00;
var in0k_hintDOC:tIn0k_hintDOC_Object;
begin
    in0k_hintDOC:=tIn0k_hintDOC_Object.Create('asd asd as');
    AssertTrue(in0k_hintDOC<>nil);
    in0k_hintDOC.FREE;
end;

procedure tTST__tIn0k_hintDOC__FIRE.TEST_01;
var in0k_hintDOC:tIn0k_hintDOC_Object;
begin
    in0k_hintDOC:=tIn0k_hintDOC_Object.Create;
    AssertTrue(in0k_hintDOC<>nil);
    in0k_hintDOC.FREE;
end;

//------------------------------------------------------------------------------

procedure tTST__tIn0k_hintDOC__flagPARCED.SetUp;
begin
    in0k_hintDOC:=tIn0k_hintDOC_Object.Create;
    unitTest__tin0k_hintDOC__setPARSED(in0k_hintDOC);
end;

procedure tTST__tIn0k_hintDOC__flagPARCED.TearDown;
begin
    in0k_hintDOC.Free;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

const cTSTTXT='asd';

procedure tTST__tIn0k_hintDOC__flagPARCED.SourceText;
begin
    AssertTrue ('0. not ready fo test',in0k_hintDOC.PARSED);
    in0k_hintDOC.SourceText:='';
    in0k_hintDOC.SourceText:=cTSTTXT;
    AssertFalse('1.',in0k_hintDOC.PARSED);
    AssertNull ('2.',in0k_hintDOC.RAWs_First);
    AssertNull ('3.',in0k_hintDOC.ITMs_Root);
end;

procedure tTST__tIn0k_hintDOC__flagPARCED.TokenChars;
begin
    AssertTrue ('0. not ready fo test',in0k_hintDOC.PARSED);
    in0k_hintDOC.TokenLabel:='';
    in0k_hintDOC.TokenLabel:=cTSTTXT;
    AssertFalse('1.',in0k_hintDOC.PARSED);
    AssertNull ('2.',in0k_hintDOC.RAWs_First);
    AssertNull ('3.',in0k_hintDOC.ITMs_Root);
end;

procedure tTST__tIn0k_hintDOC__flagPARCED.TokenStart;
begin
    AssertTrue ('0. not ready fo test',in0k_hintDOC.PARSED);
    in0k_hintDOC.TokenStart:='';
    in0k_hintDOC.TokenStart:=cTSTTXT;
    AssertFalse('1.',in0k_hintDOC.PARSED);
    AssertNull ('2.',in0k_hintDOC.RAWs_First);
    AssertNull ('3.',in0k_hintDOC.ITMs_Root);
end;

procedure tTST__tIn0k_hintDOC__flagPARCED.TokenFinal;
begin
    AssertTrue ('0. not ready fo test',in0k_hintDOC.PARSED);
    in0k_hintDOC.TokenFinal:='';
    in0k_hintDOC.TokenFinal:=cTSTTXT;
    AssertFalse('1.',in0k_hintDOC.PARSED);
    AssertNull ('2.',in0k_hintDOC.RAWs_First);
    AssertNull ('3.',in0k_hintDOC.ITMs_Root);
end;

procedure tTST__tIn0k_hintDOC__flagPARCED.TokenStartMustBe;
begin
    AssertTrue ('0. not ready fo test',in0k_hintDOC.PARSED);
    in0k_hintDOC.TokenStartMustBe:=true;
    in0k_hintDOC.TokenStartMustBe:=false;
    AssertFalse('1.',in0k_hintDOC.PARSED);
    AssertNull ('2.',in0k_hintDOC.RAWs_First);
    AssertNull ('3.',in0k_hintDOC.ITMs_Root);
end;

procedure tTST__tIn0k_hintDOC__flagPARCED.TokenFinalMustBe;
begin
    AssertTrue ('0. not ready fo test',in0k_hintDOC.PARSED);
    in0k_hintDOC.TokenFinalMustBe:=true;
    in0k_hintDOC.TokenFinalMustBe:=false;
    AssertFalse('1.',in0k_hintDOC.PARSED);
    AssertNull ('2.',in0k_hintDOC.RAWs_First);
    AssertNull ('3.',in0k_hintDOC.ITMs_Root);
end;

initialization
    RegisterTest('in0k_hintDoc.tIn0k_hintDOC_Object',tTST__tIn0k_hintDOC__FIRE);
    RegisterTest('in0k_hintDoc.tIn0k_hintDOC_Object',tTST__tIn0k_hintDOC__flagPARCED);
end.

