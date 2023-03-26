## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSinusoidSource.h
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
##  @class   vtkImageSinusoidSource
##  @brief   Create an image with sinusoidal pixel values.
##
##  vtkImageSinusoidSource just produces images with pixel values determined
##  by a sinusoid.
##

import
  vtkImageAlgorithm, vtkImagingSourcesModule

type
  vtkImageSinusoidSource* {.importcpp: "vtkImageSinusoidSource",
                           header: "vtkImageSinusoidSource.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageSinusoidSource* {.importc: "vtkImageSinusoidSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageSinusoidSource {.importcpp: "vtkImageSinusoidSource::New(@)",
                                      header: "vtkImageSinusoidSource.h".}
type
  vtkImageSinusoidSourceSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageSinusoidSource::IsTypeOf(@)",
    header: "vtkImageSinusoidSource.h".}
proc IsA*(this: var vtkImageSinusoidSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageSinusoidSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageSinusoidSource {.
    importcpp: "vtkImageSinusoidSource::SafeDownCast(@)",
    header: "vtkImageSinusoidSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageSinusoidSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSinusoidSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSinusoidSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageSinusoidSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageSinusoidSource.h".}
proc SetWholeExtent*(this: var vtkImageSinusoidSource; xMinx: cint; xMax: cint;
                    yMin: cint; yMax: cint; zMin: cint; zMax: cint) {.
    importcpp: "SetWholeExtent", header: "vtkImageSinusoidSource.h".}
proc SetDirection*(this: var vtkImageSinusoidSource; a2: cdouble; a3: cdouble;
                  a4: cdouble) {.importcpp: "SetDirection",
                               header: "vtkImageSinusoidSource.h".}
proc SetDirection*(this: var vtkImageSinusoidSource; dir: array[3, cdouble]) {.
    importcpp: "SetDirection", header: "vtkImageSinusoidSource.h".}
## !!!Ignored construct:  virtual double * GetDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Direction  pointer  << this -> Direction ) ; return this -> Direction ; } VTK_WRAPEXCLUDE virtual void GetDirection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Direction [ 0 ] ; _arg2 = this -> Direction [ 1 ] ; _arg3 = this -> Direction [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Direction  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDirection ( double _arg [ 3 ] ) { this -> GetDirection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPeriod*(this: var vtkImageSinusoidSource; _arg: cdouble) {.
    importcpp: "SetPeriod", header: "vtkImageSinusoidSource.h".}
## !!!Ignored construct:  virtual double GetPeriod ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Period  of  << this -> Period ) ; return this -> Period ; } ;
## Error: expected ';'!!!

proc SetPeriodPhase*(this: var vtkImageSinusoidSource; _arg: cdouble) {.
    importcpp: "SetPeriodPhase", header: "vtkImageSinusoidSource.h".}
## !!!Ignored construct:  virtual double GetPeriodPhase ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Phase  of  << this -> Phase ) ; return this -> Phase ; } ;
## Error: expected ';'!!!

proc SetPeriodPhaseAmplitude*(this: var vtkImageSinusoidSource; _arg: cdouble) {.
    importcpp: "SetPeriodPhaseAmplitude", header: "vtkImageSinusoidSource.h".}
## !!!Ignored construct:  virtual double GetPeriodPhaseAmplitude ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Amplitude  of  << this -> Amplitude ) ; return this -> Amplitude ; } ;
## Error: expected ';'!!!
