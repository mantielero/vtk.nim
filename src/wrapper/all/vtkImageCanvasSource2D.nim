## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageCanvasSource2D.h
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
##  @class   vtkImageCanvasSource2D
##  @brief   Paints on a canvas
##
##  vtkImageCanvasSource2D is a source that starts as a blank image.
##  you may add to the image with two-dimensional drawing routines.
##  It can paint multi-spectral images.
##

import
  vtkImageAlgorithm, vtkImagingSourcesModule

type
  vtkImageCanvasSource2D* {.importcpp: "vtkImageCanvasSource2D",
                           header: "vtkImageCanvasSource2D.h", bycopy.} = object of vtkImageAlgorithm ## *
                                                                                               ##  Construct an instance of vtkImageCanvasSource2D with no data.
                                                                                               ##
    vtkImageCanvasSource2D* {.importc: "vtkImageCanvasSource2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageCanvasSource2D {.importcpp: "vtkImageCanvasSource2D::New(@)",
                                      header: "vtkImageCanvasSource2D.h".}
type
  vtkImageCanvasSource2DSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageCanvasSource2D::IsTypeOf(@)",
    header: "vtkImageCanvasSource2D.h".}
proc IsA*(this: var vtkImageCanvasSource2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageCanvasSource2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageCanvasSource2D {.
    importcpp: "vtkImageCanvasSource2D::SafeDownCast(@)",
    header: "vtkImageCanvasSource2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageCanvasSource2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageCanvasSource2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageCanvasSource2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageCanvasSource2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageCanvasSource2D.h".}
proc SetDrawColor*(this: var vtkImageCanvasSource2D; _arg1: cdouble; _arg2: cdouble;
                  _arg3: cdouble; _arg4: cdouble) {.importcpp: "SetDrawColor",
    header: "vtkImageCanvasSource2D.h".}
proc SetDrawColor*(this: var vtkImageCanvasSource2D; _arg: array[4, cdouble]) {.
    importcpp: "SetDrawColor", header: "vtkImageCanvasSource2D.h".}
## !!!Ignored construct:  virtual double * GetDrawColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DrawColor  pointer  << this -> DrawColor ) ; return this -> DrawColor ; } VTK_WRAPEXCLUDE virtual void GetDrawColor ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> DrawColor [ 0 ] ; _arg2 = this -> DrawColor [ 1 ] ; _arg3 = this -> DrawColor [ 2 ] ; _arg4 = this -> DrawColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DrawColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDrawColor ( double _arg [ 4 ] ) { this -> GetDrawColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetDrawColor*(this: var vtkImageCanvasSource2D; a: cdouble) {.
    importcpp: "SetDrawColor", header: "vtkImageCanvasSource2D.h".}
proc SetDrawColor*(this: var vtkImageCanvasSource2D; a: cdouble; b: cdouble) {.
    importcpp: "SetDrawColor", header: "vtkImageCanvasSource2D.h".}
proc SetDrawColor*(this: var vtkImageCanvasSource2D; a: cdouble; b: cdouble; c: cdouble) {.
    importcpp: "SetDrawColor", header: "vtkImageCanvasSource2D.h".}
proc InitializeCanvasVolume*(this: var vtkImageCanvasSource2D;
                            volume: ptr vtkImageData) {.
    importcpp: "InitializeCanvasVolume", header: "vtkImageCanvasSource2D.h".}
proc FillBox*(this: var vtkImageCanvasSource2D; min0: cint; max0: cint; min1: cint;
             max1: cint) {.importcpp: "FillBox", header: "vtkImageCanvasSource2D.h".}
proc FillTube*(this: var vtkImageCanvasSource2D; x0: cint; y0: cint; x1: cint; y1: cint;
              radius: cdouble) {.importcpp: "FillTube",
                               header: "vtkImageCanvasSource2D.h".}
proc FillTriangle*(this: var vtkImageCanvasSource2D; x0: cint; y0: cint; x1: cint;
                  y1: cint; x2: cint; y2: cint) {.importcpp: "FillTriangle",
    header: "vtkImageCanvasSource2D.h".}
proc DrawCircle*(this: var vtkImageCanvasSource2D; c0: cint; c1: cint; radius: cdouble) {.
    importcpp: "DrawCircle", header: "vtkImageCanvasSource2D.h".}
proc DrawPoint*(this: var vtkImageCanvasSource2D; p0: cint; p1: cint) {.
    importcpp: "DrawPoint", header: "vtkImageCanvasSource2D.h".}
