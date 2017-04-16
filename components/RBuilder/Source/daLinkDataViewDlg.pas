{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit daLinkDataViewDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppForms, ExtCtrls, StdCtrls, ppDB, ppClass, ppTypes, ppUtils,
  daSQL, daForms, daQueryDataView;

type

  TppAnchorArray = array[0..99] of TAnchors;

  TppAnchorManager = class
    private
      FWinControl: TWinControl;
      FAnchors: TppAnchorArray;
    public
      constructor Create(aWinControl: TWinControl); virtual;
      procedure DisableAnchors;
      procedure EnableAnchors;
    end;



  { TdaLinkDataViewDialog }

  TdaLinkDataViewDialog = class (TdaCustomLinkDataViewDialog)
    Bevel1: TBevel;
    btnAdd: TButton;
    btnCancel: TButton;
    btnClear: TButton;
    btnDelete: TButton;
    btnOK: TButton;
    cbxMasterSQL: TComboBox;
    lblDetail: TLabel;
    lblJoin: TLabel;
    lblMasterDataView: TLabel;
    lbxDetail: TListBox;
    lbxJoin: TListBox;
    lbxMaster: TListBox;
    rdbIncludeAll: TRadioButton;
    rdbIncludeOnly: TRadioButton;
    lblIncludeAll: TLabel;
    lblIncludeOnly: TLabel;

    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbxMasterSQLChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure lblIncludeOnlyClick(Sender: TObject);
    procedure lblIncludeAllClick(Sender: TObject);

  private
    FDeletedLinks: TStringList;
    FDetailSQL: TdaSQL;
    FMasterSQL: TdaSQL;
    FNewLinks: TStringList;

    procedure ClearLinks;
    procedure CreateLink(aMasterIndex, aDetailIndex: Integer);
    procedure DeleteLink(aLink: TdaSQLLink);
    procedure EnableValidButtons;
    procedure DetailSQLToControls;
    procedure LinksToControls;
    procedure MasterSQLToControls;
    procedure MatchLinkFields;
    procedure SQLToControls;
    procedure RepositionControls;
    procedure SetMasterSQL(aSQL: TdaSQL);
    procedure UpdateLinkFieldAliases(aSQLLink: TdaSQLLink);

  protected
    procedure LanguageChanged; override;
    procedure Activate; override;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Loaded; override;

    procedure AddSQLObjects(aSQLObjects: TList); override;
    function Execute: Boolean; override;
    function GetMasterSQL: TdaSQL; override;
    procedure SetDetailSQL(aSQL: TdaSQL); override;

  end; {class, TdaLinkDataViewDialog}


var
  daLinkDataViewDialog: TdaLinkDataViewDialog;

implementation

{$R *.DFM}

constructor TppAnchorManager.Create(aWinControl: TWinControl);
begin
  inherited Create;
  FWinControl := aWinControl

end;

procedure TppAnchorManager.DisableAnchors;
var
  liIndex: Integer;
  lControl: TControl;
begin
  for liIndex := 0 to FWinControl.ControlCount-1 do
    begin
      lControl := FWinControl.Controls[liIndex];
      FAnchors[liIndex] := lControl.Anchors;
      lControl.Anchors := [];
    end;

end;

procedure TppAnchorManager.EnableAnchors;
var
  liIndex: Integer;
  lControl: TControl;
begin
  for liIndex := 0 to FWinControl.ControlCount-1 do
    begin
      lControl := FWinControl.Controls[liIndex];
      lControl.Anchors := FAnchors[liIndex];
    end;

end;


{*******************************************************************************
 *
 ** L I N K   D A T A V I E W   D I A L O G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.Create }

constructor TdaLinkDataViewDialog.Create(aOwner: TComponent);
begin

  inherited Create(Owner);

  FNewLinks     := TStringList.Create;
  FDeletedLinks := TStringList.Create;


end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.Destroy }

destructor TdaLinkDataViewDialog.Destroy;
begin
  FNewLinks.Free;
  FDeletedLinks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.Activate }

procedure TdaLinkDataViewDialog.Activate;
var
  lfScale: Single;
