## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTensorProbeWidget.h
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
##  @class   vtkTensorProbeWidget
##  @brief   a widget to probe tensors on a polyline
##
##  The class is used to probe tensors on a trajectory. The representation
##  (vtkTensorProbeRepresentation) is free to choose its own method of
##  rendering the tensors. For instance vtkEllipsoidTensorProbeRepresentation
##  renders the tensors as ellipsoids. The interactions of the widget are
##  controlled by the left mouse button. A left click on the tensor selects
##  it. It can dragged around the trajectory to probe the tensors on it.
##
##  For instance dragging the ellipsoid around with
##  vtkEllipsoidTensorProbeRepresentation will manifest itself with the
##  ellipsoid shape changing as needed along the trajectory.
##

import
  vtkAbstractWidget, vtkInteractionWidgetsModule

discard "forward decl of vtkTensorProbeRepresentation"
discard "forward decl of vtkPolyData"
type
  vtkTensorProbeWidget* {.importcpp: "vtkTensorProbeWidget",
                         header: "vtkTensorProbeWidget.h", bycopy.} = object of vtkAbstractWidget ## *
                                                                                           ##  Instantiate this class.
                                                                                           ##
    vtkTensorProbeWidget* {.importc: "vtkTensorProbeWidget".}: VTK_NEWINSTANCE
    ##  Callback interface to capture events and respond


proc New*(): ptr vtkTensorProbeWidget {.importcpp: "vtkTensorProbeWidget::New(@)",
                                    header: "vtkTensorProbeWidget.h".}
type
  vtkTensorProbeWidgetSuperclass* = vtkAbstractWidget

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTensorProbeWidget::IsTypeOf(@)",
    header: "vtkTensorProbeWidget.h".}
proc IsA*(this: var vtkTensorProbeWidget; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTensorProbeWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTensorProbeWidget {.
    importcpp: "vtkTensorProbeWidget::SafeDownCast(@)",
    header: "vtkTensorProbeWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTensorProbeWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTensorProbeWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTensorProbeWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTensorProbeWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTensorProbeWidget.h".}
proc SetRepresentation*(this: var vtkTensorProbeWidget;
                       r: ptr vtkTensorProbeRepresentation) {.
    importcpp: "SetRepresentation", header: "vtkTensorProbeWidget.h".}
proc GetTensorProbeRepresentation*(this: var vtkTensorProbeWidget): ptr vtkTensorProbeRepresentation {.
    importcpp: "GetTensorProbeRepresentation", header: "vtkTensorProbeWidget.h".}
proc CreateDefaultRepresentation*(this: var vtkTensorProbeWidget) {.
    importcpp: "CreateDefaultRepresentation", header: "vtkTensorProbeWidget.h".}