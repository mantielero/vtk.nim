## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayMaterial.h
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
##  @class   vtkOSPRayMaterialHelpers
##  @brief   convert vtk appearance controls to ospray materials
##
##  Routines that convert vtk's appearance controlling state into ospray
##  specific calls to create materials. The key piece of information is the
##  vtkProperty::MaterialName, the rest is looked up from the
##  vtkOSPRayMaterialLibrary singleton.
##  The routines here are used by vtkOSPRayPolyDataMapperNode at render time.
##
##  The contents here are private implementation details, and not meant to
##  be part of VTK's public API.
##
##  @sa vtkOSPRayMaterialLibrary
##

import
  RTWrapper/RTWrapper

discard "forward decl of vtkImageData"
discard "forward decl of vtkOSPRayRendererNode"
## *
##  Helper function to make a 2d OSPRay Texture.
##  Was promoted from OSPRay because of deprecation there.
##

proc NewTexture2D*(backend: ptr Backend; size: vec2i; `type`: OSPTextureFormat;
                  data: pointer; _flags: uint32_t): OSPTexture {.
    importcpp: "vtkOSPRayMaterialHelpers::NewTexture2D(@)",
    header: "vtkOSPRayMaterialHelpers.h".}
## *
##  Manufacture an ospray texture from a 2d vtkImageData.
##  isSRGB can be set to true if the image is 8-bits and sRGB encoded.
##

proc VTKToOSPTexture*(backend: ptr Backend; vColorTextureMap: ptr vtkImageData;
                     isSRGB: bool = false): OSPTexture {.
    importcpp: "vtkOSPRayMaterialHelpers::VTKToOSPTexture(@)",
    header: "vtkOSPRayMaterialHelpers.h".}
## *
##  Construct a set of ospray materials for all of the material names.
##

proc MakeMaterials*(orn: ptr vtkOSPRayRendererNode; oRenderer: OSPRenderer;
                   mats: var map[string, OSPMaterial]) {.
    importcpp: "vtkOSPRayMaterialHelpers::MakeMaterials(@)",
    header: "vtkOSPRayMaterialHelpers.h".}
## *
##  Construct one ospray material within the given renderer that
##  corresponds to the visual characteristics set out in the named
##  material in the material library.
##

proc MakeMaterial*(orn: ptr vtkOSPRayRendererNode; oRenderer: OSPRenderer;
                  nickname: string): OSPMaterial {.
    importcpp: "vtkOSPRayMaterialHelpers::MakeMaterial(@)",
    header: "vtkOSPRayMaterialHelpers.h".}
## *
##  Wraps ospNewMaterial
##

proc NewMaterial*(orn: ptr vtkOSPRayRendererNode; oRenderer: OSPRenderer;
                 ospMatName: string): OSPMaterial {.
    importcpp: "vtkOSPRayMaterialHelpers::NewMaterial(@)",
    header: "vtkOSPRayMaterialHelpers.h".}
##  VTK-HeaderTest-Exclude: vtkOSPRayMaterialHelpers.h
