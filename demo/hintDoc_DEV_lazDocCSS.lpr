program hintDoc_DEV_lazDocCSS;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  inkLL_node,
  in0k_hintDOC_core_Finder,
  //---
  TSTs__in0k_hintDoc_Finder__enum_SPRTR_start,
  TSTs__in0k_hintDoc_Finder__Find_string_EXT, TSTs__in0k_hintDoc__tIn0k_hintDOC,
  TSTs__in0k_hintDoc_Finder__TextFindFirst_srvSMB,
  //---
  in0k_hintDOC_core_Object,
  in0k_hintDOC,
  //---
  FPCUnitTestRunner, GuiTestRunner, Forms, uiWnd_MAIN, uiWnd_parseTree,
  uiWnd_htmlResult, in0k_hintDOC_expM0_toHTML, in0k_hintDOC_export_Mode0, 
in0k_hintDOC_exp_IProHTML;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Twnd_MAIN, wnd_MAIN);
  Application.CreateForm(TGuiTestRunner, TestRunner);
  TestRunner.Show;
  Application.CreateForm(TWnd_htmlResult, Wnd_htmlResult);
  Application.Run;
end.

