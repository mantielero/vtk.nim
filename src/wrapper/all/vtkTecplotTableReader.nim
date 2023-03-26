## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTecplotTableReader.h
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
##   Copyright 2016 Menno Deij - van Rijswijk (MARIN)
## -------------------------------------------------------------------------
## *
##  @class   vtkTecplotTableReader
##  @brief   reads in Tecplot tabular data
##  and outputs a vtkTable data structure.
##
##
##  vtkTecplotTableReader is an interface for reading tabulat data in Tecplot
##  ascii format.
##
##  @par Thanks:
##  Thanks to vtkDelimitedTextReader authors.
##
##

## !!!Ignored construct:  # vtkTecplotTableReader_h [NewLine] # vtkTecplotTableReader_h [NewLine] # vtkIOTecplotTableModule.h  For export macro # vtkStdString.h  Needed for vtkStdString # vtkTableAlgorithm.h [NewLine] class VTKIOTECPLOTTABLE_EXPORT vtkTecplotTableReader : public vtkTableAlgorithm { public : static vtkTecplotTableReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTecplotTableReader :: IsTypeOf ( type ) ; } static vtkTecplotTableReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTecplotTableReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTecplotTableReader * NewInstance ( ) const { return vtkTecplotTableReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTecplotTableReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTecplotTableReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specifies the delimited text file to be loaded.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Specifies the maximum number of records to read from the file.  Limiting the
##  number of records to read is useful for previewing the contents of a file.
##  virtual vtkIdType GetMaxRecords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxRecords  of  << this -> MaxRecords ) ; return this -> MaxRecords ; } ; virtual void SetMaxRecords ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxRecords  to  << _arg ) ; if ( this -> MaxRecords != _arg ) { this -> MaxRecords = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Specifies the number of lines that form the header of the file. Default is 2.
##  virtual vtkIdType GetMaxRecordsHeaderLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HeaderLines  of  << this -> HeaderLines ) ; return this -> HeaderLines ; } ; virtual void SetMaxRecordsHeaderLines ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HeaderLines  to  << _arg ) ; if ( this -> HeaderLines != _arg ) { this -> HeaderLines = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Specifies the line number that holds the column names. Default is 1.
##  virtual vtkIdType GetMaxRecordsHeaderLinesColumnNamesOnLine ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColumnNamesOnLine  of  << this -> ColumnNamesOnLine ) ; return this -> ColumnNamesOnLine ; } ; virtual void SetMaxRecordsHeaderLinesColumnNamesOnLine ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ColumnNamesOnLine  to  << _arg ) ; if ( this -> ColumnNamesOnLine != _arg ) { this -> ColumnNamesOnLine = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Specifies the number of fields to skip while reading the column names. Default is 1.
##  virtual vtkIdType GetMaxRecordsHeaderLinesColumnNamesOnLineSkipColumnNames ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SkipColumnNames  of  << this -> SkipColumnNames ) ; return this -> SkipColumnNames ; } ; virtual void SetMaxRecordsHeaderLinesColumnNamesOnLineSkipColumnNames ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SkipColumnNames  to  << _arg ) ; if ( this -> SkipColumnNames != _arg ) { this -> SkipColumnNames = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  The name of the array for generating or assigning pedigree ids
##  (default "id").
##  virtual void SetPedigreeIdArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << PedigreeIdArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> PedigreeIdArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> PedigreeIdArrayName && _arg && ( ! strcmp ( this -> PedigreeIdArrayName , _arg ) ) ) { return ; } delete [ ] this -> PedigreeIdArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> PedigreeIdArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> PedigreeIdArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetPedigreeIdArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << PedigreeIdArrayName  of  << ( this -> PedigreeIdArrayName ? this -> PedigreeIdArrayName : (null) ) ) ; return this -> PedigreeIdArrayName ; } ; /@} /@{ *
##  If on (default), generates pedigree ids automatically.
##  If off, assign one of the arrays to be the pedigree id.
##  virtual void SetMaxRecordsHeaderLinesColumnNamesOnLineSkipColumnNamesGeneratePedigreeIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GeneratePedigreeIds  to  << _arg ) ; if ( this -> GeneratePedigreeIds != _arg ) { this -> GeneratePedigreeIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMaxRecordsHeaderLinesColumnNamesOnLineSkipColumnNamesGeneratePedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePedigreeIds  of  << this -> GeneratePedigreeIds ) ; return this -> GeneratePedigreeIds ; } ; virtual void GeneratePedigreeIdsOn ( ) { this -> SetGeneratePedigreeIds ( static_cast < bool > ( 1 ) ) ; } virtual void GeneratePedigreeIdsOff ( ) { this -> SetGeneratePedigreeIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  If on, assigns pedigree ids to output. Defaults to off.
##  virtual void SetMaxRecordsHeaderLinesColumnNamesOnLineSkipColumnNamesGeneratePedigreeIdsOutputPedigreeIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPedigreeIds  to  << _arg ) ; if ( this -> OutputPedigreeIds != _arg ) { this -> OutputPedigreeIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMaxRecordsHeaderLinesColumnNamesOnLineSkipColumnNamesGeneratePedigreeIdsOutputPedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPedigreeIds  of  << this -> OutputPedigreeIds ) ; return this -> OutputPedigreeIds ; } ; virtual void OutputPedigreeIdsOn ( ) { this -> SetGeneratePedigreeIdsOutputPedigreeIds ( static_cast < bool > ( 1 ) ) ; } virtual void OutputPedigreeIdsOff ( ) { this -> SetGeneratePedigreeIdsOutputPedigreeIds ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Returns a human-readable description of the most recent error, if any.
##  Otherwise, returns an empty string.  Note that the result is only valid
##  after calling Update().
##  vtkStdString GetLastError ( ) ; protected : vtkTecplotTableReader ( ) ; ~ vtkTecplotTableReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; vtkIdType MaxRecords ; vtkIdType HeaderLines ; vtkIdType ColumnNamesOnLine ; vtkIdType SkipColumnNames ; char * PedigreeIdArrayName ; bool GeneratePedigreeIds ; bool OutputPedigreeIds ; vtkStdString LastError ; private : vtkTecplotTableReader ( const vtkTecplotTableReader & ) = delete ; void operator = ( const vtkTecplotTableReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
