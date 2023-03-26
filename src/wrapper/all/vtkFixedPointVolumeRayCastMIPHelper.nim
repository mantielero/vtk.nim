## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastMIPHelper.h
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
##  @class   vtkFixedPointVolumeRayCastMIPHelper
##  @brief   A helper that generates MIP images for the volume ray cast mapper
##
##  This is one of the helper classes for the vtkFixedPointVolumeRayCastMapper.
##  It will generate maximum intensity images.
##  This class should not be used directly, it is a helper class for
##  the mapper and has no user-level API.
##
##  @sa
##  vtkFixedPointVolumeRayCastMapper
##

import
  vtkFixedPointVolumeRayCastHelper, vtkRenderingVolumeModule

discard "forward decl of vtkFixedPointVolumeRayCastMapper"
discard "forward decl of vtkVolume"
type
  vtkFixedPointVolumeRayCastMIPHelper* {.importcpp: "vtkFixedPointVolumeRayCastMIPHelper", header: "vtkFixedPointVolumeRayCastMIPHelper.h",
                                        bycopy.} = object of vtkFixedPointVolumeRayCastHelper
    vtkFixedPointVolumeRayCastMIPHelper* {.
        importc: "vtkFixedPointVolumeRayCastMIPHelper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFixedPointVolumeRayCastMIPHelper {.
    importcpp: "vtkFixedPointVolumeRayCastMIPHelper::New(@)",
    header: "vtkFixedPointVolumeRayCastMIPHelper.h".}
type
  vtkFixedPointVolumeRayCastMIPHelperSuperclass* = vtkFixedPointVolumeRayCastHelper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFixedPointVolumeRayCastMIPHelper::IsTypeOf(@)",
    header: "vtkFixedPointVolumeRayCastMIPHelper.h".}
proc IsA*(this: var vtkFixedPointVolumeRayCastMIPHelper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFixedPointVolumeRayCastMIPHelper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFixedPointVolumeRayCastMIPHelper {.
    importcpp: "vtkFixedPointVolumeRayCastMIPHelper::SafeDownCast(@)",
    header: "vtkFixedPointVolumeRayCastMIPHelper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFixedPointVolumeRayCastMIPHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFixedPointVolumeRayCastHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastMIPHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointVolumeRayCastMIPHelper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFixedPointVolumeRayCastMIPHelper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkFixedPointVolumeRayCastMIPHelper.h".}
proc GenerateImage*(this: var vtkFixedPointVolumeRayCastMIPHelper; threadID: cint;
                   threadCount: cint; vol: ptr vtkVolume;
                   mapper: ptr vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "GenerateImage", header: "vtkFixedPointVolumeRayCastMIPHelper.h".}