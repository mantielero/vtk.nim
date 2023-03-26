## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceImageViewerMeasurements.h
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
##  @class   vtkResliceImageViewerMeasurements
##  @brief   Manage measurements on a resliced image
##
##  This class manages measurements on the resliced image. It toggles the
##  the visibility of the measurements based on whether the resliced image
##  is the same orientation as when the measurement was initially placed.
##  @sa
##  vtkResliceCursor vtkResliceCursorWidget vtkResliceCursorRepresentation
##

import
  vtkInteractionImageModule, vtkObject

discard "forward decl of vtkResliceImageViewer"
discard "forward decl of vtkAbstractWidget"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkCollection"
discard "forward decl of vtkDistanceWidget"
discard "forward decl of vtkAngleWidget"
discard "forward decl of vtkBiDimensionalWidget"
discard "forward decl of vtkHandleRepresentation"
discard "forward decl of vtkHandleWidget"
discard "forward decl of vtkCaptionWidget"
discard "forward decl of vtkContourWidget"
discard "forward decl of vtkSeedWidget"
type
  vtkResliceImageViewerMeasurements* {.importcpp: "vtkResliceImageViewerMeasurements", header: "vtkResliceImageViewerMeasurements.h",
                                      bycopy.} = object of vtkObject ## /@{
                                                                ## *
                                                                ##  Standard VTK methods.
                                                                ##
    vtkResliceImageViewerMeasurements* {.importc: "vtkResliceImageViewerMeasurements".}: VTK_NEWINSTANCE
    ##  Handle the visibility of the measurements.
    ##  Flag indicating if we should handle events.
    ##  On by default.
    ##  Tolerance for Point-in-plane computation


proc New*(): ptr vtkResliceImageViewerMeasurements {.
    importcpp: "vtkResliceImageViewerMeasurements::New(@)",
    header: "vtkResliceImageViewerMeasurements.h".}
type
  vtkResliceImageViewerMeasurementsSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkResliceImageViewerMeasurements::IsTypeOf(@)",
    header: "vtkResliceImageViewerMeasurements.h".}
proc IsA*(this: var vtkResliceImageViewerMeasurements; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkResliceImageViewerMeasurements.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkResliceImageViewerMeasurements {.
    importcpp: "vtkResliceImageViewerMeasurements::SafeDownCast(@)",
    header: "vtkResliceImageViewerMeasurements.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkResliceImageViewerMeasurements :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceImageViewerMeasurements :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceImageViewerMeasurements :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkResliceImageViewerMeasurements; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkResliceImageViewerMeasurements.h".}
proc Render*(this: var vtkResliceImageViewerMeasurements) {.importcpp: "Render",
    header: "vtkResliceImageViewerMeasurements.h".}
proc AddItem*(this: var vtkResliceImageViewerMeasurements; a2: ptr vtkAbstractWidget) {.
    importcpp: "AddItem", header: "vtkResliceImageViewerMeasurements.h".}
proc RemoveItem*(this: var vtkResliceImageViewerMeasurements;
                a2: ptr vtkAbstractWidget) {.importcpp: "RemoveItem",
    header: "vtkResliceImageViewerMeasurements.h".}
proc RemoveAllItems*(this: var vtkResliceImageViewerMeasurements) {.
    importcpp: "RemoveAllItems", header: "vtkResliceImageViewerMeasurements.h".}
proc SetProcessEvents*(this: var vtkResliceImageViewerMeasurements;
                      _arg: vtkTypeBool) {.importcpp: "SetProcessEvents",
    header: "vtkResliceImageViewerMeasurements.h".}
proc GetProcessEventsMinValue*(this: var vtkResliceImageViewerMeasurements): vtkTypeBool {.
    importcpp: "GetProcessEventsMinValue",
    header: "vtkResliceImageViewerMeasurements.h".}
proc GetProcessEventsMaxValue*(this: var vtkResliceImageViewerMeasurements): vtkTypeBool {.
    importcpp: "GetProcessEventsMaxValue",
    header: "vtkResliceImageViewerMeasurements.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetProcessEvents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessEvents  of  << this -> ProcessEvents ) ; return this -> ProcessEvents ; } ;
## Error: expected ';'!!!

proc ProcessEventsOn*(this: var vtkResliceImageViewerMeasurements) {.
    importcpp: "ProcessEventsOn", header: "vtkResliceImageViewerMeasurements.h".}
proc ProcessEventsOff*(this: var vtkResliceImageViewerMeasurements) {.
    importcpp: "ProcessEventsOff", header: "vtkResliceImageViewerMeasurements.h".}
  ## /@}
  ## /@{
  ## *
  ##  Tolerance for Point-in-Plane check
  ##
proc SetTolerance*(this: var vtkResliceImageViewerMeasurements; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkResliceImageViewerMeasurements.h".}
## !!!Ignored construct:  virtual double GetProcessEventsTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetResliceImageViewer*(this: var vtkResliceImageViewerMeasurements;
                           a2: ptr vtkResliceImageViewer) {.
    importcpp: "SetResliceImageViewer",
    header: "vtkResliceImageViewerMeasurements.h".}
proc GetnameResliceImageViewer*(this: var vtkResliceImageViewerMeasurements): ptr vtkResliceImageViewer {.
    importcpp: "GetnameResliceImageViewer",
    header: "vtkResliceImageViewerMeasurements.h".}
  ## /@}
  ## *
  ##  Update the measurements. This is automatically called when the reslice
  ##  cursor's axes are change.
  ##
proc Update*(this: var vtkResliceImageViewerMeasurements) {.importcpp: "Update",
    header: "vtkResliceImageViewerMeasurements.h".}