## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkTessellatorFilter.h
## Language:  C++
##
## Copyright 2003 Sandia Corporation.
## Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
## license for use of this work by or on behalf of the
## U.S. Government. Redistribution and use in source and binary forms, with
## or without modification, are permitted provided that this Notice and any
## statement of authorship are reproduced on all copies.
##
## =========================================================================

## *
##  @class   vtkTessellatorFilter
##  @brief   approximate nonlinear FEM elements with simplices
##
##  This class approximates nonlinear FEM elements with linear simplices.
##
##  <b>Warning</b>: This class is temporary and will go away at some point
##  after ParaView 1.4.0.
##
##  This filter rifles through all the cells in an input vtkDataSet. It
##  tesselates each cell and uses the vtkStreamingTessellator and
##  vtkDataSetEdgeSubdivisionCriterion classes to generate simplices that
##  approximate the nonlinear mesh using some approximation metric (encoded
##  in the particular vtkDataSetEdgeSubdivisionCriterion::EvaluateLocationAndFields
##  implementation). The simplices are placed into the filter's output
##  vtkDataSet object by the callback routines AddATetrahedron,
##  AddATriangle, and AddALine, which are registered with the triangulator.
##
##  The output mesh will have geometry and any fields specified as
##  attributes in the input mesh's point data.  The attribute's copy flags
##  are honored, except for normals.
##
##
##  @par Internals:
##  The filter's main member function is RequestData(). This function first
##  calls SetupOutput() which allocates arrays and some temporary variables
##  for the primitive callbacks (OutputTriangle and OutputLine which are
##  called by AddATriangle and AddALine, respectively).  Each cell is given
##  an initial tessellation, which results in one or more calls to
##  OutputTetrahedron, OutputTriangle or OutputLine to add elements to the
##  OutputMesh. Finally, Teardown() is called to free the filter's working
##  space.
##
##  @sa
##  vtkDataSetToUnstructuredGridFilter vtkDataSet vtkStreamingTessellator
##  vtkDataSetEdgeSubdivisionCriterion
##

import
  vtkFiltersGeneralModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetEdgeSubdivisionCriterion"
discard "forward decl of vtkPointLocator"
discard "forward decl of vtkPoints"
discard "forward decl of vtkStreamingTessellator"
discard "forward decl of vtkEdgeSubdivisionCriterion"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkTessellatorFilter* {.importcpp: "vtkTessellatorFilter",
                         header: "vtkTessellatorFilter.h", bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkTessellatorFilter* {.importc: "vtkTessellatorFilter".}: VTK_NEWINSTANCE
    ## /@{
    ## *
    ##  These member variables are set by SetupOutput for use inside the
    ##  callback members OutputLine and OutputTriangle.
    ##
    ## /@}

  vtkTessellatorFilterSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTessellatorFilter::IsTypeOf(@)",
    header: "vtkTessellatorFilter.h".}
