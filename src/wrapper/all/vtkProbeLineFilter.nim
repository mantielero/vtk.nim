## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProbeLineFilter.h
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
##  @class   vtkProbeLineFilter
##  @brief   probe dataset along a line in parallel
##
##  This filter probes the input data set along an source dataset composed of `vtkLine` and/or
##  `vtkPolyLine` cells. It outputs a `vtkPolyData`, or a `vtkMultiBlockDataSet` if asked. In
##  the case of a multiblock, each block contains the probe result for a single cell of the
##  source. In the case of a polydata output and multiple input lines, only the first line
##  results are returned. Points are sorted along the line or the polyline. Cells are outputted
##  in the same order they were defined in the input (i.e. cells 0 is block 0 of the output).
##
##  The probing can have different sampling patterns. Three are available:
##  * `SAMPLE_LINE_AT_CELL_BOUNDARIES`: The intersection between the input line and the input
##  data set is computed. At each intersection point, 2 points are generated, slightly shifted
##  inside each interfacing cell. Points are moved back to the intersection after probing.
##  This sampling pattern should typically be used on input data
##  sets holding cell data if one wants to output a step function profile.
##  * `SAMPLE_LINE_AT_SEGMENT_CENTERS`: Center points each consecutive segment formed by the
##  Probing points computed with `SAMPLE_LINE_AT_CELL_BOUNDARIES` are used for probing.
##  This outputs one point per cell, in addition to the end points of a segment.
##  * `SAMPLE_LINE_UNIFORMLY`: A uniformly sampled line is used for probing. In this instance,
##  `LineResolution` is used to determine how many samples are being generated
##
##  @note In every sampling pattern, the end points are included in the probing, even if they
##  are outside the input data set.
##
##  @attention In case of a distributed pipeline, the dataset used to determine the lines to
##  probe from (ie the dataset on port 1) will always be the one from rank 0, and will be
##  broadcasted to all other ranks.
##

