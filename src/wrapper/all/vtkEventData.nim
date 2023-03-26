## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEventData.h
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
##  @brief   platform-independent event data structures
##

import
  vtkCommand

##  enumeration of possible devices

type
  vtkEventDataDevice* {.size: sizeof(cint), importcpp: "vtkEventDataDevice",
                       header: "vtkEventData.h".} = enum
    Unknown = -1, HeadMountedDisplay, RightController, LeftController, GenericTracker,
    Any, NumberOfDevices


var vtkEventDataNumberOfDevices* {.importcpp: "vtkEventDataNumberOfDevices",
                                 header: "vtkEventData.h".}: cint

##  enumeration of possible device inputs

type
  vtkEventDataDeviceInput* {.size: sizeof(cint),
                            importcpp: "vtkEventDataDeviceInput",
                            header: "vtkEventData.h".} = enum
    Unknown = -1, Any, Trigger, TrackPad, Joystick, Grip, ApplicationMenu, NumberOfInputs


var vtkEventDataNumberOfInputs* {.importcpp: "vtkEventDataNumberOfInputs",
                                header: "vtkEventData.h".}: cint

##  enumeration of actions that can happen

type
  vtkEventDataAction* {.size: sizeof(cint), importcpp: "vtkEventDataAction",
                       header: "vtkEventData.h".} = enum
    Unknown = -1, Any, Press, Release, Touch, Untouch, NumberOfActions


discard "forward decl of vtkEventDataForDevice"
discard "forward decl of vtkEventDataDevice3D"
type
  vtkEventData* {.importcpp: "vtkEventData", header: "vtkEventData.h", bycopy.} = object of vtkObjectBase
    vtkEventData* {.importc: "vtkEventData".}: VTK_NEWINSTANCE

  vtkEventDataSuperclass* = vtkObjectBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEventData::IsTypeOf(@)", header: "vtkEventData.h".}
