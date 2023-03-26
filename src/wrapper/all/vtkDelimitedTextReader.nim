## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDelimitedTextReader.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkDelimitedTextReader
##  @brief   reads in delimited ascii or unicode text files
##  and outputs a vtkTable data structure.
##
##
##  vtkDelimitedTextReader is an interface for pulling in data from a
##  flat, delimited ascii or unicode text file (delimiter can be any character).
##
##  The behavior of the reader with respect to ascii or unicode input
##  is controlled by the SetUnicodeCharacterSet() method.  By default
##  (without calling SetUnicodeCharacterSet()), the reader will expect
##  to read ascii text and will output vtkStdString columns.  Use the
##  Set and Get methods to set delimiters that do not contain UTF8 in
##  the name when operating the reader in default ascii mode.  If the
##  SetUnicodeCharacterSet() method is called, the reader will output
##  vtkStdString columns in the output table.  In addition, it is
##  necessary to use the Set and Get methods that contain UTF8 in the
##  name to specify delimiters when operating in unicode mode.
##
##  There is also a special character set US-ASCII-WITH-FALLBACK that
##  will treat the input text as ASCII no matter what.  If and when it
##  encounters a character with its 8th bit set it will replace that
##  character with the code point ReplacementCharacter.  You may use
##  this if you have text that belongs to a code page like LATIN9 or
##  ISO-8859-1 or friends: mostly ASCII but not entirely.  Eventually
##  this class will acquire the ability to read gracefully text from
##  any code page, making this option obsolete.
##
##  This class emits ProgressEvent for every 100 lines it reads.
##
##  @par Thanks:
##  Thanks to Andy Wilson, Brian Wylie, Tim Shead, and Thomas Otahal
##  from Sandia National Laboratories for implementing this class.
##
##
##  @warning
##  This reader assumes that the first line in the file (whether that's
##  headers or the first document) contains at least as many fields as
##  any other line in the file.
##

