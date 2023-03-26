## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageFourierCenter.h
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
##  @class   vtkImageFourierCenter
##  @brief   Shifts constant frequency to center for
##  display.
##
##  Is used for dispaying images in frequency space.  FFT converts spatial
##  images into frequency space, but puts the zero frequency at the origin.
##  This filter shifts the zero frequency to the center of the image.
##  Input and output are assumed to be doubles.
##

import
  vtkImageDecomposeFilter, vtkImagingFourierModule

type
  vtkImageFourierCenter* {.importcpp: "vtkImageFourierCenter",
                          header: "vtkImageFourierCenter.h", bycopy.} = object of vtkImageDecomposeFilter
    vtkImageFourierCenter* {.importc: "vtkImageFourierCenter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageFourierCenter {.importcpp: "vtkImageFourierCenter::New(@)",
                                     header: "vtkImageFourierCenter.h".}
type
  vtkImageFourierCenterSuperclass* = vtkImageDecomposeFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageFourierCenter::IsTypeOf(@)",
    header: "vtkImageFourierCenter.h".}
proc IsA*(this: var vtkImageFourierCenter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageFourierCenter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageFourierCenter {.
    importcpp: "vtkImageFourierCenter::SafeDownCast(@)",
    header: "vtkImageFourierCenter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageFourierCenter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageDecomposeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageFourierCenter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageFourierCenter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageFourierCenter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageFourierCenter.h".}