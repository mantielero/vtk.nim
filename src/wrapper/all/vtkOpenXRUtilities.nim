## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenXRUtilities.h
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
##  @class   vtkOpenXRUtilities
##  //----------------------------------------------------------------------------
##  @brief   Header file that contains utility functions for OpenXR
##
##  This class contains inline functions to create matrices from OpenXR pose
##  And other functions to convert OpenXR structures to string.
##
##  vtkOpenXRUtilities
##

import
  vtkMatrix4x4, vtkOpenXR

type
  vtkOpenXRUtilities* {.importcpp: "vtkOpenXRUtilities",
                       header: "vtkOpenXRUtilities.h", bycopy.} = object of vtkObject
    vtkOpenXRUtilities* {.importc: "vtkOpenXRUtilities".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenXRUtilities {.importcpp: "vtkOpenXRUtilities::New(@)",
                                  header: "vtkOpenXRUtilities.h".}
type
  vtkOpenXRUtilitiesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenXRUtilities::IsTypeOf(@)", header: "vtkOpenXRUtilities.h".}
proc IsA*(this: var vtkOpenXRUtilities; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenXRUtilities.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenXRUtilities {.
    importcpp: "vtkOpenXRUtilities::SafeDownCast(@)",
    header: "vtkOpenXRUtilities.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenXRUtilities :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenXRUtilities :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenXRUtilities :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc CreateProjectionFov*(result: ptr vtkMatrix4x4; fov: XrFovf; nearZ: cfloat;
                         farZ: cfloat) {.importcpp: "vtkOpenXRUtilities::CreateProjectionFov(@)",
                                       header: "vtkOpenXRUtilities.h".}
proc SetMatrixFromXrPose*(result: ptr vtkMatrix4x4; xrPose: XrPosef) {.
    importcpp: "vtkOpenXRUtilities::SetMatrixFromXrPose(@)",
    header: "vtkOpenXRUtilities.h".}
proc CreateFromQuaternion*(result: array[16, cdouble]; quat: XrQuaternionf) {.
    importcpp: "vtkOpenXRUtilities::CreateFromQuaternion(@)",
    header: "vtkOpenXRUtilities.h".}
proc GetActionTypeAsString*(actionType: XrActionType): cstring {.
    importcpp: "vtkOpenXRUtilities::GetActionTypeAsString(@)",
    header: "vtkOpenXRUtilities.h".}
proc GetViewConfigurationTypeAsString*(viewConfigType: XrViewConfigurationType): cstring {.
    importcpp: "vtkOpenXRUtilities::GetViewConfigurationTypeAsString(@)",
    header: "vtkOpenXRUtilities.h".}
proc GetStructureTypeAsString*(structureType: XrStructureType): cstring {.
    importcpp: "vtkOpenXRUtilities::GetStructureTypeAsString(@)",
    header: "vtkOpenXRUtilities.h".}
proc GetIdentityPose*(): XrPosef {.importcpp: "vtkOpenXRUtilities::GetIdentityPose(@)",
                                header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------

proc GetIdentityPose*(this: var vtkOpenXRUtilities): var XrPosef {.
    importcpp: "GetIdentityPose", header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------

proc CreateProjectionFov*(this: var vtkOpenXRUtilities; result: ptr vtkMatrix4x4;
                         fov: XrFovf; nearZ: cfloat; farZ: cfloat) {.
    importcpp: "CreateProjectionFov", header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------
##  transpose of vtk standard

proc CreateFromQuaternion*(this: var vtkOpenXRUtilities; result: array[16, cdouble];
                          quat: XrQuaternionf) {.
    importcpp: "CreateFromQuaternion", header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------
##  transpose of VTK standard

proc SetMatrixFromXrPose*(this: var vtkOpenXRUtilities; result: ptr vtkMatrix4x4;
                         xrPose: XrPosef) {.importcpp: "SetMatrixFromXrPose",
    header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------

proc GetActionTypeAsString*(this: var vtkOpenXRUtilities; actionType: XrActionType): cstring {.
    importcpp: "GetActionTypeAsString", header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------

proc GetViewConfigurationTypeAsString*(this: var vtkOpenXRUtilities;
                                      viewConfigType: XrViewConfigurationType): cstring {.
    importcpp: "GetViewConfigurationTypeAsString", header: "vtkOpenXRUtilities.h".}
## ----------------------------------------------------------------------------

proc GetStructureTypeAsString*(this: var vtkOpenXRUtilities;
                              structureType: XrStructureType): cstring {.
    importcpp: "GetStructureTypeAsString", header: "vtkOpenXRUtilities.h".}
##  VTK-HeaderTest-Exclude: vtkOpenXRUtilities.h
