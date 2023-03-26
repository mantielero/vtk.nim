## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPPolyDataNormals.h
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
##  @class   vtkPPolyDataNormals
##  @brief   compute normals for polygonal mesh
##
##

import
  vtkFiltersParallelModule, vtkPolyDataNormals

type
  vtkPPolyDataNormals* {.importcpp: "vtkPPolyDataNormals",
                        header: "vtkPPolyDataNormals.h", bycopy.} = object of vtkPolyDataNormals
    vtkPPolyDataNormals* {.importc: "vtkPPolyDataNormals".}: VTK_NEWINSTANCE

  vtkPPolyDataNormalsSuperclass* = vtkPolyDataNormals

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPPolyDataNormals::IsTypeOf(@)", header: "vtkPPolyDataNormals.h".}
proc IsA*(this: var vtkPPolyDataNormals; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPPolyDataNormals.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPPolyDataNormals {.
    importcpp: "vtkPPolyDataNormals::SafeDownCast(@)",
    header: "vtkPPolyDataNormals.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPPolyDataNormals :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPPolyDataNormals :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPPolyDataNormals :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPPolyDataNormals; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPPolyDataNormals.h".}
proc New*(): ptr vtkPPolyDataNormals {.importcpp: "vtkPPolyDataNormals::New(@)",
                                   header: "vtkPPolyDataNormals.h".}
proc SetPieceInvariant*(this: var vtkPPolyDataNormals; _arg: vtkTypeBool) {.
    importcpp: "SetPieceInvariant", header: "vtkPPolyDataNormals.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ;
## Error: expected ';'!!!

proc PieceInvariantOn*(this: var vtkPPolyDataNormals) {.
    importcpp: "PieceInvariantOn", header: "vtkPPolyDataNormals.h".}
proc PieceInvariantOff*(this: var vtkPPolyDataNormals) {.
    importcpp: "PieceInvariantOff", header: "vtkPPolyDataNormals.h".}
  ## /@}