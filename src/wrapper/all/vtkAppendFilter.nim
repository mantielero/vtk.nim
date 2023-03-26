## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendFilter.h
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
##  @class   vtkAppendFilter
##  @brief   appends one or more datasets together into a single unstructured grid
##
##  vtkAppendFilter is a filter that appends one of more datasets into a single
##  unstructured grid. All geometry is extracted and appended, but point
##  attributes (i.e., scalars, vectors, normals, field data, etc.) are extracted
##  and appended only if all datasets have the point attributes available.
##  (For example, if one dataset has scalars but another does not, scalars will
##  not be appended.)
##
##  You can decide to merge points that are coincident by setting
##  `MergePoints`. If this flag is set, points are merged if they are within
##  `Tolerance` radius. If a point global id array is available (point data named
##  "GlobalPointIds"), then two points are merged if they share the same point global id,
##  without checking for coincident point.
##
##  @sa
##  vtkAppendPolyData
##

## !!!Ignored construct:  # vtkAppendFilter_h [NewLine] # vtkAppendFilter_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkDataSetAttributes ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataSetCollection"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkAppendFilter : public vtkUnstructuredGridAlgorithm { public : static vtkAppendFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAppendFilter :: IsTypeOf ( type ) ; } static vtkAppendFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAppendFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAppendFilter * NewInstance ( ) const { return vtkAppendFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get any input of this filter.
##  vtkDataSet * GetInput ( int idx ) ; vtkDataSet * GetInput ( ) { return this -> GetInput ( 0 ) ; } /@} /@{ *
##  Get/Set if the filter should merge coincidental points
##  Note: The filter will only merge points if the ghost cell array doesn't exist
##  Defaults to Off
##  virtual vtkTypeBool GetMergePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePoints  of  << this -> MergePoints ) ; return this -> MergePoints ; } ; virtual void SetMergePoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MergePoints  to  << _arg ) ; if ( this -> MergePoints != _arg ) { this -> MergePoints = _arg ; this -> Modified ( ) ; } } ; virtual void MergePointsOn ( ) { this -> SetMergePoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MergePointsOff ( ) { this -> SetMergePoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set the tolerance to use to find coincident points when `MergePoints`
##  is `true`. Default is 0.0.
##
##  This is simply passed on to the internal vtkLocator used to merge points.
##  @sa `vtkLocator::SetTolerance`.
##  virtual void SetTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Tolerance  to  << _arg ) ; if ( this -> Tolerance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Tolerance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetToleranceMinValue ( ) { return 0.0 ; } virtual double GetToleranceMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetMergePointsTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Get/Set whether Tolerance is treated as an absolute or relative tolerance.
##  The default is to treat it as an absolute tolerance. When off, the
##  tolerance is multiplied by the diagonal of the bounding box of the input.
##  virtual void SetMergePointsToleranceIsAbsolute ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ToleranceIsAbsolute  to  << _arg ) ; if ( this -> ToleranceIsAbsolute != _arg ) { this -> ToleranceIsAbsolute = _arg ; this -> Modified ( ) ; } } ; virtual bool GetMergePointsToleranceToleranceIsAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToleranceIsAbsolute  of  << this -> ToleranceIsAbsolute ) ; return this -> ToleranceIsAbsolute ; } ; virtual void ToleranceIsAbsoluteOn ( ) { this -> SetMergePointsToleranceIsAbsolute ( static_cast < bool > ( 1 ) ) ; } virtual void ToleranceIsAbsoluteOff ( ) { this -> SetMergePointsToleranceIsAbsolute ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Remove a dataset from the list of data to append.
##  void RemoveInputData ( vtkDataSet * in ) ; *
##  Returns a copy of the input array.  Modifications to this list
##  will not be reflected in the actual inputs.
##  vtkDataSetCollection * GetInputList ( ) ; /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::Precision enum for an explanation of the available
##  precision settings.
##  virtual void SetToleranceOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ) { this -> OutputPointsPrecision = ( _arg < SINGLE_PRECISION ? SINGLE_PRECISION : ( _arg > DEFAULT_PRECISION ? DEFAULT_PRECISION : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetToleranceMinValueOutputPointsPrecisionMinValue ( ) { return SINGLE_PRECISION ; } virtual int GetToleranceMaxValueOutputPointsPrecisionMaxValue ( ) { return DEFAULT_PRECISION ; } ; virtual int GetMergePointsToleranceToleranceIsAbsoluteOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkAppendFilter ( ) ; ~ vtkAppendFilter ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  list of data sets to append together.
##  Here as a convenience.  It is a copy of the input array. vtkDataSetCollection * InputList ;  If true we will attempt to merge points. Must also not have
##  ghost cells defined. vtkTypeBool MergePoints ; int OutputPointsPrecision ; double Tolerance ;  If true, tolerance is used as is. If false, tolerance is multiplied by
##  the diagonal of the bounding box of the input. bool ToleranceIsAbsolute ; private : vtkAppendFilter ( const vtkAppendFilter & ) = delete ; void operator = ( const vtkAppendFilter & ) = delete ;  Get all input data sets that have points, cells, or both.
##  Caller must delete the returned vtkDataSetCollection. vtkDataSetCollection * GetNonEmptyInputs ( vtkInformationVector * * inputVector ) ; void AppendArrays ( int attributesType , vtkInformationVector * * inputVector , vtkIdType * globalIds , vtkUnstructuredGrid * output , vtkIdType totalNumberOfElements ) ; } ;
## Error: token expected: ; but got: [identifier]!!!
