## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExplicitStructuredGridAlgorithm.h
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
##  @class   vtkExplicitStructuredGridAlgorithm
##  @brief   Superclass for algorithms that produce only
##  explicit structured grid as output.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule

discard "forward decl of vtkDataSet"
discard "forward decl of vtkExplicitStructuredGrid"
type
  vtkExplicitStructuredGridAlgorithm* {.importcpp: "vtkExplicitStructuredGridAlgorithm", header: "vtkExplicitStructuredGridAlgorithm.h",
                                       bycopy.} = object of vtkAlgorithm
    vtkExplicitStructuredGridAlgorithm* {.
        importc: "vtkExplicitStructuredGridAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExplicitStructuredGridAlgorithm {.
    importcpp: "vtkExplicitStructuredGridAlgorithm::New(@)",
    header: "vtkExplicitStructuredGridAlgorithm.h".}
type
  vtkExplicitStructuredGridAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExplicitStructuredGridAlgorithm::IsTypeOf(@)",
    header: "vtkExplicitStructuredGridAlgorithm.h".}
proc IsA*(this: var vtkExplicitStructuredGridAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExplicitStructuredGridAlgorithm {.
    importcpp: "vtkExplicitStructuredGridAlgorithm::SafeDownCast(@)",
    header: "vtkExplicitStructuredGridAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExplicitStructuredGridAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExplicitStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExplicitStructuredGridAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExplicitStructuredGridAlgorithm; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc GetOutput*(this: var vtkExplicitStructuredGridAlgorithm): ptr vtkExplicitStructuredGrid {.
    importcpp: "GetOutput", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc GetOutput*(this: var vtkExplicitStructuredGridAlgorithm; a2: cint): ptr vtkExplicitStructuredGrid {.
    importcpp: "GetOutput", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc SetOutput*(this: var vtkExplicitStructuredGridAlgorithm; d: ptr vtkDataObject) {.
    importcpp: "SetOutput", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc ProcessRequest*(this: var vtkExplicitStructuredGridAlgorithm;
                    a2: ptr vtkInformation; a3: ptr ptr vtkInformationVector;
                    a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc GetInput*(this: var vtkExplicitStructuredGridAlgorithm): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc GetInput*(this: var vtkExplicitStructuredGridAlgorithm; port: cint): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc GetExplicitStructuredGridInput*(this: var vtkExplicitStructuredGridAlgorithm;
                                    port: cint): ptr vtkExplicitStructuredGrid {.
    importcpp: "GetExplicitStructuredGridInput",
    header: "vtkExplicitStructuredGridAlgorithm.h".}
proc SetInputData*(this: var vtkExplicitStructuredGridAlgorithm;
                  a2: ptr vtkDataObject) {.importcpp: "SetInputData", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc SetInputData*(this: var vtkExplicitStructuredGridAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "SetInputData", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc AddInputData*(this: var vtkExplicitStructuredGridAlgorithm;
                  a2: ptr vtkDataObject) {.importcpp: "AddInputData", header: "vtkExplicitStructuredGridAlgorithm.h".}
proc AddInputData*(this: var vtkExplicitStructuredGridAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "AddInputData", header: "vtkExplicitStructuredGridAlgorithm.h".}