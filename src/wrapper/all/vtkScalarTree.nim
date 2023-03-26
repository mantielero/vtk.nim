## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScalarTree.h
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
##  @class   vtkScalarTree
##  @brief   organize data according to scalar values (used to accelerate contouring operations)
##
##
##  vtkScalarTree is an abstract class that defines the API to concrete
##  scalar tree subclasses. A scalar tree is a data structure that organizes
##  data according to its scalar value. This allows rapid access to data for
##  those algorithms that access the data based on scalar value. For example,
##  isocontouring operates on cells based on the scalar (isocontour) value.
##
##  To use subclasses of this class, you must specify a dataset to operate on,
##  and then specify a scalar value in the InitTraversal() method. Then
##  calls to GetNextCell() return cells whose scalar data contains the
##  scalar value specified. (This describes serial traversal.)
##
##  Methods supporting parallel traversal (such as threading) are also
##  supported. Basically thread-safe batches of cells (which are a
##  portion of the whole dataset) are available for processing using a
##  parallel For() operation. First request the number of batches, and
##  then for each batch, retrieve the array of cell ids in that batch. These
##  batches contain cell ids that are likely to contain the isosurface.
##
##  @sa
##  vtkSimpleScalarTree vtkSpanSpace
##

## !!!Ignored construct:  # vtkScalarTree_h [NewLine] # vtkScalarTree_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkObject.h [NewLine] class vtkCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkIdList"
discard "forward decl of vtkTimeStamp"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkScalarTree : public vtkObject { public : /@{ *
##  Standard type related macros and PrintSelf() method.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkScalarTree :: IsTypeOf ( type ) ; } static vtkScalarTree * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkScalarTree * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkScalarTree * NewInstance ( ) const { return vtkScalarTree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScalarTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScalarTree :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This method is used to copy data members when cloning an instance of the
##  class. It does not copy heavy data.
##  virtual void ShallowCopy ( vtkScalarTree * stree ) ; /@{ *
##  Build the tree from the points/cells and scalars defining this
##  dataset.
##  virtual void SetDataSet ( vtkDataSet * ) ; virtual vtkDataSet * GetnameDataSet ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DataSet  address  << static_cast < vtkDataSet * > ( this -> DataSet ) ) ; return this -> DataSet ; } ; /@} /@{ *
##  Build the tree from the points/cells and scalars defining the
##  dataset and scalars provided. Typically the scalars come from
##  the vtkDataSet specified, but sometimes a separate vtkDataArray
##  is provided to specify the scalars. If the scalar array is
##  explicitly set, then it takes precedence over the scalars held
##  in the vtkDataSet.
##  virtual void SetScalars ( vtkDataArray * ) ; virtual vtkDataArray * GetnameDataSetScalars ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Scalars  address  << static_cast < vtkDataArray * > ( this -> Scalars ) ) ; return this -> Scalars ; } ; /@} *
##  Construct the scalar tree from the dataset provided. Checks build times
##  and modified time from input and reconstructs the tree if necessary.
##  virtual void BuildTree ( ) = 0 ; *
##  Initialize locator. Frees memory and resets object as appropriate.
##  virtual void Initialize ( ) = 0 ; *
##  Begin to traverse the cells based on a scalar value (serial
##  traversal). Returned cells will have scalar values that span the scalar
##  value specified. Note that changing the scalarValue does not cause the
##  scalar tree to be modified, and hence it does not rebuild.
##  virtual void InitTraversal ( double scalarValue ) = 0 ; *
##  Return the next cell that may contain scalar value specified to
##  InitTraversal() (serial traversal). The value nullptr is returned if the
##  list is exhausted. Make sure that InitTraversal() has been invoked first
##  or you'll get erratic behavior.
##  virtual vtkCell * GetNextCell ( vtkIdType & cellId , vtkIdList * & ptIds , vtkDataArray * cellScalars ) = 0 ; *
##  Return the current scalar value over which tree traversal is proceeding.
##  This is the scalar value provided in InitTraversal().
##  double GetScalarValue ( ) { return this -> ScalarValue ; }  The following methods supports parallel (threaded) traversal. Basically
##  batches of cells (which are a portion of the whole dataset) are available for
##  processing in a parallel For() operation. *
##  Get the number of cell batches available for processing as a function of
##  the specified scalar value. Each batch contains a list of candidate
##  cells that may contain the specified isocontour value.
##  virtual vtkIdType GetNumberOfCellBatches ( double scalarValue ) = 0 ; *
##  Return the array of cell ids in the specified batch. The method
##  also returns the number of cell ids in the array. Make sure to
##  call GetNumberOfCellBatches() beforehand.
##  virtual const vtkIdType * GetCellBatch ( vtkIdType batchNum , vtkIdType & numCells ) = 0 ; protected : vtkScalarTree ( ) ; ~ vtkScalarTree ( ) override ; vtkDataSet * DataSet ;  the dataset over which the scalar tree is built vtkDataArray * Scalars ;  the scalars of the DataSet double ScalarValue ;  current scalar value for traversal vtkTimeStamp BuildTime ;  time at which tree was built private : vtkScalarTree ( const vtkScalarTree & ) = delete ; void operator = ( const vtkScalarTree & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
