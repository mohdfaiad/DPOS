{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2005                    BBBBB   }

unit ppPDFRendererShape;

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

  {@TppPDFRendererShape

    Creates the instructions to render a shape to the PDF File. }

  TppPDFRendererShape = class(TppPDFRenderer)
    private
      FDrawShape: TppDrawShape;
      
      procedure CreateEllipse;
      procedure CreateRectangle;
      procedure CreateRoundRect;
      
    protected
      procedure SetDrawCommand(const Value: TppDrawCommand); override;
    public
      class function DrawCommandClass: TppDrawCommandClass; override;
      procedure RenderToPDF; override;

  end;

implementation

uses
  Forms,
  Math,
  ppPDFUtils,
  ppPDFRendererManager;

{@TppPDFShape.CreateEllipse}

procedure TppPDFRendererShape.CreateEllipse;
var
  lsPenStyle: String;
  lsStrokeColor: String;
  lsFillColor: String;
  ldLeft: Double;
  ldTop: Double;
  ldWidth: Double;
  ldHeight: Double;
  ldCx: Double;
  ldCy: Double;
  ldXDistance: Double;
  ldYDistance: Double;
  ldXRadius: Double;
  ldYRadius: Double;
  ldBorderWidth: Double;
begin

  ldWidth := TppPDFUtils.MicronsToPoints(FDrawShape.Width);
  ldHeight := TppPDFUtils.MicronsToPoints(FDrawShape.Height);
  ldTop := TppPDFUtils.MicronsToPoints(FDrawShape.Top);
  ldLeft := TppPDFUtils.MicronsToPoints(FDrawShape.Left);

  {Radii}
  if(FDrawShape.ShapeType = stCircle) then
    begin
      ldXRadius := Min(ldWidth, ldHeight) / 2;
      ldYRadius := ldXRadius;
    end
  else
    begin
      ldXRadius := ldWidth / 2;
      ldYRadius := ldHeight / 2;
    end;

  {Bezier Direction point distance}
  ldXDistance := RoundTo(ldXRadius * 4 / 3 * Tan(Pi/8), -2);
  ldYDistance := RoundTo(ldYRadius * 4 / 3 * Tan(Pi/8), -2);

  {Shape Center}
  ldCx := ldLeft + (ldWidth / 2);
  ldCy := PageHeight - ldTop - (ldHeight / 2);

  {Color}
  if FDrawShape.Pen.Style = psClear then
    lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawShape.Brush.Color)
  else
    lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawShape.Pen.Color);
    
  lsFillColor := TppPDFUtils.ConvertRGB(FDrawShape.Brush.Color);

  {Set the Border Width}
  ldBorderWidth := TppPDFUtils.PixelsToPoints(FDrawShape.Pen.Width, Screen.PixelsPerInch);
  WriteLine(ExtToStr(ldBorderWidth) + ' w');

  {Pen Style}
  lsPenStyle := TppPDFUtils.PenStyle(FDrawShape.Pen.Style);
  WriteLine(lsPenStyle);

  {Set the Stroke Color}
  WriteLine(lsStrokeColor + ' RG');

  {Set the Fill Color}
  WriteLine(lsFillColor + ' rg');

  {Draw the ellipse}
  WriteLine(ExtToStr(ldCx) + ' ' + ExtToStr(ldCy - ldYRadius) + ' m');
  WriteLine(ExtToStr(ldCx + ldXDistance) + ' ' + ExtToStr(ldCy - ldYRadius) + ' ' + ExtToStr(ldCx + ldXRadius) + ' ' + ExtToStr(ldCy - ldYDistance) + ' ' + ExtToStr(ldCx + ldXRadius) + ' ' + ExtToStr(ldCy) + ' c');
  WriteLine(ExtToStr(ldCx + ldXRadius) + ' ' + ExtToStr(ldCy + ldYDistance) + ' ' + ExtToStr(ldCx + ldXDistance) + ' ' + ExtToStr(ldCy + ldYRadius) + ' ' + ExtToStr(ldCx) + ' ' + ExtToStr(ldCy + ldYRadius) + ' c');
  WriteLine(ExtToStr(ldCx - ldXDistance) + ' ' + ExtToStr(ldCy + ldYRadius) + ' ' + ExtToStr(ldCx - ldXRadius) + ' ' + ExtToStr(ldCy + ldYDistance) + ' ' + ExtToStr(ldCx - ldXRadius) + ' ' + ExtToStr(ldCy) + ' c');
  WriteLine(ExtToStr(ldCx - ldXRadius) + ' ' + ExtToStr(ldCy - ldYDistance) + ' ' + ExtToStr(ldCx - ldXDistance) + ' ' + ExtToStr(ldCy - ldYRadius) + ' ' + ExtToStr(ldCx) + ' ' + ExtToStr(ldCy - ldYRadius) + ' c');

  if FDrawShape.Brush.Style = bsClear then
    WriteLine('S')
  else
    WriteLine('B');

