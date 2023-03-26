## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageButterworthHighPass.h
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
##  @class   vtkImageButterworthHighPass
##  @brief   Frequency domain high pass.
##
##  This filter only works on an image after it has been converted to
##  frequency domain by a vtkImageFFT filter.  A vtkImageRFFT filter
##  can be used to convert the output back into the spatial domain.
##  vtkImageButterworthHighPass the frequency components around 0 are
##  attenuated.  Input and output are in doubles, with two components
##  (complex numbers).
##  out(i, j) = 1 / (1 + pow(CutOff/Freq(i,j), 2*Order));
##
##  @sa
##  vtkImageButterworthLowPass
##

import
  vtkImagingFourierModule, vtkThreadedImageAlgorithm

type
  vtkImageButterworthHighPass* {.importcpp: "vtkImageButterworthHighPass",
                                header: "vtkImageButterworthHighPass.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageButterworthHighPass* {.importc: "vtkImageButterworthHighPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageButterworthHighPass {.
    importcpp: "vtkImageButterworthHighPass::New(@)",
    header: "vtkImageButterworthHighPass.h".}
type
  vtkImageButterworthHighPassSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageButterworthHighPass::IsTypeOf(@)",
    header: "vtkImageButterworthHighPass.h".}
proc IsA*(this: var vtkImageButterworthHighPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageButterworthHighPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageButterworthHighPass {.
    importcpp: "vtkImageButterworthHighPass::SafeDownCast(@)",
    header: "vtkImageButterworthHighPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageButterworthHighPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageButterworthHighPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageButterworthHighPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageButterworthHighPass; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageButterworthHighPass.h".}
proc SetCutOff*(this: var vtkImageButterworthHighPass; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCutOff",
                               header: "vtkImageButterworthHighPass.h".}
proc SetCutOff*(this: var vtkImageButterworthHighPass; _arg: array[3, cdouble]) {.
    importcpp: "SetCutOff", header: "vtkImageButterworthHighPass.h".}
proc SetCutOff*(this: var vtkImageButterworthHighPass; v: cdouble) {.
    importcpp: "SetCutOff", header: "vtkImageButterworthHighPass.h".}
proc SetXCutOff*(this: var vtkImageButterworthHighPass; cutOff: cdouble) {.
    importcpp: "SetXCutOff", header: "vtkImageButterworthHighPass.h".}
proc SetYCutOff*(this: var vtkImageButterworthHighPass; cutOff: cdouble) {.
    importcpp: "SetYCutOff", header: "vtkImageButterworthHighPass.h".}
proc SetZCutOff*(this: var vtkImageButterworthHighPass; cutOff: cdouble) {.
    importcpp: "SetZCutOff", header: "vtkImageButterworthHighPass.h".}
## !!!Ignored construct:  virtual double * GetCutOff ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  pointer  << this -> CutOff ) ; return this -> CutOff ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> CutOff [ 0 ] ; _arg2 = this -> CutOff [ 1 ] ; _arg3 = this -> CutOff [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double _arg [ 3 ] ) { this -> GetCutOff ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetXCutOff*(this: var vtkImageButterworthHighPass): cdouble {.
    importcpp: "GetXCutOff", header: "vtkImageButterworthHighPass.h".}
proc GetYCutOff*(this: var vtkImageButterworthHighPass): cdouble {.
    importcpp: "GetYCutOff", header: "vtkImageButterworthHighPass.h".}
proc GetZCutOff*(this: var vtkImageButterworthHighPass): cdouble {.
    importcpp: "GetZCutOff", header: "vtkImageButterworthHighPass.h".}
proc SetOrder*(this: var vtkImageButterworthHighPass; _arg: cint) {.
    importcpp: "SetOrder", header: "vtkImageButterworthHighPass.h".}
## !!!Ignored construct:  virtual int GetOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Order  of  << this -> Order ) ; return this -> Order ; } ;
## Error: expected ';'!!!
