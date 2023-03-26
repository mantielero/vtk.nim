## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectReader.h
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
##  @class   vtkDataObjectReader
##  @brief   read vtk field data file
##
##  vtkDataObjectReader is a source object that reads ASCII or binary field
##  data files in vtk format. Fields are general matrix structures used
##  represent complex data. (See text for format details).  The output of this
##  reader is a single vtkDataObject.  The superclass of this class,
##  vtkDataReader, provides many methods for controlling the reading of the
##  data file, see vtkDataReader for more information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkFieldData vtkDataObjectWriter
##

## !!!Ignored construct:  # vtkDataObjectReader_h [NewLine] # vtkDataObjectReader_h [NewLine] # vtkDataReader.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkDataObject ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkDataObjectReader : public vtkDataReader { public : static vtkDataObjectReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkDataObjectReader :: IsTypeOf ( type ) ; } static vtkDataObjectReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkDataObjectReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkDataObjectReader * NewInstance ( ) const { return vtkDataObjectReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObjectReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObjectReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output field of this reader.
##  vtkDataObject * GetOutput ( ) ; vtkDataObject * GetOutput ( int idx ) ; void SetOutput ( vtkDataObject * ) ; /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ; protected : vtkDataObjectReader ( ) ; ~ vtkDataObjectReader ( ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkDataObjectReader ( const vtkDataObjectReader & ) = delete ; void operator = ( const vtkDataObjectReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
