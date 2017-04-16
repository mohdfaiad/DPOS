{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit ppFileUtils;

interface

{$WARN SYMBOL_PLATFORM OFF}

uses
  Windows,
  Classes, SysUtils, ShellAPI,
  ppTypes;

type

  {@TppFileUtils }

  TppFileUtils = class
  private
    public
      class function GetApplicationFileName: String;
      class function GetApplicationFilePath: String;
      class function GetApplicationShortFilePath: String;
      class function GetLibraryFileName: String;
      class function GetLibraryFilePath: String;
      class function GetLibraryShortFilePath: String;

      class procedure GetFileNamesForDirectory(aDirectory: String; aFileExtension: String; aList: TStrings); virtual;
      class function GetFileSearchRec(aFileName: String; var aSearchRec: TSearchRec): Boolean; virtual;
      class procedure GetFolderNamesForDirectory(const aDirectory: string; aNameList: TStrings); virtual;
      class function GetLongFileName(aFileName: String): String;
      class procedure GetReportNamesForDirectory(aDirectory: String; aFileExtension: String; aList: TStrings); virtual;

      class procedure ParseDirectoryPath(aDirectoryPath: String; aStrings: TStrings); virtual;
      class procedure RemoveDirAndContents(aDirName: String);
      class procedure RemoveDirContents(aDirName: String);

      class procedure ComponentToFile(aComponent: TComponent; aFileName: String);
      class function FileToComponent(aFileName: String): TComponent;

      class procedure StringToFile(aString, aFileName: String);
      class function FileToString(aFileName: String): String;

    end;

implementation

{------------------------------------------------------------------------------}
{TppFileUtils.GetApplicationFileName }

class function TppFileUtils.GetApplicationFileName: String;
begin

   Result := ParamStr(0);

  {The above call sometimes returns the short path name - for example
   when running an application as a service. Therefore, need to
   check whether the result is the short path name and convert if needed.
   The GetLongFileNames call will fail if you perform it on a long path name
   that includes spaces.}
  if (Pos('~', Result) > 0) then
    Result := GetLongFileName(Result);

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetApplicationFilePath }

class function TppFileUtils.GetApplicationFilePath: String;
begin

  Result := ExtractFilePath(GetApplicationFileName);

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetApplicationShortFilePath }

class function TppFileUtils.GetApplicationShortFilePath: String;
var
  lsShortPathFileName: String;
begin

  lsShortPathFileName := ExtractShortPathName(GetApplicationFileName);

  Result := ExtractFilePath(lsShortPathFileName);

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetLibraryFileName }

class function TppFileUtils.GetLibraryFileName: String;
var
  lsFileName: String;
  liNameLength: Integer;
begin

  if IsLibrary then
    begin
      SetLength(lsFileName, Max_Path);

      liNameLength := GetModuleFileName(HInstance, PChar(lsFileName), Length(lsFileName));

      if (liNameLength > 0) then
        SetLength(lsFileName, liNameLength)
      else
        lsFileName := '';

    end
  else
    lsFileName := GetApplicationFileName;

  if (Pos('~', lsFileName) > 0) then
    Result := GetLongFileName(lsFileName);


  Result := lsFileName;

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetLibraryFilePath }

class function TppFileUtils.GetLibraryFilePath: String;
begin
  Result := ExtractFilePath(GetLibraryFileName);

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetLibraryShortFilePath }

class function TppFileUtils.GetLibraryShortFilePath: String;
var
  lsShortPathFileName: String;
begin

  lsShortPathFileName := ExtractShortPathName(GetLibraryFileName);

  Result := ExtractFilePath(lsShortPathFileName);

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetLongFileName }

class function TppFileUtils.GetLongFileName(aFileName: String): String;
var
  lSearchRec: TSearchRec;
  lPathStrings: TStringList;
  liIndex: Integer;
