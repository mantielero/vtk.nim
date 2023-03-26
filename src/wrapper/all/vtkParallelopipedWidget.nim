## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParallelopipedWidget.h
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
##  @class   vtkParallelopipedWidget
##  @brief   a widget to manipulate 3D parallelopipeds
##
##
##  This widget was designed with the aim of visualizing / probing cuts on
##  a skewed image data / structured grid.
##
##  @par Interaction:
##  The widget allows you to create a parallelopiped (defined by 8 handles).
##  The widget is initially placed by using the "PlaceWidget" method in the
##  representation class. After the widget has been created, the following
##  interactions may be used to manipulate it :
##  1) Click on a handle and drag it around moves the handle in space, while
##     keeping the same axis alignment of the parallelopiped
##  2) Dragging a handle with the shift button pressed resizes the piped
##     along an axis.
##  3) Control-click on a handle creates a chair at that position. (A chair
##     is a depression in the piped that allows you to visualize cuts in the
##     volume).
##  4) Clicking on a chair and dragging it around moves the chair within the
##     piped.
##  5) Shift-click on the piped enables you to translate it.
##
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkParallelopipedRepresentation"
discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkWidgetSet"
type
  vtkParallelopipedWidget* {.importcpp: "vtkParallelopipedWidget",
                            header: "vtkParallelopipedWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                                 ##  Instantiate the object.
                                                                                                 ##
    vtkParallelopipedWidget* {.importc: "vtkParallelopipedWidget".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  Events invoked by this widget
    ##


proc New*(): ptr vtkParallelopipedWidget {.importcpp: "vtkParallelopipedWidget::New(@)",
                                       header: "vtkParallelopipedWidget.h".}
type
  vtkParallelopipedWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParallelopipedWidget::IsTypeOf(@)",
    header: "vtkParallelopipedWidget.h".}
proc IsA*(this: var vtkParallelopipedWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParallelopipedWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParallelopipedWidget {.
    importcpp: "vtkParallelopipedWidget::SafeDownCast(@)",
    header: "vtkParallelopipedWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParallelopipedWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParallelopipedWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParallelopipedWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParallelopipedWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkParallelopipedWidget.h".}
proc SetEnabled*(this: var vtkParallelopipedWidget; a2: cint) {.
    importcpp: "SetEnabled", header: "vtkParallelopipedWidget.h".}
proc SetRepresentation*(this: var vtkParallelopipedWidget;
                       r: ptr vtkParallelopipedRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkParallelopipedWidget.h".}
proc GetParallelopipedRepresentation*(this: var vtkParallelopipedWidget): ptr vtkParallelopipedRepresentation {.
    importcpp: "GetParallelopipedRepresentation",
    header: "vtkParallelopipedWidget.h".}
proc SetEnableChairCreation*(this: var vtkParallelopipedWidget; _arg: vtkTypeBool) {.
    importcpp: "SetEnableChairCreation", header: "vtkParallelopipedWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetEnableChairCreation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableChairCreation  of  << this -> EnableChairCreation ) ; return this -> EnableChairCreation ; } ;
## Error: expected ';'!!!

proc EnableChairCreationOn*(this: var vtkParallelopipedWidget) {.
    importcpp: "EnableChairCreationOn", header: "vtkParallelopipedWidget.h".}
proc EnableChairCreationOff*(this: var vtkParallelopipedWidget) {.
    importcpp: "EnableChairCreationOff", header: "vtkParallelopipedWidget.h".}
  ## /@}
  ## *
  ##  Create the default widget representation if one is not set.
  ##
proc CreateDefaultRepresentation*(this: var vtkParallelopipedWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkParallelopipedWidget.h".}
proc SetProcessEvents*(this: var vtkParallelopipedWidget; a2: vtkTypeBool) {.
    importcpp: "SetProcessEvents", header: "vtkParallelopipedWidget.h".}