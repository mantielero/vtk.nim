## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageGradient.h
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
##  @class   vtkImageGradient
##  @brief   Computes the gradient vector.
##
##  vtkImageGradient computes the gradient vector of an image.  The
##  vector results are stored as scalar components. The Dimensionality
##  determines whether to perform a 2d or 3d gradient. The default is
##  two dimensional XY gradient.  OutputScalarType is always
##  double. Gradient is computed using central differences.
##

import
  vtkImagingGeneralModule, vtkThreadedImageAlgorithm

type
  vtkImageGradient* {.importcpp: "vtkImageGradient", header: "vtkImageGradient.h",
                     bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageGradient* {.importc: "vtkImageGradient".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageGradient {.importcpp: "vtkImageGradient::New(@)",
                                header: "vtkImageGradient.h".}
type
  vtkImageGradientSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageGradient::IsTypeOf(@)", header: "vtkImageGradient.h".}
proc IsA*(this: var vtkImageGradient; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageGradient.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageGradient {.
    importcpp: "vtkImageGradient::SafeDownCast(@)", header: "vtkImageGradient.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageGradient :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageGradient :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageGradient :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageGradient; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageGradient.h".}
proc SetDimensionality*(this: var vtkImageGradient; _arg: cint) {.
    importcpp: "SetDimensionality", header: "vtkImageGradient.h".}
proc GetDimensionalityMinValue*(this: var vtkImageGradient): cint {.
    importcpp: "GetDimensionalityMinValue", header: "vtkImageGradient.h".}
proc GetDimensionalityMaxValue*(this: var vtkImageGradient): cint {.
    importcpp: "GetDimensionalityMaxValue", header: "vtkImageGradient.h".}
## !!!Ignored construct:  virtual int GetDimensionality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimensionality  of  << this -> Dimensionality ) ; return this -> Dimensionality ; } ;
## Error: expected ';'!!!

proc SetHandleBoundaries*(this: var vtkImageGradient; _arg: vtkTypeBool) {.
    importcpp: "SetHandleBoundaries", header: "vtkImageGradient.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDimensionalityHandleBoundaries ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleBoundaries  of  << this -> HandleBoundaries ) ; return this -> HandleBoundaries ; } ;
## Error: expected ';'!!!

proc HandleBoundariesOn*(this: var vtkImageGradient) {.
    importcpp: "HandleBoundariesOn", header: "vtkImageGradient.h".}
proc HandleBoundariesOff*(this: var vtkImageGradient) {.
    importcpp: "HandleBoundariesOff", header: "vtkImageGradient.h".}
  ## /@}