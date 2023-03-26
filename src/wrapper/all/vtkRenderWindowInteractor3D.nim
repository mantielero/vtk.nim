## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderWindowInteractor3D.h
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
##  @class   vtkRenderWindowInteractor3D
##  @brief   adds support for 3D events to vtkRenderWindowInteractor.
##
##
##  vtkRenderWindowInteractor3D provides a platform-independent interaction
##  support for 3D events including 3D clicks and 3D controller
##  orientations. It follows the same basic model as
##  vtkRenderWindowInteractor but adds methods to set and get 3D event
##  locations and orientations. VR systems will subclass this class to
##  provide the code to set these values based on events from their VR
##  controllers.
##

import
  vtkRenderWindowInteractor, vtkRenderingCoreModule, vtkNew

discard "forward decl of vtkCamera"
discard "forward decl of vtkMatrix4x4"
vtkEventDataDevice
vtkEventDataDeviceInput
type
  vtkRenderWindowInteractor3D* {.importcpp: "vtkRenderWindowInteractor3D",
                                header: "vtkRenderWindowInteractor3D.h", bycopy.} = object of vtkRenderWindowInteractor ## *
                                                                                                                 ##  Construct object so that light follows camera motion.
                                                                                                                 ##
    vtkRenderWindowInteractor3D* {.importc: "vtkRenderWindowInteractor3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRenderWindowInteractor3D {.
    importcpp: "vtkRenderWindowInteractor3D::New(@)",
    header: "vtkRenderWindowInteractor3D.h".}
type
  vtkRenderWindowInteractor3DSuperclass* = vtkRenderWindowInteractor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderWindowInteractor3D::IsTypeOf(@)",
    header: "vtkRenderWindowInteractor3D.h".}
