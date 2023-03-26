## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGraphInternals.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkGraphInternals
##  @brief   Internal representation of vtkGraph
##
##
##  This is the internal representation of vtkGraph, used only in rare cases
##  where one must modify that representation.
##

import
  vtkCommonDataModelModule, vtkGraph, vtkObject

## ----------------------------------------------------------------------------
##  class vtkVertexAdjacencyList
## ----------------------------------------------------------------------------

type
  vtkVertexAdjacencyList* {.importcpp: "vtkVertexAdjacencyList",
                           header: "vtkGraphInternals.h", bycopy.} = object
    InEdges* {.importc: "InEdges".}: vector[vtkInEdgeType]
    OutEdges* {.importc: "OutEdges".}: vector[vtkOutEdgeType]


## ----------------------------------------------------------------------------
##  class vtkGraphInternals
## ----------------------------------------------------------------------------

type
  vtkGraphInternals* {.importcpp: "vtkGraphInternals",
                      header: "vtkGraphInternals.h", bycopy.} = object of vtkObject
    vtkGraphInternals* {.importc: "vtkGraphInternals".}: VTK_NEWINSTANCE
    Adjacency* {.importc: "Adjacency".}: vector[vtkVertexAdjacencyList]
    NumberOfEdges* {.importc: "NumberOfEdges".}: vtkIdType
    LastRemoteEdgeId* {.importc: "LastRemoteEdgeId".}: vtkIdType
    LastRemoteEdgeSource* {.importc: "LastRemoteEdgeSource".}: vtkIdType
    LastRemoteEdgeTarget* {.importc: "LastRemoteEdgeTarget".}: vtkIdType ##  Whether we have used pedigree IDs to refer to the vertices of the
                                                                     ##  graph, e.g., to add edges or vertices. In a distributed graph,
                                                                     ##  the pedigree-id interface is mutually exclusive with the
                                                                     ##  no-argument AddVertex() function in vtkMutableUndirectedGraph and
                                                                     ##  vtkMutableDirectedGraph.
    UsingPedigreeIds* {.importc: "UsingPedigreeIds".}: bool ## *
                                                        ##  Convenience method for removing an edge from an out edge list.
                                                        ##


proc New*(): ptr vtkGraphInternals {.importcpp: "vtkGraphInternals::New(@)",
                                 header: "vtkGraphInternals.h".}
type
  vtkGraphInternalsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGraphInternals::IsTypeOf(@)", header: "vtkGraphInternals.h".}
proc IsA*(this: var vtkGraphInternals; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGraphInternals.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGraphInternals {.
    importcpp: "vtkGraphInternals::SafeDownCast(@)", header: "vtkGraphInternals.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGraphInternals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGraphInternals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGraphInternals :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGraphInternals; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGraphInternals.h".}
proc RemoveEdgeFromOutList*(this: var vtkGraphInternals; e: vtkIdType;
                           outEdges: var vector[vtkOutEdgeType]) {.
    importcpp: "RemoveEdgeFromOutList", header: "vtkGraphInternals.h".}
proc RemoveEdgeFromInList*(this: var vtkGraphInternals; e: vtkIdType;
                          inEdges: var vector[vtkInEdgeType]) {.
    importcpp: "RemoveEdgeFromInList", header: "vtkGraphInternals.h".}
proc ReplaceEdgeFromOutList*(this: var vtkGraphInternals; `from`: vtkIdType;
                            to: vtkIdType; outEdges: var vector[vtkOutEdgeType]) {.
    importcpp: "ReplaceEdgeFromOutList", header: "vtkGraphInternals.h".}
proc ReplaceEdgeFromInList*(this: var vtkGraphInternals; `from`: vtkIdType;
                           to: vtkIdType; inEdges: var vector[vtkInEdgeType]) {.
    importcpp: "ReplaceEdgeFromInList", header: "vtkGraphInternals.h".}