## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPropPicker.h
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
##  @class   vtkPropPicker
##  @brief   pick an actor/prop using graphics hardware
##
##  vtkPropPicker is used to pick an actor/prop given a selection
##  point (in display coordinates) and a renderer. This class uses
##  graphics hardware/rendering system to pick rapidly (as compared
##  to using ray casting as does vtkCellPicker and vtkPointPicker).
##  This class determines the actor/prop and pick position in world
##  coordinates; point and cell ids are not determined.
##
##  @sa
##  vtkPicker vtkWorldPointPicker vtkCellPicker vtkPointPicker
##

import
  vtkAbstractPropPicker, vtkRenderingCoreModule

discard "forward decl of vtkProp"
discard "forward decl of vtkWorldPointPicker"
type
  vtkPropPicker* {.importcpp: "vtkPropPicker", header: "vtkPropPicker.h", bycopy.} = object of vtkAbstractPropPicker
    vtkPropPicker* {.importc: "vtkPropPicker".}: VTK_NEWINSTANCE
    ##  Used to get x-y-z pick position


proc New*(): ptr vtkPropPicker {.importcpp: "vtkPropPicker::New(@)",
                             header: "vtkPropPicker.h".}
type
  vtkPropPickerSuperclass* = vtkAbstractPropPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPropPicker::IsTypeOf(@)", header: "vtkPropPicker.h".}
proc IsA*(this: var vtkPropPicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPropPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPropPicker {.
    importcpp: "vtkPropPicker::SafeDownCast(@)", header: "vtkPropPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPropPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPropPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPropPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPropPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPropPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPropPicker.h".}
proc PickProp*(this: var vtkPropPicker; selectionX: cdouble; selectionY: cdouble;
              renderer: ptr vtkRenderer): cint {.importcpp: "PickProp",
    header: "vtkPropPicker.h".}
proc PickProp*(this: var vtkPropPicker; selectionX: cdouble; selectionY: cdouble;
              renderer: ptr vtkRenderer; pickfrom: ptr vtkPropCollection): cint {.
    importcpp: "PickProp", header: "vtkPropPicker.h".}
proc Pick*(this: var vtkPropPicker; selectionX: cdouble; selectionY: cdouble;
          selectionZ: cdouble; renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkPropPicker.h".}
proc Pick*(this: var vtkPropPicker; selectionPt: array[3, cdouble];
          renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkPropPicker.h".}
proc Pick3DPoint*(this: var vtkPropPicker; selectionPt: array[3, cdouble];
                 ren: ptr vtkRenderer): cint {.importcpp: "Pick3DPoint",
    header: "vtkPropPicker.h".}
proc PickProp3DPoint*(this: var vtkPropPicker; pos: array[3, cdouble];
                     renderer: ptr vtkRenderer): cint {.
    importcpp: "PickProp3DPoint", header: "vtkPropPicker.h".}
proc PickProp3DPoint*(this: var vtkPropPicker; pos: array[3, cdouble];
                     renderer: ptr vtkRenderer; pickfrom: ptr vtkPropCollection): cint {.
    importcpp: "PickProp3DPoint", header: "vtkPropPicker.h".}
proc PickProp3DRay*(this: var vtkPropPicker; selectionPt: array[3, cdouble];
                   eventWorldOrientation: array[4, cdouble];
                   renderer: ptr vtkRenderer; pickfrom: ptr vtkPropCollection): cint {.
    importcpp: "PickProp3DRay", header: "vtkPropPicker.h".}
proc Pick3DRay*(this: var vtkPropPicker; selectionPt: array[3, cdouble];
               orient: array[4, cdouble]; ren: ptr vtkRenderer): cint {.
    importcpp: "Pick3DRay", header: "vtkPropPicker.h".}