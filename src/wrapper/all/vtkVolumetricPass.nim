## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumetricPass.h
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
##  @class   vtkVolumetricPass
##  @brief   Render the volumetric geometry with property key
##  filtering.
##
##  vtkVolumetricPass renders the volumetric geometry of all the props that
##  have the keys contained in vtkRenderState.
##
##  This pass expects an initialized depth buffer and color buffer.
##  Initialized buffers means they have been cleared with farest z-value and
##  background color/gradient/transparent color.
##
##  @sa
##  vtkRenderPass vtkDefaultPass
##

import
  vtkDefaultPass, vtkRenderingOpenGL2Module

type
  vtkVolumetricPass* {.importcpp: "vtkVolumetricPass",
                      header: "vtkVolumetricPass.h", bycopy.} = object of vtkDefaultPass ## *
                                                                                  ##  Default constructor.
                                                                                  ##
    vtkVolumetricPass* {.importc: "vtkVolumetricPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVolumetricPass {.importcpp: "vtkVolumetricPass::New(@)",
                                 header: "vtkVolumetricPass.h".}
type
  vtkVolumetricPassSuperclass* = vtkDefaultPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumetricPass::IsTypeOf(@)", header: "vtkVolumetricPass.h".}
proc IsA*(this: var vtkVolumetricPass; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVolumetricPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumetricPass {.
    importcpp: "vtkVolumetricPass::SafeDownCast(@)", header: "vtkVolumetricPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumetricPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDefaultPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumetricPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumetricPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumetricPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVolumetricPass.h".}
proc Render*(this: var vtkVolumetricPass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkVolumetricPass.h".}