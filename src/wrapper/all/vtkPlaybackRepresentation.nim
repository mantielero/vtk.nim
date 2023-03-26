## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlaybackRepresentation.h
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
##  @class   vtkPlaybackRepresentation
##  @brief   represent the vtkPlaybackWidget
##
##  This class is used to represent the vtkPlaybackWidget. Besides defining
##  geometry, this class defines a series of virtual method stubs that are
##  meant to be subclassed by applications for controlling playback.
##
##  @sa
##  vtkPlaybackWidget
##

import
  vtkBorderRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkTransformPolyDataFilter"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkProperty2D"
discard "forward decl of vtkActor2D"
type
  vtkPlaybackRepresentation* {.importcpp: "vtkPlaybackRepresentation",
                              header: "vtkPlaybackRepresentation.h", bycopy.} = object of vtkBorderRepresentation ## *
                                                                                                           ##  Instantiate this class.
                                                                                                           ##
    vtkPlaybackRepresentation* {.importc: "vtkPlaybackRepresentation".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPlaybackRepresentation {.
    importcpp: "vtkPlaybackRepresentation::New(@)",
    header: "vtkPlaybackRepresentation.h".}
type
  vtkPlaybackRepresentationSuperclass* = vtkBorderRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlaybackRepresentation::IsTypeOf(@)",
    header: "vtkPlaybackRepresentation.h".}
proc IsA*(this: var vtkPlaybackRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPlaybackRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlaybackRepresentation {.
    importcpp: "vtkPlaybackRepresentation::SafeDownCast(@)",
    header: "vtkPlaybackRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlaybackRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlaybackRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlaybackRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlaybackRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlaybackRepresentation.h".}
proc GetnameProperty*(this: var vtkPlaybackRepresentation): ptr vtkProperty2D {.
    importcpp: "GetnameProperty", header: "vtkPlaybackRepresentation.h".}
  ## /@}
  ## *
  ##  Virtual callbacks that subclasses should implement.
  ##
proc Play*(this: var vtkPlaybackRepresentation) {.importcpp: "Play",
    header: "vtkPlaybackRepresentation.h".}
proc Stop*(this: var vtkPlaybackRepresentation) {.importcpp: "Stop",
    header: "vtkPlaybackRepresentation.h".}
proc ForwardOneFrame*(this: var vtkPlaybackRepresentation) {.
    importcpp: "ForwardOneFrame", header: "vtkPlaybackRepresentation.h".}
proc BackwardOneFrame*(this: var vtkPlaybackRepresentation) {.
    importcpp: "BackwardOneFrame", header: "vtkPlaybackRepresentation.h".}
proc JumpToBeginning*(this: var vtkPlaybackRepresentation) {.
    importcpp: "JumpToBeginning", header: "vtkPlaybackRepresentation.h".}
proc JumpToEnd*(this: var vtkPlaybackRepresentation) {.importcpp: "JumpToEnd",
    header: "vtkPlaybackRepresentation.h".}
proc BuildRepresentation*(this: var vtkPlaybackRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkPlaybackRepresentation.h".}
proc GetSize*(this: var vtkPlaybackRepresentation; size: array[2, cdouble]) {.
    importcpp: "GetSize", header: "vtkPlaybackRepresentation.h".}
proc GetActors2D*(this: var vtkPlaybackRepresentation; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkPlaybackRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkPlaybackRepresentation;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkPlaybackRepresentation.h".}
proc RenderOverlay*(this: var vtkPlaybackRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkPlaybackRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkPlaybackRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkPlaybackRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkPlaybackRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkPlaybackRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkPlaybackRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkPlaybackRepresentation.h".}