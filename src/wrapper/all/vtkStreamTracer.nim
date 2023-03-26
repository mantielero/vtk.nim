## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStreamTracer.h
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
##  @class   vtkStreamTracer
##  @brief   Streamline generator
##
##  vtkStreamTracer is a filter that integrates a vector field to generate
##  streamlines. The integration is performed using a specified integrator,
##  by default Runge-Kutta2.
##
##  vtkStreamTracer produces polylines as the output, with each cell (i.e.,
##  polyline) representing a streamline. The attribute values associated
##  with each streamline are stored in the cell data, whereas those
##  associated with streamline-points are stored in the point data.
##
##  vtkStreamTracer supports forward (the default), backward, and combined
##  (i.e., BOTH) integration. The length of a streamline is governed by
##  specifying a maximum value either in physical arc length or in (local)
##  cell length. Otherwise, the integration terminates upon exiting the
##  flow field domain, or if the particle speed is reduced to a value less
##  than a specified terminal speed, or when a maximum number of steps is
##  completed. The specific reason for the termination is stored in a cell
##  array named ReasonForTermination.
##
##  Note that normalized vectors are adopted in streamline integration,
##  which achieves high numerical accuracy/smoothness of flow lines that is
##  particularly guaranteed for Runge-Kutta45 with adaptive step size and
##  error control). In support of this feature, the underlying step size is
##  ALWAYS in arc length unit (LENGTH_UNIT) while the 'real' time interval
##  (virtual for steady flows) that a particle actually takes to trave in a
##  single step is obtained by dividing the arc length by the LOCAL speed.
##  The overall elapsed time (i.e., the life span) of the particle is the
##  sum of those individual step-wise time intervals.
##
##  The quality of streamline integration can be controlled by setting the
##  initial integration step (InitialIntegrationStep), particularly for
##  Runge-Kutta2 and Runge-Kutta4 (with a fixed step size), and in the case
##  of Runge-Kutta45 (with an adaptive step size and error control) the
##  minimum integration step, the maximum integration step, and the maximum
##  error. These steps are in either LENGTH_UNIT or CELL_LENGTH_UNIT while
##  the error is in physical arc length. For the former two integrators,
##  there is a trade-off between integration speed and streamline quality.
##
##  The integration time, vorticity, rotation and angular velocity are stored
##  in point data arrays named "IntegrationTime", "Vorticity", "Rotation" and
##  "AngularVelocity", respectively (vorticity, rotation and angular velocity
##  are computed only when ComputeVorticity is on). All point data attributes
##  in the source dataset are interpolated on the new streamline points.
##
##  vtkStreamTracer supports integration through any type of dataset. Thus if
##  the dataset contains 2D cells like polygons or triangles, the integration
##  is constrained to lie on the surface defined by 2D cells.
##
##  The starting point, or the so-called 'seed', of a streamline may be set in
##  two different ways. Starting from global x-y-z "position" allows you to
##  start a single trace at a specified x-y-z coordinate. If you specify a
##  source object, traces will be generated from each point in the source that
##  is inside the dataset. Note that if the integration direction is BOTH,
##  then potentially 2N streamlines will be generated given N seed points.
##
##  @note This class has been threaded using vtkSMPTools. Each separate
##  streamline (corresponding to the initial seeds) is processed in a
##  separate thread. Consequently, if threading is enabled and many
##  streamlines are generated, significant performance improvement is
##  possible.
##
##  @note Field data is shallow copied to the output. When the input is a
##  composite data set, field data associated with the root block is shallow-
##  copied to the output vtkPolyData.
##
##  @sa
##  vtkRibbonFilter vtkRuledSurfaceFilter vtkInitialValueProblemSolver
##  vtkRungeKutta2 vtkRungeKutta4 vtkRungeKutta45 vtkParticleTracerBase
##  vtkParticleTracer vtkParticlePathFilter vtkStreaklineFilter
##  vtkAbstractInterpolatedVelocityField vtkCompositeInterpolatedVelocityField
##  vtkAMRInterpolatedVelocityField vtkSMPTools vtkPStreamTracer
##

import
  vtkFiltersFlowPathsModule, vtkPolyDataAlgorithm, vtkDataSetAttributesFieldList,
  vtkInitialValueProblemSolver