proc DrawSegment*(this: var vtkImageCanvasSource2D; x0: cint; y0: cint; x1: cint; y1: cint) {.
    importcpp: "DrawSegment", header: "vtkImageCanvasSource2D.h".}
proc DrawSegment3D*(this: var vtkImageCanvasSource2D; p0: ptr cdouble; p1: ptr cdouble) {.
    importcpp: "DrawSegment3D", header: "vtkImageCanvasSource2D.h".}
proc DrawSegment3D*(this: var vtkImageCanvasSource2D; x1: cdouble; y1: cdouble;
                   z1: cdouble; x2: cdouble; y2: cdouble; z2: cdouble) {.
    importcpp: "DrawSegment3D", header: "vtkImageCanvasSource2D.h".}
proc DrawImage*(this: var vtkImageCanvasSource2D; x0: cint; y0: cint;
               i: ptr vtkImageData) {.importcpp: "DrawImage",
                                   header: "vtkImageCanvasSource2D.h".}
proc DrawImage*(this: var vtkImageCanvasSource2D; x0: cint; y0: cint;
               a4: ptr vtkImageData; sx: cint; sy: cint; width: cint; height: cint) {.
    importcpp: "DrawImage", header: "vtkImageCanvasSource2D.h".}
proc FillPixel*(this: var vtkImageCanvasSource2D; x: cint; y: cint) {.
    importcpp: "FillPixel", header: "vtkImageCanvasSource2D.h".}
proc SetExtent*(this: var vtkImageCanvasSource2D; extent: ptr cint) {.
    importcpp: "SetExtent", header: "vtkImageCanvasSource2D.h".}
proc SetExtent*(this: var vtkImageCanvasSource2D; x1: cint; x2: cint; y1: cint; y2: cint;
               z1: cint; z2: cint) {.importcpp: "SetExtent",
                                 header: "vtkImageCanvasSource2D.h".}
proc SetDefaultZ*(this: var vtkImageCanvasSource2D; _arg: cint) {.
    importcpp: "SetDefaultZ", header: "vtkImageCanvasSource2D.h".}
## !!!Ignored construct:  virtual int GetDefaultZ ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultZ  of  << this -> DefaultZ ) ; return this -> DefaultZ ; } ;
## Error: expected ';'!!!

proc SetRatio*(this: var vtkImageCanvasSource2D; _arg1: cdouble; _arg2: cdouble;
              _arg3: cdouble) {.importcpp: "SetRatio",
                              header: "vtkImageCanvasSource2D.h".}
proc SetRatio*(this: var vtkImageCanvasSource2D; _arg: array[3, cdouble]) {.
    importcpp: "SetRatio", header: "vtkImageCanvasSource2D.h".}
## !!!Ignored construct:  virtual double * GetRatio ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Ratio  pointer  << this -> Ratio ) ; return this -> Ratio ; } VTK_WRAPEXCLUDE virtual void GetRatio ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Ratio [ 0 ] ; _arg2 = this -> Ratio [ 1 ] ; _arg3 = this -> Ratio [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Ratio  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetRatio ( double _arg [ 3 ] ) { this -> GetRatio ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetNumberOfScalarComponents*(this: var vtkImageCanvasSource2D; i: cint) {.
    importcpp: "SetNumberOfScalarComponents", header: "vtkImageCanvasSource2D.h".}
proc GetNumberOfScalarComponents*(this: vtkImageCanvasSource2D): cint {.
    noSideEffect, importcpp: "GetNumberOfScalarComponents",
    header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToFloat*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToFloat", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToDouble*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToDouble", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToInt*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToInt", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToUnsignedInt*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToUnsignedInt", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToLong*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToLong", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToUnsignedLong*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToUnsignedLong", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToShort*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToShort", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToUnsignedShort*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToUnsignedShort", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToUnsignedChar*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToUnsignedChar", header: "vtkImageCanvasSource2D.h".}
proc SetScalarTypeToChar*(this: var vtkImageCanvasSource2D) {.
    importcpp: "SetScalarTypeToChar", header: "vtkImageCanvasSource2D.h".}
proc SetScalarType*(this: var vtkImageCanvasSource2D; a2: cint) {.
    importcpp: "SetScalarType", header: "vtkImageCanvasSource2D.h".}
proc GetScalarType*(this: vtkImageCanvasSource2D): cint {.noSideEffect,
    importcpp: "GetScalarType", header: "vtkImageCanvasSource2D.h".}