## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageRange3D.h
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
##  @class   vtkImageRange3D
##  @brief   Max - min of a circular neighborhood.
##
##  vtkImageRange3D replaces a pixel with the maximum minus minimum over
##  an ellipsoidal neighborhood.  If KernelSize of an axis is 1, no processing
##  is done on that axis.
##

import
  vtkImageSpatialAlgorithm, vtkImagingGeneralModule

discard "forward decl of vtkImageEllipsoidSource"
type
  vtkImageRange3D* {.importcpp: "vtkImageRange3D", header: "vtkImageRange3D.h",
                    bycopy.} = object of vtkImageSpatialAlgorithm
    vtkImageRange3D* {.importc: "vtkImageRange3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageRange3D {.importcpp: "vtkImageRange3D::New(@)",
                               header: "vtkImageRange3D.h".}
type
  vtkImageRange3DSuperclass* = vtkImageSpatialAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageRange3D::IsTypeOf(@)", header: "vtkImageRange3D.h".}
proc IsA*(this: var vtkImageRange3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageRange3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageRange3D {.
    importcpp: "vtkImageRange3D::SafeDownCast(@)", header: "vtkImageRange3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageRange3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageRange3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageRange3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageRange3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageRange3D.h".}
proc SetKernelSize*(this: var vtkImageRange3D; size0: cint; size1: cint; size2: cint) {.
    importcpp: "SetKernelSize", header: "vtkImageRange3D.h".}