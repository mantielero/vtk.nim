## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleFlight.h
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
##  @class   vtkInteractorStyleFlight
##  @brief   provides flight motion routines
##
##
##  Left  mouse button press produces forward motion.
##  Right mouse button press produces reverse motion.
##  Moving mouse during motion steers user in desired direction.
##  Keyboard controls are:
##  Left/Right/Up/Down Arrows for steering direction
##  'A' forward, 'Z' reverse motion
##  Ctrl Key causes sidestep instead of steering in mouse and key modes
##  Shift key is accelerator in mouse and key modes
##  Ctrl and Shift together causes Roll in mouse and key modes
##
##  By default, one "step" of motion corresponds to 1/250th of the diagonal
##  of bounding box of visible actors, '+' and '-' keys allow user to
##  increase or decrease step size.
##

import
  vtkInteractionStyleModule, vtkInteractorStyle

discard "forward decl of vtkCamera"
discard "forward decl of vtkPerspectiveTransform"
discard "forward decl of CPIDControl"
type
  vtkInteractorStyleFlight* {.importcpp: "vtkInteractorStyleFlight",
                             header: "vtkInteractorStyleFlight.h", bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyleFlight* {.importc: "vtkInteractorStyleFlight".}: VTK_NEWINSTANCE
    ## /@}


proc New*(): ptr vtkInteractorStyleFlight {.importcpp: "vtkInteractorStyleFlight::New(@)",
                                        header: "vtkInteractorStyleFlight.h".}
type
  vtkInteractorStyleFlightSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleFlight::IsTypeOf(@)",
    header: "vtkInteractorStyleFlight.h".}
proc IsA*(this: var vtkInteractorStyleFlight; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleFlight.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleFlight {.
    importcpp: "vtkInteractorStyleFlight::SafeDownCast(@)",
    header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleFlight :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleFlight :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleFlight :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleFlight; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInteractorStyleFlight.h".}
proc JumpTo*(this: var vtkInteractorStyleFlight; campos: array[3, cdouble];
            focpos: array[3, cdouble]) {.importcpp: "JumpTo",
                                      header: "vtkInteractorStyleFlight.h".}
proc SetMotionStepSize*(this: var vtkInteractorStyleFlight; _arg: cdouble) {.
    importcpp: "SetMotionStepSize", header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  virtual double GetMotionStepSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MotionStepSize  of  << this -> MotionStepSize ) ; return this -> MotionStepSize ; } ;
## Error: expected ';'!!!

proc SetMotionStepSizeMotionAccelerationFactor*(
    this: var vtkInteractorStyleFlight; _arg: cdouble) {.
    importcpp: "SetMotionStepSizeMotionAccelerationFactor",
    header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  virtual double GetMotionStepSizeMotionAccelerationFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MotionAccelerationFactor  of  << this -> MotionAccelerationFactor ) ; return this -> MotionAccelerationFactor ; } ;
## Error: expected ';'!!!

proc SetMotionStepSizeMotionAccelerationFactorAngleStepSize*(
    this: var vtkInteractorStyleFlight; _arg: cdouble) {.
    importcpp: "SetMotionStepSizeMotionAccelerationFactorAngleStepSize",
    header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  virtual double GetMotionStepSizeMotionAccelerationFactorAngleStepSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AngleStepSize  of  << this -> AngleStepSize ) ; return this -> AngleStepSize ; } ;
## Error: expected ';'!!!

proc SetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactor*(
    this: var vtkInteractorStyleFlight; _arg: cdouble) {.importcpp: "SetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactor",
    header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  virtual double GetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AngleAccelerationFactor  of  << this -> AngleAccelerationFactor ) ; return this -> AngleAccelerationFactor ; } ;
## Error: expected ';'!!!

proc SetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactorDisableMotion*(
    this: var vtkInteractorStyleFlight; _arg: vtkTypeBool) {.importcpp: "SetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactorDisableMotion",
    header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactorDisableMotion ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisableMotion  of  << this -> DisableMotion ) ; return this -> DisableMotion ; } ;
## Error: expected ';'!!!

proc DisableMotionOn*(this: var vtkInteractorStyleFlight) {.
    importcpp: "DisableMotionOn", header: "vtkInteractorStyleFlight.h".}
proc DisableMotionOff*(this: var vtkInteractorStyleFlight) {.
    importcpp: "DisableMotionOff", header: "vtkInteractorStyleFlight.h".}
  ## /@}
  ## /@{
  ## *
  ##  When flying, apply a restorative force to the "Up" vector.
  ##  This is activated when the current 'up' is close to the actual 'up'
  ##  (as defined in DefaultUpVector). This prevents excessive twisting forces
  ##  when viewing from arbitrary angles, but keep the horizon level when
  ##  the user is flying over terrain.
  ##
