## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageHSIToRGB.h
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
##  @class   vtkImageHSIToRGB
##  @brief   Converts HSI components to RGB.
##
##  For each pixel with hue, saturation and intensity components this filter
##  outputs the color coded as red, green, blue.  Output type must be the same
##  as input type.
##
##  @sa
##  vtkImageRGBToHSI
##

import
  vtkImagingColorModule, vtkThreadedImageAlgorithm

type
  vtkImageHSIToRGB* {.importcpp: "vtkImageHSIToRGB", header: "vtkImageHSIToRGB.h",
                     bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageHSIToRGB* {.importc: "vtkImageHSIToRGB".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageHSIToRGB {.importcpp: "vtkImageHSIToRGB::New(@)",
                                header: "vtkImageHSIToRGB.h".}
type
  vtkImageHSIToRGBSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageHSIToRGB::IsTypeOf(@)", header: "vtkImageHSIToRGB.h".}
proc IsA*(this: var vtkImageHSIToRGB; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageHSIToRGB.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageHSIToRGB {.
    importcpp: "vtkImageHSIToRGB::SafeDownCast(@)", header: "vtkImageHSIToRGB.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageHSIToRGB :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageHSIToRGB :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageHSIToRGB :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageHSIToRGB; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageHSIToRGB.h".}
proc SetMaximum*(this: var vtkImageHSIToRGB; _arg: cdouble) {.importcpp: "SetMaximum",
    header: "vtkImageHSIToRGB.h".}
## !!!Ignored construct:  virtual double GetMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ;
## Error: expected ';'!!!
