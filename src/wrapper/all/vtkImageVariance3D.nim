## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageVariance3D.h
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
##  @class   vtkImageVariance3D
##  @brief   Variance in a neighborhood.
##
##  vtkImageVariance3D replaces each pixel with a measurement of
##  pixel variance in a elliptical neighborhood centered on that pixel.
##  The value computed is not exactly the variance.
##  The difference between the neighbor values and center value is computed
##  and squared for each neighbor.  These values are summed and divided by
##  the total number of neighbors to produce the output value.
##

import
  vtkImageSpatialAlgorithm, vtkImagingGeneralModule

discard "forward decl of vtkImageEllipsoidSource"
type
  vtkImageVariance3D* {.importcpp: "vtkImageVariance3D",
                       header: "vtkImageVariance3D.h", bycopy.} = object of vtkImageSpatialAlgorithm
    vtkImageVariance3D* {.importc: "vtkImageVariance3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageVariance3D {.importcpp: "vtkImageVariance3D::New(@)",
                                  header: "vtkImageVariance3D.h".}
type
  vtkImageVariance3DSuperclass* = vtkImageSpatialAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageVariance3D::IsTypeOf(@)", header: "vtkImageVariance3D.h".}
proc IsA*(this: var vtkImageVariance3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageVariance3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageVariance3D {.
    importcpp: "vtkImageVariance3D::SafeDownCast(@)",
    header: "vtkImageVariance3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageVariance3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageVariance3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageVariance3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageVariance3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageVariance3D.h".}
proc SetKernelSize*(this: var vtkImageVariance3D; size0: cint; size1: cint; size2: cint) {.
    importcpp: "SetKernelSize", header: "vtkImageVariance3D.h".}