begin

  lfScale := Screen.PixelsPerInch / 96;

  Width  := Round(Width * lfScale);
  Height := Round(Height * lfScale);

  lblIncludeOnly.Anchors := [akLeft, akBottom];
  Bevel1.Anchors := [akLeft, akRight, akBottom];
  lblIncludeAll.Anchors := [akLeft, akBottom];
  btnClear.Anchors := [akTop, akRight];
  btnDelete.Anchors := [akTop, akRight];
  btnOK.Anchors := [akRight, akBottom];
  btnCancel.Anchors := [akRight, akBottom];
  lbxJoin.Anchors := [akLeft, akTop, akRight];
  lbxDetail.Anchors := [akLeft, akTop, akRight, akBottom];
  rdbIncludeAll.Anchors := [akLeft, akBottom];
  rdbIncludeOnly.Anchors := [akLeft, akBottom];

  inherited Activate;

end; {procedure, Activate}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.AddSQLObjects }

procedure TdaLinkDataViewDialog.Loaded;
begin
  inherited Loaded;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.AddSQLObjects }

procedure TdaLinkDataViewDialog.AddSQLObjects(aSQLObjects: TList);
var
  lbMasterSQLDefaulted: Boolean;
  ldaSQL: TdaSQL;
  liIndex: Integer;
begin

  for liIndex := 0 to aSQLObjects.Count - 1 do
    begin
      ldaSQL := TdaSQL(aSQLObjects[liIndex]);

      if (FDetailSQL <> nil) and (ldaSQL = FDetailSQL.MasterSQL) then
        SetMasterSQL(ldaSQL);

      cbxMasterSQL.Items.AddObject(ldaSQL.DataPipelineName, ldaSQL);
    end;

  {default to first SQL}
  if (FMasterSQL = nil) then
    begin
      SetMasterSQL(TdaSQL(cbxMasterSQL.Items.Objects[0]));

      lbMasterSQLDefaulted := True;
    end
  else
    lbMasterSQLDefaulted := False;

  {transfer links and available fields to the controls}
  SQLToControls;

  if (lbMasterSQLDefaulted) then
    MatchLinkFields;

end; {procedure, AddSQLObjects}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.SetDetailSQL }

procedure TdaLinkDataViewDialog.SetDetailSQL(aSQL: TdaSQL);
begin
  FDetailSQL := aSQL;
end; {procedure, SetDetailSQL}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.GetMasterSQL }

function TdaLinkDataViewDialog.GetMasterSQL: TdaSQL;
begin
  Result := FMasterSQL;
end; {function, GetMasterSQL}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.SetMasterSQL }

procedure TdaLinkDataViewDialog.SetMasterSQL(aSQL: TdaSQL);
begin

  if (FMasterSQL <> aSQL) and (aSQL <> FDetailSQL) then
    begin
      FMasterSQL := aSQL;

      FDetailSQL.DetailLinkFieldsOutOfSync := True;

      {RefreshInfo;}
    end;

end; {procedure, SetMasterSQL}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.LanguageChanged }

procedure TdaLinkDataViewDialog.LanguageChanged;
var
  lsMaster: String;
begin

  btnAdd.Caption    := ppLoadStr(260);
  btnDelete.Caption := ppLoadStr(124);

  btnOK.Caption     := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

  if (FMasterSQL <> nil) then
    lsMaster := FMasterSQL.DataPipelineName
  else
    lsMaster := '';

  lblIncludeAll.Caption := ppLoadStrWithParms(856, [lsMaster, FDetailSQL.DataPipelineName]);
  lblIncludeOnly.Caption := ppLoadStrWithParms(857, [lsMaster, FDetailSQL.DataPipelineName]);

  lblJoin.Caption := ppLoadStr(855);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.btnAddClick }

procedure TdaLinkDataViewDialog.btnAddClick(Sender: TObject);
begin

  if (lbxDetail.ItemIndex >= 0) and (lbxDetail.ItemIndex < lbxDetail.Items.Count) and
     (lbxMaster.ItemIndex >= 0) and (lbxMaster.ItemIndex < lbxMaster.Items.Count) then
    begin
      CreateLink(lbxMaster.ItemIndex, lbxDetail.ItemIndex);

      EnableValidButtons;
    end;
  
end; {procedure, btnAddClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.btnClearClick }

procedure TdaLinkDataViewDialog.btnClearClick(Sender: TObject);
begin

  ClearLinks;

  EnableValidButtons;

end; {procedure, btnClearClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.btnDeleteClick }

procedure TdaLinkDataViewDialog.btnDeleteClick(Sender: TObject);
var
  lLink: TdaSQLLink;
begin

  if (lbxJoin.ItemIndex >= 0) and (lbxJoin.ItemIndex < lbxJoin.Items.Count) then
    begin
      lLink := TdaSQLLink(lbxJoin.Items.Objects[lbxJoin.ItemIndex]);
  
      DeleteLink(lLink);

      EnableValidButtons;
    end;
  
