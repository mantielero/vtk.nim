## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkISIReader.h
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
##  @class   vtkISIReader
##  @brief   reader for ISI files
##
##
##  ISI is a tagged format for expressing bibliographic citations.  Data is
##  structured as a collection of records with each record composed of
##  one-to-many fields.  See
##
##  http://isibasic.com/help/helpprn.html#dialog_export_format
##
##  for details.  vtkISIReader will convert an ISI file into a vtkTable, with
##  the set of table columns determined dynamically from the contents of the
##  file.
##

## !!!Ignored construct:  # vtkISIReader_h [NewLine] # vtkISIReader_h [NewLine] # vtkIOInfovisModule.h  For export macro # vtkTableAlgorithm.h [NewLine] class vtkTable ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOINFOVIS_EXPORT vtkISIReader : public vtkTableAlgorithm { public : static vtkISIReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkISIReader :: IsTypeOf ( type ) ; } static vtkISIReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkISIReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkISIReader * NewInstance ( ) const { return vtkISIReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkISIReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkISIReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/get the file to load
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Set/get the delimiter to be used for concatenating field data (default: ";")
##  virtual char * GetDelimiter ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Delimiter  of  << ( this -> Delimiter ? this -> Delimiter : (null) ) ) ; return this -> Delimiter ; } ; virtual void SetDelimiter ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Delimiter  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Delimiter == nullptr && _arg == nullptr ) { return ; } if ( this -> Delimiter && _arg && ( ! strcmp ( this -> Delimiter , _arg ) ) ) { return ; } delete [ ] this -> Delimiter ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Delimiter = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Delimiter = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Set/get the maximum number of records to read from the file (zero = unlimited)
##  virtual int GetMaxRecords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxRecords  of  << this -> MaxRecords ) ; return this -> MaxRecords ; } ; virtual void SetMaxRecords ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxRecords  to  << _arg ) ; if ( this -> MaxRecords != _arg ) { this -> MaxRecords = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkISIReader ( ) ; ~ vtkISIReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; char * Delimiter ; int MaxRecords ; private : vtkISIReader ( const vtkISIReader & ) = delete ; void operator = ( const vtkISIReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
