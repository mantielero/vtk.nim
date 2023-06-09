## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyle3D.h
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
##  @class   vtkInteractorStyle3D
##  @brief   extends interaction to support 3D input
##
##  vtkInteractorStyle3D allows the user to interact with (rotate,
##  pan, etc.) objects in the scene independent of each other. It is
##  designed to use 3d positions and orientations instead of 2D.
##
##  The following interactions are specified by default.
##
##  A click and hold in 3D within the bounding box of a prop
##  will pick up that prop allowing you to translate and
##  orient that prop as desired with the 3D controller.
##
##  Click/dragging two controllers and pulling them apart or
##  pushing them together will initial a scale gesture
##  that will scale the world larger or smaller.
##
##  Click/dragging two controllers and translating them in the same
##  direction will translate the camera/world
##  pushing them together will initial a scale gesture
##  that will scale the world larger or smaller.
##
##  If a controller is right clicked (push touchpad on Vive)
##  then it starts a fly motion where the camer moves in the
##  direction the controller is pointing. It moves at a speed
##  scaled by the position of your thumb on the trackpad.
##  Higher moves faster forward. Lower moves faster backwards.
##
##  For the Vive left click is mapped to the trigger and right
##  click is mapped to pushing the trackpad down.
##
##  @sa
##  vtkRenderWindowInteractor3D
##

import
  vtkInteractorStyle, vtkNew, vtkRenderingCoreModule

discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkCamera"
discard "forward decl of vtkProp3D"
discard "forward decl of vtkMatrix3x3"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkTimerLog"
discard "forward decl of vtkTransform"
type
  vtkInteractorStyle3D* {.importcpp: "vtkInteractorStyle3D",
                         header: "vtkInteractorStyle3D.h", bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyle3D* {.importc: "vtkInteractorStyle3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyle3D {.importcpp: "vtkInteractorStyle3D::New(@)",
                                    header: "vtkInteractorStyle3D.h".}
type
  vtkInteractorStyle3DSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyle3D::IsTypeOf(@)",
    header: "vtkInteractorStyle3D.h".}
proc IsA*(this: var vtkInteractorStyle3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyle3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyle3D {.
    importcpp: "vtkInteractorStyle3D::SafeDownCast(@)",
    header: "vtkInteractorStyle3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyle3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyle3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyle3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyle3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInteractorStyle3D.h".}
proc PositionProp*(this: var vtkInteractorStyle3D; a2: ptr vtkEventData;
                  lwpos: ptr cdouble = nil; lwori: ptr cdouble = nil) {.
    importcpp: "PositionProp", header: "vtkInteractorStyle3D.h".}
proc Dolly3D*(this: var vtkInteractorStyle3D; a2: ptr vtkEventData) {.
    importcpp: "Dolly3D", header: "vtkInteractorStyle3D.h".}
proc SetDollyPhysicalSpeed*(this: var vtkInteractorStyle3D; _arg: cdouble) {.
    importcpp: "SetDollyPhysicalSpeed", header: "vtkInteractorStyle3D.h".}
## !!!Ignored construct:  virtual double GetDollyPhysicalSpeed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DollyPhysicalSpeed  of  << this -> DollyPhysicalSpeed ) ; return this -> DollyPhysicalSpeed ; } ;
## Error: expected ';'!!!

proc SetScale*(this: var vtkInteractorStyle3D; cam: ptr vtkCamera; newScale: cdouble) {.
    importcpp: "SetScale", header: "vtkInteractorStyle3D.h".}
proc GetnameInteractionPicker*(this: var vtkInteractorStyle3D): ptr vtkAbstractPropPicker {.
    importcpp: "GetnameInteractionPicker", header: "vtkInteractorStyle3D.h".}
proc SetInteractionPicker*(this: var vtkInteractorStyle3D;
                          prop: ptr vtkAbstractPropPicker) {.
    importcpp: "SetInteractionPicker", header: "vtkInteractorStyle3D.h".}