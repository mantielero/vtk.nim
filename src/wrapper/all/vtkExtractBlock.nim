## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractBlock.h
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
##  @class vtkExtractBlock
##  @brief extracts blocks from a vtkDataObjectTree subclass.
##
##  vtkExtractBlock is a filter that extracts blocks from a vtkDataObjectTree
##  subclass such as vtkPartitionedDataSet, vtkPartitionedDataSetCollection, etc.
##  using their composite-ids (also called flat-index).
##
##  The composite-id can be obtained by performing a pre-order traversal of the
##  tree (including empty nodes). For example, consider a tree with nodes named
##  `A(B (D, E), C(F, G))`.  Pre-order traversal yields: `A, B, D, E, C, F, G`;
##  hence, composite-id of `A` is `0`, while index of `C` is `4`.
##
##  `0` identifies the root-node. Thus, choosing `0` will result in the entire
##  input dataset being passed to the output.
##

## !!!Ignored construct:  # vtkExtractBlock_h [NewLine] # vtkExtractBlock_h [NewLine] # vtkFiltersExtractionModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class vtkDataObjectTreeIterator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPartitionedDataSet"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkDataObjectTree"
## !!!Ignored construct:  class VTKFILTERSEXTRACTION_EXPORT vtkExtractBlock : public vtkPassInputTypeAlgorithm { class vtkSet ; public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkExtractBlock * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractBlock :: IsTypeOf ( type ) ; } static vtkExtractBlock * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractBlock * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractBlock * NewInstance ( ) const { return vtkExtractBlock :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractBlock :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractBlock :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ /@{ *
##  Select the block indices to extract.  Each node in the multi-block tree
##  is identified by an \c index. The index can be obtained by performing a
##  preorder traversal of the tree (including empty nodes). eg. A(B (D, E),
##  C(F, G)).  Inorder traversal yields: A, B, D, E, C, F, G Index of A is
##  0, while index of C is 4. (Note: specifying node 0 means the input is
##  copied to the output.)
##  void AddIndex ( unsigned int index ) ; void RemoveIndex ( unsigned int index ) ; void RemoveAllIndices ( ) ; /@} /@{ *
##  When set, the output multiblock dataset will be pruned to remove empty
##  nodes. On by default.
##
##  This has no effect for vtkPartitionedDataSetCollection.
##  virtual void SetPruneOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PruneOutput  to  << _arg ) ; if ( this -> PruneOutput != _arg ) { this -> PruneOutput = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPruneOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PruneOutput  of  << this -> PruneOutput ) ; return this -> PruneOutput ; } ; virtual void PruneOutputOn ( ) { this -> SetPruneOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PruneOutputOff ( ) { this -> SetPruneOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  This is used only when PruneOutput is ON. By default, when pruning the
##  output i.e. remove empty blocks, if node has only 1 non-null child block,
##  then that node is removed. To preserve these parent nodes, set this flag to
##  true. Off by default.
##
##  This has no effect for vtkPartitionedDataSetCollection.
##  virtual void SetPruneOutputMaintainStructure ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaintainStructure  to  << _arg ) ; if ( this -> MaintainStructure != _arg ) { this -> MaintainStructure = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetPruneOutputMaintainStructure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaintainStructure  of  << this -> MaintainStructure ) ; return this -> MaintainStructure ; } ; virtual void MaintainStructureOn ( ) { this -> SetPruneOutputMaintainStructure ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MaintainStructureOff ( ) { this -> SetPruneOutputMaintainStructure ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkExtractBlock ( ) ; ~ vtkExtractBlock ( ) override ; *
##  Internal key, used to avoid pruning of a branch.
##  static vtkInformationIntegerKey * DONT_PRUNE ( ) ; / Implementation of the algorithm. int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; / Extract subtree void CopySubTree ( vtkDataObjectTreeIterator * loc , vtkDataObjectTree * output , vtkDataObjectTree * input , vtkSet & activeIndices ) ; bool Prune ( vtkMultiBlockDataSet * mblock ) ; bool Prune ( vtkPartitionedDataSet * mpiece ) ; bool Prune ( vtkDataObject * branch ) ; vtkTypeBool PruneOutput ; vtkTypeBool MaintainStructure ; private : vtkExtractBlock ( const vtkExtractBlock & ) = delete ; void operator = ( const vtkExtractBlock & ) = delete ; vtkSet * Indices ; } ;
## Error: token expected: ; but got: [identifier]!!!
