## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObject.h
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
##  @class   vtkDataObject
##  @brief   general representation of visualization data
##
##  vtkDataObject is an general representation of visualization data. It serves
##  to encapsulate instance variables and methods for visualization network
##  execution, as well as representing data consisting of a field (i.e., just
##  an unstructured pile of data). This is to be compared with a vtkDataSet,
##  which is data with geometric and/or topological structure.
##
##  vtkDataObjects are used to represent arbitrary repositories of data via the
##  vtkFieldData instance variable. These data must be eventually mapped into a
##  concrete subclass of vtkDataSet before they can actually be displayed.
##
##  @sa
##  vtkDataSet vtkFieldData vtkDataObjectToDataSetFilter
##  vtkFieldDataToAttributeDataFilter
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationDataObjectKey"
discard "forward decl of vtkInformationDoubleKey"
discard "forward decl of vtkInformationDoubleVectorKey"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationIntegerPointerKey"
discard "forward decl of vtkInformationIntegerVectorKey"
discard "forward decl of vtkInformationStringKey"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkInformationInformationVectorKey"
discard "forward decl of vtkUnsignedCharArray"
const
  VTK_PIECES_EXTENT* = 0
  VTK_3D_EXTENT* = 1
  VTK_TIME_EXTENT* = 2

type
  vtkDataObject* {.importcpp: "vtkDataObject", header: "vtkDataObject.h", bycopy.} = object of vtkObject ##  Helper method for the ShallowCopy and DeepCopy methods.
    vtkDataObject* {.importc: "vtkDataObject".}: VTK_NEWINSTANCE
    ##  Keep track of data release during network execution
    ##  When was this data last generated?
    ##  Arbitrary extra information associated with this data object.


proc New*(): ptr vtkDataObject {.importcpp: "vtkDataObject::New(@)",
                             header: "vtkDataObject.h".}
type
  vtkDataObjectSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataObject::IsTypeOf(@)", header: "vtkDataObject.h".}
