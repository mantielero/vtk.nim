## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSplineRepresentation.h
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
##  @class   vtkSplineRepresentation
##  @brief   representation for a spline.
##
##  vtkSplineRepresentation is a vtkWidgetRepresentation for a spline.
##  This 3D widget defines a spline that can be interactively placed in a
##  scene. The spline has handles, the number of which can be changed, plus it
##  can be picked on the spline itself to translate or rotate it in the scene.
##  This is based on vtkSplineWidget.
##  @sa
##  vtkSplineWidget, vtkSplineWidget2
##

import
  vtkAbstractSplineRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkPointHandleSource"
type
  vtkSplineRepresentation* {.importcpp: "vtkSplineRepresentation",
                            header: "vtkSplineRepresentation.h", bycopy.} = object of vtkAbstractSplineRepresentation
    vtkSplineRepresentation* {.importc: "vtkSplineRepresentation".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSplineRepresentation {.importcpp: "vtkSplineRepresentation::New(@)",
                                       header: "vtkSplineRepresentation.h".}
type
  vtkSplineRepresentationSuperclass* = vtkAbstractSplineRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSplineRepresentation::IsTypeOf(@)",
    header: "vtkSplineRepresentation.h".}
proc IsA*(this: var vtkSplineRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSplineRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSplineRepresentation {.
    importcpp: "vtkSplineRepresentation::SafeDownCast(@)",
    header: "vtkSplineRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSplineRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractSplineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSplineRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSplineRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSplineRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSplineRepresentation.h".}
proc SetNumberOfHandles*(this: var vtkSplineRepresentation; npts: cint) {.
    importcpp: "SetNumberOfHandles", header: "vtkSplineRepresentation.h".}
proc SetParametricSpline*(this: var vtkSplineRepresentation;
                         spline: ptr vtkParametricSpline) {.
    importcpp: "SetParametricSpline", header: "vtkSplineRepresentation.h".}
proc InitializeHandles*(this: var vtkSplineRepresentation; points: ptr vtkPoints) {.
    importcpp: "InitializeHandles", header: "vtkSplineRepresentation.h".}
proc BuildRepresentation*(this: var vtkSplineRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkSplineRepresentation.h".}