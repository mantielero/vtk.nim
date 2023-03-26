## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageButterworthLowPass.h
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
##  @class   vtkImageButterworthLowPass
##  @brief   Frequency domain Low pass.
##
##  This filter only works on an image after it has been converted to
##  frequency domain by a vtkImageFFT filter.  A vtkImageRFFT filter
##  can be used to convert the output back into the spatial domain.
##  vtkImageButterworthLowPass the high frequency components are
##  attenuated.  Input and output are in doubles, with two components
##  (complex numbers).
##  out(i, j) = (1 + pow(CutOff/Freq(i,j), 2*Order));
##
##  @sa
##  vtkImageButterworthHighPass vtkImageFFT vtkImageRFFT
##

import
  vtkImagingFourierModule, vtkThreadedImageAlgorithm

type
  vtkImageButterworthLowPass* {.importcpp: "vtkImageButterworthLowPass",
                               header: "vtkImageButterworthLowPass.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageButterworthLowPass* {.importc: "vtkImageButterworthLowPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageButterworthLowPass {.
    importcpp: "vtkImageButterworthLowPass::New(@)",
    header: "vtkImageButterworthLowPass.h".}
type
  vtkImageButterworthLowPassSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageButterworthLowPass::IsTypeOf(@)",
    header: "vtkImageButterworthLowPass.h".}
proc IsA*(this: var vtkImageButterworthLowPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageButterworthLowPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageButterworthLowPass {.
    importcpp: "vtkImageButterworthLowPass::SafeDownCast(@)",
    header: "vtkImageButterworthLowPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageButterworthLowPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageButterworthLowPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageButterworthLowPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageButterworthLowPass; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageButterworthLowPass.h".}
proc SetCutOff*(this: var vtkImageButterworthLowPass; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCutOff",
                               header: "vtkImageButterworthLowPass.h".}
proc SetCutOff*(this: var vtkImageButterworthLowPass; _arg: array[3, cdouble]) {.
    importcpp: "SetCutOff", header: "vtkImageButterworthLowPass.h".}
proc SetCutOff*(this: var vtkImageButterworthLowPass; v: cdouble) {.
    importcpp: "SetCutOff", header: "vtkImageButterworthLowPass.h".}
proc SetXCutOff*(this: var vtkImageButterworthLowPass; cutOff: cdouble) {.
    importcpp: "SetXCutOff", header: "vtkImageButterworthLowPass.h".}
proc SetYCutOff*(this: var vtkImageButterworthLowPass; cutOff: cdouble) {.
    importcpp: "SetYCutOff", header: "vtkImageButterworthLowPass.h".}
proc SetZCutOff*(this: var vtkImageButterworthLowPass; cutOff: cdouble) {.
    importcpp: "SetZCutOff", header: "vtkImageButterworthLowPass.h".}
## !!!Ignored construct:  virtual double * GetCutOff ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  pointer  << this -> CutOff ) ; return this -> CutOff ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> CutOff [ 0 ] ; _arg2 = this -> CutOff [ 1 ] ; _arg3 = this -> CutOff [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double _arg [ 3 ] ) { this -> GetCutOff ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetXCutOff*(this: var vtkImageButterworthLowPass): cdouble {.
    importcpp: "GetXCutOff", header: "vtkImageButterworthLowPass.h".}
proc GetYCutOff*(this: var vtkImageButterworthLowPass): cdouble {.
    importcpp: "GetYCutOff", header: "vtkImageButterworthLowPass.h".}
proc GetZCutOff*(this: var vtkImageButterworthLowPass): cdouble {.
    importcpp: "GetZCutOff", header: "vtkImageButterworthLowPass.h".}
proc SetOrder*(this: var vtkImageButterworthLowPass; _arg: cint) {.
    importcpp: "SetOrder", header: "vtkImageButterworthLowPass.h".}
## !!!Ignored construct:  virtual int GetOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Order  of  << this -> Order ) ; return this -> Order ; } ;
## Error: expected ';'!!!
