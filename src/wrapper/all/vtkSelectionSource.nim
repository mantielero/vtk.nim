## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSelectionSource.h
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
##  @class   vtkSelectionSource
##  @brief   Generate selection from given set of ids
##
##  vtkSelectionSource generates a vtkSelection from a set of
##  (piece id, cell id) pairs. It will only generate the selection values
##  that match UPDATE_PIECE_NUMBER (i.e. piece == UPDATE_PIECE_NUMBER).
##  vtkSelectionSource can generate a vtkSelection with one or many
##  vtkSelectionNodes.
##
##  To generate only one vtkSelectionNode, use the functions which don't pass a nodeId
##  to set/get the node information. To generate more than one vtkSelectionNode, use the
##  SetNumberOfNodes/RemoveNode to manipulate the number of nodes,
##  and use the functions that pass the nodeId to set the node information
##  The different nodes can have different contentType per node but the
##  fieldType/elementType is common across all nodes.
##
##  To define the relation between the nodes you can use SetExpression. If non-empty,
##  the expression is a boolean expression that defines how the selection nodes present
##  in the selection are to be combined together to form the selection. If no expression
##  is specified and there are multiple selection nodes, then the default
##  expression simply combines all the selection nodes using an `or` operator.
##
##  User-supplied, application-specific selections (with a ContentType of
##  vtkSelectionNode::USER) are not supported.
##

import
  vtkFiltersSourcesModule, vtkSelectionAlgorithm, vtkSelectionNode

type
  vtkSelectionSource* {.importcpp: "vtkSelectionSource",
                       header: "vtkSelectionSource.h", bycopy.} = object of vtkSelectionAlgorithm
    vtkSelectionSource* {.importc: "vtkSelectionSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSelectionSource {.importcpp: "vtkSelectionSource::New(@)",
                                  header: "vtkSelectionSource.h".}
type
  vtkSelectionSourceSuperclass* = vtkSelectionAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSelectionSource::IsTypeOf(@)", header: "vtkSelectionSource.h".}
