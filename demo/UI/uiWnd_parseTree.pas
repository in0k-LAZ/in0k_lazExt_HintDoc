unit uiWnd_parseTree;

{$mode objfpc}{$H+}

interface

uses  in0k_hintDOC, in0k_hintDOC_core_Token,
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

 { Twnd_parseTree }

 Twnd_parseTree = class(TForm)
    parseTree: TTreeView;
  private
   _tree_chrRoot:TTreeNode;
   _tree_rawRoot:TTreeNode;
   _tree_itmRoot:TTreeNode;
   _hdObj:tIn0k_hintDOC_Object;
  private
    function  _hdObj_text_RAW(const impNode:pointer):string;
    function  _hdObj_text_ITM(const itmNode:pointer):string;
  private
    procedure _tree_onChange  (Sender:TObject; Node:TTreeNode);
    function  _tree_node_isRAW(const Node:TTreeNode):boolean;
    function  _tree_node_isITM(const Node:TTreeNode):boolean;
  private //< заполнение дерева
    procedure _tree_beginUAPDATE_CLEAR;
    procedure _tree_Fill_chrNode (const prnt:TTreeNode; const raw:pointer);
    procedure _tree_Fill_chrNodes;
    procedure _tree_Fill_rawNode (const prnt:TTreeNode; const raw:pointer);
    procedure _tree_Fill_rawNodes;
    procedure _tree_Fill_itmNode (const prnt:TTreeNode; const itm:pointer);
    procedure _tree_Fill_itmNodes;
    procedure _tree_Fill;
    procedure _tree_endUAPDATE_setEVNT;
  private
    procedure _clcSlct_ForItem_RAW(var sPos,sLen:longWord; const nPos,nLen:longWord);
    procedure _clcSlct_ForItem_ITM(var sPos,sLen:longWord; const itm:pointer);
  private
    procedure _selectInMainWND    (const sPos,sLen:longWord);
    procedure _selectInMainWND_RAW(const raw:pointer);
    procedure _selectInMainWND_ITM(const itm:pointer);
  public
    procedure parseTree_CLEAR;
    procedure parseTree_SET(hd_Object:tIn0k_hintDOC_Object);
  end;

var wnd_parseTree: Twnd_parseTree;

procedure uiWnd_parseTree_SHOW;
procedure uiWnd_parseTree_Clear;
procedure uiWnd_parseTree_SET(hd_Object:tIn0k_hintDOC_Object);

implementation
uses uiWnd_MAIN;

procedure uiWnd_parseTree_SHOW;
begin
    if not Assigned(wnd_parseTree) then begin
        wnd_parseTree:=Twnd_parseTree.Create(Application);
    end;
    wnd_parseTree.Show;
    wnd_parseTree.BringToFront;
end;

procedure uiWnd_parseTree_Clear;
begin
    if Assigned(wnd_parseTree) then begin
        wnd_parseTree.parseTree_CLEAR;
    end;
end;

procedure uiWnd_parseTree_SET(hd_Object:tIn0k_hintDOC_Object);
begin
    if Assigned(wnd_parseTree) then begin
        wnd_parseTree.parseTree_SET(hd_Object);
    end;
end;

//==============================================================================

{$R *.lfm}

procedure Twnd_parseTree.parseTree_CLEAR;
begin
   _tree_beginUAPDATE_CLEAR;
   _hdObj:=nil;
   _tree_endUAPDATE_setEVNT;
end;

procedure Twnd_parseTree.parseTree_SET(hd_Object:tIn0k_hintDOC_Object);
begin
   _tree_beginUAPDATE_CLEAR;
   _hdObj:=hd_Object;
   _tree_Fill;
   _tree_endUAPDATE_setEVNT;
end;

//------------------------------------------------------------------------------

