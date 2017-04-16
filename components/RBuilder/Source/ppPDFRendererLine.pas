{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRendererLine;

interface

uses
  Classes,
  Graphics,
  SysUtils,
  ExtCtrls,
  ppDevice,
  ppDrwCmd,
  ppPDFRenderer;

type

  {@TppPDFLineRenderer

    Creates the instructions to render a line of specified style and width to the
    PDF File. }

  TppPDFRendererLine = class(TppPDFRenderer)
    private
      FDrawLine: TppDrawLine;

    protected
      procedure SetDrawCommand(const Value: TppDrawCommand); override;
    public
      class function DrawCommandClass: TppDrawCommandClass; override;
      procedure RenderToPDF; override;

  end;

implementation

uses
  Math,
  ppTypes,
  ppPDFUtils,
  ppPDFRendererManager;

class function TppPDFRendererLine.DrawCommandClass: TppDrawCommandClass;
begin
  Result := TppDrawLine;

end;

{TppPDFLine.RenderToPDF

  Creates the PDF instructions to draw a line/double line to a page.  Calculates
  the line width as well as the pen style (dashed or dotted line). }

procedure TppPDFRendererLine.RenderToPDF;
var
  lsStrokeColor: string;
  lsPenStyle: string;
  ldBottom: Double;
  ldLeft: Double;
  ldTop: Double;
  ldRight: Double;
  ldWidth: Double;
  ldHeight: Double;
  ldOffset: Double;
begin

  {Dimentions}
  ldWidth := TppPDFUtils.MicronsToPoints(FDrawLine.Width);
  ldHeight := TppPDFUtils.MicronsToPoints(FDrawLine.Height);

  {Position}
  ldBottom := PageHeight - TppPDFUtils.MicronsToPoints(FDrawLine.Top + FDrawLine.Height);
  ldLeft := TppPDFUtils.MicronsToPoints(FDrawLine.Left);
  ldTop := ldBottom + ldHeight;
  ldRight := ldLeft + ldWidth;

  {Weight Offset}
  ldOffset := FDrawLine.Weight / 2;

  {Color}
  lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawLine.Pen.Color);

  {Line Width}
  WriteLine(ExtToStr(FDrawLine.Weight) + ' w');

  {Pen Style}
  lsPenStyle := TppPDFUtils.PenStyle(FDrawLine.Pen.Style);
  WriteLine(lsPenStyle);

  {Set Line Color}
  WriteLine(lsStrokeColor + ' RG');

  {Draw Line}
  case FDrawLine.LinePosition of
    lpTop:
      begin
        Writeline(ExtToStr(ldLeft) + ' ' + ExtToStr(ldTop - ldOffset) + ' m');
        WriteLine(ExtToStr(ldRight) + ' ' + ExtToStr(ldTop - ldOffset) + ' l');
      end;
    lpBottom:
      begin
        Writeline(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom + ldOffset) + ' m');
        Writeline(ExtToStr(ldRight) + ' ' + ExtToStr(ldBottom + ldOffset) + ' l');
      end;
    lpLeft:
      begin
        Writeline(ExtToStr(ldLeft + ldOffset) + ' ' + ExtToStr(ldBottom) + ' m');
        WriteLine(ExtToStr(ldLeft + ldOffset) + ' ' + ExtToStr(ldTop) + ' l');
      end;
    lpRight:
      begin
        Writeline(ExtToStr(ldRight - ldOffset) + ' ' + ExtToStr(ldBottom) + ' m');
        Writeline(ExtToStr(ldRight - ldOffset) + ' ' + ExtToStr(ldTop) + ' l');
      end;
  end;

  {Draw Double Line (if needed)}
  if FDrawLine.LineStyle = lsDouble then
    begin
      case FDrawLine.LinePosition of
        lpTop:
          begin
            Writeline(ExtToStr(ldLeft) + ' ' + ExtToStr(ldTop - FDrawLine.Weight * 2 - ldOffset) + ' m');
            Writeline(ExtToStr(ldRight) + ' ' + ExtToStr(ldTop - FDrawLine.Weight * 2 - ldOffset) + ' l');
          end;
        lpBottom:
          begin
            Writeline(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom + FDrawLine.Weight * 2 + ldOffset) + ' m');
            Writeline(ExtToStr(ldRight) + ' ' + ExtToStr(ldBottom + FDrawLine.Weight * 2 + ldOffset) + ' l');
          end;
        lpLeft:
          begin
            Writeline(ExtToStr(ldLeft + FDrawLine.Weight * 2 + ldOffset) + ' ' + ExtToStr(ldBottom) + ' m');
            Writeline(ExtToStr(ldLeft + FDrawLine.Weight * 2 + ldOffset) + ' ' + ExtToStr(ldTop) + ' l');
          end;
        lpRight:
          begin
            Writeline(ExtToStr(ldRight - FDrawLine.Weight * 2 - ldOffset) + ' ' + ExtToStr(ldBottom) + ' m');
            Writeline(ExtToStr(ldRight - FDrawLine.Weight * 2 - ldOffset) + ' ' + ExtToStr(ldTop) + ' l');
          end;

      end;

    end;

  Writeline('S');

end;

procedure TppPDFRendererLine.SetDrawCommand(const Value: TppDrawCommand);
begin
  FDrawLine := TppDrawLine(Value);

end;

initialization

  TppPDFRendererManager.RegisterRenderer(TppPDFRendererLine);

finalization

  TppPDFRendererManager.UnregisterRenderer(TppPDFRendererLine);

end.