discard "forward decl of vtkAbstractInterpolatedVelocityField"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkExecutive"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkPoints"
##  Helper struct to convert between different length scales.

type
  vtkIntervalInformation* {.importcpp: "vtkIntervalInformation",
                           header: "vtkStreamTracer.h", bycopy.} = object
    Interval* {.importc: "Interval".}: cdouble
    Unit* {.importc: "Unit".}: cint


proc ConvertToLength*(interval: cdouble; unit: cint; cellLength: cdouble): cdouble {.
    importcpp: "vtkIntervalInformation::ConvertToLength(@)",
    header: "vtkStreamTracer.h".}
proc ConvertToLength*(interval: var vtkIntervalInformation; cellLength: cdouble): cdouble {.
    importcpp: "vtkIntervalInformation::ConvertToLength(@)",
    header: "vtkStreamTracer.h".}
## *
##  Used to specify custom conditions which are evaluated to determine whether
##  a streamline should be terminated.
##     clientdata is set by the client when setting up the callback.
##     points is the array of points integrated so far.
##     velocity velocity vector integrated to produce the streamline.
##     integrationDirection FORWARD of BACKWARD
##  The function returns true if the streamline should be terminated
##  and false otherwise.
##

type
  CustomTerminationCallbackType* = proc (clientdata: pointer; points: ptr vtkPoints;
                                      velocity: ptr vtkDataArray;
                                      integrationDirection: cint): bool
  vtkStreamTracer* {.importcpp: "vtkStreamTracer", header: "vtkStreamTracer.h",
                    bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                         ##  Construct the object to start from position (0,0,0), with forward
                                                         ##  integration, terminal speed 1.0E-12, vorticity computation on,
                                                         ##  integration step size 0.5 (in cell length unit), maximum number
                                                         ##  of steps 2000, using Runge-Kutta2, and maximum propagation 1.0
                                                         ##  (in arc length unit).
                                                         ##
    vtkStreamTracer* {.importc: "vtkStreamTracer".}: VTK_NEWINSTANCE
    ##  starting from global x-y-z position
    ##  Used by subclasses, leave alone
    ##  Prototype showing the integrator type to be set by the user.
    ##  Compute streamlines only on surface.
    ##  These are used to manage complex input types such as
    ##  multiblock / composite datasets. Basically the filter input is
    ##  converted to a composite dataset, and the point data attributes
    ##  are intersected to produce a common set of output data arrays.
    ##  convert input data to composite dataset
    ##  intersect attributes of all datasets
    ##  does the point data in the multiblocks have the same attributes?
    ##  Control execution as serial or threaded
    ##  internal use to combine information
    ##  Only relevant for this derived parallel version of vtkStreamTracer,
    ##  but needs to be defined in this class to have a uniform interface
    ##  betwen this class and the parallel override vtkPStreamTracer


proc New*(): ptr vtkStreamTracer {.importcpp: "vtkStreamTracer::New(@)",
                               header: "vtkStreamTracer.h".}
type
  vtkStreamTracerSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStreamTracer::IsTypeOf(@)", header: "vtkStreamTracer.h".}
proc IsA*(this: var vtkStreamTracer; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkStreamTracer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStreamTracer {.
    importcpp: "vtkStreamTracer::SafeDownCast(@)", header: "vtkStreamTracer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStreamTracer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStreamTracer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStreamTracer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStreamTracer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStreamTracer.h".}
proc SetStartPosition*(this: var vtkStreamTracer; _arg1: cdouble; _arg2: cdouble;
                      _arg3: cdouble) {.importcpp: "SetStartPosition",
                                      header: "vtkStreamTracer.h".}
proc SetStartPosition*(this: var vtkStreamTracer; _arg: array[3, cdouble]) {.
    importcpp: "SetStartPosition", header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double * GetStartPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  pointer  << this -> StartPosition ) ; return this -> StartPosition ; } VTK_WRAPEXCLUDE virtual void GetStartPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> StartPosition [ 0 ] ; _arg2 = this -> StartPosition [ 1 ] ; _arg3 = this -> StartPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStartPosition ( double _arg [ 3 ] ) { this -> GetStartPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetSourceData*(this: var vtkStreamTracer; source: ptr vtkDataSet) {.
    importcpp: "SetSourceData", header: "vtkStreamTracer.h".}
proc GetSource*(this: var vtkStreamTracer): ptr vtkDataSet {.importcpp: "GetSource",
    header: "vtkStreamTracer.h".}
proc SetSourceConnection*(this: var vtkStreamTracer;
                         algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkStreamTracer.h".}
type
  vtkStreamTracerUnits* {.size: sizeof(cint), importcpp: "vtkStreamTracer::Units",
                         header: "vtkStreamTracer.h".} = enum
    LENGTH_UNIT = 1, CELL_LENGTH_UNIT = 2


type
  vtkStreamTracerSolvers* {.size: sizeof(cint),
                           importcpp: "vtkStreamTracer::Solvers",
                           header: "vtkStreamTracer.h".} = enum
    RUNGE_KUTTA2, RUNGE_KUTTA4, RUNGE_KUTTA45, NONE, UNKNOWN


type
  vtkStreamTracerReasonForTermination* {.size: sizeof(cint), importcpp: "vtkStreamTracer::ReasonForTermination",
                                        header: "vtkStreamTracer.h".} = enum
    OUT_OF_DOMAIN = OUT_OF_DOMAIN, NOT_INITIALIZED = NOT_INITIALIZED,
    UNEXPECTED_VALUE = UNEXPECTED_VALUE, OUT_OF_LENGTH = 4, OUT_OF_STEPS = 5,
    STAGNATION = 6, FIXED_REASONS_FOR_TERMINATION_COUNT


proc SetIntegrator*(this: var vtkStreamTracer; a2: ptr vtkInitialValueProblemSolver) {.
    importcpp: "SetIntegrator", header: "vtkStreamTracer.h".}
proc GetnameIntegrator*(this: var vtkStreamTracer): ptr vtkInitialValueProblemSolver {.
    importcpp: "GetnameIntegrator", header: "vtkStreamTracer.h".}
proc SetIntegratorType*(this: var vtkStreamTracer; `type`: cint) {.
    importcpp: "SetIntegratorType", header: "vtkStreamTracer.h".}
proc GetIntegratorType*(this: var vtkStreamTracer): cint {.
    importcpp: "GetIntegratorType", header: "vtkStreamTracer.h".}
proc SetIntegratorTypeToRungeKutta2*(this: var vtkStreamTracer) {.
    importcpp: "SetIntegratorTypeToRungeKutta2", header: "vtkStreamTracer.h".}
proc SetIntegratorTypeToRungeKutta4*(this: var vtkStreamTracer) {.
    importcpp: "SetIntegratorTypeToRungeKutta4", header: "vtkStreamTracer.h".}
proc SetIntegratorTypeToRungeKutta45*(this: var vtkStreamTracer) {.
    importcpp: "SetIntegratorTypeToRungeKutta45", header: "vtkStreamTracer.h".}
proc SetInterpolatorTypeToDataSetPointLocator*(this: var vtkStreamTracer) {.
    importcpp: "SetInterpolatorTypeToDataSetPointLocator",
    header: "vtkStreamTracer.h".}
proc SetInterpolatorTypeToCellLocator*(this: var vtkStreamTracer) {.
    importcpp: "SetInterpolatorTypeToCellLocator", header: "vtkStreamTracer.h".}
proc SetMaximumPropagation*(this: var vtkStreamTracer; _arg: cdouble) {.
    importcpp: "SetMaximumPropagation", header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumPropagation  of  << this -> MaximumPropagation ) ; return this -> MaximumPropagation ; } ;
## Error: expected ';'!!!

proc SetIntegrationStepUnit*(this: var vtkStreamTracer; unit: cint) {.
    importcpp: "SetIntegrationStepUnit", header: "vtkStreamTracer.h".}
proc GetIntegrationStepUnit*(this: var vtkStreamTracer): cint {.
    importcpp: "GetIntegrationStepUnit", header: "vtkStreamTracer.h".}
proc SetMaximumPropagationInitialIntegrationStep*(this: var vtkStreamTracer;
    _arg: cdouble) {.importcpp: "SetMaximumPropagationInitialIntegrationStep",
                   header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagationInitialIntegrationStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InitialIntegrationStep  of  << this -> InitialIntegrationStep ) ; return this -> InitialIntegrationStep ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStep*(
    this: var vtkStreamTracer; _arg: cdouble) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStep",
    header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumIntegrationStep  of  << this -> MinimumIntegrationStep ) ; return this -> MinimumIntegrationStep ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStep*(
    this: var vtkStreamTracer; _arg: cdouble) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStep",
    header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumIntegrationStep  of  << this -> MaximumIntegrationStep ) ; return this -> MaximumIntegrationStep ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumError*(
    this: var vtkStreamTracer; _arg: cdouble) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumError",
    header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumError ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumError  of  << this -> MaximumError ) ; return this -> MaximumError ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfSteps*(
    this: var vtkStreamTracer; _arg: vtkIdType) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfSteps",
    header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual vtkIdType GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfSteps  of  << this -> MaximumNumberOfSteps ) ; return this -> MaximumNumberOfSteps ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeed*(
    this: var vtkStreamTracer; _arg: cdouble) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeed",
    header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TerminalSpeed  of  << this -> TerminalSpeed ) ; return this -> TerminalSpeed ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify whether streamlines should be computed on a surface.
