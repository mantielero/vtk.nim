## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPiecewisePointHandleItem.h
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
##  @class   vtkPiecewisePointHandleItem
##  @brief   a vtkContextItem that draws handles
##        around a point of a piecewise function
##
##
##  This is a vtkContextItem that can be placed into a vtkContextScene. It draws
##  handles around a given point of a piecewise function so that the curve can
##  be adjusted using these handles.
##

import
  vtkChartsCoreModule, vtkContextItem, vtkWeakPointer

discard "forward decl of vtkContext2D"
discard "forward decl of vtkPiecewiseFunction"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkAbstractContextItem"
type
  vtkPiecewisePointHandleItem* {.importcpp: "vtkPiecewisePointHandleItem",
                                header: "vtkPiecewisePointHandleItem.h", bycopy.} = object of vtkContextItem
    vtkPiecewisePointHandleItem* {.importc: "vtkPiecewisePointHandleItem".}: VTK_NEWINSTANCE

  vtkPiecewisePointHandleItemSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPiecewisePointHandleItem::IsTypeOf(@)",
    header: "vtkPiecewisePointHandleItem.h".}
proc IsA*(this: var vtkPiecewisePointHandleItem; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPiecewisePointHandleItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPiecewisePointHandleItem {.
    importcpp: "vtkPiecewisePointHandleItem::SafeDownCast(@)",
    header: "vtkPiecewisePointHandleItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPiecewisePointHandleItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPiecewisePointHandleItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPiecewisePointHandleItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPiecewisePointHandleItem; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPiecewisePointHandleItem.h".}
proc New*(): ptr vtkPiecewisePointHandleItem {.
    importcpp: "vtkPiecewisePointHandleItem::New(@)",
    header: "vtkPiecewisePointHandleItem.h".}
proc CallRedraw*(sender: ptr vtkObject; event: culong; receiver: pointer;
                params: pointer) {.importcpp: "vtkPiecewisePointHandleItem::CallRedraw(@)",
                                 header: "vtkPiecewisePointHandleItem.h".}
proc SetParent*(this: var vtkPiecewisePointHandleItem;
               parent: ptr vtkAbstractContextItem) {.importcpp: "SetParent",
    header: "vtkPiecewisePointHandleItem.h".}
proc Paint*(this: var vtkPiecewisePointHandleItem; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkPiecewisePointHandleItem.h".}
proc SetCurrentPointIndex*(this: var vtkPiecewisePointHandleItem; _arg: vtkIdType) {.
    importcpp: "SetCurrentPointIndex", header: "vtkPiecewisePointHandleItem.h".}
## !!!Ignored construct:  virtual vtkIdType GetCurrentPointIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CurrentPointIndex  of  << this -> CurrentPointIndex ) ; return this -> CurrentPointIndex ; } ;
## Error: expected ';'!!!

proc SetPiecewiseFunction*(this: var vtkPiecewisePointHandleItem;
                          piecewiseFunc: ptr vtkPiecewiseFunction) {.
    importcpp: "SetPiecewiseFunction", header: "vtkPiecewisePointHandleItem.h".}
proc GetPiecewiseFunction*(this: var vtkPiecewisePointHandleItem): vtkWeakPointer[
    vtkPiecewiseFunction] {.importcpp: "GetPiecewiseFunction",
                           header: "vtkPiecewisePointHandleItem.h".}
proc IsOverHandle*(this: var vtkPiecewisePointHandleItem; pos: ptr cfloat): cint {.
    importcpp: "IsOverHandle", header: "vtkPiecewisePointHandleItem.h".}
proc Hit*(this: var vtkPiecewisePointHandleItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "Hit", header: "vtkPiecewisePointHandleItem.h".}
proc MouseMoveEvent*(this: var vtkPiecewisePointHandleItem;
                    mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseMoveEvent", header: "vtkPiecewisePointHandleItem.h".}
proc MouseButtonPressEvent*(this: var vtkPiecewisePointHandleItem;
                           mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseButtonPressEvent", header: "vtkPiecewisePointHandleItem.h".}
proc MouseButtonReleaseEvent*(this: var vtkPiecewisePointHandleItem;
                             mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseButtonReleaseEvent", header: "vtkPiecewisePointHandleItem.h".}