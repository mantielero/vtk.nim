## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDirectedGraph.h
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
##  @class   vtkDirectedGraph
##  @brief   A directed graph.
##
##
##  vtkDirectedGraph is a collection of vertices along with a collection of
##  directed edges (edges that have a source and target). ShallowCopy()
##  and DeepCopy() (and CheckedShallowCopy(), CheckedDeepCopy())
##  accept instances of vtkTree and vtkMutableDirectedGraph.
##
##  vtkDirectedGraph is read-only. To create an undirected graph,
##  use an instance of vtkMutableDirectedGraph, then you may set the
##  structure to a vtkDirectedGraph using ShallowCopy().
##
##  @sa
##  vtkGraph vtkMutableDirectedGraph
##

import
  vtkCommonDataModelModule, vtkGraph

type
  vtkDirectedGraph* {.importcpp: "vtkDirectedGraph", header: "vtkDirectedGraph.h",
                     bycopy.} = object of vtkGraph
    vtkDirectedGraph* {.importc: "vtkDirectedGraph".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDirectedGraph {.importcpp: "vtkDirectedGraph::New(@)",
                                header: "vtkDirectedGraph.h".}
type
  vtkDirectedGraphSuperclass* = vtkGraph

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDirectedGraph::IsTypeOf(@)", header: "vtkDirectedGraph.h".}
proc IsA*(this: var vtkDirectedGraph; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDirectedGraph.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDirectedGraph {.
    importcpp: "vtkDirectedGraph::SafeDownCast(@)", header: "vtkDirectedGraph.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDirectedGraph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDirectedGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDirectedGraph :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDirectedGraph; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDirectedGraph.h".}
proc GetDataObjectType*(this: var vtkDirectedGraph): cint {.
    importcpp: "GetDataObjectType", header: "vtkDirectedGraph.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkDirectedGraph {.
    importcpp: "vtkDirectedGraph::GetData(@)", header: "vtkDirectedGraph.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkDirectedGraph {.
    importcpp: "vtkDirectedGraph::GetData(@)", header: "vtkDirectedGraph.h".}
proc IsStructureValid*(this: var vtkDirectedGraph; g: ptr vtkGraph): bool {.
    importcpp: "IsStructureValid", header: "vtkDirectedGraph.h".}