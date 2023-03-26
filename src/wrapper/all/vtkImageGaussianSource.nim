## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageGaussianSource.h
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
##  @class   vtkImageGaussianSource
##  @brief   Create an image with Gaussian pixel values.
##
##  vtkImageGaussianSource just produces images with pixel values determined
##  by a Gaussian.
##

import
  vtkImageAlgorithm, vtkImagingSourcesModule

type
  vtkImageGaussianSource* {.importcpp: "vtkImageGaussianSource",
                           header: "vtkImageGaussianSource.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageGaussianSource* {.importc: "vtkImageGaussianSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageGaussianSource {.importcpp: "vtkImageGaussianSource::New(@)",
                                      header: "vtkImageGaussianSource.h".}
type
  vtkImageGaussianSourceSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageGaussianSource::IsTypeOf(@)",
    header: "vtkImageGaussianSource.h".}
proc IsA*(this: var vtkImageGaussianSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageGaussianSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageGaussianSource {.
    importcpp: "vtkImageGaussianSource::SafeDownCast(@)",
    header: "vtkImageGaussianSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageGaussianSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageGaussianSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageGaussianSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageGaussianSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageGaussianSource.h".}
proc SetWholeExtent*(this: var vtkImageGaussianSource; xMinx: cint; xMax: cint;
                    yMin: cint; yMax: cint; zMin: cint; zMax: cint) {.
    importcpp: "SetWholeExtent", header: "vtkImageGaussianSource.h".}
proc SetCenter*(this: var vtkImageGaussianSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkImageGaussianSource.h".}
proc SetCenter*(this: var vtkImageGaussianSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkImageGaussianSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetMaximum*(this: var vtkImageGaussianSource; _arg: cdouble) {.
    importcpp: "SetMaximum", header: "vtkImageGaussianSource.h".}
## !!!Ignored construct:  virtual double GetMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ;
## Error: expected ';'!!!

proc SetMaximumStandardDeviation*(this: var vtkImageGaussianSource; _arg: cdouble) {.
    importcpp: "SetMaximumStandardDeviation", header: "vtkImageGaussianSource.h".}
## !!!Ignored construct:  virtual double GetMaximumStandardDeviation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviation  of  << this -> StandardDeviation ) ; return this -> StandardDeviation ; } ;
## Error: expected ';'!!!
