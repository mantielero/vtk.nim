## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderedHierarchyRepresentation.h
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
##  @class   vtkRenderedHierarchyRepresentation
##
##
##

import
  vtkRenderedGraphRepresentation, vtkViewsInfovisModule

type
  vtkRenderedHierarchyRepresentation* {.importcpp: "vtkRenderedHierarchyRepresentation", header: "vtkRenderedHierarchyRepresentation.h",
                                       bycopy.} = object of vtkRenderedGraphRepresentation
    vtkRenderedHierarchyRepresentation* {.
        importc: "vtkRenderedHierarchyRepresentation".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRenderedHierarchyRepresentation {.
    importcpp: "vtkRenderedHierarchyRepresentation::New(@)",
    header: "vtkRenderedHierarchyRepresentation.h".}
type
  vtkRenderedHierarchyRepresentationSuperclass* = vtkRenderedGraphRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderedHierarchyRepresentation::IsTypeOf(@)",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc IsA*(this: var vtkRenderedHierarchyRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderedHierarchyRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderedHierarchyRepresentation {.
    importcpp: "vtkRenderedHierarchyRepresentation::SafeDownCast(@)",
    header: "vtkRenderedHierarchyRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderedHierarchyRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderedGraphRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderedHierarchyRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderedHierarchyRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderedHierarchyRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeLabelArrayName*(this: var vtkRenderedHierarchyRepresentation;
                                name: cstring) {.
    importcpp: "SetGraphEdgeLabelArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeLabelArrayName*(this: var vtkRenderedHierarchyRepresentation;
                                name: cstring; idx: cint) {.
    importcpp: "SetGraphEdgeLabelArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeLabelArrayName*(this: var vtkRenderedHierarchyRepresentation): cstring {.
    importcpp: "GetGraphEdgeLabelArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeLabelArrayName*(this: var vtkRenderedHierarchyRepresentation;
                                idx: cint): cstring {.
    importcpp: "GetGraphEdgeLabelArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeLabelVisibility*(this: var vtkRenderedHierarchyRepresentation;
                                 vis: bool) {.
    importcpp: "SetGraphEdgeLabelVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeLabelVisibility*(this: var vtkRenderedHierarchyRepresentation;
                                 vis: bool; idx: cint) {.
    importcpp: "SetGraphEdgeLabelVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeLabelVisibility*(this: var vtkRenderedHierarchyRepresentation): bool {.
    importcpp: "GetGraphEdgeLabelVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeLabelVisibility*(this: var vtkRenderedHierarchyRepresentation;
                                 idx: cint): bool {.
    importcpp: "GetGraphEdgeLabelVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GraphEdgeLabelVisibilityOn*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "GraphEdgeLabelVisibilityOn",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GraphEdgeLabelVisibilityOff*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "GraphEdgeLabelVisibilityOff",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeColorArrayName*(this: var vtkRenderedHierarchyRepresentation;
                                name: cstring) {.
    importcpp: "SetGraphEdgeColorArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeColorArrayName*(this: var vtkRenderedHierarchyRepresentation;
                                name: cstring; idx: cint) {.
    importcpp: "SetGraphEdgeColorArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeColorArrayName*(this: var vtkRenderedHierarchyRepresentation): cstring {.
    importcpp: "GetGraphEdgeColorArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeColorArrayName*(this: var vtkRenderedHierarchyRepresentation;
                                idx: cint): cstring {.
    importcpp: "GetGraphEdgeColorArrayName",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetColorGraphEdgesByArray*(this: var vtkRenderedHierarchyRepresentation;
                               vis: bool) {.
    importcpp: "SetColorGraphEdgesByArray",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetColorGraphEdgesByArray*(this: var vtkRenderedHierarchyRepresentation;
                               vis: bool; idx: cint) {.
    importcpp: "SetColorGraphEdgesByArray",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetColorGraphEdgesByArray*(this: var vtkRenderedHierarchyRepresentation): bool {.
    importcpp: "GetColorGraphEdgesByArray",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetColorGraphEdgesByArray*(this: var vtkRenderedHierarchyRepresentation;
                               idx: cint): bool {.
    importcpp: "GetColorGraphEdgesByArray",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc ColorGraphEdgesByArrayOn*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "ColorGraphEdgesByArrayOn",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc ColorGraphEdgesByArrayOff*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "ColorGraphEdgesByArrayOff",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeColorToSplineFraction*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "SetGraphEdgeColorToSplineFraction",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeColorToSplineFraction*(this: var vtkRenderedHierarchyRepresentation;
                                       idx: cint) {.
    importcpp: "SetGraphEdgeColorToSplineFraction",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphVisibility*(this: var vtkRenderedHierarchyRepresentation; vis: bool) {.
    importcpp: "SetGraphVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphVisibility*(this: var vtkRenderedHierarchyRepresentation; vis: bool;
                        idx: cint) {.importcpp: "SetGraphVisibility", header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphVisibility*(this: var vtkRenderedHierarchyRepresentation): bool {.
    importcpp: "GetGraphVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphVisibility*(this: var vtkRenderedHierarchyRepresentation; idx: cint): bool {.
    importcpp: "GetGraphVisibility",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GraphVisibilityOn*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "GraphVisibilityOn", header: "vtkRenderedHierarchyRepresentation.h".}
proc GraphVisibilityOff*(this: var vtkRenderedHierarchyRepresentation) {.
    importcpp: "GraphVisibilityOff",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetBundlingStrength*(this: var vtkRenderedHierarchyRepresentation;
                         strength: cdouble) {.importcpp: "SetBundlingStrength",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetBundlingStrength*(this: var vtkRenderedHierarchyRepresentation;
                         strength: cdouble; idx: cint) {.
    importcpp: "SetBundlingStrength",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetBundlingStrength*(this: var vtkRenderedHierarchyRepresentation): cdouble {.
    importcpp: "GetBundlingStrength",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetBundlingStrength*(this: var vtkRenderedHierarchyRepresentation; idx: cint): cdouble {.
    importcpp: "GetBundlingStrength",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphSplineType*(this: var vtkRenderedHierarchyRepresentation; `type`: cint;
                        idx: cint) {.importcpp: "SetGraphSplineType", header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphSplineType*(this: var vtkRenderedHierarchyRepresentation; idx: cint): cint {.
    importcpp: "GetGraphSplineType",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeLabelFontSize*(this: var vtkRenderedHierarchyRepresentation;
                               size: cint) {.
    importcpp: "SetGraphEdgeLabelFontSize",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc SetGraphEdgeLabelFontSize*(this: var vtkRenderedHierarchyRepresentation;
                               size: cint; idx: cint) {.
    importcpp: "SetGraphEdgeLabelFontSize",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeLabelFontSize*(this: var vtkRenderedHierarchyRepresentation): cint {.
    importcpp: "GetGraphEdgeLabelFontSize",
    header: "vtkRenderedHierarchyRepresentation.h".}
proc GetGraphEdgeLabelFontSize*(this: var vtkRenderedHierarchyRepresentation;
                               idx: cint): cint {.
    importcpp: "GetGraphEdgeLabelFontSize",
    header: "vtkRenderedHierarchyRepresentation.h".}