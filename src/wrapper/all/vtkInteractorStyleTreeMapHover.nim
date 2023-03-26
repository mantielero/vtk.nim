## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleTreeMapHover.h
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
##  @class   vtkInteractorStyleTreeMapHover
##  @brief   An interactor style for a tree map view
##
##
##  The vtkInteractorStyleTreeMapHover specifically works with pipelines
##  that create a tree map.  Such pipelines will have a vtkTreeMapLayout
##  filter and a vtkTreeMapToPolyData filter, both of which must be passed
##  to this interactor style for it to function correctly.
##  This interactor style allows only 2D panning and zooming, and additionally
##  provides a balloon containing the name of the vertex hovered over,
##  and allows the user to highlight a vertex by clicking on it.
##

import
  vtkInteractorStyleImage, vtkViewsInfovisModule

discard "forward decl of vtkBalloonRepresentation"
discard "forward decl of vtkPoints"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTree"
discard "forward decl of vtkTreeMapLayout"
discard "forward decl of vtkTreeMapToPolyData"
discard "forward decl of vtkWorldPointPicker"
type
  vtkInteractorStyleTreeMapHover* {.importcpp: "vtkInteractorStyleTreeMapHover",
                                   header: "vtkInteractorStyleTreeMapHover.h",
                                   bycopy.} = object of vtkInteractorStyleImage
    vtkInteractorStyleTreeMapHover* {.importc: "vtkInteractorStyleTreeMapHover".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyleTreeMapHover {.
    importcpp: "vtkInteractorStyleTreeMapHover::New(@)",
    header: "vtkInteractorStyleTreeMapHover.h".}
type
  vtkInteractorStyleTreeMapHoverSuperclass* = vtkInteractorStyleImage

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleTreeMapHover::IsTypeOf(@)",
    header: "vtkInteractorStyleTreeMapHover.h".}
proc IsA*(this: var vtkInteractorStyleTreeMapHover; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleTreeMapHover.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleTreeMapHover {.
    importcpp: "vtkInteractorStyleTreeMapHover::SafeDownCast(@)",
    header: "vtkInteractorStyleTreeMapHover.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleTreeMapHover :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyleImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleTreeMapHover :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleTreeMapHover :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleTreeMapHover; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorStyleTreeMapHover.h".}
proc SetLayout*(this: var vtkInteractorStyleTreeMapHover;
               layout: ptr vtkTreeMapLayout) {.importcpp: "SetLayout",
    header: "vtkInteractorStyleTreeMapHover.h".}
proc GetnameLayout*(this: var vtkInteractorStyleTreeMapHover): ptr vtkTreeMapLayout {.
    importcpp: "GetnameLayout", header: "vtkInteractorStyleTreeMapHover.h".}
  ## /@}
  ## /@{
  ## *
  ##  Must be set to the vtkTreeMapToPolyData used to convert the tree map
  ##  into polydata.
  ##
proc SetTreeMapToPolyData*(this: var vtkInteractorStyleTreeMapHover;
                          filter: ptr vtkTreeMapToPolyData) {.
    importcpp: "SetTreeMapToPolyData", header: "vtkInteractorStyleTreeMapHover.h".}
proc GetnameLayoutTreeMapToPolyData*(this: var vtkInteractorStyleTreeMapHover): ptr vtkTreeMapToPolyData {.
    importcpp: "GetnameLayoutTreeMapToPolyData",
    header: "vtkInteractorStyleTreeMapHover.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the field to use when displaying text in the hover balloon.
  ##
proc SetLabelField*(this: var vtkInteractorStyleTreeMapHover; _arg: cstring) {.
    importcpp: "SetLabelField", header: "vtkInteractorStyleTreeMapHover.h".}
proc GetLabelField*(this: var vtkInteractorStyleTreeMapHover): cstring {.
    importcpp: "GetLabelField", header: "vtkInteractorStyleTreeMapHover.h".}
  ## /@}
  ## /@{
  ## *
  ##  Overridden from vtkInteractorStyleImage to provide the desired
  ##  interaction behavior.
  ##
proc OnMouseMove*(this: var vtkInteractorStyleTreeMapHover) {.
    importcpp: "OnMouseMove", header: "vtkInteractorStyleTreeMapHover.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyleTreeMapHover) {.
    importcpp: "OnLeftButtonUp", header: "vtkInteractorStyleTreeMapHover.h".}
proc HighLightItem*(this: var vtkInteractorStyleTreeMapHover; id: vtkIdType) {.
    importcpp: "HighLightItem", header: "vtkInteractorStyleTreeMapHover.h".}
proc HighLightCurrentSelectedItem*(this: var vtkInteractorStyleTreeMapHover) {.
    importcpp: "HighLightCurrentSelectedItem",
    header: "vtkInteractorStyleTreeMapHover.h".}
proc SetInteractor*(this: var vtkInteractorStyleTreeMapHover;
                   rwi: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkInteractorStyleTreeMapHover.h".}
proc SetHighLightColor*(this: var vtkInteractorStyleTreeMapHover; r: cdouble;
                       g: cdouble; b: cdouble) {.importcpp: "SetHighLightColor",
    header: "vtkInteractorStyleTreeMapHover.h".}
proc SetSelectionLightColor*(this: var vtkInteractorStyleTreeMapHover; r: cdouble;
                            g: cdouble; b: cdouble) {.
    importcpp: "SetSelectionLightColor",
    header: "vtkInteractorStyleTreeMapHover.h".}
proc SetHighLightWidth*(this: var vtkInteractorStyleTreeMapHover; lw: cdouble) {.
    importcpp: "SetHighLightWidth", header: "vtkInteractorStyleTreeMapHover.h".}
proc GetHighLightWidth*(this: var vtkInteractorStyleTreeMapHover): cdouble {.
    importcpp: "GetHighLightWidth", header: "vtkInteractorStyleTreeMapHover.h".}
proc SetSelectionWidth*(this: var vtkInteractorStyleTreeMapHover; lw: cdouble) {.
    importcpp: "SetSelectionWidth", header: "vtkInteractorStyleTreeMapHover.h".}
proc GetSelectionWidth*(this: var vtkInteractorStyleTreeMapHover): cdouble {.
    importcpp: "GetSelectionWidth", header: "vtkInteractorStyleTreeMapHover.h".}