## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRandomGraphSource.h
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
##  @class   vtkRandomGraphSource
##  @brief   a graph with random edges
##
##
##  Generates a graph with a specified number of vertices, with the density of
##  edges specified by either an exact number of edges or the probability of
##  an edge.  You may additionally specify whether to begin with a random
##  tree (which enforces graph connectivity).
##
##

import
  vtkGraphAlgorithm, vtkInfovisCoreModule

discard "forward decl of vtkGraph"
discard "forward decl of vtkPVXMLElement"
type
  vtkRandomGraphSource* {.importcpp: "vtkRandomGraphSource",
                         header: "vtkRandomGraphSource.h", bycopy.} = object of vtkGraphAlgorithm
    vtkRandomGraphSource* {.importc: "vtkRandomGraphSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRandomGraphSource {.importcpp: "vtkRandomGraphSource::New(@)",
                                    header: "vtkRandomGraphSource.h".}
type
  vtkRandomGraphSourceSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRandomGraphSource::IsTypeOf(@)",
    header: "vtkRandomGraphSource.h".}
proc IsA*(this: var vtkRandomGraphSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRandomGraphSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRandomGraphSource {.
    importcpp: "vtkRandomGraphSource::SafeDownCast(@)",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRandomGraphSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRandomGraphSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRandomGraphSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRandomGraphSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  /@{ *
##  The number of vertices in the graph.
##  virtual int GetNumberOfVerticesNumberOfVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfVertices  of  << this -> NumberOfVertices ) ; return this -> NumberOfVertices ; } ;
## Error: expected ';'!!!

proc SetNumberOfVertices*(this: var vtkRandomGraphSource; _arg: cint) {.
    importcpp: "SetNumberOfVertices", header: "vtkRandomGraphSource.h".}
proc GetNumberOfVerticesMinValue*(this: var vtkRandomGraphSource): cint {.
    importcpp: "GetNumberOfVerticesMinValue", header: "vtkRandomGraphSource.h".}
proc GetNumberOfVerticesMaxValue*(this: var vtkRandomGraphSource): cint {.
    importcpp: "GetNumberOfVerticesMaxValue", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  If UseEdgeProbability is off, creates a graph with the specified number
  ##  of edges.  Duplicate (parallel) edges are allowed.
  ##
## !!!Ignored construct:  virtual int GetNumberOfVerticesNumberOfVerticesNumberOfEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfEdges  of  << this -> NumberOfEdges ) ; return this -> NumberOfEdges ; } ;
## Error: expected ';'!!!

proc SetNumberOfVerticesNumberOfEdges*(this: var vtkRandomGraphSource; _arg: cint) {.
    importcpp: "SetNumberOfVerticesNumberOfEdges",
    header: "vtkRandomGraphSource.h".}
proc GetNumberOfVerticesMinValueNumberOfEdgesMinValue*(
    this: var vtkRandomGraphSource): cint {.importcpp: "GetNumberOfVerticesMinValueNumberOfEdgesMinValue",
                                        header: "vtkRandomGraphSource.h".}
proc GetNumberOfVerticesMaxValueNumberOfEdgesMaxValue*(
    this: var vtkRandomGraphSource): cint {.importcpp: "GetNumberOfVerticesMaxValueNumberOfEdgesMaxValue",
                                        header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  If UseEdgeProbability is on, adds an edge with this probability between 0 and 1
  ##  for each pair of vertices in the graph.
  ##
## !!!Ignored construct:  virtual double GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbability ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeProbability  of  << this -> EdgeProbability ) ; return this -> EdgeProbability ; } ;
## Error: expected ';'!!!

proc SetNumberOfVerticesNumberOfEdgesEdgeProbability*(
    this: var vtkRandomGraphSource; _arg: cdouble) {.
    importcpp: "SetNumberOfVerticesNumberOfEdgesEdgeProbability",
    header: "vtkRandomGraphSource.h".}
proc GetNumberOfVerticesMinValueNumberOfEdgesMinValueEdgeProbabilityMinValue*(
    this: var vtkRandomGraphSource): cdouble {.importcpp: "GetNumberOfVerticesMinValueNumberOfEdgesMinValueEdgeProbabilityMinValue",
    header: "vtkRandomGraphSource.h".}
proc GetNumberOfVerticesMaxValueNumberOfEdgesMaxValueEdgeProbabilityMaxValue*(
    this: var vtkRandomGraphSource): cdouble {.importcpp: "GetNumberOfVerticesMaxValueNumberOfEdgesMaxValueEdgeProbabilityMaxValue",
    header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  When set, includes edge weights in an array named "edge_weights".
  ##  Defaults to off.  Weights are random between 0 and 1.
  ##
proc SetIncludeEdgeWeights*(this: var vtkRandomGraphSource; _arg: bool) {.
    importcpp: "SetIncludeEdgeWeights", header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeights ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeEdgeWeights  of  << this -> IncludeEdgeWeights ) ; return this -> IncludeEdgeWeights ; } ;
## Error: expected ';'!!!

proc IncludeEdgeWeightsOn*(this: var vtkRandomGraphSource) {.
    importcpp: "IncludeEdgeWeightsOn", header: "vtkRandomGraphSource.h".}
proc IncludeEdgeWeightsOff*(this: var vtkRandomGraphSource) {.
    importcpp: "IncludeEdgeWeightsOff", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the edge weight array. Default "edge weight".
  ##
proc SetEdgeWeightArrayName*(this: var vtkRandomGraphSource; _arg: cstring) {.
    importcpp: "SetEdgeWeightArrayName", header: "vtkRandomGraphSource.h".}
proc GetEdgeWeightArrayName*(this: var vtkRandomGraphSource): cstring {.
    importcpp: "GetEdgeWeightArrayName", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  When set, creates a directed graph, as opposed to an undirected graph.
  ##
proc SetIncludeEdgeWeightsDirected*(this: var vtkRandomGraphSource; _arg: bool) {.
    importcpp: "SetIncludeEdgeWeightsDirected", header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirected ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Directed  of  << this -> Directed ) ; return this -> Directed ; } ;
## Error: expected ';'!!!

proc DirectedOn*(this: var vtkRandomGraphSource) {.importcpp: "DirectedOn",
    header: "vtkRandomGraphSource.h".}
proc DirectedOff*(this: var vtkRandomGraphSource) {.importcpp: "DirectedOff",
    header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  When set, uses the EdgeProbability parameter to determine the density
  ##  of edges.  Otherwise, NumberOfEdges is used.
  ##
proc SetIncludeEdgeWeightsDirectedUseEdgeProbability*(
    this: var vtkRandomGraphSource; _arg: bool) {.
    importcpp: "SetIncludeEdgeWeightsDirectedUseEdgeProbability",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirectedUseEdgeProbability ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseEdgeProbability  of  << this -> UseEdgeProbability ) ; return this -> UseEdgeProbability ; } ;
## Error: expected ';'!!!

proc UseEdgeProbabilityOn*(this: var vtkRandomGraphSource) {.
    importcpp: "UseEdgeProbabilityOn", header: "vtkRandomGraphSource.h".}
proc UseEdgeProbabilityOff*(this: var vtkRandomGraphSource) {.
    importcpp: "UseEdgeProbabilityOff", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  When set, builds a random tree structure first, then adds additional
  ##  random edges.
  ##
proc SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTree*(
    this: var vtkRandomGraphSource; _arg: bool) {.
    importcpp: "SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTree",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartWithTree  of  << this -> StartWithTree ) ; return this -> StartWithTree ; } ;
## Error: expected ';'!!!

proc StartWithTreeOn*(this: var vtkRandomGraphSource) {.
    importcpp: "StartWithTreeOn", header: "vtkRandomGraphSource.h".}
proc StartWithTreeOff*(this: var vtkRandomGraphSource) {.
    importcpp: "StartWithTreeOff", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  If this flag is set to true, edges where the source and target
  ##  vertex are the same can be generated.  The default is to forbid
  ##  such loops.
  ##
proc SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoops*(
    this: var vtkRandomGraphSource; _arg: bool) {.importcpp: "SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoops",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoops ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowSelfLoops  of  << this -> AllowSelfLoops ) ; return this -> AllowSelfLoops ; } ;
## Error: expected ';'!!!

proc AllowSelfLoopsOn*(this: var vtkRandomGraphSource) {.
    importcpp: "AllowSelfLoopsOn", header: "vtkRandomGraphSource.h".}
proc AllowSelfLoopsOff*(this: var vtkRandomGraphSource) {.
    importcpp: "AllowSelfLoopsOff", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  When set, multiple edges from a source to a target vertex are
  ##  allowed. The default is to forbid such loops.
  ##
proc SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdges*(
    this: var vtkRandomGraphSource; _arg: bool) {.importcpp: "SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdges",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllowParallelEdges  of  << this -> AllowParallelEdges ) ; return this -> AllowParallelEdges ; } ;
## Error: expected ';'!!!

proc AllowParallelEdgesOn*(this: var vtkRandomGraphSource) {.
    importcpp: "AllowParallelEdgesOn", header: "vtkRandomGraphSource.h".}
proc AllowParallelEdgesOff*(this: var vtkRandomGraphSource) {.
    importcpp: "AllowParallelEdgesOff", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Add pedigree ids to vertex and edge data.
  ##
proc SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdgesGeneratePedigreeIds*(
    this: var vtkRandomGraphSource; _arg: bool) {.importcpp: "SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdgesGeneratePedigreeIds",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual bool GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdgesGeneratePedigreeIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePedigreeIds  of  << this -> GeneratePedigreeIds ) ; return this -> GeneratePedigreeIds ; } ;
## Error: expected ';'!!!

proc GeneratePedigreeIdsOn*(this: var vtkRandomGraphSource) {.
    importcpp: "GeneratePedigreeIdsOn", header: "vtkRandomGraphSource.h".}
proc GeneratePedigreeIdsOff*(this: var vtkRandomGraphSource) {.
    importcpp: "GeneratePedigreeIdsOff", header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the vertex pedigree id array. Default "vertex id".
  ##
proc SetEdgeWeightArrayNameVertexPedigreeIdArrayName*(
    this: var vtkRandomGraphSource; _arg: cstring) {.
    importcpp: "SetEdgeWeightArrayNameVertexPedigreeIdArrayName",
    header: "vtkRandomGraphSource.h".}
proc GetEdgeWeightArrayNameVertexPedigreeIdArrayName*(
    this: var vtkRandomGraphSource): cstring {.
    importcpp: "GetEdgeWeightArrayNameVertexPedigreeIdArrayName",
    header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the edge pedigree id array. Default "edge id".
  ##
proc SetEdgeWeightArrayNameVertexPedigreeIdArrayNameEdgePedigreeIdArrayName*(
    this: var vtkRandomGraphSource; _arg: cstring) {.importcpp: "SetEdgeWeightArrayNameVertexPedigreeIdArrayNameEdgePedigreeIdArrayName",
    header: "vtkRandomGraphSource.h".}
proc GetEdgeWeightArrayNameVertexPedigreeIdArrayNameEdgePedigreeIdArrayName*(
    this: var vtkRandomGraphSource): cstring {.importcpp: "GetEdgeWeightArrayNameVertexPedigreeIdArrayNameEdgePedigreeIdArrayName",
    header: "vtkRandomGraphSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control the seed used for pseudo-random-number generation.
  ##  This ensures that vtkRandomGraphSource can produce repeatable
  ##  results.
  ##
proc SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdgesGeneratePedigreeIdsSeed*(
    this: var vtkRandomGraphSource; _arg: cint) {.importcpp: "SetIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdgesGeneratePedigreeIdsSeed",
    header: "vtkRandomGraphSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfVerticesNumberOfVerticesNumberOfEdgesEdgeProbabilityIncludeEdgeWeightsDirectedUseEdgeProbabilityStartWithTreeAllowSelfLoopsAllowParallelEdgesGeneratePedigreeIdsSeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Seed  of  << this -> Seed ) ; return this -> Seed ; } ;
## Error: expected ';'!!!
