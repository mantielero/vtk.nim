## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperStreamline.h
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
##  @class   vtkHyperStreamline
##  @brief   generate hyperstreamline in arbitrary dataset
##
##  vtkHyperStreamline is a filter that integrates through a tensor field to
##  generate a hyperstreamline. The integration is along the maximum eigenvector
##  and the cross section of the hyperstreamline is defined by the two other
##  eigenvectors. Thus the shape of the hyperstreamline is "tube-like", with
##  the cross section being elliptical. Hyperstreamlines are used to visualize
##  tensor fields.
##
##  The starting point of a hyperstreamline can be defined in one of two ways.
##  First, you may specify an initial position. This is a x-y-z global
##  coordinate. The second option is to specify a starting location. This is
##  cellId, subId, and cell parametric coordinates.
##
##  The integration of the hyperstreamline occurs through the major eigenvector
##  field. IntegrationStepLength controls the step length within each cell
##  (i.e., this is the fraction of the cell length). The length of the
##  hyperstreamline is controlled by MaximumPropagationDistance. This parameter
##  is the length of the hyperstreamline in units of distance. The tube itself
##  is composed of many small sub-tubes - NumberOfSides controls the number of
##  sides in the tube, and StepLength controls the length of the sub-tubes.
##
##  Because hyperstreamlines are often created near regions of singularities, it
##  is possible to control the scaling of the tube cross section by using a
##  logarithmic scale. Use LogScalingOn to turn this capability on. The Radius
##  value controls the initial radius of the tube.
##
##  @sa
##  vtkTensorGlyph
##

