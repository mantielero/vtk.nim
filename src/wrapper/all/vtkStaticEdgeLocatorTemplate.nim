## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticEdgeLocatorTemplate.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkStaticEdgeLocatorTemplate
##  @brief   templated locator for managing edges and associated data on edges
##
##
##  vtkStaticEdgeLocatorTemplate provides methods for ordering and tracking
##  edges, as well as associating data with edges. (An edge is a tuple (v0,v1)
##  with v0 < v1.) Typically this class may be used for isocontouring or any
##  operation that operates on edges and needs to determine whether duplicates
##  exist. The class is templated on 1) the type used to represent the id
##  tuple; and 2) the data associated with the edge.
##
##  This class is non-incremental (i.e., static). That is, an array of edges
##  must be provided and the locator is built from this array. Once the locator
##  is built, incremental additions of new edges is not allowed (analogoues to
##  vtkStaticPointLocator and vtkStaticCellLocator).
##
##  Finally, there are two distinct usage patterns for this class. One is to
##  inject edges and then later search for them. This pattern begins with
##  BuildLocator() and then is followed by repeated calls to IsInsertedEdge().
##  Internally this operates on an array of EdgeTupleType. The second pattern
##  also operates on an array of EdgeTupleType. It simply sorts an array of
##  vtkEdgeTupleType using MergeEdges(), thereby grouping identical edges.
##  An offset array is created that refers to the beginning of each group,
##  hence indirectly indicating the number of unique edges, and providing O(1)
##  access to each edge. Typically the offset array can be uses to renumber
##  duplicate edges and/or data (such as points) associated with the edge.
##
##  @warning
##  The id tuple type can be specified via templating to reduce memory and
##  speed processing.
##
##  @warning
##  Data is associated with edges (e.g., a parametric coordinate, or original
##  id). By using the appropriate template parameter it is possible to
##  associate other data with each edge. Note however that this data is not
##  used when comparing and sorting the edges. (This could be changed - define
##  appropriate comparison operators.)
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkEdgeTable vtkStaticPointLocator vtkStaticCellLocator
##

## *
##  Definition of an edge tuple. Note that the TId template type may be
##  specified to manage memory resources, and provide increased speeds (e.g.,
##  sort) by using smaller types (32-int versus 64-bit vtkIdType). It is
##  required that V0 < V1; the tuple constructor enforces this.
##

type
  EdgeTuple*[TId; TED] {.importcpp: "EdgeTuple<\'0,\'1>",
                       header: "vtkStaticEdgeLocatorTemplate.h", bycopy.} = object
    V0* {.importc: "V0".}: TId
    V1* {.importc: "V1".}: TId
    Data* {.importc: "Data".}: TED ##  Default constructor - nothing needs to be done


proc constructEdgeTuple*[TId; TED](): EdgeTuple[TId, TED] {.constructor,
    importcpp: "EdgeTuple<\'*0,\'*1>(@)", header: "vtkStaticEdgeLocatorTemplate.h".}
proc constructEdgeTuple*[TId; TED](v0: TId; v1: TId; data: TED): EdgeTuple[TId, TED] {.
    constructor, importcpp: "EdgeTuple<\'*0,\'*1>(@)",
    header: "vtkStaticEdgeLocatorTemplate.h".}
proc Define*[TId; TED](this: var EdgeTuple[TId, TED]; v0: TId; v1: TId) {.
    importcpp: "Define", header: "vtkStaticEdgeLocatorTemplate.h".}
proc `==`*[TId; TED](this: EdgeTuple[TId, TED]; et: EdgeTuple): bool {.noSideEffect,
    importcpp: "(# == #)", header: "vtkStaticEdgeLocatorTemplate.h".}
proc IsEdge*[TId; TED](this: EdgeTuple[TId, TED]; v0: TId; v1: TId): bool {.noSideEffect,
    importcpp: "IsEdge", header: "vtkStaticEdgeLocatorTemplate.h".}
proc `<`*[TId; TED](this: EdgeTuple[TId, TED]; tup: EdgeTuple): bool {.noSideEffect,
    importcpp: "(# < #)", header: "vtkStaticEdgeLocatorTemplate.h".}
## *
##  Templated on types of ids defining an edge, and any data associated with
##  the edge.
##

type
  vtkStaticEdgeLocatorTemplate*[IDType; EdgeData] {.
      importcpp: "vtkStaticEdgeLocatorTemplate<\'0,\'1>",
      header: "vtkStaticEdgeLocatorTemplate.h", bycopy.} = object ## /@{
                                                             ## *
                                                             ##  Some convenient typedefs.
                                                             ##
    ##  Support BuildLocator usage pattern

  vtkStaticEdgeLocatorTemplateEdgeTupleType* = EdgeTuple[IDType, EdgeData]

proc constructvtkStaticEdgeLocatorTemplate*[IDType; EdgeData](): vtkStaticEdgeLocatorTemplate[
    IDType, EdgeData] {.constructor,
                      importcpp: "vtkStaticEdgeLocatorTemplate<\'*0,\'*1>(@)",
                      header: "vtkStaticEdgeLocatorTemplate.h".}
proc destroyvtkStaticEdgeLocatorTemplate*[IDType; EdgeData](
    this: var vtkStaticEdgeLocatorTemplate[IDType, EdgeData]) {.
    importcpp: "#.~vtkStaticEdgeLocatorTemplate()",
    header: "vtkStaticEdgeLocatorTemplate.h".}
proc GetNumberOfEdges*[IDType; EdgeData](this: var vtkStaticEdgeLocatorTemplate[
    IDType, EdgeData]): IDType {.importcpp: "GetNumberOfEdges",
                              header: "vtkStaticEdgeLocatorTemplate.h".}
proc MergeEdges*[IDType; EdgeData](this: var vtkStaticEdgeLocatorTemplate[IDType,
    EdgeData]; numEdges: vtkIdType; edgeArray: ptr vtkStaticEdgeLocatorTemplateEdgeTupleType;
                                 numUniqueEdges: var vtkIdType): ptr IDType {.
    importcpp: "MergeEdges", header: "vtkStaticEdgeLocatorTemplate.h".}
proc BuildLocator*[IDType; EdgeData](this: var vtkStaticEdgeLocatorTemplate[IDType,
    EdgeData]; numEdges: vtkIdType; edgeArray: ptr vtkStaticEdgeLocatorTemplateEdgeTupleType): vtkIdType {.
    importcpp: "BuildLocator", header: "vtkStaticEdgeLocatorTemplate.h".}
proc IsInsertedEdge*[IDType; EdgeData](this: vtkStaticEdgeLocatorTemplate[IDType,
    EdgeData]; v0: IDType; v1: IDType): IDType {.noSideEffect,
    importcpp: "IsInsertedEdge", header: "vtkStaticEdgeLocatorTemplate.h".}
proc GetEdge*[IDType; EdgeData](this: vtkStaticEdgeLocatorTemplate[IDType, EdgeData];
                              i: IDType): vtkStaticEdgeLocatorTemplateEdgeTupleType {.
    noSideEffect, importcpp: "GetEdge", header: "vtkStaticEdgeLocatorTemplate.h".}
import
  vtkStaticEdgeLocatorTemplate

##  VTK-HeaderTest-Exclude: vtkStaticEdgeLocatorTemplate.h
