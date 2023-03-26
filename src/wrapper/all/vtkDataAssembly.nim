## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataAssembly.h
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
##  @class vtkDataAssembly
##  @brief hierarchical representation to use with
##  vtkPartitionedDataSetCollection
##
##  vtkDataAssembly is a mechanism to represent hierarchical organization of
##  items (or vtkPartitionedDataSet instances) in a vtkPartitionedDataSetCollection.
##  vtkPartitionedDataSetCollection is similar to a vtkMultiBlockDataSet since it
##  provides a means for putting together multiple non-composite datasets.
##  However, vtkPartitionedDataSetCollection itself doesn't provide any mechanism
##  to define relationships between items in the collections. That is done using
##  vtkDataAssembly.
##
##  @section Overview Overview
##
##  At its core, vtkDataAssembly is simply a tree of nodes starting
##  with the root node. Each node has a unique id and a string name (names need not
##  be unique). On initialization with `vtkDataAssembly::Initialize`, an empty tree
##  with a root node is created. The root node's id and name can be obtained
##  using `vtkDataAssembly::GetRootNode` and `vtkDataAssembly::GetRootNodeName`.
##  The root node's id is fixed (vtkDataAssembly::GetRootNode), however the name
##  can be changed using `vtkDataAssembly::SetRootNodeName`.
##
##  Child nodes can be added using `vtkDataAssembly::AddNode` or
##  `vtkDataAssembly::AddNodes`, each of which returns the ids for every child
##  node added. A non-root node can be removed using `vtkDataAssembly::RemoveNode`.
##
##  Each node in the tree (including the root node) can have associated dataset
##  indices. For a vtkDataAssembly associated with a
##  vtkPartitionedDataSetCollection, these indices refer to the item index, or
##  partitioned-dataset-index for items in the collection. Dataset indices can be
##  specified using `vtkDataAssembly::AddDataSetIndex`,
##  `vtkDataAssembly::AddDataSetIndices` and removed using `vtkDataAssembly::RemoveDataSetIndex`,
##  `vtkDataAssembly::RemoveAllDataSetIndices`.
##  `vtkDataAssembly::GetDataSetIndices` provides a mechanism to get the
##  database indices associated with a node, and optionally, the entire subtree
##  rooted at the chosen node.
##
##  @section Searching Searching
##
##  Each node in the vtkDataAssembly is assigned a unique id.
##  `vtkDataAssembly::FindFirstNodeWithName` and
##  `vtkDataAssembly::FindNodesWithName` can be used to get the id(s) for
##  node(s) with given name.
##
##  `vtkDataAssembly::SelectNodes` provides a
##  more flexible mechanism to find nodes using name-based queries. Section
##  @ref DataAssemblyPathQueries covers supported queries.
##
##  @section Traversal Traversal
##
##  `vtkDataAssemblyVisitor` defines a visitor API. An instance of a concretized
##  `vtkDataAssemblyVisitor` subclass can be passed to `vtkDataAssembly::Visit`
##  to traverse the data-assembly hierarchy either in depth-first or
##  breadth-first order.
##
##  @section DataAssemblyPathQueries Supported Path Queries
##
##  `vtkDataAssembly::SelectNodes` can be used find nodes that match the
##  specified query (or queries) using XPath 1.0 syntax.
##
##  For example:
##
##  * '/' is used as the path separator. If a node name has a `/` it must be
##  escaped using `\\` in the query. Note, escaping is not necessary when using
##  `SetNodeName`/`GetNodeName`.
##
##  * '/' selects the root node.
##
##  * '/nodename' selects all child nodes of the root with the name 'nodename'.
##
##  * '//nodename' selects all nodes with 'nodename' that are descendants of the
##    root; thus, this this will traverse the entire tree.
##
##  * '/nodename/' selects all child nodes of all nodes named 'nodename' under
##    the root; thus, ending a query with '/' selects the children of the found
##    nodes rather than the nodes themselves.
##
##  * '/nodename1/nodename2' selects all nodes named 'nodename2' which are
##    children of nodes with name 'nodename1' that are themselves children of
##    the root node.
##
##  * '//nodename1/nodename2' finds all nodes in the tree named 'nodename1' and
##    then selects all children of these found nodes that are named 'nodename2'.
##
##  @section Applications Applications
##
##  The separation of dataset storage (vtkPartitionedDataSetCollection) and
##  organization (vtkDataAssembly) enables development of algorithms that can
##  expose APIs that are not tightly coupled to dataset storage. Together,
##  vtkPartitionedDataSetCollection and vtkDataAssembly can be thought of as a
##  different way of organizing data that was previously organized as a
##  vtkMultiBlockDataSet. The advantage of the this newer approach is that
##  filters can support specifying parameters using paths or path queries
##  rather than composite indices. The composite indices suffered from the fact
##  that they made no sense except for the specific vtkMultiBlockDataSet they
##  were applied too. Thus, if the filters input was changed, the composite ids
##  rarely made any sense and needed to be updated. Paths and path queries,
##  however, do not suffer from this issue.
##
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkDataAssemblyVisitor"
type
  vtkDataAssembly* {.importcpp: "vtkDataAssembly", header: "vtkDataAssembly.h",
                    bycopy.} = object of vtkObject
    vtkDataAssembly* {.importc: "vtkDataAssembly".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataAssembly {.importcpp: "vtkDataAssembly::New(@)",
                               header: "vtkDataAssembly.h".}
type
  vtkDataAssemblySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataAssembly::IsTypeOf(@)", header: "vtkDataAssembly.h".}
proc IsA*(this: var vtkDataAssembly; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDataAssembly.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataAssembly {.
    importcpp: "vtkDataAssembly::SafeDownCast(@)", header: "vtkDataAssembly.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataAssembly :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataAssembly :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataAssembly :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataAssembly; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataAssembly.h".}
proc Initialize*(this: var vtkDataAssembly) {.importcpp: "Initialize",
    header: "vtkDataAssembly.h".}
proc InitializeFromXML*(this: var vtkDataAssembly; xmlcontents: cstring): bool {.
    importcpp: "InitializeFromXML", header: "vtkDataAssembly.h".}
proc SerializeToXML*(this: vtkDataAssembly; indent: vtkIndent): string {.noSideEffect,
    importcpp: "SerializeToXML", header: "vtkDataAssembly.h".}
proc GetRootNode*(): cint {.importcpp: "vtkDataAssembly::GetRootNode(@)",
                         header: "vtkDataAssembly.h".}
proc SetRootNodeName*(this: var vtkDataAssembly; name: cstring) {.
    importcpp: "SetRootNodeName", header: "vtkDataAssembly.h".}
proc GetRootNodeName*(this: vtkDataAssembly): cstring {.noSideEffect,
    importcpp: "GetRootNodeName", header: "vtkDataAssembly.h".}
proc AddNode*(this: var vtkDataAssembly; name: cstring; parent: cint = 0): cint {.
    importcpp: "AddNode", header: "vtkDataAssembly.h".}
proc AddNodes*(this: var vtkDataAssembly; names: vector[string]; parent: cint = 0): vector[
    cint] {.importcpp: "AddNodes", header: "vtkDataAssembly.h".}
proc AddSubtree*(this: var vtkDataAssembly; parent: cint; other: ptr vtkDataAssembly;
                otherParent: cint = 0): cint {.importcpp: "AddSubtree",
    header: "vtkDataAssembly.h".}
proc RemoveNode*(this: var vtkDataAssembly; id: cint): bool {.importcpp: "RemoveNode",
    header: "vtkDataAssembly.h".}
proc SetNodeName*(this: var vtkDataAssembly; id: cint; name: cstring) {.
    importcpp: "SetNodeName", header: "vtkDataAssembly.h".}
proc GetNodeName*(this: vtkDataAssembly; id: cint): cstring {.noSideEffect,
    importcpp: "GetNodeName", header: "vtkDataAssembly.h".}
proc GetNodePath*(this: vtkDataAssembly; id: cint): string {.noSideEffect,
    importcpp: "GetNodePath", header: "vtkDataAssembly.h".}
proc GetFirstNodeByPath*(this: vtkDataAssembly; path: cstring): cint {.noSideEffect,
    importcpp: "GetFirstNodeByPath", header: "vtkDataAssembly.h".}
proc AddDataSetIndex*(this: var vtkDataAssembly; id: cint; dataset_index: cuint): bool {.
    importcpp: "AddDataSetIndex", header: "vtkDataAssembly.h".}
proc AddDataSetIndices*(this: var vtkDataAssembly; id: cint;
                       dataset_indices: vector[cuint]): bool {.
    importcpp: "AddDataSetIndices", header: "vtkDataAssembly.h".}
proc AddDataSetIndexRange*(this: var vtkDataAssembly; id: cint; index_start: cuint;
                          count: cint): bool {.importcpp: "AddDataSetIndexRange",
    header: "vtkDataAssembly.h".}
proc RemoveDataSetIndex*(this: var vtkDataAssembly; id: cint; dataset_index: cuint): bool {.
    importcpp: "RemoveDataSetIndex", header: "vtkDataAssembly.h".}
proc RemoveAllDataSetIndices*(this: var vtkDataAssembly; id: cint;
                             traverse_subtree: bool = true): bool {.
    importcpp: "RemoveAllDataSetIndices", header: "vtkDataAssembly.h".}
type
  vtkDataAssemblyTraversalOrder* {.size: sizeof(cint),
                                  importcpp: "vtkDataAssembly::TraversalOrder",
                                  header: "vtkDataAssembly.h".} = enum
    DepthFirst = 0, BreadthFirst


proc FindFirstNodeWithName*(this: vtkDataAssembly; name: cstring;
                           traversal_order: cint = DepthFirst): cint {.noSideEffect,
    importcpp: "FindFirstNodeWithName", header: "vtkDataAssembly.h".}
proc FindNodesWithName*(this: vtkDataAssembly; name: cstring;
                       sort_order: cint = DepthFirst): vector[cint] {.noSideEffect,
    importcpp: "FindNodesWithName", header: "vtkDataAssembly.h".}
proc GetChildNodes*(this: vtkDataAssembly; parent: cint;
                   traverse_subtree: bool = true; traversal_order: cint = DepthFirst): vector[
    cint] {.noSideEffect, importcpp: "GetChildNodes", header: "vtkDataAssembly.h".}
proc GetNumberOfChildren*(this: vtkDataAssembly; parent: cint): cint {.noSideEffect,
    importcpp: "GetNumberOfChildren", header: "vtkDataAssembly.h".}
proc GetChild*(this: vtkDataAssembly; parent: cint; index: cint): cint {.noSideEffect,
    importcpp: "GetChild", header: "vtkDataAssembly.h".}
proc GetChildIndex*(this: vtkDataAssembly; parent: cint; child: cint): cint {.
    noSideEffect, importcpp: "GetChildIndex", header: "vtkDataAssembly.h".}
proc GetParent*(this: vtkDataAssembly; id: cint): cint {.noSideEffect,
    importcpp: "GetParent", header: "vtkDataAssembly.h".}
proc HasAttribute*(this: vtkDataAssembly; id: cint; name: cstring): bool {.noSideEffect,
    importcpp: "HasAttribute", header: "vtkDataAssembly.h".}
proc SetAttribute*(this: var vtkDataAssembly; id: cint; name: cstring; value: cstring) {.
    importcpp: "SetAttribute", header: "vtkDataAssembly.h".}
proc SetAttribute*(this: var vtkDataAssembly; id: cint; name: cstring; value: cint) {.
    importcpp: "SetAttribute", header: "vtkDataAssembly.h".}
proc SetAttribute*(this: var vtkDataAssembly; id: cint; name: cstring; value: cuint) {.
    importcpp: "SetAttribute", header: "vtkDataAssembly.h".}
when VTK_ID_TYPE_IMPL != VTK_INT:
  proc SetAttribute*(this: var vtkDataAssembly; id: cint; name: cstring;
                    value: vtkIdType) {.importcpp: "SetAttribute",
                                      header: "vtkDataAssembly.h".}
proc GetAttribute*(this: vtkDataAssembly; id: cint; name: cstring; value: cstring): bool {.
    noSideEffect, importcpp: "GetAttribute", header: "vtkDataAssembly.h".}
proc GetAttribute*(this: vtkDataAssembly; id: cint; name: cstring; value: var cint): bool {.
    noSideEffect, importcpp: "GetAttribute", header: "vtkDataAssembly.h".}
proc GetAttribute*(this: vtkDataAssembly; id: cint; name: cstring; value: var cuint): bool {.
    noSideEffect, importcpp: "GetAttribute", header: "vtkDataAssembly.h".}
when VTK_ID_TYPE_IMPL != VTK_INT:
  proc GetAttribute*(this: vtkDataAssembly; id: cint; name: cstring;
                    value: var vtkIdType): bool {.noSideEffect,
      importcpp: "GetAttribute", header: "vtkDataAssembly.h".}
proc GetAttributeOrDefault*(this: vtkDataAssembly; id: cint; name: cstring;
                           default_value: cstring): cstring {.noSideEffect,
    importcpp: "GetAttributeOrDefault", header: "vtkDataAssembly.h".}
proc GetAttributeOrDefault*(this: vtkDataAssembly; id: cint; name: cstring;
                           default_value: cint): cint {.noSideEffect,
    importcpp: "GetAttributeOrDefault", header: "vtkDataAssembly.h".}
proc GetAttributeOrDefault*(this: vtkDataAssembly; id: cint; name: cstring;
                           default_value: cuint): cuint {.noSideEffect,
    importcpp: "GetAttributeOrDefault", header: "vtkDataAssembly.h".}
when VTK_ID_TYPE_IMPL != VTK_INT:
  proc GetAttributeOrDefault*(this: vtkDataAssembly; id: cint; name: cstring;
                             default_value: vtkIdType): vtkIdType {.noSideEffect,
      importcpp: "GetAttributeOrDefault", header: "vtkDataAssembly.h".}
proc Visit*(this: vtkDataAssembly; visitor: ptr vtkDataAssemblyVisitor;
           traversal_order: cint = DepthFirst) {.noSideEffect, importcpp: "Visit",
    header: "vtkDataAssembly.h".}
proc Visit*(this: vtkDataAssembly; id: cint; visitor: ptr vtkDataAssemblyVisitor;
           traversal_order: cint = DepthFirst) {.noSideEffect, importcpp: "Visit",
    header: "vtkDataAssembly.h".}
proc GetDataSetIndices*(this: vtkDataAssembly; id: cint;
                       traverse_subtree: bool = true;
                       traversal_order: cint = DepthFirst): vector[cuint] {.
    noSideEffect, importcpp: "GetDataSetIndices", header: "vtkDataAssembly.h".}
proc GetDataSetIndices*(this: vtkDataAssembly; ids: vector[cint];
                       traverse_subtree: bool = true;
                       traversal_order: cint = DepthFirst): vector[cuint] {.
    noSideEffect, importcpp: "GetDataSetIndices", header: "vtkDataAssembly.h".}
proc SelectNodes*(this: vtkDataAssembly; path_queries: vector[string];
                 traversal_order: cint = DepthFirst): vector[cint] {.noSideEffect,
    importcpp: "SelectNodes", header: "vtkDataAssembly.h".}
proc RemapDataSetIndices*(this: var vtkDataAssembly; mapping: map[cuint, cuint];
                         remove_unmapped: bool): bool {.
    importcpp: "RemapDataSetIndices", header: "vtkDataAssembly.h".}
proc SubsetCopy*(this: var vtkDataAssembly; other: ptr vtkDataAssembly;
                selected_branches: vector[cint]) {.importcpp: "SubsetCopy",
    header: "vtkDataAssembly.h".}
proc DeepCopy*(this: var vtkDataAssembly; other: ptr vtkDataAssembly) {.
    importcpp: "DeepCopy", header: "vtkDataAssembly.h".}
proc IsNodeNameValid*(name: cstring): bool {.
    importcpp: "vtkDataAssembly::IsNodeNameValid(@)", header: "vtkDataAssembly.h".}
proc MakeValidNodeName*(name: cstring): string {.
    importcpp: "vtkDataAssembly::MakeValidNodeName(@)",
    header: "vtkDataAssembly.h".}
proc IsNodeNameReserved*(name: cstring): bool {.
    importcpp: "vtkDataAssembly::IsNodeNameReserved(@)",
    header: "vtkDataAssembly.h".}