end;

{@TppPDFShape.CreateRectangle}

procedure TppPDFRendererShape.CreateRectangle;
var
  ldBorderWidth: Double;
  ldBottom: Double;
  ldLeft: Double;
  ldWidth: Double;
  ldHeight: Double;
  lsBottom: String;
  lsLeft: String;
  lsWidth: String;
  lsHeight: String;
  lsStrokeColor: String;
  lsFillColor: String;
  lsPenStyle: String;
begin

  {Position}
  ldBottom := PageHeight - TppPDFUtils.MicronsToPoints(FDrawShape.Top + FDrawShape.Height);
  ldLeft := TppPDFUtils.MicronsToPoints(FDrawShape.Left);
  lsBottom := ExtToStr(ldBottom);
  lsLeft := ExtToStr(ldLeft);

  {Dimentions}
  ldWidth := TppPDFUtils.MicronsToPoints(FDrawShape.Width);
  ldHeight := TppPDFUtils.MicronsToPoints(FDrawShape.Height);
  lsWidth := ExtToStr(ldWidth);
  lsHeight := ExtToStr(ldHeight);

  {Color and Border Width}
  if FDrawShape.Pen.Style = psClear then
    begin
      lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawShape.Brush.Color);
      ldBorderWidth := 0.0
    end
  else
    begin
      lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawShape.Pen.Color);
      ldBorderWidth := TppPDFUtils.PixelsToPoints(FDrawShape.Pen.Width, Screen.PixelsPerInch);
    end;

  lsFillColor := TppPDFUtils.ConvertRGB(FDrawShape.Brush.Color);

  WriteLine(ExtToStr(ldBorderWidth) + ' w');

  {Pen Style}
  lsPenStyle := TppPDFUtils.PenStyle(FDrawShape.Pen.Style);
  WriteLine(lsPenStyle);

  {Set the Stroke Color}
  WriteLine(lsStrokeColor + ' RG');

  {Set the Fill Color}
  WriteLine(lsFillColor + ' rg');

  {Draw the Rectangle}
  WriteLine(lsLeft + ' ' + lsBottom + ' ' + lsWidth + ' ' + lsHeight + ' re');

  if FDrawShape.Brush.Style = bsClear then
    WriteLine('S')
  else
    WriteLine('B');

end;

{@TppPDFShape.CreateRoundRect}

procedure TppPDFRendererShape.CreateRoundRect;
var
  ldBorderWidth: Double;
  ldBottom: Double;
  ldLeft: Double;
  ldWidth: Double;
  ldHeight: Double;
  ldCorner: Double;
  lsBottom: String;
  lsLeft: String;
  lsWidth: String;
  lsHeight: String;
  lsStrokeColor: String;
  lsFillColor: String;
  lsPenStyle: String;
