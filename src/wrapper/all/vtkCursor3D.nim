## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCursor3D.h
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
##  @class   vtkCursor3D
##  @brief   generate a 3D cursor representation
##
##  vtkCursor3D is an object that generates a 3D representation of a cursor.
##  The cursor consists of a wireframe bounding box, three intersecting
##  axes lines that meet at the cursor focus, and "shadows" or projections
##  of the axes against the sides of the bounding box. Each of these
##  components can be turned on/off.
##
##  This filter generates two output datasets. The first (Output) is just the
##  geometric representation of the cursor. The second (Focus) is a single
##  point at the focal point.
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

type
  vtkCursor3D* {.importcpp: "vtkCursor3D", header: "vtkCursor3D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkCursor3D* {.importc: "vtkCursor3D".}: VTK_NEWINSTANCE

  vtkCursor3DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCursor3D::IsTypeOf(@)", header: "vtkCursor3D.h".}
proc IsA*(this: var vtkCursor3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCursor3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCursor3D {.
    importcpp: "vtkCursor3D::SafeDownCast(@)", header: "vtkCursor3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCursor3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCursor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCursor3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCursor3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCursor3D.h".}
proc New*(): ptr vtkCursor3D {.importcpp: "vtkCursor3D::New(@)",
                           header: "vtkCursor3D.h".}
proc SetModelBounds*(this: var vtkCursor3D; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                    ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "SetModelBounds", header: "vtkCursor3D.h".}
proc SetModelBounds*(this: var vtkCursor3D; bounds: array[6, cdouble]) {.
    importcpp: "SetModelBounds", header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual double * GetModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ;
## Error: expected ';'!!!

proc SetFocalPoint*(this: var vtkCursor3D; x: array[3, cdouble]) {.
    importcpp: "SetFocalPoint", header: "vtkCursor3D.h".}
proc SetFocalPoint*(this: var vtkCursor3D; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "SetFocalPoint", header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual double * GetModelBoundsFocalPoint ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << FocalPoint  pointer  << this -> FocalPoint ) ; return this -> FocalPoint ; } VTK_WRAPEXCLUDE virtual void GetModelBoundsFocalPoint ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> FocalPoint [ i ] ; } } ;
## Error: expected ';'!!!

proc SetOutline*(this: var vtkCursor3D; _arg: vtkTypeBool) {.importcpp: "SetOutline",
    header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Outline  of  << this -> Outline ) ; return this -> Outline ; } ;
## Error: expected ';'!!!

proc OutlineOn*(this: var vtkCursor3D) {.importcpp: "OutlineOn",
                                     header: "vtkCursor3D.h".}
proc OutlineOff*(this: var vtkCursor3D) {.importcpp: "OutlineOff",
                                      header: "vtkCursor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the wireframe axes.
  ##
proc SetOutlineAxes*(this: var vtkCursor3D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxes", header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Axes  of  << this -> Axes ) ; return this -> Axes ; } ;
## Error: expected ';'!!!

proc AxesOn*(this: var vtkCursor3D) {.importcpp: "AxesOn", header: "vtkCursor3D.h".}
proc AxesOff*(this: var vtkCursor3D) {.importcpp: "AxesOff", header: "vtkCursor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the wireframe x-shadows.
  ##
proc SetOutlineAxesXShadows*(this: var vtkCursor3D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxesXShadows", header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesXShadows ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XShadows  of  << this -> XShadows ) ; return this -> XShadows ; } ;
## Error: expected ';'!!!

proc XShadowsOn*(this: var vtkCursor3D) {.importcpp: "XShadowsOn",
                                      header: "vtkCursor3D.h".}
proc XShadowsOff*(this: var vtkCursor3D) {.importcpp: "XShadowsOff",
                                       header: "vtkCursor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the wireframe y-shadows.
  ##
proc SetOutlineAxesXShadowsYShadows*(this: var vtkCursor3D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxesXShadowsYShadows", header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesXShadowsYShadows ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YShadows  of  << this -> YShadows ) ; return this -> YShadows ; } ;
## Error: expected ';'!!!

proc YShadowsOn*(this: var vtkCursor3D) {.importcpp: "YShadowsOn",
                                      header: "vtkCursor3D.h".}
proc YShadowsOff*(this: var vtkCursor3D) {.importcpp: "YShadowsOff",
                                       header: "vtkCursor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the wireframe z-shadows.
  ##
proc SetOutlineAxesXShadowsYShadowsZShadows*(this: var vtkCursor3D;
    _arg: vtkTypeBool) {.importcpp: "SetOutlineAxesXShadowsYShadowsZShadows",
                       header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesXShadowsYShadowsZShadows ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZShadows  of  << this -> ZShadows ) ; return this -> ZShadows ; } ;
## Error: expected ';'!!!

proc ZShadowsOn*(this: var vtkCursor3D) {.importcpp: "ZShadowsOn",
                                      header: "vtkCursor3D.h".}
proc ZShadowsOff*(this: var vtkCursor3D) {.importcpp: "ZShadowsOff",
                                       header: "vtkCursor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable/disable the translation mode. If on, changes in cursor position
  ##  cause the entire widget to translate along with the cursor.
  ##  By default, translation mode is off.
  ##
proc SetOutlineAxesXShadowsYShadowsZShadowsTranslationMode*(
    this: var vtkCursor3D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxesXShadowsYShadowsZShadowsTranslationMode",
    header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesXShadowsYShadowsZShadowsTranslationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TranslationMode  of  << this -> TranslationMode ) ; return this -> TranslationMode ; } ;
## Error: expected ';'!!!

proc TranslationModeOn*(this: var vtkCursor3D) {.importcpp: "TranslationModeOn",
    header: "vtkCursor3D.h".}
proc TranslationModeOff*(this: var vtkCursor3D) {.importcpp: "TranslationModeOff",
    header: "vtkCursor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off cursor wrapping. If the cursor focus moves outside the
  ##  specified bounds, the cursor will either be restrained against the
  ##  nearest "wall" (Wrap=off), or it will wrap around (Wrap=on).
  ##
proc SetOutlineAxesXShadowsYShadowsZShadowsTranslationModeWrap*(
    this: var vtkCursor3D; _arg: vtkTypeBool) {.
    importcpp: "SetOutlineAxesXShadowsYShadowsZShadowsTranslationModeWrap",
    header: "vtkCursor3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutlineAxesXShadowsYShadowsZShadowsTranslationModeWrap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Wrap  of  << this -> Wrap ) ; return this -> Wrap ; } ;
## Error: expected ';'!!!

proc WrapOn*(this: var vtkCursor3D) {.importcpp: "WrapOn", header: "vtkCursor3D.h".}
proc WrapOff*(this: var vtkCursor3D) {.importcpp: "WrapOff", header: "vtkCursor3D.h".}
  ## /@}
  ## *
  ##  Get the focus for this filter.
  ##
proc GetFocus*(this: var vtkCursor3D): ptr vtkPolyData {.importcpp: "GetFocus",
    header: "vtkCursor3D.h".}
proc AllOn*(this: var vtkCursor3D) {.importcpp: "AllOn", header: "vtkCursor3D.h".}
proc AllOff*(this: var vtkCursor3D) {.importcpp: "AllOff", header: "vtkCursor3D.h".}