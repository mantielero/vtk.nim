## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumePicker.h
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
##  @class   vtkVolumePicker
##  @brief   ray-cast picker enhanced for volumes
##
##  vtkVolumePicker is a subclass of vtkCellPicker.  It has one
##  advantage over vtkCellPicker for volumes: it will be able to
##  correctly perform picking when CroppingPlanes are present.  This
##  isn't possible for vtkCellPicker since it doesn't link to
##  the VolumeRendering classes and hence cannot access information
##  about the CroppingPlanes.
##
##  @sa
##  vtkPicker vtkPointPicker vtkCellPicker
##
##  @par Thanks:
##  This class was contributed to VTK by David Gobbi on behalf of Atamai Inc.
##

import
  vtkCellPicker, vtkRenderingVolumeModule

type
  vtkVolumePicker* {.importcpp: "vtkVolumePicker", header: "vtkVolumePicker.h",
                    bycopy.} = object of vtkCellPicker
    vtkVolumePicker* {.importc: "vtkVolumePicker".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVolumePicker {.importcpp: "vtkVolumePicker::New(@)",
                               header: "vtkVolumePicker.h".}
type
  vtkVolumePickerSuperclass* = vtkCellPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVolumePicker::IsTypeOf(@)", header: "vtkVolumePicker.h".}
proc IsA*(this: var vtkVolumePicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVolumePicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVolumePicker {.
    importcpp: "vtkVolumePicker::SafeDownCast(@)", header: "vtkVolumePicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVolumePicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCellPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumePicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumePicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVolumePicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVolumePicker.h".}
proc SetPickCroppingPlanes*(this: var vtkVolumePicker; _arg: vtkTypeBool) {.
    importcpp: "SetPickCroppingPlanes", header: "vtkVolumePicker.h".}
proc PickCroppingPlanesOn*(this: var vtkVolumePicker) {.
    importcpp: "PickCroppingPlanesOn", header: "vtkVolumePicker.h".}
proc PickCroppingPlanesOff*(this: var vtkVolumePicker) {.
    importcpp: "PickCroppingPlanesOff", header: "vtkVolumePicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPickCroppingPlanes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PickCroppingPlanes  of  << this -> PickCroppingPlanes ) ; return this -> PickCroppingPlanes ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get the index of the cropping plane that the pick ray passed
##  through on its way to the prop. This will be set regardless
##  of whether PickCroppingPlanes is on.  The crop planes are ordered
##  as follows: xmin, xmax, ymin, ymax, zmin, zmax.  If the volume is
##  not cropped, the value will bet set to -1.
##  virtual int GetPickCroppingPlanesCroppingPlaneIdCroppingPlaneId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CroppingPlaneId  of  << this -> CroppingPlaneId ) ; return this -> CroppingPlaneId ; } ;
## Error: expected ';'!!!
