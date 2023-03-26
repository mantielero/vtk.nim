## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSILBuilder.h
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
##  @class   vtkSILBuilder
##  @brief   helper class to build a SIL i.e. a directed graph used
##  by reader producing composite datasets to describes the relationships among
##  the blocks.
##
##  vtkSILBuilder is a helper class to build a SIL i.e. a directed graph used
##  by reader producing composite datasets to describes the relationships among
##  the blocks.
##  Refer to http://www.paraview.org/Wiki/Block_Hierarchy_Meta_Data for details.
##

import
  vtkIOXdmf2Module, vtkObject

discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkMutableDirectedGraph"
type
  vtkSILBuilder* {.importcpp: "vtkSILBuilder", header: "vtkSILBuilder.h", bycopy.} = object of vtkObject
    vtkSILBuilder* {.importc: "vtkSILBuilder".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSILBuilder {.importcpp: "vtkSILBuilder::New(@)",
                             header: "vtkSILBuilder.h".}
type
  vtkSILBuilderSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSILBuilder::IsTypeOf(@)", header: "vtkSILBuilder.h".}
proc IsA*(this: var vtkSILBuilder; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSILBuilder.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSILBuilder {.
    importcpp: "vtkSILBuilder::SafeDownCast(@)", header: "vtkSILBuilder.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSILBuilder :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSILBuilder :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSILBuilder :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSILBuilder; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSILBuilder.h".}
proc SetSIL*(this: var vtkSILBuilder; a2: ptr vtkMutableDirectedGraph) {.
    importcpp: "SetSIL", header: "vtkSILBuilder.h".}
proc GetnameSIL*(this: var vtkSILBuilder): ptr vtkMutableDirectedGraph {.
    importcpp: "GetnameSIL", header: "vtkSILBuilder.h".}
  ## /@}
  ## *
  ##  Initializes the data-structures.
  ##
proc Initialize*(this: var vtkSILBuilder) {.importcpp: "Initialize",
                                        header: "vtkSILBuilder.h".}
proc AddVertex*(this: var vtkSILBuilder; name: cstring): vtkIdType {.
    importcpp: "AddVertex", header: "vtkSILBuilder.h".}
proc AddChildEdge*(this: var vtkSILBuilder; parent: vtkIdType; child: vtkIdType): vtkIdType {.
    importcpp: "AddChildEdge", header: "vtkSILBuilder.h".}
proc AddCrossEdge*(this: var vtkSILBuilder; src: vtkIdType; dst: vtkIdType): vtkIdType {.
    importcpp: "AddCrossEdge", header: "vtkSILBuilder.h".}
## !!!Ignored construct:  /@} /@{ *
##  Returns the vertex id for the root vertex.
##  virtual vtkIdType GetRootVertexRootVertex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RootVertex  of  << this -> RootVertex ) ; return this -> RootVertex ; } ;
## Error: expected ';'!!!
