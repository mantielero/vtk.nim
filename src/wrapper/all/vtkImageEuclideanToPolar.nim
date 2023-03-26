## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageEuclideanToPolar.h
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
##  @class   vtkImageEuclideanToPolar
##  @brief   Converts 2D Euclidean coordinates to polar.
##
##  For each pixel with vector components x,y, this filter outputs
##  theta in component0, and radius in component1.
##

import
  vtkImagingGeneralModule, vtkThreadedImageAlgorithm

type
  vtkImageEuclideanToPolar* {.importcpp: "vtkImageEuclideanToPolar",
                             header: "vtkImageEuclideanToPolar.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageEuclideanToPolar* {.importc: "vtkImageEuclideanToPolar".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageEuclideanToPolar {.importcpp: "vtkImageEuclideanToPolar::New(@)",
                                        header: "vtkImageEuclideanToPolar.h".}
type
  vtkImageEuclideanToPolarSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageEuclideanToPolar::IsTypeOf(@)",
    header: "vtkImageEuclideanToPolar.h".}
proc IsA*(this: var vtkImageEuclideanToPolar; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageEuclideanToPolar.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageEuclideanToPolar {.
    importcpp: "vtkImageEuclideanToPolar::SafeDownCast(@)",
    header: "vtkImageEuclideanToPolar.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageEuclideanToPolar :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageEuclideanToPolar :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageEuclideanToPolar :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageEuclideanToPolar; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageEuclideanToPolar.h".}
proc SetThetaMaximum*(this: var vtkImageEuclideanToPolar; _arg: cdouble) {.
    importcpp: "SetThetaMaximum", header: "vtkImageEuclideanToPolar.h".}
## !!!Ignored construct:  virtual double GetThetaMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaMaximum  of  << this -> ThetaMaximum ) ; return this -> ThetaMaximum ; } ;
## Error: expected ';'!!!
