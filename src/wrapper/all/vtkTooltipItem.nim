## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTooltipItem.h
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
##  @class   vtkTooltipItem
##  @brief   takes care of drawing 2D axes
##
##
##  The vtkTooltipItem is drawn in screen coordinates. It is used to display a
##  tooltip on a scene, giving additional information about an element on the
##  scene, such as in vtkChartXY. It takes care of ensuring that it draws itself
##  within the bounds of the screen.
##

import
  vtkContextItem, vtkRenderingContext2DModule, vtkStdString, vtkVector

discard "forward decl of vtkPen"
discard "forward decl of vtkBrush"
discard "forward decl of vtkTextProperty"
type
  vtkTooltipItem* {.importcpp: "vtkTooltipItem", header: "vtkTooltipItem.h", bycopy.} = object of vtkContextItem
    vtkTooltipItem* {.importc: "vtkTooltipItem".}: VTK_NEWINSTANCE

  vtkTooltipItemSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTooltipItem::IsTypeOf(@)", header: "vtkTooltipItem.h".}
proc IsA*(this: var vtkTooltipItem; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTooltipItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTooltipItem {.
    importcpp: "vtkTooltipItem::SafeDownCast(@)", header: "vtkTooltipItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTooltipItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTooltipItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTooltipItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTooltipItem; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTooltipItem.h".}
proc New*(): ptr vtkTooltipItem {.importcpp: "vtkTooltipItem::New(@)",
                              header: "vtkTooltipItem.h".}
proc SetPosition*(this: var vtkTooltipItem; _arg1: cfloat; _arg2: cfloat) {.
    importcpp: "SetPosition", header: "vtkTooltipItem.h".}
proc SetPosition*(this: var vtkTooltipItem; _arg: array[2, cfloat]) {.
    importcpp: "SetPosition", header: "vtkTooltipItem.h".}
proc SetPosition*(this: var vtkTooltipItem; pos: vtkVector2f) {.
    importcpp: "SetPosition", header: "vtkTooltipItem.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get position of the axis (in pixels).
##  virtual float * GetPositionPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPositionPosition ( float & _arg1 , float & _arg2 ) { _arg1 = this -> Position [ 0 ] ; _arg2 = this -> Position [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Position  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionPosition ( float _arg [ 2 ] ) { this -> GetPositionPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetPositionVector*(this: var vtkTooltipItem): vtkVector2f {.
    importcpp: "GetPositionVector", header: "vtkTooltipItem.h".}
proc SetText*(this: var vtkTooltipItem; text: vtkStdString) {.importcpp: "SetText",
    header: "vtkTooltipItem.h".}
proc GetText*(this: var vtkTooltipItem): vtkStdString {.importcpp: "GetText",
    header: "vtkTooltipItem.h".}
proc GetnamePen*(this: var vtkTooltipItem): ptr vtkPen {.importcpp: "GetnamePen",
    header: "vtkTooltipItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get a pointer to the vtkPen object.
  ##
proc GetnamePenBrush*(this: var vtkTooltipItem): ptr vtkBrush {.
    importcpp: "GetnamePenBrush", header: "vtkTooltipItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the vtkTextProperty that governs how the tooltip text is displayed.
  ##
proc GetnamePenBrushTextProperties*(this: var vtkTooltipItem): ptr vtkTextProperty {.
    importcpp: "GetnamePenBrushTextProperties", header: "vtkTooltipItem.h".}
  ## /@}
  ## *
  ##  Update the geometry of the tooltip.
  ##
proc Update*(this: var vtkTooltipItem) {.importcpp: "Update",
                                     header: "vtkTooltipItem.h".}
proc Paint*(this: var vtkTooltipItem; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkTooltipItem.h".}