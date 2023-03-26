## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkVRRenderWindow.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkVRRenderWindow
##  @brief   VR rendering window
##
##
##  vtkVRRenderWindow is a abstract class to define a RenderWindow in a
##  VR context.
##
##  VR provides HMD and controller positions in the "Physical" coordinate
##  system. For room scale VR this is based on the room setup
##  per the underlying VR API being used. Units are in meters.
##
##  Renderer shows actors in the World coordinate system. Transformation between
##  Physical and World coordinate systems is defined by PhysicalToWorldMatrix.
##  This matrix determines the user's position and orientation in the rendered
##  scene and scaling (magnification) of rendered actors.
##
##  This class introduces the notion of DeviceHandles. A DeviceHandle is
##  a uint32_t handle that represents a device in the underlying VR API
##  such as OpenVR or OpenXR. Implementations of this class are responsible
##  for mapping the actual devices from that API into unique DeviceHandles.
##  Typically these devices are handheld controllers, HMDs, stylus etc.
##  The subclass should call AddDeviceHandle when it first sees a new device.
##
##  This class also uses the term Device from vtkEventDataDevice to represent
##  a generic device type that is used in the event handling system. Multiple
##  DeviceHandles could point to the same Device though most often there is a
##  one to one mapping. For example vtkEventDataDevice::LeftController will
##  typically have one or zero DeviceHandles that map to it.
##
##  Most event processing works with generic devices and this class provides a
##  number of methods to support that. This class also provides a number of methods
##  that work on DeviceHandles which are typically used by VR classes and their
##  subclasses.
##

import
  vtkEventData, vtkNew, vtkOpenGLRenderWindow, vtkRenderingVRModule,
  vtkSmartPointer, vtk_glew

discard "forward decl of vtkCamera"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkVRModel"
type
  vtkVRRenderWindow* {.importcpp: "vtkVRRenderWindow",
                      header: "vtkVRRenderWindow.h", bycopy.} = object of vtkOpenGLRenderWindow
    vtkVRRenderWindow* {.importc: "vtkVRRenderWindow".}: VTK_NEWINSTANCE
    ##  One per view (typically one per eye)
    ##  -Z axis of the Physical to World matrix
    ##  Y axis of the Physical to World matrix
    ##  Inverse of the translation component of the Physical to World matrix, in mm
    ##  Scale of the Physical to World matrix


const
  vtkVRRenderWindowPhysicalToWorldMatrixModified* = UserEvent + 200

const
  vtkVRRenderWindowLeftEye* = 0
  vtkVRRenderWindowRightEye* = 1