proc IsA*(this: var vtkEventData; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkEventData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEventData {.
    importcpp: "vtkEventData::SafeDownCast(@)", header: "vtkEventData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEventData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObjectBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEventData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : virtual vtkObjectBase * NewInstanceInternal ( ) const { return vtkEventData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc GetType*(this: vtkEventData): cint {.noSideEffect, importcpp: "GetType",
                                      header: "vtkEventData.h".}
proc SetType*(this: var vtkEventData; val: cint) {.importcpp: "SetType",
    header: "vtkEventData.h".}
proc `==`*(this: vtkEventData; a: vtkEventData): bool {.noSideEffect,
    importcpp: "(# == #)", header: "vtkEventData.h".}
proc GetAsEventDataForDevice*(this: var vtkEventData): ptr vtkEventDataForDevice {.
    importcpp: "GetAsEventDataForDevice", header: "vtkEventData.h".}
proc GetAsEventDataDevice3D*(this: var vtkEventData): ptr vtkEventDataDevice3D {.
    importcpp: "GetAsEventDataDevice3D", header: "vtkEventData.h".}
##  a subclass for events that may have one or more of
##  device, input, and action

type
  vtkEventDataForDevice* {.importcpp: "vtkEventDataForDevice",
                          header: "vtkEventData.h", bycopy.} = object of vtkEventData
    vtkEventDataForDevice* {.importc: "vtkEventDataForDevice".}: VTK_NEWINSTANCE

  vtkEventDataForDeviceSuperclass* = vtkEventData

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEventDataForDevice::IsTypeOf(@)", header: "vtkEventData.h".}
proc IsA*(this: var vtkEventDataForDevice; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEventData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEventDataForDevice {.
    importcpp: "vtkEventDataForDevice::SafeDownCast(@)", header: "vtkEventData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEventDataForDevice :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEventData :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEventDataForDevice :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEventDataForDevice :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkEventDataForDevice {.importcpp: "vtkEventDataForDevice::New(@)",
                                     header: "vtkEventData.h".}
proc GetDevice*(this: vtkEventDataForDevice): vtkEventDataDevice {.noSideEffect,
    importcpp: "GetDevice", header: "vtkEventData.h".}
proc GetInput*(this: vtkEventDataForDevice): vtkEventDataDeviceInput {.noSideEffect,
    importcpp: "GetInput", header: "vtkEventData.h".}
proc GetAction*(this: vtkEventDataForDevice): vtkEventDataAction {.noSideEffect,
    importcpp: "GetAction", header: "vtkEventData.h".}
proc SetDevice*(this: var vtkEventDataForDevice; v: vtkEventDataDevice) {.
    importcpp: "SetDevice", header: "vtkEventData.h".}
proc SetInput*(this: var vtkEventDataForDevice; v: vtkEventDataDeviceInput) {.
    importcpp: "SetInput", header: "vtkEventData.h".}
proc SetAction*(this: var vtkEventDataForDevice; v: vtkEventDataAction) {.
    importcpp: "SetAction", header: "vtkEventData.h".}
proc DeviceMatches*(this: var vtkEventDataForDevice; val: vtkEventDataDevice): bool {.
    importcpp: "DeviceMatches", header: "vtkEventData.h".}
proc GetAsEventDataForDevice*(this: var vtkEventDataForDevice): ptr vtkEventDataForDevice {.
    importcpp: "GetAsEventDataForDevice", header: "vtkEventData.h".}
##  a subclass for events that have a 3D world position
##  direction and orientation.

type
  vtkEventDataDevice3D* {.importcpp: "vtkEventDataDevice3D",
                         header: "vtkEventData.h", bycopy.} = object of vtkEventDataForDevice
    vtkEventDataDevice3D* {.importc: "vtkEventDataDevice3D".}: VTK_NEWINSTANCE
    WorldOrientation* {.importc: "WorldOrientation".}: array[4, cdouble]
    WorldDirection* {.importc: "WorldDirection".}: array[3, cdouble]
    TrackPadPosition* {.importc: "TrackPadPosition".}: array[2, cdouble]

  vtkEventDataDevice3DSuperclass* = vtkEventDataForDevice

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEventDataDevice3D::IsTypeOf(@)", header: "vtkEventData.h".}
proc IsA*(this: var vtkEventDataDevice3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEventData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEventDataDevice3D {.
    importcpp: "vtkEventDataDevice3D::SafeDownCast(@)", header: "vtkEventData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEventDataDevice3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEventDataForDevice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEventDataDevice3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEventDataDevice3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkEventDataDevice3D {.importcpp: "vtkEventDataDevice3D::New(@)",
                                    header: "vtkEventData.h".}
proc GetAsEventDataDevice3D*(this: var vtkEventDataDevice3D): ptr vtkEventDataDevice3D {.
    importcpp: "GetAsEventDataDevice3D", header: "vtkEventData.h".}
proc GetWorldPosition*(this: vtkEventDataDevice3D; v: array[3, cdouble]) {.
    noSideEffect, importcpp: "GetWorldPosition", header: "vtkEventData.h".}
## !!!Ignored construct:  const double * GetWorldPosition ( ) const VTK_SIZEHINT ( 3 ) { return this -> WorldPosition ; } void SetWorldPosition ( const double p [ 3 ] ) { this -> WorldPosition [ 0 ] = p [ 0 ] ; this -> WorldPosition [ 1 ] = p [ 1 ] ; this -> WorldPosition [ 2 ] = p [ 2 ] ; } void GetWorldDirection ( double v [ 3 ] ) const { v [ 0 ] = this -> WorldDirection [ 0 ] ; v [ 1 ] = this -> WorldDirection [ 1 ] ; v [ 2 ] = this -> WorldDirection [ 2 ] ; } const double * GetWorldDirection ( ) const VTK_SIZEHINT ( 3 ) { return this -> WorldDirection ; } void SetWorldDirection ( const double p [ 3 ] ) { this -> WorldDirection [ 0 ] = p [ 0 ] ; this -> WorldDirection [ 1 ] = p [ 1 ] ; this -> WorldDirection [ 2 ] = p [ 2 ] ; } void GetWorldOrientation ( double v [ 4 ] ) const { v [ 0 ] = this -> WorldOrientation [ 0 ] ; v [ 1 ] = this -> WorldOrientation [ 1 ] ; v [ 2 ] = this -> WorldOrientation [ 2 ] ; v [ 3 ] = this -> WorldOrientation [ 3 ] ; } const double * GetWorldOrientation ( ) const VTK_SIZEHINT ( 4 ) { return this -> WorldOrientation ; } void SetWorldOrientation ( const double p [ 4 ] ) { this -> WorldOrientation [ 0 ] = p [ 0 ] ; this -> WorldOrientation [ 1 ] = p [ 1 ] ; this -> WorldOrientation [ 2 ] = p [ 2 ] ; this -> WorldOrientation [ 3 ] = p [ 3 ] ; } void GetTrackPadPosition ( double v [ 2 ] ) const { v [ 0 ] = this -> TrackPadPosition [ 0 ] ; v [ 1 ] = this -> TrackPadPosition [ 1 ] ; } const double * GetTrackPadPosition ( ) const VTK_SIZEHINT ( 2 ) { return this -> TrackPadPosition ; } void SetTrackPadPosition ( const double p [ 2 ] ) { this -> TrackPadPosition [ 0 ] = p [ 0 ] ; this -> TrackPadPosition [ 1 ] = p [ 1 ] ; } void SetTrackPadPosition ( double x , double y ) { this -> TrackPadPosition [ 0 ] = x ; this -> TrackPadPosition [ 1 ] = y ; } protected : double WorldPosition [ 3 ] ;
## Error: expected ';'!!!

proc constructvtkEventDataDevice3D*(): vtkEventDataDevice3D {.constructor,
    importcpp: "vtkEventDataDevice3D(@)", header: "vtkEventData.h".}
proc destroyvtkEventDataDevice3D*(this: var vtkEventDataDevice3D) {.
    importcpp: "#.~vtkEventDataDevice3D()", header: "vtkEventData.h".}
##  VTK-HeaderTest-Exclude: vtkEventData.h
