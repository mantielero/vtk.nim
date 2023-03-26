## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkVRInteractorStyle.h
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
##  @class   vtkVRInteractorStyle
##  @brief   Extended from vtkInteractorStyle3D to override command methods.
##
##  This abstract class defines an interactor style in a virtual reality context.
##

import
  vtkEventData, vtkInteractorStyle3D, vtkNew, vtkRenderingVRModule, vtkSmartPointer

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkCell"
discard "forward decl of vtkPlane"
discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of vtkSelection"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTextActor3D"
discard "forward decl of vtkVRControlsHelper"
discard "forward decl of vtkVRHardwarePicker"
discard "forward decl of vtkVRMenuRepresentation"
discard "forward decl of vtkVRMenuWidget"
type
  vtkVRInteractorStyle* {.importcpp: "vtkVRInteractorStyle",
                         header: "vtkVRInteractorStyle.h", bycopy.} = object of vtkInteractorStyle3D
    vtkVRInteractorStyle* {.importc: "vtkVRInteractorStyle".}: VTK_NEWINSTANCE
    ##  Device input to interaction state mapping
    ##  Store required controllers information when performing action
    ##  Store headset world orientation
    ##  Store movement style

  vtkVRInteractorStyleSuperclass* = vtkInteractorStyle3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVRInteractorStyle::IsTypeOf(@)",
    header: "vtkVRInteractorStyle.h".}
proc IsA*(this: var vtkVRInteractorStyle; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVRInteractorStyle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVRInteractorStyle {.
    importcpp: "vtkVRInteractorStyle::SafeDownCast(@)",
    header: "vtkVRInteractorStyle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVRInteractorStyle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVRInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVRInteractorStyle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVRInteractorStyle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVRInteractorStyle.h".}
proc OnSelect3D*(this: var vtkVRInteractorStyle; edata: ptr vtkEventData) {.
    importcpp: "OnSelect3D", header: "vtkVRInteractorStyle.h".}
proc OnNextPose3D*(this: var vtkVRInteractorStyle; edata: ptr vtkEventData) {.
    importcpp: "OnNextPose3D", header: "vtkVRInteractorStyle.h".}
proc OnViewerMovement3D*(this: var vtkVRInteractorStyle; edata: ptr vtkEventData) {.
    importcpp: "OnViewerMovement3D", header: "vtkVRInteractorStyle.h".}
proc OnMove3D*(this: var vtkVRInteractorStyle; edata: ptr vtkEventData) {.
    importcpp: "OnMove3D", header: "vtkVRInteractorStyle.h".}
proc OnMenu3D*(this: var vtkVRInteractorStyle; edata: ptr vtkEventData) {.
    importcpp: "OnMenu3D", header: "vtkVRInteractorStyle.h".}
proc OnElevation3D*(this: var vtkVRInteractorStyle; edata: ptr vtkEventData) {.
    importcpp: "OnElevation3D", header: "vtkVRInteractorStyle.h".}
proc StartPick*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "StartPick", header: "vtkVRInteractorStyle.h".}
proc EndPick*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "EndPick", header: "vtkVRInteractorStyle.h".}
proc StartLoadCamPose*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "StartLoadCamPose", header: "vtkVRInteractorStyle.h".}
proc EndLoadCamPose*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "EndLoadCamPose", header: "vtkVRInteractorStyle.h".}
proc StartPositionProp*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "StartPositionProp", header: "vtkVRInteractorStyle.h".}
proc EndPositionProp*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "EndPositionProp", header: "vtkVRInteractorStyle.h".}
proc StartClip*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "StartClip", header: "vtkVRInteractorStyle.h".}
proc EndClip*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "EndClip", header: "vtkVRInteractorStyle.h".}
proc StartMovement3D*(this: var vtkVRInteractorStyle; interactionState: cint;
                     a3: ptr vtkEventDataDevice3D) {.importcpp: "StartMovement3D",
    header: "vtkVRInteractorStyle.h".}
proc EndMovement3D*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "EndMovement3D", header: "vtkVRInteractorStyle.h".}
proc OnPan*(this: var vtkVRInteractorStyle) {.importcpp: "OnPan",
    header: "vtkVRInteractorStyle.h".}
proc OnPinch*(this: var vtkVRInteractorStyle) {.importcpp: "OnPinch",
    header: "vtkVRInteractorStyle.h".}
proc OnRotate*(this: var vtkVRInteractorStyle) {.importcpp: "OnRotate",
    header: "vtkVRInteractorStyle.h".}
proc ProbeData*(this: var vtkVRInteractorStyle; controller: vtkEventDataDevice) {.
    importcpp: "ProbeData", header: "vtkVRInteractorStyle.h".}
proc PositionProp*(this: var vtkVRInteractorStyle; a2: ptr vtkEventData;
                  lwpos: ptr cdouble = nil; lwori: ptr cdouble = nil) {.
    importcpp: "PositionProp", header: "vtkVRInteractorStyle.h".}
proc Clip*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "Clip", header: "vtkVRInteractorStyle.h".}
proc LoadNextCameraPose*(this: var vtkVRInteractorStyle) {.
    importcpp: "LoadNextCameraPose", header: "vtkVRInteractorStyle.h".}
proc GroundMovement3D*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "GroundMovement3D", header: "vtkVRInteractorStyle.h".}
proc Elevation3D*(this: var vtkVRInteractorStyle; a2: ptr vtkEventDataDevice3D) {.
    importcpp: "Elevation3D", header: "vtkVRInteractorStyle.h".}