type
  vtkVRRenderWindowSuperclass* = vtkOpenGLRenderWindow

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVRRenderWindow::IsTypeOf(@)", header: "vtkVRRenderWindow.h".}
proc IsA*(this: var vtkVRRenderWindow; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVRRenderWindow.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVRRenderWindow {.
    importcpp: "vtkVRRenderWindow::SafeDownCast(@)", header: "vtkVRRenderWindow.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVRRenderWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOpenGLRenderWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRRenderWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRRenderWindow :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVRRenderWindow; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVRRenderWindow.h".}
proc MakeRenderWindowInteractor*(this: var vtkVRRenderWindow): ptr vtkRenderWindowInteractor {.
    importcpp: "MakeRenderWindowInteractor", header: "vtkVRRenderWindow.h".}
proc GetLeftResolveBufferId*(this: var vtkVRRenderWindow): GLuint {.
    importcpp: "GetLeftResolveBufferId", header: "vtkVRRenderWindow.h".}
proc GetRightResolveBufferId*(this: var vtkVRRenderWindow): GLuint {.
    importcpp: "GetRightResolveBufferId", header: "vtkVRRenderWindow.h".}
proc GetRenderBufferSize*(this: var vtkVRRenderWindow; width: var cint;
                         height: var cint) {.importcpp: "GetRenderBufferSize",
    header: "vtkVRRenderWindow.h".}
proc GetModelForDevice*(this: var vtkVRRenderWindow; idx: vtkEventDataDevice): ptr vtkVRModel {.
    importcpp: "GetModelForDevice", header: "vtkVRRenderWindow.h".}
proc GetModelForDeviceHandle*(this: var vtkVRRenderWindow; handle: uint32_t): ptr vtkVRModel {.
    importcpp: "GetModelForDeviceHandle", header: "vtkVRRenderWindow.h".}
proc SetModelForDeviceHandle*(this: var vtkVRRenderWindow; handle: uint32_t;
                             model: ptr vtkVRModel) {.
    importcpp: "SetModelForDeviceHandle", header: "vtkVRRenderWindow.h".}
proc GetDeviceToPhysicalMatrixForDevice*(this: var vtkVRRenderWindow;
                                        idx: vtkEventDataDevice): ptr vtkMatrix4x4 {.
    importcpp: "GetDeviceToPhysicalMatrixForDevice", header: "vtkVRRenderWindow.h".}
proc GetDeviceToPhysicalMatrixForDeviceHandle*(this: var vtkVRRenderWindow;
    handle: uint32_t): ptr vtkMatrix4x4 {.importcpp: "GetDeviceToPhysicalMatrixForDeviceHandle",
                                      header: "vtkVRRenderWindow.h".}
proc GetDeviceHandleForDevice*(this: var vtkVRRenderWindow; dev: vtkEventDataDevice;
                              index: uint32_t = 0): uint32_t {.
    importcpp: "GetDeviceHandleForDevice", header: "vtkVRRenderWindow.h".}
proc GetNumberOfDeviceHandlesForDevice*(this: var vtkVRRenderWindow;
                                       dev: vtkEventDataDevice): uint32_t {.
    importcpp: "GetNumberOfDeviceHandlesForDevice", header: "vtkVRRenderWindow.h".}
proc AddDeviceHandle*(this: var vtkVRRenderWindow; handle: uint32_t) {.
    importcpp: "AddDeviceHandle", header: "vtkVRRenderWindow.h".}
proc AddDeviceHandle*(this: var vtkVRRenderWindow; handle: uint32_t;
                     device: vtkEventDataDevice) {.importcpp: "AddDeviceHandle",
    header: "vtkVRRenderWindow.h".}
proc GetDeviceForDeviceHandle*(this: var vtkVRRenderWindow; handle: uint32_t): vtkEventDataDevice {.
    importcpp: "GetDeviceForDeviceHandle", header: "vtkVRRenderWindow.h".}
proc GetDeviceToWorldMatrixForDevice*(this: var vtkVRRenderWindow;
                                     device: vtkEventDataDevice;
                                     deviceToWorldMatrix: ptr vtkMatrix4x4): bool {.
    importcpp: "GetDeviceToWorldMatrixForDevice", header: "vtkVRRenderWindow.h".}
proc GetDeviceToWorldMatrixForDeviceHandle*(this: var vtkVRRenderWindow;
    handle: uint32_t; deviceToWorldMatrix: ptr vtkMatrix4x4): bool {.
    importcpp: "GetDeviceToWorldMatrixForDeviceHandle",
    header: "vtkVRRenderWindow.h".}
proc InitializeViewFromCamera*(this: var vtkVRRenderWindow; cam: ptr vtkCamera) {.
    importcpp: "InitializeViewFromCamera", header: "vtkVRRenderWindow.h".}
proc SetPhysicalViewDirection*(this: var vtkVRRenderWindow; a2: cdouble; a3: cdouble;
                              a4: cdouble) {.
    importcpp: "SetPhysicalViewDirection", header: "vtkVRRenderWindow.h".}
proc SetPhysicalViewDirection*(this: var vtkVRRenderWindow; a2: array[3, cdouble]) {.
    importcpp: "SetPhysicalViewDirection", header: "vtkVRRenderWindow.h".}
## !!!Ignored construct:  virtual double * GetPhysicalViewDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalViewDirection  pointer  << this -> PhysicalViewDirection ) ; return this -> PhysicalViewDirection ; } VTK_WRAPEXCLUDE virtual void GetPhysicalViewDirection ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PhysicalViewDirection [ 0 ] ; _arg2 = this -> PhysicalViewDirection [ 1 ] ; _arg3 = this -> PhysicalViewDirection [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalViewDirection  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPhysicalViewDirection ( double _arg [ 3 ] ) { this -> GetPhysicalViewDirection ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPhysicalViewUp*(this: var vtkVRRenderWindow; a2: cdouble; a3: cdouble;
                       a4: cdouble) {.importcpp: "SetPhysicalViewUp",
                                    header: "vtkVRRenderWindow.h".}
proc SetPhysicalViewUp*(this: var vtkVRRenderWindow; a2: array[3, cdouble]) {.
    importcpp: "SetPhysicalViewUp", header: "vtkVRRenderWindow.h".}