end; {procedure, btnDeleteClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.btnOKClick }

procedure TdaLinkDataViewDialog.btnOKClick(Sender: TObject);
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
begin

  {free any deleted links}
  for liIndex := 0 to FDeletedLinks.Count - 1 do
    begin
      lSQLLink := TdaSQLLink(FDeletedLinks.Objects[liIndex]);

      FDetailSQL.FreeLink(lSQLLink);
    end;
  
  for liIndex := 0 to FNewLinks.Count - 1 do
    begin
      lSQLLink := TdaSQLLink(FNewLinks.Objects[liIndex]);

      lSQLLink.Parent := FDetailSQL;

      UpdateLinkFieldAliases(lSQLLink);
    end;

  {set the master data view property, must do this last}
  if (lbxJoin.Items.Count = 0) then
    FDetailSQL.MasterSQL := nil

  else
    FDetailSQL.MasterSQL := FMasterSQL;

  FDetailSQL.SkipWhenNoRecords := rdbIncludeOnly.Checked;

end; {procedure, btnOKClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.btnCancelClick }

procedure TdaLinkDataViewDialog.btnCancelClick(Sender: TObject);
var
  lSQLLink: TdaSQLLink;
  liIndex: Integer;
begin

  {we're cancelling, so free any newly created links}
  for liIndex := 0 to FNewLinks.Count - 1 do
    begin
      lSQLLink := TdaSQLLink(FNewLinks.Objects[liIndex]);
  
      lSQLLink.Free;
    end;
  
  {restore parent SQL of any deleted links}
  for liIndex := 0 to FDeletedLinks.Count - 1 do
    begin
      lSQLLink := TdaSQLLink(FDeletedLinks.Objects[liIndex]);

      lSQLLink.Parent := FDetailSQL;
    end;

end; {procedure, btnCancelClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.cbxMasterSQLChange }

procedure TdaLinkDataViewDialog.cbxMasterSQLChange(Sender: TObject);
var
  lSQL: TdaSQL;
begin

  if (cbxMasterSQL.ItemIndex > -1) then
    begin
      lSQL := TdaSQL(cbxMasterSQL.Items.Objects[cbxMasterSQL.ItemIndex]);
  
      if (lSQL <> FMasterSQL) then
        begin
          FMasterSQL := lSQL;

          MasterSQLToControls;

          ClearLinks;

          MatchLinkFields;

          LanguageChanged;
        end;
    end;

end; {procedure, cbxMasterSQLChange}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.ClearLinks }

procedure TdaLinkDataViewDialog.ClearLinks;
var
  liIndex: Integer;
  lLink: TdaSQLLink;
begin

  for liIndex := lbxJoin.Items.Count - 1 downto 0 do
    begin
      lLink := TdaSQLLink(lbxJoin.Items.Objects[liIndex]);

      DeleteLink(lLink);
    end;

end; {procedure, ClearLinks}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.lblIncludeOnlyClick }

procedure TdaLinkDataViewDialog.lblIncludeOnlyClick(Sender: TObject);
begin
  rdbIncludeOnly.Checked := True;
end; {procedure, lblIncludeOnlyClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.lblIncludeAllClick }

procedure TdaLinkDataViewDialog.lblIncludeAllClick(Sender: TObject);
begin
  rdbIncludeAll.Checked := True;
end; {procedure, lblIncludeAllClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.Execute }

function TdaLinkDataViewDialog.Execute: Boolean;
begin

  Result := (ShowModal = mrOK);
  
end; {function, Execute}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.FormResize }

procedure TdaLinkDataViewDialog.FormResize(Sender: TObject);
begin

  RepositionControls;
  
end; {procedure, FormResize}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.ListBoxClick }

procedure TdaLinkDataViewDialog.ListBoxClick(Sender: TObject);
begin

  EnableValidButtons;

end; {procedure, ListBoxClick}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.SQLToControls }

procedure TdaLinkDataViewDialog.SQLToControls;
begin

  DetailSQLToControls;
  MasterSQLToControls;
  LinksToControls;

  Caption := ppLoadStrWithParms(851, [FDetailSQL.DataPipelineName]);
  LanguageIndex := FDetailSQL.LanguageIndex;

  EnableValidButtons;

  rdbIncludeAll.Checked := not(FDetailSQL.SkipWhenNoRecords);
  rdbIncludeOnly.Checked := FDetailSQL.SkipWhenNoRecords;

end; {procedure, SQLToControls}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.LinksToControls }