proc IsA*(this: var vtkDataObject; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDataObject.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataObject {.
    importcpp: "vtkDataObject::SafeDownCast(@)", header: "vtkDataObject.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataObject :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataObject :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataObject; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataObject.h".}
proc GetnameInformation*(this: var vtkDataObject): ptr vtkInformation {.
    importcpp: "GetnameInformation", header: "vtkDataObject.h".}
proc SetInformation*(this: var vtkDataObject; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkDataObject.h".}
proc GetMTime*(this: var vtkDataObject): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkDataObject.h".}
proc Initialize*(this: var vtkDataObject) {.importcpp: "Initialize",
                                        header: "vtkDataObject.h".}
proc ReleaseData*(this: var vtkDataObject) {.importcpp: "ReleaseData",
    header: "vtkDataObject.h".}
## !!!Ignored construct:  /@{ *
##  Get the flag indicating the data has been released.
##  virtual int GetDataReleasedDataReleased ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataReleased  of  << this -> DataReleased ) ; return this -> DataReleased ; } ;
## Error: expected ';'!!!

proc SetGlobalReleaseDataFlag*(val: cint) {.
    importcpp: "vtkDataObject::SetGlobalReleaseDataFlag(@)",
    header: "vtkDataObject.h".}
proc GlobalReleaseDataFlagOn*(this: var vtkDataObject) {.
    importcpp: "GlobalReleaseDataFlagOn", header: "vtkDataObject.h".}
proc GlobalReleaseDataFlagOff*(this: var vtkDataObject) {.
    importcpp: "GlobalReleaseDataFlagOff", header: "vtkDataObject.h".}
proc GetGlobalReleaseDataFlag*(): cint {.importcpp: "vtkDataObject::GetGlobalReleaseDataFlag(@)",
                                      header: "vtkDataObject.h".}
proc SetFieldData*(this: var vtkDataObject; a2: ptr vtkFieldData) {.
    importcpp: "SetFieldData", header: "vtkDataObject.h".}
proc GetnameInformationFieldData*(this: var vtkDataObject): ptr vtkFieldData {.
    importcpp: "GetnameInformationFieldData", header: "vtkDataObject.h".}
  ## /@}
  ## *
  ##  Return class name of data type. This is one of VTK_STRUCTURED_GRID,
  ##  VTK_STRUCTURED_POINTS, VTK_UNSTRUCTURED_GRID, VTK_POLY_DATA, or
  ##  VTK_RECTILINEAR_GRID (see vtkSetGet.h for definitions).
  ##  THIS METHOD IS THREAD SAFE
  ##
proc GetDataObjectType*(this: var vtkDataObject): cint {.
    importcpp: "GetDataObjectType", header: "vtkDataObject.h".}
proc GetUpdateTime*(this: var vtkDataObject): vtkMTimeType {.
    importcpp: "GetUpdateTime", header: "vtkDataObject.h".}
proc GetActualMemorySize*(this: var vtkDataObject): culong {.
    importcpp: "GetActualMemorySize", header: "vtkDataObject.h".}
proc CopyInformationFromPipeline*(this: var vtkDataObject; vtkNotUsed: proc (a1: info): ptr vtkInformation) {.
    importcpp: "CopyInformationFromPipeline", header: "vtkDataObject.h".}
proc CopyInformationToPipeline*(this: var vtkDataObject;
                               vtkNotUsed: proc (a1: info): ptr vtkInformation) {.
    importcpp: "CopyInformationToPipeline", header: "vtkDataObject.h".}
proc GetActiveFieldInformation*(info: ptr vtkInformation; fieldAssociation: cint;
                               attributeType: cint): ptr vtkInformation {.
    importcpp: "vtkDataObject::GetActiveFieldInformation(@)",
    header: "vtkDataObject.h".}
proc GetNamedFieldInformation*(info: ptr vtkInformation; fieldAssociation: cint;
                              name: cstring): ptr vtkInformation {.
    importcpp: "vtkDataObject::GetNamedFieldInformation(@)",
    header: "vtkDataObject.h".}
proc RemoveNamedFieldInformation*(info: ptr vtkInformation; fieldAssociation: cint;
                                 name: cstring) {.
    importcpp: "vtkDataObject::RemoveNamedFieldInformation(@)",
    header: "vtkDataObject.h".}
proc SetActiveAttribute*(info: ptr vtkInformation; fieldAssociation: cint;
                        attributeName: cstring; attributeType: cint): ptr vtkInformation {.
    importcpp: "vtkDataObject::SetActiveAttribute(@)", header: "vtkDataObject.h".}
proc SetActiveAttributeInfo*(info: ptr vtkInformation; fieldAssociation: cint;
                            attributeType: cint; name: cstring; arrayType: cint;
                            numComponents: cint; numTuples: cint) {.
    importcpp: "vtkDataObject::SetActiveAttributeInfo(@)",
    header: "vtkDataObject.h".}
proc SetPointDataActiveScalarInfo*(info: ptr vtkInformation; arrayType: cint;
                                  numComponents: cint) {.
    importcpp: "vtkDataObject::SetPointDataActiveScalarInfo(@)",
    header: "vtkDataObject.h".}
proc DataHasBeenGenerated*(this: var vtkDataObject) {.
    importcpp: "DataHasBeenGenerated", header: "vtkDataObject.h".}
proc PrepareForNewData*(this: var vtkDataObject) {.importcpp: "PrepareForNewData",
    header: "vtkDataObject.h".}
proc ShallowCopy*(this: var vtkDataObject; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkDataObject.h".}
proc DeepCopy*(this: var vtkDataObject; src: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkDataObject.h".}
proc GetExtentType*(this: var vtkDataObject): cint {.importcpp: "GetExtentType",
    header: "vtkDataObject.h".}
proc Crop*(this: var vtkDataObject; updateExtent: ptr cint) {.importcpp: "Crop",
    header: "vtkDataObject.h".}
type
  vtkDataObjectFieldAssociations* {.size: sizeof(cint), importcpp: "vtkDataObject::FieldAssociations",
                                   header: "vtkDataObject.h".} = enum
    FIELD_ASSOCIATION_POINTS, FIELD_ASSOCIATION_CELLS, FIELD_ASSOCIATION_NONE,
    FIELD_ASSOCIATION_POINTS_THEN_CELLS, FIELD_ASSOCIATION_VERTICES,
    FIELD_ASSOCIATION_EDGES, FIELD_ASSOCIATION_ROWS, NUMBER_OF_ASSOCIATIONS


type
  vtkDataObjectAttributeTypes* {.size: sizeof(cint),
                                importcpp: "vtkDataObject::AttributeTypes",
                                header: "vtkDataObject.h".} = enum
    POINT, CELL, FIELD, POINT_THEN_CELL, VERTEX, EDGE, ROW, NUMBER_OF_ATTRIBUTE_TYPES


proc GetAttributes*(this: var vtkDataObject; `type`: cint): ptr vtkDataSetAttributes {.
    importcpp: "GetAttributes", header: "vtkDataObject.h".}
proc GetGhostArray*(this: var vtkDataObject; `type`: cint): ptr vtkUnsignedCharArray {.
    importcpp: "GetGhostArray", header: "vtkDataObject.h".}
proc GetAttributesAsFieldData*(this: var vtkDataObject; `type`: cint): ptr vtkFieldData {.
    importcpp: "GetAttributesAsFieldData", header: "vtkDataObject.h".}
proc GetAttributeTypeForArray*(this: var vtkDataObject; arr: ptr vtkAbstractArray): cint {.
    importcpp: "GetAttributeTypeForArray", header: "vtkDataObject.h".}
proc GetNumberOfElements*(this: var vtkDataObject; `type`: cint): vtkIdType {.
    importcpp: "GetNumberOfElements", header: "vtkDataObject.h".}
type
  vtkDataObjectFieldOperations* {.size: sizeof(cint),
                                 importcpp: "vtkDataObject::FieldOperations",
                                 header: "vtkDataObject.h".} = enum
    FIELD_OPERATION_PRESERVED, FIELD_OPERATION_REINTERPOLATED,
    FIELD_OPERATION_MODIFIED, FIELD_OPERATION_REMOVED


proc GetAssociationTypeAsString*(associationType: cint): cstring {.
    importcpp: "vtkDataObject::GetAssociationTypeAsString(@)",
    header: "vtkDataObject.h".}
proc GetAssociationTypeFromString*(associationName: cstring): cint {.
    importcpp: "vtkDataObject::GetAssociationTypeFromString(@)",
    header: "vtkDataObject.h".}
proc DATA_TYPE_NAME*(): ptr vtkInformationStringKey {.
    importcpp: "vtkDataObject::DATA_TYPE_NAME(@)", header: "vtkDataObject.h".}
proc DATA_OBJECT*(): ptr vtkInformationDataObjectKey {.
    importcpp: "vtkDataObject::DATA_OBJECT(@)", header: "vtkDataObject.h".}
proc DATA_EXTENT_TYPE*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::DATA_EXTENT_TYPE(@)", header: "vtkDataObject.h".}
proc DATA_EXTENT*(): ptr vtkInformationIntegerPointerKey {.
    importcpp: "vtkDataObject::DATA_EXTENT(@)", header: "vtkDataObject.h".}
proc ALL_PIECES_EXTENT*(): ptr vtkInformationIntegerVectorKey {.
    importcpp: "vtkDataObject::ALL_PIECES_EXTENT(@)", header: "vtkDataObject.h".}
proc DATA_PIECE_NUMBER*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::DATA_PIECE_NUMBER(@)", header: "vtkDataObject.h".}
proc DATA_NUMBER_OF_PIECES*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::DATA_NUMBER_OF_PIECES(@)",
    header: "vtkDataObject.h".}
proc DATA_NUMBER_OF_GHOST_LEVELS*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::DATA_NUMBER_OF_GHOST_LEVELS(@)",
    header: "vtkDataObject.h".}
proc DATA_TIME_STEP*(): ptr vtkInformationDoubleKey {.
    importcpp: "vtkDataObject::DATA_TIME_STEP(@)", header: "vtkDataObject.h".}
proc POINT_DATA_VECTOR*(): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkDataObject::POINT_DATA_VECTOR(@)", header: "vtkDataObject.h".}
proc CELL_DATA_VECTOR*(): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkDataObject::CELL_DATA_VECTOR(@)", header: "vtkDataObject.h".}
proc VERTEX_DATA_VECTOR*(): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkDataObject::VERTEX_DATA_VECTOR(@)", header: "vtkDataObject.h".}
proc EDGE_DATA_VECTOR*(): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkDataObject::EDGE_DATA_VECTOR(@)", header: "vtkDataObject.h".}
proc FIELD_ARRAY_TYPE*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_ARRAY_TYPE(@)", header: "vtkDataObject.h".}
proc FIELD_ASSOCIATION*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_ASSOCIATION(@)", header: "vtkDataObject.h".}
proc FIELD_ATTRIBUTE_TYPE*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_ATTRIBUTE_TYPE(@)", header: "vtkDataObject.h".}
proc FIELD_ACTIVE_ATTRIBUTE*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_ACTIVE_ATTRIBUTE(@)",
    header: "vtkDataObject.h".}
proc FIELD_NUMBER_OF_COMPONENTS*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_NUMBER_OF_COMPONENTS(@)",
    header: "vtkDataObject.h".}