##  virtual bool GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesSurfaceStreamlines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SurfaceStreamlines  of  << this -> SurfaceStreamlines ) ; return this -> SurfaceStreamlines ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlines*(
    this: var vtkStreamTracer; _arg: bool) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlines",
                                        header: "vtkStreamTracer.h".}
proc SurfaceStreamlinesOn*(this: var vtkStreamTracer) {.
    importcpp: "SurfaceStreamlinesOn", header: "vtkStreamTracer.h".}
proc SurfaceStreamlinesOff*(this: var vtkStreamTracer) {.
    importcpp: "SurfaceStreamlinesOff", header: "vtkStreamTracer.h".}
  ## /@}
const
  vtkStreamTracerFORWARD* = 0
  vtkStreamTracerBACKWARD* = 1
  vtkStreamTracerBOTH* = 2

const
  vtkStreamTracerINTERPOLATOR_WITH_DATASET_POINT_LOCATOR* = 0
  vtkStreamTracerINTERPOLATOR_WITH_CELL_LOCATOR* = 1

proc SetIntegrationDirection*(this: var vtkStreamTracer; _arg: cint) {.
    importcpp: "SetIntegrationDirection", header: "vtkStreamTracer.h".}
proc GetIntegrationDirectionMinValue*(this: var vtkStreamTracer): cint {.
    importcpp: "GetIntegrationDirectionMinValue", header: "vtkStreamTracer.h".}
