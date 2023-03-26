## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSpherePuzzle.h
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
##  @class   vtkSpherePuzzle
##  @brief   create a polygonal sphere centered at the origin
##
##  vtkSpherePuzzle creates
##

import
  vtkFiltersModelingModule, vtkPolyDataAlgorithm

const
  VTK_MAX_SPHERE_RESOLUTION* = 1024

discard "forward decl of vtkTransform"
type
  vtkSpherePuzzle* {.importcpp: "vtkSpherePuzzle", header: "vtkSpherePuzzle.h",
                    bycopy.} = object of vtkPolyDataAlgorithm
    vtkSpherePuzzle* {.importc: "vtkSpherePuzzle".}: VTK_NEWINSTANCE
    ##  Stuff for storing a partial move.
    ##  Colors for faces.
    ##  State for potential move.

  vtkSpherePuzzleSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSpherePuzzle::IsTypeOf(@)", header: "vtkSpherePuzzle.h".}
proc IsA*(this: var vtkSpherePuzzle; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSpherePuzzle.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSpherePuzzle {.
    importcpp: "vtkSpherePuzzle::SafeDownCast(@)", header: "vtkSpherePuzzle.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSpherePuzzle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSpherePuzzle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSpherePuzzle :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSpherePuzzle; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSpherePuzzle.h".}
proc New*(): ptr vtkSpherePuzzle {.importcpp: "vtkSpherePuzzle::New(@)",
                               header: "vtkSpherePuzzle.h".}
proc Reset*(this: var vtkSpherePuzzle) {.importcpp: "Reset",
                                     header: "vtkSpherePuzzle.h".}
proc MoveHorizontal*(this: var vtkSpherePuzzle; section: cint; percentage: cint;
                    rightFlag: cint) {.importcpp: "MoveHorizontal",
                                     header: "vtkSpherePuzzle.h".}
proc MoveVertical*(this: var vtkSpherePuzzle; section: cint; percentage: cint;
                  rightFlag: cint) {.importcpp: "MoveVertical",
                                   header: "vtkSpherePuzzle.h".}
proc SetPoint*(this: var vtkSpherePuzzle; x: cdouble; y: cdouble; z: cdouble): cint {.
    importcpp: "SetPoint", header: "vtkSpherePuzzle.h".}
proc MovePoint*(this: var vtkSpherePuzzle; percentage: cint) {.importcpp: "MovePoint",
    header: "vtkSpherePuzzle.h".}
proc GetState*(this: var vtkSpherePuzzle): ptr cint {.importcpp: "GetState",
    header: "vtkSpherePuzzle.h".}