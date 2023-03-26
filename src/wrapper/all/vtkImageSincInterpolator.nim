## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSincInterpolator.h
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
##  @class   vtkImageSincInterpolator
##  @brief   perform sinc interpolation on images
##
##  vtkImageSincInterpolator provides various windowed sinc interpolation
##  methods for image data.  The default is a five-lobed Lanczos interpolant,
##  with a kernel size of 6.  The interpolator can also bandlimit the image,
##  which can be used for antialiasing.  The interpolation kernels are
##  evaluated via a lookup table for efficiency.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##  @sa
##  vtkImageReslice
##

import
  vtkAbstractImageInterpolator, vtkImagingCoreModule

const
  VTK_LANCZOS_WINDOW* = 0
  VTK_KAISER_WINDOW* = 1
  VTK_COSINE_WINDOW* = 2
  VTK_HANN_WINDOW* = 3
  VTK_HAMMING_WINDOW* = 4
  VTK_BLACKMAN_WINDOW* = 5
  VTK_BLACKMAN_HARRIS3* = 6
  VTK_BLACKMAN_HARRIS4* = 7
  VTK_NUTTALL_WINDOW* = 8
  VTK_BLACKMAN_NUTTALL3* = 9
  VTK_BLACKMAN_NUTTALL4* = 10
  VTK_SINC_KERNEL_SIZE_MAX* = 32

discard "forward decl of vtkImageData"
discard "forward decl of vtkInterpolationInfo"
type
  vtkImageSincInterpolator* {.importcpp: "vtkImageSincInterpolator",
                             header: "vtkImageSincInterpolator.h", bycopy.} = object of vtkAbstractImageInterpolator
    vtkImageSincInterpolator* {.importc: "vtkImageSincInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageSincInterpolator {.importcpp: "vtkImageSincInterpolator::New(@)",
                                        header: "vtkImageSincInterpolator.h".}
type
  vtkImageSincInterpolatorSuperclass* = vtkAbstractImageInterpolator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageSincInterpolator::IsTypeOf(@)",
    header: "vtkImageSincInterpolator.h".}