## !!!Ignored construct:  # vtkHyperStreamline_h [NewLine] # vtkHyperStreamline_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_INTEGRATE_FORWARD 0 [NewLine] # VTK_INTEGRATE_BACKWARD 1 [NewLine] # VTK_INTEGRATE_BOTH_DIRECTIONS 2 [NewLine] # VTK_INTEGRATE_MAJOR_EIGENVECTOR 0 [NewLine] # VTK_INTEGRATE_MEDIUM_EIGENVECTOR 1 [NewLine] # VTK_INTEGRATE_MINOR_EIGENVECTOR 2 [NewLine] class vtkHyperArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkHyperStreamline : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperStreamline :: IsTypeOf ( type ) ; } static vtkHyperStreamline * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperStreamline * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperStreamline * NewInstance ( ) const { return vtkHyperStreamline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperStreamline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperStreamline :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with initial starting position (0,0,0); integration
##  step length 0.2; step length 0.01; forward integration; terminal
##  eigenvalue 0.0; number of sides 6; radius 0.5; and logarithmic scaling
##  off.
##  static vtkHyperStreamline * New ( ) ; *
##  Specify the start of the hyperstreamline in the cell coordinate system.
##  That is, cellId and subId (if composite cell), and parametric coordinates.
##  void SetStartLocation ( vtkIdType cellId , int subId , double pcoords [ 3 ] ) ; *
##  Specify the start of the hyperstreamline in the cell coordinate system.
##  That is, cellId and subId (if composite cell), and parametric coordinates.
##  void SetStartLocation ( vtkIdType cellId , int subId , double r , double s , double t ) ; *
##  Get the starting location of the hyperstreamline in the cell coordinate
##  system. Returns the cell that the starting point is in.
##  vtkIdType GetStartLocation ( int & subId , double pcoords [ 3 ] ) ; *
##  Specify the start of the hyperstreamline in the global coordinate system.
##  Starting from position implies that a search must be performed to find
##  initial cell to start integration from.
##  void SetStartPosition ( double x [ 3 ] ) ; *
##  Specify the start of the hyperstreamline in the global coordinate system.
##  Starting from position implies that a search must be performed to find
##  initial cell to start integration from.
##  void SetStartPosition ( double x , double y , double z ) ; *
##  Get the start position of the hyperstreamline in global x-y-z coordinates.
##  double * GetStartPosition ( ) VTK_SIZEHINT ( 3 ) ; /@{ *
##  Set / get the maximum length of the hyperstreamline expressed as absolute
##  distance (i.e., arc length) value.
##  virtual void SetMaximumPropagationDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumPropagationDistance  to  << _arg ) ; if ( this -> MaximumPropagationDistance != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> MaximumPropagationDistance = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumPropagationDistanceMinValue ( ) { return 0.0 ; } virtual double GetMaximumPropagationDistanceMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetMaximumPropagationDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumPropagationDistance  of  << this -> MaximumPropagationDistance ) ; return this -> MaximumPropagationDistance ; } ; /@} /@{ *
##  Set / get the eigenvector field through which to ingrate. It is
##  possible to integrate using the major, medium or minor
##  eigenvector field.  The major eigenvector is the eigenvector
##  whose corresponding eigenvalue is closest to positive infinity.
##  The minor eigenvector is the eigenvector whose corresponding
##  eigenvalue is closest to negative infinity.  The medium
##  eigenvector is the eigenvector whose corresponding eigenvalue is
##  between the major and minor eigenvalues.
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvector ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << IntegrationEigenvector  to  << _arg ) ; if ( this -> IntegrationEigenvector != ( _arg < VTK_INTEGRATE_MAJOR_EIGENVECTOR ? VTK_INTEGRATE_MAJOR_EIGENVECTOR : ( _arg > VTK_INTEGRATE_MINOR_EIGENVECTOR ? VTK_INTEGRATE_MINOR_EIGENVECTOR : _arg ) ) ) { this -> IntegrationEigenvector = ( _arg < VTK_INTEGRATE_MAJOR_EIGENVECTOR ? VTK_INTEGRATE_MAJOR_EIGENVECTOR : ( _arg > VTK_INTEGRATE_MINOR_EIGENVECTOR ? VTK_INTEGRATE_MINOR_EIGENVECTOR : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValue ( ) { return VTK_INTEGRATE_MAJOR_EIGENVECTOR ; } virtual int GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValue ( ) { return VTK_INTEGRATE_MINOR_EIGENVECTOR ; } ; virtual int GetMaximumPropagationDistanceIntegrationEigenvector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationEigenvector  of  << this -> IntegrationEigenvector ) ; return this -> IntegrationEigenvector ; } ; void SetIntegrationEigenvectorToMajor ( ) { this -> SetIntegrationEigenvector ( VTK_INTEGRATE_MAJOR_EIGENVECTOR ) ; } void SetIntegrationEigenvectorToMedium ( ) { this -> SetIntegrationEigenvector ( VTK_INTEGRATE_MEDIUM_EIGENVECTOR ) ; } void SetIntegrationEigenvectorToMinor ( ) { this -> SetIntegrationEigenvector ( VTK_INTEGRATE_MINOR_EIGENVECTOR ) ; } /@} *
##  Use the major eigenvector field as the vector field through which
##  to integrate.  The major eigenvector is the eigenvector whose
##  corresponding eigenvalue is closest to positive infinity.
##  void IntegrateMajorEigenvector ( ) { this -> SetIntegrationEigenvectorToMajor ( ) ; } *
##  Use the medium eigenvector field as the vector field through which
##  to integrate. The medium eigenvector is the eigenvector whose
##  corresponding eigenvalue is between the major and minor
##  eigenvalues.
##  void IntegrateMediumEigenvector ( ) { this -> SetIntegrationEigenvectorToMedium ( ) ; } *
##  Use the minor eigenvector field as the vector field through which
##  to integrate. The minor eigenvector is the eigenvector whose
##  corresponding eigenvalue is closest to negative infinity.
##  void IntegrateMinorEigenvector ( ) { this -> SetIntegrationEigenvectorToMinor ( ) ; } /@{ *
##  Set / get a nominal integration step size (expressed as a fraction of
##  the size of each cell).
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << IntegrationStepLength  to  << _arg ) ; if ( this -> IntegrationStepLength != ( _arg < 0.001 ? 0.001 : ( _arg > 0.5 ? 0.5 : _arg ) ) ) { this -> IntegrationStepLength = ( _arg < 0.001 ? 0.001 : ( _arg > 0.5 ? 0.5 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValueIntegrationStepLengthMinValue ( ) { return 0.001 ; } virtual double GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValueIntegrationStepLengthMaxValue ( ) { return 0.5 ; } ; virtual double GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationStepLength  of  << this -> IntegrationStepLength ) ; return this -> IntegrationStepLength ; } ; /@} /@{ *
##  Set / get the length of a tube segment composing the
##  hyperstreamline. The length is specified as a fraction of the
##  diagonal length of the input bounding box.
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << StepLength  to  << _arg ) ; if ( this -> StepLength != ( _arg < 0.000001 ? 0.000001 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> StepLength = ( _arg < 0.000001 ? 0.000001 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValueIntegrationStepLengthMinValueStepLengthMinValue ( ) { return 0.000001 ; } virtual double GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValueIntegrationStepLengthMaxValueStepLengthMaxValue ( ) { return 1.0 ; } ; virtual double GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StepLength  of  << this -> StepLength ) ; return this -> StepLength ; } ; /@} /@{ *
##  Specify the direction in which to integrate the hyperstreamline.
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirection ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << IntegrationDirection  to  << _arg ) ; if ( this -> IntegrationDirection != ( _arg < VTK_INTEGRATE_FORWARD ? VTK_INTEGRATE_FORWARD : ( _arg > VTK_INTEGRATE_BOTH_DIRECTIONS ? VTK_INTEGRATE_BOTH_DIRECTIONS : _arg ) ) ) { this -> IntegrationDirection = ( _arg < VTK_INTEGRATE_FORWARD ? VTK_INTEGRATE_FORWARD : ( _arg > VTK_INTEGRATE_BOTH_DIRECTIONS ? VTK_INTEGRATE_BOTH_DIRECTIONS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValueIntegrationStepLengthMinValueStepLengthMinValueIntegrationDirectionMinValue ( ) { return VTK_INTEGRATE_FORWARD ; } virtual int GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValueIntegrationStepLengthMaxValueStepLengthMaxValueIntegrationDirectionMaxValue ( ) { return VTK_INTEGRATE_BOTH_DIRECTIONS ; } ; virtual int GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationDirection  of  << this -> IntegrationDirection ) ; return this -> IntegrationDirection ; } ; void SetIntegrationDirectionToForward ( ) { this -> SetIntegrationDirection ( VTK_INTEGRATE_FORWARD ) ; } void SetIntegrationDirectionToBackward ( ) { this -> SetIntegrationDirection ( VTK_INTEGRATE_BACKWARD ) ; } void SetIntegrationDirectionToIntegrateBothDirections ( ) { this -> SetIntegrationDirection ( VTK_INTEGRATE_BOTH_DIRECTIONS ) ; } /@} /@{ *
##  Set/get terminal eigenvalue.  If major eigenvalue falls below this
##  value, hyperstreamline terminates propagation.
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TerminalEigenvalue  to  << _arg ) ; if ( this -> TerminalEigenvalue != ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> TerminalEigenvalue = ( _arg < 0.0 ? 0.0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValueIntegrationStepLengthMinValueStepLengthMinValueIntegrationDirectionMinValueTerminalEigenvalueMinValue ( ) { return 0.0 ; } virtual double GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValueIntegrationStepLengthMaxValueStepLengthMaxValueIntegrationDirectionMaxValueTerminalEigenvalueMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TerminalEigenvalue  of  << this -> TerminalEigenvalue ) ; return this -> TerminalEigenvalue ; } ; /@} /@{ *
##  Set / get the number of sides for the hyperstreamlines. At a minimum,
##  number of sides is 3.
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalueNumberOfSides ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSides  to  << _arg ) ; if ( this -> NumberOfSides != ( _arg < 3 ? 3 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfSides = ( _arg < 3 ? 3 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValueIntegrationStepLengthMinValueStepLengthMinValueIntegrationDirectionMinValueTerminalEigenvalueMinValueNumberOfSidesMinValue ( ) { return 3 ; } virtual int GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValueIntegrationStepLengthMaxValueStepLengthMaxValueIntegrationDirectionMaxValueTerminalEigenvalueMaxValueNumberOfSidesMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalueNumberOfSides ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSides  of  << this -> NumberOfSides ) ; return this -> NumberOfSides ; } ; /@} /@{ *
##  Set / get the initial tube radius. This is the maximum "elliptical"
##  radius at the beginning of the tube. Radius varies based on ratio of
##  eigenvalues.  Note that tube section is actually elliptical and may
##  become a point or line in cross section in some cases.
##  virtual void SetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalueNumberOfSidesRadius ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Radius  to  << _arg ) ; if ( this -> Radius != ( _arg < 0.0001 ? 0.0001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Radius = ( _arg < 0.0001 ? 0.0001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumPropagationDistanceMinValueIntegrationEigenvectorMinValueIntegrationStepLengthMinValueStepLengthMinValueIntegrationDirectionMinValueTerminalEigenvalueMinValueNumberOfSidesMinValueRadiusMinValue ( ) { return 0.0001 ; } virtual double GetMaximumPropagationDistanceMaxValueIntegrationEigenvectorMaxValueIntegrationStepLengthMaxValueStepLengthMaxValueIntegrationDirectionMaxValueTerminalEigenvalueMaxValueNumberOfSidesMaxValueRadiusMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalueNumberOfSidesRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ; /@} /@{ *
##  Turn on/off logarithmic scaling. If scaling is on, the log base 10
##  of the computed eigenvalues are used to scale the cross section radii.
##  virtual void SetLogScaling ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LogScaling  to  << _arg ) ; if ( this -> LogScaling != _arg ) { this -> LogScaling = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetMaximumPropagationDistanceIntegrationEigenvectorIntegrationStepLengthStepLengthIntegrationDirectionTerminalEigenvalueNumberOfSidesRadiusLogScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LogScaling  of  << this -> LogScaling ) ; return this -> LogScaling ; } ; virtual void LogScalingOn ( ) { this -> SetLogScaling ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void LogScalingOff ( ) { this -> SetLogScaling ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkHyperStreamline ( ) ; ~ vtkHyperStreamline ( ) override ;  Integrate data int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int BuildTube ( vtkDataSet * input , vtkPolyData * output ) ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Flag indicates where streamlines start from (either position or location) int StartFrom ;  Starting from cell location vtkIdType StartCell ; int StartSubId ; double StartPCoords [ 3 ] ;  starting from global x-y-z position double StartPosition [ 3 ] ;  array of hyperstreamlines vtkHyperArray * Streamers ; int NumberOfStreamers ;  length of hyperstreamline in absolute distance double MaximumPropagationDistance ;  integration direction int IntegrationDirection ;  the length (fraction of cell size) of integration steps double IntegrationStepLength ;  the length of the tube segments composing the hyperstreamline double StepLength ;  terminal propagation speed double TerminalEigenvalue ;  number of sides of tube int NumberOfSides ;  maximum radius of tube double Radius ;  boolean controls whether scaling is clamped vtkTypeBool LogScaling ;  which eigenvector to use as integration vector field int IntegrationEigenvector ; private : vtkHyperStreamline ( const vtkHyperStreamline & ) = delete ; void operator = ( const vtkHyperStreamline & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