proc SetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactorDisableMotionRestoreUpVector*(
    this: var vtkInteractorStyleFlight; _arg: vtkTypeBool) {.importcpp: "SetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactorDisableMotionRestoreUpVector",
    header: "vtkInteractorStyleFlight.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMotionStepSizeMotionAccelerationFactorAngleStepSizeAngleAccelerationFactorDisableMotionRestoreUpVector ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RestoreUpVector  of  << this -> RestoreUpVector ) ; return this -> RestoreUpVector ; } ;
## Error: expected ';'!!!

proc RestoreUpVectorOn*(this: var vtkInteractorStyleFlight) {.
    importcpp: "RestoreUpVectorOn", header: "vtkInteractorStyleFlight.h".}
proc RestoreUpVectorOff*(this: var vtkInteractorStyleFlight) {.
    importcpp: "RestoreUpVectorOff", header: "vtkInteractorStyleFlight.h".}
  ## /@}
  ##  Specify "up" (by default {0,0,1} but can be changed)
## !!!Ignored construct:  virtual double * GetDefaultUpVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultUpVector  pointer  << this -> DefaultUpVector ) ; return this -> DefaultUpVector ; } VTK_WRAPEXCLUDE virtual void GetDefaultUpVector ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> DefaultUpVector [ i ] ; } } ;
## Error: expected ';'!!!

proc SetDefaultUpVector*(this: var vtkInteractorStyleFlight; data: ptr cdouble) {.
    importcpp: "SetDefaultUpVector", header: "vtkInteractorStyleFlight.h".}
  ## /@{
  ## *
  ##  Concrete implementation of Mouse event bindings for flight
  ##
proc OnMouseMove*(this: var vtkInteractorStyleFlight) {.importcpp: "OnMouseMove",
    header: "vtkInteractorStyleFlight.h".}
proc OnLeftButtonDown*(this: var vtkInteractorStyleFlight) {.
    importcpp: "OnLeftButtonDown", header: "vtkInteractorStyleFlight.h".}
proc OnLeftButtonUp*(this: var vtkInteractorStyleFlight) {.
    importcpp: "OnLeftButtonUp", header: "vtkInteractorStyleFlight.h".}
proc OnMiddleButtonDown*(this: var vtkInteractorStyleFlight) {.
    importcpp: "OnMiddleButtonDown", header: "vtkInteractorStyleFlight.h".}
proc OnMiddleButtonUp*(this: var vtkInteractorStyleFlight) {.
    importcpp: "OnMiddleButtonUp", header: "vtkInteractorStyleFlight.h".}
proc OnRightButtonDown*(this: var vtkInteractorStyleFlight) {.
    importcpp: "OnRightButtonDown", header: "vtkInteractorStyleFlight.h".}
proc OnRightButtonUp*(this: var vtkInteractorStyleFlight) {.
    importcpp: "OnRightButtonUp", header: "vtkInteractorStyleFlight.h".}
proc OnChar*(this: var vtkInteractorStyleFlight) {.importcpp: "OnChar",
    header: "vtkInteractorStyleFlight.h".}
proc OnKeyDown*(this: var vtkInteractorStyleFlight) {.importcpp: "OnKeyDown",
    header: "vtkInteractorStyleFlight.h".}
proc OnKeyUp*(this: var vtkInteractorStyleFlight) {.importcpp: "OnKeyUp",
    header: "vtkInteractorStyleFlight.h".}
proc OnTimer*(this: var vtkInteractorStyleFlight) {.importcpp: "OnTimer",
    header: "vtkInteractorStyleFlight.h".}
proc ForwardFly*(this: var vtkInteractorStyleFlight) {.importcpp: "ForwardFly",
    header: "vtkInteractorStyleFlight.h".}
proc ReverseFly*(this: var vtkInteractorStyleFlight) {.importcpp: "ReverseFly",
    header: "vtkInteractorStyleFlight.h".}
proc StartForwardFly*(this: var vtkInteractorStyleFlight) {.
    importcpp: "StartForwardFly", header: "vtkInteractorStyleFlight.h".}
proc EndForwardFly*(this: var vtkInteractorStyleFlight) {.
    importcpp: "EndForwardFly", header: "vtkInteractorStyleFlight.h".}
proc StartReverseFly*(this: var vtkInteractorStyleFlight) {.
    importcpp: "StartReverseFly", header: "vtkInteractorStyleFlight.h".}
proc EndReverseFly*(this: var vtkInteractorStyleFlight) {.
    importcpp: "EndReverseFly", header: "vtkInteractorStyleFlight.h".}