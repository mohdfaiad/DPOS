{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFInfo;

interface

uses
  Classes,
  SysUtils,
  ppPDFObject;

type

  {@TppPDFInfo

    Writes the Info object to the PDF File.  The info object hold information
    about the PDF document such as the author, creator, creation data, keywords,
    subject and title. }

  {@TppPDFInfo.Author

    The name of the person who created the document. }

  {@TppPDFInfo.Keywords

    Keywords associated with the document. }

  {@TppPDFInfo.Subject

    The Subject of the document. }

  {@TppPDFInfo.Title

    The document's title. }

  TppPDFInfo = class(TppPDFObject)
    private
      FAuthor: String;
      FKeywords: String;
      FSubject: String;
      FTitle: String;
      
      procedure SetAuthor(const Value: String);
      procedure SetKeywords(const Value: String);
      procedure SetSubject(const Value: String);
      procedure SetTitle(const Value: String);

    public
      procedure Write(aOutputStream: TStream; aReferenceNumber: Integer); override;

      function CreationDate: String;

      property Author: String read FAuthor write SetAuthor;
      property Keywords: String read FKeywords write SetKeywords;
      property Subject: String read FSubject write SetSubject;
      property Title: String read FTitle write SetTitle;

  end;

implementation

uses
  ppPDFUtils;

{@TppPDFInfo.CreationDate

  Returns the current date in a format that PDF can read (yyyymmddhhnnss)}

function TppPDFInfo.CreationDate: String;
begin
  Result := FormatDateTime('yyyymmddhhnnss', Now());

end;

{@TppPDFInfo.Write

  Write instructions in PDF code to the PDF File Stream to create the Info
  object.}

procedure TppPDFInfo.Write(aOutputStream: TStream; aReferenceNumber: Integer);
begin
  inherited;

  WriteLine(IntToStr(ReferenceNumber) + ' 0 obj');
  WriteLine('<< /Creator (ReportBuilder)');
  WriteLine('/CreationDate (D:' + CreationDate + ')');
  WriteLine('/Title (' + TppPDFUtils.ProcessText(Title) + ')');
  WriteLine('/Author (' + TppPDFUtils.ProcessText(Author) + ')');
  WriteLine('/Producer (ReportBuilder)');
  WriteLine('/Keywords (' + TppPDFUtils.ProcessText(Keywords) + ')');
  WriteLine('/Subject (' + TppPDFUtils.ProcessText(Subject) + ') >>');
  WriteLine('endobj');
end;

procedure TppPDFInfo.SetAuthor(const Value: String);
begin
  FAuthor := Value;
end;

procedure TppPDFInfo.SetKeywords(const Value: String);
begin
  FKeywords := Value;
end;

procedure TppPDFInfo.SetSubject(const Value: String);
begin
  FSubject := Value;
end;

procedure TppPDFInfo.SetTitle(const Value: String);
begin
  FTitle := Value;
end;


end.