## !!!Ignored construct:  # vtkProbeLineFilter_h [NewLine] # vtkProbeLineFilter_h [NewLine] # vtkDataObjectAlgorithm.h [NewLine] # vtkFiltersParallelDIY2Module.h  For export macro # vtkSmartPointer.h  For sampling line [NewLine] # < vector >  For sampling line [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkVector3d"
## !!!Ignored construct:  class VTKFILTERSPARALLELDIY2_EXPORT vtkProbeLineFilter : public vtkDataObjectAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataObjectAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataObjectAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProbeLineFilter :: IsTypeOf ( type ) ; } static vtkProbeLineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProbeLineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProbeLineFilter * NewInstance ( ) const { return vtkProbeLineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProbeLineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProbeLineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkProbeLineFilter * New ( ) ; /@{ *
##  Set and get the controller.
##  virtual void SetController ( vtkMultiProcessController * ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} *
##  Set the source for creating the lines to probe from. Only cells of type VTK_LINE or
##  VTK_POLY_LINE will be processed.
##  virtual void SetSourceConnection ( vtkAlgorithmOutput * input ) ; /@{ *
##  Shallow copy the input cell data arrays to the output.
##  Off by default.
##  virtual void SetPassCellArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassCellArrays  to  << _arg ) ; if ( this -> PassCellArrays != _arg ) { this -> PassCellArrays = _arg ; this -> Modified ( ) ; } } ; virtual void PassCellArraysOn ( ) { this -> SetPassCellArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassCellArraysOff ( ) { this -> SetPassCellArrays ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetPassCellArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCellArrays  of  << this -> PassCellArrays ) ; return this -> PassCellArrays ; } ; /@}
## /@{ *
##  Shallow copy the input point data arrays to the output
##  Off by default.
##  virtual void SetPassCellArraysPassPointArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassPointArrays  to  << _arg ) ; if ( this -> PassPointArrays != _arg ) { this -> PassPointArrays = _arg ; this -> Modified ( ) ; } } ; virtual void PassPointArraysOn ( ) { this -> SetPassCellArraysPassPointArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassPointArraysOff ( ) { this -> SetPassCellArraysPassPointArrays ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetPassCellArraysPassPointArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointArrays  of  << this -> PassPointArrays ) ; return this -> PassPointArrays ; } ; /@} /@{ *
##  Set whether to pass the field-data arrays from the Input i.e. the input
##  providing the geometry to the output. On by default.
##  virtual void SetPassCellArraysPassPointArraysPassFieldArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassFieldArrays  to  << _arg ) ; if ( this -> PassFieldArrays != _arg ) { this -> PassFieldArrays = _arg ; this -> Modified ( ) ; } } ; virtual void PassFieldArraysOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassFieldArraysOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArrays ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetPassCellArraysPassPointArraysPassFieldArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassFieldArrays  of  << this -> PassFieldArrays ) ; return this -> PassFieldArrays ; } ; /@} /@{ *
##  Set the tolerance used to compute whether a point in the
##  source is in a cell of the input.  This value is only used
##  if ComputeTolerance is off.
##  virtual void SetPassCellArraysPassPointArraysPassFieldArraysTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetPassCellArraysPassPointArraysPassFieldArraysTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Set whether to use the Tolerance field or precompute the tolerance.
##  When on, the tolerance will be computed and the field
##  value is ignored. On by default.
##  virtual void SetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerance ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeTolerance  to  << _arg ) ; if ( this -> ComputeTolerance != _arg ) { this -> ComputeTolerance = _arg ; this -> Modified ( ) ; } } ; virtual void ComputeToleranceOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysComputeTolerance ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeToleranceOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysComputeTolerance ( static_cast < bool > ( 0 ) ) ; } ; virtual bool GetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeTolerance  of  << this -> ComputeTolerance ) ; return this -> ComputeTolerance ; } ; /@} /@{ *
##  When dealing with composite datasets, partial arrays are common i.e.
##  data-arrays that are not available in all of the blocks. By default, this
##  filter only passes those point and cell data-arrays that are available in
##  all the blocks i.e. partial array are removed.  When PassPartialArrays is
##  turned on, this behavior is changed to take a union of all arrays present
##  thus partial arrays are passed as well. However, for composite dataset
##  input, this filter still produces a non-composite output. For all those
##  locations in a block of where a particular data array is missing, this
##  filter uses vtkMath::Nan() for double and float arrays, while 0 for all
##  other types of arrays i.e int, char etc.
##  virtual void SetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArrays ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassPartialArrays  to  << _arg ) ; if ( this -> PassPartialArrays != _arg ) { this -> PassPartialArrays = _arg ; this -> Modified ( ) ; } } ; virtual bool GetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPartialArrays  of  << this -> PassPartialArrays ) ; return this -> PassPartialArrays ; } ; virtual void PassPartialArraysOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysComputeTolerancePassPartialArrays ( static_cast < bool > ( 1 ) ) ; } virtual void PassPartialArraysOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysComputeTolerancePassPartialArrays ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Sampling pattern enumeration. Please refer to class description.
##  enum SamplingPatternEnum { SAMPLE_LINE_AT_CELL_BOUNDARIES = 0 , SAMPLE_LINE_AT_SEGMENT_CENTERS = 1 , SAMPLE_LINE_UNIFORMLY = 2 } ; /@{ *
##  Setter and getter for `SamplingPattern` (values to be taken from the enumeration
##  of the same name).
##  virtual int GetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArraysSamplingPattern ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SamplingPattern  of  << this -> SamplingPattern ) ; return this -> SamplingPattern ; } ; virtual void SetSamplingPattern ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SamplingPattern  to  << _arg ) ; if ( this -> SamplingPattern != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> SamplingPattern = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSamplingPatternMinValue ( ) { return 0 ; } virtual int GetSamplingPatternMaxValue ( ) { return 2 ; } ; /@} /@{ *
##  Setter and getter for `LineResolution`. This attribute is only used if sampling
##  using `SamplingPattern::SAMPLE_LINE_UNIFORMLY`. It sets the number of points
##  in the sampling line.
##  virtual int GetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArraysSamplingPatternLineResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineResolution  of  << this -> LineResolution ) ; return this -> LineResolution ; } ; virtual void SetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArraysLineResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LineResolution  to  << _arg ) ; if ( this -> LineResolution != _arg ) { this -> LineResolution = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  If false then each result from an input line to probe results in a block in a
##  vtkMultiBlockDataSet. If true then each block is aggregated as a cell in a
##  single dataset and the output type of the filter becomes a vtkPolyData.
##
##  Default is true.
##  virtual bool GetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArraysSamplingPatternLineResolutionAggregateAsPolyData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AggregateAsPolyData  of  << this -> AggregateAsPolyData ) ; return this -> AggregateAsPolyData ; } ; virtual void SetPassCellArraysPassPointArraysPassFieldArraysToleranceComputeTolerancePassPartialArraysLineResolutionAggregateAsPolyData ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AggregateAsPolyData  to  << _arg ) ; if ( this -> AggregateAsPolyData != _arg ) { this -> AggregateAsPolyData = _arg ; this -> Modified ( ) ; } } ; virtual void AggregateAsPolyDataOn ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysComputeTolerancePassPartialArraysAggregateAsPolyData ( static_cast < bool > ( 1 ) ) ; } virtual void AggregateAsPolyDataOff ( ) { this -> SetPassCellArraysPassPointArraysPassFieldArraysComputeTolerancePassPartialArraysAggregateAsPolyData ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkProbeLineFilter ( ) ; ~ vtkProbeLineFilter ( ) override ; int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; *
##  Generate sampling point for a given cell. Supports line and polyline cells.
##  This functions is expected to return a polydata with a single polyline in it.
##  vtkSmartPointer < vtkPolyData > CreateSamplingPolyLine ( vtkPoints * points , vtkIdList * pointIds , vtkDataObject * input , double tol ) const ; /@{ *
##  Generate sampling point between p1 and p2 according to @c SamplingPattern.
##  This functions is expected to return a polydata with a single polyline in it.
##  vtkSmartPointer < vtkPolyData > SampleLineAtEachCell ( const vtkVector3d & p1 , const vtkVector3d & p2 , const std :: vector < vtkDataSet * > & input , const double tolerance ) const ; vtkSmartPointer < vtkPolyData > SampleLineUniformly ( const vtkVector3d & p1 , const vtkVector3d & p2 ) const ; /@} vtkMultiProcessController * Controller = nullptr ; int SamplingPattern = SAMPLE_LINE_AT_CELL_BOUNDARIES ; int LineResolution = 1000 ; bool AggregateAsPolyData = true ; bool PassPartialArrays = false ; bool PassCellArrays = false ; bool PassPointArrays = false ; bool PassFieldArrays = false ; bool ComputeTolerance = true ; double Tolerance = 1.0 ; private : vtkProbeLineFilter ( const vtkProbeLineFilter & ) = delete ; void operator = ( const vtkProbeLineFilter & ) = delete ; struct vtkInternals ; vtkInternals * Internal ; } ;
## Error: token expected: ; but got: [identifier]!!!
