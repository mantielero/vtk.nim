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
##  @class   vtkVRHMDCamera
##  @brief   A superclass for HMD style cameras
##
##

import
  vtkNew, vtkRenderingVRModule, vtkVRCamera

discard "forward decl of vtkRenderer"
discard "forward decl of vtkMatrix4x4"
type
  vtkVRHMDCamera* {.importcpp: "vtkVRHMDCamera", header: "vtkVRHMDCamera.h", bycopy.} = object of vtkVRCamera
    vtkVRHMDCamera* {.importc: "vtkVRHMDCamera".}: VTK_NEWINSTANCE
    ##  adds in the world to physical part
    ##  we get these from the VR system possibly with some modifications for
    ##  adjusting the clipping range or zbuffer formula
    ##  computed using the above matrices, these matrices go from physical to
    ##  projection space but that transformation will be different depending on
    ##  which eye is active. So the naming is different as the start and end
    ##  space is not tied to an eye, but rather some of the internal
    ##  transformations

  vtkVRHMDCameraSuperclass* = vtkVRCamera

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVRHMDCamera::IsTypeOf(@)", header: "vtkVRHMDCamera.h".}
proc IsA*(this: var vtkVRHMDCamera; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVRHMDCamera.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVRHMDCamera {.
    importcpp: "vtkVRHMDCamera::SafeDownCast(@)", header: "vtkVRHMDCamera.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVRHMDCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVRCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRHMDCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRHMDCamera :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVRHMDCamera; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVRHMDCamera.h".}
proc Render*(this: var vtkVRHMDCamera; ren: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkVRHMDCamera.h".}
proc GetKeyMatrices*(this: var vtkVRHMDCamera; ren: ptr vtkRenderer;
                    WCVCMatrix: ptr vtkMatrix4x4; normalMatrix: ptr vtkMatrix3x3;
                    VCDCMatrix: ptr vtkMatrix4x4; WCDCMatrix: ptr vtkMatrix4x4) {.
    importcpp: "GetKeyMatrices", header: "vtkVRHMDCamera.h".}
proc GetPhysicalToProjectionMatrix*(this: var vtkVRHMDCamera;
    physicalToProjectionMatrtix: ptr vtkMatrix4x4) {.
    importcpp: "GetPhysicalToProjectionMatrix", header: "vtkVRHMDCamera.h".}