{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2003                    BBBBB   }

unit ppPDFObject;

interface

uses
  Classes;

type

  {@TppPDFObject

    Ancestor to all "PDF" objects and DrawCommand objects that need to be added
    or drawn to the PDF file.  Every PDF object must have a byte offset defined,
    as well as a unique in-line Reference Number.

    All descendents of this object are able to write to the main PDF Stream
    using the WriteLine and WriteMem routines.  If this is content stream
    information and needs to be compressed later, instructions must be written
    using the WriteMSLine routine.

    If adding a ReportBuilder DrawCommand Object that does not require the
    creation of a PDF object, simply set ByteOffset and ReferenceNumber to 0.
    There are four objects that fall in this category...

     - TppPDFLine
     - TppPDFShape
     - TppPDFText
     - TppPDFImage

    All other TppPDFObject descendents require a Reference number and valid
    byte offset. }

  {@TppPDFObject.ByteOffset

    Offset from the beginning of the PDF File Stream in bytes that the object is
    started. This property is modifyable by any descendent of this class. }

  {@TppPDFObject.OutputStream

    Reference to the main Stream of the File Device.  All PDF instructions
    are eventually written to this Stream.  This property is set when
    the Write routine is called. }

  {@TppPDFObject.Offset

    Public property: Offset from the beginning of the PDF Stream in bytes
    that the object is started.  This property is read only. }

  {@TppPDFObject.ReferenceNumber

    Individual unique number identifying every PDF object in the PDF file.  This
    number is set when the Write routine is called. }
    
  TppPDFObject = class
    private
      FOutputStream: TStream;
      FByteOffset: Integer;
      FReferenceNumber: Integer;

      procedure SetByteOffset(const Value: Integer);

    protected
      procedure WriteLine(aLine: String);
      procedure WriteMem(aBuffer: String);
      procedure WriteMSLine(aMemoryStream: TMemoryStream; aLine: String);

      function  ExtToStr(aValue: Extended): String;

      property ByteOffset: Integer read FByteOffset write SetByteOffset;
      property OutputStream: TStream read FOutputStream write FOutputStream;

    public
      constructor Create; virtual;
      
      procedure Write(aOutputStream: TStream; aReferenceNumber: Integer); virtual;

      property Offset: Integer read FByteOffset;
      property ReferenceNumber: Integer read FReferenceNumber;

  end;

implementation

uses
  SysUtils;

{@TppPDFObject.Create

  Creates a new TppPDFObject }

constructor TppPDFObject.Create;
begin
  FOutputStream := nil;
  FByteOffset := 0;
  FReferenceNumber := 0;

end;

function TppPDFObject.ExtToStr(aValue: Extended): String;
begin
  Result := FormatFloat('0.0####', aValue);
  Result := StringReplace(Result, DecimalSeparator, '.', []);
end;

procedure TppPDFObject.SetByteOffset(const Value: Integer);
begin
  FByteOffset := Value;
end;

{@TppPDFObject.Write

  Begin writing object to the PDF File by defining the main Stream, Object
  Reference Number, and Byte Offset.  No PDF instructions will be generated
  until this routine is called.

  The Write routine must be included to every descendent of this class. }

procedure TppPDFObject.Write(aOutputStream: TStream; aReferenceNumber: Integer);
begin
  FOutputStream := aOutputStream;
  FByteOffset := aOutputStream.Position;

  FReferenceNumber := aReferenceNumber;

  {Start New PDF Object...}

end;

{TppPDFObject.WriteLine

  Writes a line of text to the main Device Stream including the Carrage
  Return and Line Feed characters. }

procedure TppPDFObject.WriteLine(aLine: String);
begin
  aLine := aLine + #13 + #10;
  FOutputStream.Write(aLine[1], Length(aLine));

end;

{TppPDFObject.WriteMem

  Writes a line of text ot the main Device Stream without the CRLF
  characters. }

procedure TppPDFObject.WriteMem(aBuffer: String);
begin
  FOutputStream.Write(aBuffer[1], Length(aBuffer));

end;

{TppPDFObject.WriteMSLine

  Writes a line of text to a given MemoryStream including the CRLF characters.}

procedure TppPDFObject.WriteMSLine(aMemoryStream: TMemoryStream; aLine: String);
begin
  aLine := aLine + #13 + #10;
  aMemoryStream.Write(aLine[1], Length(aLine));

end;

end.
