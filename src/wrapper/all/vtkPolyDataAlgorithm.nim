## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataAlgorithm.h
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
##  @class   vtkPolyDataAlgorithm
##  @brief   Superclass for algorithms that produce only polydata as output
##
##
##  vtkPolyDataAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this class
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be PolyData. If that
##  isn't the case then please override this method in your subclass.
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule, vtkPolyData

discard "forward decl of vtkDataSet"
discard "forward decl of vtkPolyData"
type
  vtkPolyDataAlgorithm* {.importcpp: "vtkPolyDataAlgorithm",
                         header: "vtkPolyDataAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkPolyDataAlgorithm* {.importc: "vtkPolyDataAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataAlgorithm {.importcpp: "vtkPolyDataAlgorithm::New(@)",
                                    header: "vtkPolyDataAlgorithm.h".}
type
  vtkPolyDataAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataAlgorithm::IsTypeOf(@)",
    header: "vtkPolyDataAlgorithm.h".}
proc IsA*(this: var vtkPolyDataAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataAlgorithm {.
    importcpp: "vtkPolyDataAlgorithm::SafeDownCast(@)",
    header: "vtkPolyDataAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataAlgorithm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataAlgorithm.h".}
proc GetOutput*(this: var vtkPolyDataAlgorithm): ptr vtkPolyData {.
    importcpp: "GetOutput", header: "vtkPolyDataAlgorithm.h".}
proc GetOutput*(this: var vtkPolyDataAlgorithm; a2: cint): ptr vtkPolyData {.
    importcpp: "GetOutput", header: "vtkPolyDataAlgorithm.h".}
proc SetOutput*(this: var vtkPolyDataAlgorithm; d: ptr vtkDataObject) {.
    importcpp: "SetOutput", header: "vtkPolyDataAlgorithm.h".}
proc ProcessRequest*(this: var vtkPolyDataAlgorithm; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkPolyDataAlgorithm.h".}
proc GetInput*(this: var vtkPolyDataAlgorithm): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkPolyDataAlgorithm.h".}
proc GetInput*(this: var vtkPolyDataAlgorithm; port: cint): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkPolyDataAlgorithm.h".}
proc GetPolyDataInput*(this: var vtkPolyDataAlgorithm; port: cint): ptr vtkPolyData {.
    importcpp: "GetPolyDataInput", header: "vtkPolyDataAlgorithm.h".}
proc SetInputData*(this: var vtkPolyDataAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkPolyDataAlgorithm.h".}
proc SetInputData*(this: var vtkPolyDataAlgorithm; a2: cint; a3: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkPolyDataAlgorithm.h".}
proc AddInputData*(this: var vtkPolyDataAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkPolyDataAlgorithm.h".}
proc AddInputData*(this: var vtkPolyDataAlgorithm; a2: cint; a3: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkPolyDataAlgorithm.h".}