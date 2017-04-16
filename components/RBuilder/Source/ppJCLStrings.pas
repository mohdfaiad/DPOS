{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                                                              BBBBB   }

{**************************************************************************************************}
{ This unit is a adapted from the Project JEDI Code Library (JCL). The original header appears     }
{ in the box below.                                                                                }
{                                                                                                  }
{ original unit: JclStrings.pas                                                                    }
{                                                                                                  }
{ This unit is a subset of the original. It contains only types, classes and methods,              }
{ required to support the JvInspector and related classes. A prefix of pp has been added           }
{ to all classes and methods to differentiate them from the original. This has been done to        }
{ avoid conflicts for users that install ReportBuilder and the JCL.                                }
{                                                                                                  }
{**************************************************************************************************}

{**************************************************************************************************}
{                                                                                                  }
{ Project JEDI Code Library (JCL)                                                                  }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is JclStrings.pas.                                                             }
{                                                                                                  }
{ The Initial Developer of the Original Code is documented in the accompanying                     }
{ help file JCL.chm. Portions created by these individuals are Copyright (C) of these individuals. }
{                                                                                                  }
{**************************************************************************************************}
{                                                                                                  }
{ Various character and string routines (searching, testing and transforming)                      }
{                                                                                                  }
{ Unit owner: Azret Botash                                                                         }
{ Last modified: September 30, 2002                                                                    }
{                                                                                                  }
{**************************************************************************************************}

unit ppJclStrings;

interface

uses
  SysUtils,
  Classes;

const
  AnsiCrLf           = AnsiString(#13#10);


function ppJclStrLastPos(const SubStr, S: AnsiString): Integer;
function ppJclStrLeft(const S: AnsiString; Count: Integer): AnsiString;
function ppJclStrRestOf(const S: AnsiString; N: Integer ): AnsiString;

//--------------------------------------------------------------------------------------------------
// TStrings Manipulation
//--------------------------------------------------------------------------------------------------

procedure StrToStrings(S, Sep: AnsiString; const List: TStrings; const AllowEmptyString: Boolean = True);


implementation


//--------------------------------------------------------------------------------------------------

function ppJclStrLastPos(const SubStr, S: AnsiString): Integer;
var
  Last, Current: PAnsiChar;

begin
  Result := 0;
  Last := nil;
  Current := PAnsiChar(S);

  while (Current <> nil) and (Current^ <> #0) do
  begin
    Current := AnsiStrPos(PAnsiChar(Current), PAnsiChar(SubStr));
    if Current <> nil then
    begin
      Last := Current;
      Inc(Current);
    end;
  end;
  if Last <> nil then
    Result := Abs((Longint(PAnsiChar(S)) - Longint(Last)) div SizeOf(AnsiChar)) + 1;
end;

//--------------------------------------------------------------------------------------------------

function ppJclStrLeft(const S: AnsiString; Count: Integer): AnsiString;
begin
  Result := Copy(S, 1, Count);
end;

//--------------------------------------------------------------------------------------------------

function ppJclStrRestOf(const S: AnsiString; N: Integer ): AnsiString;
begin
  Result := Copy(S, N, (Length(S) - N + 1));
end;

//==================================================================================================
// TStrings Manipulation
//==================================================================================================

procedure StrToStrings(S, Sep: AnsiString; const List: TStrings; const AllowEmptyString: Boolean = True);
var
  I, L: Integer;
  Left: AnsiString;
begin
  Assert(List <> nil);
  List.Clear;
  L := Length(Sep);
  I := Pos(Sep, S);
  while (I > 0) do
  begin
    Left := ppJclStrLeft(S, I - 1);
    if (Left <> '') or AllowEmptyString then
      List.Add(Left);
    System.Delete(S, 1, I + L - 1);
    I := Pos(Sep, S);
  end;
  if S <> '' then
    List.Add(S);  // Ignore empty strings at the end.
end;

end.
