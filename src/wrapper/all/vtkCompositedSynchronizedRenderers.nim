## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositedSynchronizedRenderers.h
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
##  @class   vtkCompositedSynchronizedRenderers
##  @brief   vtkCompositedSynchronizedRenderers is vtkSynchronizedRenderers that uses
##  vtkCompositer to composite the images on the root node.
##

import
  vtkRenderingParallelModule, vtkSynchronizedRenderers

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkCompositer"
type
  vtkCompositedSynchronizedRenderers* {.importcpp: "vtkCompositedSynchronizedRenderers", header: "vtkCompositedSynchronizedRenderers.h",
                                       bycopy.} = object of vtkSynchronizedRenderers
    vtkCompositedSynchronizedRenderers* {.
        importc: "vtkCompositedSynchronizedRenderers".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositedSynchronizedRenderers {.
    importcpp: "vtkCompositedSynchronizedRenderers::New(@)",
    header: "vtkCompositedSynchronizedRenderers.h".}
type
  vtkCompositedSynchronizedRenderersSuperclass* = vtkSynchronizedRenderers

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositedSynchronizedRenderers::IsTypeOf(@)",
    header: "vtkCompositedSynchronizedRenderers.h".}
proc IsA*(this: var vtkCompositedSynchronizedRenderers; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositedSynchronizedRenderers.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositedSynchronizedRenderers {.
    importcpp: "vtkCompositedSynchronizedRenderers::SafeDownCast(@)",
    header: "vtkCompositedSynchronizedRenderers.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositedSynchronizedRenderers :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSynchronizedRenderers :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositedSynchronizedRenderers :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositedSynchronizedRenderers :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositedSynchronizedRenderers; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkCompositedSynchronizedRenderers.h".}
proc SetCompositer*(this: var vtkCompositedSynchronizedRenderers;
                   a2: ptr vtkCompositer) {.importcpp: "SetCompositer",
    header: "vtkCompositedSynchronizedRenderers.h".}
proc GetnameCompositer*(this: var vtkCompositedSynchronizedRenderers): ptr vtkCompositer {.
    importcpp: "GetnameCompositer", header: "vtkCompositedSynchronizedRenderers.h".}
  ## /@}