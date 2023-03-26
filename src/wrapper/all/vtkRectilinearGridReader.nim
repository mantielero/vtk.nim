## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridReader.h
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
##  @class   vtkRectilinearGridReader
##  @brief   read vtk rectilinear grid data file
##
##  vtkRectilinearGridReader is a source object that reads ASCII or binary
##  rectilinear grid data files in vtk format (see text for format details).
##  The output of this reader is a single vtkRectilinearGrid data object.
##  The superclass of this class, vtkDataReader, provides many methods for
##  controlling the reading of the data file, see vtkDataReader for more
##  information.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  @sa
##  vtkRectilinearGrid vtkDataReader
##

## !!!Ignored construct:  # vtkRectilinearGridReader_h [NewLine] # vtkRectilinearGridReader_h [NewLine] # vtkDataReader.h [NewLine] # vtkIOLegacyModule.h  For export macro [NewLine] class vtkRectilinearGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIOLEGACY_EXPORT vtkRectilinearGridReader : public vtkDataReader { public : static vtkRectilinearGridReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRectilinearGridReader :: IsTypeOf ( type ) ; } static vtkRectilinearGridReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRectilinearGridReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRectilinearGridReader * NewInstance ( ) const { return vtkRectilinearGridReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get and set the output of this reader.
##  vtkRectilinearGrid * GetOutput ( ) ; vtkRectilinearGrid * GetOutput ( int idx ) ; void SetOutput ( vtkRectilinearGrid * output ) ; /@} *
##  Read the meta information from the file (WHOLE_EXTENT).
##  int ReadMetaDataSimple ( VTK_FILEPATH const std :: string & fname , vtkInformation * metadata ) override ; *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ; protected : vtkRectilinearGridReader ( ) ; ~ vtkRectilinearGridReader ( ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkRectilinearGridReader ( const vtkRectilinearGridReader & ) = delete ; void operator = ( const vtkRectilinearGridReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
