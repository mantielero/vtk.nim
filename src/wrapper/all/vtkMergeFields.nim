## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeFields.h
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
##  @class   vtkMergeFields
##  @brief   Merge multiple fields into one.
##
##  vtkMergeFields is used to merge multiple field into one.
##  The new field is put in the same field data as the original field.
##  For example
##  @verbatim
##  mf->SetOutputField("foo", vtkMergeFields::POINT_DATA);
##  mf->SetNumberOfComponents(2);
##  mf->Merge(0, "array1", 1);
##  mf->Merge(1, "array2", 0);
##  @endverbatim
##  will tell vtkMergeFields to use the 2nd component of array1 and
##  the 1st component of array2 to create a 2 component field called foo.
##
##  @sa
##  vtkFieldData vtkDataSet vtkDataObjectToDataSetFilter
##  vtkDataSetAttributes vtkDataArray vtkRearrangeFields
##  vtkSplitField vtkAssignAttribute
##

import
  vtkDataSetAlgorithm, vtkFiltersCoreModule

discard "forward decl of vtkDataArray"
discard "forward decl of vtkFieldData"
type
  vtkMergeFields* {.importcpp: "vtkMergeFields", header: "vtkMergeFields.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkMergeFields* {.importc: "vtkMergeFields".}: VTK_NEWINSTANCE
    ##  Methods to browse/modify the linked list.

  vtkMergeFieldsSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeFields::IsTypeOf(@)", header: "vtkMergeFields.h".}
proc IsA*(this: var vtkMergeFields; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMergeFields.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeFields {.
    importcpp: "vtkMergeFields::SafeDownCast(@)", header: "vtkMergeFields.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeFields :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeFields :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeFields :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeFields; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeFields.h".}
proc New*(): ptr vtkMergeFields {.importcpp: "vtkMergeFields::New(@)",
                              header: "vtkMergeFields.h".}
proc SetOutputField*(this: var vtkMergeFields; name: cstring; fieldLoc: cint) {.
    importcpp: "SetOutputField", header: "vtkMergeFields.h".}
proc SetOutputField*(this: var vtkMergeFields; name: cstring; fieldLoc: cstring) {.
    importcpp: "SetOutputField", header: "vtkMergeFields.h".}
proc Merge*(this: var vtkMergeFields; component: cint; arrayName: cstring;
           sourceComp: cint) {.importcpp: "Merge", header: "vtkMergeFields.h".}
proc SetNumberOfComponents*(this: var vtkMergeFields; _arg: cint) {.
    importcpp: "SetNumberOfComponents", header: "vtkMergeFields.h".}
## !!!Ignored construct:  virtual int GetNumberOfComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponents  of  << this -> NumberOfComponents ) ; return this -> NumberOfComponents ; } ;
## Error: expected ';'!!!

type
  vtkMergeFieldsFieldLocations* {.size: sizeof(cint),
                                 importcpp: "vtkMergeFields::FieldLocations",
                                 header: "vtkMergeFields.h".} = enum
    DATA_OBJECT = 0, POINT_DATA = 1, CELL_DATA = 2


type
  vtkMergeFieldsComponent* {.importcpp: "vtkMergeFields::Component",
                            header: "vtkMergeFields.h", bycopy.} = object
    Index* {.importc: "Index".}: cint
    SourceIndex* {.importc: "SourceIndex".}: cint
    FieldName* {.importc: "FieldName".}: cstring
    Next* {.importc: "Next".}: ptr vtkMergeFieldsComponent ##  linked list


proc SetName*(this: var vtkMergeFieldsComponent; name: cstring) {.
    importcpp: "SetName", header: "vtkMergeFields.h".}
proc constructvtkMergeFieldsComponent*(): vtkMergeFieldsComponent {.constructor,
    importcpp: "vtkMergeFields::Component(@)", header: "vtkMergeFields.h".}
proc destroyvtkMergeFieldsComponent*(this: var vtkMergeFieldsComponent) {.
    importcpp: "#.~Component()", header: "vtkMergeFields.h".}