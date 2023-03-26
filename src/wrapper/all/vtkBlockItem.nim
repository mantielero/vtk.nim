## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBlockItem.h
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
##  @class   vtkBlockItem
##  @brief   a vtkContextItem that draws a block (optional label).
##
##  This is a vtkContextItem that can be placed into a vtkContextScene. It draws
##  a block of the given dimensions, and reacts to mouse events.
##
##  vtkBlockItem can also be used to render label in the scene. The label
##  properties can be set using `vtkTextProperty` accessed via
##  `GetLabelProperties`.
##
##

import
  vtkContextItem, vtkNew, vtkRenderingContext2DModule, vtkStdString

discard "forward decl of vtkContext2D"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkBrush"
discard "forward decl of vtkPen"
type
  vtkBlockItem* {.importcpp: "vtkBlockItem", header: "vtkBlockItem.h", bycopy.} = object of vtkContextItem
    vtkBlockItem* {.importc: "vtkBlockItem".}: VTK_NEWINSTANCE
    ##  Some function pointers to optionally do funky things...

  vtkBlockItemSuperclass* = vtkContextItem

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBlockItem::IsTypeOf(@)", header: "vtkBlockItem.h".}
proc IsA*(this: var vtkBlockItem; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBlockItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBlockItem {.
    importcpp: "vtkBlockItem::SafeDownCast(@)", header: "vtkBlockItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBlockItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContextItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBlockItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBlockItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBlockItem; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBlockItem.h".}
proc New*(): ptr vtkBlockItem {.importcpp: "vtkBlockItem::New(@)",
                            header: "vtkBlockItem.h".}
proc Paint*(this: var vtkBlockItem; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkBlockItem.h".}
proc Hit*(this: var vtkBlockItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "Hit", header: "vtkBlockItem.h".}
proc MouseEnterEvent*(this: var vtkBlockItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseEnterEvent", header: "vtkBlockItem.h".}
proc MouseMoveEvent*(this: var vtkBlockItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseMoveEvent", header: "vtkBlockItem.h".}
proc MouseLeaveEvent*(this: var vtkBlockItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseLeaveEvent", header: "vtkBlockItem.h".}
proc MouseButtonPressEvent*(this: var vtkBlockItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseButtonPressEvent", header: "vtkBlockItem.h".}
proc MouseButtonReleaseEvent*(this: var vtkBlockItem; mouse: vtkContextMouseEvent): bool {.
    importcpp: "MouseButtonReleaseEvent", header: "vtkBlockItem.h".}
proc SetLabel*(this: var vtkBlockItem; label: vtkStdString) {.importcpp: "SetLabel",
    header: "vtkBlockItem.h".}
proc GetLabel*(this: var vtkBlockItem): vtkStdString {.importcpp: "GetLabel",
    header: "vtkBlockItem.h".}
proc SetDimensions*(this: var vtkBlockItem; _arg1: cfloat; _arg2: cfloat; _arg3: cfloat;
                   _arg4: cfloat) {.importcpp: "SetDimensions",
                                  header: "vtkBlockItem.h".}
proc SetDimensions*(this: var vtkBlockItem; _arg: array[4, cfloat]) {.
    importcpp: "SetDimensions", header: "vtkBlockItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the dimensions of the block, elements 0 and 1 are the x and y
  ##  coordinate of the bottom corner. Elements 2 and 3 are the width and
  ##  height.
  ##  Initial value is (0,0,0,0)
  ##
## !!!Ignored construct:  virtual float * GetDimensions ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  pointer  << this -> Dimensions ) ; return this -> Dimensions ; } VTK_WRAPEXCLUDE virtual void GetDimensions ( float & _arg1 , float & _arg2 , float & _arg3 , float & _arg4 ) { _arg1 = this -> Dimensions [ 0 ] ; _arg2 = this -> Dimensions [ 1 ] ; _arg3 = this -> Dimensions [ 2 ] ; _arg4 = this -> Dimensions [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Dimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDimensions ( float _arg [ 4 ] ) { this -> GetDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetAutoComputeDimensions*(this: var vtkBlockItem; _arg: bool) {.
    importcpp: "SetAutoComputeDimensions", header: "vtkBlockItem.h".}
## !!!Ignored construct:  virtual bool GetAutoComputeDimensions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoComputeDimensions  of  << this -> AutoComputeDimensions ) ; return this -> AutoComputeDimensions ; } ;
## Error: expected ';'!!!

proc AutoComputeDimensionsOn*(this: var vtkBlockItem) {.
    importcpp: "AutoComputeDimensionsOn", header: "vtkBlockItem.h".}
proc AutoComputeDimensionsOff*(this: var vtkBlockItem) {.
    importcpp: "AutoComputeDimensionsOff", header: "vtkBlockItem.h".}
  ## /@}
const
  vtkBlockItemLEFT* = 0
  vtkBlockItemCENTER* = 1
  vtkBlockItemRIGHT* = 2
  vtkBlockItemTOP* = 3
  vtkBlockItemBOTTOM* = 4
  vtkBlockItemCUSTOM* = 5

proc SetAutoComputeDimensionsHorizontalAlignment*(this: var vtkBlockItem; _arg: cint) {.
    importcpp: "SetAutoComputeDimensionsHorizontalAlignment",
    header: "vtkBlockItem.h".}
## !!!Ignored construct:  virtual int GetAutoComputeDimensionsHorizontalAlignment ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HorizontalAlignment  of  << this -> HorizontalAlignment ) ; return this -> HorizontalAlignment ; } ;
## Error: expected ';'!!!

proc SetAutoComputeDimensionsHorizontalAlignmentVerticalAlignment*(
    this: var vtkBlockItem; _arg: cint) {.importcpp: "SetAutoComputeDimensionsHorizontalAlignmentVerticalAlignment",
                                     header: "vtkBlockItem.h".}
## !!!Ignored construct:  virtual int GetAutoComputeDimensionsHorizontalAlignmentVerticalAlignment ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalAlignment  of  << this -> VerticalAlignment ) ; return this -> VerticalAlignment ; } ;
## Error: expected ';'!!!

proc SetPadding*(this: var vtkBlockItem; _arg1: cint; _arg2: cint) {.
    importcpp: "SetPadding", header: "vtkBlockItem.h".}
proc SetPadding*(this: var vtkBlockItem; _arg: array[2, cint]) {.
    importcpp: "SetPadding", header: "vtkBlockItem.h".}
## !!!Ignored construct:  virtual int * GetPadding ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Padding  pointer  << this -> Padding ) ; return this -> Padding ; } VTK_WRAPEXCLUDE virtual void GetPadding ( int & _arg1 , int & _arg2 ) { _arg1 = this -> Padding [ 0 ] ; _arg2 = this -> Padding [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Padding  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPadding ( int _arg [ 2 ] ) { this -> GetPadding ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SetPaddingMargins*(this: var vtkBlockItem; _arg1: cint; _arg2: cint) {.
    importcpp: "SetPaddingMargins", header: "vtkBlockItem.h".}
proc SetPaddingMargins*(this: var vtkBlockItem; _arg: array[2, cint]) {.
    importcpp: "SetPaddingMargins", header: "vtkBlockItem.h".}
## !!!Ignored construct:  virtual int * GetPaddingMargins ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Margins  pointer  << this -> Margins ) ; return this -> Margins ; } VTK_WRAPEXCLUDE virtual void GetPaddingMargins ( int & _arg1 , int & _arg2 ) { _arg1 = this -> Margins [ 0 ] ; _arg2 = this -> Margins [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Margins  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPaddingMargins ( int _arg [ 2 ] ) { this -> GetPaddingMargins ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetnamePen*(this: var vtkBlockItem): ptr vtkPen {.importcpp: "GetnamePen",
    header: "vtkBlockItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the brush used to draw the block item background.
  ##
proc GetnamePenBrush*(this: var vtkBlockItem): ptr vtkBrush {.
    importcpp: "GetnamePenBrush", header: "vtkBlockItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get the brush used to draw the block item background when the
  ##  item is "hit" i.e. interaction is enabled and the mouse is over the block.
  ##
proc GetnamePenBrushMouseOverBrush*(this: var vtkBlockItem): ptr vtkBrush {.
    importcpp: "GetnamePenBrushMouseOverBrush", header: "vtkBlockItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Provides access to the vtkTextProperty object that controls the way the
  ##  label is rendered.
  ##
proc SetLabelProperties*(this: var vtkBlockItem; a2: ptr vtkTextProperty) {.
    importcpp: "SetLabelProperties", header: "vtkBlockItem.h".}
proc GetnamePenBrushMouseOverBrushLabelProperties*(this: var vtkBlockItem): ptr vtkTextProperty {.
    importcpp: "GetnamePenBrushMouseOverBrushLabelProperties",
    header: "vtkBlockItem.h".}
  ## /@}
proc SetScalarFunctor*(this: var vtkBlockItem;
                      scalarFunction: proc (a1: cdouble; a2: cdouble): cdouble) {.
    importcpp: "SetScalarFunctor", header: "vtkBlockItem.h".}