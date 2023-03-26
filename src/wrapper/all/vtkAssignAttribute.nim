## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAssignAttribute.h
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
##  @class   vtkAssignAttribute
##  @brief   Labels/marks a field as an attribute
##
##  vtkAssignAttribute is used to label/mark a field (vtkDataArray) as an attribute.
##  A field name or an attribute to labeled can be specified. For example:
##  @verbatim
##  aa->Assign("foo", vtkDataSetAttributes::SCALARS,
##             vtkAssignAttribute::POINT_DATA);
##  @endverbatim
##  tells vtkAssignAttribute to make the array in the point data called
##  "foo" the active scalars. On the other hand,
##  @verbatim
##  aa->Assign(vtkDataSetAttributes::VECTORS, vtkDataSetAttributes::SCALARS,
##             vtkAssignAttribute::POINT_DATA);
##  @endverbatim
##  tells vtkAssignAttribute to make the active vectors also the active
##  scalars.
##
##  @warning
##  When using Java, Python or Visual Basic bindings, the array name
##  can not be one of the  AttributeTypes when calling Assign() which takes
##  strings as arguments. The wrapped command will
##  always assume the string corresponds to an attribute type when
##  the argument is one of the AttributeTypes. In this situation,
##  use the Assign() which takes enums.
##
##  @sa
##  vtkFieldData vtkDataSet vtkDataObjectToDataSetFilter
##  vtkDataSetAttributes vtkDataArray vtkRearrangeFields
##  vtkSplitField vtkMergeFields
##

import
  vtkFiltersCoreModule, vtkPassInputTypeAlgorithm, vtkDataSetAttributes

discard "forward decl of vtkFieldData"
type
  vtkAssignAttribute* {.importcpp: "vtkAssignAttribute",
                       header: "vtkAssignAttribute.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkAssignAttribute* {.importc: "vtkAssignAttribute".}: VTK_NEWINSTANCE

  vtkAssignAttributeSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAssignAttribute::IsTypeOf(@)", header: "vtkAssignAttribute.h".}
proc IsA*(this: var vtkAssignAttribute; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAssignAttribute.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAssignAttribute {.
    importcpp: "vtkAssignAttribute::SafeDownCast(@)",
    header: "vtkAssignAttribute.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAssignAttribute :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAssignAttribute :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAssignAttribute :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAssignAttribute; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAssignAttribute.h".}
proc New*(): ptr vtkAssignAttribute {.importcpp: "vtkAssignAttribute::New(@)",
                                  header: "vtkAssignAttribute.h".}
proc Assign*(this: var vtkAssignAttribute; inputAttributeType: cint;
            attributeType: cint; attributeLoc: cint) {.importcpp: "Assign",
    header: "vtkAssignAttribute.h".}
proc Assign*(this: var vtkAssignAttribute; fieldName: cstring; attributeType: cint;
            attributeLoc: cint) {.importcpp: "Assign",
                                header: "vtkAssignAttribute.h".}
proc Assign*(this: var vtkAssignAttribute; name: cstring; attributeType: cstring;
            attributeLoc: cstring) {.importcpp: "Assign",
                                   header: "vtkAssignAttribute.h".}
type
  vtkAssignAttributeAttributeLocation* {.size: sizeof(cint), importcpp: "vtkAssignAttribute::AttributeLocation",
                                        header: "vtkAssignAttribute.h".} = enum
    POINT_DATA = 0, CELL_DATA = 1, VERTEX_DATA = 2, EDGE_DATA = 3, NUM_ATTRIBUTE_LOCS

