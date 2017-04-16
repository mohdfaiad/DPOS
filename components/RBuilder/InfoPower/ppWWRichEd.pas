{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 1999 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppWWRichEd;

interface

  { InfoPower RichEdit support.

    This unit defines a TwwDBRichEdit descendant and then registers the class
    with ReportBuilder. This enables the TppRichText and TppDBRichText controls
    in ReportBuilder to use the formatting capabilities of TwwDBRichEidt when
    rendering data.

    Add this unit to the 'uses' clauses of the main form of your application to
    use it a runtime.

    Install the rbIP66.bpl package into the Delphi IDE to use this unit at
    Delphi designt-time.

    }


uses
  Windows, Controls, Messages, RichEdit,
  ppRichTxDrwCmd, wwRichEd;

type

  {TppWWRichEdit }
  TppWWRichEdit = class(TwwDBRichEdit)
    private
      procedure EMFormatRange(var msg:TMessage); message EM_FORMATRANGE;
      
    protected
      procedure CreateParams(var Params: TCreateParams); override;

  end; {class, TppWWRichEdit}


implementation

{------------------------------------------------------------------------------}
{ TppWWRichEdit.CreateParams }

procedure TppWWRichEdit.CreateParams(var Params: TCreateParams);
begin

  inherited CreateParams(Params);

  {remove ws-child so that no parent window is required}
  if (Parent = nil) then
    Params.Style := Params.Style and not(WS_CHILD);

end; {procedure, CreateParams}

{------------------------------------------------------------------------------}
{ TppWWRichEdit.EMFormatRange }

procedure TppWWRichEdit.EMFormatRange(var msg:TMessage);
begin
  {must bypass the EMFormatRange of the ancestor, TwwCustomRichEdit,
   because it modifies the target rectangle}
  DefaultHandler(Msg);

end; {procedure, EMFormatRange }

initialization
  ppRegisterRichEditClass(TppWWRichEdit);

finalization
  ppRegisterRichEditClass(nil);
  
end.