proc IsA*(this: var vtkSelectionSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSelectionSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSelectionSource {.
    importcpp: "vtkSelectionSource::SafeDownCast(@)",
    header: "vtkSelectionSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSelectionSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSelectionSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSelectionSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSelectionSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSelectionSource.h".}
proc SetNumberOfNodes*(this: var vtkSelectionSource; numberOfNodes: cuint) {.
    importcpp: "SetNumberOfNodes", header: "vtkSelectionSource.h".}
proc GetNumberOfNodes*(this: var vtkSelectionSource): cuint {.
    importcpp: "GetNumberOfNodes", header: "vtkSelectionSource.h".}
proc RemoveNode*(this: var vtkSelectionSource; idx: cuint) {.importcpp: "RemoveNode",
    header: "vtkSelectionSource.h".}
proc RemoveNode*(this: var vtkSelectionSource; name: cstring) {.
    importcpp: "RemoveNode", header: "vtkSelectionSource.h".}
proc RemoveAllNodes*(this: var vtkSelectionSource) {.importcpp: "RemoveAllNodes",
    header: "vtkSelectionSource.h".}
proc SetExpression*(this: var vtkSelectionSource; arg: cstring) {.
    importcpp: "SetExpression", header: "vtkSelectionSource.h".}
proc GetExpression*(this: var vtkSelectionSource): cstring {.
    importcpp: "GetExpression", header: "vtkSelectionSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get FieldTypeOption which is used to specify the selection field type for the selection.
  ##
  ##  If FIELD_TYPE is defined, set FieldType using accepted values as defined in
  ##  vtkSelectionNode::SelectionField.
  ##
  ##  If ELEMENT_TYPE is defined, set ElementType using accepted values as defined in
  ##  `vtkDataObject::AttributeTypes`. Note, `vtkDataObject::FIELD` and
  ##  `vtkDataObject::POINT_THEN_CELL` are not supported. ELEMENT_TYPE will be converted
  ##  to FIELD_TYPE, internally, since vtkSelectionNode only accepts FIELD_TYPE.
  ##
  ##  The default is FIELD_TYPE.
  ##
type
  vtkSelectionSourceFieldTypeOptions* {.size: sizeof(cint), importcpp: "vtkSelectionSource::FieldTypeOptions",
                                       header: "vtkSelectionSource.h".} = enum
    FIELD_TYPE, ELEMENT_TYPE


proc SetFieldTypeOption*(this: var vtkSelectionSource; _arg: cint) {.
    importcpp: "SetFieldTypeOption", header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMinValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetFieldTypeOptionMinValue", header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMaxValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetFieldTypeOptionMaxValue", header: "vtkSelectionSource.h".}
proc SetFieldTypeOptionToFieldType*(this: var vtkSelectionSource) {.
    importcpp: "SetFieldTypeOptionToFieldType", header: "vtkSelectionSource.h".}
proc SetFieldTypeOptionToElementType*(this: var vtkSelectionSource) {.
    importcpp: "SetFieldTypeOptionToElementType", header: "vtkSelectionSource.h".}
## !!!Ignored construct:  virtual int GetFieldTypeOption ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldTypeOption  of  << this -> FieldTypeOption ) ; return this -> FieldTypeOption ; } ;
## Error: expected ';'!!!

proc SetFieldTypeOptionFieldType*(this: var vtkSelectionSource; _arg: cint) {.
    importcpp: "SetFieldTypeOptionFieldType", header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMinValueFieldTypeMinValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetFieldTypeOptionMinValueFieldTypeMinValue",
    header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMaxValueFieldTypeMaxValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetFieldTypeOptionMaxValueFieldTypeMaxValue",
    header: "vtkSelectionSource.h".}
## !!!Ignored construct:  virtual int GetFieldTypeOptionFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldType  of  << this -> FieldType ) ; return this -> FieldType ; } ;
## Error: expected ';'!!!

proc SetFieldTypeOptionFieldTypeElementType*(this: var vtkSelectionSource;
    _arg: cint) {.importcpp: "SetFieldTypeOptionFieldTypeElementType",
                header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMinValueFieldTypeMinValueElementTypeMinValue*(
    this: var vtkSelectionSource): cint {.importcpp: "GetFieldTypeOptionMinValueFieldTypeMinValueElementTypeMinValue",
                                      header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMaxValueFieldTypeMaxValueElementTypeMaxValue*(
    this: var vtkSelectionSource): cint {.importcpp: "GetFieldTypeOptionMaxValueFieldTypeMaxValueElementTypeMaxValue",
                                      header: "vtkSelectionSource.h".}
## !!!Ignored construct:  virtual int GetFieldTypeOptionFieldTypeElementType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ElementType  of  << this -> ElementType ) ; return this -> ElementType ; } ;
## Error: expected ';'!!!

proc SetFieldTypeOptionFieldTypeElementTypeProcessID*(
    this: var vtkSelectionSource; _arg: cint) {.
    importcpp: "SetFieldTypeOptionFieldTypeElementTypeProcessID",
    header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMinValueFieldTypeMinValueElementTypeMinValueProcessIDMinValue*(
    this: var vtkSelectionSource): cint {.importcpp: "GetFieldTypeOptionMinValueFieldTypeMinValueElementTypeMinValueProcessIDMinValue",
                                      header: "vtkSelectionSource.h".}
proc GetFieldTypeOptionMaxValueFieldTypeMaxValueElementTypeMaxValueProcessIDMaxValue*(
    this: var vtkSelectionSource): cint {.importcpp: "GetFieldTypeOptionMaxValueFieldTypeMaxValueElementTypeMaxValueProcessIDMaxValue",
                                      header: "vtkSelectionSource.h".}
## !!!Ignored construct:  virtual int GetFieldTypeOptionFieldTypeElementTypeProcessID ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessID  of  << this -> ProcessID ) ; return this -> ProcessID ; } ;
## Error: expected ';'!!!

proc SetNodeName*(this: var vtkSelectionSource; nodeId: cuint; name: cstring) {.
    importcpp: "SetNodeName", header: "vtkSelectionSource.h".}
proc SetNodeName*(this: var vtkSelectionSource; name: cstring) {.
    importcpp: "SetNodeName", header: "vtkSelectionSource.h".}
proc GetNodeName*(this: var vtkSelectionSource; nodeId: cuint): cstring {.
    importcpp: "GetNodeName", header: "vtkSelectionSource.h".}
proc GetNodeName*(this: var vtkSelectionSource): cstring {.importcpp: "GetNodeName",
    header: "vtkSelectionSource.h".}
proc AddID*(this: var vtkSelectionSource; nodeId: cuint; piece: vtkIdType; id: vtkIdType) {.
    importcpp: "AddID", header: "vtkSelectionSource.h".}
proc AddID*(this: var vtkSelectionSource; piece: vtkIdType; id: vtkIdType) {.
    importcpp: "AddID", header: "vtkSelectionSource.h".}
proc AddStringID*(this: var vtkSelectionSource; nodeId: cuint; piece: vtkIdType;
                 id: cstring) {.importcpp: "AddStringID",
                              header: "vtkSelectionSource.h".}
proc AddStringID*(this: var vtkSelectionSource; piece: vtkIdType; id: cstring) {.
    importcpp: "AddStringID", header: "vtkSelectionSource.h".}
proc AddLocation*(this: var vtkSelectionSource; nodeId: cuint; x: cdouble; y: cdouble;
                 z: cdouble) {.importcpp: "AddLocation",
                             header: "vtkSelectionSource.h".}
proc AddLocation*(this: var vtkSelectionSource; x: cdouble; y: cdouble; z: cdouble) {.
    importcpp: "AddLocation", header: "vtkSelectionSource.h".}
proc AddThreshold*(this: var vtkSelectionSource; nodeId: cuint; min: cdouble;
                  max: cdouble) {.importcpp: "AddThreshold",
                                header: "vtkSelectionSource.h".}
proc AddThreshold*(this: var vtkSelectionSource; min: cdouble; max: cdouble) {.
    importcpp: "AddThreshold", header: "vtkSelectionSource.h".}
proc SetFrustum*(this: var vtkSelectionSource; nodeId: cuint; vertices: ptr cdouble) {.
    importcpp: "SetFrustum", header: "vtkSelectionSource.h".}
proc SetFrustum*(this: var vtkSelectionSource; vertices: ptr cdouble) {.
    importcpp: "SetFrustum", header: "vtkSelectionSource.h".}
proc AddBlock*(this: var vtkSelectionSource; nodeId: cuint; `block`: vtkIdType) {.
    importcpp: "AddBlock", header: "vtkSelectionSource.h".}
proc AddBlock*(this: var vtkSelectionSource; blockno: vtkIdType) {.
    importcpp: "AddBlock", header: "vtkSelectionSource.h".}
proc AddBlockSelector*(this: var vtkSelectionSource; nodeId: cuint; `block`: cstring) {.
    importcpp: "AddBlockSelector", header: "vtkSelectionSource.h".}
proc AddBlockSelector*(this: var vtkSelectionSource; selector: cstring) {.
    importcpp: "AddBlockSelector", header: "vtkSelectionSource.h".}
proc RemoveAllBlockSelectors*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllBlockSelectors", header: "vtkSelectionSource.h".}
proc RemoveAllBlockSelectors*(this: var vtkSelectionSource) {.
    importcpp: "RemoveAllBlockSelectors", header: "vtkSelectionSource.h".}
proc RemoveAllIDs*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllIDs", header: "vtkSelectionSource.h".}
proc RemoveAllIDs*(this: var vtkSelectionSource) {.importcpp: "RemoveAllIDs",
    header: "vtkSelectionSource.h".}
proc RemoveAllStringIDs*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllStringIDs", header: "vtkSelectionSource.h".}
proc RemoveAllStringIDs*(this: var vtkSelectionSource) {.
    importcpp: "RemoveAllStringIDs", header: "vtkSelectionSource.h".}
proc RemoveAllThresholds*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllThresholds", header: "vtkSelectionSource.h".}
proc RemoveAllThresholds*(this: var vtkSelectionSource) {.
    importcpp: "RemoveAllThresholds", header: "vtkSelectionSource.h".}
proc RemoveAllLocations*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllLocations", header: "vtkSelectionSource.h".}
proc RemoveAllLocations*(this: var vtkSelectionSource) {.
    importcpp: "RemoveAllLocations", header: "vtkSelectionSource.h".}
proc RemoveAllBlocks*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllBlocks", header: "vtkSelectionSource.h".}
proc RemoveAllBlocks*(this: var vtkSelectionSource) {.importcpp: "RemoveAllBlocks",
    header: "vtkSelectionSource.h".}
proc SetContentType*(this: var vtkSelectionSource; nodeId: cuint; `type`: cint) {.
    importcpp: "SetContentType", header: "vtkSelectionSource.h".}
proc SetContentType*(this: var vtkSelectionSource; contentType: cint) {.
    importcpp: "SetContentType", header: "vtkSelectionSource.h".}
proc GetContentTypeMinValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetContentTypeMinValue", header: "vtkSelectionSource.h".}
proc GetContentTypeMaxValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetContentTypeMaxValue", header: "vtkSelectionSource.h".}
proc GetContentType*(this: var vtkSelectionSource; nodeId: cuint): cint {.
    importcpp: "GetContentType", header: "vtkSelectionSource.h".}
proc GetContentType*(this: var vtkSelectionSource): cint {.
    importcpp: "GetContentType", header: "vtkSelectionSource.h".}
proc SetContainingCells*(this: var vtkSelectionSource; nodeId: cuint;
                        containingCells: vtkTypeBool) {.
    importcpp: "SetContainingCells", header: "vtkSelectionSource.h".}
proc SetContainingCells*(this: var vtkSelectionSource; containingCells: vtkTypeBool) {.
    importcpp: "SetContainingCells", header: "vtkSelectionSource.h".}
proc GetContainingCells*(this: var vtkSelectionSource; nodeId: cuint): vtkTypeBool {.
    importcpp: "GetContainingCells", header: "vtkSelectionSource.h".}
proc GetContainingCells*(this: var vtkSelectionSource): vtkTypeBool {.
    importcpp: "GetContainingCells", header: "vtkSelectionSource.h".}
proc SetNumberOfLayers*(this: var vtkSelectionSource; nodeId: cuint;
                       numberOfLayers: cint) {.importcpp: "SetNumberOfLayers",
    header: "vtkSelectionSource.h".}
proc SetNumberOfLayers*(this: var vtkSelectionSource; numberOfLayers: cint) {.
    importcpp: "SetNumberOfLayers", header: "vtkSelectionSource.h".}
proc GetNumberOfLayersMinValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetNumberOfLayersMinValue", header: "vtkSelectionSource.h".}
proc GetNumberOfLayersMaxValue*(this: var vtkSelectionSource): cint {.
    importcpp: "GetNumberOfLayersMaxValue", header: "vtkSelectionSource.h".}
proc GetNumberOfLayers*(this: var vtkSelectionSource; nodeId: cuint): cint {.
    importcpp: "GetNumberOfLayers", header: "vtkSelectionSource.h".}
proc GetNumberOfLayers*(this: var vtkSelectionSource): cint {.
    importcpp: "GetNumberOfLayers", header: "vtkSelectionSource.h".}
proc SetInverse*(this: var vtkSelectionSource; nodeId: cuint; inverse: vtkTypeBool) {.
    importcpp: "SetInverse", header: "vtkSelectionSource.h".}
proc SetInverse*(this: var vtkSelectionSource; inverse: vtkTypeBool) {.
    importcpp: "SetInverse", header: "vtkSelectionSource.h".}
proc GetInverse*(this: var vtkSelectionSource; nodeId: cuint): vtkTypeBool {.
    importcpp: "GetInverse", header: "vtkSelectionSource.h".}
proc GetInverse*(this: var vtkSelectionSource): vtkTypeBool {.
    importcpp: "GetInverse", header: "vtkSelectionSource.h".}
proc SetArrayName*(this: var vtkSelectionSource; nodeId: cuint; name: cstring) {.
    importcpp: "SetArrayName", header: "vtkSelectionSource.h".}
proc SetArrayName*(this: var vtkSelectionSource; name: cstring) {.
    importcpp: "SetArrayName", header: "vtkSelectionSource.h".}
proc GetArrayName*(this: var vtkSelectionSource; nodeId: cuint): cstring {.
    importcpp: "GetArrayName", header: "vtkSelectionSource.h".}
proc GetArrayName*(this: var vtkSelectionSource): cstring {.
    importcpp: "GetArrayName", header: "vtkSelectionSource.h".}
proc SetArrayComponent*(this: var vtkSelectionSource; nodeId: cuint; component: cint) {.
    importcpp: "SetArrayComponent", header: "vtkSelectionSource.h".}
proc SetArrayComponent*(this: var vtkSelectionSource; component: cint) {.
    importcpp: "SetArrayComponent", header: "vtkSelectionSource.h".}
proc GetArrayComponent*(this: var vtkSelectionSource; nodeId: cuint): cint {.
    importcpp: "GetArrayComponent", header: "vtkSelectionSource.h".}
proc GetArrayComponent*(this: var vtkSelectionSource): cint {.
    importcpp: "GetArrayComponent", header: "vtkSelectionSource.h".}
proc SetCompositeIndex*(this: var vtkSelectionSource; nodeId: cuint; index: cint) {.
    importcpp: "SetCompositeIndex", header: "vtkSelectionSource.h".}
proc SetCompositeIndex*(this: var vtkSelectionSource; compositeIndex: cint) {.
    importcpp: "SetCompositeIndex", header: "vtkSelectionSource.h".}
proc GetCompositeIndex*(this: var vtkSelectionSource; nodeId: cuint): cint {.
    importcpp: "GetCompositeIndex", header: "vtkSelectionSource.h".}
proc GetCompositeIndex*(this: var vtkSelectionSource): cint {.
    importcpp: "GetCompositeIndex", header: "vtkSelectionSource.h".}
proc SetHierarchicalLevel*(this: var vtkSelectionSource; nodeId: cuint; level: cint) {.
    importcpp: "SetHierarchicalLevel", header: "vtkSelectionSource.h".}
proc SetHierarchicalLevel*(this: var vtkSelectionSource; level: cint) {.
    importcpp: "SetHierarchicalLevel", header: "vtkSelectionSource.h".}
proc GetHierarchicalLevel*(this: var vtkSelectionSource; nodeId: cuint): cint {.
    importcpp: "GetHierarchicalLevel", header: "vtkSelectionSource.h".}
proc GetHierarchicalLevel*(this: var vtkSelectionSource): cint {.
    importcpp: "GetHierarchicalLevel", header: "vtkSelectionSource.h".}
proc SetHierarchicalIndex*(this: var vtkSelectionSource; nodeId: cuint; index: cint) {.
    importcpp: "SetHierarchicalIndex", header: "vtkSelectionSource.h".}
proc SetHierarchicalIndex*(this: var vtkSelectionSource; index: cint) {.
    importcpp: "SetHierarchicalIndex", header: "vtkSelectionSource.h".}
proc GetHierarchicalIndex*(this: var vtkSelectionSource; nodeId: cuint): cint {.
    importcpp: "GetHierarchicalIndex", header: "vtkSelectionSource.h".}
proc GetHierarchicalIndex*(this: var vtkSelectionSource): cint {.
    importcpp: "GetHierarchicalIndex", header: "vtkSelectionSource.h".}
proc SetAssemblyName*(this: var vtkSelectionSource; nodeId: cuint; name: cstring) {.
    importcpp: "SetAssemblyName", header: "vtkSelectionSource.h".}
proc SetAssemblyName*(this: var vtkSelectionSource; name: cstring) {.
    importcpp: "SetAssemblyName", header: "vtkSelectionSource.h".}
proc GetAssemblyName*(this: var vtkSelectionSource; nodeId: cuint): cstring {.
    importcpp: "GetAssemblyName", header: "vtkSelectionSource.h".}
proc GetAssemblyName*(this: var vtkSelectionSource): cstring {.
    importcpp: "GetAssemblyName", header: "vtkSelectionSource.h".}
proc AddSelector*(this: var vtkSelectionSource; nodeId: cuint; selector: cstring) {.
    importcpp: "AddSelector", header: "vtkSelectionSource.h".}
proc AddSelector*(this: var vtkSelectionSource; selector: cstring) {.
    importcpp: "AddSelector", header: "vtkSelectionSource.h".}
proc RemoveAllSelectors*(this: var vtkSelectionSource; nodeId: cuint) {.
    importcpp: "RemoveAllSelectors", header: "vtkSelectionSource.h".}
proc RemoveAllSelectors*(this: var vtkSelectionSource) {.
    importcpp: "RemoveAllSelectors", header: "vtkSelectionSource.h".}
proc SetQueryString*(this: var vtkSelectionSource; nodeId: cuint; queryString: cstring) {.
    importcpp: "SetQueryString", header: "vtkSelectionSource.h".}
proc SetQueryString*(this: var vtkSelectionSource; query: cstring) {.
    importcpp: "SetQueryString", header: "vtkSelectionSource.h".}
proc GetQueryString*(this: var vtkSelectionSource; nodeId: cuint): cstring {.
    importcpp: "GetQueryString", header: "vtkSelectionSource.h".}
proc GetQueryString*(this: var vtkSelectionSource): cstring {.
    importcpp: "GetQueryString", header: "vtkSelectionSource.h".}