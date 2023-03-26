## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRenderedAreaPicker.h
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
##  @class   vtkRenderedAreaPicker
##  @brief   Uses graphics hardware to picks props behind
##  a selection rectangle on a viewport.
##
##
##  Like vtkAreaPicker, this class picks all props within a selection area
##  on the screen. The difference is in implementation. This class uses
##  graphics hardware to perform the test where the other uses software
##  bounding box/frustum intersection testing.
##
##  This picker is more conservative than vtkAreaPicker. It will reject
##  some objects that pass the bounding box test of vtkAreaPicker. This
##  will happen, for instance, when picking through a corner of the bounding
##  box when the data set does not have any visible geometry in that corner.
##

import
  vtkAreaPicker, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
type
  vtkRenderedAreaPicker* {.importcpp: "vtkRenderedAreaPicker",
                          header: "vtkRenderedAreaPicker.h", bycopy.} = object of vtkAreaPicker
    vtkRenderedAreaPicker* {.importc: "vtkRenderedAreaPicker".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRenderedAreaPicker {.importcpp: "vtkRenderedAreaPicker::New(@)",
                                     header: "vtkRenderedAreaPicker.h".}
type
  vtkRenderedAreaPickerSuperclass* = vtkAreaPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRenderedAreaPicker::IsTypeOf(@)",
    header: "vtkRenderedAreaPicker.h".}
proc IsA*(this: var vtkRenderedAreaPicker; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRenderedAreaPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRenderedAreaPicker {.
    importcpp: "vtkRenderedAreaPicker::SafeDownCast(@)",
    header: "vtkRenderedAreaPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRenderedAreaPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAreaPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRenderedAreaPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRenderedAreaPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRenderedAreaPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRenderedAreaPicker.h".}
proc AreaPick*(this: var vtkRenderedAreaPicker; x0: cdouble; y0: cdouble; x1: cdouble;
              y1: cdouble; a6: ptr vtkRenderer): cint {.importcpp: "AreaPick",
    header: "vtkRenderedAreaPicker.h".}