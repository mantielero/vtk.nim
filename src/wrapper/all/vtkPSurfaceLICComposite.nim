## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPSurfaceLICComposite.h
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
##  @class   vtkPSurfaceLICComposite
##
##  This class decomposes the image space and shuffles image space
##  data onto the new decomposition with the necessary guard cells
##  to prevent artifacts at the decomposition boundaries. After the
##  image LIC is computed on the new decomposition this class will
##  un-shuffle the computed LIC back onto the original decomposition.
##

import
  vtkOpenGLRenderWindow, vtkPPixelTransfer, vtkPixelExtent,
  vtkRenderingParallelLICModule, vtkSurfaceLICComposite, vtkWeakPointer

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkTextureObject"
discard "forward decl of vtkPainterCommunicator"
discard "forward decl of vtkPPainterCommunicator"
discard "forward decl of vtkPPixelExtentOps"
discard "forward decl of vtkOpenGLHelper"
discard "forward decl of vtkOpenGLFramebufferObject"
type
  vtkPSurfaceLICComposite* {.importcpp: "vtkPSurfaceLICComposite",
                            header: "vtkPSurfaceLICComposite.h", bycopy.} = object of vtkSurfaceLICComposite ## *
                                                                                                      ##  Load, compile, and link the shader.
                                                                                                      ##
    vtkPSurfaceLICComposite* {.importc: "vtkPSurfaceLICComposite".}: VTK_NEWINSTANCE
    ##  mpi state
    ##  rendering context
    ##  Framebuffer object
    ##  ordered steps required to move data to new decomp
    ##  ordered steps required to unmove data from new decomp


proc New*(): ptr vtkPSurfaceLICComposite {.importcpp: "vtkPSurfaceLICComposite::New(@)",
                                       header: "vtkPSurfaceLICComposite.h".}
type
  vtkPSurfaceLICCompositeSuperclass* = vtkSurfaceLICComposite

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPSurfaceLICComposite::IsTypeOf(@)",
    header: "vtkPSurfaceLICComposite.h".}
proc IsA*(this: var vtkPSurfaceLICComposite; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPSurfaceLICComposite.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPSurfaceLICComposite {.
    importcpp: "vtkPSurfaceLICComposite::SafeDownCast(@)",
    header: "vtkPSurfaceLICComposite.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPSurfaceLICComposite :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSurfaceLICComposite :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPSurfaceLICComposite :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPSurfaceLICComposite :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPSurfaceLICComposite; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPSurfaceLICComposite.h".}
proc SetContext*(this: var vtkPSurfaceLICComposite; rwin: ptr vtkOpenGLRenderWindow) {.
    importcpp: "SetContext", header: "vtkPSurfaceLICComposite.h".}
proc GetContext*(this: var vtkPSurfaceLICComposite): ptr vtkOpenGLRenderWindow {.
    importcpp: "GetContext", header: "vtkPSurfaceLICComposite.h".}
proc SetCommunicator*(this: var vtkPSurfaceLICComposite;
                     comm: ptr vtkPainterCommunicator) {.
    importcpp: "SetCommunicator", header: "vtkPSurfaceLICComposite.h".}
proc BuildProgram*(this: var vtkPSurfaceLICComposite; vectors: ptr cfloat): cint {.
    importcpp: "BuildProgram", header: "vtkPSurfaceLICComposite.h".}
proc Gather*(this: var vtkPSurfaceLICComposite; pSendPBO: pointer; dataType: cint;
            nComps: cint; newImage: ptr vtkTextureObject): cint {.importcpp: "Gather",
    header: "vtkPSurfaceLICComposite.h".}
proc Scatter*(this: var vtkPSurfaceLICComposite; pSendPBO: pointer; dataType: cint;
             nComps: cint; newImage: ptr vtkTextureObject): cint {.
    importcpp: "Scatter", header: "vtkPSurfaceLICComposite.h".}
## using statement

proc `<<`*(os: var ostream; ss: var vtkPSurfaceLICComposite): var ostream {.
    importcpp: "(# << #)", header: "vtkPSurfaceLICComposite.h".}