## !!!Ignored construct:  virtual double * GetPhysicalViewDirectionPhysicalViewUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalViewUp  pointer  << this -> PhysicalViewUp ) ; return this -> PhysicalViewUp ; } VTK_WRAPEXCLUDE virtual void GetPhysicalViewDirectionPhysicalViewUp ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PhysicalViewUp [ 0 ] ; _arg2 = this -> PhysicalViewUp [ 1 ] ; _arg3 = this -> PhysicalViewUp [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalViewUp  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPhysicalViewDirectionPhysicalViewUp ( double _arg [ 3 ] ) { this -> GetPhysicalViewDirectionPhysicalViewUp ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPhysicalTranslation*(this: var vtkVRRenderWindow; a2: cdouble; a3: cdouble;
                            a4: cdouble) {.importcpp: "SetPhysicalTranslation",
    header: "vtkVRRenderWindow.h".}
proc SetPhysicalTranslation*(this: var vtkVRRenderWindow; a2: array[3, cdouble]) {.
    importcpp: "SetPhysicalTranslation", header: "vtkVRRenderWindow.h".}
## !!!Ignored construct:  virtual double * GetPhysicalViewDirectionPhysicalViewUpPhysicalTranslation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalTranslation  pointer  << this -> PhysicalTranslation ) ; return this -> PhysicalTranslation ; } VTK_WRAPEXCLUDE virtual void GetPhysicalViewDirectionPhysicalViewUpPhysicalTranslation ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PhysicalTranslation [ 0 ] ; _arg2 = this -> PhysicalTranslation [ 1 ] ; _arg3 = this -> PhysicalTranslation [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalTranslation  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPhysicalViewDirectionPhysicalViewUpPhysicalTranslation ( double _arg [ 3 ] ) { this -> GetPhysicalViewDirectionPhysicalViewUpPhysicalTranslation ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetPhysicalScale*(this: var vtkVRRenderWindow; a2: cdouble) {.
    importcpp: "SetPhysicalScale", header: "vtkVRRenderWindow.h".}
## !!!Ignored construct:  virtual double GetPhysicalScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhysicalScale  of  << this -> PhysicalScale ) ; return this -> PhysicalScale ; } ;
## Error: expected ';'!!!

proc SetPhysicalToWorldMatrix*(this: var vtkVRRenderWindow; matrix: ptr vtkMatrix4x4) {.
    importcpp: "SetPhysicalToWorldMatrix", header: "vtkVRRenderWindow.h".}
proc GetPhysicalToWorldMatrix*(this: var vtkVRRenderWindow; matrix: ptr vtkMatrix4x4) {.
    importcpp: "GetPhysicalToWorldMatrix", header: "vtkVRRenderWindow.h".}
proc AddRenderer*(this: var vtkVRRenderWindow; a2: ptr vtkRenderer) {.
    importcpp: "AddRenderer", header: "vtkVRRenderWindow.h".}
proc Start*(this: var vtkVRRenderWindow) {.importcpp: "Start",
                                       header: "vtkVRRenderWindow.h".}
proc Initialize*(this: var vtkVRRenderWindow) {.importcpp: "Initialize",
    header: "vtkVRRenderWindow.h".}
proc Finalize*(this: var vtkVRRenderWindow) {.importcpp: "Finalize",
    header: "vtkVRRenderWindow.h".}
proc MakeCurrent*(this: var vtkVRRenderWindow) {.importcpp: "MakeCurrent",
    header: "vtkVRRenderWindow.h".}
proc ReleaseCurrent*(this: var vtkVRRenderWindow) {.importcpp: "ReleaseCurrent",
    header: "vtkVRRenderWindow.h".}
proc IsCurrent*(this: var vtkVRRenderWindow): bool {.importcpp: "IsCurrent",
    header: "vtkVRRenderWindow.h".}
proc ReportCapabilities*(this: var vtkVRRenderWindow): cstring {.
    importcpp: "ReportCapabilities", header: "vtkVRRenderWindow.h".}
proc IsDirect*(this: var vtkVRRenderWindow): vtkTypeBool {.importcpp: "IsDirect",
    header: "vtkVRRenderWindow.h".}
proc GetEventPending*(this: var vtkVRRenderWindow): vtkTypeBool {.
    importcpp: "GetEventPending", header: "vtkVRRenderWindow.h".}
