## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProp3D.h
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
##  @class   vtkProp3D
##  @brief   represents an 3D object for placement in a rendered scene
##
##  vtkProp3D is an abstract class used to represent an entity in a rendering
##  scene (i.e., vtkProp3D is a vtkProp with an associated transformation
##  matrix).  It handles functions related to the position, orientation and
##  scaling. It combines these instance variables into one 4x4 transformation
##  matrix as follows: [x y z 1] = [x y z 1] Translate(-origin) Scale(scale)
##  Rot(y) Rot(x) Rot (z) Trans(origin) Trans(position). Both vtkActor and
##  vtkVolume are specializations of class vtkProp.  The constructor defaults
##  to: origin(0,0,0) position=(0,0,0) orientation=(0,0,0), no user defined
##  matrix or transform, and no texture map.
##
##  @sa
##  vtkProp vtkActor vtkAssembly vtkVolume
##

import
  vtkNew, vtkProp, vtkRenderingCoreModule, vtkWeakPointer

discard "forward decl of vtkLinearTransform"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTransform"
type
  vtkProp3D* {.importcpp: "vtkProp3D", header: "vtkProp3D.h", bycopy.} = object of vtkProp
    vtkProp3D* {.importc: "vtkProp3D".}: VTK_NEWINSTANCE
    ##  support the PokeMatrix() method

  vtkProp3DSuperclass* = vtkProp

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkProp3D::IsTypeOf(@)",
    header: "vtkProp3D.h".}
