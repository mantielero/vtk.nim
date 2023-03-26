## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageResample.h
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
##  @class   vtkImageResample
##  @brief   Resamples an image to be larger or smaller.
##
##  This filter produces an output with different spacing (and extent)
##  than the input.  Linear interpolation can be used to resample the data.
##  The Output spacing can be set explicitly or relative to input spacing
##  with the SetAxisMagnificationFactor method.
##

import
  vtkImageReslice, vtkImagingCoreModule

type
  vtkImageResample* {.importcpp: "vtkImageResample", header: "vtkImageResample.h",
                     bycopy.} = object of vtkImageReslice
    vtkImageResample* {.importc: "vtkImageResample".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageResample {.importcpp: "vtkImageResample::New(@)",
                                header: "vtkImageResample.h".}
type
  vtkImageResampleSuperclass* = vtkImageReslice

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageResample::IsTypeOf(@)", header: "vtkImageResample.h".}
proc IsA*(this: var vtkImageResample; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageResample.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageResample {.
    importcpp: "vtkImageResample::SafeDownCast(@)", header: "vtkImageResample.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageResample :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageResample :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageResample :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageResample; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageResample.h".}
proc SetOutputSpacing*(this: var vtkImageResample; sx: cdouble; sy: cdouble; sz: cdouble) {.
    importcpp: "SetOutputSpacing", header: "vtkImageResample.h".}
proc SetOutputSpacing*(this: var vtkImageResample; spacing: array[3, cdouble]) {.
    importcpp: "SetOutputSpacing", header: "vtkImageResample.h".}
proc SetAxisOutputSpacing*(this: var vtkImageResample; axis: cint; spacing: cdouble) {.
    importcpp: "SetAxisOutputSpacing", header: "vtkImageResample.h".}
proc SetMagnificationFactors*(this: var vtkImageResample; fx: cdouble; fy: cdouble;
                             fz: cdouble) {.importcpp: "SetMagnificationFactors",
    header: "vtkImageResample.h".}
proc SetMagnificationFactors*(this: var vtkImageResample; f: array[3, cdouble]) {.
    importcpp: "SetMagnificationFactors", header: "vtkImageResample.h".}
## !!!Ignored construct:  virtual double * GetMagnificationFactors ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFactors  pointer  << this -> MagnificationFactors ) ; return this -> MagnificationFactors ; } VTK_WRAPEXCLUDE virtual void GetMagnificationFactors ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> MagnificationFactors [ 0 ] ; _arg2 = this -> MagnificationFactors [ 1 ] ; _arg3 = this -> MagnificationFactors [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFactors  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMagnificationFactors ( double _arg [ 3 ] ) { this -> GetMagnificationFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetAxisMagnificationFactor*(this: var vtkImageResample; axis: cint;
                                factor: cdouble) {.
    importcpp: "SetAxisMagnificationFactor", header: "vtkImageResample.h".}
proc GetAxisMagnificationFactor*(this: var vtkImageResample; axis: cint;
                                inInfo: ptr vtkInformation = nil): cdouble {.
    importcpp: "GetAxisMagnificationFactor", header: "vtkImageResample.h".}
proc SetDimensionality*(this: var vtkImageResample; _arg: cint) {.
    importcpp: "SetDimensionality", header: "vtkImageResample.h".}
## !!!Ignored construct:  virtual int GetDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ;
## Error: expected ';'!!!
