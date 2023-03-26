## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursorActor.h
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
##  @class   vtkResliceCursorActor
##  @brief   Represent a reslice cursor
##
##  A reslice cursor consists of a pair of lines (cross hairs), thin or thick,
##  that may be interactively manipulated for thin/thick reformats through the
##  data.
##  @sa
##  vtkResliceCursor vtkResliceCursorPolyDataAlgorithm vtkResliceCursorWidget
##  vtkResliceCursorRepresentation vtkResliceCursorLineRepresentation
##

import
  vtkInteractionWidgetsModule, vtkProp3D

discard "forward decl of vtkResliceCursor"
discard "forward decl of vtkResliceCursorPolyDataAlgorithm"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkActor"
discard "forward decl of vtkProperty"
discard "forward decl of vtkBoundingBox"
type
  vtkResliceCursorActor* {.importcpp: "vtkResliceCursorActor",
                          header: "vtkResliceCursorActor.h", bycopy.} = object of vtkProp3D ## /@{
                                                                                     ## *
                                                                                     ##  Standard VTK methods
                                                                                     ##
    vtkResliceCursorActor* {.importc: "vtkResliceCursorActor".}: VTK_NEWINSTANCE


proc New*(): ptr vtkResliceCursorActor {.importcpp: "vtkResliceCursorActor::New(@)",
                                     header: "vtkResliceCursorActor.h".}
type
  vtkResliceCursorActorSuperclass* = vtkProp3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkResliceCursorActor::IsTypeOf(@)",
    header: "vtkResliceCursorActor.h".}
proc IsA*(this: var vtkResliceCursorActor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkResliceCursorActor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkResliceCursorActor {.
    importcpp: "vtkResliceCursorActor::SafeDownCast(@)",
    header: "vtkResliceCursorActor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkResliceCursorActor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursorActor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursorActor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkResliceCursorActor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkResliceCursorActor.h".}
proc GetnameCursorAlgorithm*(this: var vtkResliceCursorActor): ptr vtkResliceCursorPolyDataAlgorithm {.
    importcpp: "GetnameCursorAlgorithm", header: "vtkResliceCursorActor.h".}
  ## /@}
  ## *
  ##  Support the standard render methods.
  ##
proc RenderOpaqueGeometry*(this: var vtkResliceCursorActor;
                          viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkResliceCursorActor.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkResliceCursorActor): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkResliceCursorActor.h".}
proc ReleaseGraphicsResources*(this: var vtkResliceCursorActor; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkResliceCursorActor.h".}
proc GetBounds*(this: var vtkResliceCursorActor): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkResliceCursorActor.h".}
proc GetMTime*(this: var vtkResliceCursorActor): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkResliceCursorActor.h".}
proc GetCenterlineProperty*(this: var vtkResliceCursorActor; i: cint): ptr vtkProperty {.
    importcpp: "GetCenterlineProperty", header: "vtkResliceCursorActor.h".}
proc GetThickSlabProperty*(this: var vtkResliceCursorActor; i: cint): ptr vtkProperty {.
    importcpp: "GetThickSlabProperty", header: "vtkResliceCursorActor.h".}
proc GetCenterlineActor*(this: var vtkResliceCursorActor; axis: cint): ptr vtkActor {.
    importcpp: "GetCenterlineActor", header: "vtkResliceCursorActor.h".}
proc SetUserMatrix*(this: var vtkResliceCursorActor; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetUserMatrix", header: "vtkResliceCursorActor.h".}