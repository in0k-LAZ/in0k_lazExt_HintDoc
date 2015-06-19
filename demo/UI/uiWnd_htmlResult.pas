unit uiWnd_htmlResult;

{$mode objfpc}{$H+}

interface

uses  //IPIDEHTMLControl,
  Classes, SysUtils, FileUtil, IpHtml, Ipfilebroker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, LConvEncoding, IpMsg;

type

 { TMyIpHtmlDataProvider }

 TMyIpHtmlDataProvider = class(TIpHtmlDataProvider)
 protected
   function DoGetStream(const URL: string): TStream; override;
 public

 end;


 { TWnd_htmlResult }

 TWnd_htmlResult = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    function DataProvider1CanHandle(Sender: TObject; const URL: string
      ): Boolean;
    procedure DataProvider1CheckURL(Sender: TObject; const URL: string;
      var Available: Boolean; var ContentType: string);
    procedure DataProvider1GetHtml(Sender: TObject; const URL: string;
      const PostData: TIpFormDataEntity; var Stream: TStream);
    procedure DataProvider1GetImage(Sender: TIpHtmlNode; const URL: string;
      var Picture: TPicture);
    procedure DataProvider1Leave(Sender: TIpHtml);
    procedure DataProvider1ReportReference(Sender: TObject; const URL: string);
  public
    IpHtmlPanel1: TIpHtmlPanel;
    DataProvider1: TMyIpHtmlDataProvider;
  private
    procedure ShowHTML(Src: string);
  end;

var Wnd_htmlResult: TWnd_htmlResult;

procedure uiWnd_htmlResult_SHOW;
procedure uiWnd_htmlResult_SET(const Text:string);

implementation

//

function TWnd_htmlResult.DataProvider1CanHandle(Sender: TObject; const URL: string
  ): Boolean;
begin
  //debugln(['TWnd_htmlResult.DataProvider1CanHandle ',URL]);
  Result:=false;
end;

procedure TWnd_htmlResult.DataProvider1CheckURL(Sender: TObject; const URL: string;
  var Available: Boolean; var ContentType: string);
begin
  //debugln(['TWnd_htmlResult.DataProvider1CheckURL ',URL]);
  Available:=false;
  ContentType:='';
end;

procedure TWnd_htmlResult.DataProvider1GetHtml(Sender: TObject; const URL: string;
  const PostData: TIpFormDataEntity; var Stream: TStream);
begin
  //debugln(['TWnd_htmlResult.DataProvider1GetHtml ',URL]);
  Stream:=nil;
end;

procedure TWnd_htmlResult.DataProvider1GetImage(Sender: TIpHtmlNode; const URL: string;
  var Picture: TPicture);
begin
  //debugln(['TWnd_htmlResult.DataProvider1GetImage ',URL]);
  Picture:=nil;
end;

procedure TWnd_htmlResult.DataProvider1Leave(Sender: TIpHtml);
begin
   //
end;

procedure TWnd_htmlResult.DataProvider1ReportReference(Sender: TObject; const URL: string
  );
begin
  //debugln(['TWnd_htmlResult.DataProvider1ReportReference ',URL]);
end;

//


function TMyIpHtmlDataProvider.DoGetStream(const URL: string): TStream;
  var
    ms: TMemoryStream;
  begin
    Result:=nil;
    //debugln(['TMyIpHtmlDataProvider.DoGetStream ',URL]);

    if URL='lazdoc.css' then begin
      //debugln(['TMyIpHtmlDataProvider.DoGetStream ',FileExists(URL)]);
      ms:=TMemoryStream.Create;
      try
        ms.LoadFromFile('C:\DeVeLoP\lazarus32\docs\lazdoc.css');
        ms.Position:=0;
      except
        ms.Free;
      end;
      Result:=ms;
    end;
  end;


procedure uiWnd_htmlResult_SHOW;
begin
    if not Assigned(Wnd_htmlResult) then begin
        Wnd_htmlResult:=TWnd_htmlResult.Create(Application);
    end;
    Wnd_htmlResult.Show;
    Wnd_htmlResult.BringToFront;
end;

procedure uiWnd_htmlResult_SET(const Text:string);
var asdf:tStrings;
    s:string;
begin
   { s:='<html><head><link rel="stylesheet" href="lazdoc.css" type="text/css">'+LineEnding
      +'<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>'+LineEnding
      +'<body>'+LineEnding+Text+LineEnding+'</body>';     }

    s:=text;
    //---
    if Assigned(Wnd_htmlResult) then begin



        Wnd_htmlResult.ShowHTML(UTF8ToUTF8BOM({AnsiToUtf8}(S)));
    end;
    //---
    //Wnd_htmlResult.IpFileDataProvider1.o;
    //---
    asdf:=TStringList.Create;
    asdf.Text:=UTF8ToUTF8BOM({AnsiToUtf8}(S));
    asdf.SaveToFile('tst.html');
    asdf.free;
end;

{$R *.lfm}

{ TWnd_htmlResult }

procedure TWnd_htmlResult.FormCreate(Sender: TObject);
begin
  DataProvider1:=TMyIpHtmlDataProvider.Create(Self);
  with DataProvider1 do begin
    Name:='DataProvider1';
    OnCanHandle:=@DataProvider1CanHandle;
    OnGetHtml:=@DataProvider1GetHtml;
    OnGetImage:=@DataProvider1GetImage;
    OnLeave:=@DataProvider1Leave;
    OnCheckURL:=@DataProvider1CheckURL;
    OnReportReference:=@DataProvider1ReportReference;
  end;
  IpHtmlPanel1:=TIpHtmlPanel.Create(Self);
  with IpHtmlPanel1 do begin
    Name:='IpHtmlPanel1';
    Parent:=Self;
    Align:=alClient;
    DefaultFontSize:=10;
    DataProvider:=DataProvider1;
  end;
  IpHtmlPanel1.SetHtmlFromStr('<html><body>sadf asdf asdf</body></html>');

end;

procedure TWnd_htmlResult.Button1Click(Sender: TObject);
begin
    if Assigned(IpHtmlPanel1) then begin
       // IpHtmlPanel1.TextColor:=;
    end;
end;

procedure TWnd_htmlResult.ShowHTML(Src: string);
var
  ss: TStringStream;
  NewHTML: TIpHtml;
begin
  ss := TStringStream.Create(Src);
  memo1.Text:=SRC;
  try
    NewHTML := TIpHtml.Create; // Beware: Will be freed automatically by IpHtmlPanel1
    //debugln(['TForm1.ShowHTML BEFORE SETHTML']);
    IpHtmlPanel1.SetHtml(NewHTML);
    //debugln(['TForm1.ShowHTML BEFORE LOADFROMSTREAM']);
    NewHTML.LoadFromStream(ss);
    //if Anchor <> '' then IpHtmlPanel1.MakeAnchorVisible(Anchor);
  finally
    ss.Free;
  end;
end;


end.

