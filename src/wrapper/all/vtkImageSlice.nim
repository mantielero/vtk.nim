## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSlice.h
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
##  @class   vtkImageSlice
##  @brief   represents an image in a 3D scene
##
##  vtkImageSlice is used to represent an image in a 3D scene.  It displays
##  the image either as a slice or as a projection from the camera's
##  perspective. Adjusting the position and orientation of the slice
##  is done by adjusting the focal point and direction of the camera,
##  or alternatively the slice can be set manually in vtkImageMapper3D.
##  The lookup table and window/level are set in vtkImageProperty.
##  Prop3D methods such as SetPosition() and RotateWXYZ() change the
##  position and orientation of the data with respect to VTK world
##  coordinates.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImageMapper3D vtkImageProperty vtkProp3D
##

import
  vtkProp3D, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkPropCollection"
discard "forward decl of vtkImageProperty"
discard "forward decl of vtkImageMapper3D"
type
  vtkImageSlice* {.importcpp: "vtkImageSlice", header: "vtkImageSlice.h", bycopy.} = object of vtkProp3D
    vtkImageSlice* {.importc: "vtkImageSlice".}: VTK_NEWINSTANCE

  vtkImageSliceSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageSlice::IsTypeOf(@)", header: "vtkImageSlice.h".}
proc IsA*(this: var vtkImageSlice; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageSlice.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageSlice {.
    importcpp: "vtkImageSlice::SafeDownCast(@)", header: "vtkImageSlice.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageSlice :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSlice :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSlice :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageSlice; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageSlice.h".}
proc New*(): ptr vtkImageSlice {.importcpp: "vtkImageSlice::New(@)",
                             header: "vtkImageSlice.h".}
proc SetMapper*(this: var vtkImageSlice; mapper: ptr vtkImageMapper3D) {.
    importcpp: "SetMapper", header: "vtkImageSlice.h".}
proc GetnameMapper*(this: var vtkImageSlice): ptr vtkImageMapper3D {.
    importcpp: "GetnameMapper", header: "vtkImageSlice.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the image display properties.
  ##
proc SetProperty*(this: var vtkImageSlice; property: ptr vtkImageProperty) {.
    importcpp: "SetProperty", header: "vtkImageSlice.h".}
proc GetProperty*(this: var vtkImageSlice): ptr vtkImageProperty {.
    importcpp: "GetProperty", header: "vtkImageSlice.h".}
proc Update*(this: var vtkImageSlice) {.importcpp: "Update", header: "vtkImageSlice.h".}
proc GetBounds*(this: var vtkImageSlice): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkImageSlice.h".}
proc GetBounds*(this: var vtkImageSlice; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkImageSlice.h".}
proc GetMinXBound*(this: var vtkImageSlice): cdouble {.importcpp: "GetMinXBound",
    header: "vtkImageSlice.h".}
proc GetMaxXBound*(this: var vtkImageSlice): cdouble {.importcpp: "GetMaxXBound",
    header: "vtkImageSlice.h".}
proc GetMinYBound*(this: var vtkImageSlice): cdouble {.importcpp: "GetMinYBound",
    header: "vtkImageSlice.h".}
proc GetMaxYBound*(this: var vtkImageSlice): cdouble {.importcpp: "GetMaxYBound",
    header: "vtkImageSlice.h".}
proc GetMinZBound*(this: var vtkImageSlice): cdouble {.importcpp: "GetMinZBound",
    header: "vtkImageSlice.h".}
proc GetMaxZBound*(this: var vtkImageSlice): cdouble {.importcpp: "GetMaxZBound",
    header: "vtkImageSlice.h".}
proc GetMTime*(this: var vtkImageSlice): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImageSlice.h".}
proc GetRedrawMTime*(this: var vtkImageSlice): vtkMTimeType {.
    importcpp: "GetRedrawMTime", header: "vtkImageSlice.h".}
## !!!Ignored construct:  /@{ *
##  Force the actor to be treated as translucent.
##  virtual bool GetForceTranslucentForceTranslucent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceTranslucent  of  << this -> ForceTranslucent ) ; return this -> ForceTranslucent ; } ;
## Error: expected ';'!!!

proc SetForceTranslucent*(this: var vtkImageSlice; _arg: bool) {.
    importcpp: "SetForceTranslucent", header: "vtkImageSlice.h".}
proc ForceTranslucentOn*(this: var vtkImageSlice) {.importcpp: "ForceTranslucentOn",
    header: "vtkImageSlice.h".}
proc ForceTranslucentOff*(this: var vtkImageSlice) {.
    importcpp: "ForceTranslucentOff", header: "vtkImageSlice.h".}
  ## /@}
  ## *
  ##  Shallow copy of this vtkImageSlice. Overloads the virtual vtkProp method.
  ##
proc ShallowCopy*(this: var vtkImageSlice; prop: ptr vtkProp) {.
    importcpp: "ShallowCopy", header: "vtkImageSlice.h".}
proc GetImages*(this: var vtkImageSlice; a2: ptr vtkPropCollection) {.
    importcpp: "GetImages", header: "vtkImageSlice.h".}
proc RenderOverlay*(this: var vtkImageSlice; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkImageSlice.h".}
proc RenderOpaqueGeometry*(this: var vtkImageSlice; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkImageSlice.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkImageSlice;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkImageSlice.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkImageSlice): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkImageSlice.h".}
proc Render*(this: var vtkImageSlice; a2: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkImageSlice.h".}
proc ReleaseGraphicsResources*(this: var vtkImageSlice; win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkImageSlice.h".}
proc SetStackedImagePass*(this: var vtkImageSlice; pass: cint) {.
    importcpp: "SetStackedImagePass", header: "vtkImageSlice.h".}