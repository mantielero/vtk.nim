## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkViewNodeFactory.h
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
##  @class   vtkViewNodeFactory
##  @brief   factory that chooses vtkViewNodes to create
##
##  Class tells VTK which specific vtkViewNode subclass to make when it is
##  asked to make a vtkViewNode for a particular renderable. modules for
##  different rendering backends are expected to use this to customize the
##  set of instances for their own purposes
##

import
  vtkObject, vtkRenderingSceneGraphModule

discard "forward decl of vtkViewNode"
type
  vtkViewNodeFactory* {.importcpp: "vtkViewNodeFactory",
                       header: "vtkViewNodeFactory.h", bycopy.} = object of vtkObject
    vtkViewNodeFactory* {.importc: "vtkViewNodeFactory".}: VTK_NEWINSTANCE


proc New*(): ptr vtkViewNodeFactory {.importcpp: "vtkViewNodeFactory::New(@)",
                                  header: "vtkViewNodeFactory.h".}
type
  vtkViewNodeFactorySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkViewNodeFactory::IsTypeOf(@)", header: "vtkViewNodeFactory.h".}
proc IsA*(this: var vtkViewNodeFactory; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkViewNodeFactory.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkViewNodeFactory {.
    importcpp: "vtkViewNodeFactory::SafeDownCast(@)",
    header: "vtkViewNodeFactory.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkViewNodeFactory :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkViewNodeFactory :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkViewNodeFactory :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkViewNodeFactory; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkViewNodeFactory.h".}
proc RegisterOverride*(this: var vtkViewNodeFactory; name: cstring;
                      `func`: proc (): ptr vtkViewNode) {.
    importcpp: "RegisterOverride", header: "vtkViewNodeFactory.h".}
proc CreateNode*(this: var vtkViewNodeFactory; a2: ptr vtkObject): ptr vtkViewNode {.
    importcpp: "CreateNode", header: "vtkViewNodeFactory.h".}