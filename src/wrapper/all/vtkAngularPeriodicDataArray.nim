## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAngularPeriodicDataArray.h
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
##  @class   vtkAngularPeriodicDataArray
##  @brief   Map native an Array into an angulat
##  periodic array
##
##
##  Map an array into a periodic array. Data from the original array are
##  rotated (on the fly) by the specified angle along the specified axis
##  around the specified point. Lookup is not implemented.
##  Creating the array is virtually free, accessing a tuple require some
##  computation.
##

import
  vtkPeriodicDataArray

const
  VTK_PERIODIC_ARRAY_AXIS_X* = 0
  VTK_PERIODIC_ARRAY_AXIS_Y* = 1
  VTK_PERIODIC_ARRAY_AXIS_Z* = 2

discard "forward decl of vtkMatrix3x3"
type
  vtkAngularPeriodicDataArray*[Scalar] {.importcpp: "vtkAngularPeriodicDataArray<\'0>", header: "vtkAngularPeriodicDataArray.h",
                                        bycopy.} = object of vtkPeriodicDataArray[
      Scalar]
    vtkAngularPeriodicDataArray* {.importc: "vtkAngularPeriodicDataArray".}: VTK_NEWINSTANCE
    ##  Rotation angle in degrees
    ##  Rotation angle in radians
    ##  Rotation center
    ##  Rotation Axis

  vtkAngularPeriodicDataArraySuperclass* = vtkPeriodicDataArray[Scalar]

proc IsTypeOf*[Scalar](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAngularPeriodicDataArray::IsTypeOf(@)",
    header: "vtkAngularPeriodicDataArray.h".}
proc IsA*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAngularPeriodicDataArray.h".}
proc SafeDownCast*[Scalar](o: ptr vtkObjectBase): ptr vtkAngularPeriodicDataArray[
    Scalar] {.importcpp: "vtkAngularPeriodicDataArray::SafeDownCast(@)",
             header: "vtkAngularPeriodicDataArray.h".}
## !!!Ignored construct:  < Scalar > * NewInstance ( ) const { return vtkAngularPeriodicDataArray < Scalar > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkAngularPeriodicDataArray < Scalar > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkPeriodicDataArray < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAngularPeriodicDataArray < Scalar > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  vtkAOSArrayNewInstanceMacro ( vtkAngularPeriodicDataArray < Scalar > ) ;
## Error: token expected: ) but got: <!!!

proc New*[Scalar](): ptr vtkAngularPeriodicDataArray {.
    importcpp: "vtkAngularPeriodicDataArray::New(@)",
    header: "vtkAngularPeriodicDataArray.h".}
proc PrintSelf*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar];
                       os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkAngularPeriodicDataArray.h".}
proc InitializeArray*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar];
                             inputData: ptr vtkAOSDataArrayTemplate[Scalar]) {.
    importcpp: "InitializeArray", header: "vtkAngularPeriodicDataArray.h".}
proc SetAngle*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar]; angle: cdouble) {.
    importcpp: "SetAngle", header: "vtkAngularPeriodicDataArray.h".}
## !!!Ignored construct:  virtual double GetAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Angle  of  << this -> Angle ) ; return this -> Angle ; } ;
## Error: expected ';'!!!

proc SetCenter*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar];
                       center: ptr cdouble) {.importcpp: "SetCenter",
    header: "vtkAngularPeriodicDataArray.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAxis*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar]; axis: cint) {.
    importcpp: "SetAxis", header: "vtkAngularPeriodicDataArray.h".}
## !!!Ignored construct:  virtual int GetAngleAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Axis  of  << this -> Axis ) ; return this -> Axis ; } ;
## Error: expected ';'!!!

proc SetAxisToX*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar]) {.
    importcpp: "SetAxisToX", header: "vtkAngularPeriodicDataArray.h".}
proc SetAxisToY*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar]) {.
    importcpp: "SetAxisToY", header: "vtkAngularPeriodicDataArray.h".}
proc SetAxisToZ*[Scalar](this: var vtkAngularPeriodicDataArray[Scalar]) {.
    importcpp: "SetAxisToZ", header: "vtkAngularPeriodicDataArray.h".}
import
  vtkAngularPeriodicDataArray