procedure Twnd_parseTree._clcSlct_ForItem_RAW(var sPos,sLen:longWord; const nPos,nLen:longWord);
var sFin,nFin:longWord;
begin
    if (sPos=0)and(sLen=0) then begin
        sPos:=nPos;
        sLen:=nLen;
    end
    else begin //< считаем ПОКРЫВАЮЩИЙ ода промежутка интервал
        sFin:=sPos+sLen;
        nFin:=nPos+nLen;
        if nPos<sPos then sPos:=nPos;
        if sFin<nFin then sFin:=nFin;
        sLen:=sFin-sPos;
    end;
end;

procedure Twnd_parseTree._clcSlct_ForItem_ITM(var sPos,sLen:longWord; const itm:pointer);
var tmp:pointer;
var nPos,nLen:longWord;
begin
    tmp:=_hdObj.ITM_chld[itm];
    if _hdObj.ITM_eItm[itm]=itm_raw then begin
        nPos:=_hdObj.RAW_Pos[tmp];
        nLen:=_hdObj.RAW_Len[tmp];
       _clcSlct_ForItem_RAW(sPos,sLen, nPos,nLen);
    end
    else begin
        while tmp<>nil do begin
           _clcSlct_ForItem_ITM(sPos,sLen, tmp);
            tmp:=_hdObj.ITM_next[tmp];
        end;
    end;
end;

//------------------------------------------------------------------------------

procedure Twnd_parseTree._selectInMainWND(const sPos,sLen:longWord);
begin
    wnd_MAIN.SRC_Select(sPos,sLen);
end;

procedure Twnd_parseTree._selectInMainWND_RAW(const raw:pointer);
begin
   _selectInMainWND(_hdObj.RAW_Pos[raw],_hdObj.RAW_Len[raw]);
end;

procedure Twnd_parseTree._selectInMainWND_ITM(const itm:pointer);
var sPos,sLen:longWord;
begin
    sPos:=0;
    sLen:=0;
   _clcSlct_ForItem_ITM(sPos,sLen,itm);
   _selectInMainWND(sPos,sLen);
end;

//------------------------------------------------------------------------------

function Twnd_parseTree._hdObj_text_RAW(const impNode:pointer):string;
begin
    result:='';
    result:=result+In0k_himtDOC_eRAW__NAME(_hdObj.RAW_eRaw[impNode]);
    result:=result+' ';
    result:=result+inttostr(_hdObj.RAW_Pos[impNode]);
    result:=result+'-';
    result:=result+inttostr(_hdObj.RAW_Len[impNode]);
end;

function Twnd_parseTree._hdObj_text_ITM(const itmNode:pointer):string;
begin
   result:=In0k_himtDOC_eITM__NAME(_hdObj.ITM_eItm[itmNode]);
   if _hdObj.ITM_eItm[itmNode]=ITM_raw then begin
       result:=result+' : ' +_hdObj_text_RAW(_hdObj.ITM_chld[itmNode])
   end;
end;

//------------------------------------------------------------------------------

{Узел является "указателем" на ПЕРВИЧНОЕ разделение
    ---
    просто лежит внутри узла _tree_rawRoot
}
function Twnd_parseTree._tree_node_isRAW(const Node:TTreeNode):boolean;
begin
    result:=false;
    if Assigned(Node) and Assigned(_tree_rawRoot) then begin
        result:=Node.Parent=_tree_rawRoot;
    end;
end;

{Узел является "элементом СТРУКТУРЫ" на документа
    ---
    просто лежит внутри узла _tree_itmRoot
}
function Twnd_parseTree._tree_node_isITM(const Node:TTreeNode):boolean;
var tmp:TTreeNode;
begin
    result:=false;
    if Assigned(Node) and Assigned(_tree_itmRoot) then begin
        tmp:=node.Parent;
        while (tmp<>nil) do begin
            if tmp<>_tree_itmRoot then tmp:=tmp.Parent
            else begin
                result:=true;
                break;
            end;
        end;
    end;
