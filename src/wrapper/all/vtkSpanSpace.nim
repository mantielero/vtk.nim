## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSpanSpace.h
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
##  @class   vtkSpanSpace
##  @brief   organize data according to scalar span space
##
##  This is a helper class used to accelerate contouring operations. Given an
##  dataset, it organizes the dataset cells into a 2D binned space, with
##  coordinate axes (scalar_min,scalar_max). This so-called span space can
##  then be traversed quickly to find the cells that intersect a specified
##  contour value.
##
##  This class has an API that supports both serial and parallel
##  operation.  The parallel API enables the using class to grab arrays
##  (or batches) of cells that lie along a particular row in the span
##  space. These arrays can then be processed separately or in parallel.
##
##  Learn more about span space in these two publications: 1) "A Near
##  Optimal Isosorface Extraction Algorithm Using the Span Space."
##  Yarden Livnat et al. and 2) Isosurfacing in Span Space with Utmost
##  Efficiency." Han-Wei Shen et al.
##
##  @sa
##  vtkScalarTree vtkSimpleScalarTree
##

## !!!Ignored construct:  # vtkSpanSpace_h [NewLine] # vtkSpanSpace_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkScalarTree.h [NewLine] class vtkSpanSpace ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInternalSpanSpace"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkSpanSpace : public vtkScalarTree { public : *
##  Instantiate a scalar tree with default resolution of 100 and automatic
##  scalar range computation.
##  static vtkSpanSpace * New ( ) ; /@{ *
##  Standard type related macros and PrintSelf() method.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkScalarTree Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkScalarTree :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSpanSpace :: IsTypeOf ( type ) ; } static vtkSpanSpace * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSpanSpace * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSpanSpace * NewInstance ( ) const { return vtkSpanSpace :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkScalarTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSpanSpace :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSpanSpace :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  This method is used to copy data members when cloning an instance of the
##  class. It does not copy heavy data.
##  void ShallowCopy ( vtkScalarTree * stree ) override ; ----------------------------------------------------------------------
##  The following methods are specific to the creation and configuration of
##  vtkSpanSpace. /@{ *
##  Specify the scalar range in terms of minimum and maximum values
##  (smin,smax). These values are used to build the span space. Note that
##  setting the range can have significant impact on the performance of the
##  span space as it controls the effective resolution near important
##  isocontour values. By default the range is computed automatically; turn
##  off ComputeScalarRange is you wish to manually specify it.
##  virtual void SetScalarRange ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScalarRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> ScalarRange [ 0 ] != _arg1 ) || ( this -> ScalarRange [ 1 ] != _arg2 ) ) { this -> ScalarRange [ 0 ] = _arg1 ; this -> ScalarRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetScalarRange ( const double _arg [ 2 ] ) { this -> SetScalarRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetScalarRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarRange  pointer  << this -> ScalarRange ) ; return this -> ScalarRange ; } VTK_WRAPEXCLUDE virtual void GetScalarRange ( double data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> ScalarRange [ i ] ; } } ; /@} /@{ *
##  This boolean controls whether the determination of the scalar range is
##  computed from the input scalar data. By default this is enabled.
##  virtual void SetComputeScalarRange ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeScalarRange  to  << _arg ) ; if ( this -> ComputeScalarRange != _arg ) { this -> ComputeScalarRange = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeScalarRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalarRange  of  << this -> ComputeScalarRange ) ; return this -> ComputeScalarRange ; } ; virtual void ComputeScalarRangeOn ( ) { this -> SetComputeScalarRange ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeScalarRangeOff ( ) { this -> SetComputeScalarRange ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the resolution N of the span space. The span space can be
##  envisioned as a rectangular lattice of NXN buckets/bins (i.e., N rows
##  and N columns), where each bucket stores a list of cell ids. The i-j
##  coordinate of each cell (hence its location in the lattice) is
##  determined from the cell's 2-tuple (smin,smax) scalar range.  By default
##  Resolution = 100, with a clamp of 10,000.
##  virtual void SetResolution ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Resolution  to  << _arg ) ; if ( this -> Resolution != ( _arg < 1 ? 1 : ( _arg > 10000 ? 10000 : _arg ) ) ) { this -> Resolution = ( _arg < 1 ? 1 : ( _arg > 10000 ? 10000 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetResolutionMinValue ( ) { return 1 ; } virtual vtkIdType GetResolutionMaxValue ( ) { return 10000 ; } ; virtual vtkIdType GetComputeScalarRangeResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ; /@} /@{ *
##  Boolean controls whether the resolution of span space is computed
##  automatically from the average number of cells falling in each bucket.
##  virtual void SetComputeScalarRangeComputeResolution ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeResolution  to  << _arg ) ; if ( this -> ComputeResolution != _arg ) { this -> ComputeResolution = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetComputeScalarRangeResolutionComputeResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeResolution  of  << this -> ComputeResolution ) ; return this -> ComputeResolution ; } ; virtual void ComputeResolutionOn ( ) { this -> SetComputeScalarRangeComputeResolution ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ComputeResolutionOff ( ) { this -> SetComputeScalarRangeComputeResolution ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the average number of cells in each bucket. This is used to
##  indirectly control the resolution if ComputeResolution is enabled.
##  virtual void SetResolutionNumberOfCellsPerBucket ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfCellsPerBucket  to  << _arg ) ; if ( this -> NumberOfCellsPerBucket != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfCellsPerBucket = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetResolutionMinValueNumberOfCellsPerBucketMinValue ( ) { return 1 ; } virtual int GetResolutionMaxValueNumberOfCellsPerBucketMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetComputeScalarRangeResolutionComputeResolutionNumberOfCellsPerBucket ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCellsPerBucket  of  << this -> NumberOfCellsPerBucket ) ; return this -> NumberOfCellsPerBucket ; } ; /@} ----------------------------------------------------------------------
##  The following methods satisfy the vtkScalarTree abstract API. *
##  Initialize the span space. Frees memory and resets object as
##  appropriate.
##  void Initialize ( ) override ; *
##  Construct the scalar tree from the dataset provided. Checks build times
##  and modified time from input and reconstructs the tree if necessary.
##  void BuildTree ( ) override ; *
##  Begin to traverse the cells based on a scalar value. Returned cells will
##  have scalar values that span the scalar value specified (within the
##  resolution of the span space). Note this method must be called prior to
##  parallel or serial traversal since it specifies the scalar value to be
##  extracted.
##  void InitTraversal ( double scalarValue ) override ; *
##  Return the next cell that may contain scalar value specified to
##  InitTraversal(). The value nullptr is returned if the list is
##  exhausted. Make sure that InitTraversal() has been invoked first or
##  you'll get undefined behavior. This is inherently a serial operation.
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
##  const vtkIdType * GetCellBatch ( vtkIdType batchNum , vtkIdType & numCells ) override ; /@{ *
##  Set/Get the size of the cell batches when processing in
##  parallel. By default the batch size = 100 cells in each batch.
##  virtual void SetResolutionNumberOfCellsPerBucketBatchSize ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BatchSize  to  << _arg ) ; if ( this -> BatchSize != ( _arg < 100 ? 100 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> BatchSize = ( _arg < 100 ? 100 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkIdType GetResolutionMinValueNumberOfCellsPerBucketMinValueBatchSizeMinValue ( ) { return 100 ; } virtual vtkIdType GetResolutionMaxValueNumberOfCellsPerBucketMaxValueBatchSizeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual vtkIdType GetComputeScalarRangeResolutionComputeResolutionNumberOfCellsPerBucketBatchSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BatchSize  of  << this -> BatchSize ) ; return this -> BatchSize ; } ; /@} protected : vtkSpanSpace ( ) ; ~ vtkSpanSpace ( ) override ; double ScalarRange [ 2 ] ; vtkTypeBool ComputeScalarRange ; vtkIdType Resolution ; vtkTypeBool ComputeResolution ; int NumberOfCellsPerBucket ; vtkInternalSpanSpace * SpanSpace ; vtkIdType BatchSize ; private :  Internal variables supporting span space traversal vtkIdType RMin [ 2 ] ;  span space lower left corner vtkIdType RMax [ 2 ] ;  span space upper right corner  This supports serial traversal via GetNextCell() vtkIdType CurrentRow ;  the span space row currently being processed vtkIdType * CurrentSpan ;  pointer to current span row vtkIdType CurrentIdx ;  position into the current span row vtkIdType CurrentNumCells ;  number of cells on the current span row private : vtkSpanSpace ( const vtkSpanSpace & ) = delete ; void operator = ( const vtkSpanSpace & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
