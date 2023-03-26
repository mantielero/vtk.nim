## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDijkstraGraphGeodesicPath.h
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
##  @class   vtkDijkstraGraphGeodesicPath
##  @brief   Dijkstra algorithm to compute the graph geodesic.
##
##  Takes as input a polygonal mesh and performs a single source shortest
##  path calculation. Dijkstra's algorithm is used. The implementation is
##  similar to the one described in Introduction to Algorithms (Second Edition)
##  by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and
##  Cliff Stein, published by MIT Press and McGraw-Hill. Some minor
##  enhancement are added though. All vertices are not pushed on the heap
##  at start, instead a front set is maintained. The heap is implemented as
##  a binary heap. The output of the filter is a set of lines describing
##  the shortest path from StartVertex to EndVertex. If a path cannot be found
##  the output will have no lines or points.
##
##  @warning
##  The input polydata must have only triangle cells.
##
##  @par Thanks:
##  The class was contributed by Rasmus Paulsen.
##  www.imm.dtu.dk/~rrp/VTK . Also thanks to Alexandre Gouaillard and Shoaib
##  Ghias for bug fixes and enhancements.
##

import
  vtkFiltersModelingModule, vtkGraphGeodesicPath

discard "forward decl of vtkDijkstraGraphInternals"
discard "forward decl of vtkIdList"
type
  vtkDijkstraGraphGeodesicPath* {.importcpp: "vtkDijkstraGraphGeodesicPath",
                                 header: "vtkDijkstraGraphGeodesicPath.h", bycopy.} = object of vtkGraphGeodesicPath ## *
                                                                                                              ##  Instantiate the class
                                                                                                              ##
    vtkDijkstraGraphGeodesicPath* {.importc: "vtkDijkstraGraphGeodesicPath".}: VTK_NEWINSTANCE
    ##  The fixed cost going from vertex u to v.
    ##  The vertex ids on the shortest path.
    ##  Internalized STL containers.


proc New*(): ptr vtkDijkstraGraphGeodesicPath {.
    importcpp: "vtkDijkstraGraphGeodesicPath::New(@)",
    header: "vtkDijkstraGraphGeodesicPath.h".}
type
  vtkDijkstraGraphGeodesicPathSuperclass* = vtkGraphGeodesicPath

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDijkstraGraphGeodesicPath::IsTypeOf(@)",
    header: "vtkDijkstraGraphGeodesicPath.h".}
proc IsA*(this: var vtkDijkstraGraphGeodesicPath; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDijkstraGraphGeodesicPath.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDijkstraGraphGeodesicPath {.
    importcpp: "vtkDijkstraGraphGeodesicPath::SafeDownCast(@)",
    header: "vtkDijkstraGraphGeodesicPath.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDijkstraGraphGeodesicPath :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphGeodesicPath :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDijkstraGraphGeodesicPath :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDijkstraGraphGeodesicPath :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDijkstraGraphGeodesicPath; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkDijkstraGraphGeodesicPath.h".}
proc GetnameIdList*(this: var vtkDijkstraGraphGeodesicPath): ptr vtkIdList {.
    importcpp: "GetnameIdList", header: "vtkDijkstraGraphGeodesicPath.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stop when the end vertex is reached
  ##  or calculate shortest path to all vertices
  ##
proc SetStopWhenEndReached*(this: var vtkDijkstraGraphGeodesicPath;
                           _arg: vtkTypeBool) {.
    importcpp: "SetStopWhenEndReached", header: "vtkDijkstraGraphGeodesicPath.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStopWhenEndReached ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StopWhenEndReached  of  << this -> StopWhenEndReached ) ; return this -> StopWhenEndReached ; } ;
## Error: expected ';'!!!

proc StopWhenEndReachedOn*(this: var vtkDijkstraGraphGeodesicPath) {.
    importcpp: "StopWhenEndReachedOn", header: "vtkDijkstraGraphGeodesicPath.h".}
proc StopWhenEndReachedOff*(this: var vtkDijkstraGraphGeodesicPath) {.
    importcpp: "StopWhenEndReachedOff", header: "vtkDijkstraGraphGeodesicPath.h".}
  ## /@}
  ## /@{
  ## *
  ##  Use scalar values in the edge weight (experimental)
  ##
proc SetStopWhenEndReachedUseScalarWeights*(
    this: var vtkDijkstraGraphGeodesicPath; _arg: vtkTypeBool) {.
    importcpp: "SetStopWhenEndReachedUseScalarWeights",
    header: "vtkDijkstraGraphGeodesicPath.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStopWhenEndReachedUseScalarWeights ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScalarWeights  of  << this -> UseScalarWeights ) ; return this -> UseScalarWeights ; } ;
## Error: expected ';'!!!

proc UseScalarWeightsOn*(this: var vtkDijkstraGraphGeodesicPath) {.
    importcpp: "UseScalarWeightsOn", header: "vtkDijkstraGraphGeodesicPath.h".}
proc UseScalarWeightsOff*(this: var vtkDijkstraGraphGeodesicPath) {.
    importcpp: "UseScalarWeightsOff", header: "vtkDijkstraGraphGeodesicPath.h".}
  ## /@}
  ## /@{
  ## *
  ##  Use the input point to repel the path by assigning high costs.
  ##
proc SetStopWhenEndReachedUseScalarWeightsRepelPathFromVertices*(
    this: var vtkDijkstraGraphGeodesicPath; _arg: vtkTypeBool) {.
    importcpp: "SetStopWhenEndReachedUseScalarWeightsRepelPathFromVertices",
    header: "vtkDijkstraGraphGeodesicPath.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStopWhenEndReachedUseScalarWeightsRepelPathFromVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RepelPathFromVertices  of  << this -> RepelPathFromVertices ) ; return this -> RepelPathFromVertices ; } ;
## Error: expected ';'!!!

proc RepelPathFromVerticesOn*(this: var vtkDijkstraGraphGeodesicPath) {.
    importcpp: "RepelPathFromVerticesOn", header: "vtkDijkstraGraphGeodesicPath.h".}
proc RepelPathFromVerticesOff*(this: var vtkDijkstraGraphGeodesicPath) {.
    importcpp: "RepelPathFromVerticesOff",
    header: "vtkDijkstraGraphGeodesicPath.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify vtkPoints to use to repel the path from.
  ##
proc SetRepelVertices*(this: var vtkDijkstraGraphGeodesicPath; a2: ptr vtkPoints) {.
    importcpp: "SetRepelVertices", header: "vtkDijkstraGraphGeodesicPath.h".}
proc GetnameIdListRepelVertices*(this: var vtkDijkstraGraphGeodesicPath): ptr vtkPoints {.
    importcpp: "GetnameIdListRepelVertices",
    header: "vtkDijkstraGraphGeodesicPath.h".}
  ## /@}
  ## *
  ##  Fill the array with the cumulative weights.
  ##
proc GetCumulativeWeights*(this: var vtkDijkstraGraphGeodesicPath;
                          weights: ptr vtkDoubleArray) {.
    importcpp: "GetCumulativeWeights", header: "vtkDijkstraGraphGeodesicPath.h".}