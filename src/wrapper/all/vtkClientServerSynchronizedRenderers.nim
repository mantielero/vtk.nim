## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClientServerSynchronizedRenderers.h
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
##  @class   vtkClientServerSynchronizedRenderers
##
##  vtkClientServerSynchronizedRenderers is a vtkSynchronizedRenderers subclass
##  designed to be used in 2 processes, client-server mode.
##

import
  vtkRenderingParallelModule, vtkSynchronizedRenderers

type
  vtkClientServerSynchronizedRenderers* {.
      importcpp: "vtkClientServerSynchronizedRenderers",
      header: "vtkClientServerSynchronizedRenderers.h", bycopy.} = object of vtkSynchronizedRenderers
    vtkClientServerSynchronizedRenderers*
        {.importc: "vtkClientServerSynchronizedRenderers".}: VTK_NEWINSTANCE


proc New*(): ptr vtkClientServerSynchronizedRenderers {.
    importcpp: "vtkClientServerSynchronizedRenderers::New(@)",
    header: "vtkClientServerSynchronizedRenderers.h".}
type
  vtkClientServerSynchronizedRenderersSuperclass* = vtkSynchronizedRenderers

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkClientServerSynchronizedRenderers::IsTypeOf(@)",
    header: "vtkClientServerSynchronizedRenderers.h".}
proc IsA*(this: var vtkClientServerSynchronizedRenderers; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkClientServerSynchronizedRenderers.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkClientServerSynchronizedRenderers {.
    importcpp: "vtkClientServerSynchronizedRenderers::SafeDownCast(@)",
    header: "vtkClientServerSynchronizedRenderers.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkClientServerSynchronizedRenderers :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSynchronizedRenderers :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClientServerSynchronizedRenderers :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClientServerSynchronizedRenderers :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkClientServerSynchronizedRenderers; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkClientServerSynchronizedRenderers.h".}