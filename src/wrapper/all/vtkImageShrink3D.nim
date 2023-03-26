## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageShrink3D.h
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
##  @class   vtkImageShrink3D
##  @brief   Subsamples an image.
##
##  vtkImageShrink3D shrinks an image by sub sampling on a
##  uniform grid (integer multiples).
##

import
  vtkImagingCoreModule, vtkThreadedImageAlgorithm

type
  vtkImageShrink3D* {.importcpp: "vtkImageShrink3D", header: "vtkImageShrink3D.h",
                     bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageShrink3D* {.importc: "vtkImageShrink3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageShrink3D {.importcpp: "vtkImageShrink3D::New(@)",
                                header: "vtkImageShrink3D.h".}
type
  vtkImageShrink3DSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageShrink3D::IsTypeOf(@)", header: "vtkImageShrink3D.h".}
proc IsA*(this: var vtkImageShrink3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageShrink3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageShrink3D {.
    importcpp: "vtkImageShrink3D::SafeDownCast(@)", header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageShrink3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageShrink3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageShrink3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageShrink3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageShrink3D.h".}
proc SetShrinkFactors*(this: var vtkImageShrink3D; _arg1: cint; _arg2: cint; _arg3: cint) {.
    importcpp: "SetShrinkFactors", header: "vtkImageShrink3D.h".}
proc SetShrinkFactors*(this: var vtkImageShrink3D; _arg: array[3, cint]) {.
    importcpp: "SetShrinkFactors", header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  virtual int * GetShrinkFactors ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ShrinkFactors  pointer  << this -> ShrinkFactors ) ; return this -> ShrinkFactors ; } VTK_WRAPEXCLUDE virtual void GetShrinkFactors ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> ShrinkFactors [ 0 ] ; _arg2 = this -> ShrinkFactors [ 1 ] ; _arg3 = this -> ShrinkFactors [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ShrinkFactors  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetShrinkFactors ( int _arg [ 3 ] ) { this -> GetShrinkFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetShrinkFactorsShift*(this: var vtkImageShrink3D; _arg1: cint; _arg2: cint;
                           _arg3: cint) {.importcpp: "SetShrinkFactorsShift",
                                        header: "vtkImageShrink3D.h".}
proc SetShrinkFactorsShift*(this: var vtkImageShrink3D; _arg: array[3, cint]) {.
    importcpp: "SetShrinkFactorsShift", header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  virtual int * GetShrinkFactorsShift ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Shift  pointer  << this -> Shift ) ; return this -> Shift ; } VTK_WRAPEXCLUDE virtual void GetShrinkFactorsShift ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> Shift [ 0 ] ; _arg2 = this -> Shift [ 1 ] ; _arg3 = this -> Shift [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Shift  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetShrinkFactorsShift ( int _arg [ 3 ] ) { this -> GetShrinkFactorsShift ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAveraging*(this: var vtkImageShrink3D; a2: vtkTypeBool) {.
    importcpp: "SetAveraging", header: "vtkImageShrink3D.h".}
proc GetAveraging*(this: var vtkImageShrink3D): vtkTypeBool {.
    importcpp: "GetAveraging", header: "vtkImageShrink3D.h".}
proc AveragingOn*(this: var vtkImageShrink3D) {.importcpp: "AveragingOn",
    header: "vtkImageShrink3D.h".}
proc AveragingOff*(this: var vtkImageShrink3D) {.importcpp: "AveragingOff",
    header: "vtkImageShrink3D.h".}
  ## /@}
proc SetMean*(this: var vtkImageShrink3D; a2: vtkTypeBool) {.importcpp: "SetMean",
    header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMean ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mean  of  << this -> Mean ) ; return this -> Mean ; } ;
## Error: expected ';'!!!

proc MeanOn*(this: var vtkImageShrink3D) {.importcpp: "MeanOn",
                                       header: "vtkImageShrink3D.h".}
proc MeanOff*(this: var vtkImageShrink3D) {.importcpp: "MeanOff",
                                        header: "vtkImageShrink3D.h".}
proc SetMinimum*(this: var vtkImageShrink3D; a2: vtkTypeBool) {.
    importcpp: "SetMinimum", header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMeanMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Minimum  of  << this -> Minimum ) ; return this -> Minimum ; } ;
## Error: expected ';'!!!

proc MinimumOn*(this: var vtkImageShrink3D) {.importcpp: "MinimumOn",
    header: "vtkImageShrink3D.h".}
proc MinimumOff*(this: var vtkImageShrink3D) {.importcpp: "MinimumOff",
    header: "vtkImageShrink3D.h".}
proc SetMaximum*(this: var vtkImageShrink3D; a2: vtkTypeBool) {.
    importcpp: "SetMaximum", header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMeanMinimumMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ;
## Error: expected ';'!!!

proc MaximumOn*(this: var vtkImageShrink3D) {.importcpp: "MaximumOn",
    header: "vtkImageShrink3D.h".}
proc MaximumOff*(this: var vtkImageShrink3D) {.importcpp: "MaximumOff",
    header: "vtkImageShrink3D.h".}
proc SetMedian*(this: var vtkImageShrink3D; a2: vtkTypeBool) {.importcpp: "SetMedian",
    header: "vtkImageShrink3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMeanMinimumMaximumMedian ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Median  of  << this -> Median ) ; return this -> Median ; } ;
## Error: expected ';'!!!

proc MedianOn*(this: var vtkImageShrink3D) {.importcpp: "MedianOn",
    header: "vtkImageShrink3D.h".}
proc MedianOff*(this: var vtkImageShrink3D) {.importcpp: "MedianOff",
    header: "vtkImageShrink3D.h".}