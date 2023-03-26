## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectWriter.h
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
##  @class   vtkDataObjectWriter
##  @brief   write vtk field data
##
##  vtkDataObjectWriter is a source object that writes ASCII or binary
##  field data files in vtk format. Field data is a general form of data in
##  matrix form.
##
##  @warning
##  Binary files written on one system may not be readable on other systems.
##
##  @sa
##  vtkFieldData vtkFieldDataReader
##

## !!!Ignored construct:  # vtkDataObjectWriter_h [NewLine] # vtkDataObjectWriter_h [NewLine] # vtkDataWriter.h  Needs data because it calls methods on it # vtkIOLegacyModule.h  For export macro # vtkStdString.h  For string used in api # vtkWriter.h [NewLine] class VTKIOLEGACY_EXPORT vtkDataObjectWriter : public vtkWriter { public : static vtkDataObjectWriter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWriter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWriter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataObjectWriter :: IsTypeOf ( type ) ; } static vtkDataObjectWriter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataObjectWriter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataObjectWriter * NewInstance ( ) const { return vtkDataObjectWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObjectWriter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Methods delegated to vtkDataWriter, see vtkDataWriter.
##  void SetFileName ( VTK_FILEPATH const char * filename ) { this -> Writer -> SetFileName ( filename ) ; } VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { return this -> Writer -> GetFileName ( ) ; } void SetHeader ( const char * header ) { this -> Writer -> SetHeader ( header ) ; } char * GetHeader ( ) { return this -> Writer -> GetHeader ( ) ; } void SetFileType ( int type ) { this -> Writer -> SetFileType ( type ) ; } int GetFileType ( ) { return this -> Writer -> GetFileType ( ) ; } void SetFileTypeToASCII ( ) { this -> Writer -> SetFileType ( VTK_ASCII ) ; } void SetFileTypeToBinary ( ) { this -> Writer -> SetFileType ( VTK_BINARY ) ; } void SetWriteToOutputString ( int b ) { this -> Writer -> SetWriteToOutputString ( b ) ; } void WriteToOutputStringOn ( ) { this -> Writer -> WriteToOutputStringOn ( ) ; } void WriteToOutputStringOff ( ) { this -> Writer -> WriteToOutputStringOff ( ) ; } int GetWriteToOutputString ( ) { return this -> Writer -> GetWriteToOutputString ( ) ; } char * GetOutputString ( ) { return this -> Writer -> GetOutputString ( ) ; } vtkStdString GetOutputStdString ( ) { return this -> Writer -> GetOutputStdString ( ) ; } vtkIdType GetOutputStringLength ( ) { return this -> Writer -> GetOutputStringLength ( ) ; } unsigned char * GetBinaryOutputString ( ) { return this -> Writer -> GetBinaryOutputString ( ) ; } void SetFieldDataName ( const char * fieldname ) { this -> Writer -> SetFieldDataName ( fieldname ) ; } char * GetFieldDataName ( ) { return this -> Writer -> GetFieldDataName ( ) ; } /@} protected : vtkDataObjectWriter ( ) ; ~ vtkDataObjectWriter ( ) override ; void WriteData ( ) override ; vtkDataWriter * Writer ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkDataObjectWriter ( const vtkDataObjectWriter & ) = delete ; void operator = ( const vtkDataObjectWriter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
