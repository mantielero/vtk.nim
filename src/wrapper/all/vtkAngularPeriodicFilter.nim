## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPeriodicFiler.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##     This software is distributed WITHOUT ANY WARRANTY; without even
##     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##     PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkAngularPeriodicFilter
##  @brief   A filter to produce mapped angular periodic
##  multiblock dataset from a single block, by rotation.
##
##
##  Generate angular periodic dataset by rotating points, vectors and tensors
##  data arrays from an original data array.
##  The generated dataset is of the same type than the input (float or double).
##  To compute the rotation this filter needs
##  i) a number of periods, which can be the maximum, i.e. a full period,
##  ii) an angle, which can be fetched from a field data array in radian or directly
##  in degrees; iii) the axis (X, Y or Z) and the center of rotation.
##  Point coordinates are transformed, as well as all vectors (3-components) and
##  tensors (9 components) in points and cell data arrays.
##  The generated multiblock will have the same tree architecture than the input,
##  except transformed leaves are replaced by a vtkMultipieceDataSet.
##  Supported input leaf dataset type are: vtkPolyData, vtkStructuredGrid
##  and vtkUnstructuredGrid. Other data objects are rotated using the
##  transform filter (at a high cost!).
##

import
  vtkFiltersParallelModule, vtkPeriodicFilter

discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkMultiPieceDataSet"
discard "forward decl of vtkPointSet"
const
  VTK_ROTATION_MODE_DIRECT_ANGLE* = 0
  VTK_ROTATION_MODE_ARRAY_VALUE* = 1

type
  vtkAngularPeriodicFilter* {.importcpp: "vtkAngularPeriodicFilter",
                             header: "vtkAngularPeriodicFilter.h", bycopy.} = object of vtkPeriodicFilter
    vtkAngularPeriodicFilter* {.importc: "vtkAngularPeriodicFilter".}: VTK_NEWINSTANCE
    ##  user-provided array name to use as angle, for ROTATION_MODE_ARRAY_VALUE
    ##  Transform parameters
    ##  Axis to rotate around, 0 for X, 1 for Y, 2 for Z
    ##  Center of rotation


proc New*(): ptr vtkAngularPeriodicFilter {.importcpp: "vtkAngularPeriodicFilter::New(@)",
                                        header: "vtkAngularPeriodicFilter.h".}
type
  vtkAngularPeriodicFilterSuperclass* = vtkPeriodicFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAngularPeriodicFilter::IsTypeOf(@)",
    header: "vtkAngularPeriodicFilter.h".}
proc IsA*(this: var vtkAngularPeriodicFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAngularPeriodicFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAngularPeriodicFilter {.
    importcpp: "vtkAngularPeriodicFilter::SafeDownCast(@)",
    header: "vtkAngularPeriodicFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAngularPeriodicFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPeriodicFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAngularPeriodicFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAngularPeriodicFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAngularPeriodicFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAngularPeriodicFilter.h".}
proc SetComputeRotationsOnTheFly*(this: var vtkAngularPeriodicFilter; _arg: bool) {.
    importcpp: "SetComputeRotationsOnTheFly", header: "vtkAngularPeriodicFilter.h".}
## !!!Ignored construct:  virtual bool GetComputeRotationsOnTheFly ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeRotationsOnTheFly  of  << this -> ComputeRotationsOnTheFly ) ; return this -> ComputeRotationsOnTheFly ; } ;
## Error: expected ';'!!!

proc ComputeRotationsOnTheFlyOn*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "ComputeRotationsOnTheFlyOn", header: "vtkAngularPeriodicFilter.h".}
proc ComputeRotationsOnTheFlyOff*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "ComputeRotationsOnTheFlyOff", header: "vtkAngularPeriodicFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get The rotation mode.
  ##  VTK_ROTATION_MODE_DIRECT_ANGLE to specify an angle value (default),
  ##  VTK_ROTATION_MODE_ARRAY_VALUE to use value from an array in the input dataset.
  ##
proc SetRotationMode*(this: var vtkAngularPeriodicFilter; _arg: cint) {.
    importcpp: "SetRotationMode", header: "vtkAngularPeriodicFilter.h".}
proc GetRotationModeMinValue*(this: var vtkAngularPeriodicFilter): cint {.
    importcpp: "GetRotationModeMinValue", header: "vtkAngularPeriodicFilter.h".}
proc GetRotationModeMaxValue*(this: var vtkAngularPeriodicFilter): cint {.
    importcpp: "GetRotationModeMaxValue", header: "vtkAngularPeriodicFilter.h".}
## !!!Ignored construct:  virtual int GetComputeRotationsOnTheFlyRotationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationMode  of  << this -> RotationMode ) ; return this -> RotationMode ; } ;
## Error: expected ';'!!!

proc SetRotationModeToDirectAngle*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "SetRotationModeToDirectAngle",
    header: "vtkAngularPeriodicFilter.h".}
proc SetRotationModeToArrayValue*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "SetRotationModeToArrayValue", header: "vtkAngularPeriodicFilter.h".}
proc SetComputeRotationsOnTheFlyRotationAngle*(
    this: var vtkAngularPeriodicFilter; _arg: cdouble) {.
    importcpp: "SetComputeRotationsOnTheFlyRotationAngle",
    header: "vtkAngularPeriodicFilter.h".}
## !!!Ignored construct:  virtual double GetComputeRotationsOnTheFlyRotationModeRotationAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationAngle  of  << this -> RotationAngle ) ; return this -> RotationAngle ; } ;
## Error: expected ';'!!!

proc SetRotationArrayName*(this: var vtkAngularPeriodicFilter; _arg: cstring) {.
    importcpp: "SetRotationArrayName", header: "vtkAngularPeriodicFilter.h".}
proc GetRotationArrayName*(this: var vtkAngularPeriodicFilter): cstring {.
    importcpp: "GetRotationArrayName", header: "vtkAngularPeriodicFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get Rotation Axis, 0 for X, 1 for Y, 2 for Z
  ##
proc SetRotationModeRotationAxis*(this: var vtkAngularPeriodicFilter; _arg: cint) {.
    importcpp: "SetRotationModeRotationAxis", header: "vtkAngularPeriodicFilter.h".}
proc GetRotationModeMinValueRotationAxisMinValue*(
    this: var vtkAngularPeriodicFilter): cint {.
    importcpp: "GetRotationModeMinValueRotationAxisMinValue",
    header: "vtkAngularPeriodicFilter.h".}
proc GetRotationModeMaxValueRotationAxisMaxValue*(
    this: var vtkAngularPeriodicFilter): cint {.
    importcpp: "GetRotationModeMaxValueRotationAxisMaxValue",
    header: "vtkAngularPeriodicFilter.h".}
## !!!Ignored construct:  virtual int GetComputeRotationsOnTheFlyRotationModeRotationAngleRotationAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RotationAxis  of  << this -> RotationAxis ) ; return this -> RotationAxis ; } ;
## Error: expected ';'!!!

proc SetRotationAxisToX*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "SetRotationAxisToX", header: "vtkAngularPeriodicFilter.h".}
proc SetRotationAxisToY*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "SetRotationAxisToY", header: "vtkAngularPeriodicFilter.h".}
proc SetRotationAxisToZ*(this: var vtkAngularPeriodicFilter) {.
    importcpp: "SetRotationAxisToZ", header: "vtkAngularPeriodicFilter.h".}
proc SetCenter*(this: var vtkAngularPeriodicFilter; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkAngularPeriodicFilter.h".}
proc SetCenter*(this: var vtkAngularPeriodicFilter; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkAngularPeriodicFilter.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
