## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageFFT.h
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
##  @class   vtkImageFFT
##  @brief    Fast Fourier Transform.
##
##  vtkImageFFT implements a fast Fourier transform.  The input
##  can have real or complex data in any components and data types, but
##  the output is always complex doubles with real values in component0, and
##  imaginary values in component1.  The filter is fastest for images that
##  have power of two sizes.  The filter uses a butterfly diagram for each
##  prime factor of the dimension.  This makes images with prime number dimensions
##  (i.e. 17x17) much slower to compute.  Multi dimensional (i.e volumes)
##  FFT's are decomposed so that each axis executes serially.
##

import
  vtkImageFourierFilter, vtkImagingFourierModule

type
  vtkImageFFT* {.importcpp: "vtkImageFFT", header: "vtkImageFFT.h", bycopy.} = object of vtkImageFourierFilter
    vtkImageFFT* {.importc: "vtkImageFFT".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageFFT {.importcpp: "vtkImageFFT::New(@)",
                           header: "vtkImageFFT.h".}
type
  vtkImageFFTSuperclass* = vtkImageFourierFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageFFT::IsTypeOf(@)", header: "vtkImageFFT.h".}
proc IsA*(this: var vtkImageFFT; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageFFT.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageFFT {.
    importcpp: "vtkImageFFT::SafeDownCast(@)", header: "vtkImageFFT.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageFFT :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageFourierFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageFFT :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageFFT :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageFFT; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageFFT.h".}