## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOverlayPass.h
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
##  @class   vtkOverlayPass
##  @brief   Render the overlay geometry with property key
##  filtering.
##
##  vtkOverlayPass renders the overlay geometry of all the props that have the
##  keys contained in vtkRenderState.
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
  vtkOverlayPass* {.importcpp: "vtkOverlayPass", header: "vtkOverlayPass.h", bycopy.} = object of vtkDefaultPass ## *
                                                                                                       ##  Default constructor.
                                                                                                       ##
    vtkOverlayPass* {.importc: "vtkOverlayPass".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOverlayPass {.importcpp: "vtkOverlayPass::New(@)",
                              header: "vtkOverlayPass.h".}
type
  vtkOverlayPassSuperclass* = vtkDefaultPass

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOverlayPass::IsTypeOf(@)", header: "vtkOverlayPass.h".}
proc IsA*(this: var vtkOverlayPass; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOverlayPass.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOverlayPass {.
    importcpp: "vtkOverlayPass::SafeDownCast(@)", header: "vtkOverlayPass.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOverlayPass :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDefaultPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOverlayPass :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOverlayPass :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOverlayPass; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOverlayPass.h".}
proc Render*(this: var vtkOverlayPass; s: ptr vtkRenderState) {.importcpp: "Render",
    header: "vtkOverlayPass.h".}