## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h
##   Language:  C++
##
##   Copyright (c) 1993-2002 Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkFixedPointVolumeRayCastCompositeGOShadeHelper
##  @brief   A helper that generates composite images for the volume ray cast mapper
##
##  This is one of the helper classes for the vtkFixedPointVolumeRayCastMapper.
##  It will generate composite images using an alpha blending operation.
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
  vtkFixedPointVolumeRayCastCompositeGOShadeHelper* {.
      importcpp: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper",
      header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h", bycopy.} = object of vtkFixedPointVolumeRayCastHelper
    vtkFixedPointVolumeRayCastCompositeGOShadeHelper*
        {.importc: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFixedPointVolumeRayCastCompositeGOShadeHelper {.
    importcpp: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper::New(@)",
    header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h".}
type
  vtkFixedPointVolumeRayCastCompositeGOShadeHelperSuperclass* = vtkFixedPointVolumeRayCastHelper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper::IsTypeOf(@)",
    header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h".}
proc IsA*(this: var vtkFixedPointVolumeRayCastCompositeGOShadeHelper;
         `type`: cstring): vtkTypeBool {.importcpp: "IsA", header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFixedPointVolumeRayCastCompositeGOShadeHelper {.importcpp: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper::SafeDownCast(@)",
    header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFixedPointVolumeRayCastCompositeGOShadeHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkFixedPointVolumeRayCastHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastCompositeGOShadeHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointVolumeRayCastCompositeGOShadeHelper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFixedPointVolumeRayCastCompositeGOShadeHelper;
               os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h".}
proc GenerateImage*(this: var vtkFixedPointVolumeRayCastCompositeGOShadeHelper;
                   threadID: cint; threadCount: cint; vol: ptr vtkVolume;
                   mapper: ptr vtkFixedPointVolumeRayCastMapper) {.
    importcpp: "GenerateImage",
    header: "vtkFixedPointVolumeRayCastCompositeGOShadeHelper.h".}