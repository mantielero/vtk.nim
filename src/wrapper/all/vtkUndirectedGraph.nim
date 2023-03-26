## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUndirectedGraph.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkUndirectedGraph
##  @brief   An undirected graph.
##
##
##  vtkUndirectedGraph is a collection of vertices along with a collection of
##  undirected edges (they connect two vertices in no particular order).
##  ShallowCopy(), DeepCopy(), CheckedShallowCopy(), CheckedDeepCopy()
##  accept instances of vtkUndirectedGraph and vtkMutableUndirectedGraph.
##  GetOutEdges(v, it) and GetInEdges(v, it) return the same list of edges,
##  which is the list of all edges which have a v as an endpoint.
##  GetInDegree(v), GetOutDegree(v) and GetDegree(v) all return the full
##  degree of vertex v.
##
##  vtkUndirectedGraph is read-only. To create an undirected graph,
##  use an instance of vtkMutableUndirectedGraph, then you may set the
##  structure to a vtkUndirectedGraph using ShallowCopy().
##
##  @sa
##  vtkGraph vtkMutableUndirectedGraph
##

import
  vtkCommonDataModelModule, vtkGraph

type
  vtkUndirectedGraph* {.importcpp: "vtkUndirectedGraph",
                       header: "vtkUndirectedGraph.h", bycopy.} = object of vtkGraph
    vtkUndirectedGraph* {.importc: "vtkUndirectedGraph".}: VTK_NEWINSTANCE


proc New*(): ptr vtkUndirectedGraph {.importcpp: "vtkUndirectedGraph::New(@)",
                                  header: "vtkUndirectedGraph.h".}
type
  vtkUndirectedGraphSuperclass* = vtkGraph

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUndirectedGraph::IsTypeOf(@)", header: "vtkUndirectedGraph.h".}
proc IsA*(this: var vtkUndirectedGraph; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUndirectedGraph.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUndirectedGraph {.
    importcpp: "vtkUndirectedGraph::SafeDownCast(@)",
    header: "vtkUndirectedGraph.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUndirectedGraph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUndirectedGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUndirectedGraph :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUndirectedGraph; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUndirectedGraph.h".}
proc GetDataObjectType*(this: var vtkUndirectedGraph): cint {.
    importcpp: "GetDataObjectType", header: "vtkUndirectedGraph.h".}
proc GetInDegree*(this: var vtkUndirectedGraph; v: vtkIdType): vtkIdType {.
    importcpp: "GetInDegree", header: "vtkUndirectedGraph.h".}
proc GetInEdge*(this: var vtkUndirectedGraph; v: vtkIdType; i: vtkIdType): vtkInEdgeType {.
    importcpp: "GetInEdge", header: "vtkUndirectedGraph.h".}
proc GetInEdge*(this: var vtkUndirectedGraph; v: vtkIdType; i: vtkIdType;
               e: ptr vtkGraphEdge) {.importcpp: "GetInEdge",
                                   header: "vtkUndirectedGraph.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkUndirectedGraph {.
    importcpp: "vtkUndirectedGraph::GetData(@)", header: "vtkUndirectedGraph.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkUndirectedGraph {.
    importcpp: "vtkUndirectedGraph::GetData(@)", header: "vtkUndirectedGraph.h".}
proc GetInEdges*(this: var vtkUndirectedGraph; v: vtkIdType; it: ptr vtkInEdgeIterator) {.
    importcpp: "GetInEdges", header: "vtkUndirectedGraph.h".}
proc IsStructureValid*(this: var vtkUndirectedGraph; g: ptr vtkGraph): bool {.
    importcpp: "IsStructureValid", header: "vtkUndirectedGraph.h".}