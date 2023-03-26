## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalGraphPipeline.h
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
##  @class   vtkHierarchicalGraphPipeline
##  @brief   helper class for rendering graphs superimposed on a tree.
##
##
##  vtkHierarchicalGraphPipeline renders bundled edges that are meant to be
##  viewed as an overlay on a tree. This class is not for general use, but
##  is used in the internals of vtkRenderedHierarchyRepresentation and
##  vtkRenderedTreeAreaRepresentation.
##

import
  vtkObject, vtkViewsInfovisModule

discard "forward decl of vtkActor"
discard "forward decl of vtkActor2D"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkApplyColors"
discard "forward decl of vtkDataRepresentation"
discard "forward decl of vtkDynamic2DLabelMapper"
discard "forward decl of vtkEdgeCenters"
discard "forward decl of vtkGraphHierarchicalBundleEdges"
discard "forward decl of vtkGraphToPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkRenderView"
discard "forward decl of vtkSplineGraphEdges"
discard "forward decl of vtkSelection"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkViewTheme"
type
  vtkHierarchicalGraphPipeline* {.importcpp: "vtkHierarchicalGraphPipeline",
                                 header: "vtkHierarchicalGraphPipeline.h", bycopy.} = object of vtkObject
    vtkHierarchicalGraphPipeline* {.importc: "vtkHierarchicalGraphPipeline".}: VTK_NEWINSTANCE


proc New*(): ptr vtkHierarchicalGraphPipeline {.
    importcpp: "vtkHierarchicalGraphPipeline::New(@)",
    header: "vtkHierarchicalGraphPipeline.h".}
type
  vtkHierarchicalGraphPipelineSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHierarchicalGraphPipeline::IsTypeOf(@)",
    header: "vtkHierarchicalGraphPipeline.h".}