proc IsA*(this: var vtkProp3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkProp3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProp3D {.
    importcpp: "vtkProp3D::SafeDownCast(@)", header: "vtkProp3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProp3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProp3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProp3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProp3D.h".}
proc ShallowCopy*(this: var vtkProp3D; prop: ptr vtkProp) {.importcpp: "ShallowCopy",
    header: "vtkProp3D.h".}
proc SetPosition*(this: var vtkProp3D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetPosition", header: "vtkProp3D.h".}
  ## /@}
proc SetPosition*(this: var vtkProp3D; pos: array[3, cdouble]) {.
    importcpp: "SetPosition", header: "vtkProp3D.h".}
## !!!Ignored construct:  virtual double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Position [ i ] ; } } ;
## Error: expected ';'!!!

proc AddPosition*(this: var vtkProp3D; deltaPosition: array[3, cdouble]) {.
    importcpp: "AddPosition", header: "vtkProp3D.h".}
proc AddPosition*(this: var vtkProp3D; deltaX: cdouble; deltaY: cdouble; deltaZ: cdouble) {.
    importcpp: "AddPosition", header: "vtkProp3D.h".}
proc SetOrigin*(this: var vtkProp3D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetOrigin", header: "vtkProp3D.h".}
proc SetOrigin*(this: var vtkProp3D; pos: array[3, cdouble]) {.importcpp: "SetOrigin",
    header: "vtkProp3D.h".}
## !!!Ignored construct:  virtual double * GetPositionOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetPositionOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScale*(this: var vtkProp3D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetScale", header: "vtkProp3D.h".}
proc SetScale*(this: var vtkProp3D; scale: array[3, cdouble]) {.importcpp: "SetScale",
    header: "vtkProp3D.h".}
## !!!Ignored construct:  virtual double * GetPositionOriginScale ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  pointer  << this -> Scale ) ; return this -> Scale ; } VTK_WRAPEXCLUDE virtual void GetPositionOriginScale ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Scale [ i ] ; } } ;
## Error: expected ';'!!!

proc SetScale*(this: var vtkProp3D; s: cdouble) {.importcpp: "SetScale",
    header: "vtkProp3D.h".}
proc SetUserTransform*(this: var vtkProp3D; transform: ptr vtkLinearTransform) {.
    importcpp: "SetUserTransform", header: "vtkProp3D.h".}
proc GetnameUserTransform*(this: var vtkProp3D): ptr vtkLinearTransform {.
    importcpp: "GetnameUserTransform", header: "vtkProp3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  The UserMatrix can be used in place of UserTransform.
  ##
proc SetUserMatrix*(this: var vtkProp3D; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetUserMatrix", header: "vtkProp3D.h".}
proc GetUserMatrix*(this: var vtkProp3D): ptr vtkMatrix4x4 {.
    importcpp: "GetUserMatrix", header: "vtkProp3D.h".}
proc GetMatrix*(this: var vtkProp3D; result: ptr vtkMatrix4x4) {.
    importcpp: "GetMatrix", header: "vtkProp3D.h".}
proc GetMatrix*(this: var vtkProp3D; result: array[16, cdouble]) {.
    importcpp: "GetMatrix", header: "vtkProp3D.h".}
proc GetModelToWorldMatrix*(this: var vtkProp3D; result: ptr vtkMatrix4x4) {.
    importcpp: "GetModelToWorldMatrix", header: "vtkProp3D.h".}
proc SetPropertiesFromModelToWorldMatrix*(this: var vtkProp3D;
    modelToWorld: ptr vtkMatrix4x4) {.importcpp: "SetPropertiesFromModelToWorldMatrix",
                                   header: "vtkProp3D.h".}
proc GetBounds*(this: var vtkProp3D; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkProp3D.h".}
## !!!Ignored construct:  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override = 0 ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Get the center of the bounding box in world coordinates.
##  double * GetCenter ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Get the Prop3D's x range in world coordinates.
##  double * GetXRange ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Get the Prop3D's y range in world coordinates.
##  double * GetYRange ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

## !!!Ignored construct:  *
##  Get the Prop3D's z range in world coordinates.
##  double * GetZRange ( ) VTK_SIZEHINT ( 2 ) ;
## Error: expected ';'!!!

proc GetLength*(this: var vtkProp3D): cdouble {.importcpp: "GetLength",
    header: "vtkProp3D.h".}
proc RotateX*(this: var vtkProp3D; a2: cdouble) {.importcpp: "RotateX",
    header: "vtkProp3D.h".}
proc RotateY*(this: var vtkProp3D; a2: cdouble) {.importcpp: "RotateY",
    header: "vtkProp3D.h".}
proc RotateZ*(this: var vtkProp3D; a2: cdouble) {.importcpp: "RotateZ",
    header: "vtkProp3D.h".}
proc RotateWXYZ*(this: var vtkProp3D; w: cdouble; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "RotateWXYZ", header: "vtkProp3D.h".}
proc SetOrientation*(this: var vtkProp3D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetOrientation", header: "vtkProp3D.h".}
proc SetOrientation*(this: var vtkProp3D; orientation: array[3, cdouble]) {.
    importcpp: "SetOrientation", header: "vtkProp3D.h".}
## !!!Ignored construct:  /@{ *
##  Returns the orientation of the Prop3D as s vector of X,Y and Z rotation.
##  The ordering in which these rotations must be done to generate the
##  same matrix is RotateZ, RotateX, and finally RotateY. See also
##  SetOrientation.
##  double * GetOrientation ( ) VTK_SIZEHINT ( 3 ) ;
## Error: expected ';'!!!

proc GetOrientation*(this: var vtkProp3D; orentation: array[3, cdouble]) {.
    importcpp: "GetOrientation", header: "vtkProp3D.h".}
## !!!Ignored construct:  /@} *
##  Returns the WXYZ orientation of the Prop3D.
##  double * GetOrientationWXYZ ( ) VTK_SIZEHINT ( 4 ) ;
## Error: expected ';'!!!

proc AddOrientation*(this: var vtkProp3D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "AddOrientation", header: "vtkProp3D.h".}
proc AddOrientation*(this: var vtkProp3D; orentation: array[3, cdouble]) {.
    importcpp: "AddOrientation", header: "vtkProp3D.h".}
proc PokeMatrix*(this: var vtkProp3D; matrix: ptr vtkMatrix4x4) {.
    importcpp: "PokeMatrix", header: "vtkProp3D.h".}
proc InitPathTraversal*(this: var vtkProp3D) {.importcpp: "InitPathTraversal",
    header: "vtkProp3D.h".}
proc GetMTime*(this: var vtkProp3D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkProp3D.h".}
proc GetUserTransformMatrixMTime*(this: var vtkProp3D): vtkMTimeType {.
    importcpp: "GetUserTransformMatrixMTime", header: "vtkProp3D.h".}
proc ComputeMatrix*(this: var vtkProp3D) {.importcpp: "ComputeMatrix",
                                       header: "vtkProp3D.h".}
proc GetMatrix*(this: var vtkProp3D): ptr vtkMatrix4x4 {.importcpp: "GetMatrix",
    header: "vtkProp3D.h".}
## !!!Ignored construct:  /@} /@{ *
##  Is the matrix for this actor identity
##  virtual int GetIsIdentityIsIdentity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsIdentity  of  << this -> IsIdentity ) ; return this -> IsIdentity ; } ;
## Error: expected ';'!!!

type
  vtkProp3DCoordinateSystems* {.size: sizeof(cint),
                               importcpp: "vtkProp3D::CoordinateSystems",
                               header: "vtkProp3D.h".} = enum
    WORLD = 0, PHYSICAL = 1, DEVICE = 2


proc SetCoordinateSystemToWorld*(this: var vtkProp3D) {.
    importcpp: "SetCoordinateSystemToWorld", header: "vtkProp3D.h".}
proc SetCoordinateSystemToPhysical*(this: var vtkProp3D) {.
    importcpp: "SetCoordinateSystemToPhysical", header: "vtkProp3D.h".}
proc SetCoordinateSystemToDevice*(this: var vtkProp3D) {.
    importcpp: "SetCoordinateSystemToDevice", header: "vtkProp3D.h".}
proc SetCoordinateSystem*(this: var vtkProp3D; val: vtkProp3DCoordinateSystems) {.
    importcpp: "SetCoordinateSystem", header: "vtkProp3D.h".}
## !!!Ignored construct:  virtual CoordinateSystems GetIsIdentityIsIdentityCoordinateSystem ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoordinateSystem  of  << this -> CoordinateSystem ) ; return this -> CoordinateSystem ; } ;
## Error: expected ';'!!!

proc GetCoordinateSystemAsString*(this: var vtkProp3D): cstring {.
    importcpp: "GetCoordinateSystemAsString", header: "vtkProp3D.h".}
proc SetCoordinateSystemRenderer*(this: var vtkProp3D; ren: ptr vtkRenderer) {.
    importcpp: "SetCoordinateSystemRenderer", header: "vtkProp3D.h".}
proc GetCoordinateSystemRenderer*(this: var vtkProp3D): ptr vtkRenderer {.
    importcpp: "GetCoordinateSystemRenderer", header: "vtkProp3D.h".}
proc SetCoordinateSystemDevice*(this: var vtkProp3D; _arg: cint) {.
    importcpp: "SetCoordinateSystemDevice", header: "vtkProp3D.h".}
## !!!Ignored construct:  virtual int GetIsIdentityIsIdentityCoordinateSystemCoordinateSystemDevice ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoordinateSystemDevice  of  << this -> CoordinateSystemDevice ) ; return this -> CoordinateSystemDevice ; } ;
## Error: expected ';'!!!
