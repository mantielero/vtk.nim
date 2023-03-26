## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridReader.h
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
##  @class   vtkUnstructuredGridReader
##  @brief   read vtk unstructured grid data file
##
##  vtkUnstructuredGridReader is a source object that reads ASCII or binary
##  unstructured grid data files in vtk format. (see text for format details).
##  The output of this reader is a single vtkUnstructuredGrid data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkUnstructuredGrid vtkDataReader
##

## !!!Ignored construct:  # vtkUnstructuredGridReader_h [NewLine] # vtkUnstructuredGridReader_h [NewLine] # vtkDataReader.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkUnstructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkUnstructuredGridReader : public vtkDataReader { public : static vtkUnstructuredGridReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridReader :: IsTypeOf ( type ) ; } static vtkUnstructuredGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridReader * NewInstance ( ) const { return vtkUnstructuredGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output of this reader.
##  vtkUnstructuredGrid * GetOutput ( ) ; vtkUnstructuredGrid * GetOutput ( int idx ) ; void SetOutput ( vtkUnstructuredGrid * output ) ; /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ; protected : vtkUnstructuredGridReader ( ) ; ~ vtkUnstructuredGridReader ( ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkUnstructuredGridReader ( const vtkUnstructuredGridReader & ) = delete ; void operator = ( const vtkUnstructuredGridReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