proc FIELD_NUMBER_OF_TUPLES*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_NUMBER_OF_TUPLES(@)",
    header: "vtkDataObject.h".}
proc FIELD_OPERATION*(): ptr vtkInformationIntegerKey {.
    importcpp: "vtkDataObject::FIELD_OPERATION(@)", header: "vtkDataObject.h".}
proc FIELD_RANGE*(): ptr vtkInformationDoubleVectorKey {.
    importcpp: "vtkDataObject::FIELD_RANGE(@)", header: "vtkDataObject.h".}
proc PIECE_EXTENT*(): ptr vtkInformationIntegerVectorKey {.
    importcpp: "vtkDataObject::PIECE_EXTENT(@)", header: "vtkDataObject.h".}
proc FIELD_NAME*(): ptr vtkInformationStringKey {.
    importcpp: "vtkDataObject::FIELD_NAME(@)", header: "vtkDataObject.h".}
proc ORIGIN*(): ptr vtkInformationDoubleVectorKey {.
    importcpp: "vtkDataObject::ORIGIN(@)", header: "vtkDataObject.h".}
proc SPACING*(): ptr vtkInformationDoubleVectorKey {.
    importcpp: "vtkDataObject::SPACING(@)", header: "vtkDataObject.h".}
proc DIRECTION*(): ptr vtkInformationDoubleVectorKey {.
    importcpp: "vtkDataObject::DIRECTION(@)", header: "vtkDataObject.h".}
proc BOUNDING_BOX*(): ptr vtkInformationDoubleVectorKey {.
    importcpp: "vtkDataObject::BOUNDING_BOX(@)", header: "vtkDataObject.h".}
proc SIL*(): ptr vtkInformationDataObjectKey {.importcpp: "vtkDataObject::SIL(@)",
    header: "vtkDataObject.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkDataObject {.
    importcpp: "vtkDataObject::GetData(@)", header: "vtkDataObject.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkDataObject {.
    importcpp: "vtkDataObject::GetData(@)", header: "vtkDataObject.h".}