begin

  if not FileExists(aFileName) then
    raise EReportBuilderError.Create('TppFileUtils.GetLongFileName: File does not exist, ' + aFileName);

  lPathStrings := TStringList.Create;

  try
    {use TString list to parse the path}
    lPathStrings.Delimiter := '\';
    lPathStrings.DelimitedText := aFileName;

    liIndex := lPathStrings.Count-1;
    Result := '';

    {use GetFileSearchRec to find the long name of of each element in the path,
      starting with the filename and working backwards to each parent folder}
    while liIndex > 0 do
      begin
        GetFileSearchRec(lPathStrings.DelimitedText, lSearchRec);

        if Result <> '' then
          Result := '\' + Result;

        Result := lSearchRec.FindData.cFileName + Result;

        lPathStrings.Delete(liIndex);
        Dec(liIndex);

      end;

    {first string contains the drive info}
    Result := lPathStrings[0] + '\' + Result;

  finally
    lPathStrings.Free;

  end;

end;

{------------------------------------------------------------------------------}
{TppFileUtils.GetFileSearchRec }

class function TppFileUtils.GetFileSearchRec(aFileName: String; var aSearchRec: TSearchRec): Boolean;
var
  liFindStatus: Integer;
begin

  liFindStatus := FindFirst(aFileName, faAnyFile, aSearchRec);
  FindClose(aSearchRec);

  Result := (liFindStatus = 0);

end; {class procedure, GetFileSearchRec}

{-------------------------------------------------------------------------------}
{TppFileUtils.GetFileNamesForDirectory }

class procedure TppFileUtils.GetFileNamesForDirectory(aDirectory: String; aFileExtension: String; aList: TStrings);
var
  liStatus: Integer;
  lSearchRec: TSearchRec;
  lsParentDirectory: String;
  lExtension: String;
begin

  if (aFileExtension = '') then
    lExtension := '*'
  else
    lExtension := aFileExtension;

  lsParentDirectory := IncludeTrailingPathDelimiter(aDirectory) + '*.' + lExtension;

  liStatus := FindFirst(lsParentDirectory, faAnyFile, lSearchRec);

  try

    while (liStatus = 0) do
      begin

        if ((lSearchRec.Attr and faDirectory) = 0) then
          if (lSearchRec.Name <> '.') and (lSearchRec.Name <> '..') then
            aList.Add(lSearchRec.Name);

        liStatus := FindNext(lSearchRec);

      end;

  finally
    FindClose(lSearchRec);
  end;

end; {class procedure, GetFileNamesForDirectory}


{-------------------------------------------------------------------------------}
{TppFileUtils.GetReportNamesForDirectory }

class procedure TppFileUtils.GetReportNamesForDirectory(aDirectory: String; aFileExtension: String; aList: TStrings);
var
  liIndex: Integer;
  lsFileName: String;
  lsExtension: String;
begin

  GetFileNamesForDirectory(aDirectory, aFileExtension, aList);

  for liIndex := 0 to aList.Count-1 do
    begin
      lsFileName := aList[liIndex];
      lsExtension := '.' + aFileExtension;
      aList[liIndex] := StringReplace(lsFileName, lsExtension, '', [rfIgnoreCase]);
    end;

end; {class procedure, GetReportNamesForDirectory}

{------------------------------------------------------------------------------}
{ TppFileUtils.GetFolderNamesForDirectory }

class procedure TppFileUtils.GetFolderNamesForDirectory(const aDirectory: string; aNameList: TStrings);
var
  liStatus: Integer;
  lSearchRec: TSearchRec;
  lsParentDirectory: String;
begin

  if (aDirectory <> '') then
    begin
      lsParentDirectory := IncludeTrailingPathDelimiter(aDirectory) + '*.*';;

      liStatus := FindFirst(lsParentDirectory, faDirectory, lSearchRec);

      try

        while (liStatus = 0) do
          begin

            if ((lSearchRec.Attr and faDirectory) <> 0) then
              if (lSearchRec.Name <> '.') and (lSearchRec.Name <> '..') then
                aNameList.Add(lSearchRec.Name);

            liStatus := FindNext(lSearchRec);

          end;

      finally
        FindClose(lSearchRec);
      end;

    end;
    

end; {class procedure, GetFolderNamesForDirectory}

{------------------------------------------------------------------------------}
{ TppFileUtils.ParseDirectoryPath }

class procedure TppFileUtils.ParseDirectoryPath(aDirectoryPath: String; aStrings: TStrings);
var
  lsString: String;
  liPosition: Integer;
