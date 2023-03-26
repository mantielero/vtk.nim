## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAtom.h
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
##  @class   vtkAtom
##  @brief   convenience proxy for vtkMolecule
##
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkMolecule"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3f"
type
  vtkAtom* {.importcpp: "vtkAtom", header: "vtkAtom.h", bycopy.} = object


proc PrintSelf*(this: var vtkAtom; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAtom.h".}
proc GetId*(this: vtkAtom): vtkIdType {.noSideEffect, importcpp: "GetId",
                                    header: "vtkAtom.h".}
proc GetMolecule*(this: var vtkAtom): ptr vtkMolecule {.importcpp: "GetMolecule",
    header: "vtkAtom.h".}
proc GetAtomicNumber*(this: vtkAtom): cushort {.noSideEffect,
    importcpp: "GetAtomicNumber", header: "vtkAtom.h".}
proc SetAtomicNumber*(this: var vtkAtom; atomicNum: cushort) {.
    importcpp: "SetAtomicNumber", header: "vtkAtom.h".}
proc GetPosition*(this: vtkAtom; pos: array[3, cfloat]) {.noSideEffect,
    importcpp: "GetPosition", header: "vtkAtom.h".}
proc GetPosition*(this: vtkAtom; pos: array[3, cdouble]) {.noSideEffect,
    importcpp: "GetPosition", header: "vtkAtom.h".}
proc SetPosition*(this: var vtkAtom; pos: array[3, cfloat]) {.importcpp: "SetPosition",
    header: "vtkAtom.h".}
proc SetPosition*(this: var vtkAtom; x: cfloat; y: cfloat; z: cfloat) {.
    importcpp: "SetPosition", header: "vtkAtom.h".}
proc GetPosition*(this: vtkAtom): vtkVector3f {.noSideEffect,
    importcpp: "GetPosition", header: "vtkAtom.h".}
proc SetPosition*(this: var vtkAtom; pos: vtkVector3f) {.importcpp: "SetPosition",
    header: "vtkAtom.h".}
proc GetId*(this: vtkAtom): vtkIdType {.noSideEffect, importcpp: "GetId",
                                    header: "vtkAtom.h".}
proc GetMolecule*(this: var vtkAtom): ptr vtkMolecule {.importcpp: "GetMolecule",
    header: "vtkAtom.h".}
##  VTK-HeaderTest-Exclude: vtkAtom.h
