## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointPicker.h
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
##  @class   vtkPointPicker
##  @brief   select a point by shooting a ray into a graphics window
##
##
##  vtkPointPicker is used to select a point by shooting a ray into a graphics
##  window and intersecting with actor's defining geometry - specifically its
##  points. Beside returning coordinates, actor, and mapper, vtkPointPicker
##  returns the id of the point projecting closest onto the ray (within the
##  specified tolerance).  Ties are broken (i.e., multiple points all
##  projecting within the tolerance along the pick ray) by choosing the point
##  closest to the ray origin (i.e., closest to the eye).
##
##
##  @sa
##  vtkPicker vtkCellPicker
##

import
  vtkPicker, vtkRenderingCoreModule

discard "forward decl of vtkDataSet"
type
  vtkPointPicker* {.importcpp: "vtkPointPicker", header: "vtkPointPicker.h", bycopy.} = object of vtkPicker ## /@{
                                                                                                  ## *
                                                                                                  ##  Standard methods for instantiation, type information, and printing.
                                                                                                  ##
    vtkPointPicker* {.importc: "vtkPointPicker".}: VTK_NEWINSTANCE
    ##  picked point
    ##  Use cell points vs. points directly


proc New*(): ptr vtkPointPicker {.importcpp: "vtkPointPicker::New(@)",
                              header: "vtkPointPicker.h".}
type
  vtkPointPickerSuperclass* = vtkPicker

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointPicker::IsTypeOf(@)", header: "vtkPointPicker.h".}
proc IsA*(this: var vtkPointPicker; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPointPicker.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointPicker {.
    importcpp: "vtkPointPicker::SafeDownCast(@)", header: "vtkPointPicker.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointPicker :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointPicker :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointPicker :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointPicker; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointPicker.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the id of the picked point. If PointId = -1, nothing was picked.
##  virtual vtkIdType GetPointIdPointId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointId  of  << this -> PointId ) ; return this -> PointId ; } ;
## Error: expected ';'!!!

proc SetUseCells*(this: var vtkPointPicker; _arg: vtkTypeBool) {.
    importcpp: "SetUseCells", header: "vtkPointPicker.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointIdPointIdUseCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseCells  of  << this -> UseCells ) ; return this -> UseCells ; } ;
## Error: expected ';'!!!

proc UseCellsOn*(this: var vtkPointPicker) {.importcpp: "UseCellsOn",
    header: "vtkPointPicker.h".}
proc UseCellsOff*(this: var vtkPointPicker) {.importcpp: "UseCellsOff",
    header: "vtkPointPicker.h".}
  ## /@}