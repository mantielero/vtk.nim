## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedDataSetCollection.h
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
##  @class   vtkPartitionedDataSetCollection
##  @brief   Composite dataset that groups datasets as a collection.
##
##  vtkPartitionedDataSetCollection is a vtkCompositeDataSet that stores
##  a collection of non-null vtkPartitionedDataSets. These items can represent
##  different concepts depending on the context. For example, they can
##  represent region of different materials in a simulation or parts in
##  an assembly. It is not requires that items have anything in common.
##  For example, they can have completely different point or cell arrays.
##

## !!!Ignored construct:  # vtkPartitionedDataSetCollection_h [NewLine] # vtkPartitionedDataSetCollection_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkDataObjectTree.h [NewLine] class vtkPartitionedDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataAssembly"
discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkPartitionedDataSetCollection : public vtkDataObjectTree { public : static vtkPartitionedDataSetCollection * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectTree Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectTree :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPartitionedDataSetCollection :: IsTypeOf ( type ) ; } static vtkPartitionedDataSetCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPartitionedDataSetCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPartitionedDataSetCollection * NewInstance ( ) const { return vtkPartitionedDataSetCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedDataSetCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedDataSetCollection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Return class name of data type (see vtkType.h for
##  definitions).
##  int GetDataObjectType ( ) override { return VTK_PARTITIONED_DATA_SET_COLLECTION ; } *
##  Set the number of blocks. This will cause allocation if the new number of
##  blocks is greater than the current size. All new blocks are initialized to
##  with empty `vtkPartitionedDataSetCollection` instances.
##  void SetNumberOfPartitionedDataSets ( unsigned int numDataSets ) ; *
##  Returns the number of blocks.
##  unsigned int GetNumberOfPartitionedDataSets ( ) const ; *
##  Returns the block at the given index. It is recommended that one uses the
##  iterators to iterate over composite datasets rather than using this API.
##  vtkPartitionedDataSet * GetPartitionedDataSet ( unsigned int idx ) const ; *
##  Sets the data object as the given block. The total number of blocks will
##  be resized to fit the requested block no.
##
##  @remark `dataset` cannot be nullptr.
##  void SetPartitionedDataSet ( unsigned int idx , vtkPartitionedDataSet * dataset ) ; *
##  Remove the given block from the dataset.
##  void RemovePartitionedDataSet ( unsigned int idx ) ; /@{ *
##  API to get/set partitions using a tuple index.
##  void SetPartition ( unsigned int idx , unsigned int partition , vtkDataObject * object ) ; vtkDataSet * GetPartition ( unsigned int idx , unsigned int partition ) ; vtkDataObject * GetPartitionAsDataObject ( unsigned int idx , unsigned int partition ) ; /@} *
##  Returns the number of partitions in a partitioned dataset at the given index.
##  unsigned int GetNumberOfPartitions ( unsigned int idx ) const ; *
##  Set number of partitions at a given index. Note, this will call
##  `SetNumberOfPartitionedDataSets` if needed to grow the collection.
##  void SetNumberOfPartitions ( unsigned int idx , unsigned int numPartitions ) ; *
##  Returns true if meta-data is available for a given block.
##  int HasMetaData ( unsigned int idx ) { return this -> Superclass :: HasChildMetaData ( idx ) ; } *
##  Returns the meta-data for the block. If none is already present, a new
##  vtkInformation object will be allocated. Use HasMetaData to avoid
##  allocating vtkInformation objects.
##  vtkInformation * GetMetaData ( unsigned int idx ) { return this -> Superclass :: GetChildMetaData ( idx ) ; } /@{ *
##  DataAssembly provides a way to define hierarchical organization of
##  partitioned-datasets. These methods provide access to the data assembly
##  instances associated, if any.
##  virtual vtkDataAssembly * GetnameDataAssembly ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DataAssembly  address  << static_cast < vtkDataAssembly * > ( this -> DataAssembly ) ) ; return this -> DataAssembly ; } ; void SetDataAssembly ( vtkDataAssembly * assembly ) ; /@} /@{ *
##  Returns the composite index (sometimes referred to as the flat-index) for
##  either a partitioned dataset or a specific partition in a partitioned
##  dataset.
##  unsigned int GetCompositeIndex ( unsigned int idx ) const ; unsigned int GetCompositeIndex ( unsigned int idx , unsigned int partition ) const ; /@} /@{ *
##  Retrieve an instance of this class from an information object.
##  static vtkPartitionedDataSetCollection * GetData ( vtkInformation * info ) ; static vtkPartitionedDataSetCollection * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} *
##  Unhiding superclass method.
##  vtkInformation * GetMetaData ( vtkCompositeDataIterator * iter ) override { return this -> Superclass :: GetMetaData ( iter ) ; } *
##  Unhiding superclass method.
##  int HasMetaData ( vtkCompositeDataIterator * iter ) override { return this -> Superclass :: HasMetaData ( iter ) ; } *
##  Overridden to include DataAssembly MTime.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Overridden to handle vtkDataAssembly.
##  void ShallowCopy ( vtkDataObject * src ) override ; void DeepCopy ( vtkDataObject * src ) override ; void CopyStructure ( vtkCompositeDataSet * input ) override ; void Initialize ( ) override ; /@} protected : vtkPartitionedDataSetCollection ( ) ; ~ vtkPartitionedDataSetCollection ( ) override ; *
##  Overridden to create a vtkPartitionedDataSet whenever a vtkMultiPieceDataSet
##  is encountered. This is necessary since vtkPartitionedDataSetCollection
##  cannot contain vtkMultiPieceDataSets
##  vtkDataObjectTree * CreateForCopyStructure ( vtkDataObjectTree * other ) override ; private : vtkPartitionedDataSetCollection ( const vtkPartitionedDataSetCollection & ) = delete ; void operator = ( const vtkPartitionedDataSetCollection & ) = delete ; vtkDataAssembly * DataAssembly ; } ;
## Error: token expected: ; but got: [identifier]!!!
