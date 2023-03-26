## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVRRenderWindowInteractor.h
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
##  @class   vtkVRRenderWindowInteractor
##  @brief   Implements VR specific functions required by vtkRenderWindowInteractor.
##

import
  vtkEventData, vtkNew, vtkRenderWindowInteractor3D, vtkRenderingVRModule

discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkVRRenderWindow"
type
  vtkVRRenderWindowInteractor* {.importcpp: "vtkVRRenderWindowInteractor",
                                header: "vtkVRRenderWindowInteractor.h", bycopy.} = object of vtkRenderWindowInteractor3D
    vtkVRRenderWindowInteractor* {.importc: "vtkVRRenderWindowInteractor".}: VTK_NEWINSTANCE

  vtkVRRenderWindowInteractorSuperclass* = vtkRenderWindowInteractor3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVRRenderWindowInteractor::IsTypeOf(@)",
    header: "vtkVRRenderWindowInteractor.h".}
proc IsA*(this: var vtkVRRenderWindowInteractor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVRRenderWindowInteractor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVRRenderWindowInteractor {.
    importcpp: "vtkVRRenderWindowInteractor::SafeDownCast(@)",
    header: "vtkVRRenderWindowInteractor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVRRenderWindowInteractor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkRenderWindowInteractor3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRRenderWindowInteractor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRRenderWindowInteractor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVRRenderWindowInteractor; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkVRRenderWindowInteractor.h".}
proc Initialize*(this: var vtkVRRenderWindowInteractor) {.importcpp: "Initialize",
    header: "vtkVRRenderWindowInteractor.h".}
proc ProcessEvents*(this: var vtkVRRenderWindowInteractor) {.
    importcpp: "ProcessEvents", header: "vtkVRRenderWindowInteractor.h".}
proc DoOneEvent*(this: var vtkVRRenderWindowInteractor;
                renWin: ptr vtkVRRenderWindow; ren: ptr vtkRenderer) {.
    importcpp: "DoOneEvent", header: "vtkVRRenderWindowInteractor.h".}
proc SetClassExitMethod*(f: proc (a1: pointer); arg: pointer) {.
    importcpp: "vtkVRRenderWindowInteractor::SetClassExitMethod(@)",
    header: "vtkVRRenderWindowInteractor.h".}
proc SetClassExitMethodArgDelete*(f: proc (a1: pointer)) {.
    importcpp: "vtkVRRenderWindowInteractor::SetClassExitMethodArgDelete(@)",
    header: "vtkVRRenderWindowInteractor.h".}
proc ExitCallback*(this: var vtkVRRenderWindowInteractor) {.
    importcpp: "ExitCallback", header: "vtkVRRenderWindowInteractor.h".}
proc SetPhysicalViewDirection*(this: var vtkVRRenderWindowInteractor; a2: cdouble;
                              a3: cdouble; a4: cdouble) {.
    importcpp: "SetPhysicalViewDirection", header: "vtkVRRenderWindowInteractor.h".}
proc GetPhysicalViewDirection*(this: var vtkVRRenderWindowInteractor): ptr cdouble {.
    importcpp: "GetPhysicalViewDirection", header: "vtkVRRenderWindowInteractor.h".}
proc SetPhysicalViewUp*(this: var vtkVRRenderWindowInteractor; a2: cdouble;
                       a3: cdouble; a4: cdouble) {.importcpp: "SetPhysicalViewUp",
    header: "vtkVRRenderWindowInteractor.h".}
proc GetPhysicalViewUp*(this: var vtkVRRenderWindowInteractor): ptr cdouble {.
    importcpp: "GetPhysicalViewUp", header: "vtkVRRenderWindowInteractor.h".}
proc SetPhysicalTranslation*(this: var vtkVRRenderWindowInteractor;
                            a2: ptr vtkCamera; a3: cdouble; a4: cdouble; a5: cdouble) {.
    importcpp: "SetPhysicalTranslation", header: "vtkVRRenderWindowInteractor.h".}
proc GetPhysicalTranslation*(this: var vtkVRRenderWindowInteractor;
                            a2: ptr vtkCamera): ptr cdouble {.
    importcpp: "GetPhysicalTranslation", header: "vtkVRRenderWindowInteractor.h".}
proc SetPhysicalScale*(this: var vtkVRRenderWindowInteractor; a2: cdouble) {.
    importcpp: "SetPhysicalScale", header: "vtkVRRenderWindowInteractor.h".}
proc GetPhysicalScale*(this: var vtkVRRenderWindowInteractor): cdouble {.
    importcpp: "GetPhysicalScale", header: "vtkVRRenderWindowInteractor.h".}
proc GetPointerDevice*(this: var vtkVRRenderWindowInteractor): vtkEventDataDevice {.
    importcpp: "GetPointerDevice", header: "vtkVRRenderWindowInteractor.h".}
proc ConvertPoseToWorldCoordinates*(this: var vtkVRRenderWindowInteractor;
                                   poseInTrackingCoordinates: ptr vtkMatrix4x4;
                                   pos: array[3, cdouble]; wxyz: array[4, cdouble];
                                   ppos: array[3, cdouble]; wdir: array[3, cdouble]) {.
    importcpp: "ConvertPoseToWorldCoordinates",
    header: "vtkVRRenderWindowInteractor.h".}
proc GetStartingPhysicalToWorldMatrix*(this: var vtkVRRenderWindowInteractor;
    startingPhysicalToWorldMatrix: ptr vtkMatrix4x4) {.
    importcpp: "GetStartingPhysicalToWorldMatrix",
    header: "vtkVRRenderWindowInteractor.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the .json file describing action bindings for events.
##  Based on https://github.com/ValveSoftware/openvr/wiki/Action-manifest
##  virtual std :: string GetActionManifestFileNameActionManifestFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActionManifestFileName  of  << this -> ActionManifestFileName ) ; return this -> ActionManifestFileName ; } ;
## Error: expected ';'!!!

proc SetActionManifestFileName*(this: var vtkVRRenderWindowInteractor; _arg: string) {.
    importcpp: "SetActionManifestFileName",
    header: "vtkVRRenderWindowInteractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the .json file describing the action set to use.
  ##
## !!!Ignored construct:  virtual std :: string GetActionManifestFileNameActionManifestFileNameActionSetName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActionSetName  of  << this -> ActionSetName ) ; return this -> ActionSetName ; } ;
## Error: expected ';'!!!

proc SetActionManifestFileNameActionSetName*(
    this: var vtkVRRenderWindowInteractor; _arg: string) {.
    importcpp: "SetActionManifestFileNameActionSetName",
    header: "vtkVRRenderWindowInteractor.h".}
  ## /@}