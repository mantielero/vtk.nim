## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkActor2D.h
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
##  @class   vtkActor2D
##  @brief   a actor that draws 2D data
##
##  vtkActor2D is similar to vtkActor, but it is made to be used with two
##  dimensional images and annotation.  vtkActor2D has a position but does not
##  use a transformation matrix like vtkActor (see the superclass vtkProp
##  for information on positioning vtkActor2D).  vtkActor2D has a reference to
##  a vtkMapper2D object which does the rendering.
##
##  @sa
##  vtkProp  vtkMapper2D vtkProperty2D
##

import
  vtkCoordinate, vtkProp, vtkRenderingCoreModule

discard "forward decl of vtkMapper2D"
discard "forward decl of vtkProperty2D"
type
  vtkActor2D* {.importcpp: "vtkActor2D", header: "vtkActor2D.h", bycopy.} = object of vtkProp
    vtkActor2D* {.importc: "vtkActor2D".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkActor2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkActor2D.h".}
type
  vtkActor2DSuperclass* = vtkProp

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkActor2D::IsTypeOf(@)",
    header: "vtkActor2D.h".}
proc IsA*(this: var vtkActor2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkActor2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkActor2D {.
    importcpp: "vtkActor2D::SafeDownCast(@)", header: "vtkActor2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkActor2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProp :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkActor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkActor2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkActor2D {.importcpp: "vtkActor2D::New(@)", header: "vtkActor2D.h".}
proc RenderOverlay*(this: var vtkActor2D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkActor2D.h".}
proc RenderOpaqueGeometry*(this: var vtkActor2D; viewport: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkActor2D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkActor2D;
                                        viewport: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkActor2D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkActor2D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkActor2D.h".}
proc SetMapper*(this: var vtkActor2D; mapper: ptr vtkMapper2D) {.
    importcpp: "SetMapper", header: "vtkActor2D.h".}
proc GetnameMapper*(this: var vtkActor2D): ptr vtkMapper2D {.
    importcpp: "GetnameMapper", header: "vtkActor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the layer number in the overlay planes into which to render.
  ##
proc SetLayerNumber*(this: var vtkActor2D; _arg: cint) {.importcpp: "SetLayerNumber",
    header: "vtkActor2D.h".}
## !!!Ignored construct:  virtual int GetLayerNumber ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LayerNumber  of  << this -> LayerNumber ) ; return this -> LayerNumber ; } ;
## Error: expected ';'!!!

proc GetProperty*(this: var vtkActor2D): ptr vtkProperty2D {.importcpp: "GetProperty",
    header: "vtkActor2D.h".}
proc SetProperty*(this: var vtkActor2D; a2: ptr vtkProperty2D) {.
    importcpp: "SetProperty", header: "vtkActor2D.h".}
proc GetPositionCoordinate*(this: var vtkActor2D): ptr vtkCoordinate {.
    importcpp: "GetPositionCoordinate", header: "vtkActor2D.h".}
proc SetPosition*(this: var vtkActor2D; x: array[2, cdouble]) {.
    importcpp: "SetPosition", header: "vtkActor2D.h".}
proc SetPosition*(this: var vtkActor2D; x: cdouble; y: cdouble) {.
    importcpp: "SetPosition", header: "vtkActor2D.h".}
## !!!Ignored construct:  virtual double * GetPosition ( ) VTK_SIZEHINT ( 2 ) { return this -> PositionCoordinate -> GetValue ( ) ; } ;
## Error: expected ';'!!!

proc SetDisplayPosition*(this: var vtkActor2D; a2: cint; a3: cint) {.
    importcpp: "SetDisplayPosition", header: "vtkActor2D.h".}
proc GetPositionCoordinatePosition2Coordinate*(this: var vtkActor2D): ptr vtkCoordinate {.
    importcpp: "GetPositionCoordinatePosition2Coordinate", header: "vtkActor2D.h".}
proc SetPositionPosition2*(this: var vtkActor2D; x: array[2, cdouble]) {.
    importcpp: "SetPositionPosition2", header: "vtkActor2D.h".}
proc SetPositionPosition2*(this: var vtkActor2D; x: cdouble; y: cdouble) {.
    importcpp: "SetPositionPosition2", header: "vtkActor2D.h".}
## !!!Ignored construct:  virtual double * GetPositionPosition2 ( ) VTK_SIZEHINT ( 2 ) { return this -> Position2Coordinate -> GetValue ( ) ; } ;
## Error: expected ';'!!!

proc SetWidth*(this: var vtkActor2D; w: cdouble) {.importcpp: "SetWidth",
    header: "vtkActor2D.h".}
proc GetWidth*(this: var vtkActor2D): cdouble {.importcpp: "GetWidth",
    header: "vtkActor2D.h".}
proc SetHeight*(this: var vtkActor2D; h: cdouble) {.importcpp: "SetHeight",
    header: "vtkActor2D.h".}
proc GetHeight*(this: var vtkActor2D): cdouble {.importcpp: "GetHeight",
    header: "vtkActor2D.h".}
proc GetMTime*(this: var vtkActor2D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkActor2D.h".}
proc GetActors2D*(this: var vtkActor2D; pc: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkActor2D.h".}
proc ShallowCopy*(this: var vtkActor2D; prop: ptr vtkProp) {.importcpp: "ShallowCopy",
    header: "vtkActor2D.h".}
proc ReleaseGraphicsResources*(this: var vtkActor2D; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkActor2D.h".}
proc GetActualPositionCoordinate*(this: var vtkActor2D): ptr vtkCoordinate {.
    importcpp: "GetActualPositionCoordinate", header: "vtkActor2D.h".}
proc GetActualPosition2Coordinate*(this: var vtkActor2D): ptr vtkCoordinate {.
    importcpp: "GetActualPosition2Coordinate", header: "vtkActor2D.h".}