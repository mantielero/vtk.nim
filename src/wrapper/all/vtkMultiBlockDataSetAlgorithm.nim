## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiBlockDataSetAlgorithm.h
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
##  @class   vtkMultiBlockDataSetAlgorithm
##  @brief   Superclass for algorithms that produce only vtkMultiBlockDataSet as output
##
##  Algorithms that take any type of data object (including composite dataset)
##  and produce a vtkMultiBlockDataSet in the output can subclass from this
##  class.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule

discard "forward decl of vtkMultiBlockDataSet"
type
  vtkMultiBlockDataSetAlgorithm* {.importcpp: "vtkMultiBlockDataSetAlgorithm",
                                  header: "vtkMultiBlockDataSetAlgorithm.h",
                                  bycopy.} = object of vtkAlgorithm
    vtkMultiBlockDataSetAlgorithm* {.importc: "vtkMultiBlockDataSetAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMultiBlockDataSetAlgorithm {.
    importcpp: "vtkMultiBlockDataSetAlgorithm::New(@)",
    header: "vtkMultiBlockDataSetAlgorithm.h".}
type
  vtkMultiBlockDataSetAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiBlockDataSetAlgorithm::IsTypeOf(@)",
    header: "vtkMultiBlockDataSetAlgorithm.h".}
proc IsA*(this: var vtkMultiBlockDataSetAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiBlockDataSetAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiBlockDataSetAlgorithm {.
    importcpp: "vtkMultiBlockDataSetAlgorithm::SafeDownCast(@)",
    header: "vtkMultiBlockDataSetAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiBlockDataSetAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiBlockDataSetAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiBlockDataSetAlgorithm; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMultiBlockDataSetAlgorithm.h".}
proc GetOutput*(this: var vtkMultiBlockDataSetAlgorithm): ptr vtkMultiBlockDataSet {.
    importcpp: "GetOutput", header: "vtkMultiBlockDataSetAlgorithm.h".}
proc GetOutput*(this: var vtkMultiBlockDataSetAlgorithm; a2: cint): ptr vtkMultiBlockDataSet {.
    importcpp: "GetOutput", header: "vtkMultiBlockDataSetAlgorithm.h".}
proc SetInputData*(this: var vtkMultiBlockDataSetAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkMultiBlockDataSetAlgorithm.h".}
proc SetInputData*(this: var vtkMultiBlockDataSetAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "SetInputData", header: "vtkMultiBlockDataSetAlgorithm.h".}
proc ProcessRequest*(this: var vtkMultiBlockDataSetAlgorithm;
                    request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkMultiBlockDataSetAlgorithm.h".}