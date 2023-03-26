## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlatonicSolidSource.h
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
##  @class   vtkPlatonicSolidSource
##  @brief   produce polygonal Platonic solids
##
##  vtkPlatonicSolidSource can generate each of the five Platonic solids:
##  tetrahedron, cube, octahedron, icosahedron, and dodecahedron. Each of the
##  solids is placed inside a sphere centered at the origin with radius 1.0.
##  To use this class, simply specify the solid to create. Note that this
##  source object creates cell scalars that are (integral value) face numbers.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

const
  VTK_SOLID_TETRAHEDRON* = 0
  VTK_SOLID_CUBE* = 1
  VTK_SOLID_OCTAHEDRON* = 2
  VTK_SOLID_ICOSAHEDRON* = 3
  VTK_SOLID_DODECAHEDRON* = 4

type
  vtkPlatonicSolidSource* {.importcpp: "vtkPlatonicSolidSource",
                           header: "vtkPlatonicSolidSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkPlatonicSolidSource* {.importc: "vtkPlatonicSolidSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPlatonicSolidSource {.importcpp: "vtkPlatonicSolidSource::New(@)",
                                      header: "vtkPlatonicSolidSource.h".}
type
  vtkPlatonicSolidSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPlatonicSolidSource::IsTypeOf(@)",
    header: "vtkPlatonicSolidSource.h".}
proc IsA*(this: var vtkPlatonicSolidSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPlatonicSolidSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPlatonicSolidSource {.
    importcpp: "vtkPlatonicSolidSource::SafeDownCast(@)",
    header: "vtkPlatonicSolidSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPlatonicSolidSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlatonicSolidSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlatonicSolidSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPlatonicSolidSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPlatonicSolidSource.h".}
proc SetSolidType*(this: var vtkPlatonicSolidSource; _arg: cint) {.
    importcpp: "SetSolidType", header: "vtkPlatonicSolidSource.h".}
proc GetSolidTypeMinValue*(this: var vtkPlatonicSolidSource): cint {.
    importcpp: "GetSolidTypeMinValue", header: "vtkPlatonicSolidSource.h".}
proc GetSolidTypeMaxValue*(this: var vtkPlatonicSolidSource): cint {.
    importcpp: "GetSolidTypeMaxValue", header: "vtkPlatonicSolidSource.h".}
## !!!Ignored construct:  virtual int GetSolidType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SolidType  of  << this -> SolidType ) ; return this -> SolidType ; } ;
## Error: expected ';'!!!

proc SetSolidTypeToTetrahedron*(this: var vtkPlatonicSolidSource) {.
    importcpp: "SetSolidTypeToTetrahedron", header: "vtkPlatonicSolidSource.h".}
proc SetSolidTypeToCube*(this: var vtkPlatonicSolidSource) {.
    importcpp: "SetSolidTypeToCube", header: "vtkPlatonicSolidSource.h".}
proc SetSolidTypeToOctahedron*(this: var vtkPlatonicSolidSource) {.
    importcpp: "SetSolidTypeToOctahedron", header: "vtkPlatonicSolidSource.h".}
proc SetSolidTypeToIcosahedron*(this: var vtkPlatonicSolidSource) {.
    importcpp: "SetSolidTypeToIcosahedron", header: "vtkPlatonicSolidSource.h".}
proc SetSolidTypeToDodecahedron*(this: var vtkPlatonicSolidSource) {.
    importcpp: "SetSolidTypeToDodecahedron", header: "vtkPlatonicSolidSource.h".}
proc SetOutputPointsPrecision*(this: var vtkPlatonicSolidSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkPlatonicSolidSource.h".}
## !!!Ignored construct:  virtual int GetSolidTypeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
