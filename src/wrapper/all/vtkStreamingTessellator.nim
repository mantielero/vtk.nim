## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStreamingTessellator.h
##   Language:  C++
##
##   Copyright 2003 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##   license for use of this work by or on behalf of the
##   U.S. Government. Redistribution and use in source and binary forms, with
##   or without modification, are permitted provided that this Notice and any
##   statement of authorship are reproduced on all copies.
##
## =========================================================================
## *
##  @class   vtkStreamingTessellator
##  @brief   An algorithm that refines an initial simplicial tessellation using edge subdivision
##
##  This class is a simple algorithm that takes a single starting simplex -- a
##  tetrahedron, triangle, or line segment -- and calls a function you
##  pass it with (possibly many times) tetrahedra, triangles, or lines
##  adaptively sampled from the one you specified. It
##  uses an algorithm you specify to control the level of adaptivity.
##
##  This class does not create vtkUnstructuredGrid output because it is
##  intended for use in mappers as well as filters. Instead, it
##  calls the registered function with simplices as they are
##  created.
##
##  The subdivision algorithm should change the vertex
##  coordinates (it must change both geometric and, if desired, parametric
##  coordinates) of the midpoint. These coordinates need not be
##  changed unless the EvaluateLocationAndFields() member returns true.
##  The vtkStreamingTessellator itself has no way of creating
##  a more accurate midpoint vertex.
##
##  Here's how to use this class:
##  - Call AdaptivelySample1Facet, AdaptivelySample2Facet, or
##    AdaptivelySample3Facet, with an edge, triangle, or
##    tetrahedron you want tessellated.
##  - The adaptive tessellator classifies each edge by passing
##    the midpoint values to the vtkEdgeSubdivisionCriterion.
##  - After each edge is classified, the tessellator subdivides
##    edges as required until the subdivision criterion is
##    satisfied or the maximum subdivision depth has been
##    reached.
##  - Edges, triangles, or tetrahedra connecting the vertices
##    generated by the subdivision algorithm are processed by
##    calling the user-defined callback functions (set with
##    SetTetrahedronCallback(), SetTriangleCallback(),
##    or SetEdgeCallback() ).
##
##  @warning
##  Note that the vertices passed to AdaptivelySample3Facet, AdaptivelySample2Facet,
##  or AdaptivelySample1Facet must be at least 6, 5, or 4 entries long, respectively!
##  This is because the &lt;r,s,t&gt;, &lt;r,s&gt;, or &lt;r&gt;
##  parametric coordinates of the vertices are maintained as the
##  facet is subdivided. This information is often
##  required by the subdivision algorithm in order to compute
##  an error metric. You may change the number of parametric coordinates
##  associated with each vertex using vtkStreamingTessellator::SetEmbeddingDimension().
##
##  @par Interpolating Field Values:
##  If you wish, you may also use \p vtkStreamingTessellator to interpolate field
##  values at newly created vertices. Interpolated field values are stored just beyond
##  the parametric coordinates associated with a vertex. They will always be \p double
##  values; it does not make sense to interpolate a boolean or string value and your
##  output and subdivision subroutines may always cast to a \p float or use \p floor() to
##  truncate an interpolated value to an integer.
##
##  @sa
##  vtkEdgeSubdivisionCriterion
##

import
  vtkFiltersCoreModule, vtkObject

