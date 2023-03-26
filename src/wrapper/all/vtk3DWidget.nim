## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk3DWidget.h
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
##  @class   vtk3DWidget
##  @brief   an abstract superclass for 3D widgets
##
##  vtk3DWidget is an abstract superclass for 3D interactor observers. These
##  3D widgets represent themselves in the scene, and have special callbacks
##  associated with them that allows interactive manipulation of the widget.
##  Inparticular, the difference between a vtk3DWidget and its abstract
##  superclass vtkInteractorObserver is that vtk3DWidgets are "placed" in 3D
##  space.  vtkInteractorObservers have no notion of where they are placed,
##  and may not exist in 3D space at all.  3D widgets also provide auxiliary
##  functions like producing a transformation, creating polydata (for seeding
##  streamlines, probes, etc.) or creating implicit functions. See the
##  concrete subclasses for particulars.
##
##  Typically the widget is used by specifying a vtkProp3D or VTK dataset as
##  input, and then invoking the "On" method to activate it. (You can also
##  specify a bounding box to help position the widget.) Prior to invoking the
##  On() method, the user may also wish to use the PlaceWidget() to initially
##  position it. The 'i' (for "interactor") keypresses also can be used to
##  turn the widgets on and off (methods exist to change the key value
##  and enable keypress activiation).
##
##  To support interactive manipulation of objects, this class (and
##  subclasses) invoke the events StartInteractionEvent, InteractionEvent, and
##  EndInteractionEvent.  These events are invoked when the vtk3DWidget enters
##  a state where rapid response is desired: mouse motion, etc. The events can
##  be used, for example, to set the desired update frame rate
##  (StartInteractionEvent), operate on the vtkProp3D or other object
##  (InteractionEvent), and set the desired frame rate back to normal values
##  (EndInteractionEvent).
##
##  Note that the Priority attribute inherited from vtkInteractorObserver has
##  a new default value which is now 0.5 so that all 3D widgets have a higher
##  priority than the usual interactor styles.
##
##  @sa
##  vtkBoxWidget vtkPlaneWidget vtkLineWidget vtkPointWidget
##  vtkSphereWidget vtkImplicitPlaneWidget
##

import
  vtkInteractionWidgetsModule, vtkInteractorObserver

discard "forward decl of vtk3DWidgetConnection"
discard "forward decl of vtkAlgorithmOutput"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkProp3D"
type
  vtk3DWidget* {.importcpp: "vtk3DWidget", header: "vtk3DWidget.h", bycopy.} = object of vtkInteractorObserver
    vtk3DWidget* {.importc: "vtk3DWidget".}: VTK_NEWINSTANCE
    ##  has the widget ever been placed

  vtk3DWidgetSuperclass* = vtkInteractorObserver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtk3DWidget::IsTypeOf(@)", header: "vtk3DWidget.h".}
proc IsA*(this: var vtk3DWidget; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtk3DWidget.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtk3DWidget {.
    importcpp: "vtk3DWidget::SafeDownCast(@)", header: "vtk3DWidget.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtk3DWidget :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtk3DWidget :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtk3DWidget :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtk3DWidget; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtk3DWidget.h".}
proc PlaceWidget*(this: var vtk3DWidget; bounds: array[6, cdouble]) {.
    importcpp: "PlaceWidget", header: "vtk3DWidget.h".}
proc PlaceWidget*(this: var vtk3DWidget) {.importcpp: "PlaceWidget",
                                       header: "vtk3DWidget.h".}
proc PlaceWidget*(this: var vtk3DWidget; xmin: cdouble; xmax: cdouble; ymin: cdouble;
                 ymax: cdouble; zmin: cdouble; zmax: cdouble) {.
    importcpp: "PlaceWidget", header: "vtk3DWidget.h".}
proc SetProp3D*(this: var vtk3DWidget; a2: ptr vtkProp3D) {.importcpp: "SetProp3D",
    header: "vtk3DWidget.h".}
proc GetnameProp3D*(this: var vtk3DWidget): ptr vtkProp3D {.
    importcpp: "GetnameProp3D", header: "vtk3DWidget.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the input dataset. This is not required, but if supplied,
  ##  and no vtkProp3D is specified, it is used to initially position
  ##  the widget.
  ##
proc SetInputData*(this: var vtk3DWidget; a2: ptr vtkDataSet) {.
    importcpp: "SetInputData", header: "vtk3DWidget.h".}
proc SetInputConnection*(this: var vtk3DWidget; a2: ptr vtkAlgorithmOutput) {.
    importcpp: "SetInputConnection", header: "vtk3DWidget.h".}
proc GetInput*(this: var vtk3DWidget): ptr vtkDataSet {.importcpp: "GetInput",
    header: "vtk3DWidget.h".}
proc SetPlaceFactor*(this: var vtk3DWidget; _arg: cdouble) {.
    importcpp: "SetPlaceFactor", header: "vtk3DWidget.h".}
proc GetPlaceFactorMinValue*(this: var vtk3DWidget): cdouble {.
    importcpp: "GetPlaceFactorMinValue", header: "vtk3DWidget.h".}
proc GetPlaceFactorMaxValue*(this: var vtk3DWidget): cdouble {.
    importcpp: "GetPlaceFactorMaxValue", header: "vtk3DWidget.h".}
## !!!Ignored construct:  virtual double GetPlaceFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PlaceFactor  of  << this -> PlaceFactor ) ; return this -> PlaceFactor ; } ;
## Error: expected ';'!!!

proc SetPlaceFactorHandleSize*(this: var vtk3DWidget; _arg: cdouble) {.
    importcpp: "SetPlaceFactorHandleSize", header: "vtk3DWidget.h".}
proc GetPlaceFactorMinValueHandleSizeMinValue*(this: var vtk3DWidget): cdouble {.
    importcpp: "GetPlaceFactorMinValueHandleSizeMinValue", header: "vtk3DWidget.h".}
proc GetPlaceFactorMaxValueHandleSizeMaxValue*(this: var vtk3DWidget): cdouble {.
    importcpp: "GetPlaceFactorMaxValueHandleSizeMaxValue", header: "vtk3DWidget.h".}
## !!!Ignored construct:  virtual double GetPlaceFactorHandleSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HandleSize  of  << this -> HandleSize ) ; return this -> HandleSize ; } ;
## Error: expected ';'!!!