proc GetIntegrationDirectionMaxValue*(this: var vtkStreamTracer): cint {.
    importcpp: "GetIntegrationDirectionMaxValue", header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual int GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesSurfaceStreamlinesIntegrationDirection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationDirection  of  << this -> IntegrationDirection ) ; return this -> IntegrationDirection ; } ;
## Error: expected ';'!!!

proc SetIntegrationDirectionToForward*(this: var vtkStreamTracer) {.
    importcpp: "SetIntegrationDirectionToForward", header: "vtkStreamTracer.h".}
proc SetIntegrationDirectionToBackward*(this: var vtkStreamTracer) {.
    importcpp: "SetIntegrationDirectionToBackward", header: "vtkStreamTracer.h".}
proc SetIntegrationDirectionToBoth*(this: var vtkStreamTracer) {.
    importcpp: "SetIntegrationDirectionToBoth", header: "vtkStreamTracer.h".}
proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticity*(
    this: var vtkStreamTracer; _arg: bool) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticity",
                                        header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual bool GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesSurfaceStreamlinesIntegrationDirectionComputeVorticity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVorticity  of  << this -> ComputeVorticity ) ; return this -> ComputeVorticity ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticityRotationScale*(
    this: var vtkStreamTracer; _arg: cdouble) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticityRotationScale",
    header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual double GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesSurfaceStreamlinesIntegrationDirectionComputeVorticityRotationScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationScale  of  << this -> RotationScale ) ; return this -> RotationScale ; } ;
