{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit in0k_lazExt_HintDOC_pkg;

interface

uses
  in0k_lazExt_HintDOC_reg, in0k_lazExt_HintDOC, 
  in0k_lazExt_hintDOC_exp_IProHTML, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('in0k_lazExt_HintDOC_reg', @in0k_lazExt_HintDOC_reg.Register);
end;

initialization
  RegisterPackage('in0k_lazExt_HintDOC_pkg', @Register);
end.
