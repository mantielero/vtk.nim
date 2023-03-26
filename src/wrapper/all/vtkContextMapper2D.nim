## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkContextMapper2D.h
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
##  @class   vtkContextMapper2D
##  @brief   Abstract class for 2D context mappers.
##
##
##
##  This class provides an abstract base for 2D context mappers. They currently
##  only accept vtkTable objects as input.
##

import
  vtkAlgorithm, vtkRenderingContext2DModule

discard "forward decl of vtkContext2D"
discard "forward decl of vtkTable"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkAbstractArray"
type
  vtkContextMapper2D* {.importcpp: "vtkContextMapper2D",
                       header: "vtkContextMapper2D.h", bycopy.} = object of vtkAlgorithm
    vtkContextMapper2D* {.importc: "vtkContextMapper2D".}: VTK_NEWINSTANCE

  vtkContextMapper2DSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContextMapper2D::IsTypeOf(@)", header: "vtkContextMapper2D.h".}
proc IsA*(this: var vtkContextMapper2D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContextMapper2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContextMapper2D {.
    importcpp: "vtkContextMapper2D::SafeDownCast(@)",
    header: "vtkContextMapper2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContextMapper2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContextMapper2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContextMapper2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContextMapper2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContextMapper2D.h".}
proc New*(): ptr vtkContextMapper2D {.importcpp: "vtkContextMapper2D::New(@)",
                                  header: "vtkContextMapper2D.h".}
proc SetInputData*(this: var vtkContextMapper2D; input: ptr vtkTable) {.
    importcpp: "SetInputData", header: "vtkContextMapper2D.h".}
proc GetInput*(this: var vtkContextMapper2D): ptr vtkTable {.importcpp: "GetInput",
    header: "vtkContextMapper2D.h".}
proc GetInputArrayToProcess*(this: var vtkContextMapper2D; idx: cint;
                            input: ptr vtkDataObject): ptr vtkDataArray {.
    importcpp: "GetInputArrayToProcess", header: "vtkContextMapper2D.h".}
proc GetInputAbstractArrayToProcess*(this: var vtkContextMapper2D; idx: cint;
                                    input: ptr vtkDataObject): ptr vtkAbstractArray {.
    importcpp: "GetInputAbstractArrayToProcess", header: "vtkContextMapper2D.h".}