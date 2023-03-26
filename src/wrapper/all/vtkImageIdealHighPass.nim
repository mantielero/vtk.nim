## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageIdealHighPass.h
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
##  @class   vtkImageIdealHighPass
##  @brief   Simple frequency domain band pass.
##
##  This filter only works on an image after it has been converted to
##  frequency domain by a vtkImageFFT filter.  A vtkImageRFFT filter
##  can be used to convert the output back into the spatial domain.
##  vtkImageIdealHighPass just sets a portion of the image to zero.  The sharp
##  cutoff in the frequence domain produces ringing in the spatial domain.
##  Input and Output must be doubles.  Dimensionality is set when the axes are
##  set.  Defaults to 2D on X and Y axes.
##
##  @sa
##  vtkImageButterworthHighPass vtkImageIdealLowPass vtkImageFFT vtkImageRFFT
##

import
  vtkImagingFourierModule, vtkThreadedImageAlgorithm

type
  vtkImageIdealHighPass* {.importcpp: "vtkImageIdealHighPass",
                          header: "vtkImageIdealHighPass.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageIdealHighPass* {.importc: "vtkImageIdealHighPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageIdealHighPass {.importcpp: "vtkImageIdealHighPass::New(@)",
                                     header: "vtkImageIdealHighPass.h".}
type
  vtkImageIdealHighPassSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageIdealHighPass::IsTypeOf(@)",
    header: "vtkImageIdealHighPass.h".}
proc IsA*(this: var vtkImageIdealHighPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageIdealHighPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageIdealHighPass {.
    importcpp: "vtkImageIdealHighPass::SafeDownCast(@)",
    header: "vtkImageIdealHighPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageIdealHighPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageIdealHighPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageIdealHighPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageIdealHighPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageIdealHighPass.h".}
proc SetCutOff*(this: var vtkImageIdealHighPass; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCutOff",
                               header: "vtkImageIdealHighPass.h".}
proc SetCutOff*(this: var vtkImageIdealHighPass; _arg: array[3, cdouble]) {.
    importcpp: "SetCutOff", header: "vtkImageIdealHighPass.h".}
proc SetCutOff*(this: var vtkImageIdealHighPass; v: cdouble) {.importcpp: "SetCutOff",
    header: "vtkImageIdealHighPass.h".}
proc SetXCutOff*(this: var vtkImageIdealHighPass; cutOff: cdouble) {.
    importcpp: "SetXCutOff", header: "vtkImageIdealHighPass.h".}
proc SetYCutOff*(this: var vtkImageIdealHighPass; cutOff: cdouble) {.
    importcpp: "SetYCutOff", header: "vtkImageIdealHighPass.h".}
proc SetZCutOff*(this: var vtkImageIdealHighPass; cutOff: cdouble) {.
    importcpp: "SetZCutOff", header: "vtkImageIdealHighPass.h".}
## !!!Ignored construct:  virtual double * GetCutOff ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  pointer  << this -> CutOff ) ; return this -> CutOff ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> CutOff [ 0 ] ; _arg2 = this -> CutOff [ 1 ] ; _arg3 = this -> CutOff [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double _arg [ 3 ] ) { this -> GetCutOff ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetXCutOff*(this: var vtkImageIdealHighPass): cdouble {.importcpp: "GetXCutOff",
    header: "vtkImageIdealHighPass.h".}
proc GetYCutOff*(this: var vtkImageIdealHighPass): cdouble {.importcpp: "GetYCutOff",
    header: "vtkImageIdealHighPass.h".}
proc GetZCutOff*(this: var vtkImageIdealHighPass): cdouble {.importcpp: "GetZCutOff",
    header: "vtkImageIdealHighPass.h".}