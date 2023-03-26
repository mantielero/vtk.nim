## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSobel3D.h
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
##  @class   vtkImageSobel3D
##  @brief   Computes a vector field using sobel functions.
##
##  vtkImageSobel3D computes a vector field from a scalar field by using
##  Sobel functions.  The number of vector components is 3 because
##  the input is a volume.  Output is always doubles.  A little creative
##  liberty was used to extend the 2D sobel kernels into 3D.
##

import
  vtkImageSpatialAlgorithm, vtkImagingGeneralModule

type
  vtkImageSobel3D* {.importcpp: "vtkImageSobel3D", header: "vtkImageSobel3D.h",
                    bycopy.} = object of vtkImageSpatialAlgorithm
    vtkImageSobel3D* {.importc: "vtkImageSobel3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageSobel3D {.importcpp: "vtkImageSobel3D::New(@)",
                               header: "vtkImageSobel3D.h".}
type
  vtkImageSobel3DSuperclass* = vtkImageSpatialAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageSobel3D::IsTypeOf(@)", header: "vtkImageSobel3D.h".}
proc IsA*(this: var vtkImageSobel3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageSobel3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageSobel3D {.
    importcpp: "vtkImageSobel3D::SafeDownCast(@)", header: "vtkImageSobel3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageSobel3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSobel3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSobel3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageSobel3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageSobel3D.h".}