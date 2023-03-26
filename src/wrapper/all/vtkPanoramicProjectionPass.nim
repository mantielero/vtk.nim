## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPanoramicProjectionPass.h
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
##  @class   vtkPanoramicProjectionPass
##  @brief   Render pass that render the scene in a cubemap and project
##  these six renderings to a single quad.
##  There are currently two different projections implemented (Equirectangular and Azimuthal).
##  This pass can be used to produce images that can be visualize with specific devices that re-maps
##  the distorted image to a panoramic view (for instance VR headsets, domes, panoramic screens)
##
##  Note that it is often necessary to disable frustum cullers in order to render
##  properly objects that are behind the camera.
##
##  @sa
##  vtkRenderPass
##

import
  vtkImageProcessingPass, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLFramebufferObject"
discard "forward decl of vtkOpenGLQuadHelper"
discard "forward decl of vtkTextureObject"
type
  vtkPanoramicProjectionPass* {.importcpp: "vtkPanoramicProjectionPass",
                               header: "vtkPanoramicProjectionPass.h", bycopy.} = object of vtkImageProcessingPass
    vtkPanoramicProjectionPass* {.importc: "vtkPanoramicProjectionPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPanoramicProjectionPass {.
    importcpp: "vtkPanoramicProjectionPass::New(@)",
    header: "vtkPanoramicProjectionPass.h".}
type
  vtkPanoramicProjectionPassSuperclass* = vtkImageProcessingPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPanoramicProjectionPass::IsTypeOf(@)",
    header: "vtkPanoramicProjectionPass.h".}
proc IsA*(this: var vtkPanoramicProjectionPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPanoramicProjectionPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPanoramicProjectionPass {.
    importcpp: "vtkPanoramicProjectionPass::SafeDownCast(@)",
    header: "vtkPanoramicProjectionPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPanoramicProjectionPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageProcessingPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPanoramicProjectionPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPanoramicProjectionPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPanoramicProjectionPass; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPanoramicProjectionPass.h".}
proc Render*(this: var vtkPanoramicProjectionPass; s: ptr vtkRenderState) {.
    importcpp: "Render", header: "vtkPanoramicProjectionPass.h".}
proc ReleaseGraphicsResources*(this: var vtkPanoramicProjectionPass;
                              w: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkPanoramicProjectionPass.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the cubemap textures resolution used to render (offscreen) all directions.
##  Default is 300.
##  virtual unsigned int GetCubeResolutionCubeResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CubeResolution  of  << this -> CubeResolution ) ; return this -> CubeResolution ; } ;
## Error: expected ';'!!!

proc SetCubeResolution*(this: var vtkPanoramicProjectionPass; _arg: cuint) {.
    importcpp: "SetCubeResolution", header: "vtkPanoramicProjectionPass.h".}
  ## /@}
  ## *
  ##  Enumeration of projection types.
  ##
## !!!Ignored construct:  enum : int { Equirectangular = 1 , *< Equirectangular projection Azimuthal = 2 *< Azimuthal equidistant projection } ;
## Error: expected '{'!!!

## !!!Ignored construct:  /@{ *
##  Get/Set the type of projection.
##  Equirectangular projection maps meridians to vertical straight lines and circles of latitude to
##  horizontal straight lines.
##  Azimuthal equidistant projection maps all points of the scene based on their distance to the
##  view direction. This projection produces a fisheye effect.
##  Default is Equirectangular.
##  virtual int GetCubeResolutionCubeResolutionProjectionTypeProjectionType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionType  of  << this -> ProjectionType ) ; return this -> ProjectionType ; } ;
## Error: expected ';'!!!

proc SetProjectionType*(this: var vtkPanoramicProjectionPass; _arg: cint) {.
    importcpp: "SetProjectionType", header: "vtkPanoramicProjectionPass.h".}
proc GetProjectionTypeMinValue*(this: var vtkPanoramicProjectionPass): cint {.
    importcpp: "GetProjectionTypeMinValue", header: "vtkPanoramicProjectionPass.h".}
proc GetProjectionTypeMaxValue*(this: var vtkPanoramicProjectionPass): cint {.
    importcpp: "GetProjectionTypeMaxValue", header: "vtkPanoramicProjectionPass.h".}
proc SetProjectionTypeToEquirectangular*(this: var vtkPanoramicProjectionPass) {.
    importcpp: "SetProjectionTypeToEquirectangular",
    header: "vtkPanoramicProjectionPass.h".}
proc SetProjectionTypeToAzimuthal*(this: var vtkPanoramicProjectionPass) {.
    importcpp: "SetProjectionTypeToAzimuthal",
    header: "vtkPanoramicProjectionPass.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the vertical angle of projection.
##  180 degrees is a half sphere, 360 degrees is a full sphere,
##  but any values in the range (90;360) can be set.
##  Default is 180 degrees.
##  virtual double GetCubeResolutionCubeResolutionProjectionTypeProjectionTypeAngleAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Angle  of  << this -> Angle ) ; return this -> Angle ; } ;
## Error: expected ';'!!!

proc SetProjectionTypeAngle*(this: var vtkPanoramicProjectionPass; _arg: cdouble) {.
    importcpp: "SetProjectionTypeAngle", header: "vtkPanoramicProjectionPass.h".}
proc GetProjectionTypeMinValueAngleMinValue*(this: var vtkPanoramicProjectionPass): cdouble {.
    importcpp: "GetProjectionTypeMinValueAngleMinValue",
    header: "vtkPanoramicProjectionPass.h".}
proc GetProjectionTypeMaxValueAngleMaxValue*(this: var vtkPanoramicProjectionPass): cdouble {.
    importcpp: "GetProjectionTypeMaxValueAngleMaxValue",
    header: "vtkPanoramicProjectionPass.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the interpolation mode.
  ##  If true, the projection of the cubemap use hardware interpolation.
  ##  Default is off.
  ##
## !!!Ignored construct:  virtual bool GetCubeResolutionCubeResolutionProjectionTypeProjectionTypeAngleAngleInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interpolate  of  << this -> Interpolate ) ; return this -> Interpolate ; } ;
## Error: expected ';'!!!

proc SetCubeResolutionInterpolate*(this: var vtkPanoramicProjectionPass; _arg: bool) {.
    importcpp: "SetCubeResolutionInterpolate",
    header: "vtkPanoramicProjectionPass.h".}
proc InterpolateOn*(this: var vtkPanoramicProjectionPass) {.
    importcpp: "InterpolateOn", header: "vtkPanoramicProjectionPass.h".}
proc InterpolateOff*(this: var vtkPanoramicProjectionPass) {.
    importcpp: "InterpolateOff", header: "vtkPanoramicProjectionPass.h".}
  ## /@}