discard "forward decl of vtkEdgeSubdivisionCriterion"
type
  vtkStreamingTessellator* {.importcpp: "vtkStreamingTessellator",
                            header: "vtkStreamingTessellator.h", bycopy.} = object of vtkObject
    vtkStreamingTessellator* {.importc: "vtkStreamingTessellator".}: VTK_NEWINSTANCE
    PrivateData* {.importc: "PrivateData".}: pointer
    ConstPrivateData* {.importc: "ConstPrivateData".}: pointer
    Algorithm* {.importc: "Algorithm".}: ptr vtkEdgeSubdivisionCriterion
    Callback0* {.importc: "Callback0".}: vtkStreamingTessellatorVertexProcessorFunction
    Callback1* {.importc: "Callback1".}: vtkStreamingTessellatorEdgeProcessorFunction
    Callback2* {.importc: "Callback2".}: vtkStreamingTessellatorTriangleProcessorFunction
    Callback3* {.importc: "Callback3".}: vtkStreamingTessellatorTetrahedronProcessorFunction
    when defined(PARAVIEW_DEBUG_TESSELLATOR):
      CaseCounts* {.importc: "CaseCounts".}: array[11, vtkIdType]
    when defined(PARAVIEW_DEBUG_TESSELLATOR):
      SubcaseCounts* {.importc: "SubcaseCounts".}: array[11, array[51, vtkIdType]]
    PointDimension* {.importc: "PointDimension".}: array[4, cint] ## *
                                                             ##  The parametric dimension of each point passed to the subdivision algorithm.
                                                             ##  Only entries 1 through 3 are used; you can't subdivide 0-facets (points).
                                                             ##  Well, maybe <i>you</i> can, but <i>I</i> can't!
                                                             ##
    EmbeddingDimension* {.importc: "EmbeddingDimension".}: array[4, cint] ## *
                                                                     ##  The number of subdivisions allowed.
                                                                     ##
    MaximumNumberOfSubdivisions* {.importc: "MaximumNumberOfSubdivisions".}: cint

  vtkStreamingTessellatorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStreamingTessellator::IsTypeOf(@)",
    header: "vtkStreamingTessellator.h".}
