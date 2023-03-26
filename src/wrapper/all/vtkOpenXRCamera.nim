## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkOpenXRCamera
##  @brief   OpenXR camera
##
##  vtkOpenXRCamera is a concrete implementation of the abstract class
##  vtkCamera.
##
##  vtkOpenXRCamera interfaces to the OpenXR rendering library.
##
##  It sets a custom view transform and projection matrix from the view pose and projection
##  fov given by vtkOpenXRManager
##

import
  vtkRenderingOpenXRModule, vtkVRHMDCamera

type
  vtkOpenXRCamera* {.importcpp: "vtkOpenXRCamera", header: "vtkOpenXRCamera.h",
                    bycopy.} = object of vtkVRHMDCamera
    vtkOpenXRCamera* {.importc: "vtkOpenXRCamera".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenXRCamera {.importcpp: "vtkOpenXRCamera::New(@)",
                               header: "vtkOpenXRCamera.h".}
type
  vtkOpenXRCameraSuperclass* = vtkVRHMDCamera

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenXRCamera::IsTypeOf(@)", header: "vtkOpenXRCamera.h".}
proc IsA*(this: var vtkOpenXRCamera; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOpenXRCamera.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenXRCamera {.
    importcpp: "vtkOpenXRCamera::SafeDownCast(@)", header: "vtkOpenXRCamera.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenXRCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVRHMDCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenXRCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenXRCamera :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc Render*(this: var vtkOpenXRCamera; ren: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkOpenXRCamera.h".}