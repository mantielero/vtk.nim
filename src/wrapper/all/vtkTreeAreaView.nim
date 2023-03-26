## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTreeAreaView.h
##
##   -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkTreeAreaView
##  @brief   Accepts a graph and a hierarchy - currently
##  a tree - and provides a hierarchy-aware display.  Currently, this means
##  displaying the hierarchy using a tree ring layout, then rendering the graph
##  vertices as leaves of the tree with curved graph edges between leaves.
##
##
##  Takes a graph and a hierarchy (currently a tree) and lays out the graph
##  vertices based on their categorization within the hierarchy.
##
##  .SEE ALSO
##  vtkGraphLayoutView
##
##  @par Thanks:
##  Thanks to Jason Shepherd for implementing this class
##

import
  vtkRenderView, vtkViewsInfovisModule

discard "forward decl of vtkAreaLayoutStrategy"
discard "forward decl of vtkGraph"
discard "forward decl of vtkLabeledDataMapper"
discard "forward decl of vtkPolyDataAlgorithm"
discard "forward decl of vtkRenderedTreeAreaRepresentation"
discard "forward decl of vtkTree"
type
  vtkTreeAreaView* {.importcpp: "vtkTreeAreaView", header: "vtkTreeAreaView.h",
                    bycopy.} = object of vtkRenderView
    vtkTreeAreaView* {.importc: "vtkTreeAreaView".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTreeAreaView {.importcpp: "vtkTreeAreaView::New(@)",
                               header: "vtkTreeAreaView.h".}
type
  vtkTreeAreaViewSuperclass* = vtkRenderView

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTreeAreaView::IsTypeOf(@)", header: "vtkTreeAreaView.h".}
proc IsA*(this: var vtkTreeAreaView; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTreeAreaView.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTreeAreaView {.
    importcpp: "vtkTreeAreaView::SafeDownCast(@)", header: "vtkTreeAreaView.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTreeAreaView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTreeAreaView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTreeAreaView :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTreeAreaView; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTreeAreaView.h".}
proc SetTreeFromInputConnection*(this: var vtkTreeAreaView;
                                conn: ptr vtkAlgorithmOutput): ptr vtkDataRepresentation {.
    importcpp: "SetTreeFromInputConnection", header: "vtkTreeAreaView.h".}
proc SetTreeFromInput*(this: var vtkTreeAreaView; input: ptr vtkTree): ptr vtkDataRepresentation {.
    importcpp: "SetTreeFromInput", header: "vtkTreeAreaView.h".}
proc SetGraphFromInputConnection*(this: var vtkTreeAreaView;
                                 conn: ptr vtkAlgorithmOutput): ptr vtkDataRepresentation {.
    importcpp: "SetGraphFromInputConnection", header: "vtkTreeAreaView.h".}
proc SetGraphFromInput*(this: var vtkTreeAreaView; input: ptr vtkGraph): ptr vtkDataRepresentation {.
    importcpp: "SetGraphFromInput", header: "vtkTreeAreaView.h".}
proc SetAreaLabelArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetAreaLabelArrayName", header: "vtkTreeAreaView.h".}
proc GetAreaLabelArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetAreaLabelArrayName", header: "vtkTreeAreaView.h".}
proc SetAreaSizeArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetAreaSizeArrayName", header: "vtkTreeAreaView.h".}
proc GetAreaSizeArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetAreaSizeArrayName", header: "vtkTreeAreaView.h".}
proc SetLabelPriorityArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetLabelPriorityArrayName", header: "vtkTreeAreaView.h".}
proc GetLabelPriorityArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetLabelPriorityArrayName", header: "vtkTreeAreaView.h".}
proc SetEdgeLabelArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetEdgeLabelArrayName", header: "vtkTreeAreaView.h".}
proc GetEdgeLabelArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetEdgeLabelArrayName", header: "vtkTreeAreaView.h".}
proc SetAreaHoverArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetAreaHoverArrayName", header: "vtkTreeAreaView.h".}
proc GetAreaHoverArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetAreaHoverArrayName", header: "vtkTreeAreaView.h".}
proc SetAreaLabelVisibility*(this: var vtkTreeAreaView; vis: bool) {.
    importcpp: "SetAreaLabelVisibility", header: "vtkTreeAreaView.h".}
proc GetAreaLabelVisibility*(this: var vtkTreeAreaView): bool {.
    importcpp: "GetAreaLabelVisibility", header: "vtkTreeAreaView.h".}
proc AreaLabelVisibilityOn*(this: var vtkTreeAreaView) {.
    importcpp: "AreaLabelVisibilityOn", header: "vtkTreeAreaView.h".}
proc AreaLabelVisibilityOff*(this: var vtkTreeAreaView) {.
    importcpp: "AreaLabelVisibilityOff", header: "vtkTreeAreaView.h".}
  ## /@}
  ## /@{
  ## *
  ##  Whether to show edge labels.  Default is off.
  ##
proc SetEdgeLabelVisibility*(this: var vtkTreeAreaView; vis: bool) {.
    importcpp: "SetEdgeLabelVisibility", header: "vtkTreeAreaView.h".}
proc GetEdgeLabelVisibility*(this: var vtkTreeAreaView): bool {.
    importcpp: "GetEdgeLabelVisibility", header: "vtkTreeAreaView.h".}
proc EdgeLabelVisibilityOn*(this: var vtkTreeAreaView) {.
    importcpp: "EdgeLabelVisibilityOn", header: "vtkTreeAreaView.h".}
proc EdgeLabelVisibilityOff*(this: var vtkTreeAreaView) {.
    importcpp: "EdgeLabelVisibilityOff", header: "vtkTreeAreaView.h".}
  ## /@}
  ## /@{
  ## *
  ##  The array to use for coloring vertices.  Default is "color".
  ##
proc SetAreaColorArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetAreaColorArrayName", header: "vtkTreeAreaView.h".}
proc GetAreaColorArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetAreaColorArrayName", header: "vtkTreeAreaView.h".}
proc SetColorAreas*(this: var vtkTreeAreaView; vis: bool) {.
    importcpp: "SetColorAreas", header: "vtkTreeAreaView.h".}
proc GetColorAreas*(this: var vtkTreeAreaView): bool {.importcpp: "GetColorAreas",
    header: "vtkTreeAreaView.h".}
proc ColorAreasOn*(this: var vtkTreeAreaView) {.importcpp: "ColorAreasOn",
    header: "vtkTreeAreaView.h".}
proc ColorAreasOff*(this: var vtkTreeAreaView) {.importcpp: "ColorAreasOff",
    header: "vtkTreeAreaView.h".}
  ## /@}
  ## /@{
  ## *
  ##  The array to use for coloring edges.  Default is "color".
  ##
proc SetEdgeColorArrayName*(this: var vtkTreeAreaView; name: cstring) {.
    importcpp: "SetEdgeColorArrayName", header: "vtkTreeAreaView.h".}
proc GetEdgeColorArrayName*(this: var vtkTreeAreaView): cstring {.
    importcpp: "GetEdgeColorArrayName", header: "vtkTreeAreaView.h".}
proc SetEdgeColorToSplineFraction*(this: var vtkTreeAreaView) {.
    importcpp: "SetEdgeColorToSplineFraction", header: "vtkTreeAreaView.h".}
proc SetShrinkPercentage*(this: var vtkTreeAreaView; value: cdouble) {.
    importcpp: "SetShrinkPercentage", header: "vtkTreeAreaView.h".}
proc GetShrinkPercentage*(this: var vtkTreeAreaView): cdouble {.
    importcpp: "GetShrinkPercentage", header: "vtkTreeAreaView.h".}
proc SetColorEdges*(this: var vtkTreeAreaView; vis: bool) {.
    importcpp: "SetColorEdges", header: "vtkTreeAreaView.h".}
proc GetColorEdges*(this: var vtkTreeAreaView): bool {.importcpp: "GetColorEdges",
    header: "vtkTreeAreaView.h".}
proc ColorEdgesOn*(this: var vtkTreeAreaView) {.importcpp: "ColorEdgesOn",
    header: "vtkTreeAreaView.h".}
proc ColorEdgesOff*(this: var vtkTreeAreaView) {.importcpp: "ColorEdgesOff",
    header: "vtkTreeAreaView.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the bundling strength.
  ##
proc SetBundlingStrength*(this: var vtkTreeAreaView; strength: cdouble) {.
    importcpp: "SetBundlingStrength", header: "vtkTreeAreaView.h".}
proc GetBundlingStrength*(this: var vtkTreeAreaView): cdouble {.
    importcpp: "GetBundlingStrength", header: "vtkTreeAreaView.h".}
proc SetAreaLabelFontSize*(this: var vtkTreeAreaView; size: cint) {.
    importcpp: "SetAreaLabelFontSize", header: "vtkTreeAreaView.h".}
proc GetAreaLabelFontSize*(this: var vtkTreeAreaView): cint {.
    importcpp: "GetAreaLabelFontSize", header: "vtkTreeAreaView.h".}
proc SetEdgeLabelFontSize*(this: var vtkTreeAreaView; size: cint) {.
    importcpp: "SetEdgeLabelFontSize", header: "vtkTreeAreaView.h".}
proc GetEdgeLabelFontSize*(this: var vtkTreeAreaView): cint {.
    importcpp: "GetEdgeLabelFontSize", header: "vtkTreeAreaView.h".}
proc SetLayoutStrategy*(this: var vtkTreeAreaView;
                       strategy: ptr vtkAreaLayoutStrategy) {.
    importcpp: "SetLayoutStrategy", header: "vtkTreeAreaView.h".}
proc GetLayoutStrategy*(this: var vtkTreeAreaView): ptr vtkAreaLayoutStrategy {.
    importcpp: "GetLayoutStrategy", header: "vtkTreeAreaView.h".}
proc SetUseRectangularCoordinates*(this: var vtkTreeAreaView; rect: bool) {.
    importcpp: "SetUseRectangularCoordinates", header: "vtkTreeAreaView.h".}
proc GetUseRectangularCoordinates*(this: var vtkTreeAreaView): bool {.
    importcpp: "GetUseRectangularCoordinates", header: "vtkTreeAreaView.h".}
proc UseRectangularCoordinatesOn*(this: var vtkTreeAreaView) {.
    importcpp: "UseRectangularCoordinatesOn", header: "vtkTreeAreaView.h".}
proc UseRectangularCoordinatesOff*(this: var vtkTreeAreaView) {.
    importcpp: "UseRectangularCoordinatesOff", header: "vtkTreeAreaView.h".}
  ## /@}
  ## /@{
  ## *
  ##  Visibility of scalar bar actor for edges.
  ##
proc SetEdgeScalarBarVisibility*(this: var vtkTreeAreaView; b: bool) {.
    importcpp: "SetEdgeScalarBarVisibility", header: "vtkTreeAreaView.h".}
proc GetEdgeScalarBarVisibility*(this: var vtkTreeAreaView): bool {.
    importcpp: "GetEdgeScalarBarVisibility", header: "vtkTreeAreaView.h".}