begin

  aStrings.Clear;
  
  lsString := aDirectoryPath;

  liPosition := Pos('\', lsString);

  {if path starts with a '\', strip it off}
  if (liPosition = 1) then
    begin
      lsString := Copy(lsString, liPosition + 1, Length(lsString));
      liPosition := Pos('\', lsString);
    end;

  while (liPosition <> 0) do
    begin
      aStrings.Add(Copy(lsString, 1, liPosition - 1));

      lsString := Copy(lsString, liPosition + 1, Length(lsString));

      liPosition := Pos('\', lsString);
    end;

  if (Length(lsString) > 0) then
    aStrings.Add(lsString);

end; {class procedure, ParseDirectoryPath}


{@TppFileUtils.StringToFile }

class procedure TppFileUtils.StringToFile(aString, aFileName: String);
var
  lFileStream: TFileStream;
begin

  if (aString <> '') then
    try

      lFileStream := TFileStream.Create(aFileName, fmCreate);

      try
        lFileStream.Write(aString[1], Length(aString));
      finally
        lFileStream.Free;
      end;

    except
    end;

end;

{@TppFileUtils.FileToString }

class function TppFileUtils.FileToString(aFileName: String): String;
var
  lFileStream: TFileStream;
begin

  Result := '';

  if (FileExists(aFileName)) then
    try

      lFileStream := TFileStream.Create(aFileName, fmOpenRead);

      try
        SetLength(Result, lFileStream.Size);
        lFileStream.ReadBuffer(Pointer(Result)^, lFileStream.Size);

      finally
        lFileStream.Free;
      end;

    except
    end;

end;

{@TppFileUtils.RemoveDirContents }

class procedure TppFileUtils.RemoveDirContents(aDirName: String);
var
  lSearchRec: TSearchRec;
  liStatus: Integer;
begin

  liStatus := FindFirst(aDirName + '\*.*', faAnyFile, lSearchRec); {first always '.' }

  try
    {remove files in this directory and recursively call this method for each directory}
    while (liStatus = 0) do
      begin

        if (lSearchRec.Name = '..') or (lSearchRec.Name = '.') then
          {do nothing }
        else if (lSearchRec.Attr and faDirectory) > 0 then
          RemoveDirAndContents(aDirName + '\' + lSearchRec.name)
        else
          Deletefile(aDirName + '\' + lSearchRec.name);

        liStatus := FindNext(lSearchRec);

      end;

  finally
    FindClose(lSearchRec);
  end

end;


{@TppFileUtils.RemoveDirAndContents }

class procedure TppFileUtils.RemoveDirAndContents(aDirName: String);
begin

  RemoveDirContents(aDirName);

  RemoveDir(aDirName);

end;


{@TppFileUtils.ComponentToFile }

class procedure TppFileUtils.ComponentToFile(aComponent: TComponent; aFileName: String);
var
  lFileStream: TFileStream;
  lMemoryStream: TMemoryStream;
begin

  try

    DeleteFile(aFileName);

    lMemoryStream := TMemoryStream.Create;

    try

      lMemoryStream.WriteComponent(aComponent);
      lMemoryStream.Position := 0;

      lFileStream := TFileStream.Create(aFileName, fmCreate);

      try
        ObjectBinaryToText(lMemoryStream, lFileStream);
      finally
        lFileStream.Free;
      end;

    finally
      lMemoryStream.Free;
    end;

  except
  end;

end;


{@TppFileUtils.FileToComponent }

class function TppFileUtils.FileToComponent(aFileName: String): TComponent;
var
  lFileStream: TFileStream;
  lMemoryStream: TMemoryStream;
begin

  try

    Result := nil;

    if FileExists(aFileName) then
      begin

        lMemoryStream := TMemoryStream.Create;

        try

          lFileStream := TFileStream.Create(aFileName, fmOpenRead);

          try
            ObjectTextToBinary(lFileStream, lMemoryStream);
          finally
            lFileStream.Free;
          end;

          lMemoryStream.Position := 0;
          Result := lMemoryStream.ReadComponent(nil);

        finally
          lMemoryStream.Free;
        end;

      end;

  except
    Result := nil;
  end;

end;




end.