proc MapInputToAction*(this: var vtkVRInteractorStyle; eid: EventIds; state: cint) {.
    importcpp: "MapInputToAction", header: "vtkVRInteractorStyle.h".}
proc MapInputToAction*(this: var vtkVRInteractorStyle; eid: EventIds;
                      action: vtkEventDataAction; state: cint) {.
    importcpp: "MapInputToAction", header: "vtkVRInteractorStyle.h".}
proc AddTooltipForInput*(this: var vtkVRInteractorStyle; device: vtkEventDataDevice;
                        input: vtkEventDataDeviceInput; text: string = "") {.
    importcpp: "AddTooltipForInput", header: "vtkVRInteractorStyle.h".}
proc MakeControlsHelper*(this: var vtkVRInteractorStyle): ptr vtkVRControlsHelper {.
    importcpp: "MakeControlsHelper", header: "vtkVRInteractorStyle.h".}
proc SetHoverPick*(this: var vtkVRInteractorStyle; _arg: bool) {.
    importcpp: "SetHoverPick", header: "vtkVRInteractorStyle.h".}
## !!!Ignored construct:  virtual bool GetHoverPick ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HoverPick  of  << this -> HoverPick ) ; return this -> HoverPick ; } ;
## Error: expected ';'!!!

proc HoverPickOn*(this: var vtkVRInteractorStyle) {.importcpp: "HoverPickOn",
    header: "vtkVRInteractorStyle.h".}
proc HoverPickOff*(this: var vtkVRInteractorStyle) {.importcpp: "HoverPickOff",
    header: "vtkVRInteractorStyle.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify if the grab mode uses the ray to grab distant objects.
  ##  Default is set to on.
  ##
proc SetHoverPickGrabWithRay*(this: var vtkVRInteractorStyle; _arg: bool) {.
    importcpp: "SetHoverPickGrabWithRay", header: "vtkVRInteractorStyle.h".}
## !!!Ignored construct:  virtual bool GetHoverPickGrabWithRay ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GrabWithRay  of  << this -> GrabWithRay ) ; return this -> GrabWithRay ; } ;
## Error: expected ';'!!!

proc GrabWithRayOn*(this: var vtkVRInteractorStyle) {.importcpp: "GrabWithRayOn",
    header: "vtkVRInteractorStyle.h".}
proc GrabWithRayOff*(this: var vtkVRInteractorStyle) {.importcpp: "GrabWithRayOff",
    header: "vtkVRInteractorStyle.h".}
  ## /@}
type
  vtkVRInteractorStyleMovementStyle* {.size: sizeof(cint), importcpp: "vtkVRInteractorStyle::MovementStyle",
                                      header: "vtkVRInteractorStyle.h".} = enum
    FLY_STYLE, GROUNDED_STYLE


proc SetHoverPickGrabWithRayStyle*(this: var vtkVRInteractorStyle;
                                  _arg: vtkVRInteractorStyleMovementStyle) {.
    importcpp: "SetHoverPickGrabWithRayStyle", header: "vtkVRInteractorStyle.h".}
## !!!Ignored construct:  virtual MovementStyle GetHoverPickGrabWithRayStyle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Style  of  << this -> Style ) ; return this -> Style ; } ;
## Error: expected ';'!!!

proc GetInteractionState*(this: var vtkVRInteractorStyle; device: vtkEventDataDevice): cint {.
    importcpp: "GetInteractionState", header: "vtkVRInteractorStyle.h".}
proc ShowRay*(this: var vtkVRInteractorStyle; controller: vtkEventDataDevice) {.
    importcpp: "ShowRay", header: "vtkVRInteractorStyle.h".}
proc HideRay*(this: var vtkVRInteractorStyle; controller: vtkEventDataDevice) {.
    importcpp: "HideRay", header: "vtkVRInteractorStyle.h".}
proc ShowBillboard*(this: var vtkVRInteractorStyle; text: string) {.
    importcpp: "ShowBillboard", header: "vtkVRInteractorStyle.h".}
proc HideBillboard*(this: var vtkVRInteractorStyle) {.importcpp: "HideBillboard",
    header: "vtkVRInteractorStyle.h".}
proc ShowPickSphere*(this: var vtkVRInteractorStyle; pos: ptr cdouble; radius: cdouble;
                    a4: ptr vtkProp3D) {.importcpp: "ShowPickSphere",
                                      header: "vtkVRInteractorStyle.h".}
proc ShowPickCell*(this: var vtkVRInteractorStyle; cell: ptr vtkCell; a3: ptr vtkProp3D) {.
    importcpp: "ShowPickCell", header: "vtkVRInteractorStyle.h".}
proc HidePickActor*(this: var vtkVRInteractorStyle) {.importcpp: "HidePickActor",
    header: "vtkVRInteractorStyle.h".}
proc ToggleDrawControls*(this: var vtkVRInteractorStyle) {.
    importcpp: "ToggleDrawControls", header: "vtkVRInteractorStyle.h".}
proc SetDrawControls*(this: var vtkVRInteractorStyle; a2: bool) {.
    importcpp: "SetDrawControls", header: "vtkVRInteractorStyle.h".}
proc SetInteractor*(this: var vtkVRInteractorStyle;
                   iren: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkVRInteractorStyle.h".}
proc SetupActions*(this: var vtkVRInteractorStyle;
                  iren: ptr vtkRenderWindowInteractor) {.importcpp: "SetupActions",
    header: "vtkVRInteractorStyle.h".}
proc GetMenu*(this: var vtkVRInteractorStyle): ptr vtkVRMenuWidget {.
    importcpp: "GetMenu", header: "vtkVRInteractorStyle.h".}