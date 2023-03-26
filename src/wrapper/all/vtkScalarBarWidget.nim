## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScalarBarWidget.h
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
##  @class   vtkScalarBarWidget
##  @brief   2D widget for manipulating a scalar bar
##
##  This class provides support for interactively manipulating the position,
##  size, and orientation of a scalar bar. It listens to Left mouse events and
##  mouse movement. It also listens to Right mouse events and notifies any
##  observers of Right mouse events on this object when they occur.
##  It will change the cursor shape based on its location. If
##  the cursor is over an edge of the scalar bar it will change the cursor
##  shape to a resize edge shape. If the position of a scalar bar is moved to
##  be close to the center of one of the four edges of the viewport, then the
##  scalar bar will change its orientation to align with that edge. This
##  orientation is sticky in that it will stay that orientation until the
##  position is moved close to another edge.
##
##  @sa
##  vtkInteractorObserver
##

import
  vtkBorderWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkScalarBarActor"
discard "forward decl of vtkScalarBarRepresentation"
type
  vtkScalarBarWidget* {.importcpp: "vtkScalarBarWidget",
                       header: "vtkScalarBarWidget.h", bycopy.} = object of vtkBorderWidget
    vtkScalarBarWidget* {.importc: "vtkScalarBarWidget".}: VTK_NEWINSTANCE
    ##  Handle the case of Repositionable == 0


proc New*(): ptr vtkScalarBarWidget {.importcpp: "vtkScalarBarWidget::New(@)",
                                  header: "vtkScalarBarWidget.h".}
type
  vtkScalarBarWidgetSuperclass* = vtkBorderWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkScalarBarWidget::IsTypeOf(@)", header: "vtkScalarBarWidget.h".}
proc IsA*(this: var vtkScalarBarWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkScalarBarWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkScalarBarWidget {.
    importcpp: "vtkScalarBarWidget::SafeDownCast(@)",
    header: "vtkScalarBarWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkScalarBarWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScalarBarWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScalarBarWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkScalarBarWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkScalarBarWidget.h".}
proc SetRepresentation*(this: var vtkScalarBarWidget;
                       rep: ptr vtkScalarBarRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkScalarBarWidget.h".}
proc GetScalarBarRepresentation*(this: var vtkScalarBarWidget): ptr vtkScalarBarRepresentation {.
    importcpp: "GetScalarBarRepresentation", header: "vtkScalarBarWidget.h".}
proc SetScalarBarActor*(this: var vtkScalarBarWidget; actor: ptr vtkScalarBarActor) {.
    importcpp: "SetScalarBarActor", header: "vtkScalarBarWidget.h".}
proc GetScalarBarActor*(this: var vtkScalarBarWidget): ptr vtkScalarBarActor {.
    importcpp: "GetScalarBarActor", header: "vtkScalarBarWidget.h".}
proc SetRepositionable*(this: var vtkScalarBarWidget; _arg: vtkTypeBool) {.
    importcpp: "SetRepositionable", header: "vtkScalarBarWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRepositionable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Repositionable  of  << this -> Repositionable ) ; return this -> Repositionable ; } ;
## Error: expected ';'!!!

proc RepositionableOn*(this: var vtkScalarBarWidget) {.
    importcpp: "RepositionableOn", header: "vtkScalarBarWidget.h".}
proc RepositionableOff*(this: var vtkScalarBarWidget) {.
    importcpp: "RepositionableOff", header: "vtkScalarBarWidget.h".}
  ## /@}
  ## *
  ##  Create the default widget representation if one is not set.
  ##
proc CreateDefaultRepresentation*(this: var vtkScalarBarWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkScalarBarWidget.h".}
proc GetProcessEvents*(this: var vtkScalarBarWidget): vtkTypeBool {.
    importcpp: "GetProcessEvents", header: "vtkScalarBarWidget.h".}