proc GetScreenSize*(this: var vtkVRRenderWindow): ptr cint {.
    importcpp: "GetScreenSize", header: "vtkVRRenderWindow.h".}
proc SetSize*(this: var vtkVRRenderWindow; width: cint; height: cint) {.
    importcpp: "SetSize", header: "vtkVRRenderWindow.h".}
proc SetSize*(this: var vtkVRRenderWindow; a: array[2, cint]) {.importcpp: "SetSize",
    header: "vtkVRRenderWindow.h".}
proc GetGenericDisplayId*(this: var vtkVRRenderWindow): pointer {.
    importcpp: "GetGenericDisplayId", header: "vtkVRRenderWindow.h".}
proc GetGenericWindowId*(this: var vtkVRRenderWindow): pointer {.
    importcpp: "GetGenericWindowId", header: "vtkVRRenderWindow.h".}
proc GetGenericParentId*(this: var vtkVRRenderWindow): pointer {.
    importcpp: "GetGenericParentId", header: "vtkVRRenderWindow.h".}
proc GetGenericContext*(this: var vtkVRRenderWindow): pointer {.
    importcpp: "GetGenericContext", header: "vtkVRRenderWindow.h".}
proc GetGenericDrawable*(this: var vtkVRRenderWindow): pointer {.
    importcpp: "GetGenericDrawable", header: "vtkVRRenderWindow.h".}
proc SupportsOpenGL*(this: var vtkVRRenderWindow): cint {.
    importcpp: "SupportsOpenGL", header: "vtkVRRenderWindow.h".}
proc Render*(this: var vtkVRRenderWindow) {.importcpp: "Render",
                                        header: "vtkVRRenderWindow.h".}
proc GetnameHelperWindow*(this: var vtkVRRenderWindow): ptr vtkOpenGLRenderWindow {.
    importcpp: "GetnameHelperWindow", header: "vtkVRRenderWindow.h".}
proc SetHelperWindow*(this: var vtkVRRenderWindow; val: ptr vtkOpenGLRenderWindow) {.
    importcpp: "SetHelperWindow", header: "vtkVRRenderWindow.h".}
proc GetState*(this: var vtkVRRenderWindow): ptr vtkOpenGLState {.
    importcpp: "GetState", header: "vtkVRRenderWindow.h".}
proc ReleaseGraphicsResources*(this: var vtkVRRenderWindow; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkVRRenderWindow.h".}
proc RenderModels*(this: var vtkVRRenderWindow) {.importcpp: "RenderModels",
    header: "vtkVRRenderWindow.h".}
proc SetTrackHMD*(this: var vtkVRRenderWindow; _arg: bool) {.importcpp: "SetTrackHMD",
    header: "vtkVRRenderWindow.h".}
## !!!Ignored construct:  virtual bool GetPhysicalScaleTrackHMD ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TrackHMD  of  << this -> TrackHMD ) ; return this -> TrackHMD ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} @{ *
##  Set/Get the visibility of the base stations. Defaults to false
##  virtual bool GetPhysicalScaleTrackHMDBaseStationVisibilityBaseStationVisibility ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BaseStationVisibility  of  << this -> BaseStationVisibility ) ; return this -> BaseStationVisibility ; } ;
## Error: expected ';'!!!

proc SetTrackHMDBaseStationVisibility*(this: var vtkVRRenderWindow; _arg: bool) {.
    importcpp: "SetTrackHMDBaseStationVisibility", header: "vtkVRRenderWindow.h".}
proc BaseStationVisibilityOn*(this: var vtkVRRenderWindow) {.
    importcpp: "BaseStationVisibilityOn", header: "vtkVRRenderWindow.h".}
proc BaseStationVisibilityOff*(this: var vtkVRRenderWindow) {.
    importcpp: "BaseStationVisibilityOff", header: "vtkVRRenderWindow.h".}
  ## @}
  ## *
  ##  Update the HMD pose.
  ##
proc UpdateHMDMatrixPose*(this: var vtkVRRenderWindow) {.
    importcpp: "UpdateHMDMatrixPose", header: "vtkVRRenderWindow.h".}
  ## *
  ##  Get whether the window has been initialized successfully.
  ##
## !!!Ignored construct:  virtual bool GetPhysicalScaleTrackHMDBaseStationVisibilityBaseStationVisibilityInitialized ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Initialized  of  << this -> Initialized ) ; return this -> Initialized ; } ;
## Error: expected ';'!!!
