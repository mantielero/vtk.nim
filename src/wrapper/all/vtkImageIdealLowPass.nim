## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageIdealLowPass.h
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
##  @class   vtkImageIdealLowPass
##  @brief   Simple frequency domain band pass.
##
##  This filter only works on an image after it has been converted to
##  frequency domain by a vtkImageFFT filter.  A vtkImageRFFT filter
##  can be used to convert the output back into the spatial domain.
##  vtkImageIdealLowPass just sets a portion of the image to zero.  The result
##  is an image with a lot of ringing.  Input and Output must be doubles.
##  Dimensionality is set when the axes are set.  Defaults to 2D on X and Y
##  axes.
##
##  @sa
##  vtkImageButterworthLowPass vtkImageIdealHighPass vtkImageFFT vtkImageRFFT
##

import
  vtkImagingFourierModule, vtkThreadedImageAlgorithm

type
  vtkImageIdealLowPass* {.importcpp: "vtkImageIdealLowPass",
                         header: "vtkImageIdealLowPass.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageIdealLowPass* {.importc: "vtkImageIdealLowPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageIdealLowPass {.importcpp: "vtkImageIdealLowPass::New(@)",
                                    header: "vtkImageIdealLowPass.h".}
type
  vtkImageIdealLowPassSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageIdealLowPass::IsTypeOf(@)",
    header: "vtkImageIdealLowPass.h".}
proc IsA*(this: var vtkImageIdealLowPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageIdealLowPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageIdealLowPass {.
    importcpp: "vtkImageIdealLowPass::SafeDownCast(@)",
    header: "vtkImageIdealLowPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageIdealLowPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageIdealLowPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageIdealLowPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageIdealLowPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageIdealLowPass.h".}
proc SetCutOff*(this: var vtkImageIdealLowPass; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCutOff",
                               header: "vtkImageIdealLowPass.h".}
proc SetCutOff*(this: var vtkImageIdealLowPass; _arg: array[3, cdouble]) {.
    importcpp: "SetCutOff", header: "vtkImageIdealLowPass.h".}
proc SetCutOff*(this: var vtkImageIdealLowPass; v: cdouble) {.importcpp: "SetCutOff",
    header: "vtkImageIdealLowPass.h".}
proc SetXCutOff*(this: var vtkImageIdealLowPass; cutOff: cdouble) {.
    importcpp: "SetXCutOff", header: "vtkImageIdealLowPass.h".}
proc SetYCutOff*(this: var vtkImageIdealLowPass; cutOff: cdouble) {.
    importcpp: "SetYCutOff", header: "vtkImageIdealLowPass.h".}
proc SetZCutOff*(this: var vtkImageIdealLowPass; cutOff: cdouble) {.
    importcpp: "SetZCutOff", header: "vtkImageIdealLowPass.h".}
## !!!Ignored construct:  virtual double * GetCutOff ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  pointer  << this -> CutOff ) ; return this -> CutOff ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> CutOff [ 0 ] ; _arg2 = this -> CutOff [ 1 ] ; _arg3 = this -> CutOff [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << CutOff  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCutOff ( double _arg [ 3 ] ) { this -> GetCutOff ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetXCutOff*(this: var vtkImageIdealLowPass): cdouble {.importcpp: "GetXCutOff",
    header: "vtkImageIdealLowPass.h".}
proc GetYCutOff*(this: var vtkImageIdealLowPass): cdouble {.importcpp: "GetYCutOff",
    header: "vtkImageIdealLowPass.h".}
proc GetZCutOff*(this: var vtkImageIdealLowPass): cdouble {.importcpp: "GetZCutOff",
    header: "vtkImageIdealLowPass.h".}