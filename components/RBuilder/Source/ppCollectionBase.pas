unit ppCollectionBase;

interface

uses
  Classes,
  Contnrs;

type

  {TppCollectionBase}
  TppCollectionBase = class
    private
      FInnerList: TObjectList;

      function GetCount: Integer;

    protected
      property InnerList: TObjectList read FInnerList;

    public
      constructor Create; virtual;
      destructor Destroy; override;

      procedure Clear; virtual;
      property Count: Integer read GetCount;

    end;

  {TppInterfaceCollectionBase}
  TppInterfaceCollectionBase = class
    private
      FInnerList: TInterfaceList;

      function GetCount: Integer;

    protected
      property InnerList: TInterfaceList read FInnerList;

    public
      constructor Create; virtual;
      destructor Destroy; override;

      procedure Clear; virtual;
      property Count: Integer read GetCount;

    end;

  {TppComponentCollectionBase}
  TppComponentCollectionBase = class
    private
      FInnerList: TComponentList;

      function GetCount: Integer;

    protected
      property InnerList: TComponentList read FInnerList;

    public
      constructor Create; virtual;
      destructor Destroy; override;
      procedure Clear; virtual;
      property Count: Integer read GetCount;

    end;


{
  TppCollectionPattern = class(TppCollectionBase)

  private
    function GetItemForIndex(aIndex: Integer): TmyClassType;
    function GetItemForName(aName: String): TmyClassType;

  public
    function IndexOf(aObject: TmyClassType): Integer;
    procedure Add(aObject: TmyClassType);
    procedure Remove(aObject: TmyClassType);

    property ItemsByNames[Name: Strign]: TmyClassType read GetItemForName; default;
    property Items[Index: Integer]: TmyClassType read GetItemForIndex; default;

  end;

}

implementation

{*******************************************************************************
 *
 ** C O L L E C T I O N   B A S E
 *
 *******************************************************************************}


{------------------------------------------------------------------------------}
{ TppCollectionBase.Create }

constructor TppCollectionBase.Create;
begin
  inherited;
  
  FInnerList := TObjectList.Create;
  FInnerList.OwnsObjects := False;
end;

{------------------------------------------------------------------------------}
{ TppCollectionBase.Destroy }

destructor TppCollectionBase.Destroy;
begin

  FInnerList.Free;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppCollectionBase.Clear }

procedure TppCollectionBase.Clear;
begin
  FInnerList.Clear;
end;

{------------------------------------------------------------------------------}
{ TppCollectionBase.GetCount }

function TppCollectionBase.GetCount: Integer;
begin
  Result := FInnerList.Count;

end;

{*******************************************************************************
 *
 ** I N T E R F A C E   C O L L E C T I O N   B A S E
 *
 *******************************************************************************}

procedure TppInterfaceCollectionBase.Clear;
begin
  FInnerList.Clear;

end;

constructor TppInterfaceCollectionBase.Create;
begin

  inherited Create;

  FInnerList := TInterfaceList.Create;


end;

destructor TppInterfaceCollectionBase.Destroy;
begin

  FInnerList.Free;

  inherited;
end;

function TppInterfaceCollectionBase.GetCount: Integer;
begin
  Result := FInnerList.Count;

end;

{*******************************************************************************
 *
 ** C O M P O N E N T  C O L L E C T I O N   B A S E
 *
 *******************************************************************************}

{------------------------------------------------------------------------------}
{ TppComponentCollectionBase.Create }

constructor TppComponentCollectionBase.Create;
begin
  FInnerList := TComponentList.Create;
  FInnerList.OwnsObjects := False;
end;

{------------------------------------------------------------------------------}
{ TppComponentCollectionBase.Destroy }

destructor TppComponentCollectionBase.Destroy;
begin

  FInnerList.Free;

  inherited;

end;

{------------------------------------------------------------------------------}
{ TppCollecTppComponentCollectionBasetionBase.Clear }

procedure TppComponentCollectionBase.Clear;
begin
  FInnerList.Clear;
end;

{------------------------------------------------------------------------------}
{ TppComponentCollectionBase.GetCount }

function TppComponentCollectionBase.GetCount: Integer;
begin
  Result := FInnerList.Count;

end;


end.
