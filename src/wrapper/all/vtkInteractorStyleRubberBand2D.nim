## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleRubberBand2D.h
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
##  @class   vtkInteractorStyleRubberBand2D
##  @brief   A rubber band interactor for a 2D view
##
##
##  vtkInteractorStyleRubberBand2D manages interaction in a 2D view.
##  Camera rotation is not allowed with this interactor style.
##  Zooming affects the camera's parallel scale only, and assumes
##  that the camera is in parallel projection mode.
##  The style also allows draws a rubber band using the left button.
##  All camera changes invoke StartInteractionEvent when the button
##  is pressed, InteractionEvent when the mouse (or wheel) is moved,
##  and EndInteractionEvent when the button is released.  The bindings
##  are as follows:
##  Left mouse - Select (invokes a SelectionChangedEvent).
##  Right mouse - Zoom.
##  Middle mouse - Pan.
##  Scroll wheel - Zoom.
##

import
  vtkInteractionStyleModule, vtkInteractorStyle

discard "forward decl of vtkUnsignedCharArray"
type
  vtkInteractorStyleRubberBand2D* {.importcpp: "vtkInteractorStyleRubberBand2D",
                                   header: "vtkInteractorStyleRubberBand2D.h",
                                   bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyleRubberBand2D* {.importc: "vtkInteractorStyleRubberBand2D".}: VTK_NEWINSTANCE
    ##  Draws the selection rubber band
    ##  The end position of the selection
    ##  The pixel array for the rubber band
    ##  Whether to render when the mouse moves


proc New*(): ptr vtkInteractorStyleRubberBand2D {.
    importcpp: "vtkInteractorStyleRubberBand2D::New(@)",
    header: "vtkInteractorStyleRubberBand2D.h".}
type
  vtkInteractorStyleRubberBand2DSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleRubberBand2D::IsTypeOf(@)",
    header: "vtkInteractorStyleRubberBand2D.h".}
proc IsA*(this: var vtkInteractorStyleRubberBand2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleRubberBand2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleRubberBand2D {.
    importcpp: "vtkInteractorStyleRubberBand2D::SafeDownCast(@)",
    header: "vtkInteractorStyleRubberBand2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleRubberBand2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleRubberBand2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleRubberBand2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleRubberBand2D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorStyleRubberBand2D.h".}
proc OnLeftButtonDown*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnLeftButtonDown", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnLeftButtonUp", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnMiddleButtonDown*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnMiddleButtonDown", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnMiddleButtonUp*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnMiddleButtonUp", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnRightButtonDown*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnRightButtonDown", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnRightButtonUp*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnRightButtonUp", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnMouseMove*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnMouseMove", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnMouseWheelForward*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnMouseWheelForward", header: "vtkInteractorStyleRubberBand2D.h".}
proc OnMouseWheelBackward*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "OnMouseWheelBackward", header: "vtkInteractorStyleRubberBand2D.h".}
proc SetRenderOnMouseMove*(this: var vtkInteractorStyleRubberBand2D; _arg: bool) {.
    importcpp: "SetRenderOnMouseMove", header: "vtkInteractorStyleRubberBand2D.h".}
## !!!Ignored construct:  virtual bool GetRenderOnMouseMove ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderOnMouseMove  of  << this -> RenderOnMouseMove ) ; return this -> RenderOnMouseMove ; } ;
## Error: expected ';'!!!

proc RenderOnMouseMoveOn*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "RenderOnMouseMoveOn", header: "vtkInteractorStyleRubberBand2D.h".}
proc RenderOnMouseMoveOff*(this: var vtkInteractorStyleRubberBand2D) {.
    importcpp: "RenderOnMouseMoveOff", header: "vtkInteractorStyleRubberBand2D.h".}
  ## /@}
  ## *
  ##  Selection types
  ##
const
  vtkInteractorStyleRubberBand2DSELECT_NORMAL* = 0
  vtkInteractorStyleRubberBand2DSELECT_UNION* = 1

## !!!Ignored construct:  /@{ *
##  Current interaction state
##  virtual int GetRenderOnMouseMoveInteractionInteraction ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interaction  of  << this -> Interaction ) ; return this -> Interaction ; } ;
## Error: expected ';'!!!

const
  vtkInteractorStyleRubberBand2DNONE* = 0
  vtkInteractorStyleRubberBand2DPANNING* = 1
  vtkInteractorStyleRubberBand2DZOOMING* = 2
  vtkInteractorStyleRubberBand2DSELECTING* = 3

## !!!Ignored construct:  /@{ *
##  Access to the start and end positions (display coordinates) of the rubber
##  band pick area. This is a convenience method for the wrapped languages
##  since the event callData is lost when using those wrappings.
##  virtual int * GetStartPositionStartPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  pointer  << this -> StartPosition ) ; return this -> StartPosition ; } VTK_WRAPEXCLUDE virtual void GetStartPositionStartPosition ( int & _arg1 , int & _arg2 ) { _arg1 = this -> StartPosition [ 0 ] ; _arg2 = this -> StartPosition [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << StartPosition  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStartPositionStartPosition ( int _arg [ 2 ] ) { this -> GetStartPositionStartPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int * GetStartPositionStartPositionEndPosition ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << EndPosition  pointer  << this -> EndPosition ) ; return this -> EndPosition ; } VTK_WRAPEXCLUDE virtual void GetStartPositionStartPositionEndPosition ( int & _arg1 , int & _arg2 ) { _arg1 = this -> EndPosition [ 0 ] ; _arg2 = this -> EndPosition [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << EndPosition  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStartPositionStartPositionEndPosition ( int _arg [ 2 ] ) { this -> GetStartPositionStartPositionEndPosition ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!