procedure TdaLinkDataViewDialog.LinksToControls;
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
begin

  lbxJoin.Items.Clear;

  if (FMasterSQL <> nil) and (FDetailSQL <> nil) then
    begin

      for liIndex := 0 to FDetailSQL.LinkCount - 1 do
        begin
          lSQLLink := FDetailSQL.Links[liIndex];

          lbxJoin.Items.AddObject(lSQLLink.Description, lSQLLink);
        end;

    end;

end; {procedure, LinksToControls}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.DetailSQLToControls }

procedure TdaLinkDataViewDialog.DetailSQLToControls;
var
  liIndex: Integer;
  lField: TdaField;
begin
  
  if (FDetailSQL <> nil) then
    begin
      lblDetail.Caption := ppLoadStr(850) + ' - ' + FDetailSQL.DataPipelineName;  {'Detail'}
  
      lbxDetail.Items.Clear;

      for liIndex := 0 to FDetailSQL.AvailableDetailLinkFieldCount - 1 do
        begin
          lField := FDetailSQL.AvailableDetailLinkFields[liIndex];

          if (lField <> nil) and not(lField.IsDetail) then
            lbxDetail.Items.AddObject(lField.FieldAlias, lField);
        end;
    end;
  
end; {procedure, DetailSQLToControls}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.MasterSQLToControls }

procedure TdaLinkDataViewDialog.MasterSQLToControls;
var
  liIndex: Integer;
  lField: TdaField;
begin

  if (FMasterSQL <> nil) then
    begin
      lblMasterDataView.Caption := ppLoadStr(849) + ' - '; {'Master'}

      lbxMaster.Items.Clear;

      for liIndex := 0 to FMasterSQL.AvailableMasterLinkFieldCount - 1 do
        begin
          lField := FMasterSQL.AvailableMasterLinkFields[liIndex];

          if (lField <> nil) then
            lbxMaster.Items.AddObject(lField.FieldAlias, lField);
        end;

      if (cbxMasterSQL.Items.Count > 1) then
        begin
          cbxMasterSQL.Visible := True;

          cbxMasterSQL.ItemIndex := cbxMasterSQL.Items.IndexOf(FMasterSQL.DataPipelineName);
        end
      else
        begin
          cbxMasterSQL.Visible := False;

          lblMasterDataView.Caption := lblMasterDataView.Caption + FMasterSQL.DataPipelineName;
        end;

    end;

end; {procedure, MasterSQLToControls}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.EnableValidButtons }

procedure TdaLinkDataViewDialog.EnableValidButtons;
begin

  btnAdd.Enabled := (FMasterSQL <> nil) and
                    (lbxDetail.ItemIndex >= 0) and (lbxMaster.ItemIndex >= 0) and
                    (lbxDetail.Selected[lbxDetail.ItemIndex]) and
                    (lbxMaster.Selected[lbxMaster.ItemIndex]);

  btnDelete.Enabled := (lbxJoin.Items.Count > 0) and (lbxJoin.ItemIndex >= 0) and
                       (lbxJoin.Selected[lbxJoin.ItemIndex]);

  btnClear.Enabled  := (lbxJoin.Items.Count > 0);

end; {procedure, EnableValidButtons}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.UpdateLinkFieldAliases }

procedure TdaLinkDataViewDialog.UpdateLinkFieldAliases(aSQLLink: TdaSQLLink);
var
  ldaField: TdaField;
begin

  ldaField := FMasterSQL.GetFieldForAlias(aSQLLink.MasterField.Alias);
  {ldaField.SQLFieldName := ldaField.FieldName; }
  aSQLLink.MasterField.SQLFieldName := ldaField.SQLFieldName;

  ldaField := FDetailSQL.GetFieldForAlias(aSQLLink.DetailField.Alias);
  {ldaField.SQLFieldName := ldaField.FieldName;  }
  aSQLLink.DetailField.SQLFieldName := ldaField.SQLFieldName;

end; {procedure, UpdateLinkFieldAliases}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.CreateLink }

procedure TdaLinkDataViewDialog.CreateLink(aMasterIndex, aDetailIndex: Integer);
var
  lSQLLink: TdaSQLLink;
  lDetailField: TdaField;
  lMasterField: TdaField;
