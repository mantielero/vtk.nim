## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEllipsoidTensorProbeRepresentation.h
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
##  @class   vtkEllipsoidTensorProbeRepresentation
##  @brief   A concrete implementation of vtkTensorProbeRepresentation that renders tensors as
##  ellipoids.
##
##  vtkEllipsoidTensorProbeRepresentation is a concrete implementation of
##  vtkTensorProbeRepresentation. It renders tensors as ellipsoids. Locations
##  between two points when probed have the tensors linearly interpolated
##  from the neighboring locations on the polyline.
##
##  @sa
##  vtkTensorProbeWidget
##

import
  vtkInteractionWidgetsModule, vtkTensorProbeRepresentation

discard "forward decl of vtkCellPicker"
discard "forward decl of vtkTensorGlyph"
discard "forward decl of vtkPolyDataNormals"
type
  vtkEllipsoidTensorProbeRepresentation* {.
      importcpp: "vtkEllipsoidTensorProbeRepresentation",
      header: "vtkEllipsoidTensorProbeRepresentation.h", bycopy.} = object of vtkTensorProbeRepresentation
    vtkEllipsoidTensorProbeRepresentation*
        {.importc: "vtkEllipsoidTensorProbeRepresentation".}: VTK_NEWINSTANCE


proc New*(): ptr vtkEllipsoidTensorProbeRepresentation {.
    importcpp: "vtkEllipsoidTensorProbeRepresentation::New(@)",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
type
  vtkEllipsoidTensorProbeRepresentationSuperclass* = vtkTensorProbeRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEllipsoidTensorProbeRepresentation::IsTypeOf(@)",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc IsA*(this: var vtkEllipsoidTensorProbeRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEllipsoidTensorProbeRepresentation {.
    importcpp: "vtkEllipsoidTensorProbeRepresentation::SafeDownCast(@)",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEllipsoidTensorProbeRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTensorProbeRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEllipsoidTensorProbeRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEllipsoidTensorProbeRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkEllipsoidTensorProbeRepresentation; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc BuildRepresentation*(this: var vtkEllipsoidTensorProbeRepresentation) {.
    importcpp: "BuildRepresentation",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkEllipsoidTensorProbeRepresentation;
                          a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc SelectProbe*(this: var vtkEllipsoidTensorProbeRepresentation;
                 pos: array[2, cint]): cint {.importcpp: "SelectProbe",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc GetActors*(this: var vtkEllipsoidTensorProbeRepresentation;
               a2: ptr vtkPropCollection) {.importcpp: "GetActors",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkEllipsoidTensorProbeRepresentation;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}
proc RegisterPickers*(this: var vtkEllipsoidTensorProbeRepresentation) {.
    importcpp: "RegisterPickers",
    header: "vtkEllipsoidTensorProbeRepresentation.h".}