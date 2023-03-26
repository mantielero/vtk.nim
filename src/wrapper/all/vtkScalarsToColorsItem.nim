## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkScalarsToColorsItem.h
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
##  @class   vtkScalarsToColorsItem
##  @brief   Abstract class for ScalarsToColors items.
##
##  vtkScalarsToColorsItem implements item bounds and painting for inherited
##  classes that provide a texture (ComputeTexture()) and optionally a shape
##  @sa
##  vtkControlPointsItem
##  vtkLookupTableItem
##  vtkColorTransferFunctionItem
##  vtkCompositeTransferFunctionItem
##  vtkPiecewiseItemFunctionItem
##

import
  vtkChartsCoreModule, vtkNew, vtkPlot

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPlotBar"
discard "forward decl of vtkPoints2D"
type
  vtkScalarsToColorsItem* {.importcpp: "vtkScalarsToColorsItem",
                           header: "vtkScalarsToColorsItem.h", bycopy.} = object of vtkPlot
    vtkScalarsToColorsItem* {.importc: "vtkScalarsToColorsItem".}: VTK_NEWINSTANCE

  vtkScalarsToColorsItemSuperclass* = vtkPlot

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkScalarsToColorsItem::IsTypeOf(@)",
    header: "vtkScalarsToColorsItem.h".}
proc IsA*(this: var vtkScalarsToColorsItem; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkScalarsToColorsItem.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkScalarsToColorsItem {.
    importcpp: "vtkScalarsToColorsItem::SafeDownCast(@)",
    header: "vtkScalarsToColorsItem.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkScalarsToColorsItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPlot :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkScalarsToColorsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkScalarsToColorsItem :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkScalarsToColorsItem; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkScalarsToColorsItem.h".}
proc GetBounds*(this: var vtkScalarsToColorsItem; bounds: array[4, cdouble]) {.
    importcpp: "GetBounds", header: "vtkScalarsToColorsItem.h".}
proc SetUserBounds*(this: var vtkScalarsToColorsItem; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble; _arg4: cdouble) {.importcpp: "SetUserBounds",
    header: "vtkScalarsToColorsItem.h".}
proc SetUserBounds*(this: var vtkScalarsToColorsItem; _arg: array[4, cdouble]) {.
    importcpp: "SetUserBounds", header: "vtkScalarsToColorsItem.h".}
## !!!Ignored construct:  virtual double * GetUserBounds ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << UserBounds  pointer  << this -> UserBounds ) ; return this -> UserBounds ; } VTK_WRAPEXCLUDE virtual void GetUserBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> UserBounds [ 0 ] ; _arg2 = this -> UserBounds [ 1 ] ; _arg3 = this -> UserBounds [ 2 ] ; _arg4 = this -> UserBounds [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << UserBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetUserBounds ( double _arg [ 4 ] ) { this -> GetUserBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc Paint*(this: var vtkScalarsToColorsItem; painter: ptr vtkContext2D): bool {.
    importcpp: "Paint", header: "vtkScalarsToColorsItem.h".}
proc GetnamePolyLinePen*(this: var vtkScalarsToColorsItem): ptr vtkPen {.
    importcpp: "GetnamePolyLinePen", header: "vtkScalarsToColorsItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the vtkTable displayed as an histogram using a vtkPlotBar
  ##
proc SetHistogramTable*(this: var vtkScalarsToColorsItem;
                       histogramTable: ptr vtkTable) {.
    importcpp: "SetHistogramTable", header: "vtkScalarsToColorsItem.h".}
proc GetnamePolyLinePenHistogramTable*(this: var vtkScalarsToColorsItem): ptr vtkTable {.
    importcpp: "GetnamePolyLinePenHistogramTable",
    header: "vtkScalarsToColorsItem.h".}
  ## /@}
  ## /@{
  ## *
  ##  Don't fill in the part above the transfer function.
  ##  If true texture is not visible above the shape provided by subclasses,
  ##  otherwise the whole rectangle defined by the bounds is filled with the
  ##  transfer function.
  ##  Note: only 2D transfer functions (RGB tf + alpha tf ) support the feature.
  ##
proc SetMaskAboveCurve*(this: var vtkScalarsToColorsItem; _arg: bool) {.
    importcpp: "SetMaskAboveCurve", header: "vtkScalarsToColorsItem.h".}
## !!!Ignored construct:  virtual bool GetMaskAboveCurve ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaskAboveCurve  of  << this -> MaskAboveCurve ) ; return this -> MaskAboveCurve ; } ;
## Error: expected ';'!!!

proc GetNearestPoint*(this: var vtkScalarsToColorsItem; point: vtkVector2f;
                     a3: vtkVector2f; location: ptr vtkVector2f;
                     segmentIndex: ptr vtkIdType): vtkIdType {.
    importcpp: "GetNearestPoint", header: "vtkScalarsToColorsItem.h".}
## using statement

proc GetTooltipLabel*(this: var vtkScalarsToColorsItem; plotPos: vtkVector2d;
                     seriesIndex: vtkIdType; segmentIndex: vtkIdType): vtkStdString {.
    importcpp: "GetTooltipLabel", header: "vtkScalarsToColorsItem.h".}
## !!!Ignored construct:  virtual int GetMaskAboveCurveTextureWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureWidth  of  << this -> TextureWidth ) ; return this -> TextureWidth ; } ;
## Error: expected ';'!!!
