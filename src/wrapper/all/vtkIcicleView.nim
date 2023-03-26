## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIcicleView.h
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
##  @class   vtkIcicleView
##  @brief   Displays a tree in a stacked "icicle" view
##
##
##  vtkIcicleView shows a vtkTree in horizontal layers
##  where each vertex in the tree is represented by a bar.
##  Child sectors are below (or above) parent sectors, and may be
##  colored and sized by various parameters.
##

import
  vtkTreeAreaView, vtkViewsInfovisModule

type
  vtkIcicleView* {.importcpp: "vtkIcicleView", header: "vtkIcicleView.h", bycopy.} = object of vtkTreeAreaView
    vtkIcicleView* {.importc: "vtkIcicleView".}: VTK_NEWINSTANCE


proc New*(): ptr vtkIcicleView {.importcpp: "vtkIcicleView::New(@)",
                             header: "vtkIcicleView.h".}
type
  vtkIcicleViewSuperclass* = vtkTreeAreaView

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkIcicleView::IsTypeOf(@)", header: "vtkIcicleView.h".}
proc IsA*(this: var vtkIcicleView; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkIcicleView.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkIcicleView {.
    importcpp: "vtkIcicleView::SafeDownCast(@)", header: "vtkIcicleView.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkIcicleView :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTreeAreaView :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIcicleView :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIcicleView :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkIcicleView; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkIcicleView.h".}
proc SetTopToBottom*(this: var vtkIcicleView; reversed: bool) {.
    importcpp: "SetTopToBottom", header: "vtkIcicleView.h".}
proc GetTopToBottom*(this: var vtkIcicleView): bool {.importcpp: "GetTopToBottom",
    header: "vtkIcicleView.h".}
proc TopToBottomOn*(this: var vtkIcicleView) {.importcpp: "TopToBottomOn",
    header: "vtkIcicleView.h".}
proc TopToBottomOff*(this: var vtkIcicleView) {.importcpp: "TopToBottomOff",
    header: "vtkIcicleView.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the width of the root node
  ##
proc SetRootWidth*(this: var vtkIcicleView; width: cdouble) {.
    importcpp: "SetRootWidth", header: "vtkIcicleView.h".}
proc GetRootWidth*(this: var vtkIcicleView): cdouble {.importcpp: "GetRootWidth",
    header: "vtkIcicleView.h".}
proc SetLayerThickness*(this: var vtkIcicleView; thickness: cdouble) {.
    importcpp: "SetLayerThickness", header: "vtkIcicleView.h".}
proc GetLayerThickness*(this: var vtkIcicleView): cdouble {.
    importcpp: "GetLayerThickness", header: "vtkIcicleView.h".}
proc SetUseGradientColoring*(this: var vtkIcicleView; value: bool) {.
    importcpp: "SetUseGradientColoring", header: "vtkIcicleView.h".}
proc GetUseGradientColoring*(this: var vtkIcicleView): bool {.
    importcpp: "GetUseGradientColoring", header: "vtkIcicleView.h".}
proc UseGradientColoringOn*(this: var vtkIcicleView) {.
    importcpp: "UseGradientColoringOn", header: "vtkIcicleView.h".}
proc UseGradientColoringOff*(this: var vtkIcicleView) {.
    importcpp: "UseGradientColoringOff", header: "vtkIcicleView.h".}
  ## /@}