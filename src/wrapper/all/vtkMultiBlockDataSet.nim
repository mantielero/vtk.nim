## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiBlockDataSet.h
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
##  @class   vtkMultiBlockDataSet
##  @brief   Composite dataset that organizes datasets into
##  blocks.
##
##  vtkMultiBlockDataSet is a vtkCompositeDataSet that stores
##  a hierarchy of datasets. The dataset collection consists of
##  multiple blocks. Each block can itself be a vtkMultiBlockDataSet, thus
##  providing for a full tree structure.
##  Sub-blocks are usually used to distribute blocks across processors.
##  For example, a 1 block dataset can be distributed as following:
##  @verbatim
##  proc 0:
##  Block 0:
##    * ds 0
##    * (null)
##
##  proc 1:
##  Block 0:
##    * (null)
##    * ds 1
##  @endverbatim
##

## !!!Ignored construct:  # vtkMultiBlockDataSet_h [NewLine] # vtkMultiBlockDataSet_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkDataObjectTree.h [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkMultiBlockDataSet : public vtkDataObjectTree { public : static vtkMultiBlockDataSet * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectTree Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectTree :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMultiBlockDataSet :: IsTypeOf ( type ) ; } static vtkMultiBlockDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMultiBlockDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMultiBlockDataSet * NewInstance ( ) const { return vtkMultiBlockDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiBlockDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiBlockDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return class name of data type (see vtkType.h for
##  definitions).
##  int GetDataObjectType ( ) override { return VTK_MULTIBLOCK_DATA_SET ; } *
##  Set the number of blocks. This will cause allocation if the new number of
##  blocks is greater than the current size. All new blocks are initialized to
##  null.
##  void SetNumberOfBlocks ( unsigned int numBlocks ) ; *
##  Returns the number of blocks.
##  unsigned int GetNumberOfBlocks ( ) ; *
##  Returns the block at the given index. It is recommended that one uses the
##  iterators to iterate over composite datasets rather than using this API.
##  vtkDataObject * GetBlock ( unsigned int blockno ) ; *
##  Sets the data object as the given block. The total number of blocks will
##  be resized to fit the requested block no.
##
##  @remark while most vtkDataObject subclasses, including vtkMultiBlockDataSet
##  as acceptable as a block, `vtkPartitionedDataSet`,
##  `vtkPartitionedDataSetCollection`, and `vtkUniformGridAMR`
##  are not valid.
##  void SetBlock ( unsigned int blockno , vtkDataObject * block ) ; *
##  Remove the given block from the dataset.
##  void RemoveBlock ( unsigned int blockno ) ; *
##  Returns true if meta-data is available for a given block.
##  int HasMetaData ( unsigned int blockno ) { return this -> Superclass :: HasChildMetaData ( blockno ) ; } *
##  Returns the meta-data for the block. If none is already present, a new
##  vtkInformation object will be allocated. Use HasMetaData to avoid
##  allocating vtkInformation objects.
##  vtkInformation * GetMetaData ( unsigned int blockno ) { return this -> Superclass :: GetChildMetaData ( blockno ) ; } /@{ *
##  Retrieve an instance of this class from an information object.
##  static vtkMultiBlockDataSet * GetData ( vtkInformation * info ) ; static vtkMultiBlockDataSet * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} *
##  Unhiding superclass method.
##  vtkInformation * GetMetaData ( vtkCompositeDataIterator * iter ) override { return this -> Superclass :: GetMetaData ( iter ) ; } *
##  Unhiding superclass method.
##  int HasMetaData ( vtkCompositeDataIterator * iter ) override { return this -> Superclass :: HasMetaData ( iter ) ; } protected : vtkMultiBlockDataSet ( ) ; ~ vtkMultiBlockDataSet ( ) override ; *
##  Overridden to create a vtkMultiPieceDataSet whenever a
##  vtkPartitionedDataSet is encountered. This is necessary since
##  vtkMultiBlockDataSet cannot contain vtPartitionedDataSets.
##  vtkDataObjectTree * CreateForCopyStructure ( vtkDataObjectTree * other ) override ; private : vtkMultiBlockDataSet ( const vtkMultiBlockDataSet & ) = delete ; void operator = ( const vtkMultiBlockDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
