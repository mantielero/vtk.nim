## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAnimateModes.h
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
##  @class vtkAnimateModes
##  @brief animate mode shapes
##
##  For certain file formats, like Exodus, simulation codes may use the timesteps
##  and time values to represent quantities other than time. For example, for
##  modal analysis, the natural frequency for each mode may be used as the time
##  value. vtkAnimateModes can be used to reinterpret time as mode shapes.
##  The filter can also animate vibrations for each mode shape (when
##  AnimateVibrations is set to true). In that case, the time requested by the
##  downstream pipeline is used to scale the displacement magnitude
##  for a mode shape in a sinusoidal pattern, `cos(2*pi * requested-time)`.
##
##  Historically, the VTK's Exodus reader (`vtkExodusIIReader`) had support for
##  this internally. However, when implementation the IOSS-based reader for
##  Exodus files (`vtkIossReader`), it was decided that it's cleaner to leave the
##  mode shape and vibration animation logic independent of the reader and thus
##  make it usable with other file formats too. Hence this filter was created.
##

## !!!Ignored construct:  # vtkAnimateModes_h [NewLine] # vtkAnimateModes_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] # < vector >  for std::vector [NewLine] class VTKFILTERSGENERAL_EXPORT vtkAnimateModes : public vtkPassInputTypeAlgorithm { public : static vtkAnimateModes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAnimateModes :: IsTypeOf ( type ) ; } static vtkAnimateModes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAnimateModes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAnimateModes * NewInstance ( ) const { return vtkAnimateModes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAnimateModes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAnimateModes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get whether the filter should animate the vibrations.
##  Defaults to true. When set, the requested time is used compute
##  displacements for the chosen mode shape.
##  Defaults to true.
##  virtual void SetAnimateVibrations ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AnimateVibrations  to  << _arg ) ; if ( this -> AnimateVibrations != _arg ) { this -> AnimateVibrations = _arg ; this -> Modified ( ) ; } } ; virtual bool GetAnimateVibrations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AnimateVibrations  of  << this -> AnimateVibrations ) ; return this -> AnimateVibrations ; } ; virtual void AnimateVibrationsOn ( ) { this -> SetAnimateVibrations ( static_cast < bool > ( 1 ) ) ; } virtual void AnimateVibrationsOff ( ) { this -> SetAnimateVibrations ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get the range for available mode shapes in the input. One must call
##  `UpdateInformation` before check the range since the range is determined
##  based on the number of input timesteps. The range is always `[1, <number of
##  timesteps>]`.
##  virtual int * GetModeShapesRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModeShapesRange  pointer  << this -> ModeShapesRange ) ; return this -> ModeShapesRange ; } VTK_WRAPEXCLUDE virtual void GetModeShapesRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> ModeShapesRange [ 0 ] ; _arg2 = this -> ModeShapesRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ModeShapesRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetModeShapesRange ( int _arg [ 2 ] ) { this -> GetModeShapesRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Get/Set the mode shape to animate. Defaults to 1.
##  virtual void SetModeShape ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModeShape  to  << _arg ) ; if ( this -> ModeShape != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> ModeShape = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetModeShapeMinValue ( ) { return 1 ; } virtual int GetModeShapeMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetAnimateVibrationsModeShape ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ModeShape  of  << this -> ModeShape ) ; return this -> ModeShape ; } ; /@} /@{ *
##  Get/Set whether displacements are pre-applied.
##  Default is false.
##  virtual void SetAnimateVibrationsDisplacementPreapplied ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplacementPreapplied  to  << _arg ) ; if ( this -> DisplacementPreapplied != _arg ) { this -> DisplacementPreapplied = _arg ; this -> Modified ( ) ; } } ; virtual bool GetAnimateVibrationsModeShapeDisplacementPreapplied ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementPreapplied  of  << this -> DisplacementPreapplied ) ; return this -> DisplacementPreapplied ; } ; virtual void DisplacementPreappliedOn ( ) { this -> SetAnimateVibrationsDisplacementPreapplied ( static_cast < bool > ( 1 ) ) ; } virtual void DisplacementPreappliedOff ( ) { this -> SetAnimateVibrationsDisplacementPreapplied ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set a scale factor to apply the displacements.
##  Defaults to 1.
##  virtual void SetAnimateVibrationsDisplacementPreappliedDisplacementMagnitude ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplacementMagnitude  to  << _arg ) ; if ( this -> DisplacementMagnitude != _arg ) { this -> DisplacementMagnitude = _arg ; this -> Modified ( ) ; } } ; virtual double GetAnimateVibrationsModeShapeDisplacementPreappliedDisplacementMagnitude ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementMagnitude  of  << this -> DisplacementMagnitude ) ; return this -> DisplacementMagnitude ; } ; /@} /@{ *
##  This returns (0, 1.0) as the range that can be used when animating a mode
##  shape.
##  virtual double * GetModeShapesRangeTimeRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TimeRange  pointer  << this -> TimeRange ) ; return this -> TimeRange ; } VTK_WRAPEXCLUDE virtual void GetModeShapesRangeTimeRange ( double & _arg1 , double & _arg2 ) { _arg1 = this -> TimeRange [ 0 ] ; _arg2 = this -> TimeRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TimeRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetModeShapesRangeTimeRange ( double _arg [ 2 ] ) { this -> GetModeShapesRangeTimeRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} protected : vtkAnimateModes ( ) ; ~ vtkAnimateModes ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkAnimateModes ( const vtkAnimateModes & ) = delete ; void operator = ( const vtkAnimateModes & ) = delete ; bool AnimateVibrations ; int ModeShapesRange [ 2 ] ; int ModeShape ; double DisplacementMagnitude ; bool DisplacementPreapplied ; std :: vector < double > InputTimeSteps ; double TimeRange [ 2 ] ; } ;
## Error: token expected: ; but got: [identifier]!!!