proc IsA*(this: var vtkStreamingTessellator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStreamingTessellator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStreamingTessellator {.
    importcpp: "vtkStreamingTessellator::SafeDownCast(@)",
    header: "vtkStreamingTessellator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStreamingTessellator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStreamingTessellator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStreamingTessellator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkStreamingTessellator {.importcpp: "vtkStreamingTessellator::New(@)",
                                       header: "vtkStreamingTessellator.h".}
proc PrintSelf*(this: var vtkStreamingTessellator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStreamingTessellator.h".}
type
  vtkStreamingTessellatorVertexProcessorFunction* = proc (a1: ptr cdouble;
      a2: ptr vtkEdgeSubdivisionCriterion; a3: pointer; a4: pointer)
  vtkStreamingTessellatorEdgeProcessorFunction* = proc (a1: ptr cdouble;
      a2: ptr cdouble; a3: ptr vtkEdgeSubdivisionCriterion; a4: pointer; a5: pointer)
  vtkStreamingTessellatorTriangleProcessorFunction* = proc (a1: ptr cdouble;
      a2: ptr cdouble; a3: ptr cdouble; a4: ptr vtkEdgeSubdivisionCriterion; a5: pointer;
      a6: pointer)
  vtkStreamingTessellatorTetrahedronProcessorFunction* = proc (a1: ptr cdouble;
      a2: ptr cdouble; a3: ptr cdouble; a4: ptr cdouble;
      a5: ptr vtkEdgeSubdivisionCriterion; a6: pointer; a7: pointer)

const
  vtkStreamingTessellatorMaxFieldSize* = 18

proc SetTetrahedronCallback*(this: var vtkStreamingTessellator; a2: vtkStreamingTessellatorTetrahedronProcessorFunction) {.
    importcpp: "SetTetrahedronCallback", header: "vtkStreamingTessellator.h".}
proc GetTetrahedronCallback*(this: vtkStreamingTessellator): vtkStreamingTessellatorTetrahedronProcessorFunction {.
    noSideEffect, importcpp: "GetTetrahedronCallback",
    header: "vtkStreamingTessellator.h".}
proc SetTriangleCallback*(this: var vtkStreamingTessellator;
                         a2: vtkStreamingTessellatorTriangleProcessorFunction) {.
    importcpp: "SetTriangleCallback", header: "vtkStreamingTessellator.h".}
proc GetTriangleCallback*(this: vtkStreamingTessellator): vtkStreamingTessellatorTriangleProcessorFunction {.
    noSideEffect, importcpp: "GetTriangleCallback",
    header: "vtkStreamingTessellator.h".}
proc SetEdgeCallback*(this: var vtkStreamingTessellator;
                     a2: vtkStreamingTessellatorEdgeProcessorFunction) {.
    importcpp: "SetEdgeCallback", header: "vtkStreamingTessellator.h".}
proc GetEdgeCallback*(this: vtkStreamingTessellator): vtkStreamingTessellatorEdgeProcessorFunction {.
    noSideEffect, importcpp: "GetEdgeCallback", header: "vtkStreamingTessellator.h".}
proc SetVertexCallback*(this: var vtkStreamingTessellator;
                       a2: vtkStreamingTessellatorVertexProcessorFunction) {.
    importcpp: "SetVertexCallback", header: "vtkStreamingTessellator.h".}
proc GetVertexCallback*(this: vtkStreamingTessellator): vtkStreamingTessellatorVertexProcessorFunction {.
    noSideEffect, importcpp: "GetVertexCallback",
    header: "vtkStreamingTessellator.h".}
proc SetPrivateData*(this: var vtkStreamingTessellator; Private: pointer) {.
    importcpp: "SetPrivateData", header: "vtkStreamingTessellator.h".}
proc GetPrivateData*(this: vtkStreamingTessellator): pointer {.noSideEffect,
    importcpp: "GetPrivateData", header: "vtkStreamingTessellator.h".}
proc SetConstPrivateData*(this: var vtkStreamingTessellator; ConstPrivate: pointer) {.
    importcpp: "SetConstPrivateData", header: "vtkStreamingTessellator.h".}
proc GetConstPrivateData*(this: vtkStreamingTessellator): pointer {.noSideEffect,
    importcpp: "GetConstPrivateData", header: "vtkStreamingTessellator.h".}
proc SetSubdivisionAlgorithm*(this: var vtkStreamingTessellator;
                             a2: ptr vtkEdgeSubdivisionCriterion) {.
    importcpp: "SetSubdivisionAlgorithm", header: "vtkStreamingTessellator.h".}
proc GetSubdivisionAlgorithm*(this: var vtkStreamingTessellator): ptr vtkEdgeSubdivisionCriterion {.
    importcpp: "GetSubdivisionAlgorithm", header: "vtkStreamingTessellator.h".}
proc GetSubdivisionAlgorithm*(this: vtkStreamingTessellator): ptr vtkEdgeSubdivisionCriterion {.
    noSideEffect, importcpp: "GetSubdivisionAlgorithm",
    header: "vtkStreamingTessellator.h".}
proc SetEmbeddingDimension*(this: var vtkStreamingTessellator; k: cint; d: cint) {.
    importcpp: "SetEmbeddingDimension", header: "vtkStreamingTessellator.h".}
proc GetEmbeddingDimension*(this: vtkStreamingTessellator; k: cint): cint {.
    noSideEffect, importcpp: "GetEmbeddingDimension",
    header: "vtkStreamingTessellator.h".}
proc SetFieldSize*(this: var vtkStreamingTessellator; k: cint; s: cint) {.
    importcpp: "SetFieldSize", header: "vtkStreamingTessellator.h".}
proc GetFieldSize*(this: vtkStreamingTessellator; k: cint): cint {.noSideEffect,
    importcpp: "GetFieldSize", header: "vtkStreamingTessellator.h".}
proc SetMaximumNumberOfSubdivisions*(this: var vtkStreamingTessellator;
                                    num_subdiv_in: cint) {.
    importcpp: "SetMaximumNumberOfSubdivisions",
    header: "vtkStreamingTessellator.h".}
proc GetMaximumNumberOfSubdivisions*(this: var vtkStreamingTessellator): cint {.
    importcpp: "GetMaximumNumberOfSubdivisions",
    header: "vtkStreamingTessellator.h".}
proc AdaptivelySample3FacetLinear*(this: vtkStreamingTessellator; v0: ptr cdouble;
                                  v1: ptr cdouble; v2: ptr cdouble; v3: ptr cdouble) {.
    noSideEffect, importcpp: "AdaptivelySample3FacetLinear",
    header: "vtkStreamingTessellator.h".}
proc AdaptivelySample2FacetLinear*(this: vtkStreamingTessellator; v0: ptr cdouble;
                                  v1: ptr cdouble; v2: ptr cdouble) {.noSideEffect,
    importcpp: "AdaptivelySample2FacetLinear", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample1FacetLinear*(this: vtkStreamingTessellator; v0: ptr cdouble;
                                  v1: ptr cdouble) {.noSideEffect,
    importcpp: "AdaptivelySample1FacetLinear", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample3Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; v2: ptr cdouble; v3: ptr cdouble) {.
    noSideEffect, importcpp: "AdaptivelySample3Facet",
    header: "vtkStreamingTessellator.h".}
proc AdaptivelySample2Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; v2: ptr cdouble) {.noSideEffect,
    importcpp: "AdaptivelySample2Facet", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample1Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble) {.noSideEffect,
    importcpp: "AdaptivelySample1Facet", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample0Facet*(this: vtkStreamingTessellator; v0: ptr cdouble) {.
    noSideEffect, importcpp: "AdaptivelySample0Facet",
    header: "vtkStreamingTessellator.h".}
proc ResetCounts*(this: var vtkStreamingTessellator) {.importcpp: "ResetCounts",
    header: "vtkStreamingTessellator.h".}
## !!!Ignored construct:  [NewLine] vtkIdType GetCaseCount ( int c ) { # PARAVIEW_DEBUG_TESSELLATOR [NewLine] return this -> CaseCounts [ c ] ; # [NewLine] ( void ) c ; return 0 ; #  PARAVIEW_DEBUG_TESSELLATOR } [NewLine] vtkIdType GetSubcaseCount ( int casenum , int sub ) { # PARAVIEW_DEBUG_TESSELLATOR [NewLine] return this -> SubcaseCounts [ casenum ] [ sub ] ; # [NewLine] ( void ) casenum ; ( void ) sub ; return 0 ; #  PARAVIEW_DEBUG_TESSELLATOR } [NewLine] /@} protected : static int EdgeCodesToCaseCodesPlusPermutation [ 64 ] [ 2 ] ;
## Error: identifier expected, but got: [NewLine]!!!

proc constructvtkStreamingTessellator*(): vtkStreamingTessellator {.constructor,
    importcpp: "vtkStreamingTessellator(@)", header: "vtkStreamingTessellator.h".}
proc destroyvtkStreamingTessellator*(this: var vtkStreamingTessellator) {.
    importcpp: "#.~vtkStreamingTessellator()", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample3Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; v2: ptr cdouble; v3: ptr cdouble;
                            maxDepth: cint) {.noSideEffect,
    importcpp: "AdaptivelySample3Facet", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample2Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; v2: ptr cdouble; maxDepth: cint;
                            move: cint = 7) {.noSideEffect,
    importcpp: "AdaptivelySample2Facet", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample1Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; maxDepth: cint) {.noSideEffect,
    importcpp: "AdaptivelySample1Facet", header: "vtkStreamingTessellator.h".}
proc BestTets*(this: vtkStreamingTessellator; a2: ptr cint; a3: ptr ptr cdouble; a4: cint;
              a5: cint): cint {.noSideEffect, importcpp: "BestTets",
                             header: "vtkStreamingTessellator.h".}
proc AdaptivelySample3Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; v2: ptr cdouble; v3: ptr cdouble) {.
    noSideEffect, importcpp: "AdaptivelySample3Facet",
    header: "vtkStreamingTessellator.h".}
proc AdaptivelySample2Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble; v2: ptr cdouble) {.noSideEffect,
    importcpp: "AdaptivelySample2Facet", header: "vtkStreamingTessellator.h".}
proc AdaptivelySample1Facet*(this: vtkStreamingTessellator; v0: ptr cdouble;
                            v1: ptr cdouble) {.noSideEffect,
    importcpp: "AdaptivelySample1Facet", header: "vtkStreamingTessellator.h".}
proc GetEmbeddingDimension*(this: vtkStreamingTessellator; k: cint): cint {.
    noSideEffect, importcpp: "GetEmbeddingDimension",
    header: "vtkStreamingTessellator.h".}
proc GetFieldSize*(this: vtkStreamingTessellator; k: cint): cint {.noSideEffect,
    importcpp: "GetFieldSize", header: "vtkStreamingTessellator.h".}
proc GetMaximumNumberOfSubdivisions*(this: var vtkStreamingTessellator): cint {.
    importcpp: "GetMaximumNumberOfSubdivisions",
    header: "vtkStreamingTessellator.h".}