## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThreshold.h
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
##  @class   vtkThreshold
##  @brief   extracts cells where scalar value in cell satisfies threshold criterion
##
##  vtkThreshold is a filter that extracts cells from any dataset type that
##  satisfy a threshold criterion. A cell satisfies the criterion if the
##  scalar value of (every or any) point satisfies the criterion. The
##  criterion can take three forms: 1) greater than a particular value; 2)
##  less than a particular value; or 3) between two values. The output of this
##  filter is an unstructured grid.
##
##  Note that scalar values are available from the point and cell attribute
##  data.  By default, point data is used to obtain scalars, but you can
##  control this behavior. See the AttributeMode ivar below.
##
##  By default only the first scalar value is used in the decision. Use the ComponentMode
##  and SelectedComponent ivars to control this behavior.
##
##  @sa
##  vtkThresholdPoints vtkThresholdTextureCoords
##

## !!!Ignored construct:  # vtkThreshold_h [NewLine] # vtkThreshold_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] # VTK_ATTRIBUTE_MODE_DEFAULT 0 [NewLine] # VTK_ATTRIBUTE_MODE_USE_POINT_DATA 1 [NewLine] # VTK_ATTRIBUTE_MODE_USE_CELL_DATA 2 [NewLine]  order / values are important because of the SetClampMacro # VTK_COMPONENT_MODE_USE_SELECTED 0 [NewLine] # VTK_COMPONENT_MODE_USE_ALL 1 [NewLine] # VTK_COMPONENT_MODE_USE_ANY 2 [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkThreshold : public vtkUnstructuredGridAlgorithm { public : static vtkThreshold * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkThreshold :: IsTypeOf ( type ) ; } static vtkThreshold * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkThreshold * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkThreshold * NewInstance ( ) const { return vtkThreshold :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThreshold :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Possible values for the threshold function:
##  - THRESHOLD_BETWEEN - Keep values between the lower and upper thresholds.
##  - THRESHOLD_LOWER - Keep values below the lower threshold.
##  - THRESHOLD_UPPER - Keep values above the upper threshold.
##  enum ThresholdType { THRESHOLD_BETWEEN = 0 , THRESHOLD_LOWER , THRESHOLD_UPPER } ; /@{ *
##  Get/Set the threshold method, defining which threshold bounds to use. The default method is
##  vtkThreshold::Between.
##  void SetThresholdFunction ( int function ) ; int GetThresholdFunction ( ) ; /@} *
##  Criterion is cells whose scalars are less or equal to lower threshold.
##  VTK_DEPRECATED_IN_9_1_0 ( Use 'SetLowerThreshold' and 'SetThresholdFunction' instead. ) void ThresholdByLower ( double lower ) ; *
##  Criterion is cells whose scalars are greater or equal to upper threshold.
##  VTK_DEPRECATED_IN_9_1_0 ( Use 'SetUpperThreshold' and 'SetThresholdFunction' instead. ) void ThresholdByUpper ( double upper ) ; *
##  Criterion is cells whose scalars are between lower and upper thresholds
##  (inclusive of the end values).
##  VTK_DEPRECATED_IN_9_1_0 ( Use 'SetLowerThreshold', 'SetUpperThreshold' and 'SetThresholdFunction' instead. ) void ThresholdBetween ( double lower , double upper ) ; /@{ *
##  Set/get the upper and lower thresholds. The default values are set to +infinity and -infinity,
##  respectively.
##  virtual void SetUpperThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UpperThreshold  to  << _arg ) ; if ( this -> UpperThreshold != _arg ) { this -> UpperThreshold = _arg ; this -> Modified ( ) ; } } ; virtual void SetUpperThresholdLowerThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LowerThreshold  to  << _arg ) ; if ( this -> LowerThreshold != _arg ) { this -> LowerThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ; virtual double GetUpperThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ; /@} /@{ *
##  Control how the filter works with scalar point data and cell attribute
##  data.  By default (AttributeModeToDefault), the filter will use point
##  data, and if no point data is available, then cell data is
##  used. Alternatively you can explicitly set the filter to use point data
##  (AttributeModeToUsePointData) or cell data (AttributeModeToUseCellData).
##  virtual void SetUpperThresholdLowerThresholdAttributeMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AttributeMode  to  << _arg ) ; if ( this -> AttributeMode != _arg ) { this -> AttributeMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetUpperThresholdLowerThresholdAttributeMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeMode  of  << this -> AttributeMode ) ; return this -> AttributeMode ; } ; void SetAttributeModeToDefault ( ) { this -> SetAttributeMode ( VTK_ATTRIBUTE_MODE_DEFAULT ) ; } void SetAttributeModeToUsePointData ( ) { this -> SetAttributeMode ( VTK_ATTRIBUTE_MODE_USE_POINT_DATA ) ; } void SetAttributeModeToUseCellData ( ) { this -> SetAttributeMode ( VTK_ATTRIBUTE_MODE_USE_CELL_DATA ) ; } const char * GetAttributeModeAsString ( ) ; /@} /@{ *
##  Control how the decision of in / out is made with multi-component data.
##  The choices are to use the selected component (specified in the
##  SelectedComponent ivar), or to look at all components. When looking at
##  all components, the evaluation can pass if all the components satisfy
##  the rule (UseAll) or if any satisfy is (UseAny). The default value is
##  UseSelected.
##  virtual void SetComponentMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ComponentMode  to  << _arg ) ; if ( this -> ComponentMode != ( _arg < VTK_COMPONENT_MODE_USE_SELECTED ? VTK_COMPONENT_MODE_USE_SELECTED : ( _arg > VTK_COMPONENT_MODE_USE_ANY ? VTK_COMPONENT_MODE_USE_ANY : _arg ) ) ) { this -> ComponentMode = ( _arg < VTK_COMPONENT_MODE_USE_SELECTED ? VTK_COMPONENT_MODE_USE_SELECTED : ( _arg > VTK_COMPONENT_MODE_USE_ANY ? VTK_COMPONENT_MODE_USE_ANY : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetComponentModeMinValue ( ) { return VTK_COMPONENT_MODE_USE_SELECTED ; } virtual int GetComponentModeMaxValue ( ) { return VTK_COMPONENT_MODE_USE_ANY ; } ; virtual int GetUpperThresholdLowerThresholdAttributeModeComponentMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComponentMode  of  << this -> ComponentMode ) ; return this -> ComponentMode ; } ; void SetComponentModeToUseSelected ( ) { this -> SetComponentMode ( VTK_COMPONENT_MODE_USE_SELECTED ) ; } void SetComponentModeToUseAll ( ) { this -> SetComponentMode ( VTK_COMPONENT_MODE_USE_ALL ) ; } void SetComponentModeToUseAny ( ) { this -> SetComponentMode ( VTK_COMPONENT_MODE_USE_ANY ) ; } const char * GetComponentModeAsString ( ) ; /@} /@{ *
##  When the component mode is UseSelected, this ivar indicated the selected
##  component. The default value is 0.
##  virtual void SetComponentModeSelectedComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SelectedComponent  to  << _arg ) ; if ( this -> SelectedComponent != ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> SelectedComponent = ( _arg < 0 ? 0 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetComponentModeMinValueSelectedComponentMinValue ( ) { return 0 ; } virtual int GetComponentModeMaxValueSelectedComponentMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetUpperThresholdLowerThresholdAttributeModeComponentModeSelectedComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedComponent  of  << this -> SelectedComponent ) ; return this -> SelectedComponent ; } ; /@} /@{ *
##  If using scalars from point data, all scalars for all points in a cell
##  must satisfy the threshold criterion if AllScalars is set. Otherwise,
##  just a single scalar value satisfying the threshold criterion enables
##  will extract the cell.
##  virtual void SetUpperThresholdLowerThresholdAttributeModeAllScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AllScalars  to  << _arg ) ; if ( this -> AllScalars != _arg ) { this -> AllScalars = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetUpperThresholdLowerThresholdAttributeModeComponentModeSelectedComponentAllScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllScalars  of  << this -> AllScalars ) ; return this -> AllScalars ; } ; virtual void AllScalarsOn ( ) { this -> SetAllScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AllScalarsOff ( ) { this -> SetAllScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  If this is on (default is off), we will use the continuous interval
##  [minimum cell scalar, maxmimum cell scalar] to intersect the threshold bound
##  , rather than the set of discrete scalar values from the vertices
##  *WARNING*: For higher order cells, the scalar range of the cell is
##  not the same as the vertex scalar interval used here, so the
##  result will not be accurate.
##  virtual void SetUpperThresholdLowerThresholdAttributeModeAllScalarsUseContinuousCellRange ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseContinuousCellRange  to  << _arg ) ; if ( this -> UseContinuousCellRange != _arg ) { this -> UseContinuousCellRange = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetUpperThresholdLowerThresholdAttributeModeComponentModeSelectedComponentAllScalarsUseContinuousCellRange ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseContinuousCellRange  of  << this -> UseContinuousCellRange ) ; return this -> UseContinuousCellRange ; } ; virtual void UseContinuousCellRangeOn ( ) { this -> SetAllScalarsUseContinuousCellRange ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseContinuousCellRangeOff ( ) { this -> SetAllScalarsUseContinuousCellRange ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set the data type of the output points (See the data types defined in
##  vtkType.h). The default data type is float.
##
##  These methods are deprecated. Please use the SetOutputPointsPrecision()
##  and GetOutputPointsPrecision() methods instead.
##  void SetPointsDataTypeToDouble ( ) { this -> SetPointsDataType ( VTK_DOUBLE ) ; } void SetPointsDataTypeToFloat ( ) { this -> SetPointsDataType ( VTK_FLOAT ) ; } void SetPointsDataType ( int type ) ; int GetPointsDataType ( ) ; /@} /@{ *
##  Invert the threshold results. That is, cells that would have been in the output with this
##  option off are excluded, while cells that would have been excluded from the output are
##  included.
##  virtual void SetUpperThresholdLowerThresholdAttributeModeAllScalarsUseContinuousCellRangeInvert ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Invert  to  << _arg ) ; if ( this -> Invert != _arg ) { this -> Invert = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUpperThresholdLowerThresholdAttributeModeComponentModeSelectedComponentAllScalarsUseContinuousCellRangeInvert ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Invert  of  << this -> Invert ) ; return this -> Invert ; } ; virtual void InvertOn ( ) { this -> SetAllScalarsUseContinuousCellRangeInvert ( static_cast < bool > ( 1 ) ) ; } virtual void InvertOff ( ) { this -> SetAllScalarsUseContinuousCellRangeInvert ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  void SetOutputPointsPrecision ( int precision ) ; int GetOutputPointsPrecision ( ) const ; /@} /@{ *
##  Methods used for thresholding. vtkThreshold::Lower returns true if s is lower than the lower
##  threshold, vtkThreshold::Upper returns true if s is larger than the upper threshold, and
##  vtkThreshold::Between returns true if s is between the lower and upper thresholds.
##
##  @warning These methods use threshold values that can be set with
##  vtkThreshold::SetLowerThreshold and vtkThreshold::SetUpperThreshold. The threshold
##  method can be set using vtkThreshold::SetThresholdFunction.
##
##  @note They are not protected members for inheritance purposes. The addresses of those methods
##  are stored in one of this class attributes to figure out which version of the threshold to
##  apply, which are inaccessible if protected.
##  int Lower ( double s ) const ; int Upper ( double s ) const ; int Between ( double s ) const ; /@} protected : vtkThreshold ( ) ; ~ vtkThreshold ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; double LowerThreshold ; double UpperThreshold ; vtkTypeBool AllScalars = 1 ; vtkTypeBool UseContinuousCellRange = 0 ; bool Invert = false ; int AttributeMode = - 1 ; int ComponentMode = VTK_COMPONENT_MODE_USE_SELECTED ; int SelectedComponent = 0 ; int OutputPointsPrecision = DEFAULT_PRECISION ; int ( vtkThreshold :: * ThresholdFunction ) ( double s ) const = & vtkThreshold :: Between ; int EvaluateComponents ( vtkDataArray * scalars , vtkIdType id ) ; int EvaluateCell ( vtkDataArray * scalars , vtkIdList * cellPts , int numCellPts ) ; int EvaluateCell ( vtkDataArray * scalars , int c , vtkIdList * cellPts , int numCellPts ) ; private : vtkThreshold ( const vtkThreshold & ) = delete ; void operator = ( const vtkThreshold & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
