## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleAreaSelectHover.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkInteractorStyleAreaSelectHover
##  @brief   An interactor style for an area tree view
##
##
##  The vtkInteractorStyleAreaSelectHover specifically works with pipelines
##  that create a hierarchical tree.  Such pipelines will have a vtkAreaLayout
##  filter which must be passed to this interactor style for it to function
##  correctly.
##  This interactor style allows only 2D panning and zooming,
##  rubber band selection and provides a balloon containing the name of the
##  vertex hovered over.
##

import
  vtkInteractorStyleRubberBand2D, vtkViewsInfovisModule

discard "forward decl of vtkAreaLayout"
discard "forward decl of vtkBalloonRepresentation"
discard "forward decl of vtkPoints"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkTree"
discard "forward decl of vtkWorldPointPicker"
discard "forward decl of vtkPolyData"
type
  vtkInteractorStyleAreaSelectHover* {.importcpp: "vtkInteractorStyleAreaSelectHover", header: "vtkInteractorStyleAreaSelectHover.h",
                                      bycopy.} = object of vtkInteractorStyleRubberBand2D
    vtkInteractorStyleAreaSelectHover* {.importc: "vtkInteractorStyleAreaSelectHover".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyleAreaSelectHover {.
    importcpp: "vtkInteractorStyleAreaSelectHover::New(@)",
    header: "vtkInteractorStyleAreaSelectHover.h".}
type
  vtkInteractorStyleAreaSelectHoverSuperclass* = vtkInteractorStyleRubberBand2D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleAreaSelectHover::IsTypeOf(@)",
    header: "vtkInteractorStyleAreaSelectHover.h".}
proc IsA*(this: var vtkInteractorStyleAreaSelectHover; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleAreaSelectHover.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleAreaSelectHover {.
    importcpp: "vtkInteractorStyleAreaSelectHover::SafeDownCast(@)",
    header: "vtkInteractorStyleAreaSelectHover.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleAreaSelectHover :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyleRubberBand2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleAreaSelectHover :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleAreaSelectHover :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleAreaSelectHover; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorStyleAreaSelectHover.h".}
proc SetLayout*(this: var vtkInteractorStyleAreaSelectHover;
               layout: ptr vtkAreaLayout) {.importcpp: "SetLayout",
    header: "vtkInteractorStyleAreaSelectHover.h".}
proc GetnameLayout*(this: var vtkInteractorStyleAreaSelectHover): ptr vtkAreaLayout {.
    importcpp: "GetnameLayout", header: "vtkInteractorStyleAreaSelectHover.h".}
  ## /@}
  ## /@{
  ## *
  ##  The name of the field to use when displaying text in the hover balloon.
  ##
proc SetLabelField*(this: var vtkInteractorStyleAreaSelectHover; _arg: cstring) {.
    importcpp: "SetLabelField", header: "vtkInteractorStyleAreaSelectHover.h".}
proc GetLabelField*(this: var vtkInteractorStyleAreaSelectHover): cstring {.
    importcpp: "GetLabelField", header: "vtkInteractorStyleAreaSelectHover.h".}
  ## /@}
  ## /@{
  ## *
  ##  Determine whether or not to use rectangular coordinates instead of
  ##  polar coordinates.
  ##
proc SetUseRectangularCoordinates*(this: var vtkInteractorStyleAreaSelectHover;
                                  _arg: bool) {.
    importcpp: "SetUseRectangularCoordinates",
    header: "vtkInteractorStyleAreaSelectHover.h".}
## !!!Ignored construct:  virtual bool GetUseRectangularCoordinates ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRectangularCoordinates  of  << this -> UseRectangularCoordinates ) ; return this -> UseRectangularCoordinates ; } ;
## Error: expected ';'!!!

proc UseRectangularCoordinatesOn*(this: var vtkInteractorStyleAreaSelectHover) {.
    importcpp: "UseRectangularCoordinatesOn",
    header: "vtkInteractorStyleAreaSelectHover.h".}
proc UseRectangularCoordinatesOff*(this: var vtkInteractorStyleAreaSelectHover) {.
    importcpp: "UseRectangularCoordinatesOff",
    header: "vtkInteractorStyleAreaSelectHover.h".}
  ## /@}
  ## *
  ##  Overridden from vtkInteractorStyleImage to provide the desired
  ##  interaction behavior.
  ##
proc OnMouseMove*(this: var vtkInteractorStyleAreaSelectHover) {.
    importcpp: "OnMouseMove", header: "vtkInteractorStyleAreaSelectHover.h".}
proc SetInteractor*(this: var vtkInteractorStyleAreaSelectHover;
                   rwi: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkInteractorStyleAreaSelectHover.h".}
proc SetHighLightColor*(this: var vtkInteractorStyleAreaSelectHover; r: cdouble;
                       g: cdouble; b: cdouble) {.importcpp: "SetHighLightColor",
    header: "vtkInteractorStyleAreaSelectHover.h".}
proc SetHighLightWidth*(this: var vtkInteractorStyleAreaSelectHover; lw: cdouble) {.
    importcpp: "SetHighLightWidth", header: "vtkInteractorStyleAreaSelectHover.h".}
proc GetHighLightWidth*(this: var vtkInteractorStyleAreaSelectHover): cdouble {.
    importcpp: "GetHighLightWidth", header: "vtkInteractorStyleAreaSelectHover.h".}
proc GetIdAtPos*(this: var vtkInteractorStyleAreaSelectHover; x: cint; y: cint): vtkIdType {.
    importcpp: "GetIdAtPos", header: "vtkInteractorStyleAreaSelectHover.h".}