## Error: expected ';'!!!

proc SetInterpolatorPrototype*(this: var vtkStreamTracer;
                              ivf: ptr vtkAbstractInterpolatedVelocityField) {.
    importcpp: "SetInterpolatorPrototype", header: "vtkStreamTracer.h".}
proc SetInterpolatorType*(this: var vtkStreamTracer; interpType: cint) {.
    importcpp: "SetInterpolatorType", header: "vtkStreamTracer.h".}
## !!!Ignored construct:  /@{ *
##  Force the filter to run stream tracer advection in serial. This affects
##  the filter only if more than one streamline is to be generated.
##  virtual bool GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesSurfaceStreamlinesIntegrationDirectionComputeVorticityRotationScaleForceSerialExecutionForceSerialExecution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceSerialExecution  of  << this -> ForceSerialExecution ) ; return this -> ForceSerialExecution ; } ;
## Error: expected ';'!!!

proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticityRotationScaleForceSerialExecution*(
    this: var vtkStreamTracer; _arg: bool) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticityRotationScaleForceSerialExecution",
                                        header: "vtkStreamTracer.h".}
proc ForceSerialExecutionOn*(this: var vtkStreamTracer) {.
    importcpp: "ForceSerialExecutionOn", header: "vtkStreamTracer.h".}
proc ForceSerialExecutionOff*(this: var vtkStreamTracer) {.
    importcpp: "ForceSerialExecutionOff", header: "vtkStreamTracer.h".}
  ## /@}
  ## *
  ##  Adds a custom termination callback.
  ##  callback is a function provided by the user that says if the streamline
  ##          should be terminated.
  ##  clientdata user specific data passed to the callback.
  ##  reasonForTermination this value will be set in the ReasonForTermination cell
  ##          array if the streamline is terminated by this callback.
  ##
proc AddCustomTerminationCallback*(this: var vtkStreamTracer;
                                  callback: CustomTerminationCallbackType;
                                  clientdata: pointer; reasonForTermination: cint) {.
    importcpp: "AddCustomTerminationCallback", header: "vtkStreamTracer.h".}
proc ConvertIntervals*(this: var vtkStreamTracer; step: var cdouble;
                      minStep: var cdouble; maxStep: var cdouble; direction: cint;
                      cellLength: cdouble) {.importcpp: "ConvertIntervals",
    header: "vtkStreamTracer.h".}
proc GenerateNormals*(this: var vtkStreamTracer; output: ptr vtkPolyData;
                     firstNormal: ptr cdouble; vecName: cstring) {.
    importcpp: "GenerateNormals", header: "vtkStreamTracer.h".}
proc CalculateVorticity*(this: var vtkStreamTracer; cell: ptr vtkGenericCell;
                        pcoords: array[3, cdouble];
                        cellVectors: ptr vtkDoubleArray;
                        vorticity: array[3, cdouble]) {.
    importcpp: "CalculateVorticity", header: "vtkStreamTracer.h".}
proc SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticityRotationScaleForceSerialExecutionUseLocalSeedSource*(
    this: var vtkStreamTracer; _arg: bool) {.importcpp: "SetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesComputeVorticityRotationScaleForceSerialExecutionUseLocalSeedSource",
                                        header: "vtkStreamTracer.h".}
## !!!Ignored construct:  virtual bool GetMaximumPropagationInitialIntegrationStepMinimumIntegrationStepMaximumIntegrationStepMaximumErrorMaximumNumberOfStepsTerminalSpeedSurfaceStreamlinesSurfaceStreamlinesIntegrationDirectionComputeVorticityRotationScaleForceSerialExecutionForceSerialExecutionUseLocalSeedSource ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLocalSeedSource  of  << this -> UseLocalSeedSource ) ; return this -> UseLocalSeedSource ; } ;
## Error: expected ';'!!!

proc UseLocalSeedSourceOn*(this: var vtkStreamTracer) {.
    importcpp: "UseLocalSeedSourceOn", header: "vtkStreamTracer.h".}
proc UseLocalSeedSourceOff*(this: var vtkStreamTracer) {.
    importcpp: "UseLocalSeedSourceOff", header: "vtkStreamTracer.h".}
  ## /@}