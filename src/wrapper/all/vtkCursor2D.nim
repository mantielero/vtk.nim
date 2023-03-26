## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCursor2D.h
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
##  @class   vtkCursor2D
##  @brief   generate a 2D cursor representation
##
##  vtkCursor2D is a class that generates a 2D cursor representation.
##  The cursor consists of two intersection axes lines that meet at the
##  cursor focus. Several optional features are available as well. An
##  optional 2D bounding box may be enabled. An inner radius, centered at
##  the focal point, can be set that erases the intersecting lines (e.g.,
##  it leaves a clear area under the focal point so you can see
##  what you are selecting). And finally, an optional point can be
##  enabled located at the focal point. All of these features can be turned
##  on and off independently.
##
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

type
  vtkCursor2D* {.importcpp: "vtkCursor2D", header: "vtkCursor2D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkCursor2D* {.importc: "vtkCursor2D".}: VTK_NEWINSTANCE

  vtkCursor2DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCursor2D::IsTypeOf(@)", header: "vtkCursor2D.h".}
proc IsA*(this: var vtkCursor2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCursor2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCursor2D {.
    importcpp: "vtkCursor2D::SafeDownCast(@)", header: "vtkCursor2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCursor2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCursor2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCursor2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCursor2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCursor2D.h".}
proc New*(): ptr vtkCursor2D {.importcpp: "vtkCursor2D::New(@)",
                           header: "vtkCursor2D.h".}
proc SetModelBounds*(this: var vtkCursor2D; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                    ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "SetModelBounds", header: "vtkCursor2D.h".}
proc SetModelBounds*(this: var vtkCursor2D; bounds: array[6, cdouble]) {.
    importcpp: "SetModelBounds", header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual double * GetModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFocalPoint*(this: var vtkCursor2D; x: array[3, cdouble]) {.
    importcpp: "SetFocalPoint", header: "vtkCursor2D.h".}
proc SetFocalPoint*(this: var vtkCursor2D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetFocalPoint", header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual double * GetModelBoundsFocalPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  pointer  << this -> FocalPoint ) ; return this -> FocalPoint ; } VTK_WRAPEXCLUDE virtual void GetModelBoundsFocalPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FocalPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetOutline*(this: var vtkCursor2D; _arg: vtkTypeBool) {.importcpp: "SetOutline",
    header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Outline  of  << this -> Outline ) ; return this -> Outline ; } ;
## Error: expected ';'!!!

proc OutlineOn*(this: var vtkCursor2D) {.importcpp: "OutlineOn",
                                     header: "vtkCursor2D.h".}
proc OutlineOff*(this: var vtkCursor2D) {.importcpp: "OutlineOff",
                                      header: "vtkCursor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the wireframe axes.
  ##
proc SetOutlineAxes*(this: var vtkCursor2D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxes", header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Axes  of  << this -> Axes ) ; return this -> Axes ; } ;
## Error: expected ';'!!!

proc AxesOn*(this: var vtkCursor2D) {.importcpp: "AxesOn", header: "vtkCursor2D.h".}
proc AxesOff*(this: var vtkCursor2D) {.importcpp: "AxesOff", header: "vtkCursor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify a radius for a circle. This erases the cursor
  ##  lines around the focal point.
  ##
proc SetRadius*(this: var vtkCursor2D; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkCursor2D.h".}
proc GetRadiusMinValue*(this: var vtkCursor2D): cdouble {.
    importcpp: "GetRadiusMinValue", header: "vtkCursor2D.h".}
proc GetRadiusMaxValue*(this: var vtkCursor2D): cdouble {.
    importcpp: "GetRadiusMaxValue", header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual double GetOutlineAxesRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetOutlineAxesPoint*(this: var vtkCursor2D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxesPoint", header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesRadiusPoint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Point  of  << this -> Point ) ; return this -> Point ; } ;
## Error: expected ';'!!!

proc PointOn*(this: var vtkCursor2D) {.importcpp: "PointOn", header: "vtkCursor2D.h".}
proc PointOff*(this: var vtkCursor2D) {.importcpp: "PointOff", header: "vtkCursor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable the translation mode. If on, changes in cursor position
  ##  cause the entire widget to translate along with the cursor.
  ##  By default, translation mode is off.
  ##
proc SetOutlineAxesPointTranslationMode*(this: var vtkCursor2D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxesPointTranslationMode", header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesRadiusPointTranslationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationMode  of  << this -> TranslationMode ) ; return this -> TranslationMode ; } ;
## Error: expected ';'!!!

proc TranslationModeOn*(this: var vtkCursor2D) {.importcpp: "TranslationModeOn",
    header: "vtkCursor2D.h".}
proc TranslationModeOff*(this: var vtkCursor2D) {.importcpp: "TranslationModeOff",
    header: "vtkCursor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off cursor wrapping. If the cursor focus moves outside the
  ##  specified bounds, the cursor will either be restrained against the
  ##  nearest "wall" (Wrap=off), or it will wrap around (Wrap=on).
  ##
proc SetOutlineAxesPointTranslationModeWrap*(this: var vtkCursor2D;
    _arg: vtkTypeBool) {.importcpp: "SetOutlineAxesPointTranslationModeWrap",
                       header: "vtkCursor2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesRadiusPointTranslationModeWrap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Wrap  of  << this -> Wrap ) ; return this -> Wrap ; } ;
## Error: expected ';'!!!

proc WrapOn*(this: var vtkCursor2D) {.importcpp: "WrapOn", header: "vtkCursor2D.h".}
proc WrapOff*(this: var vtkCursor2D) {.importcpp: "WrapOff", header: "vtkCursor2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn every part of the cursor on or off.
  ##
proc AllOn*(this: var vtkCursor2D) {.importcpp: "AllOn", header: "vtkCursor2D.h".}
proc AllOff*(this: var vtkCursor2D) {.importcpp: "AllOff", header: "vtkCursor2D.h".}