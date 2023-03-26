## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericStreamTracer.h
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
##  @class   vtkGenericStreamTracer
##  @brief   Streamline generator
##
##  vtkGenericStreamTracer is a filter that integrates a vector field to
##  generate streamlines. The integration is performed using the provided
##  integrator. The default is second order Runge-Kutta.
##
##  vtkGenericStreamTracer generate polylines as output. Each cell (polyline)
##  corresponds to one streamline. The values associated with each streamline
##  are stored in the cell data whereas the values associated with points
##  are stored in point data.
##
##  Note that vtkGenericStreamTracer can integrate both forward and backward.
##  The length of the streamline is controlled by specifying either
##  a maximum value in the units of length, cell length or elapsed time
##  (the elapsed time is the time each particle would have traveled if
##  flow were steady). Otherwise, the integration terminates after exiting
##  the dataset or if the particle speed is reduced to a value less than
##  the terminal speed or when a maximum number of steps is reached.
##  The reason for the termination is stored in a cell array named
##  ReasonForTermination.
##
##  The quality of integration can be controlled by setting integration
##  step (InitialIntegrationStep) and in the case of adaptive solvers
##  the maximum error, the minimum integration step and the maximum
##  integration step. All of these can have units of length, cell length
##  or elapsed time.
##
##  The integration time, vorticity, rotation and angular velocity
##  are stored in point arrays named "IntegrationTime", "Vorticity",
##  "Rotation" and "AngularVelocity" respectively (vorticity, rotation
##  and angular velocity are computed only when ComputeVorticity is on).
##  All point attributes in the source data set are interpolated on the
##  new streamline points.
##
##  vtkGenericStreamTracer integrates through any type of dataset. As a result,
##  if the dataset contains 2D cells such as polygons or triangles, the
##  integration is constrained to lie on the surface defined by the 2D cells.
##
##  The starting point of traces may be defined in two different ways.
##  Starting from global x-y-z "position" allows you to start a single trace
##  at a specified x-y-z coordinate. If you specify a source object,
##  a trace will be generated for each point in the source that is
##  inside the dataset.
##
##  @sa
##  vtkRibbonFilter vtkRuledSurfaceFilter vtkInitialValueProblemSolver
##  vtkRungeKutta2 vtkRungeKutta4 vtkRungeKutta45
##

import
  vtkFiltersGenericModule, vtkPolyDataAlgorithm, vtkInitialValueProblemSolver

discard "forward decl of vtkDataArray"
discard "forward decl of vtkGenericAdaptorCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkGenericInterpolatedVelocityField"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkGenericAttribute"
discard "forward decl of vtkGenericDataSet"
type
  vtkGenericStreamTracer* {.importcpp: "vtkGenericStreamTracer",
                           header: "vtkGenericStreamTracer.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkGenericStreamTracer* {.importc: "vtkGenericStreamTracer".}: VTK_NEWINSTANCE
    ##  starting from global x-y-z position
    ##  Prototype showing the integrator type to be set by the user.

  vtkGenericStreamTracerSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericStreamTracer::IsTypeOf(@)",
    header: "vtkGenericStreamTracer.h".}
