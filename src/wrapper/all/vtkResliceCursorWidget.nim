## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursorWidget.h
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
##  @class   vtkResliceCursorWidget
##  @brief   represent a reslice cursor
##
##  This class represents a reslice cursor that can be used to
##  perform interactive thick slab MPR's through data. It
##  consists of two cross sectional hairs, with an optional thickness. The
##  hairs may have a hole in the center. These may be translated or rotated
##  independent of each other in the view. The result is used to reslice
##  the data along these cross sections. This allows the user to perform
##  multi-planar thin or thick reformat of the data on an image view, rather
##  than a 3D view. The class internally uses vtkImageSlabReslice
##  or vtkImageReslice depending on the modes in vtkResliceCursor to
##  do its reslicing. The slab thickness is set interactively from
##  the widget. The slab resolution (ie the number of blend points) is
##  set as the minimum spacing along any dimension from the dataset.
##  @sa
##  vtkImageSlabReslice vtkResliceCursorLineRepresentation
##  vtkResliceCursor
##

import
  vtkAbstractWidget, vtkDeprecation, vtkInteractionWidgetsModule

discard "forward decl of vtkResliceCursorRepresentation"
type
  vtkResliceCursorWidget* {.importcpp: "vtkResliceCursorWidget",
                           header: "vtkResliceCursorWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                               ##  Instantiate this class.
                                                                                               ##
    vtkResliceCursorWidget* {.importc: "vtkResliceCursorWidget".}: VTK_NEWINSTANCE


proc New*(): ptr vtkResliceCursorWidget {.importcpp: "vtkResliceCursorWidget::New(@)",
                                      header: "vtkResliceCursorWidget.h".}
type
  vtkResliceCursorWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkResliceCursorWidget::IsTypeOf(@)",
    header: "vtkResliceCursorWidget.h".}
proc IsA*(this: var vtkResliceCursorWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkResliceCursorWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkResliceCursorWidget {.
    importcpp: "vtkResliceCursorWidget::SafeDownCast(@)",
    header: "vtkResliceCursorWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkResliceCursorWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursorWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursorWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkResliceCursorWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkResliceCursorWidget.h".}
proc SetRepresentation*(this: var vtkResliceCursorWidget;
                       r: ptr vtkResliceCursorRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkResliceCursorWidget.h".}
proc GetResliceCursorRepresentation*(this: var vtkResliceCursorWidget): ptr vtkResliceCursorRepresentation {.
    importcpp: "GetResliceCursorRepresentation",
    header: "vtkResliceCursorWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkResliceCursorWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkResliceCursorWidget.h".}
proc SetEnabled*(this: var vtkResliceCursorWidget; a2: cint) {.
    importcpp: "SetEnabled", header: "vtkResliceCursorWidget.h".}
proc SetManageWindowLevel*(this: var vtkResliceCursorWidget; _arg: vtkTypeBool) {.
    importcpp: "SetManageWindowLevel", header: "vtkResliceCursorWidget.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetManageWindowLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ManageWindowLevel  of  << this -> ManageWindowLevel ) ; return this -> ManageWindowLevel ; } ;
## Error: expected ';'!!!

proc ManageWindowLevelOn*(this: var vtkResliceCursorWidget) {.
    importcpp: "ManageWindowLevelOn", header: "vtkResliceCursorWidget.h".}
proc ManageWindowLevelOff*(this: var vtkResliceCursorWidget) {.
    importcpp: "ManageWindowLevelOff", header: "vtkResliceCursorWidget.h".}
  ## /@}
  ## *
  ##  Events
  ##
const
  vtkResliceCursorWidgetWindowLevelEvent* = 1055
  vtkResliceCursorWidgetResliceAxesChangedEvent* = 1056
  vtkResliceCursorWidgetResliceThicknessChangedEvent* = 1057
  vtkResliceCursorWidgetResetCursorEvent* = 1058

proc ResetResliceCursor*(this: var vtkResliceCursorWidget) {.
    importcpp: "ResetResliceCursor", header: "vtkResliceCursorWidget.h".}
## !!!Ignored construct:  # ! defined ( VTK_LEGACY_REMOVE ) [NewLine] VTK_DEPRECATED_IN_9_2_0 ( because leading underscore is reserved ) typedef WidgetStateType _WidgetState ;
## Error: identifier expected, but got: because leading underscore is reserved!!!
