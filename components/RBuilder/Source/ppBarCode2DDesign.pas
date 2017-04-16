unit ppBarCode2DDesign;

interface

uses
  Classes,
  Graphics,
  ppDesignControls, {contains DesignControlFactory used to register the checkbox design control}
  ppDesignControlsEx, {contains declaration of component design control ancestor}

  ppBarCode2D,
  ppBarCode2DDrawCmd;

type

  {@Tpp2DBarCodeControl}
  Tpp2DBarCodeControl = class(TppCustomComponentControl)
    protected
      procedure PaintDesignControl(aCanvas: TCanvas); override;
  end;


implementation

uses
  Types,

  ppPopupMenus,
  ppUtils,
  ppTypes;


{TppPDF417BarCodeControl }

{------------------------------------------------------------------------------}
{@Tpp2DBarCodeControl.PaintDesignControl}

procedure Tpp2DBarCodeControl.PaintDesignControl(aCanvas: TCanvas);
var
  lClientRect: TRect;
  lDrawCommand: TppDraw2DBarCode;
  lBorder: TppBorder;
begin

  lBorder := nil;
  lClientRect := Rect(0,0,0,0);

  GetPropValue('Border', lBorder);

  lDrawCommand := TppDraw2DBarCode.Create(nil);

  Tpp2DBarCode(Component).PropertiesToDrawCommand(lDrawCommand);

  if (lBorder <> nil) and (lBorder.Visible) then
    lClientRect := AdjustObject(lBorder, lClientRect, taLeftJustified);

  try
    lDrawCommand.DrawBarCode(aCanvas, lClientRect.Left, lClientRect.Top);

    {draw a framerect}
    PaintFrame(aCanvas);

  finally
    lDrawCommand.Free;

  end;

end; {procedure, PaintDesignControl}



end.