proc IsA*(this: var vtkGenericStreamTracer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericStreamTracer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericStreamTracer {.
    importcpp: "vtkGenericStreamTracer::SafeDownCast(@)",
    header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericStreamTracer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericStreamTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericStreamTracer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericStreamTracer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericStreamTracer.h".}
proc New*(): ptr vtkGenericStreamTracer {.importcpp: "vtkGenericStreamTracer::New(@)",
                                      header: "vtkGenericStreamTracer.h".}
proc SetStartPosition*(this: var vtkGenericStreamTracer; _arg1: cdouble;
                      _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetStartPosition", header: "vtkGenericStreamTracer.h".}
proc SetStartPosition*(this: var vtkGenericStreamTracer; _arg: array[3, cdouble]) {.
    importcpp: "SetStartPosition", header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual double * GetStartPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  pointer  << this -> StartPosition ) ; return this -> StartPosition ; } VTK_WRAPEXCLUDE virtual void GetStartPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> StartPosition [ 0 ] ; _arg2 = this -> StartPosition [ 1 ] ; _arg3 = this -> StartPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStartPosition ( double _arg [ 3 ] ) { this -> GetStartPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetSourceData*(this: var vtkGenericStreamTracer; source: ptr vtkDataSet) {.
    importcpp: "SetSourceData", header: "vtkGenericStreamTracer.h".}
proc GetSource*(this: var vtkGenericStreamTracer): ptr vtkDataSet {.
    importcpp: "GetSource", header: "vtkGenericStreamTracer.h".}
proc SetSourceConnection*(this: var vtkGenericStreamTracer;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkGenericStreamTracer.h".}
proc FillInputPortInformation*(this: var vtkGenericStreamTracer; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkGenericStreamTracer.h".}
type
  vtkGenericStreamTracerUnits* {.size: sizeof(cint),
                                importcpp: "vtkGenericStreamTracer::Units",
                                header: "vtkGenericStreamTracer.h".} = enum
    TIME_UNIT, LENGTH_UNIT, CELL_LENGTH_UNIT


type
  vtkGenericStreamTracerSolvers* {.size: sizeof(cint),
                                  importcpp: "vtkGenericStreamTracer::Solvers",
                                  header: "vtkGenericStreamTracer.h".} = enum
    RUNGE_KUTTA2, RUNGE_KUTTA4, RUNGE_KUTTA45, NONE, UNKNOWN


type
  vtkGenericStreamTracerReasonForTermination* {.size: sizeof(cint),
      importcpp: "vtkGenericStreamTracer::ReasonForTermination",
      header: "vtkGenericStreamTracer.h".} = enum
    OUT_OF_DOMAIN = OUT_OF_DOMAIN, NOT_INITIALIZED = NOT_INITIALIZED,
    UNEXPECTED_VALUE = UNEXPECTED_VALUE, OUT_OF_TIME = 4, OUT_OF_STEPS = 5,
    STAGNATION = 6


proc SetIntegrator*(this: var vtkGenericStreamTracer;
                   a2: ptr vtkInitialValueProblemSolver) {.
    importcpp: "SetIntegrator", header: "vtkGenericStreamTracer.h".}
proc GetnameIntegrator*(this: var vtkGenericStreamTracer): ptr vtkInitialValueProblemSolver {.
    importcpp: "GetnameIntegrator", header: "vtkGenericStreamTracer.h".}
proc SetIntegratorType*(this: var vtkGenericStreamTracer; `type`: cint) {.
    importcpp: "SetIntegratorType", header: "vtkGenericStreamTracer.h".}
proc GetIntegratorType*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetIntegratorType", header: "vtkGenericStreamTracer.h".}
proc SetIntegratorTypeToRungeKutta2*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetIntegratorTypeToRungeKutta2",
    header: "vtkGenericStreamTracer.h".}
proc SetIntegratorTypeToRungeKutta4*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetIntegratorTypeToRungeKutta4",
    header: "vtkGenericStreamTracer.h".}
proc SetIntegratorTypeToRungeKutta45*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetIntegratorTypeToRungeKutta45",
    header: "vtkGenericStreamTracer.h".}
proc SetMaximumPropagation*(this: var vtkGenericStreamTracer; unit: cint; max: cdouble) {.
    importcpp: "SetMaximumPropagation", header: "vtkGenericStreamTracer.h".}
proc SetMaximumPropagation*(this: var vtkGenericStreamTracer; max: cdouble) {.
    importcpp: "SetMaximumPropagation", header: "vtkGenericStreamTracer.h".}
proc SetMaximumPropagationUnit*(this: var vtkGenericStreamTracer; unit: cint) {.
    importcpp: "SetMaximumPropagationUnit", header: "vtkGenericStreamTracer.h".}
proc GetMaximumPropagationUnit*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetMaximumPropagationUnit", header: "vtkGenericStreamTracer.h".}
proc GetMaximumPropagation*(this: var vtkGenericStreamTracer): cdouble {.
    importcpp: "GetMaximumPropagation", header: "vtkGenericStreamTracer.h".}
proc SetMaximumPropagationUnitToTimeUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMaximumPropagationUnitToTimeUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMaximumPropagationUnitToLengthUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMaximumPropagationUnitToLengthUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMaximumPropagationUnitToCellLengthUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMaximumPropagationUnitToCellLengthUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMinimumIntegrationStep*(this: var vtkGenericStreamTracer; unit: cint;
                               step: cdouble) {.
    importcpp: "SetMinimumIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc SetMinimumIntegrationStepUnit*(this: var vtkGenericStreamTracer; unit: cint) {.
    importcpp: "SetMinimumIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
proc SetMinimumIntegrationStep*(this: var vtkGenericStreamTracer; step: cdouble) {.
    importcpp: "SetMinimumIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc GetMinimumIntegrationStepUnit*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetMinimumIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
proc GetMinimumIntegrationStep*(this: var vtkGenericStreamTracer): cdouble {.
    importcpp: "GetMinimumIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc SetMinimumIntegrationStepUnitToTimeUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMinimumIntegrationStepUnitToTimeUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMinimumIntegrationStepUnitToLengthUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMinimumIntegrationStepUnitToLengthUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMinimumIntegrationStepUnitToCellLengthUnit*(
    this: var vtkGenericStreamTracer) {.importcpp: "SetMinimumIntegrationStepUnitToCellLengthUnit",
                                     header: "vtkGenericStreamTracer.h".}
proc SetMaximumIntegrationStep*(this: var vtkGenericStreamTracer; unit: cint;
                               step: cdouble) {.
    importcpp: "SetMaximumIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc SetMaximumIntegrationStepUnit*(this: var vtkGenericStreamTracer; unit: cint) {.
    importcpp: "SetMaximumIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
proc SetMaximumIntegrationStep*(this: var vtkGenericStreamTracer; step: cdouble) {.
    importcpp: "SetMaximumIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc GetMaximumIntegrationStepUnit*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetMaximumIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
proc GetMaximumIntegrationStep*(this: var vtkGenericStreamTracer): cdouble {.
    importcpp: "GetMaximumIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc SetMaximumIntegrationStepUnitToTimeUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMaximumIntegrationStepUnitToTimeUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMaximumIntegrationStepUnitToLengthUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetMaximumIntegrationStepUnitToLengthUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetMaximumIntegrationStepUnitToCellLengthUnit*(
    this: var vtkGenericStreamTracer) {.importcpp: "SetMaximumIntegrationStepUnitToCellLengthUnit",
                                     header: "vtkGenericStreamTracer.h".}
proc SetInitialIntegrationStep*(this: var vtkGenericStreamTracer; unit: cint;
                               step: cdouble) {.
    importcpp: "SetInitialIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc SetInitialIntegrationStepUnit*(this: var vtkGenericStreamTracer; unit: cint) {.
    importcpp: "SetInitialIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
proc SetInitialIntegrationStep*(this: var vtkGenericStreamTracer; step: cdouble) {.
    importcpp: "SetInitialIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc GetInitialIntegrationStepUnit*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetInitialIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
proc GetInitialIntegrationStep*(this: var vtkGenericStreamTracer): cdouble {.
    importcpp: "GetInitialIntegrationStep", header: "vtkGenericStreamTracer.h".}
proc SetInitialIntegrationStepUnitToTimeUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetInitialIntegrationStepUnitToTimeUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetInitialIntegrationStepUnitToLengthUnit*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetInitialIntegrationStepUnitToLengthUnit",
    header: "vtkGenericStreamTracer.h".}
proc SetInitialIntegrationStepUnitToCellLengthUnit*(
    this: var vtkGenericStreamTracer) {.importcpp: "SetInitialIntegrationStepUnitToCellLengthUnit",
                                     header: "vtkGenericStreamTracer.h".}
proc SetMaximumError*(this: var vtkGenericStreamTracer; _arg: cdouble) {.
    importcpp: "SetMaximumError", header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumError  of  << this -> MaximumError ) ; return this -> MaximumError ; } ;
## Error: expected ';'!!!

proc SetMaximumErrorMaximumNumberOfSteps*(this: var vtkGenericStreamTracer;
    _arg: vtkIdType) {.importcpp: "SetMaximumErrorMaximumNumberOfSteps",
                     header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual vtkIdType GetMaximumErrorMaximumNumberOfSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfSteps  of  << this -> MaximumNumberOfSteps ) ; return this -> MaximumNumberOfSteps ; } ;
## Error: expected ';'!!!

proc SetMaximumErrorMaximumNumberOfStepsTerminalSpeed*(
    this: var vtkGenericStreamTracer; _arg: cdouble) {.
    importcpp: "SetMaximumErrorMaximumNumberOfStepsTerminalSpeed",
    header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumErrorMaximumNumberOfStepsTerminalSpeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TerminalSpeed  of  << this -> TerminalSpeed ) ; return this -> TerminalSpeed ; } ;
## Error: expected ';'!!!

proc SetIntegrationStepUnit*(this: var vtkGenericStreamTracer; unit: cint) {.
    importcpp: "SetIntegrationStepUnit", header: "vtkGenericStreamTracer.h".}
const
  vtkGenericStreamTracerFORWARD* = 0
  vtkGenericStreamTracerBACKWARD* = 1
  vtkGenericStreamTracerBOTH* = 2

proc SetIntegrationDirection*(this: var vtkGenericStreamTracer; _arg: cint) {.
    importcpp: "SetIntegrationDirection", header: "vtkGenericStreamTracer.h".}
proc GetIntegrationDirectionMinValue*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetIntegrationDirectionMinValue",
    header: "vtkGenericStreamTracer.h".}
proc GetIntegrationDirectionMaxValue*(this: var vtkGenericStreamTracer): cint {.
    importcpp: "GetIntegrationDirectionMaxValue",
    header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual int GetMaximumErrorMaximumNumberOfStepsTerminalSpeedIntegrationDirection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationDirection  of  << this -> IntegrationDirection ) ; return this -> IntegrationDirection ; } ;
## Error: expected ';'!!!

proc SetIntegrationDirectionToForward*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetIntegrationDirectionToForward",
    header: "vtkGenericStreamTracer.h".}
proc SetIntegrationDirectionToBackward*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetIntegrationDirectionToBackward",
    header: "vtkGenericStreamTracer.h".}
