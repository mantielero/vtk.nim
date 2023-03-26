## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageHSVToRGB.h
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
##  @class   vtkImageHSVToRGB
##  @brief   Converts HSV components to RGB.
##
##  For each pixel with hue, saturation and value components this filter
##  outputs the color coded as red, green, blue.  Output type must be the same
##  as input type.
##
##  @sa
##  vtkImageRGBToHSV
##

import
  vtkImagingColorModule, vtkThreadedImageAlgorithm

type
  vtkImageHSVToRGB* {.importcpp: "vtkImageHSVToRGB", header: "vtkImageHSVToRGB.h",
                     bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageHSVToRGB* {.importc: "vtkImageHSVToRGB".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageHSVToRGB {.importcpp: "vtkImageHSVToRGB::New(@)",
                                header: "vtkImageHSVToRGB.h".}
type
  vtkImageHSVToRGBSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageHSVToRGB::IsTypeOf(@)", header: "vtkImageHSVToRGB.h".}
proc IsA*(this: var vtkImageHSVToRGB; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageHSVToRGB.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageHSVToRGB {.
    importcpp: "vtkImageHSVToRGB::SafeDownCast(@)", header: "vtkImageHSVToRGB.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageHSVToRGB :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageHSVToRGB :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageHSVToRGB :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageHSVToRGB; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageHSVToRGB.h".}
proc SetMaximum*(this: var vtkImageHSVToRGB; _arg: cdouble) {.importcpp: "SetMaximum",
    header: "vtkImageHSVToRGB.h".}
## !!!Ignored construct:  virtual double GetMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ;
## Error: expected ';'!!!