begin
  lSQLLink := TdaSQLLink.Create(nil);

  lDetailField := FDetailSQL.SelectDetailLinkField(aDetailIndex);
  lDetailField.ChangeOwner(lSQLLink);
  lDetailField.Name := lDetailField.GetValidName(lDetailField);

  lMasterField := FMasterSQL.SelectMasterLinkField(aMasterIndex);
  lMasterField.ChangeOwner(lSQLLink);
  lMasterField.Name := lMasterField.GetValidName(lMasterField);

  lDetailField.Parent := lSQLLink;
  lMasterField.Parent := lSQLLink;

  FNewLinks.AddObject(lSQLLink.Description, lSQLLink);
  lbxJoin.Items.AddObject(lSQLLink.Description, lSQLLink);

  lbxDetail.Items.Delete(aDetailIndex);

end; {procedure, CreateLink}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.MatchLinkFields }

procedure TdaLinkDataViewDialog.MatchLinkFields;
var
  liMasterIndex: Integer;
  liDetailIndex: Integer;
  lsFieldAlias: String;
  lbLinkCreated: Boolean;
begin

  lbLinkCreated := False;
  liMasterIndex := 0;
  
  {locate master fields, with same name as detail fields}
  while (liMasterIndex < lbxMaster.Items.Count) do
    begin
      lsFieldAlias := lbxMaster.Items[liMasterIndex];

      liDetailIndex := lbxDetail.Items.IndexOf(lsFieldAlias);
  
      if (liDetailIndex <> -1) then
        begin
          CreateLink(liMasterIndex, liDetailIndex);

          lbLinkCreated := True;
        end;
  
      Inc(liMasterIndex);
    end;

  if (lbLinkCreated) then
    EnableValidButtons;

end; {procedure, MatchLinkFields}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.DeleteLink }

procedure TdaLinkDataViewDialog.DeleteLink(aLink: TdaSQLLink);
var
  liIndex: Integer;
  lLink: TdaSQLLink;
  ldaField: TdaField;
begin

  liIndex := lbxJoin.Items.IndexOfObject(aLink);

  lbxJoin.Items.Delete(liIndex);

  {delete from the 'new' list if needed, otherwise add to the 'deleted' list}
  liIndex := FNewLinks.IndexOfObject(aLink);

  if (liIndex <> -1) then
    begin
      lLink := TdaSQLLink(FNewLinks.Objects[liIndex]);

      ldaField := FDetailSQL.DeselectDetailLinkField(lLink.DetailField);

      lLink.Free;

      FNewLinks.Delete(liIndex);
    end

  else
    begin
      aLink.Parent := nil;

      ldaField := FDetailSQL.DeselectDetailLinkField(aLink.DetailField);

      FDeletedLinks.AddObject(aLink.Description, aLink);
    end;

  if (ldaField <> nil) then
    begin
      liIndex := FDetailSQL.IndexOfAvailableDetailLinkField(ldaField);

      lbxDetail.Items.Insert(liIndex, ldaField.FieldAlias);
    end;

end; {procedure, DeleteLink}

{------------------------------------------------------------------------------}
{ TdaLinkDataViewDialog.RepositionControls }

procedure TdaLinkDataViewDialog.RepositionControls;
var
  liColumnSpace: Integer;
  liRowSpace: Integer;
  liFieldListHeight: Integer;
  liJoinListHeight: Integer;
  lfScale: Single;
begin

  lfScale := Screen.PixelsPerInch / 96;

  liColumnSpace := Width - Round(140 * lfScale);
  liRowSpace := Height - Round(203 * lfScale);

  liFieldListHeight := Trunc(liRowSpace * 0.69 * lfScale);
  liJoinListHeight := liRowSpace - liFieldListHeight;

  lbxDetail.Width := liColumnSpace div 2;
  lbxDetail.Height := liFieldListHeight;
  lbxMaster.SetBounds(lbxDetail.Width + Round(119 * lfScale), lbxMaster.Top, lbxDetail.Width, lbxDetail.Height);

  cbxMasterSQL.Left := lbxMaster.Left + Round(42 * lfScale);
  cbxMasterSQL.Width := lbxMaster.Width - Round(42 * lfScale);

  lblMasterDataView.Left := lbxMaster.Left;
  btnAdd.Left := lbxDetail.Width + Round(28 * lfScale);

  lbxJoin.Height := liJoinListHeight;
  lbxJoin.Top := liFieldListHeight + Round(70 * lfScale);
  lblJoin.Top := lbxJoin.Top - Round(21 * lfScale);

  btnDelete.Top := lbxJoin.Top;
  btnClear.Top := btnDelete.Top + Round(35 * lfScale);

end; {procedure, RepositionControls}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}


initialization

   ppRegisterForm(TdaCustomLinkDataViewDialog, TdaLinkDataViewDialog);

finalization

   ppUnRegisterForm(TdaCustomLinkDataViewDialog);

end.
