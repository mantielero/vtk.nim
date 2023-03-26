## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiPieceDataSet.h
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
##  @class   vtkMultiPieceDataSet
##  @brief   composite dataset to encapsulates pieces of
##  dataset.
##
##  A vtkMultiPieceDataSet dataset groups multiple data pieces together.
##  For example, say that a simulation broke a volume into 16 piece so that
##  each piece can be processed with 1 process in parallel. We want to load
##  this volume in a visualization cluster of 4 nodes. Each node will get 4
##  pieces, not necessarily forming a whole rectangular piece. In this case,
##  it is not possible to append the 4 pieces together into a vtkImageData.
##  In this case, these 4 pieces can be collected together using a
##  vtkMultiPieceDataSet.
##  Note that vtkMultiPieceDataSet is intended to be included in other composite
##  datasets eg. vtkMultiBlockDataSet, vtkHierarchicalBoxDataSet. Hence the lack
##  of algorithms producing vtkMultiPieceDataSet.
##

## !!!Ignored construct:  # vtkMultiPieceDataSet_h [NewLine] # vtkMultiPieceDataSet_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkPartitionedDataSet.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkMultiPieceDataSet : public vtkPartitionedDataSet { public : static vtkMultiPieceDataSet * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPartitionedDataSet Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPartitionedDataSet :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMultiPieceDataSet :: IsTypeOf ( type ) ; } static vtkMultiPieceDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMultiPieceDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMultiPieceDataSet * NewInstance ( ) const { return vtkMultiPieceDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPartitionedDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiPieceDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiPieceDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return class name of data type (see vtkType.h for
##  definitions).
##  int GetDataObjectType ( ) override { return VTK_MULTIPIECE_DATA_SET ; } *
##  Set the number of pieces. This will cause allocation if the new number of
##  pieces is greater than the current size. All new pieces are initialized to
##  null.
##  void SetNumberOfPieces ( unsigned int numpieces ) { this -> SetNumberOfPartitions ( numpieces ) ; } *
##  Returns the number of pieces.
##  unsigned int GetNumberOfPieces ( ) { return this -> GetNumberOfPartitions ( ) ; } /@{ *
##  Returns the piece at the given index.
##  vtkDataSet * GetPiece ( unsigned int pieceno ) { return this -> GetPartition ( pieceno ) ; } vtkDataObject * GetPieceAsDataObject ( unsigned int pieceno ) { return this -> GetPartitionAsDataObject ( pieceno ) ; } /@} *
##  Sets the data object as the given piece. The total number of pieces will
##  be resized to fit the requested piece no.
##  void SetPiece ( unsigned int pieceno , vtkDataObject * piece ) { this -> SetPartition ( pieceno , piece ) ; } /@{ *
##  Retrieve an instance of this class from an information object.
##  static vtkMultiPieceDataSet * GetData ( vtkInformation * info ) ; static vtkMultiPieceDataSet * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} protected : vtkMultiPieceDataSet ( ) ; ~ vtkMultiPieceDataSet ( ) override ; private : vtkMultiPieceDataSet ( const vtkMultiPieceDataSet & ) = delete ; void operator = ( const vtkMultiPieceDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!