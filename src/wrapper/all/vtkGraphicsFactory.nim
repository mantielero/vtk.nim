## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphicsFactory.h
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
##  @class   vtkGraphicsFactory
##
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkGraphicsFactory* {.importcpp: "vtkGraphicsFactory",
                       header: "vtkGraphicsFactory.h", bycopy.} = object of vtkObject
    vtkGraphicsFactory* {.importc: "vtkGraphicsFactory".}: VTK_NEWINSTANCE
    `static`* {.importc: "static".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGraphicsFactory {.importcpp: "vtkGraphicsFactory::New(@)",
                                  header: "vtkGraphicsFactory.h".}
type
  vtkGraphicsFactorySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphicsFactory::IsTypeOf(@)", header: "vtkGraphicsFactory.h".}
proc IsA*(this: var vtkGraphicsFactory; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGraphicsFactory.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphicsFactory {.
    importcpp: "vtkGraphicsFactory::SafeDownCast(@)",
    header: "vtkGraphicsFactory.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphicsFactory :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphicsFactory :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphicsFactory :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphicsFactory; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphicsFactory.h".}
proc CreateInstance*(this: var vtkGraphicsFactory; vtkclassname: cstring): ptr vtkObject {.
    importcpp: "CreateInstance", header: "vtkGraphicsFactory.h".}
proc GetRenderLibrary*(): cstring {.importcpp: "vtkGraphicsFactory::GetRenderLibrary(@)",
                                 header: "vtkGraphicsFactory.h".}
proc SetUseMesaClasses*(use: cint) {.importcpp: "vtkGraphicsFactory::SetUseMesaClasses(@)",
                                  header: "vtkGraphicsFactory.h".}
proc GetUseMesaClasses*(): cint {.importcpp: "vtkGraphicsFactory::GetUseMesaClasses(@)",
                               header: "vtkGraphicsFactory.h".}
proc SetOffScreenOnlyMode*(use: cint) {.importcpp: "vtkGraphicsFactory::SetOffScreenOnlyMode(@)",
                                     header: "vtkGraphicsFactory.h".}
proc GetOffScreenOnlyMode*(): cint {.importcpp: "vtkGraphicsFactory::GetOffScreenOnlyMode(@)",
                                  header: "vtkGraphicsFactory.h".}