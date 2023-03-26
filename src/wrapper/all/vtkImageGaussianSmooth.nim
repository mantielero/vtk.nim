## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageGaussianSmooth.h
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
##  @class   vtkImageGaussianSmooth
##  @brief   Performs a gaussian convolution.
##
##  vtkImageGaussianSmooth implements a convolution of the input image
##  with a gaussian. Supports from one to three dimensional convolutions.
##

import
  vtkImagingGeneralModule, vtkThreadedImageAlgorithm

type
  vtkImageGaussianSmooth* {.importcpp: "vtkImageGaussianSmooth",
                           header: "vtkImageGaussianSmooth.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageGaussianSmooth* {.importc: "vtkImageGaussianSmooth".}: VTK_NEWINSTANCE

  vtkImageGaussianSmoothSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageGaussianSmooth::IsTypeOf(@)",
    header: "vtkImageGaussianSmooth.h".}
proc IsA*(this: var vtkImageGaussianSmooth; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageGaussianSmooth.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageGaussianSmooth {.
    importcpp: "vtkImageGaussianSmooth::SafeDownCast(@)",
    header: "vtkImageGaussianSmooth.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageGaussianSmooth :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageGaussianSmooth :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageGaussianSmooth :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageGaussianSmooth; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageGaussianSmooth.h".}
proc New*(): ptr vtkImageGaussianSmooth {.importcpp: "vtkImageGaussianSmooth::New(@)",
                                      header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviations*(this: var vtkImageGaussianSmooth; _arg1: cdouble;
                           _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetStandardDeviations", header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviations*(this: var vtkImageGaussianSmooth;
                           _arg: array[3, cdouble]) {.
    importcpp: "SetStandardDeviations", header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviation*(this: var vtkImageGaussianSmooth; std: cdouble) {.
    importcpp: "SetStandardDeviation", header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviations*(this: var vtkImageGaussianSmooth; a: cdouble; b: cdouble) {.
    importcpp: "SetStandardDeviations", header: "vtkImageGaussianSmooth.h".}
## !!!Ignored construct:  virtual double * GetStandardDeviations ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviations  pointer  << this -> StandardDeviations ) ; return this -> StandardDeviations ; } VTK_WRAPEXCLUDE virtual void GetStandardDeviations ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> StandardDeviations [ 0 ] ; _arg2 = this -> StandardDeviations [ 1 ] ; _arg3 = this -> StandardDeviations [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviations  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStandardDeviations ( double _arg [ 3 ] ) { this -> GetStandardDeviations ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetStandardDeviation*(this: var vtkImageGaussianSmooth; a: cdouble; b: cdouble) {.
    importcpp: "SetStandardDeviation", header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviation*(this: var vtkImageGaussianSmooth; a: cdouble; b: cdouble;
                          c: cdouble) {.importcpp: "SetStandardDeviation",
                                      header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviationsRadiusFactors*(this: var vtkImageGaussianSmooth;
                                        _arg1: cdouble; _arg2: cdouble;
                                        _arg3: cdouble) {.
    importcpp: "SetStandardDeviationsRadiusFactors",
    header: "vtkImageGaussianSmooth.h".}
proc SetStandardDeviationsRadiusFactors*(this: var vtkImageGaussianSmooth;
                                        _arg: array[3, cdouble]) {.
    importcpp: "SetStandardDeviationsRadiusFactors",
    header: "vtkImageGaussianSmooth.h".}
proc SetRadiusFactors*(this: var vtkImageGaussianSmooth; f: cdouble; f2: cdouble) {.
    importcpp: "SetRadiusFactors", header: "vtkImageGaussianSmooth.h".}
proc SetRadiusFactor*(this: var vtkImageGaussianSmooth; f: cdouble) {.
    importcpp: "SetRadiusFactor", header: "vtkImageGaussianSmooth.h".}
## !!!Ignored construct:  virtual double * GetStandardDeviationsRadiusFactors ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << RadiusFactors  pointer  << this -> RadiusFactors ) ; return this -> RadiusFactors ; } VTK_WRAPEXCLUDE virtual void GetStandardDeviationsRadiusFactors ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> RadiusFactors [ 0 ] ; _arg2 = this -> RadiusFactors [ 1 ] ; _arg3 = this -> RadiusFactors [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << RadiusFactors  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStandardDeviationsRadiusFactors ( double _arg [ 3 ] ) { this -> GetStandardDeviationsRadiusFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetDimensionality*(this: var vtkImageGaussianSmooth; _arg: cint) {.
    importcpp: "SetDimensionality", header: "vtkImageGaussianSmooth.h".}
## !!!Ignored construct:  virtual int GetDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ;
## Error: expected ';'!!!