end;

procedure Twnd_parseTree._tree_onChange(Sender: TObject; Node: TTreeNode);
var tmp:pointer;
begin
    if node<>nil then begin
        tmp:=Node.Data;
        if Assigned(tmp) then begin
            if _tree_node_isRAW(node) then begin
               _selectInMainWND_RAW(tmp);
            end
            else
            if _tree_node_isITM(node) then begin
               _selectInMainWND_ITM(tmp);
            end;
        end;
    end;
end;

//------------------------------------------------------------------------------

procedure Twnd_parseTree._tree_beginUAPDATE_CLEAR;
begin
    parseTree.BeginUpdate;
    parseTree.OnChange:=nil;
    parseTree.Items.Clear;
   _tree_chrRoot:=nil;
   _tree_rawRoot:=nil;
end;

procedure Twnd_parseTree._tree_endUAPDATE_setEVNT;
begin
    parseTree.EndUpdate;
    parseTree.OnChange:=@_tree_onChange;
end;

//------------------------------------------------------------------------------

procedure Twnd_parseTree._tree_Fill_chrNode(const prnt:TTreeNode; const raw:pointer);
begin
    parseTree.Items.AddChildObject(prnt,'"'+_hdObj.LBL_CHRs[raw]+'"='+inttostr(_hdObj.LBL_CNT[raw]),tObject(raw));
end;

procedure Twnd_parseTree._tree_Fill_chrNodes;
var itm:pointer;
begin
    //---
    itm:=_hdObj.LBLs_First;
    if itm<>nil then begin
       _tree_chrRoot:=parseTree.Items.AddChildObject(nil,'LBLs',nil);
        while itm<>nil do begin
           _tree_Fill_chrNode(_tree_chrRoot,itm);
            itm:=_hdObj.LBL_next[itm];
        end;
    end;
end;

//------------------------------------------------------------------------------

procedure Twnd_parseTree._tree_Fill_rawNode(const prnt:TTreeNode; const raw:pointer);
begin
    parseTree.Items.AddChildObject(prnt,_hdObj_text_RAW(raw),tObject(raw));
end;

procedure Twnd_parseTree._tree_Fill_rawNodes;
var itm:pointer;
begin
    //---
    itm:=_hdObj.RAWs_First;
    if itm<>nil then begin
       _tree_rawRoot:=parseTree.Items.AddChildObject(nil,'RAWs',nil);
        while itm<>nil do begin
           _tree_Fill_rawNode(_tree_rawRoot,itm);
            itm:=_hdObj.RAW_next[itm];
        end;
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure Twnd_parseTree._tree_Fill_itmNode(const prnt:TTreeNode; const itm:pointer);
var tmpTree:TTreeNode;
    tmpNode:pointer;
begin
    tmpTree:=parseTree.Items.AddChildObject(prnt,_hdObj_text_ITM(itm),tObject(itm));
    if prnt=nil then _tree_itmRoot:=tmpTree;
    //---
    if not (_hdObj.ITM_eItm[itm] in [ITM_raw,ITM_NDF]) then begin
        tmpNode:=_hdObj.ITM_chld[itm];
        while tmpNode<>nil do begin
           _tree_Fill_itmNode(tmpTree,tmpNode);
            tmpNode:=_hdObj.ITM_next[tmpNode];
        end;
    end;
end;

procedure Twnd_parseTree._tree_Fill_itmNodes;
var tmpNode:pointer;
begin
    tmpNode:=_hdObj.ITMs_Root;
    while tmpNode<>nil do begin
       _tree_Fill_itmNode(nil,tmpNode);
        tmpNode:=_hdObj.ITM_next[tmpNode];
    end;
end;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

procedure Twnd_parseTree._tree_Fill;
begin
   _tree_Fill_chrNodes;
   _tree_Fill_rawNodes;
   _tree_Fill_itmNodes;
end;

end.

