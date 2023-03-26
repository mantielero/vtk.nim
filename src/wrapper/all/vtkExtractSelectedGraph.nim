## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedGraph.h
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
##  @class   vtkExtractSelectedGraph
##  @brief   return a subgraph of a vtkGraph
##
##
##  The first input is a vtkGraph to take a subgraph from.
##  The second input (optional) is a vtkSelection containing selected
##  indices. The third input (optional) is a vtkAnnotationsLayers whose
##  annotations contain selected specifying selected indices.
##  The vtkSelection may have FIELD_TYPE set to POINTS (a vertex selection)
##  or CELLS (an edge selection).  A vertex selection preserves all edges
##  that connect selected vertices.  An edge selection preserves all vertices
##  that are adjacent to at least one selected edge.  Alternately, you may
##  indicate that an edge selection should maintain the full set of vertices,
##  by turning RemoveIsolatedVertices off.
##

import
  vtkGraphAlgorithm, vtkInfovisCoreModule

discard "forward decl of vtkSelection"
discard "forward decl of vtkDataSet"
type
  vtkExtractSelectedGraph* {.importcpp: "vtkExtractSelectedGraph",
                            header: "vtkExtractSelectedGraph.h", bycopy.} = object of vtkGraphAlgorithm
    vtkExtractSelectedGraph* {.importc: "vtkExtractSelectedGraph".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractSelectedGraph {.importcpp: "vtkExtractSelectedGraph::New(@)",
                                       header: "vtkExtractSelectedGraph.h".}
type
  vtkExtractSelectedGraphSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractSelectedGraph::IsTypeOf(@)",
    header: "vtkExtractSelectedGraph.h".}
proc IsA*(this: var vtkExtractSelectedGraph; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractSelectedGraph.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractSelectedGraph {.
    importcpp: "vtkExtractSelectedGraph::SafeDownCast(@)",
    header: "vtkExtractSelectedGraph.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractSelectedGraph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedGraph :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractSelectedGraph; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractSelectedGraph.h".}
proc SetSelectionConnection*(this: var vtkExtractSelectedGraph;
                            `in`: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSelectionConnection", header: "vtkExtractSelectedGraph.h".}
proc SetAnnotationLayersConnection*(this: var vtkExtractSelectedGraph;
                                   `in`: ptr vtkAlgorithmOutput) {.
    importcpp: "SetAnnotationLayersConnection",
    header: "vtkExtractSelectedGraph.h".}
proc SetRemoveIsolatedVertices*(this: var vtkExtractSelectedGraph; _arg: bool) {.
    importcpp: "SetRemoveIsolatedVertices", header: "vtkExtractSelectedGraph.h".}
## !!!Ignored construct:  virtual bool GetRemoveIsolatedVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveIsolatedVertices  of  << this -> RemoveIsolatedVertices ) ; return this -> RemoveIsolatedVertices ; } ;
## Error: expected ';'!!!

proc RemoveIsolatedVerticesOn*(this: var vtkExtractSelectedGraph) {.
    importcpp: "RemoveIsolatedVerticesOn", header: "vtkExtractSelectedGraph.h".}
proc RemoveIsolatedVerticesOff*(this: var vtkExtractSelectedGraph) {.
    importcpp: "RemoveIsolatedVerticesOff", header: "vtkExtractSelectedGraph.h".}
  ## /@}
  ## *
  ##  Specify the first vtkGraph input and the second vtkSelection input.
  ##
proc FillInputPortInformation*(this: var vtkExtractSelectedGraph; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkExtractSelectedGraph.h".}