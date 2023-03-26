## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextRepresentation.h
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
##  @class   vtkTextRepresentation
##  @brief   represent text for vtkTextWidget
##
##  This class represents text for a vtkTextWidget.  This class provides
##  support for interactively placing text on the 2D overlay plane. The text
##  is defined by an instance of vtkTextActor.
##
##  @sa
##  vtkTextRepresentation vtkBorderWidget vtkAbstractWidget vtkWidgetRepresentation
##

import
  vtkBorderRepresentation, vtkInteractionWidgetsModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkTextActor"
discard "forward decl of vtkTextProperty"
discard "forward decl of vtkTextRepresentationObserver"
type
  vtkTextRepresentation* {.importcpp: "vtkTextRepresentation",
                          header: "vtkTextRepresentation.h", bycopy.} = object of vtkBorderRepresentation ## *
                                                                                                   ##  Instantiate class.
                                                                                                   ##
    vtkTextRepresentation* {.importc: "vtkTextRepresentation".}: VTK_NEWINSTANCE
    ##  observer to observe internal TextActor and TextProperty


proc New*(): ptr vtkTextRepresentation {.importcpp: "vtkTextRepresentation::New(@)",
                                     header: "vtkTextRepresentation.h".}
type
  vtkTextRepresentationSuperclass* = vtkBorderRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextRepresentation::IsTypeOf(@)",
    header: "vtkTextRepresentation.h".}
