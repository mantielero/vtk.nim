## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeOfRevolutionFilter.h
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
##  @class   vtkVolumeOfRevolutionFilter
##  @brief   sweep data about a line to create a volume
##
##  vtkVolumeOfRevolutionFilter is a modeling filter. It takes a 2-dimensional
##  dataset as input and generates an unstructured grid on output. The input
##  dataset is swept around the axis of rotation to create dimension-elevated
##  primitives. For example, sweeping a vertex creates a series of lines;
##  sweeping a line creates a series of quads, etc.
##
##  @warning
##  The user must take care to ensure that the axis of revolution does not cross
##  through the geometry, otherwise there will be intersecting cells in the
##  output.
##
##  @sa
##  vtkRotationalExtrusionFilter
##

import
  vtkFiltersModelingModule, vtkUnstructuredGridAlgorithm

type
  vtkVolumeOfRevolutionFilter* {.importcpp: "vtkVolumeOfRevolutionFilter",
                                header: "vtkVolumeOfRevolutionFilter.h", bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkVolumeOfRevolutionFilter* {.importc: "vtkVolumeOfRevolutionFilter".}: VTK_NEWINSTANCE

  vtkVolumeOfRevolutionFilterSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumeOfRevolutionFilter::IsTypeOf(@)",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc IsA*(this: var vtkVolumeOfRevolutionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVolumeOfRevolutionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumeOfRevolutionFilter {.
    importcpp: "vtkVolumeOfRevolutionFilter::SafeDownCast(@)",
    header: "vtkVolumeOfRevolutionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumeOfRevolutionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeOfRevolutionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeOfRevolutionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumeOfRevolutionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkVolumeOfRevolutionFilter.h".}
proc New*(): ptr vtkVolumeOfRevolutionFilter {.
    importcpp: "vtkVolumeOfRevolutionFilter::New(@)",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc SetResolution*(this: var vtkVolumeOfRevolutionFilter; _arg: cint) {.
    importcpp: "SetResolution", header: "vtkVolumeOfRevolutionFilter.h".}
proc GetResolutionMinValue*(this: var vtkVolumeOfRevolutionFilter): cint {.
    importcpp: "GetResolutionMinValue", header: "vtkVolumeOfRevolutionFilter.h".}
proc GetResolutionMaxValue*(this: var vtkVolumeOfRevolutionFilter): cint {.
    importcpp: "GetResolutionMaxValue", header: "vtkVolumeOfRevolutionFilter.h".}
## !!!Ignored construct:  virtual int GetResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc SetResolutionSweepAngle*(this: var vtkVolumeOfRevolutionFilter; _arg: cdouble) {.
    importcpp: "SetResolutionSweepAngle", header: "vtkVolumeOfRevolutionFilter.h".}
proc GetResolutionMinValueSweepAngleMinValue*(
    this: var vtkVolumeOfRevolutionFilter): cdouble {.
    importcpp: "GetResolutionMinValueSweepAngleMinValue",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc GetResolutionMaxValueSweepAngleMaxValue*(
    this: var vtkVolumeOfRevolutionFilter): cdouble {.
    importcpp: "GetResolutionMaxValueSweepAngleMaxValue",
    header: "vtkVolumeOfRevolutionFilter.h".}
## !!!Ignored construct:  virtual double GetResolutionSweepAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SweepAngle  of  << this -> SweepAngle ) ; return this -> SweepAngle ; } ;
## Error: expected ';'!!!

proc SetAxisPosition*(this: var vtkVolumeOfRevolutionFilter; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetAxisPosition",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc SetAxisPosition*(this: var vtkVolumeOfRevolutionFilter; _arg: array[3, cdouble]) {.
    importcpp: "SetAxisPosition", header: "vtkVolumeOfRevolutionFilter.h".}
## !!!Ignored construct:  virtual double * GetAxisPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisPosition  pointer  << this -> AxisPosition ) ; return this -> AxisPosition ; } VTK_WRAPEXCLUDE virtual void GetAxisPosition ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisPosition [ 0 ] ; _arg2 = this -> AxisPosition [ 1 ] ; _arg3 = this -> AxisPosition [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisPosition  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAxisPosition ( double _arg [ 3 ] ) { this -> GetAxisPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAxisPositionAxisDirection*(this: var vtkVolumeOfRevolutionFilter;
                                  _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetAxisPositionAxisDirection",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc SetAxisPositionAxisDirection*(this: var vtkVolumeOfRevolutionFilter;
                                  _arg: array[3, cdouble]) {.
    importcpp: "SetAxisPositionAxisDirection",
    header: "vtkVolumeOfRevolutionFilter.h".}
## !!!Ignored construct:  virtual double * GetAxisPositionAxisDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AxisDirection  pointer  << this -> AxisDirection ) ; return this -> AxisDirection ; } VTK_WRAPEXCLUDE virtual void GetAxisPositionAxisDirection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> AxisDirection [ 0 ] ; _arg2 = this -> AxisDirection [ 1 ] ; _arg3 = this -> AxisDirection [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AxisDirection  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAxisPositionAxisDirection ( double _arg [ 3 ] ) { this -> GetAxisPositionAxisDirection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetResolutionSweepAngleOutputPointsPrecision*(
    this: var vtkVolumeOfRevolutionFilter; _arg: cint) {.
    importcpp: "SetResolutionSweepAngleOutputPointsPrecision",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc GetResolutionMinValueSweepAngleMinValueOutputPointsPrecisionMinValue*(
    this: var vtkVolumeOfRevolutionFilter): cint {.importcpp: "GetResolutionMinValueSweepAngleMinValueOutputPointsPrecisionMinValue",
    header: "vtkVolumeOfRevolutionFilter.h".}
proc GetResolutionMaxValueSweepAngleMaxValueOutputPointsPrecisionMaxValue*(
    this: var vtkVolumeOfRevolutionFilter): cint {.importcpp: "GetResolutionMaxValueSweepAngleMaxValueOutputPointsPrecisionMaxValue",
    header: "vtkVolumeOfRevolutionFilter.h".}
## !!!Ignored construct:  virtual int GetResolutionSweepAngleOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
