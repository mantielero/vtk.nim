## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericVertexAttributeMapping.h
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
##  @class   vtkGenericVertexAttributeMapping
##  @brief   stores mapping for data arrays to
##  generic vertex attributes.
##
##  vtkGenericVertexAttributeMapping stores mapping between data arrays and
##  generic vertex attributes. It is used by vtkPainterPolyDataMapper to pass the
##  mappings to the painter which rendering the attributes.
##  @par Thanks:
##  Support for generic vertex attributes in VTK was contributed in
##  collaboration with Stephane Ploix at EDF.
##

import
  vtkObject, vtkRenderingCoreModule

type
  vtkGenericVertexAttributeMapping* {.importcpp: "vtkGenericVertexAttributeMapping", header: "vtkGenericVertexAttributeMapping.h",
                                     bycopy.} = object of vtkObject
    vtkGenericVertexAttributeMapping* {.importc: "vtkGenericVertexAttributeMapping".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGenericVertexAttributeMapping {.
    importcpp: "vtkGenericVertexAttributeMapping::New(@)",
    header: "vtkGenericVertexAttributeMapping.h".}
type
  vtkGenericVertexAttributeMappingSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericVertexAttributeMapping::IsTypeOf(@)",
    header: "vtkGenericVertexAttributeMapping.h".}
proc IsA*(this: var vtkGenericVertexAttributeMapping; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericVertexAttributeMapping.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericVertexAttributeMapping {.
    importcpp: "vtkGenericVertexAttributeMapping::SafeDownCast(@)",
    header: "vtkGenericVertexAttributeMapping.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericVertexAttributeMapping :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericVertexAttributeMapping :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericVertexAttributeMapping :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericVertexAttributeMapping; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkGenericVertexAttributeMapping.h".}
proc AddMapping*(this: var vtkGenericVertexAttributeMapping; attributeName: cstring;
                arrayName: cstring; fieldAssociation: cint; component: cint) {.
    importcpp: "AddMapping", header: "vtkGenericVertexAttributeMapping.h".}
proc AddMapping*(this: var vtkGenericVertexAttributeMapping; unit: cint;
                arrayName: cstring; fieldAssociation: cint; component: cint) {.
    importcpp: "AddMapping", header: "vtkGenericVertexAttributeMapping.h".}
proc RemoveMapping*(this: var vtkGenericVertexAttributeMapping;
                   attributeName: cstring): bool {.importcpp: "RemoveMapping",
    header: "vtkGenericVertexAttributeMapping.h".}
proc RemoveAllMappings*(this: var vtkGenericVertexAttributeMapping) {.
    importcpp: "RemoveAllMappings", header: "vtkGenericVertexAttributeMapping.h".}
proc GetNumberOfMappings*(this: var vtkGenericVertexAttributeMapping): cuint {.
    importcpp: "GetNumberOfMappings", header: "vtkGenericVertexAttributeMapping.h".}
proc GetAttributeName*(this: var vtkGenericVertexAttributeMapping; index: cuint): cstring {.
    importcpp: "GetAttributeName", header: "vtkGenericVertexAttributeMapping.h".}
proc GetArrayName*(this: var vtkGenericVertexAttributeMapping; index: cuint): cstring {.
    importcpp: "GetArrayName", header: "vtkGenericVertexAttributeMapping.h".}
proc GetFieldAssociation*(this: var vtkGenericVertexAttributeMapping; index: cuint): cint {.
    importcpp: "GetFieldAssociation", header: "vtkGenericVertexAttributeMapping.h".}
proc GetComponent*(this: var vtkGenericVertexAttributeMapping; index: cuint): cint {.
    importcpp: "GetComponent", header: "vtkGenericVertexAttributeMapping.h".}
proc GetTextureUnit*(this: var vtkGenericVertexAttributeMapping; index: cuint): cint {.
    importcpp: "GetTextureUnit", header: "vtkGenericVertexAttributeMapping.h".}