proc IsA*(this: var vtkHierarchicalGraphPipeline; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHierarchicalGraphPipeline.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHierarchicalGraphPipeline {.
    importcpp: "vtkHierarchicalGraphPipeline::SafeDownCast(@)",
    header: "vtkHierarchicalGraphPipeline.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHierarchicalGraphPipeline :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalGraphPipeline :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalGraphPipeline :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHierarchicalGraphPipeline; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHierarchicalGraphPipeline.h".}
proc GetnameActor*(this: var vtkHierarchicalGraphPipeline): ptr vtkActor {.
    importcpp: "GetnameActor", header: "vtkHierarchicalGraphPipeline.h".}
  ## /@}
  ## /@{
  ## *
  ##  The actor associated with the hierarchical graph.
  ##
proc GetnameActorLabelActor*(this: var vtkHierarchicalGraphPipeline): ptr vtkActor2D {.
    importcpp: "GetnameActorLabelActor", header: "vtkHierarchicalGraphPipeline.h".}
  ## /@}
  ## /@{
  ## *
  ##  The bundling strength for the bundled edges.
  ##
proc SetBundlingStrength*(this: var vtkHierarchicalGraphPipeline; strength: cdouble) {.
    importcpp: "SetBundlingStrength", header: "vtkHierarchicalGraphPipeline.h".}
proc GetBundlingStrength*(this: var vtkHierarchicalGraphPipeline): cdouble {.
    importcpp: "GetBundlingStrength", header: "vtkHierarchicalGraphPipeline.h".}
proc SetLabelArrayName*(this: var vtkHierarchicalGraphPipeline; name: cstring) {.
    importcpp: "SetLabelArrayName", header: "vtkHierarchicalGraphPipeline.h".}
proc GetLabelArrayName*(this: var vtkHierarchicalGraphPipeline): cstring {.
    importcpp: "GetLabelArrayName", header: "vtkHierarchicalGraphPipeline.h".}
proc SetLabelVisibility*(this: var vtkHierarchicalGraphPipeline; vis: bool) {.
    importcpp: "SetLabelVisibility", header: "vtkHierarchicalGraphPipeline.h".}
proc GetLabelVisibility*(this: var vtkHierarchicalGraphPipeline): bool {.
    importcpp: "GetLabelVisibility", header: "vtkHierarchicalGraphPipeline.h".}
proc LabelVisibilityOn*(this: var vtkHierarchicalGraphPipeline) {.
    importcpp: "LabelVisibilityOn", header: "vtkHierarchicalGraphPipeline.h".}
proc LabelVisibilityOff*(this: var vtkHierarchicalGraphPipeline) {.
    importcpp: "LabelVisibilityOff", header: "vtkHierarchicalGraphPipeline.h".}
  ## /@}
  ## /@{
  ## *
  ##  The edge label text property.
  ##
proc SetLabelTextProperty*(this: var vtkHierarchicalGraphPipeline;
                          prop: ptr vtkTextProperty) {.
    importcpp: "SetLabelTextProperty", header: "vtkHierarchicalGraphPipeline.h".}
proc GetLabelTextProperty*(this: var vtkHierarchicalGraphPipeline): ptr vtkTextProperty {.
    importcpp: "GetLabelTextProperty", header: "vtkHierarchicalGraphPipeline.h".}
proc SetColorArrayName*(this: var vtkHierarchicalGraphPipeline; name: cstring) {.
    importcpp: "SetColorArrayName", header: "vtkHierarchicalGraphPipeline.h".}
proc GetColorArrayName*(this: var vtkHierarchicalGraphPipeline): cstring {.
    importcpp: "GetColorArrayName", header: "vtkHierarchicalGraphPipeline.h".}
proc SetColorEdgesByArray*(this: var vtkHierarchicalGraphPipeline; vis: bool) {.
    importcpp: "SetColorEdgesByArray", header: "vtkHierarchicalGraphPipeline.h".}
proc GetColorEdgesByArray*(this: var vtkHierarchicalGraphPipeline): bool {.
    importcpp: "GetColorEdgesByArray", header: "vtkHierarchicalGraphPipeline.h".}
proc ColorEdgesByArrayOn*(this: var vtkHierarchicalGraphPipeline) {.
    importcpp: "ColorEdgesByArrayOn", header: "vtkHierarchicalGraphPipeline.h".}
proc ColorEdgesByArrayOff*(this: var vtkHierarchicalGraphPipeline) {.
    importcpp: "ColorEdgesByArrayOff", header: "vtkHierarchicalGraphPipeline.h".}
  ## /@}
  ## /@{
  ## *
  ##  The visibility of this graph.
  ##
proc SetVisibility*(this: var vtkHierarchicalGraphPipeline; vis: bool) {.
    importcpp: "SetVisibility", header: "vtkHierarchicalGraphPipeline.h".}
proc GetVisibility*(this: var vtkHierarchicalGraphPipeline): bool {.
    importcpp: "GetVisibility", header: "vtkHierarchicalGraphPipeline.h".}
proc VisibilityOn*(this: var vtkHierarchicalGraphPipeline) {.
    importcpp: "VisibilityOn", header: "vtkHierarchicalGraphPipeline.h".}
proc VisibilityOff*(this: var vtkHierarchicalGraphPipeline) {.
    importcpp: "VisibilityOff", header: "vtkHierarchicalGraphPipeline.h".}
  ## /@}
  ## *
  ##  Returns a new selection relevant to this graph based on an input
  ##  selection and the view that this graph is contained in.
  ##
proc ConvertSelection*(this: var vtkHierarchicalGraphPipeline;
                      rep: ptr vtkDataRepresentation; sel: ptr vtkSelection): ptr vtkSelection {.
    importcpp: "ConvertSelection", header: "vtkHierarchicalGraphPipeline.h".}
proc PrepareInputConnections*(this: var vtkHierarchicalGraphPipeline;
                             graphConn: ptr vtkAlgorithmOutput;
                             treeConn: ptr vtkAlgorithmOutput;
                             annConn: ptr vtkAlgorithmOutput) {.
    importcpp: "PrepareInputConnections", header: "vtkHierarchicalGraphPipeline.h".}
proc ApplyViewTheme*(this: var vtkHierarchicalGraphPipeline; theme: ptr vtkViewTheme) {.
    importcpp: "ApplyViewTheme", header: "vtkHierarchicalGraphPipeline.h".}
proc SetHoverArrayName*(this: var vtkHierarchicalGraphPipeline; _arg: cstring) {.
    importcpp: "SetHoverArrayName", header: "vtkHierarchicalGraphPipeline.h".}
proc GetHoverArrayName*(this: var vtkHierarchicalGraphPipeline): cstring {.
    importcpp: "GetHoverArrayName", header: "vtkHierarchicalGraphPipeline.h".}
  ## /@}
  ## /@{
  ## *
  ##  The spline mode to use in vtkSplineGraphEdges.
  ##  vtkSplineGraphEdges::CUSTOM uses a vtkCardinalSpline.
  ##  vtkSplineGraphEdges::BSPLINE uses a b-spline.
  ##  The default is BSPLINE.
  ##
proc SetSplineType*(this: var vtkHierarchicalGraphPipeline; `type`: cint) {.
    importcpp: "SetSplineType", header: "vtkHierarchicalGraphPipeline.h".}
proc GetSplineType*(this: var vtkHierarchicalGraphPipeline): cint {.
    importcpp: "GetSplineType", header: "vtkHierarchicalGraphPipeline.h".}
proc RegisterProgress*(this: var vtkHierarchicalGraphPipeline;
                      view: ptr vtkRenderView) {.importcpp: "RegisterProgress",
    header: "vtkHierarchicalGraphPipeline.h".}