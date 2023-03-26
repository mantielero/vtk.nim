## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenXRRenderWindowInteractor.h
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
##  @class   vtkOpenXRRenderWindowInteractor
##  @brief   implements OpenXR specific functions
##  required by vtkRenderWindowInteractor.
##
##

import
  vtkRenderingOpenXRModule, vtkVRRenderWindowInteractor, vtkEventData,
  vtkOpenXRManager

type
  Action_t* = Action_t
  vtkOpenXRRenderWindowInteractor* {.importcpp: "vtkOpenXRRenderWindowInteractor", header: "vtkOpenXRRenderWindowInteractor.h",
                                    bycopy.} = object of vtkVRRenderWindowInteractor
    vtkOpenXRRenderWindowInteractor* {.importc: "vtkOpenXRRenderWindowInteractor".}: VTK_NEWINSTANCE
    ##  used in calculations


proc New*(): ptr vtkOpenXRRenderWindowInteractor {.
    importcpp: "vtkOpenXRRenderWindowInteractor::New(@)",
    header: "vtkOpenXRRenderWindowInteractor.h".}
type
  vtkOpenXRRenderWindowInteractorSuperclass* = vtkVRRenderWindowInteractor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenXRRenderWindowInteractor::IsTypeOf(@)",
    header: "vtkOpenXRRenderWindowInteractor.h".}
proc IsA*(this: var vtkOpenXRRenderWindowInteractor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenXRRenderWindowInteractor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenXRRenderWindowInteractor {.
    importcpp: "vtkOpenXRRenderWindowInteractor::SafeDownCast(@)",
    header: "vtkOpenXRRenderWindowInteractor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenXRRenderWindowInteractor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVRRenderWindowInteractor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenXRRenderWindowInteractor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenXRRenderWindowInteractor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc Initialize*(this: var vtkOpenXRRenderWindowInteractor) {.
    importcpp: "Initialize", header: "vtkOpenXRRenderWindowInteractor.h".}
proc DoOneEvent*(this: var vtkOpenXRRenderWindowInteractor;
                renWin: ptr vtkVRRenderWindow; ren: ptr vtkRenderer) {.
    importcpp: "DoOneEvent", header: "vtkOpenXRRenderWindowInteractor.h".}
proc GetHandPose*(this: var vtkOpenXRRenderWindowInteractor; hand: uint32_t): ptr XrPosef {.
    importcpp: "GetHandPose", header: "vtkOpenXRRenderWindowInteractor.h".}
proc AddAction*(this: var vtkOpenXRRenderWindowInteractor; path: string; a3: EventIds) {.
    importcpp: "AddAction", header: "vtkOpenXRRenderWindowInteractor.h".}
proc AddAction*(this: var vtkOpenXRRenderWindowInteractor; path: string;
               a3: function[proc (a1: ptr vtkEventData)]) {.importcpp: "AddAction",
    header: "vtkOpenXRRenderWindowInteractor.h".}
proc ConvertOpenXRPoseToWorldCoordinates*(
    this: var vtkOpenXRRenderWindowInteractor; xrPose: XrPosef;
    pos: array[3, cdouble]; wxyz: array[4, cdouble]; ppos: array[3, cdouble];
    wdir: array[3, cdouble]) {.importcpp: "ConvertOpenXRPoseToWorldCoordinates",
                            header: "vtkOpenXRRenderWindowInteractor.h".}
  ##  Output world position
  ##  Output world orientation quaternion
  ##  Output physical position
proc ApplyVibration*(this: var vtkOpenXRRenderWindowInteractor; actionName: string;
                    hand: cint; amplitude: cfloat = 0.5f;
                    duration: cfloat = 25000000.0f;
                    frequency: cfloat = XR_FREQUENCY_UNSPECIFIED): bool {.
    importcpp: "ApplyVibration", header: "vtkOpenXRRenderWindowInteractor.h".}
type
  MapAction* = map[string, ptr vtkOpenXRRenderWindowInteractorActionData]

##  VTK-HeaderTest-Exclude: vtkOpenXRRenderWindowInteractor.h