proc SetIntegrationDirectionToBoth*(this: var vtkGenericStreamTracer) {.
    importcpp: "SetIntegrationDirectionToBoth", header: "vtkGenericStreamTracer.h".}
proc SetMaximumErrorMaximumNumberOfStepsTerminalSpeedComputeVorticity*(
    this: var vtkGenericStreamTracer; _arg: vtkTypeBool) {.importcpp: "SetMaximumErrorMaximumNumberOfStepsTerminalSpeedComputeVorticity",
    header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMaximumErrorMaximumNumberOfStepsTerminalSpeedIntegrationDirectionComputeVorticity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVorticity  of  << this -> ComputeVorticity ) ; return this -> ComputeVorticity ; } ;
## Error: expected ';'!!!

proc ComputeVorticityOn*(this: var vtkGenericStreamTracer) {.
    importcpp: "ComputeVorticityOn", header: "vtkGenericStreamTracer.h".}
proc ComputeVorticityOff*(this: var vtkGenericStreamTracer) {.
    importcpp: "ComputeVorticityOff", header: "vtkGenericStreamTracer.h".}
  ## /@}
  ## /@{
  ## *
  ##  This can be used to scale the rate with which the streamribbons
  ##  twist. The default is 1.
  ##
proc SetMaximumErrorMaximumNumberOfStepsTerminalSpeedComputeVorticityRotationScale*(
    this: var vtkGenericStreamTracer; _arg: cdouble) {.importcpp: "SetMaximumErrorMaximumNumberOfStepsTerminalSpeedComputeVorticityRotationScale",
    header: "vtkGenericStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumErrorMaximumNumberOfStepsTerminalSpeedIntegrationDirectionComputeVorticityRotationScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationScale  of  << this -> RotationScale ) ; return this -> RotationScale ; } ;
## Error: expected ';'!!!

proc GetInputVectorsSelection*(this: var vtkGenericStreamTracer): cstring {.
    importcpp: "GetInputVectorsSelection", header: "vtkGenericStreamTracer.h".}
proc SelectInputVectors*(this: var vtkGenericStreamTracer; fieldName: cstring) {.
    importcpp: "SelectInputVectors", header: "vtkGenericStreamTracer.h".}
proc AddInputData*(this: var vtkGenericStreamTracer; `in`: ptr vtkGenericDataSet) {.
    importcpp: "AddInputData", header: "vtkGenericStreamTracer.h".}
proc SetInterpolatorPrototype*(this: var vtkGenericStreamTracer;
                              ivf: ptr vtkGenericInterpolatedVelocityField) {.
    importcpp: "SetInterpolatorPrototype", header: "vtkGenericStreamTracer.h".}