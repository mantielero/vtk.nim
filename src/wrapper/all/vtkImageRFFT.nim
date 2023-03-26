## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageRFFT.h
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
##  @class   vtkImageRFFT
##  @brief    Reverse Fast Fourier Transform.
##
##  vtkImageRFFT implements the reverse fast Fourier transform.  The input
##  can have real or complex data in any components and data types, but
##  the output is always complex doubles with real values in component0, and
##  imaginary values in component1.  The filter is fastest for images that
##  have power of two sizes.  The filter uses butterfly filters for each
##  prime factor of the dimension.  This makes images with prime number dimensions
##  (i.e. 17x17) much slower to compute.  Multi dimensional (i.e volumes)
##  FFT's are decomposed so that each axis executes in series.
##  In most cases the RFFT will produce an image whose imaginary values are all
##  zero's. In this case vtkImageExtractComponents can be used to remove
##  this imaginary components leaving only the real image.
##
##  @sa
##  vtkImageExtractComponenents
##

import
  vtkImageFourierFilter, vtkImagingFourierModule

type
  vtkImageRFFT* {.importcpp: "vtkImageRFFT", header: "vtkImageRFFT.h", bycopy.} = object of vtkImageFourierFilter
    vtkImageRFFT* {.importc: "vtkImageRFFT".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageRFFT {.importcpp: "vtkImageRFFT::New(@)",
                            header: "vtkImageRFFT.h".}
type
  vtkImageRFFTSuperclass* = vtkImageFourierFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageRFFT::IsTypeOf(@)", header: "vtkImageRFFT.h".}
proc IsA*(this: var vtkImageRFFT; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageRFFT.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageRFFT {.
    importcpp: "vtkImageRFFT::SafeDownCast(@)", header: "vtkImageRFFT.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageRFFT :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageFourierFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageRFFT :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageRFFT :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageRFFT; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageRFFT.h".}