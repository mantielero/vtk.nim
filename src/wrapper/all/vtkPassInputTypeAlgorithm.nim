## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPassInputTypeAlgorithm.h
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
##  @class   vtkPassInputTypeAlgorithm
##  @brief   Superclass for algorithms that produce output of the same type as input
##
##  vtkPassInputTypeAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this classes
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be DataObject. If that isn't
##  the case then please override this method in your subclass. This class
##  breaks out the downstream requests into separate functions such as
##  RequestDataObject RequestData and RequestInformation. The default
##  implementation of RequestDataObject will create an output data of the
##  same type as the input.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule

discard "forward decl of vtkDataObject"
discard "forward decl of vtkGraph"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMolecule"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkRectilinearGrid"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkTable"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkPassInputTypeAlgorithm* {.importcpp: "vtkPassInputTypeAlgorithm",
                              header: "vtkPassInputTypeAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkPassInputTypeAlgorithm* {.importc: "vtkPassInputTypeAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPassInputTypeAlgorithm {.
    importcpp: "vtkPassInputTypeAlgorithm::New(@)",
    header: "vtkPassInputTypeAlgorithm.h".}
type
  vtkPassInputTypeAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPassInputTypeAlgorithm::IsTypeOf(@)",
    header: "vtkPassInputTypeAlgorithm.h".}
proc IsA*(this: var vtkPassInputTypeAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPassInputTypeAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPassInputTypeAlgorithm {.
    importcpp: "vtkPassInputTypeAlgorithm::SafeDownCast(@)",
    header: "vtkPassInputTypeAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPassInputTypeAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPassInputTypeAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPassInputTypeAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPassInputTypeAlgorithm.h".}
proc GetOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkDataObject {.
    importcpp: "GetOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetOutput*(this: var vtkPassInputTypeAlgorithm; a2: cint): ptr vtkDataObject {.
    importcpp: "GetOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetPolyDataOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkPolyData {.
    importcpp: "GetPolyDataOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetStructuredPointsOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkStructuredPoints {.
    importcpp: "GetStructuredPointsOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetImageDataOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkImageData {.
    importcpp: "GetImageDataOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetStructuredGridOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkStructuredGrid {.
    importcpp: "GetStructuredGridOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetUnstructuredGridOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkUnstructuredGrid {.
    importcpp: "GetUnstructuredGridOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetRectilinearGridOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkRectilinearGrid {.
    importcpp: "GetRectilinearGridOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetGraphOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkGraph {.
    importcpp: "GetGraphOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetMoleculeOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkMolecule {.
    importcpp: "GetMoleculeOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetTableOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkTable {.
    importcpp: "GetTableOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetHyperTreeGridOutput*(this: var vtkPassInputTypeAlgorithm): ptr vtkHyperTreeGrid {.
    importcpp: "GetHyperTreeGridOutput", header: "vtkPassInputTypeAlgorithm.h".}
proc GetInput*(this: var vtkPassInputTypeAlgorithm): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkPassInputTypeAlgorithm.h".}
proc SetInputData*(this: var vtkPassInputTypeAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkPassInputTypeAlgorithm.h".}
proc SetInputData*(this: var vtkPassInputTypeAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "SetInputData",
                                        header: "vtkPassInputTypeAlgorithm.h".}
proc AddInputData*(this: var vtkPassInputTypeAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkPassInputTypeAlgorithm.h".}
proc AddInputData*(this: var vtkPassInputTypeAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "AddInputData",
                                        header: "vtkPassInputTypeAlgorithm.h".}
proc ProcessRequest*(this: var vtkPassInputTypeAlgorithm;
                    request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkPassInputTypeAlgorithm.h".}