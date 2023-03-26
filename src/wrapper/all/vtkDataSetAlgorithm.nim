## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetAlgorithm.h
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
##  @class   vtkDataSetAlgorithm
##  @brief   Superclass for algorithms that produce output of the same type as input
##
##  vtkDataSetAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this classes
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be DataSet. If that isn't
##  the case then please override this method in your subclass. This class
##  breaks out the downstream requests into separate functions such as
##  RequestDataObject RequestData and RequestInformation. The default
##  implementation of RequestDataObject will create an output data of the
##  same type as the input.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule

discard "forward decl of vtkDataSet"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkStructuredPoints"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkRectilinearGrid"
type
  vtkDataSetAlgorithm* {.importcpp: "vtkDataSetAlgorithm",
                        header: "vtkDataSetAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkDataSetAlgorithm* {.importc: "vtkDataSetAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataSetAlgorithm {.importcpp: "vtkDataSetAlgorithm::New(@)",
                                   header: "vtkDataSetAlgorithm.h".}
type
  vtkDataSetAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataSetAlgorithm::IsTypeOf(@)", header: "vtkDataSetAlgorithm.h".}
proc IsA*(this: var vtkDataSetAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDataSetAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataSetAlgorithm {.
    importcpp: "vtkDataSetAlgorithm::SafeDownCast(@)",
    header: "vtkDataSetAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataSetAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataSetAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataSetAlgorithm.h".}
proc GetOutput*(this: var vtkDataSetAlgorithm): ptr vtkDataSet {.
    importcpp: "GetOutput", header: "vtkDataSetAlgorithm.h".}
proc GetOutput*(this: var vtkDataSetAlgorithm; a2: cint): ptr vtkDataSet {.
    importcpp: "GetOutput", header: "vtkDataSetAlgorithm.h".}
proc GetInput*(this: var vtkDataSetAlgorithm): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkDataSetAlgorithm.h".}
proc GetPolyDataOutput*(this: var vtkDataSetAlgorithm): ptr vtkPolyData {.
    importcpp: "GetPolyDataOutput", header: "vtkDataSetAlgorithm.h".}
proc GetStructuredPointsOutput*(this: var vtkDataSetAlgorithm): ptr vtkStructuredPoints {.
    importcpp: "GetStructuredPointsOutput", header: "vtkDataSetAlgorithm.h".}
proc GetImageDataOutput*(this: var vtkDataSetAlgorithm): ptr vtkImageData {.
    importcpp: "GetImageDataOutput", header: "vtkDataSetAlgorithm.h".}
proc GetStructuredGridOutput*(this: var vtkDataSetAlgorithm): ptr vtkStructuredGrid {.
    importcpp: "GetStructuredGridOutput", header: "vtkDataSetAlgorithm.h".}
proc GetUnstructuredGridOutput*(this: var vtkDataSetAlgorithm): ptr vtkUnstructuredGrid {.
    importcpp: "GetUnstructuredGridOutput", header: "vtkDataSetAlgorithm.h".}
proc GetRectilinearGridOutput*(this: var vtkDataSetAlgorithm): ptr vtkRectilinearGrid {.
    importcpp: "GetRectilinearGridOutput", header: "vtkDataSetAlgorithm.h".}
proc SetInputData*(this: var vtkDataSetAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkDataSetAlgorithm.h".}
proc SetInputData*(this: var vtkDataSetAlgorithm; a2: cint; a3: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkDataSetAlgorithm.h".}
proc SetInputData*(this: var vtkDataSetAlgorithm; a2: ptr vtkDataSet) {.
    importcpp: "SetInputData", header: "vtkDataSetAlgorithm.h".}
proc SetInputData*(this: var vtkDataSetAlgorithm; a2: cint; a3: ptr vtkDataSet) {.
    importcpp: "SetInputData", header: "vtkDataSetAlgorithm.h".}
proc AddInputData*(this: var vtkDataSetAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkDataSetAlgorithm.h".}
proc AddInputData*(this: var vtkDataSetAlgorithm; a2: ptr vtkDataSet) {.
    importcpp: "AddInputData", header: "vtkDataSetAlgorithm.h".}
proc AddInputData*(this: var vtkDataSetAlgorithm; a2: cint; a3: ptr vtkDataSet) {.
    importcpp: "AddInputData", header: "vtkDataSetAlgorithm.h".}
proc AddInputData*(this: var vtkDataSetAlgorithm; a2: cint; a3: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkDataSetAlgorithm.h".}
proc ProcessRequest*(this: var vtkDataSetAlgorithm; request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkDataSetAlgorithm.h".}