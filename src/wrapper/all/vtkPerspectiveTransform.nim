## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPerspectiveTransform.h
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
##  @class   vtkPerspectiveTransform
##  @brief   describes a 4x4 matrix transformation
##
##  A vtkPerspectiveTransform can be used to describe the full range of
##  homogeneous transformations.  It was designed in particular
##  to describe a camera-view of a scene.
##  <P>The order in which you set up the display coordinates (via
##  AdjustZBuffer() and AdjustViewport()), the projection (via Perspective(),
##  Frustum(), or Ortho()) and the camera view (via SetupCamera()) are
##  important.  If the transform is in PreMultiply mode, which is the
##  default, set the Viewport and ZBuffer first, then the projection, and
##  finally the camera view.  Once the view is set up, the Translate
##  and Rotate methods can be used to move the camera around in world
##  coordinates.  If the Oblique() or Stereo() methods are used, they
##  should be called just before SetupCamera().
##  <P>In PostMultiply mode, you must perform all transformations
##  in the opposite order.  This is necessary, for example, if you
##  already have a perspective transformation set up but must adjust
##  the viewport.  Another example is if you have a view transformation,
##  and wish to perform translations and rotations in the camera's
##  coordinate system rather than in world coordinates.
##  <P>The SetInput and Concatenate methods can be used to create
##  a transformation pipeline with vtkPerspectiveTransform.  See vtkTransform
##  for more information on the transformation pipeline.
##  @sa
##  vtkGeneralTransform vtkTransform vtkMatrix4x4 vtkCamera
##

import
  vtkCommonTransformsModule, vtkHomogeneousTransform, vtkMatrix4x4

type
  vtkPerspectiveTransform* {.importcpp: "vtkPerspectiveTransform",
                            header: "vtkPerspectiveTransform.h", bycopy.} = object of vtkHomogeneousTransform
    vtkPerspectiveTransform* {.importc: "vtkPerspectiveTransform".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPerspectiveTransform {.importcpp: "vtkPerspectiveTransform::New(@)",
                                       header: "vtkPerspectiveTransform.h".}
type
  vtkPerspectiveTransformSuperclass* = vtkHomogeneousTransform

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPerspectiveTransform::IsTypeOf(@)",
    header: "vtkPerspectiveTransform.h".}
