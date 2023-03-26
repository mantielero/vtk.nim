## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHeatmapItem.h
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
##  @class   vtkHeatmapItem
##  @brief   A 2D graphics item for rendering a heatmap
##
##
##  This item draws a heatmap as a part of a vtkContextScene.
##
##  .SEE ALSO
##  vtkTable
##

import
  vtkContextItem, vtkViewsInfovisModule, vtkNew, vtkSmartPointer, vtkStdString,
  vtkVector

discard "forward decl of vtkBitArray"
discard "forward decl of vtkCategoryLegend"
discard "forward decl of vtkColorLegend"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
discard "forward decl of vtkTooltipItem"
discard "forward decl of vtkVariantArray"
type
  vtkHeatmapItem* {.importcpp: "vtkHeatmapItem", header: "vtkHeatmapItem.h", bycopy.} = object of vtkContextItem
    vtkHeatmapItem* {.importc: "vtkHeatmapItem".}: VTK_NEWINSTANCE
    ## *
    ##  Generate some data needed for painting.  We cache this information as
    ##  it only needs to be generated when the input data changes.
    ##


proc New*(): ptr vtkHeatmapItem {.importcpp: "vtkHeatmapItem::New(@)",
                              header: "vtkHeatmapItem.h".}
type
  vtkHeatmapItemSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHeatmapItem::IsTypeOf(@)", header: "vtkHeatmapItem.h".}
proc IsA*(this: var vtkHeatmapItem; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkHeatmapItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHeatmapItem {.
    importcpp: "vtkHeatmapItem::SafeDownCast(@)", header: "vtkHeatmapItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHeatmapItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHeatmapItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHeatmapItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHeatmapItem; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHeatmapItem.h".}
proc SetTable*(this: var vtkHeatmapItem; table: ptr vtkTable) {.importcpp: "SetTable",
    header: "vtkHeatmapItem.h".}
proc GetTable*(this: var vtkHeatmapItem): ptr vtkTable {.importcpp: "GetTable",
    header: "vtkHeatmapItem.h".}
proc GetRowNames*(this: var vtkHeatmapItem): ptr vtkStringArray {.
    importcpp: "GetRowNames", header: "vtkHeatmapItem.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the name of the column that specifies the name
##  of this table's rows.  By default, we assume this
##  column will be named "name".  If no such column can be
##  found, we then assume that the 1st column in the table
##  names the rows.
##  virtual vtkStdString GetNameColumnNameColumn ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NameColumn  of  << this -> NameColumn ) ; return this -> NameColumn ; } ;
## Error: expected ';'!!!

proc SetNameColumn*(this: var vtkHeatmapItem; _arg: vtkStdString) {.
    importcpp: "SetNameColumn", header: "vtkHeatmapItem.h".}
  ## /@}
  ## *
  ##  Set which way the table should face within the visualization.
  ##
proc SetOrientation*(this: var vtkHeatmapItem; orientation: cint) {.
    importcpp: "SetOrientation", header: "vtkHeatmapItem.h".}
proc GetOrientation*(this: var vtkHeatmapItem): cint {.importcpp: "GetOrientation",
    header: "vtkHeatmapItem.h".}
proc GetTextAngleForOrientation*(this: var vtkHeatmapItem; orientation: cint): cdouble {.
    importcpp: "GetTextAngleForOrientation", header: "vtkHeatmapItem.h".}
proc SetPosition*(this: var vtkHeatmapItem; _arg1: cfloat; _arg2: cfloat) {.
    importcpp: "SetPosition", header: "vtkHeatmapItem.h".}
proc SetPosition*(this: var vtkHeatmapItem; _arg: array[2, cfloat]) {.
    importcpp: "SetPosition", header: "vtkHeatmapItem.h".}
proc SetPosition*(this: var vtkHeatmapItem; pos: vtkVector2f) {.
    importcpp: "SetPosition", header: "vtkHeatmapItem.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get position of the heatmap.
##  virtual float * GetPositionPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPositionPosition ( float & _arg1 , float & _arg2 ) { _arg1 = this -> Position [ 0 ] ; _arg2 = this -> Position [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Position  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPositionPosition ( float _arg [ 2 ] ) { this -> GetPositionPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetPositionVector*(this: var vtkHeatmapItem): vtkVector2f {.
    importcpp: "GetPositionVector", header: "vtkHeatmapItem.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the height of the cells in our heatmap.
##  Default is 18 pixels.
##  virtual double GetNameColumnNameColumnCellHeightCellHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellHeight  of  << this -> CellHeight ) ; return this -> CellHeight ; } ;
## Error: expected ';'!!!

proc SetNameColumnCellHeight*(this: var vtkHeatmapItem; _arg: cdouble) {.
    importcpp: "SetNameColumnCellHeight", header: "vtkHeatmapItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the width of the cells in our heatmap.
  ##  Default is 36 pixels.
  ##
## !!!Ignored construct:  virtual double GetNameColumnNameColumnCellHeightCellHeightCellWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellWidth  of  << this -> CellWidth ) ; return this -> CellWidth ; } ;
## Error: expected ';'!!!

proc SetNameColumnCellHeightCellWidth*(this: var vtkHeatmapItem; _arg: cdouble) {.
    importcpp: "SetNameColumnCellHeightCellWidth", header: "vtkHeatmapItem.h".}
  ## /@}
  ## *
  ##  Get the bounds for this item as (Xmin,Xmax,Ymin,Ymax).
  ##
proc GetBounds*(this: var vtkHeatmapItem; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkHeatmapItem.h".}
proc MarkRowAsBlank*(this: var vtkHeatmapItem; rowName: string) {.
    importcpp: "MarkRowAsBlank", header: "vtkHeatmapItem.h".}
proc Paint*(this: var vtkHeatmapItem; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkHeatmapItem.h".}
## !!!Ignored construct:  /@{ *
##  Get the width of the largest row or column label drawn by this
##  heatmap.
##  virtual float GetNameColumnNameColumnCellHeightCellHeightCellWidthRowLabelWidthRowLabelWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RowLabelWidth  of  << this -> RowLabelWidth ) ; return this -> RowLabelWidth ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual float GetNameColumnNameColumnCellHeightCellHeightCellWidthRowLabelWidthRowLabelWidthColumnLabelWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ColumnLabelWidth  of  << this -> ColumnLabelWidth ) ; return this -> ColumnLabelWidth ; } ;
## Error: expected ';'!!!

const
  vtkHeatmapItemLEFT_TO_RIGHT* = 0
  vtkHeatmapItemUP_TO_DOWN* = 1
  vtkHeatmapItemRIGHT_TO_LEFT* = 2
  vtkHeatmapItemDOWN_TO_UP* = 3

proc Hit*(this: var vtkHeatmapItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "Hit", header: "vtkHeatmapItem.h".}
proc MouseMoveEvent*(this: var vtkHeatmapItem; event: vtkContextMouseEvent): bool {.
    importcpp: "MouseMoveEvent", header: "vtkHeatmapItem.h".}
proc MouseDoubleClickEvent*(this: var vtkHeatmapItem; event: vtkContextMouseEvent): bool {.
    importcpp: "MouseDoubleClickEvent", header: "vtkHeatmapItem.h".}