proc IsA*(this: var vtkTextRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTextRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextRepresentation {.
    importcpp: "vtkTextRepresentation::SafeDownCast(@)",
    header: "vtkTextRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkBorderRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextRepresentation.h".}
proc SetTextActor*(this: var vtkTextRepresentation; textActor: ptr vtkTextActor) {.
    importcpp: "SetTextActor", header: "vtkTextRepresentation.h".}
proc GetnameTextActor*(this: var vtkTextRepresentation): ptr vtkTextActor {.
    importcpp: "GetnameTextActor", header: "vtkTextRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the text string display by this representation.
  ##
proc SetText*(this: var vtkTextRepresentation; text: cstring) {.importcpp: "SetText",
    header: "vtkTextRepresentation.h".}
proc GetText*(this: var vtkTextRepresentation): cstring {.importcpp: "GetText",
    header: "vtkTextRepresentation.h".}
proc BuildRepresentation*(this: var vtkTextRepresentation) {.
    importcpp: "BuildRepresentation", header: "vtkTextRepresentation.h".}
proc GetSize*(this: var vtkTextRepresentation; size: array[2, cdouble]) {.
    importcpp: "GetSize", header: "vtkTextRepresentation.h".}
proc GetActors2D*(this: var vtkTextRepresentation; a2: ptr vtkPropCollection) {.
    importcpp: "GetActors2D", header: "vtkTextRepresentation.h".}
proc ReleaseGraphicsResources*(this: var vtkTextRepresentation; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkTextRepresentation.h".}
proc RenderOverlay*(this: var vtkTextRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOverlay", header: "vtkTextRepresentation.h".}
proc RenderOpaqueGeometry*(this: var vtkTextRepresentation; a2: ptr vtkViewport): cint {.
    importcpp: "RenderOpaqueGeometry", header: "vtkTextRepresentation.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkTextRepresentation;
                                        a2: ptr vtkViewport): cint {.
    importcpp: "RenderTranslucentPolygonalGeometry",
    header: "vtkTextRepresentation.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkTextRepresentation): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkTextRepresentation.h".}
proc SetWindowLocation*(this: var vtkTextRepresentation; enumLocation: cint) {.
    importcpp: "SetWindowLocation", header: "vtkTextRepresentation.h".}
proc SetPosition*(this: var vtkTextRepresentation; x: cdouble; y: cdouble) {.
    importcpp: "SetPosition", header: "vtkTextRepresentation.h".}
proc SetPosition*(this: var vtkTextRepresentation; pos: array[2, cdouble]) {.
    importcpp: "SetPosition", header: "vtkTextRepresentation.h".}
proc ExecuteTextPropertyModifiedEvent*(this: var vtkTextRepresentation;
                                      obj: ptr vtkObject; enumEvent: culong;
                                      p: pointer) {.
    importcpp: "ExecuteTextPropertyModifiedEvent",
    header: "vtkTextRepresentation.h".}
proc ExecuteTextActorModifiedEvent*(this: var vtkTextRepresentation;
                                   obj: ptr vtkObject; enumEvent: culong; p: pointer) {.
    importcpp: "ExecuteTextActorModifiedEvent", header: "vtkTextRepresentation.h".}
proc SetPaddingLeft*(this: var vtkTextRepresentation; _arg: cint) {.
    importcpp: "SetPaddingLeft", header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMinValue*(this: var vtkTextRepresentation): cint {.
    importcpp: "GetPaddingLeftMinValue", header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMaxValue*(this: var vtkTextRepresentation): cint {.
    importcpp: "GetPaddingLeftMaxValue", header: "vtkTextRepresentation.h".}
## !!!Ignored construct:  virtual int GetPaddingLeft ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PaddingLeft  of  << this -> PaddingLeft ) ; return this -> PaddingLeft ; } ;
## Error: expected ';'!!!

proc SetPaddingLeftPaddingRight*(this: var vtkTextRepresentation; _arg: cint) {.
    importcpp: "SetPaddingLeftPaddingRight", header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMinValuePaddingRightMinValue*(this: var vtkTextRepresentation): cint {.
    importcpp: "GetPaddingLeftMinValuePaddingRightMinValue",
    header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMaxValuePaddingRightMaxValue*(this: var vtkTextRepresentation): cint {.
    importcpp: "GetPaddingLeftMaxValuePaddingRightMaxValue",
    header: "vtkTextRepresentation.h".}
## !!!Ignored construct:  virtual int GetPaddingLeftPaddingRight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PaddingRight  of  << this -> PaddingRight ) ; return this -> PaddingRight ; } ;
## Error: expected ';'!!!

proc SetPaddingLeftPaddingRightPaddingTop*(this: var vtkTextRepresentation;
    _arg: cint) {.importcpp: "SetPaddingLeftPaddingRightPaddingTop",
                header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMinValuePaddingRightMinValuePaddingTopMinValue*(
    this: var vtkTextRepresentation): cint {.
    importcpp: "GetPaddingLeftMinValuePaddingRightMinValuePaddingTopMinValue",
    header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMaxValuePaddingRightMaxValuePaddingTopMaxValue*(
    this: var vtkTextRepresentation): cint {.
    importcpp: "GetPaddingLeftMaxValuePaddingRightMaxValuePaddingTopMaxValue",
    header: "vtkTextRepresentation.h".}
## !!!Ignored construct:  virtual int GetPaddingLeftPaddingRightPaddingTop ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PaddingTop  of  << this -> PaddingTop ) ; return this -> PaddingTop ; } ;
## Error: expected ';'!!!

proc SetPaddingLeftPaddingRightPaddingTopPaddingBottom*(
    this: var vtkTextRepresentation; _arg: cint) {.
    importcpp: "SetPaddingLeftPaddingRightPaddingTopPaddingBottom",
    header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMinValuePaddingRightMinValuePaddingTopMinValuePaddingBottomMinValue*(
    this: var vtkTextRepresentation): cint {.importcpp: "GetPaddingLeftMinValuePaddingRightMinValuePaddingTopMinValuePaddingBottomMinValue",
    header: "vtkTextRepresentation.h".}
proc GetPaddingLeftMaxValuePaddingRightMaxValuePaddingTopMaxValuePaddingBottomMaxValue*(
    this: var vtkTextRepresentation): cint {.importcpp: "GetPaddingLeftMaxValuePaddingRightMaxValuePaddingTopMaxValuePaddingBottomMaxValue",
    header: "vtkTextRepresentation.h".}
## !!!Ignored construct:  virtual int GetPaddingLeftPaddingRightPaddingTopPaddingBottom ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PaddingBottom  of  << this -> PaddingBottom ) ; return this -> PaddingBottom ; } ;
## Error: expected ';'!!!

proc SetPadding*(this: var vtkTextRepresentation; padding: cint) {.
    importcpp: "SetPadding", header: "vtkTextRepresentation.h".}