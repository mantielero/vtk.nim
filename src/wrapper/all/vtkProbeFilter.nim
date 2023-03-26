## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProbeFilter.h
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
##  @class   vtkProbeFilter
##  @brief   sample data values at specified point locations
##
##  vtkProbeFilter is a filter that computes point attributes (e.g., scalars,
##  vectors, etc.) at specified point positions. The filter has two inputs:
##  the Input and Source. The Input geometric structure is passed through the
##  filter. The point attributes are computed at the Input point positions
##  by interpolating into the source data. For example, we can compute data
##  values on a plane (plane specified as Input) from a volume (Source).
##  The cell data of the source data is copied to the output based on in
##  which source cell each input point is. If an array of the same name exists
##  both in source's point and cell data, only the one from the point data is
##  probed.
##
##  This filter can be used to resample data, or convert one dataset form into
##  another. For example, an unstructured grid (vtkUnstructuredGrid) can be
##  probed with a volume (three-dimensional vtkImageData), and then volume
##  rendering techniques can be used to visualize the results. Another example:
##  a line or curve can be used to probe data to produce x-y plots along
##  that line or curve.
##
##  @warning
##  A critical algorithmic component of vtkProbeFilter is the manner in which
##  it finds the cell containing a probe point. By default, the
##  vtkDataSet::FindCell() method is used, which in turn uses a
##  vtkPointLocator to perform an accelerated search. However, using a
##  vtkPointLocator may fail to identify an enclosing cell in some cases. A
##  more robust but slower approach is to use a vtkCellLocator to perform the
##  the FindCell() operation (via specification of the
##  CellLocatorPrototype). Finally, more advanced searches can be configured
##  by specifying an instance of vtkFindCellStrategy. (Note: image data
##  probing never uses a locator since finding a containing cell is a simple,
##  fast operation. This specifying a vtkFindCellStrategy or cell locator
##  prototype has no effect.)
##
##  @warning
##  The vtkProbeFilter, once it finds the cell containing a query point, uses
##  the cell's interpolation functions to perform the interpolate / compute
##  the point attributes. Note that other interpolation processes with
##  different kernels are available: vtkPointInterpolator and
##  vtkSPHInterpolator. vtkPointInterpolator supports a variety of generalized
##  kernels, while vtkSPHInterpolator supports a variety of SPH interpolation
##  kernels.
##
##  @sa
##  vtkFindCellStrategy vtkPointLocator vtkCellLocator vtkStaticPointLocator
##  vtkStaticCellLocator vtkPointInterpolator vtkSPHInterpolator
##

