## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlaneSource.h
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
##  @class   vtkPlaneSource
##  @brief   create an array of quadrilaterals located in a plane
##
##  vtkPlaneSource creates an m x n array of quadrilaterals arranged as
##  a regular tiling in a plane. The plane is defined by specifying an
##  origin point, and then two other points that, together with the
##  origin, define two axes for the plane. These axes do not have to be
##  orthogonal - so you can create a parallelogram. (The axes must not
##  be parallel.) The resolution of the plane (i.e., number of subdivisions) is
##  controlled by the ivars XResolution and YResolution.
##
##  By default, the plane is centered at the origin and perpendicular to the
##  z-axis, with width and height of length 1 and resolutions set to 1.
##
##  There are three convenience methods that allow you to easily move the
##  plane.  The first, SetNormal(), allows you to specify the plane
##  normal. The effect of this method is to rotate the plane around the center
##  of the plane, aligning the plane normal with the specified normal. The
##  rotation is about the axis defined by the cross product of the current
##  normal with the new normal. The second, SetCenter(), translates the center
##  of the plane to the specified center point. The third method, Push(),
##  allows you to translate the plane along the plane normal by the distance
##  specified. (Negative Push values translate the plane in the negative
##  normal direction.)  Note that the SetNormal(), SetCenter() and Push()
##  methods modify the Origin, Point1, and/or Point2 instance variables.
##
##  @warning
##  The normal to the plane will point in the direction of the cross product
##  of the first axis (Origin->Point1) with the second (Origin->Point2). This
##  also affects the normals to the generated polygons.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkPlaneSource* {.importcpp: "vtkPlaneSource", header: "vtkPlaneSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkPlaneSource* {.importc: "vtkPlaneSource".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkPlaneSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlaneSource.h".}
type
  vtkPlaneSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlaneSource::IsTypeOf(@)", header: "vtkPlaneSource.h".}
proc IsA*(this: var vtkPlaneSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPlaneSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlaneSource {.
    importcpp: "vtkPlaneSource::SafeDownCast(@)", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlaneSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlaneSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlaneSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkPlaneSource {.importcpp: "vtkPlaneSource::New(@)",
                              header: "vtkPlaneSource.h".}
proc SetXResolution*(this: var vtkPlaneSource; _arg: cint) {.
    importcpp: "SetXResolution", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual int GetXResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XResolution  of  << this -> XResolution ) ; return this -> XResolution ; } ;
## Error: expected ';'!!!

proc SetXResolutionYResolution*(this: var vtkPlaneSource; _arg: cint) {.
    importcpp: "SetXResolutionYResolution", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual int GetXResolutionYResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YResolution  of  << this -> YResolution ) ; return this -> YResolution ; } ;
## Error: expected ';'!!!

proc SetResolution*(this: var vtkPlaneSource; xR: cint; yR: cint) {.
    importcpp: "SetResolution", header: "vtkPlaneSource.h".}
proc GetResolution*(this: var vtkPlaneSource; xR: var cint; yR: var cint) {.
    importcpp: "GetResolution", header: "vtkPlaneSource.h".}
proc SetOrigin*(this: var vtkPlaneSource; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetOrigin", header: "vtkPlaneSource.h".}
proc SetOrigin*(this: var vtkPlaneSource; _arg: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoint1*(this: var vtkPlaneSource; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetPoint1", header: "vtkPlaneSource.h".}
proc SetPoint1*(this: var vtkPlaneSource; pnt: array[3, cdouble]) {.
    importcpp: "SetPoint1", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point1  pointer  << this -> Point1 ) ; return this -> Point1 ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point1 [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoint2*(this: var vtkPlaneSource; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetPoint2", header: "vtkPlaneSource.h".}
proc SetPoint2*(this: var vtkPlaneSource; pnt: array[3, cdouble]) {.
    importcpp: "SetPoint2", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point2  pointer  << this -> Point2 ) ; return this -> Point2 ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point2 [ i ] ; } } ;
## Error: expected ';'!!!

proc GetAxis1*(this: var vtkPlaneSource; a1: array[3, cdouble]) {.
    importcpp: "GetAxis1", header: "vtkPlaneSource.h".}
proc GetAxis2*(this: var vtkPlaneSource; a2: array[3, cdouble]) {.
    importcpp: "GetAxis2", header: "vtkPlaneSource.h".}
proc SetCenter*(this: var vtkPlaneSource; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetCenter", header: "vtkPlaneSource.h".}
proc SetCenter*(this: var vtkPlaneSource; center: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2Center ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2Center ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetNormal*(this: var vtkPlaneSource; nx: cdouble; ny: cdouble; nz: cdouble) {.
    importcpp: "SetNormal", header: "vtkPlaneSource.h".}
proc SetNormal*(this: var vtkPlaneSource; n: array[3, cdouble]) {.
    importcpp: "SetNormal", header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual double * GetOriginPoint1Point2CenterNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetOriginPoint1Point2CenterNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ;
## Error: expected ';'!!!

proc Push*(this: var vtkPlaneSource; distance: cdouble) {.importcpp: "Push",
    header: "vtkPlaneSource.h".}
proc Rotate*(this: var vtkPlaneSource; angle: cdouble; rotationAxis: array[3, cdouble]) {.
    importcpp: "Rotate", header: "vtkPlaneSource.h".}
proc SetXResolutionYResolutionOutputPointsPrecision*(this: var vtkPlaneSource;
    _arg: cint) {.importcpp: "SetXResolutionYResolutionOutputPointsPrecision",
                header: "vtkPlaneSource.h".}
## !!!Ignored construct:  virtual int GetXResolutionYResolutionOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