proc IsA*(this: var vtkRenderWindowInteractor3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderWindowInteractor3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderWindowInteractor3D {.
    importcpp: "vtkRenderWindowInteractor3D::SafeDownCast(@)",
    header: "vtkRenderWindowInteractor3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderWindowInteractor3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderWindowInteractor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderWindowInteractor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderWindowInteractor3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderWindowInteractor3D; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRenderWindowInteractor3D.h".}
proc Enable*(this: var vtkRenderWindowInteractor3D) {.importcpp: "Enable",
    header: "vtkRenderWindowInteractor3D.h".}
proc Disable*(this: var vtkRenderWindowInteractor3D) {.importcpp: "Disable",
    header: "vtkRenderWindowInteractor3D.h".}
proc GetWorldEventPosition*(this: var vtkRenderWindowInteractor3D;
                           pointerIndex: cint): ptr cdouble {.
    importcpp: "GetWorldEventPosition", header: "vtkRenderWindowInteractor3D.h".}
proc GetLastWorldEventPosition*(this: var vtkRenderWindowInteractor3D;
                               pointerIndex: cint): ptr cdouble {.
    importcpp: "GetLastWorldEventPosition",
    header: "vtkRenderWindowInteractor3D.h".}
proc GetWorldEventOrientation*(this: var vtkRenderWindowInteractor3D;
                              pointerIndex: cint): ptr cdouble {.
    importcpp: "GetWorldEventOrientation", header: "vtkRenderWindowInteractor3D.h".}
proc GetLastWorldEventOrientation*(this: var vtkRenderWindowInteractor3D;
                                  pointerIndex: cint): ptr cdouble {.
    importcpp: "GetLastWorldEventOrientation",
    header: "vtkRenderWindowInteractor3D.h".}
proc GetWorldEventPose*(this: var vtkRenderWindowInteractor3D;
                       poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "GetWorldEventPose", header: "vtkRenderWindowInteractor3D.h".}
proc GetLastWorldEventPose*(this: var vtkRenderWindowInteractor3D;
                           poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "GetLastWorldEventPose", header: "vtkRenderWindowInteractor3D.h".}
proc SetPhysicalEventPosition*(this: var vtkRenderWindowInteractor3D; x: cdouble;
                              y: cdouble; z: cdouble; pointerIndex: cint) {.
    importcpp: "SetPhysicalEventPosition", header: "vtkRenderWindowInteractor3D.h".}
proc SetPhysicalEventPose*(this: var vtkRenderWindowInteractor3D;
                          poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "SetPhysicalEventPose", header: "vtkRenderWindowInteractor3D.h".}
proc GetPhysicalEventPose*(this: var vtkRenderWindowInteractor3D;
                          poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "GetPhysicalEventPose", header: "vtkRenderWindowInteractor3D.h".}
proc GetLastPhysicalEventPose*(this: var vtkRenderWindowInteractor3D;
                              poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "GetLastPhysicalEventPose", header: "vtkRenderWindowInteractor3D.h".}
proc GetStartingPhysicalEventPose*(this: var vtkRenderWindowInteractor3D;
                                  poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "GetStartingPhysicalEventPose",
    header: "vtkRenderWindowInteractor3D.h".}
proc SetWorldEventPosition*(this: var vtkRenderWindowInteractor3D; x: cdouble;
                           y: cdouble; z: cdouble; pointerIndex: cint) {.
    importcpp: "SetWorldEventPosition", header: "vtkRenderWindowInteractor3D.h".}
proc SetWorldEventOrientation*(this: var vtkRenderWindowInteractor3D; w: cdouble;
                              x: cdouble; y: cdouble; z: cdouble; pointerIndex: cint) {.
    importcpp: "SetWorldEventOrientation", header: "vtkRenderWindowInteractor3D.h".}
proc SetWorldEventPose*(this: var vtkRenderWindowInteractor3D;
                       poseMatrix: ptr vtkMatrix4x4; pointerIndex: cint) {.
    importcpp: "SetWorldEventPose", header: "vtkRenderWindowInteractor3D.h".}
proc RightButtonPressEvent*(this: var vtkRenderWindowInteractor3D) {.
    importcpp: "RightButtonPressEvent", header: "vtkRenderWindowInteractor3D.h".}
proc RightButtonReleaseEvent*(this: var vtkRenderWindowInteractor3D) {.
    importcpp: "RightButtonReleaseEvent", header: "vtkRenderWindowInteractor3D.h".}
proc MiddleButtonPressEvent*(this: var vtkRenderWindowInteractor3D) {.
    importcpp: "MiddleButtonPressEvent", header: "vtkRenderWindowInteractor3D.h".}
proc MiddleButtonReleaseEvent*(this: var vtkRenderWindowInteractor3D) {.
    importcpp: "MiddleButtonReleaseEvent", header: "vtkRenderWindowInteractor3D.h".}
proc GetTouchPadPosition*(this: var vtkRenderWindowInteractor3D;
                         a2: vtkEventDataDevice; a3: vtkEventDataDeviceInput;
                         a4: array[3, cfloat]) {.importcpp: "GetTouchPadPosition",
    header: "vtkRenderWindowInteractor3D.h".}
proc SetPhysicalViewDirection*(this: var vtkRenderWindowInteractor3D; a2: cdouble;
                              a3: cdouble; a4: cdouble) {.
    importcpp: "SetPhysicalViewDirection", header: "vtkRenderWindowInteractor3D.h".}
proc GetPhysicalViewDirection*(this: var vtkRenderWindowInteractor3D): ptr cdouble {.
    importcpp: "GetPhysicalViewDirection", header: "vtkRenderWindowInteractor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the direction of the physical coordinate system +Y axis in world coordinates.
  ##
proc SetPhysicalViewUp*(this: var vtkRenderWindowInteractor3D; a2: cdouble;
                       a3: cdouble; a4: cdouble) {.importcpp: "SetPhysicalViewUp",
    header: "vtkRenderWindowInteractor3D.h".}
proc GetPhysicalViewUp*(this: var vtkRenderWindowInteractor3D): ptr cdouble {.
    importcpp: "GetPhysicalViewUp", header: "vtkRenderWindowInteractor3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get position of the physical coordinate system origin in world coordinates.
  ##
proc SetPhysicalTranslation*(this: var vtkRenderWindowInteractor3D;
                            a2: ptr vtkCamera; a3: cdouble; a4: cdouble; a5: cdouble) {.
    importcpp: "SetPhysicalTranslation", header: "vtkRenderWindowInteractor3D.h".}
proc GetPhysicalTranslation*(this: var vtkRenderWindowInteractor3D;
                            a2: ptr vtkCamera): ptr cdouble {.
    importcpp: "GetPhysicalTranslation", header: "vtkRenderWindowInteractor3D.h".}
proc SetPhysicalScale*(this: var vtkRenderWindowInteractor3D; a2: cdouble) {.
    importcpp: "SetPhysicalScale", header: "vtkRenderWindowInteractor3D.h".}
proc GetPhysicalScale*(this: var vtkRenderWindowInteractor3D): cdouble {.
    importcpp: "GetPhysicalScale", header: "vtkRenderWindowInteractor3D.h".}
proc SetTranslation3D*(this: var vtkRenderWindowInteractor3D; val: array[3, cdouble]) {.
    importcpp: "SetTranslation3D", header: "vtkRenderWindowInteractor3D.h".}
## !!!Ignored construct:  virtual double * GetTranslation3D ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Translation3D  pointer  << this -> Translation3D ) ; return this -> Translation3D ; } VTK_WRAPEXCLUDE virtual void GetTranslation3D ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Translation3D [ 0 ] ; _arg2 = this -> Translation3D [ 1 ] ; _arg3 = this -> Translation3D [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Translation3D  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTranslation3D ( double _arg [ 3 ] ) { this -> GetTranslation3D ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetTranslation3DLastTranslation3D ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LastTranslation3D  pointer  << this -> LastTranslation3D ) ; return this -> LastTranslation3D ; } VTK_WRAPEXCLUDE virtual void GetTranslation3DLastTranslation3D ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> LastTranslation3D [ 0 ] ; _arg2 = this -> LastTranslation3D [ 1 ] ; _arg3 = this -> LastTranslation3D [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LastTranslation3D  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTranslation3DLastTranslation3D ( double _arg [ 3 ] ) { this -> GetTranslation3DLastTranslation3D ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