## !!!Ignored construct:  # vtkProbeFilter_h [NewLine] # vtkProbeFilter_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkDataSetAttributes.h  needed for vtkDataSetAttributes::FieldList # vtkFiltersCoreModule.h  For export macro [NewLine] class vtkAbstractCellLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCell"
discard "forward decl of vtkCharArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPointData"
discard "forward decl of vtkFindCellStrategy"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkProbeFilter : public vtkDataSetAlgorithm { public : static vtkProbeFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProbeFilter :: IsTypeOf ( type ) ; } static vtkProbeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProbeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProbeFilter * NewInstance ( ) const { return vtkProbeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProbeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the data set that will be probed at the input points.
##  The Input gives the geometry (the points and cells) for the output,
##  while the Source is probed (interpolated) to generate the scalars,
##  vectors, etc. for the output points based on the point locations.
##  void SetSourceData ( vtkDataObject * source ) ; vtkDataObject * GetSource ( ) ; /@} *
##  Specify the data set that will be probed at the input points.
##  The Input gives the geometry (the points and cells) for the output,
##  while the Source is probed (interpolated) to generate the scalars,
##  vectors, etc. for the output points based on the point locations.
##  void SetSourceConnection ( vtkAlgorithmOutput * algOutput ) ; /@{ *
##  Control whether the source point data is to be treated as categorical. If
##  the data is categorical, then the resultant data will be determined by
##  a nearest neighbor interpolation scheme.
##  virtual void SetCategoricalData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CategoricalData  to  << _arg ) ; if ( this -> CategoricalData != _arg ) { this -> CategoricalData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCategoricalData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CategoricalData  of  << this -> CategoricalData ) ; return this -> CategoricalData ; } ; virtual void CategoricalDataOn ( ) { this -> SetCategoricalData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CategoricalDataOff ( ) { this -> SetCategoricalData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  This flag is used only when a piece is requested to update.  By default
##  the flag is off.  Because no spatial correspondence between input pieces
##  and source pieces is known, all of the source has to be requested no
##  matter what piece of the output is requested.  When there is a spatial
##  correspondence, the user/application can set this flag.  This hint allows
##  the breakup of the probe operation to be much more efficient.  When piece
##  m of n is requested for update by the user, then only n of m needs to
##  be requested of the source.
##  virtual void SetCategoricalDataSpatialMatch ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SpatialMatch  to  << _arg ) ; if ( this -> SpatialMatch != _arg ) { this -> SpatialMatch = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetCategoricalDataSpatialMatch ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SpatialMatch  of  << this -> SpatialMatch ) ; return this -> SpatialMatch ; } ; virtual void SpatialMatchOn ( ) { this -> SetCategoricalDataSpatialMatch ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void SpatialMatchOff ( ) { this -> SetCategoricalDataSpatialMatch ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the list of point ids in the output that contain attribute data
##  interpolated from the source.
##  vtkIdTypeArray * GetValidPoints ( ) ; /@} /@{ *
##  Returns the name of the char array added to the output with values 1 for
##  valid points and 0 for invalid points.
##  Set to "vtkValidPointMask" by default.
##  virtual void SetValidPointMaskArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ValidPointMaskArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ValidPointMaskArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ValidPointMaskArrayName && _arg && ( ! strcmp ( this -> ValidPointMaskArrayName , _arg ) ) ) { return ; } delete [ ] this -> ValidPointMaskArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ValidPointMaskArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ValidPointMaskArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetValidPointMaskArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << ValidPointMaskArrayName  of  << ( this -> ValidPointMaskArrayName ? this -> ValidPointMaskArrayName : (null) ) ) ; return this -> ValidPointMaskArrayName ; } ; /@} /@{ *
##  Shallow copy the input cell data arrays to the output.
##  Off by default.
##  virtual void SetCategoricalDataSpatialMatchPassCellArrays ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassCellArrays  to  << _arg ) ; if ( this -> PassCellArrays != _arg ) { this -> PassCellArrays = _arg ; this -> Modified ( ) ; } } ; virtual void PassCellArraysOn ( ) { this -> SetCategoricalDataSpatialMatchPassCellArrays ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassCellArraysOff ( ) { this -> SetCategoricalDataSpatialMatchPassCellArrays ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetCategoricalDataSpatialMatchPassCellArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCellArrays  of  << this -> PassCellArrays ) ; return this -> PassCellArrays ; } ; /@}
## /@{ *
##  Shallow copy the input point data arrays to the output
##  Off by default.
##  virtual void SetCategoricalDataSpatialMatchPassCellArraysPassPointArrays ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassPointArrays  to  << _arg ) ; if ( this -> PassPointArrays != _arg ) { this -> PassPointArrays = _arg ; this -> Modified ( ) ; } } ; virtual void PassPointArraysOn ( ) { this -> SetCategoricalDataSpatialMatchPassCellArraysPassPointArrays ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassPointArraysOff ( ) { this -> SetCategoricalDataSpatialMatchPassCellArraysPassPointArrays ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetCategoricalDataSpatialMatchPassCellArraysPassPointArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointArrays  of  << this -> PassPointArrays ) ; return this -> PassPointArrays ; } ; /@} /@{ *
##  Set whether to pass the field-data arrays from the Input i.e. the input
##  providing the geometry to the output. On by default.
##  virtual void SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArrays ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassFieldArrays  to  << _arg ) ; if ( this -> PassFieldArrays != _arg ) { this -> PassFieldArrays = _arg ; this -> Modified ( ) ; } } ; virtual void PassFieldArraysOn ( ) { this -> SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArrays ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PassFieldArraysOff ( ) { this -> SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArrays ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassFieldArrays  of  << this -> PassFieldArrays ) ; return this -> PassFieldArrays ; } ; /@} /@{ *
##  Set the tolerance used to compute whether a point in the
##  source is in a cell of the input.  This value is only used
##  if ComputeTolerance is off.
##  virtual void SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArraysTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArraysTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Set whether to use the Tolerance field or precompute the tolerance.
##  When on, the tolerance will be computed and the field
##  value is ignored. On by default.
##  virtual void SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerance ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeTolerance  to  << _arg ) ; if ( this -> ComputeTolerance != _arg ) { this -> ComputeTolerance = _arg ; this -> Modified ( ) ; } } ; virtual void ComputeToleranceOn ( ) { this -> SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArraysComputeTolerance ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeToleranceOff ( ) { this -> SetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArraysComputeTolerance ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetCategoricalDataSpatialMatchPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeTolerance  of  << this -> ComputeTolerance ) ; return this -> ComputeTolerance ; } ; /@} /@{ *
##  Set / get the strategy used to perform the FindCell() operation. When
##  specified, the strategy is used in preference to a cell locator
##  prototype. When neither a strategy or cell locator prototype is defined,
##  then the vtkDataSet::FindCell() method is used.
##  virtual void SetFindCellStrategy ( vtkFindCellStrategy * ) ; virtual vtkFindCellStrategy * GetnameFindCellStrategy ( ) { vtkDebugWithObjectMacro ( this , <<  returning  FindCellStrategy  address  << static_cast < vtkFindCellStrategy * > ( this -> FindCellStrategy ) ) ; return this -> FindCellStrategy ; } ; /@} /@{ *
##  Set/Get the prototype cell locator to perform the FindCell() operation.
##  (A prototype is used as an object factory to instantiate an instance of
##  the prototype to perform the FindCell() operation). If a prototype, and
##  a vtkFindCellStrategy are not defined, the vtkDataSet::FindCell() is
##  used. If a vtkFindCellStrategy is not defined, then the prototype is
##  used.
##  virtual void SetCellLocatorPrototype ( vtkAbstractCellLocator * ) ; virtual vtkAbstractCellLocator * GetnameFindCellStrategyCellLocatorPrototype ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CellLocatorPrototype  address  << static_cast < vtkAbstractCellLocator * > ( this -> CellLocatorPrototype ) ) ; return this -> CellLocatorPrototype ; } ; /@} protected : vtkProbeFilter ( ) ; ~ vtkProbeFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Call at end of RequestData() to pass attribute data respecting the
##  PassCellArrays, PassPointArrays, PassFieldArrays flags.
##  void PassAttributeData ( vtkDataSet * input , vtkDataObject * source , vtkDataSet * output ) ; *
##  Equivalent to calling BuildFieldList(); InitializeForProbing(); DoProbing().
##  void Probe ( vtkDataSet * input , vtkDataSet * source , vtkDataSet * output ) ; *
##  Build the field lists. This is required before calling
##  InitializeForProbing().
##  void BuildFieldList ( vtkDataSet * source ) ; *
##  Initializes output and various arrays which keep track for probing status.
##  virtual void InitializeForProbing ( vtkDataSet * input , vtkDataSet * output ) ; virtual void InitializeOutputArrays ( vtkPointData * outPD , vtkIdType numPts ) ; *
##  Probe appropriate points
##  srcIdx is the index in the PointList for the given source.
##  void DoProbing ( vtkDataSet * input , int srcIdx , vtkDataSet * source , vtkDataSet * output ) ; vtkTypeBool CategoricalData ; vtkTypeBool PassCellArrays ; vtkTypeBool PassPointArrays ; vtkTypeBool PassFieldArrays ; vtkTypeBool SpatialMatch ; double Tolerance ; bool ComputeTolerance ; char * ValidPointMaskArrayName ; vtkIdTypeArray * ValidPoints ; vtkCharArray * MaskPoints ;  Support various methods to support the FindCell() operation vtkAbstractCellLocator * CellLocatorPrototype ; vtkFindCellStrategy * FindCellStrategy ; vtkDataSetAttributes :: FieldList * CellList ; vtkDataSetAttributes :: FieldList * PointList ; private : vtkProbeFilter ( const vtkProbeFilter & ) = delete ; void operator = ( const vtkProbeFilter & ) = delete ;  Probe only those points that are marked as not-probed by the MaskPoints
##  array. void ProbeEmptyPoints ( vtkDataSet * input , int srcIdx , vtkDataSet * source , vtkDataSet * output ) ;  A faster implementation for vtkImageData input. void ProbePointsImageData ( vtkImageData * input , int srcIdx , vtkDataSet * source , vtkImageData * output ) ; void ProbeImagePointsInCell ( vtkCell * cell , vtkIdType cellId , vtkDataSet * source , int srcBlockId , const double start [ 3 ] , const double spacing [ 3 ] , const int dim [ 3 ] , vtkPointData * outPD , char * maskArray , double * wtsBuff ) ; class ProbeImageDataWorklet ;  A faster implementation for vtkImageData source. void ProbeImageDataPoints ( vtkDataSet * input , int srcIdx , vtkImageData * sourceImage , vtkDataSet * output ) ; void ProbeImageDataPointsSMP ( vtkDataSet * input , vtkImageData * source , int srcIdx , vtkPointData * outPD , char * maskArray , vtkIdList * pointIds , vtkIdType startId , vtkIdType endId , bool baseThread ) ; class ProbeImageDataPointsWorklet ; class vtkVectorOfArrays ; vtkVectorOfArrays * CellArrays ; } ;
## Error: token expected: ; but got: [identifier]!!!
