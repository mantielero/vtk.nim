## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleDrawPolygon.h
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
##  @class   vtkInteractorStyleDrawPolygon
##  @brief   draw polygon during mouse move
##
##  This interactor style allows the user to draw a polygon in the render
##  window using the left mouse button while mouse is moving.
##  When the mouse button is released, a SelectionChangedEvent will be fired.
##

import
  vtkInteractionStyleModule, vtkInteractorStyle, vtkVector

discard "forward decl of vtkUnsignedCharArray"
type
  vtkInteractorStyleDrawPolygon* {.importcpp: "vtkInteractorStyleDrawPolygon",
                                  header: "vtkInteractorStyleDrawPolygon.h",
                                  bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyleDrawPolygon* {.importc: "vtkInteractorStyleDrawPolygon".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyleDrawPolygon {.
    importcpp: "vtkInteractorStyleDrawPolygon::New(@)",
    header: "vtkInteractorStyleDrawPolygon.h".}
type
  vtkInteractorStyleDrawPolygonSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleDrawPolygon::IsTypeOf(@)",
    header: "vtkInteractorStyleDrawPolygon.h".}
proc IsA*(this: var vtkInteractorStyleDrawPolygon; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleDrawPolygon.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleDrawPolygon {.
    importcpp: "vtkInteractorStyleDrawPolygon::SafeDownCast(@)",
    header: "vtkInteractorStyleDrawPolygon.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleDrawPolygon :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleDrawPolygon :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleDrawPolygon :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleDrawPolygon; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorStyleDrawPolygon.h".}
proc OnMouseMove*(this: var vtkInteractorStyleDrawPolygon) {.
    importcpp: "OnMouseMove", header: "vtkInteractorStyleDrawPolygon.h".}
proc OnLeftButtonDown*(this: var vtkInteractorStyleDrawPolygon) {.
    importcpp: "OnLeftButtonDown", header: "vtkInteractorStyleDrawPolygon.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyleDrawPolygon) {.
    importcpp: "OnLeftButtonUp", header: "vtkInteractorStyleDrawPolygon.h".}
proc SetDrawPolygonPixels*(this: var vtkInteractorStyleDrawPolygon; _arg: bool) {.
    importcpp: "SetDrawPolygonPixels", header: "vtkInteractorStyleDrawPolygon.h".}
## !!!Ignored construct:  virtual bool GetDrawPolygonPixels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawPolygonPixels  of  << this -> DrawPolygonPixels ) ; return this -> DrawPolygonPixels ; } ;
## Error: expected ';'!!!

proc DrawPolygonPixelsOn*(this: var vtkInteractorStyleDrawPolygon) {.
    importcpp: "DrawPolygonPixelsOn", header: "vtkInteractorStyleDrawPolygon.h".}
proc DrawPolygonPixelsOff*(this: var vtkInteractorStyleDrawPolygon) {.
    importcpp: "DrawPolygonPixelsOff", header: "vtkInteractorStyleDrawPolygon.h".}
  ## /@}
  ## *
  ##  Get the current polygon points in display units
  ##
proc GetPolygonPoints*(this: var vtkInteractorStyleDrawPolygon): vector[vtkVector2i] {.
    importcpp: "GetPolygonPoints", header: "vtkInteractorStyleDrawPolygon.h".}