## !!!Ignored construct:  # vtkDelimitedTextReader_h [NewLine] # vtkDelimitedTextReader_h [NewLine] # vtkIOInfovisModule.h  For export macro # vtkStdString.h  Needed for vtkStdString # vtkTableAlgorithm.h [NewLine] class VTKIOINFOVIS_EXPORT vtkDelimitedTextReader : public vtkTableAlgorithm { public : static vtkDelimitedTextReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDelimitedTextReader :: IsTypeOf ( type ) ; } static vtkDelimitedTextReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDelimitedTextReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDelimitedTextReader * NewInstance ( ) const { return vtkDelimitedTextReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDelimitedTextReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDelimitedTextReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specifies the delimited text file to be loaded.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Specify the InputString for use when reading from a character array.
##  Optionally include the length for binary strings. Note that a copy
##  of the string is made and stored. If this causes exceedingly large
##  memory consumption, consider using InputArray instead.
##  void SetInputString ( const char * in ) ; virtual char * GetInputString ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << InputString  of  << ( this -> InputString ? this -> InputString : (null) ) ) ; return this -> InputString ; } ; void SetInputString ( const char * in , int len ) ; virtual int GetInputStringLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputStringLength  of  << this -> InputStringLength ) ; return this -> InputStringLength ; } ; void SetInputString ( const vtkStdString & input ) { this -> SetInputString ( input . c_str ( ) , static_cast < int > ( input . length ( ) ) ) ; } /@} /@{ *
##  Enable reading from an InputString or InputArray instead of the default,
##  a file.
##  virtual void SetReadFromInputString ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadFromInputString  to  << _arg ) ; if ( this -> ReadFromInputString != _arg ) { this -> ReadFromInputString = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetInputStringLengthReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ; virtual void ReadFromInputStringOn ( ) { this -> SetReadFromInputString ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReadFromInputStringOff ( ) { this -> SetReadFromInputString ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specifies the character set used in the input file.  Valid character set
##  names will be drawn from the list maintained by the Internet Assigned Name
##  Authority at
##
##  http://www.iana.org/assignments/character-sets
##
##  Where multiple aliases are provided for a character set, the preferred MIME name
##  will be used.  vtkUnicodeDelimitedTextReader currently supports "US-ASCII", "UTF-8",
##  "UTF-16", "UTF-16BE", and "UTF-16LE" character sets.
##  virtual char * GetInputStringUnicodeCharacterSet ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << UnicodeCharacterSet  of  << ( this -> UnicodeCharacterSet ? this -> UnicodeCharacterSet : (null) ) ) ; return this -> UnicodeCharacterSet ; } ; virtual void SetUnicodeCharacterSet ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << UnicodeCharacterSet  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> UnicodeCharacterSet == nullptr && _arg == nullptr ) { return ; } if ( this -> UnicodeCharacterSet && _arg && ( ! strcmp ( this -> UnicodeCharacterSet , _arg ) ) ) { return ; } delete [ ] this -> UnicodeCharacterSet ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> UnicodeCharacterSet = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> UnicodeCharacterSet = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Specify the character(s) that will be used to separate records.
##  The order of characters in the string does not matter.  Defaults
##  to "\r\n".
##  void SetUTF8RecordDelimiters ( const char * delimiters ) ; const char * GetUTF8RecordDelimiters ( ) ; /@} /@{ *
##  Specify the character(s) that will be used to separate fields.  For
##  example, set this to "," for a comma-separated value file.  Set
##  it to ".:;" for a file where columns can be separated by a
##  period, colon or semicolon.  The order of the characters in the
##  string does not matter.  Defaults to a comma.
##  virtual void SetUnicodeCharacterSetFieldDelimiterCharacters ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FieldDelimiterCharacters  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FieldDelimiterCharacters == nullptr && _arg == nullptr ) { return ; } if ( this -> FieldDelimiterCharacters && _arg && ( ! strcmp ( this -> FieldDelimiterCharacters , _arg ) ) ) { return ; } delete [ ] this -> FieldDelimiterCharacters ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FieldDelimiterCharacters = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FieldDelimiterCharacters = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetInputStringUnicodeCharacterSetFieldDelimiterCharacters ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << FieldDelimiterCharacters  of  << ( this -> FieldDelimiterCharacters ? this -> FieldDelimiterCharacters : (null) ) ) ; return this -> FieldDelimiterCharacters ; } ; /@} void SetUTF8FieldDelimiters ( const char * delimiters ) ; const char * GetUTF8FieldDelimiters ( ) ; /@{ *
##  Get/set the character that will begin and end strings.  Microsoft
##  Excel, for example, will export the following format:
##
##  "First Field","Second Field","Field, With, Commas","Fourth Field"
##
##  The third field has a comma in it.  By using a string delimiter,
##  this will be correctly read.  The delimiter defaults to '"'.
##  virtual char GetInputStringLengthReadFromInputStringStringDelimiter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StringDelimiter  of  << this -> StringDelimiter ) ; return this -> StringDelimiter ; } ; virtual void SetReadFromInputStringStringDelimiter ( char _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StringDelimiter  to  << _arg ) ; if ( this -> StringDelimiter != _arg ) { this -> StringDelimiter = _arg ; this -> Modified ( ) ; } } ; /@} void SetUTF8StringDelimiters ( const char * delimiters ) ; const char * GetUTF8StringDelimiters ( ) ; /@{ *
##  Set/get whether to use the string delimiter.  Defaults to on.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiter ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseStringDelimiter  to  << _arg ) ; if ( this -> UseStringDelimiter != _arg ) { this -> UseStringDelimiter = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseStringDelimiter  of  << this -> UseStringDelimiter ) ; return this -> UseStringDelimiter ; } ; virtual void UseStringDelimiterOn ( ) { this -> SetReadFromInputStringUseStringDelimiter ( static_cast < bool > ( 1 ) ) ; } virtual void UseStringDelimiterOff ( ) { this -> SetReadFromInputStringUseStringDelimiter ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get whether to treat the first line of the file as headers.
##  The default is false (no headers).
##  virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeaders ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HaveHeaders  of  << this -> HaveHeaders ) ; return this -> HaveHeaders ; } ; virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeaders ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HaveHeaders  to  << _arg ) ; if ( this -> HaveHeaders != _arg ) { this -> HaveHeaders = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Set/get whether to merge successive delimiters.  Use this if (for
##  example) your fields are separated by spaces but you don't know
##  exactly how many.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimiters ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MergeConsecutiveDelimiters  to  << _arg ) ; if ( this -> MergeConsecutiveDelimiters != _arg ) { this -> MergeConsecutiveDelimiters = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimiters ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergeConsecutiveDelimiters  of  << this -> MergeConsecutiveDelimiters ) ; return this -> MergeConsecutiveDelimiters ; } ; virtual void MergeConsecutiveDelimitersOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimiters ( static_cast < bool > ( 1 ) ) ; } virtual void MergeConsecutiveDelimitersOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimiters ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specifies the maximum number of records to read from the file.  Limiting the
##  number of records to read is useful for previewing the contents of a file.
##  virtual vtkIdType GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxRecords  of  << this -> MaxRecords ) ; return this -> MaxRecords ; } ; virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecords ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxRecords  to  << _arg ) ; if ( this -> MaxRecords != _arg ) { this -> MaxRecords = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  When set to true, the reader will detect numeric columns and create
##  vtkDoubleArray or vtkIntArray for those instead of vtkStringArray. Default
##  is off.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumns ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DetectNumericColumns  to  << _arg ) ; if ( this -> DetectNumericColumns != _arg ) { this -> DetectNumericColumns = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumns ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DetectNumericColumns  of  << this -> DetectNumericColumns ) ; return this -> DetectNumericColumns ; } ; virtual void DetectNumericColumnsOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumns ( static_cast < bool > ( 1 ) ) ; } virtual void DetectNumericColumnsOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumns ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When set to true and DetectNumericColumns is also true, forces all
##  numeric columns to vtkDoubleArray even if they contain only
##  integer values. Default is off.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDouble ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForceDouble  to  << _arg ) ; if ( this -> ForceDouble != _arg ) { this -> ForceDouble = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDouble ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceDouble  of  << this -> ForceDouble ) ; return this -> ForceDouble ; } ; virtual void ForceDoubleOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDouble ( static_cast < bool > ( 1 ) ) ; } virtual void ForceDoubleOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDouble ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When DetectNumericColumns is set to true, whether to trim whitespace from
##  strings prior to conversion to a numeric.
##  Default is false to preserve backward compatibility.
##
##  vtkVariant handles whitespace inconsistently, so trim it before we try to
##  convert it.  For example:
##
##  vtkVariant("  2.0").ToDouble() == 2.0 <-- leading whitespace is not a problem
##  vtkVariant("  2.0  ").ToDouble() == NaN <-- trailing whitespace is a problem
##  vtkVariant("  infinity  ").ToDouble() == NaN <-- any whitespace is a problem
##
##  In these cases, trimming the whitespace gives us the result we expect:
##  2.0 and INF respectively.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversion ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TrimWhitespacePriorToNumericConversion  to  << _arg ) ; if ( this -> TrimWhitespacePriorToNumericConversion != _arg ) { this -> TrimWhitespacePriorToNumericConversion = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TrimWhitespacePriorToNumericConversion  of  << this -> TrimWhitespacePriorToNumericConversion ) ; return this -> TrimWhitespacePriorToNumericConversion ; } ; virtual void TrimWhitespacePriorToNumericConversionOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversion ( static_cast < bool > ( 1 ) ) ; } virtual void TrimWhitespacePriorToNumericConversionOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversion ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When DetectNumericColumns is set to true, the reader use this value to populate
##  the vtkIntArray where empty strings are found. Default is 0.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValue ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DefaultIntegerValue  to  << _arg ) ; if ( this -> DefaultIntegerValue != _arg ) { this -> DefaultIntegerValue = _arg ; this -> Modified ( ) ; } } ; virtual int GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultIntegerValue  of  << this -> DefaultIntegerValue ) ; return this -> DefaultIntegerValue ; } ; /@} /@{ *
##  When DetectNumericColumns is set to true, the reader use this value to populate
##  the vtkDoubleArray where empty strings are found. Default is 0.0
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DefaultDoubleValue  to  << _arg ) ; if ( this -> DefaultDoubleValue != _arg ) { this -> DefaultDoubleValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultDoubleValue  of  << this -> DefaultDoubleValue ) ; return this -> DefaultDoubleValue ; } ; /@} /@{ *
##  The name of the array for generating or assigning pedigree ids
##  (default "id").
##  virtual void SetUnicodeCharacterSetFieldDelimiterCharactersPedigreeIdArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PedigreeIdArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> PedigreeIdArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> PedigreeIdArrayName && _arg && ( ! strcmp ( this -> PedigreeIdArrayName , _arg ) ) ) { return ; } delete [ ] this -> PedigreeIdArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> PedigreeIdArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> PedigreeIdArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetInputStringUnicodeCharacterSetFieldDelimiterCharactersPedigreeIdArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PedigreeIdArrayName  of  << ( this -> PedigreeIdArrayName ? this -> PedigreeIdArrayName : (null) ) ) ; return this -> PedigreeIdArrayName ; } ; /@} /@{ *
##  If on (default), generates pedigree ids automatically.
##  If off, assign one of the arrays to be the pedigree id.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePedigreeIds  to  << _arg ) ; if ( this -> GeneratePedigreeIds != _arg ) { this -> GeneratePedigreeIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePedigreeIds  of  << this -> GeneratePedigreeIds ) ; return this -> GeneratePedigreeIds ; } ; virtual void GeneratePedigreeIdsOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionGeneratePedigreeIds ( static_cast < bool > ( 1 ) ) ; } virtual void GeneratePedigreeIdsOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionGeneratePedigreeIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, assigns pedigree ids to output. Defaults to off.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIdsOutputPedigreeIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPedigreeIds  to  << _arg ) ; if ( this -> OutputPedigreeIds != _arg ) { this -> OutputPedigreeIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIdsOutputPedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPedigreeIds  of  << this -> OutputPedigreeIds ) ; return this -> OutputPedigreeIds ; } ; virtual void OutputPedigreeIdsOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionGeneratePedigreeIdsOutputPedigreeIds ( static_cast < bool > ( 1 ) ) ; } virtual void OutputPedigreeIdsOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionGeneratePedigreeIdsOutputPedigreeIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, also add in the tab (i.e. \c '\\t') character as a field delimiter.
##  We add this specially since applications may have a more
##  difficult time doing this. Defaults to off.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIdsOutputPedigreeIdsAddTabFieldDelimiter ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AddTabFieldDelimiter  to  << _arg ) ; if ( this -> AddTabFieldDelimiter != _arg ) { this -> AddTabFieldDelimiter = _arg ; this -> Modified ( ) ; } } ; virtual bool GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIdsOutputPedigreeIdsAddTabFieldDelimiter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AddTabFieldDelimiter  of  << this -> AddTabFieldDelimiter ) ; return this -> AddTabFieldDelimiter ; } ; virtual void AddTabFieldDelimiterOn ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionGeneratePedigreeIdsOutputPedigreeIdsAddTabFieldDelimiter ( static_cast < bool > ( 1 ) ) ; } virtual void AddTabFieldDelimiterOff ( ) { this -> SetReadFromInputStringUseStringDelimiterMergeConsecutiveDelimitersDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionGeneratePedigreeIdsOutputPedigreeIdsAddTabFieldDelimiter ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Returns a human-readable description of the most recent error, if any.
##  Otherwise, returns an empty string.  Note that the result is only valid
##  after calling Update().
##  vtkStdString GetLastError ( ) ; /@{ *
##  Fallback character for use in the US-ASCII-WITH-FALLBACK
##  character set.  Any characters that have their 8th bit set will
##  be replaced with this code point.  Defaults to 'x'.
##  virtual void SetReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIdsOutputPedigreeIdsAddTabFieldDelimiterReplacementCharacter ( vtkTypeUInt32 _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReplacementCharacter  to  << _arg ) ; if ( this -> ReplacementCharacter != _arg ) { this -> ReplacementCharacter = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeUInt32 GetInputStringLengthReadFromInputStringStringDelimiterUseStringDelimiterHaveHeadersMergeConsecutiveDelimitersMaxRecordsDetectNumericColumnsForceDoubleTrimWhitespacePriorToNumericConversionDefaultIntegerValueDefaultDoubleValueGeneratePedigreeIdsOutputPedigreeIdsAddTabFieldDelimiterReplacementCharacter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReplacementCharacter  of  << this -> ReplacementCharacter ) ; return this -> ReplacementCharacter ; } ; /@} protected : vtkDelimitedTextReader ( ) ; ~ vtkDelimitedTextReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  Read the content of the input file. int ReadData ( vtkTable * const output_table ) ; char * FileName ; vtkTypeBool ReadFromInputString ; char * InputString ; int InputStringLength ; char * UnicodeCharacterSet ; vtkIdType MaxRecords ; std :: string UnicodeRecordDelimiters ; std :: string UnicodeFieldDelimiters ; std :: string UnicodeStringDelimiters ; std :: string UnicodeWhitespace ; std :: string UnicodeEscapeCharacter ; bool DetectNumericColumns ; bool ForceDouble ; bool TrimWhitespacePriorToNumericConversion ; int DefaultIntegerValue ; double DefaultDoubleValue ; char * FieldDelimiterCharacters ; char StringDelimiter ; bool UseStringDelimiter ; bool HaveHeaders ; bool MergeConsecutiveDelimiters ; char * PedigreeIdArrayName ; bool GeneratePedigreeIds ; bool OutputPedigreeIds ; bool AddTabFieldDelimiter ; vtkStdString LastError ; vtkTypeUInt32 ReplacementCharacter ; private : vtkDelimitedTextReader ( const vtkDelimitedTextReader & ) = delete ; void operator = ( const vtkDelimitedTextReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
