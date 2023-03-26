## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphere.h
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
##  @class   vtkSphere
##  @brief   implicit function for a sphere
##
##  vtkSphere computes the implicit function and/or gradient for a sphere.
##  vtkSphere is a concrete implementation of vtkImplicitFunction. Additional
##  methods are available for sphere-related computations, such as computing
##  bounding spheres for a set of points, or set of spheres.
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

type
  vtkSphere* {.importcpp: "vtkSphere", header: "vtkSphere.h", bycopy.} = object of vtkImplicitFunction
    vtkSphere* {.importc: "vtkSphere".}: VTK_NEWINSTANCE

  vtkSphereSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkSphere::IsTypeOf(@)",
    header: "vtkSphere.h".}
proc IsA*(this: var vtkSphere; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSphere.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSphere {.
    importcpp: "vtkSphere::SafeDownCast(@)", header: "vtkSphere.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSphere :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphere :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphere :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSphere; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSphere.h".}
proc New*(): ptr vtkSphere {.importcpp: "vtkSphere::New(@)", header: "vtkSphere.h".}
## using statement

proc EvaluateFunction*(this: var vtkSphere; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkSphere.h".}
proc EvaluateGradient*(this: var vtkSphere; x: array[3, cdouble]; n: array[3, cdouble]) {.
    importcpp: "EvaluateGradient", header: "vtkSphere.h".}
proc SetRadius*(this: var vtkSphere; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkSphere.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkSphere; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenter", header: "vtkSphere.h".}
proc SetCenter*(this: var vtkSphere; _arg: array[3, cdouble]) {.importcpp: "SetCenter",
    header: "vtkSphere.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc Evaluate*(center: array[3, cdouble]; R: cdouble; x: array[3, cdouble]): cdouble {.
    importcpp: "vtkSphere::Evaluate(@)", header: "vtkSphere.h".}
proc ComputeBoundingSphere*(pts: ptr cfloat; numPts: vtkIdType;
                           sphere: array[4, cfloat]; hints: array[2, vtkIdType]) {.
    importcpp: "vtkSphere::ComputeBoundingSphere(@)", header: "vtkSphere.h".}
proc ComputeBoundingSphere*(pts: ptr cdouble; numPts: vtkIdType;
                           sphere: array[4, cdouble]; hints: array[2, vtkIdType]) {.
    importcpp: "vtkSphere::ComputeBoundingSphere(@)", header: "vtkSphere.h".}
proc ComputeBoundingSphere*(spheres: ptr ptr cfloat; numSpheres: vtkIdType;
                           sphere: array[4, cfloat]; hints: array[2, vtkIdType]) {.
    importcpp: "vtkSphere::ComputeBoundingSphere(@)", header: "vtkSphere.h".}
proc ComputeBoundingSphere*(spheres: ptr ptr cdouble; numSpheres: vtkIdType;
                           sphere: array[4, cdouble]; hints: array[2, vtkIdType]) {.
    importcpp: "vtkSphere::ComputeBoundingSphere(@)", header: "vtkSphere.h".}