proc IsA*(this: var vtkPerspectiveTransform; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPerspectiveTransform.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPerspectiveTransform {.
    importcpp: "vtkPerspectiveTransform::SafeDownCast(@)",
    header: "vtkPerspectiveTransform.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPerspectiveTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHomogeneousTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPerspectiveTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPerspectiveTransform :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPerspectiveTransform; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPerspectiveTransform.h".}
proc Identity*(this: var vtkPerspectiveTransform) {.importcpp: "Identity",
    header: "vtkPerspectiveTransform.h".}
proc Inverse*(this: var vtkPerspectiveTransform) {.importcpp: "Inverse",
    header: "vtkPerspectiveTransform.h".}
proc AdjustViewport*(this: var vtkPerspectiveTransform; oldXMin: cdouble;
                    oldXMax: cdouble; oldYMin: cdouble; oldYMax: cdouble;
                    newXMin: cdouble; newXMax: cdouble; newYMin: cdouble;
                    newYMax: cdouble) {.importcpp: "AdjustViewport",
                                      header: "vtkPerspectiveTransform.h".}
proc AdjustZBuffer*(this: var vtkPerspectiveTransform; oldNearZ: cdouble;
                   oldFarZ: cdouble; newNearZ: cdouble; newFarZ: cdouble) {.
    importcpp: "AdjustZBuffer", header: "vtkPerspectiveTransform.h".}
proc Ortho*(this: var vtkPerspectiveTransform; xmin: cdouble; xmax: cdouble;
           ymin: cdouble; ymax: cdouble; znear: cdouble; zfar: cdouble) {.
    importcpp: "Ortho", header: "vtkPerspectiveTransform.h".}
proc Frustum*(this: var vtkPerspectiveTransform; xmin: cdouble; xmax: cdouble;
             ymin: cdouble; ymax: cdouble; znear: cdouble; zfar: cdouble) {.
    importcpp: "Frustum", header: "vtkPerspectiveTransform.h".}
proc Perspective*(this: var vtkPerspectiveTransform; angle: cdouble; aspect: cdouble;
                 znear: cdouble; zfar: cdouble) {.importcpp: "Perspective",
    header: "vtkPerspectiveTransform.h".}
proc Shear*(this: var vtkPerspectiveTransform; dxdz: cdouble; dydz: cdouble;
           zplane: cdouble) {.importcpp: "Shear",
                            header: "vtkPerspectiveTransform.h".}
proc Stereo*(this: var vtkPerspectiveTransform; angle: cdouble; focaldistance: cdouble) {.
    importcpp: "Stereo", header: "vtkPerspectiveTransform.h".}
proc SetupCamera*(this: var vtkPerspectiveTransform; position: array[3, cdouble];
                 focalpoint: array[3, cdouble]; viewup: array[3, cdouble]) {.
    importcpp: "SetupCamera", header: "vtkPerspectiveTransform.h".}
proc SetupCamera*(this: var vtkPerspectiveTransform; p0: cdouble; p1: cdouble;
                 p2: cdouble; fp0: cdouble; fp1: cdouble; fp2: cdouble; vup0: cdouble;
                 vup1: cdouble; vup2: cdouble) {.importcpp: "SetupCamera",
    header: "vtkPerspectiveTransform.h".}
proc Translate*(this: var vtkPerspectiveTransform; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "Translate", header: "vtkPerspectiveTransform.h".}
proc Translate*(this: var vtkPerspectiveTransform; x: array[3, cdouble]) {.
    importcpp: "Translate", header: "vtkPerspectiveTransform.h".}
proc Translate*(this: var vtkPerspectiveTransform; x: array[3, cfloat]) {.
    importcpp: "Translate", header: "vtkPerspectiveTransform.h".}
proc RotateWXYZ*(this: var vtkPerspectiveTransform; angle: cdouble; x: cdouble;
                y: cdouble; z: cdouble) {.importcpp: "RotateWXYZ",
                                      header: "vtkPerspectiveTransform.h".}
proc RotateWXYZ*(this: var vtkPerspectiveTransform; angle: cdouble;
                axis: array[3, cdouble]) {.importcpp: "RotateWXYZ",
                                        header: "vtkPerspectiveTransform.h".}
proc RotateWXYZ*(this: var vtkPerspectiveTransform; angle: cdouble;
                axis: array[3, cfloat]) {.importcpp: "RotateWXYZ",
                                       header: "vtkPerspectiveTransform.h".}
proc RotateX*(this: var vtkPerspectiveTransform; angle: cdouble) {.
    importcpp: "RotateX", header: "vtkPerspectiveTransform.h".}
proc RotateY*(this: var vtkPerspectiveTransform; angle: cdouble) {.
    importcpp: "RotateY", header: "vtkPerspectiveTransform.h".}
proc RotateZ*(this: var vtkPerspectiveTransform; angle: cdouble) {.
    importcpp: "RotateZ", header: "vtkPerspectiveTransform.h".}
proc Scale*(this: var vtkPerspectiveTransform; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "Scale", header: "vtkPerspectiveTransform.h".}
proc Scale*(this: var vtkPerspectiveTransform; s: array[3, cdouble]) {.
    importcpp: "Scale", header: "vtkPerspectiveTransform.h".}
proc Scale*(this: var vtkPerspectiveTransform; s: array[3, cfloat]) {.
    importcpp: "Scale", header: "vtkPerspectiveTransform.h".}
proc SetMatrix*(this: var vtkPerspectiveTransform; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetMatrix", header: "vtkPerspectiveTransform.h".}
proc SetMatrix*(this: var vtkPerspectiveTransform; elements: array[16, cdouble]) {.
    importcpp: "SetMatrix", header: "vtkPerspectiveTransform.h".}
proc Concatenate*(this: var vtkPerspectiveTransform; matrix: ptr vtkMatrix4x4) {.
    importcpp: "Concatenate", header: "vtkPerspectiveTransform.h".}
proc Concatenate*(this: var vtkPerspectiveTransform; elements: array[16, cdouble]) {.
    importcpp: "Concatenate", header: "vtkPerspectiveTransform.h".}
proc Concatenate*(this: var vtkPerspectiveTransform;
                 transform: ptr vtkHomogeneousTransform) {.
    importcpp: "Concatenate", header: "vtkPerspectiveTransform.h".}
proc PreMultiply*(this: var vtkPerspectiveTransform) {.importcpp: "PreMultiply",
    header: "vtkPerspectiveTransform.h".}
proc PostMultiply*(this: var vtkPerspectiveTransform) {.importcpp: "PostMultiply",
    header: "vtkPerspectiveTransform.h".}
proc GetNumberOfConcatenatedTransforms*(this: var vtkPerspectiveTransform): cint {.
    importcpp: "GetNumberOfConcatenatedTransforms",
    header: "vtkPerspectiveTransform.h".}
proc GetConcatenatedTransform*(this: var vtkPerspectiveTransform; i: cint): ptr vtkHomogeneousTransform {.
    importcpp: "GetConcatenatedTransform", header: "vtkPerspectiveTransform.h".}
proc SetInput*(this: var vtkPerspectiveTransform; input: ptr vtkHomogeneousTransform) {.
    importcpp: "SetInput", header: "vtkPerspectiveTransform.h".}
proc GetInput*(this: var vtkPerspectiveTransform): ptr vtkHomogeneousTransform {.
    importcpp: "GetInput", header: "vtkPerspectiveTransform.h".}
proc GetInverseFlag*(this: var vtkPerspectiveTransform): cint {.
    importcpp: "GetInverseFlag", header: "vtkPerspectiveTransform.h".}
proc Push*(this: var vtkPerspectiveTransform) {.importcpp: "Push",
    header: "vtkPerspectiveTransform.h".}
proc Pop*(this: var vtkPerspectiveTransform) {.importcpp: "Pop",
    header: "vtkPerspectiveTransform.h".}
proc MakeTransform*(this: var vtkPerspectiveTransform): ptr vtkAbstractTransform {.
    importcpp: "MakeTransform", header: "vtkPerspectiveTransform.h".}
proc CircuitCheck*(this: var vtkPerspectiveTransform;
                  transform: ptr vtkAbstractTransform): cint {.
    importcpp: "CircuitCheck", header: "vtkPerspectiveTransform.h".}
proc GetMTime*(this: var vtkPerspectiveTransform): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkPerspectiveTransform.h".}