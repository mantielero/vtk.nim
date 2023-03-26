## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeGraphs.h
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
##  @class   vtkMergeGraphs
##  @brief   combines two graphs
##
##
##  vtkMergeGraphs combines information from two graphs into one.
##  Both graphs must have pedigree ids assigned to the vertices.
##  The output will contain the vertices/edges in the first graph, in
##  addition to:
##
##   - vertices in the second graph whose pedigree id does not
##     match a vertex in the first input
##
##   - edges in the second graph
##
##  The output will contain the same attribute structure as the input;
##  fields associated only with the second input graph will not be passed
##  to the output. When possible, the vertex/edge data for new vertices and
##  edges will be populated with matching attributes on the second graph.
##  To be considered a matching attribute, the array must have the same name,
##  type, and number of components.
##
##  @warning
##  This filter is not "domain-aware". Pedigree ids are assumed to be globally
##  unique, regardless of their domain.
##

import
  vtkGraphAlgorithm, vtkInfovisCoreModule

discard "forward decl of vtkBitArray"
discard "forward decl of vtkMutableGraphHelper"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
type
  vtkMergeGraphs* {.importcpp: "vtkMergeGraphs", header: "vtkMergeGraphs.h", bycopy.} = object of vtkGraphAlgorithm
    vtkMergeGraphs* {.importc: "vtkMergeGraphs".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMergeGraphs {.importcpp: "vtkMergeGraphs::New(@)",
                              header: "vtkMergeGraphs.h".}
type
  vtkMergeGraphsSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeGraphs::IsTypeOf(@)", header: "vtkMergeGraphs.h".}
proc IsA*(this: var vtkMergeGraphs; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMergeGraphs.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeGraphs {.
    importcpp: "vtkMergeGraphs::SafeDownCast(@)", header: "vtkMergeGraphs.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeGraphs :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeGraphs :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeGraphs :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeGraphs; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeGraphs.h".}
proc ExtendGraph*(this: var vtkMergeGraphs; g1: ptr vtkMutableGraphHelper;
                 g2: ptr vtkGraph): cint {.importcpp: "ExtendGraph",
                                       header: "vtkMergeGraphs.h".}
proc SetUseEdgeWindow*(this: var vtkMergeGraphs; _arg: bool) {.
    importcpp: "SetUseEdgeWindow", header: "vtkMergeGraphs.h".}
## !!!Ignored construct:  virtual bool GetUseEdgeWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseEdgeWindow  of  << this -> UseEdgeWindow ) ; return this -> UseEdgeWindow ; } ;
## Error: expected ';'!!!

proc UseEdgeWindowOn*(this: var vtkMergeGraphs) {.importcpp: "UseEdgeWindowOn",
    header: "vtkMergeGraphs.h".}
proc UseEdgeWindowOff*(this: var vtkMergeGraphs) {.importcpp: "UseEdgeWindowOff",
    header: "vtkMergeGraphs.h".}
  ## /@}
  ## /@{
  ## *
  ##  The edge window array. The default array name is "time".
  ##
proc SetEdgeWindowArrayName*(this: var vtkMergeGraphs; _arg: cstring) {.
    importcpp: "SetEdgeWindowArrayName", header: "vtkMergeGraphs.h".}
proc GetEdgeWindowArrayName*(this: var vtkMergeGraphs): cstring {.
    importcpp: "GetEdgeWindowArrayName", header: "vtkMergeGraphs.h".}
  ## /@}
  ## /@{
  ## *
  ##  The time window amount. Edges with values lower
  ##  than the maximum value minus this window will be
  ##  removed from the graph. The default edge window is
  ##  10000.
  ##
proc SetUseEdgeWindowEdgeWindow*(this: var vtkMergeGraphs; _arg: cdouble) {.
    importcpp: "SetUseEdgeWindowEdgeWindow", header: "vtkMergeGraphs.h".}
## !!!Ignored construct:  virtual double GetUseEdgeWindowEdgeWindow ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EdgeWindow  of  << this -> EdgeWindow ) ; return this -> EdgeWindow ; } ;
## Error: expected ';'!!!