proc IsA*(this: var vtkTessellatorFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTessellatorFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTessellatorFilter {.
    importcpp: "vtkTessellatorFilter::SafeDownCast(@)",
    header: "vtkTessellatorFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTessellatorFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTessellatorFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTessellatorFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTessellatorFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTessellatorFilter.h".}
proc New*(): ptr vtkTessellatorFilter {.importcpp: "vtkTessellatorFilter::New(@)",
                                    header: "vtkTessellatorFilter.h".}
proc SetTessellator*(this: var vtkTessellatorFilter; a2: ptr vtkStreamingTessellator) {.
    importcpp: "SetTessellator", header: "vtkTessellatorFilter.h".}
proc GetnameTessellator*(this: var vtkTessellatorFilter): ptr vtkStreamingTessellator {.
    importcpp: "GetnameTessellator", header: "vtkTessellatorFilter.h".}
proc SetSubdivider*(this: var vtkTessellatorFilter;
                   a2: ptr vtkDataSetEdgeSubdivisionCriterion) {.
    importcpp: "SetSubdivider", header: "vtkTessellatorFilter.h".}
proc GetnameTessellatorSubdivider*(this: var vtkTessellatorFilter): ptr vtkDataSetEdgeSubdivisionCriterion {.
    importcpp: "GetnameTessellatorSubdivider", header: "vtkTessellatorFilter.h".}
proc GetMTime*(this: var vtkTessellatorFilter): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkTessellatorFilter.h".}
proc SetOutputDimension*(this: var vtkTessellatorFilter; _arg: cint) {.
    importcpp: "SetOutputDimension", header: "vtkTessellatorFilter.h".}
proc GetOutputDimensionMinValue*(this: var vtkTessellatorFilter): cint {.
    importcpp: "GetOutputDimensionMinValue", header: "vtkTessellatorFilter.h".}
proc GetOutputDimensionMaxValue*(this: var vtkTessellatorFilter): cint {.
    importcpp: "GetOutputDimensionMaxValue", header: "vtkTessellatorFilter.h".}
## !!!Ignored construct:  virtual int GetOutputDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimension  of  << this -> OutputDimension ) ; return this -> OutputDimension ; } ;
## Error: expected ';'!!!

when not VTK_USE_FUTURE_CONST:
  proc GetOutputDimension*(this: vtkTessellatorFilter): cint {.noSideEffect,
      importcpp: "GetOutputDimension", header: "vtkTessellatorFilter.h".}
proc SetMaximumNumberOfSubdivisions*(this: var vtkTessellatorFilter;
                                    num_subdiv_in: cint) {.
    importcpp: "SetMaximumNumberOfSubdivisions", header: "vtkTessellatorFilter.h".}
proc GetMaximumNumberOfSubdivisions*(this: var vtkTessellatorFilter): cint {.
    importcpp: "GetMaximumNumberOfSubdivisions", header: "vtkTessellatorFilter.h".}
proc SetChordError*(this: var vtkTessellatorFilter; ce: cdouble) {.
    importcpp: "SetChordError", header: "vtkTessellatorFilter.h".}
proc GetChordError*(this: var vtkTessellatorFilter): cdouble {.
    importcpp: "GetChordError", header: "vtkTessellatorFilter.h".}
proc ResetFieldCriteria*(this: var vtkTessellatorFilter) {.
    importcpp: "ResetFieldCriteria", header: "vtkTessellatorFilter.h".}
proc SetFieldCriterion*(this: var vtkTessellatorFilter; field: cint; err: cdouble) {.
    importcpp: "SetFieldCriterion", header: "vtkTessellatorFilter.h".}
## !!!Ignored construct:  /@} /@{ *
##  The adaptive tessellation will output vertices that are not shared
##  among cells, even where they should be. This can be corrected to
##  some extents with a vtkMergeFilter.
##  By default, the filter is off and vertices will not be shared.
##  virtual vtkTypeBool GetOutputDimensionMergePointsMergePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePoints  of  << this -> MergePoints ) ; return this -> MergePoints ; } ;
## Error: expected ';'!!!

proc SetMergePoints*(this: var vtkTessellatorFilter; _arg: vtkTypeBool) {.
    importcpp: "SetMergePoints", header: "vtkTessellatorFilter.h".}
proc MergePointsOn*(this: var vtkTessellatorFilter) {.importcpp: "MergePointsOn",
    header: "vtkTessellatorFilter.h".}
proc MergePointsOff*(this: var vtkTessellatorFilter) {.importcpp: "MergePointsOff",
    header: "vtkTessellatorFilter.h".}
  ## /@}
##  With VTK_USE_FUTURE_CONST, vtkGetMacro already makes the member const.

when not VTK_USE_FUTURE_CONST:
  proc GetOutputDimension*(this: vtkTessellatorFilter): cint {.noSideEffect,
      importcpp: "GetOutputDimension", header: "vtkTessellatorFilter.h".}