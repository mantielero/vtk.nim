## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataReader.h
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
##  @class   vtkPolyDataReader
##  @brief   read vtk polygonal data file
##
##  vtkPolyDataReader is a source object that reads ASCII or binary
##  polygonal data files in vtk format (see text for format details).
##  The output of this reader is a single vtkPolyData data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkPolyData vtkDataReader
##

## !!!Ignored construct:  # vtkPolyDataReader_h [NewLine] # vtkPolyDataReader_h [NewLine] # vtkDataReader.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkPolyDataReader : public vtkDataReader { public : static vtkPolyDataReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataReader :: IsTypeOf ( type ) ; } static vtkPolyDataReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataReader * NewInstance ( ) const { return vtkPolyDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output of this reader.
##  vtkPolyData * GetOutput ( ) ; vtkPolyData * GetOutput ( int idx ) ; void SetOutput ( vtkPolyData * output ) ; /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ; protected : vtkPolyDataReader ( ) ; ~ vtkPolyDataReader ( ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkPolyDataReader ( const vtkPolyDataReader & ) = delete ; void operator = ( const vtkPolyDataReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
