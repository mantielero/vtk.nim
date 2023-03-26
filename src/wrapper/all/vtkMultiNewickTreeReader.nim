## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiNewickTreeReader.h
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
##  @class   vtkMultiNewickTreeReader
##  @brief   read multiple vtkTrees from Newick formatted file
##
##  vtkMultiNewickTreeReader is a source object that reads Newick tree format
##  files.
##  The output of this reader is a single vtkMultiPieceDataSet that contains multiple vtkTree
##  objects. The superclass of this class, vtkDataReader, provides many methods for controlling the
##  reading of the data file, see vtkDataReader for more information.
##  @sa
##  vtkTree vtkDataReader
##

## !!!Ignored construct:  # vtkMultiNewickTreeReader_h [NewLine] # vtkMultiNewickTreeReader_h [NewLine] # vtkDataReader.h [NewLine] # vtkIOInfovisModule.h  For export macro [NewLine] class vtkMultiPieceDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkNewickTreeReader"
## !!!Ignored construct:  class VTKIOINFOVIS_EXPORT vtkMultiNewickTreeReader : public vtkDataReader { public : static vtkMultiNewickTreeReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataReader Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataReader :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMultiNewickTreeReader :: IsTypeOf ( type ) ; } static vtkMultiNewickTreeReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMultiNewickTreeReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMultiNewickTreeReader * NewInstance ( ) const { return vtkMultiNewickTreeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiNewickTreeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiNewickTreeReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output of this reader.
##  vtkMultiPieceDataSet * GetOutput ( ) ; vtkMultiPieceDataSet * GetOutput ( int idx ) ; void SetOutput ( vtkMultiPieceDataSet * output ) ; /@} *
##  Actual reading happens here
##  int ReadMeshSimple ( VTK_FILEPATH const std :: string & fname , vtkDataObject * output ) override ; protected : vtkMultiNewickTreeReader ( ) ; ~ vtkMultiNewickTreeReader ( ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; private : vtkMultiNewickTreeReader ( const vtkMultiNewickTreeReader & ) = delete ; void operator = ( const vtkMultiNewickTreeReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
