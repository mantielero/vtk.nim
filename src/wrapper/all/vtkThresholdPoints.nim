## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThresholdPoints.h
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
##  @class   vtkThresholdPoints
##  @brief   extracts points whose scalar value satisfies threshold criterion
##
##  vtkThresholdPoints is a filter that extracts points from a dataset that
##  satisfy a threshold criterion. The criterion can take three forms:
##  1) greater than a particular value; 2) less than a particular value; or
##  3) between a particular value. The output of the filter is polygonal data.
##
##  @sa
##  vtkThreshold vtkSelectEnclosedPoints vtkExtractEnclosedPoints
##

## !!!Ignored construct:  # vtkThresholdPoints_h [NewLine] # vtkThresholdPoints_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkThresholdPoints : public vtkPolyDataAlgorithm { public : static vtkThresholdPoints * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkThresholdPoints :: IsTypeOf ( type ) ; } static vtkThresholdPoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkThresholdPoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkThresholdPoints * NewInstance ( ) const { return vtkThresholdPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThresholdPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThresholdPoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Criterion is cells whose scalars are less or equal to lower threshold.
##  void ThresholdByLower ( double lower ) ; *
##  Criterion is cells whose scalars are greater or equal to upper threshold.
##  void ThresholdByUpper ( double upper ) ; *
##  Criterion is cells whose scalars are between lower and upper thresholds
##  (inclusive of the end values).
##  void ThresholdBetween ( double lower , double upper ) ; /@{ *
##  Set/Get the upper threshold.
##  virtual void SetUpperThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UpperThreshold  to  << _arg ) ; if ( this -> UpperThreshold != _arg ) { this -> UpperThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ; /@} /@{ *
##  Set/Get the lower threshold.
##  virtual void SetUpperThresholdLowerThreshold ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LowerThreshold  to  << _arg ) ; if ( this -> LowerThreshold != _arg ) { this -> LowerThreshold = _arg ; this -> Modified ( ) ; } } ; virtual double GetUpperThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ; /@} /@{ *
##  Set/Get the component to threshold. Set this to a value greater than the number of
##  components in the selected data array to threshold by magnitude.
##  virtual void SetUpperThresholdLowerThresholdInputArrayComponent ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  InputArrayComponent  to  << _arg ) ; if ( this -> InputArrayComponent != _arg ) { this -> InputArrayComponent = _arg ; this -> Modified ( ) ; } } ; virtual int GetUpperThresholdLowerThresholdInputArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputArrayComponent  of  << this -> InputArrayComponent ) ; return this -> InputArrayComponent ; } ; /@} /@{ *
##  Set/get the desired precision for the output types. See the documentation
##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
##  the available precision settings.
##  virtual void SetUpperThresholdLowerThresholdInputArrayComponentOutputPointsPrecision ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputPointsPrecision  to  << _arg ) ; if ( this -> OutputPointsPrecision != _arg ) { this -> OutputPointsPrecision = _arg ; this -> Modified ( ) ; } } ; virtual int GetUpperThresholdLowerThresholdInputArrayComponentOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ; /@} protected : vtkThresholdPoints ( ) ; ~ vtkThresholdPoints ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; double LowerThreshold ; double UpperThreshold ; int InputArrayComponent ; int OutputPointsPrecision ; int ( vtkThresholdPoints :: * ThresholdFunction ) ( double s ) ; int Lower ( double s ) { return ( s <= this -> LowerThreshold ? 1 : 0 ) ; } int Upper ( double s ) { return ( s >= this -> UpperThreshold ? 1 : 0 ) ; } int Between ( double s ) { return ( s >= this -> LowerThreshold ? ( s <= this -> UpperThreshold ? 1 : 0 ) : 0 ) ; } private : vtkThresholdPoints ( const vtkThresholdPoints & ) = delete ; void operator = ( const vtkThresholdPoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