begin

  {Position}
  ldBottom := PageHeight - TppPDFUtils.MicronsToPoints(FDrawShape.Top + FDrawShape.Height);
  ldLeft := TppPDFUtils.MicronsToPoints(FDrawShape.Left);
  lsBottom := ExtToStr(ldBottom);
  lsLeft := ExtToStr(ldLeft);

  {Dimentions}
  ldWidth := TppPDFUtils.MicronsToPoints(FDrawShape.Width);
  ldHeight := TppPDFUtils.MicronsToPoints(FDrawShape.Height);
  lsWidth := ExtToStr(ldWidth);
  lsHeight := ExtToStr(ldHeight);

  {Corner circle radius}
  ldCorner := (Min(ldWidth, ldHeight) / 4) / 2;

  {Color}
  if FDrawShape.Pen.Style = psClear then
    lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawShape.Brush.Color)
  else
    lsStrokeColor := TppPDFUtils.ConvertRGB(FDrawShape.Pen.Color);
    
  lsFillColor := TppPDFUtils.ConvertRGB(FDrawShape.Brush.Color);

  {Set the Border Width}
  ldBorderWidth := TppPDFUtils.PixelsToPoints(FDrawShape.Pen.Width, Screen.PixelsPerInch);
  WriteLine(ExtToStr(ldBorderWidth) + ' w');

  {Pen Style}
  lsPenStyle := TppPDFUtils.PenStyle(FDrawShape.Pen.Style);
  WriteLine(lsPenStyle);

  {Set the Stroke Color}
  WriteLine(lsStrokeColor + ' RG');

  {Set the Fill Color}
  WriteLine(lsFillColor + ' rg');

  {Draw the Round Rectangle}
  WriteLine(ExtToStr(ldLeft + ldCorner) + ' ' + ExtToStr(ldBottom) + ' m');
  WriteLine(ExtToStr(ldLeft + ldWidth - ldCorner) + ' ' + ExtToStr(ldBottom) + ' l');
  WriteLine(ExtToStr(ldLeft + ldWidth) + ' ' + ExtToStr(ldBottom) + ' ' + ExtToStr(ldLeft + ldWidth) + ' ' + ExtToStr(ldBottom + ldCorner) + ' v');
  WriteLine(ExtToStr(ldLeft + ldWidth) + ' ' + ExtToStr(ldBottom + ldHeight - ldCorner) + ' l');
  WriteLine(ExtToStr(ldLeft + ldWidth) + ' ' + ExtToStr(ldBottom + ldHeight) + ' ' + ExtToStr(ldLeft + ldWidth - ldCorner) + ' ' + ExtToStr(ldBottom + ldHeight) + ' v');
  WriteLine(ExtToStr(ldLeft + ldCorner) + ' ' + ExtToStr(ldBottom + ldHeight) + ' l');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom + ldHeight) + ' ' + ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom + ldHeight - ldCorner) + ' v');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom + ldCorner) + ' l');
  WriteLine(ExtToStr(ldLeft) + ' ' + ExtToStr(ldBottom) + ' ' + ExtToStr(ldLeft + ldCorner) + ' ' + ExtToStr(ldBottom) + ' v');

  if FDrawShape.Brush.Style = bsClear then
    WriteLine('S')
  else
    WriteLine('B');

end;

class function TppPDFRendererShape.DrawCommandClass: TppDrawCommandClass;
begin
  Result := TppDrawShape;
  
end;

{@TppPDFShape.RenderToPDF}

procedure TppPDFRendererShape.RenderToPDF;
begin
  inherited;

  if FDrawShape.ShapeType = stSquare then
    CreateRectangle

  else if FDrawShape.ShapeType = stRectangle then
    CreateRectangle

  else if FDrawShape.ShapeType = stRoundRect then
    CreateRoundRect

  else if FDrawShape.ShapeType = stRoundSquare then
    CreateRoundRect

  else if FDrawShape.ShapeType = stEllipse then
    CreateEllipse

  else if FDrawShape.ShapeType = stCircle then
    CreateEllipse

  else
    {No shape available}Beep;

end;

procedure TppPDFRendererShape.SetDrawCommand(const Value: TppDrawCommand);
begin
  FDrawShape := TppDrawShape(Value);

end;

initialization

  TppPDFRendererManager.RegisterRenderer(TppPDFRendererShape);

finalization

  TppPDFRendererManager.UnregisterRenderer(TppPDFRendererShape);

end.