proc IsA*(this: var vtkImageSincInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageSincInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageSincInterpolator {.
    importcpp: "vtkImageSincInterpolator::SafeDownCast(@)",
    header: "vtkImageSincInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageSincInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractImageInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSincInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSincInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageSincInterpolator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunction*(this: var vtkImageSincInterpolator; mode: cint) {.
    importcpp: "SetWindowFunction", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToLanczos*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToLanczos", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToKaiser*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToKaiser", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToCosine*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToCosine", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToHann*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToHann", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToHamming*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToHamming", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToBlackman*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToBlackman", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToBlackmanHarris3*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToBlackmanHarris3",
    header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToBlackmanHarris4*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToBlackmanHarris4",
    header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToNuttall*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToNuttall", header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToBlackmanNuttall3*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToBlackmanNuttall3",
    header: "vtkImageSincInterpolator.h".}
proc SetWindowFunctionToBlackmanNuttall4*(this: var vtkImageSincInterpolator) {.
    importcpp: "SetWindowFunctionToBlackmanNuttall4",
    header: "vtkImageSincInterpolator.h".}
proc GetWindowFunction*(this: var vtkImageSincInterpolator): cint {.
    importcpp: "GetWindowFunction", header: "vtkImageSincInterpolator.h".}
proc GetWindowFunctionAsString*(this: var vtkImageSincInterpolator): cstring {.
    importcpp: "GetWindowFunctionAsString", header: "vtkImageSincInterpolator.h".}
proc SetWindowHalfWidth*(this: var vtkImageSincInterpolator; n: cint) {.
    importcpp: "SetWindowHalfWidth", header: "vtkImageSincInterpolator.h".}
proc GetWindowHalfWidth*(this: var vtkImageSincInterpolator): cint {.
    importcpp: "GetWindowHalfWidth", header: "vtkImageSincInterpolator.h".}
proc SetUseWindowParameter*(this: var vtkImageSincInterpolator; val: cint) {.
    importcpp: "SetUseWindowParameter", header: "vtkImageSincInterpolator.h".}
proc UseWindowParameterOn*(this: var vtkImageSincInterpolator) {.
    importcpp: "UseWindowParameterOn", header: "vtkImageSincInterpolator.h".}
proc UseWindowParameterOff*(this: var vtkImageSincInterpolator) {.
    importcpp: "UseWindowParameterOff", header: "vtkImageSincInterpolator.h".}
proc GetUseWindowParameter*(this: var vtkImageSincInterpolator): cint {.
    importcpp: "GetUseWindowParameter", header: "vtkImageSincInterpolator.h".}
proc SetWindowParameter*(this: var vtkImageSincInterpolator; parm: cdouble) {.
    importcpp: "SetWindowParameter", header: "vtkImageSincInterpolator.h".}
proc GetWindowParameter*(this: var vtkImageSincInterpolator): cdouble {.
    importcpp: "GetWindowParameter", header: "vtkImageSincInterpolator.h".}
proc ComputeSupportSize*(this: var vtkImageSincInterpolator;
                        matrix: array[16, cdouble]; support: array[3, cint]) {.
    importcpp: "ComputeSupportSize", header: "vtkImageSincInterpolator.h".}
proc SetBlurFactors*(this: var vtkImageSincInterpolator; x: cdouble; y: cdouble;
                    z: cdouble) {.importcpp: "SetBlurFactors",
                                header: "vtkImageSincInterpolator.h".}
proc SetBlurFactors*(this: var vtkImageSincInterpolator; f: array[3, cdouble]) {.
    importcpp: "SetBlurFactors", header: "vtkImageSincInterpolator.h".}
proc GetBlurFactors*(this: var vtkImageSincInterpolator; f: array[3, cdouble]) {.
    importcpp: "GetBlurFactors", header: "vtkImageSincInterpolator.h".}
## !!!Ignored construct:  double * GetBlurFactors ( ) VTK_SIZEHINT ( 3 ) { return this -> BlurFactors ; } /@} *
##  Turn on antialiasing.  If antialiasing is on, then the BlurFactors
##  will be computed automatically from the output sampling rate such that
##  that the image will be bandlimited to the Nyquist frequency.  This
##  is only applicable when the interpolator is being used by a resampling
##  filter like vtkImageReslice.  Such a filter will indicate the output
##  sampling by calling the interpolator's ComputeSupportSize() method,
##  which will compute the blur factors at the same time that it computes
##  the support size.
##  void SetAntialiasing ( int antialiasing ) ;
## Error: expected ';'!!!

proc AntialiasingOn*(this: var vtkImageSincInterpolator) {.
    importcpp: "AntialiasingOn", header: "vtkImageSincInterpolator.h".}
proc AntialiasingOff*(this: var vtkImageSincInterpolator) {.
    importcpp: "AntialiasingOff", header: "vtkImageSincInterpolator.h".}
proc GetAntialiasing*(this: var vtkImageSincInterpolator): cint {.
    importcpp: "GetAntialiasing", header: "vtkImageSincInterpolator.h".}
proc SetRenormalization*(this: var vtkImageSincInterpolator; renormalization: cint) {.
    importcpp: "SetRenormalization", header: "vtkImageSincInterpolator.h".}
proc RenormalizationOn*(this: var vtkImageSincInterpolator) {.
    importcpp: "RenormalizationOn", header: "vtkImageSincInterpolator.h".}
proc RenormalizationOff*(this: var vtkImageSincInterpolator) {.
    importcpp: "RenormalizationOff", header: "vtkImageSincInterpolator.h".}
proc GetRenormalization*(this: var vtkImageSincInterpolator): cint {.
    importcpp: "GetRenormalization", header: "vtkImageSincInterpolator.h".}
proc IsSeparable*(this: var vtkImageSincInterpolator): bool {.
    importcpp: "IsSeparable", header: "vtkImageSincInterpolator.h".}
proc PrecomputeWeightsForExtent*(this: var vtkImageSincInterpolator;
                                matrix: array[16, cdouble]; extent: array[6, cint];
                                newExtent: array[6, cint];
                                weights: ptr vtkInterpolationWeights) {.
    importcpp: "PrecomputeWeightsForExtent", header: "vtkImageSincInterpolator.h".}
proc PrecomputeWeightsForExtent*(this: var vtkImageSincInterpolator;
                                matrix: array[16, cfloat]; extent: array[6, cint];
                                newExtent: array[6, cint];
                                weights: ptr vtkInterpolationWeights) {.
    importcpp: "PrecomputeWeightsForExtent", header: "vtkImageSincInterpolator.h".}
proc FreePrecomputedWeights*(this: var vtkImageSincInterpolator;
                            weights: ptr vtkInterpolationWeights) {.
    importcpp: "FreePrecomputedWeights", header: "vtkImageSincInterpolator.h".}