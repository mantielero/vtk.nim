## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWorldPointPicker.h
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
##  @class   vtkWorldPointPicker
##  @brief   find world x,y,z corresponding to display x,y,z
##
##  vtkWorldPointPicker is used to find the x,y,z world coordinate of a
##  screen x,y,z. This picker cannot pick actors and/or mappers, it
##  simply determines an x-y-z coordinate in world space. (It will always
##  return a x-y-z, even if the selection point is not over a prop/actor.)
##
##  @warning
##  The PickMethod() is not invoked, but StartPickMethod() and EndPickMethod()
##  are.
##
##  @sa
##  vtkPropPicker vtkPicker vtkCellPicker vtkPointPicker
##

import
  vtkAbstractPicker, vtkRenderingCoreModule

type
  vtkWorldPointPicker* {.importcpp: "vtkWorldPointPicker",
                        header: "vtkWorldPointPicker.h", bycopy.} = object of vtkAbstractPicker
    vtkWorldPointPicker* {.importc: "vtkWorldPointPicker".}: VTK_NEWINSTANCE


proc New*(): ptr vtkWorldPointPicker {.importcpp: "vtkWorldPointPicker::New(@)",
                                   header: "vtkWorldPointPicker.h".}
type
  vtkWorldPointPickerSuperclass* = vtkAbstractPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkWorldPointPicker::IsTypeOf(@)", header: "vtkWorldPointPicker.h".}
proc IsA*(this: var vtkWorldPointPicker; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkWorldPointPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkWorldPointPicker {.
    importcpp: "vtkWorldPointPicker::SafeDownCast(@)",
    header: "vtkWorldPointPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkWorldPointPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWorldPointPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWorldPointPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkWorldPointPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkWorldPointPicker.h".}
proc Pick*(this: var vtkWorldPointPicker; selectionX: cdouble; selectionY: cdouble;
          selectionZ: cdouble; renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkWorldPointPicker.h".}
proc Pick*(this: var vtkWorldPointPicker; selectionPt: array[3, cdouble];
          renderer: ptr vtkRenderer): cint {.importcpp: "Pick",
    header: "vtkWorldPointPicker.h".}