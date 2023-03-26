## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageActor.h
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
##  @class   vtkImageActor
##  @brief   draw an image in a rendered 3D scene
##
##  vtkImageActor is used to render an image in a 3D scene.  The image
##  is placed at the origin of the image, and its size is controlled by the
##  image dimensions and image spacing. The orientation of the image is
##  orthogonal to one of the x-y-z axes depending on which plane the
##  image is defined in.  This class has been mostly superseded by
##  the vtkImageSlice class, which provides more functionality than
##  vtkImageActor.
##
##  @sa
##  vtkImageData vtkImageSliceMapper vtkImageProperty
##

import
  vtkImageSlice, vtkRenderingCoreModule

discard "forward decl of vtkAlgorithm"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkImageData"
type
  vtkImageActor* {.importcpp: "vtkImageActor", header: "vtkImageActor.h", bycopy.} = object of vtkImageSlice
    vtkImageActor* {.importc: "vtkImageActor".}: VTK_NEWINSTANCE
    ##  Convenience function that returns the input of the mapper

  vtkImageActorSuperclass* = vtkImageSlice

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageActor::IsTypeOf(@)", header: "vtkImageActor.h".}
proc IsA*(this: var vtkImageActor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageActor {.
    importcpp: "vtkImageActor::SafeDownCast(@)", header: "vtkImageActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSlice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageActor.h".}
proc New*(): ptr vtkImageActor {.importcpp: "vtkImageActor::New(@)",
                             header: "vtkImageActor.h".}
proc SetInputData*(this: var vtkImageActor; a2: ptr vtkImageData) {.
    importcpp: "SetInputData", header: "vtkImageActor.h".}
proc GetInput*(this: var vtkImageActor): ptr vtkImageData {.importcpp: "GetInput",
    header: "vtkImageActor.h".}
proc SetInterpolate*(this: var vtkImageActor; a2: vtkTypeBool) {.
    importcpp: "SetInterpolate", header: "vtkImageActor.h".}
proc GetInterpolate*(this: var vtkImageActor): vtkTypeBool {.
    importcpp: "GetInterpolate", header: "vtkImageActor.h".}
proc InterpolateOn*(this: var vtkImageActor) {.importcpp: "InterpolateOn",
    header: "vtkImageActor.h".}
proc InterpolateOff*(this: var vtkImageActor) {.importcpp: "InterpolateOff",
    header: "vtkImageActor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the object's opacity. 1.0 is totally opaque and 0.0 is completely
  ##  transparent. The default is 1.0.
  ##
proc SetOpacity*(this: var vtkImageActor; a2: cdouble) {.importcpp: "SetOpacity",
    header: "vtkImageActor.h".}
proc GetOpacity*(this: var vtkImageActor): cdouble {.importcpp: "GetOpacity",
    header: "vtkImageActor.h".}
proc GetOpacityMinValue*(this: var vtkImageActor): cdouble {.
    importcpp: "GetOpacityMinValue", header: "vtkImageActor.h".}
proc GetOpacityMaxValue*(this: var vtkImageActor): cdouble {.
    importcpp: "GetOpacityMaxValue", header: "vtkImageActor.h".}
proc SetDisplayExtent*(this: var vtkImageActor; extent: array[6, cint]) {.
    importcpp: "SetDisplayExtent", header: "vtkImageActor.h".}
proc SetDisplayExtent*(this: var vtkImageActor; minX: cint; maxX: cint; minY: cint;
                      maxY: cint; minZ: cint; maxZ: cint) {.
    importcpp: "SetDisplayExtent", header: "vtkImageActor.h".}
proc GetDisplayExtent*(this: var vtkImageActor; extent: array[6, cint]) {.
    importcpp: "GetDisplayExtent", header: "vtkImageActor.h".}
## !!!Ignored construct:  int * GetDisplayExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> DisplayExtent ; } /@} /@{ *
##  Get the bounds of this image actor. Either copy the bounds
##  into a user provided array or return a pointer to an array.
##  In either case the bounds is expressed as a 6-vector
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkImageActor; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkImageActor.h".}
proc GetDisplayBounds*(this: var vtkImageActor): ptr cdouble {.
    importcpp: "GetDisplayBounds", header: "vtkImageActor.h".}
proc GetDisplayBounds*(this: var vtkImageActor; bounds: array[6, cdouble]) {.
    importcpp: "GetDisplayBounds", header: "vtkImageActor.h".}
proc GetSliceNumber*(this: var vtkImageActor): cint {.importcpp: "GetSliceNumber",
    header: "vtkImageActor.h".}
proc GetSliceNumberMax*(this: var vtkImageActor): cint {.
    importcpp: "GetSliceNumberMax", header: "vtkImageActor.h".}
proc GetSliceNumberMin*(this: var vtkImageActor): cint {.
    importcpp: "GetSliceNumberMin", header: "vtkImageActor.h".}
proc SetZSlice*(this: var vtkImageActor; z: cint) {.importcpp: "SetZSlice",
    header: "vtkImageActor.h".}
proc GetZSlice*(this: var vtkImageActor): cint {.importcpp: "GetZSlice",
    header: "vtkImageActor.h".}
proc GetWholeZMin*(this: var vtkImageActor): cint {.importcpp: "GetWholeZMin",
    header: "vtkImageActor.h".}
proc GetWholeZMax*(this: var vtkImageActor): cint {.importcpp: "GetWholeZMax",
    header: "vtkImageActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkImageActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkImageActor.h".}
## !!!Ignored construct:  /@{ *
##  Force the actor to be rendered during the opaque rendering pass.
##  Default is false.
##  See also: ForceTranslucentOn() to use translucent rendering pass.
##  virtual bool GetForceOpaqueForceOpaque ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceOpaque  of  << this -> ForceOpaque ) ; return this -> ForceOpaque ; } ;
## Error: expected ';'!!!

proc SetForceOpaque*(this: var vtkImageActor; _arg: bool) {.
    importcpp: "SetForceOpaque", header: "vtkImageActor.h".}
proc ForceOpaqueOn*(this: var vtkImageActor) {.importcpp: "ForceOpaqueOn",
    header: "vtkImageActor.h".}
proc ForceOpaqueOff*(this: var vtkImageActor) {.importcpp: "ForceOpaqueOff",
    header: "vtkImageActor.h".}
  ## /@}