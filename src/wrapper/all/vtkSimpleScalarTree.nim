## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSimpleScalarTree.h
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
##  @class   vtkSimpleScalarTree
##  @brief   organize data according to scalar values (used to accelerate contouring operations)
##
##  vtkSimpleScalarTree creates a pointerless binary tree that helps search
##  for cells that lie within a particular scalar range. This object is used
##  to accelerate some contouring (and other scalar-based techniques).
##
##  The tree consists of an array of (min,max) scalar range pairs per
##  node in the tree. The (min,max) range is determined from looking at
##  the range of the children of the tree node. If the node is a leaf,
##  then the range is determined by scanning the range of scalar data
##  in n cells in the dataset. The n cells are determined by arbitrary
##  selecting cell ids from id(i) to id(i+n), and where n is specified
##  using the BranchingFactor ivar. Note that leaf node i=0 contains
##  the scalar range computed from cell ids (0,n-1); leaf node i=1
##  contains the range from cell ids (n,2n-1); and so on. The
##  implication is that there are no direct lists of cell ids per leaf
##  node, instead the cell ids are implicitly known. Despite the
##  arbitrary grouping of cells, in practice this scalar tree actually
##  performs quite well due to spatial/data coherence.
##
##  This class has an API that supports both serial and parallel
##  operation.  The parallel API enables the using class to grab arrays
##  (or batches) of cells that potentially intersect the
##  isocontour. These batches can then be processed in separate
##  threads.
##
##  @sa
##  vtkScalarTree vtkSpanSpace
##

## !!!Ignored construct:  # vtkSimpleScalarTree_h [NewLine] # vtkSimpleScalarTree_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkScalarTree.h [NewLine] class vtkScalarNode ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSimpleScalarTree"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkSimpleScalarTree : public vtkScalarTree { public : *
##  Instantiate scalar tree with maximum level of 20 and branching
##  factor of three.
##  static vtkSimpleScalarTree * New ( ) ; /@{ *
##  Standard type related macros and PrintSelf() method.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkScalarTree Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkScalarTree :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSimpleScalarTree :: IsTypeOf ( type ) ; } static vtkSimpleScalarTree * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSimpleScalarTree * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSimpleScalarTree * NewInstance ( ) const { return vtkSimpleScalarTree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkScalarTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSimpleScalarTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSimpleScalarTree :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This method is used to copy data members when cloning an instance of the
##  class. It does not copy heavy data.
##  void ShallowCopy ( vtkScalarTree * stree ) override ; /@{ *
##  Set the branching factor for the tree. This is the number of
##  children per tree node. Smaller values (minimum is 2) mean deeper
##  trees and more memory overhead. Larger values mean shallower
##  trees, less memory usage, but worse performance.
##  virtual void SetBranchingFactor ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BranchingFactor  to  << _arg ) ; if ( this -> BranchingFactor != ( _arg < 2 ? 2 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> BranchingFactor = ( _arg < 2 ? 2 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBranchingFactorMinValue ( ) { return 2 ; } virtual int GetBranchingFactorMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetBranchingFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BranchingFactor  of  << this -> BranchingFactor ) ; return this -> BranchingFactor ; } ; /@} /@{ *
##  Get the level of the scalar tree. This value may change each time the
##  scalar tree is built and the branching factor changes.
##  virtual int GetBranchingFactorLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Level  of  << this -> Level ) ; return this -> Level ; } ; /@} /@{ *
##  Set the maximum allowable level for the tree.
##  virtual void SetBranchingFactorMaxLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaxLevel  to  << _arg ) ; if ( this -> MaxLevel != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> MaxLevel = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBranchingFactorMinValueMaxLevelMinValue ( ) { return 1 ; } virtual int GetBranchingFactorMaxValueMaxLevelMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetBranchingFactorLevelMaxLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxLevel  of  << this -> MaxLevel ) ; return this -> MaxLevel ; } ; /@} *
##  Construct the scalar tree from the dataset provided. Checks build times
##  and modified time from input and reconstructs the tree if necessary.
##  void BuildTree ( ) override ; *
##  Initialize locator. Frees memory and resets object as appropriate.
##  void Initialize ( ) override ; *
##  Begin to traverse the cells based on a scalar value. Returned cells
##  will likely have scalar values that span the scalar value specified.
##  void InitTraversal ( double scalarValue ) override ; *
##  Return the next cell that may contain scalar value specified to
##  initialize traversal. The value nullptr is returned if the list is
##  exhausted. Make sure that InitTraversal() has been invoked first or
##  you'll get erratic behavior.
##  vtkCell * GetNextCell ( vtkIdType & cellId , vtkIdList * & ptIds , vtkDataArray * cellScalars ) override ;  The following methods supports parallel (threaded) traversal. Basically
##  batches of cells (which are a portion of the whole dataset) are available for
##  processing in a parallel For() operation. *
##  Get the number of cell batches available for processing as a function of
##  the specified scalar value. Each batch contains a list of candidate
##  cells that may contain the specified isocontour value.
##  vtkIdType GetNumberOfCellBatches ( double scalarValue ) override ; *
##  Return the array of cell ids in the specified batch. The method
##  also returns the number of cell ids in the array. Make sure to
##  call GetNumberOfCellBatches() beforehand.
##  const vtkIdType * GetCellBatch ( vtkIdType batchNum , vtkIdType & numCells ) override ; protected : vtkSimpleScalarTree ( ) ; ~ vtkSimpleScalarTree ( ) override ; int MaxLevel ; int Level ; int BranchingFactor ;  number of children per node vtkScalarNode * Tree ;  pointerless scalar range tree int TreeSize ;  allocated size of tree vtkIdType LeafOffset ;  offset to leaf nodes of tree private : vtkIdType NumCells ;  the number of cells in this dataset vtkIdType TreeIndex ;  traversal location within tree int ChildNumber ;  current child in traversal vtkIdType CellId ;  current cell id being examined int FindStartLeaf ( vtkIdType index , int level ) ; int FindNextLeaf ( vtkIdType index , int level ) ; vtkIdType * CandidateCells ;  to support parallel computing vtkIdType NumCandidates ; private : vtkSimpleScalarTree ( const vtkSimpleScalarTree & ) = delete ; void operator = ( const vtkSimpleScalarTree & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
