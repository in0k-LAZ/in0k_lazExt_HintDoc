unit TSTs__in0k_hintDoc_token;
(*$define testCase -- пометка для gitExtensions-Statickics что это ТЕСТs
  [Test
*)
{$mode objfpc}{$H+}
interface

uses fpcunit, testregistry;

type

 tTST__in0k_hintDoc_token=class(TTestCase)
  published
    procedure TEST;
  end;

implementation
uses in0k_hintDOC_core_Token;

procedure tTST__in0k_hintDoc_token.TEST;
begin
    in0k_hintDOC_core_Token.unitTest__in0k_hintDOC_core_RAW;
end;

initialization
    RegisterTest('in0k_hintDoc.in0k_hintDoc_token',tTST__in0k_hintDoc_token);
end.

