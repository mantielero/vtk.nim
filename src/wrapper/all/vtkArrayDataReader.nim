## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayDataReader.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
## *
##  @class   vtkArrayDataReader
##  @brief    Reads vtkArrayData written by vtkArrayDataWriter.
##
##
##  Reads vtkArrayData data written with vtkArrayDataWriter.
##
##  Outputs:
##    Output port 0: vtkArrayData containing a collection of vtkArrays.
##
##  @sa
##  vtkArrayDataWriter
##

## !!!Ignored construct:  # vtkArrayDataReader_h [NewLine] # vtkArrayDataReader_h [NewLine] # vtkArrayDataAlgorithm.h [NewLine] # vtkIOCoreModule.h  For export macro # vtkStdString.h  for vtkStdString [NewLine] class vtkArrayData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOCORE_EXPORT vtkArrayDataReader : public vtkArrayDataAlgorithm { public : static vtkArrayDataReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkArrayDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkArrayDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkArrayDataReader :: IsTypeOf ( type ) ; } static vtkArrayDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkArrayDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkArrayDataReader * NewInstance ( ) const { return vtkArrayDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the filesystem location from which data will be read.
##  virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  The input string to parse. If you set the input string, you must also set
##  the ReadFromInputString flag to parse the string instead of a file.
##  virtual void SetInputString ( const vtkStdString & string ) ; virtual vtkStdString GetInputString ( ) ; /@} /@{ *
##  Whether to read from an input string as opposed to a file, which is the default.
##  virtual void SetReadFromInputString ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReadFromInputString  to  << _arg ) ; if ( this -> ReadFromInputString != _arg ) { this -> ReadFromInputString = _arg ; this -> Modified ( ) ; } } ; virtual bool GetReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ; virtual void ReadFromInputStringOn ( ) { this -> SetReadFromInputString ( static_cast < bool > ( 1 ) ) ; } virtual void ReadFromInputStringOff ( ) { this -> SetReadFromInputString ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Read an arbitrary array from a stream.  Note: you MUST always
##  open streams in binary mode to prevent problems reading files
##  on Windows.
##  static vtkArrayData * Read ( istream & stream ) ; *
##  Read an arbitrary array from a string.
##  static vtkArrayData * Read ( const vtkStdString & str ) ; protected : vtkArrayDataReader ( ) ; ~ vtkArrayDataReader ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * FileName ; vtkStdString InputString ; bool ReadFromInputString ; private : vtkArrayDataReader ( const vtkArrayDataReader & ) = delete ; void operator = ( const vtkArrayDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
