## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRectilinearGridAlgorithm.h
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
##  @class   vtkRectilinearGridAlgorithm
##  @brief   Superclass for algorithms that produce only rectilinear grid as output
##
##
##  vtkRectilinearGridAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this classes
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be RectilinearGrid. If that
##  isn't the case then please override this method in your subclass.
##  You should implement the subclass's algorithm into
##  RequestData( request, inputVec, outputVec).
##

import
  vtkAlgorithm, vtkCommonExecutionModelModule, vtkRectilinearGrid

discard "forward decl of vtkDataSet"
discard "forward decl of vtkRectilinearGrid"
type
  vtkRectilinearGridAlgorithm* {.importcpp: "vtkRectilinearGridAlgorithm",
                                header: "vtkRectilinearGridAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkRectilinearGridAlgorithm* {.importc: "vtkRectilinearGridAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRectilinearGridAlgorithm {.
    importcpp: "vtkRectilinearGridAlgorithm::New(@)",
    header: "vtkRectilinearGridAlgorithm.h".}
type
  vtkRectilinearGridAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRectilinearGridAlgorithm::IsTypeOf(@)",
    header: "vtkRectilinearGridAlgorithm.h".}
proc IsA*(this: var vtkRectilinearGridAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRectilinearGridAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRectilinearGridAlgorithm {.
    importcpp: "vtkRectilinearGridAlgorithm::SafeDownCast(@)",
    header: "vtkRectilinearGridAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRectilinearGridAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRectilinearGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRectilinearGridAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRectilinearGridAlgorithm; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkRectilinearGridAlgorithm.h".}
proc GetOutput*(this: var vtkRectilinearGridAlgorithm): ptr vtkRectilinearGrid {.
    importcpp: "GetOutput", header: "vtkRectilinearGridAlgorithm.h".}
proc GetOutput*(this: var vtkRectilinearGridAlgorithm; a2: cint): ptr vtkRectilinearGrid {.
    importcpp: "GetOutput", header: "vtkRectilinearGridAlgorithm.h".}
proc SetOutput*(this: var vtkRectilinearGridAlgorithm; d: ptr vtkDataObject) {.
    importcpp: "SetOutput", header: "vtkRectilinearGridAlgorithm.h".}
proc ProcessRequest*(this: var vtkRectilinearGridAlgorithm; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkRectilinearGridAlgorithm.h".}
proc GetInput*(this: var vtkRectilinearGridAlgorithm): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkRectilinearGridAlgorithm.h".}
proc GetInput*(this: var vtkRectilinearGridAlgorithm; port: cint): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkRectilinearGridAlgorithm.h".}
proc GetRectilinearGridInput*(this: var vtkRectilinearGridAlgorithm; port: cint): ptr vtkRectilinearGrid {.
    importcpp: "GetRectilinearGridInput", header: "vtkRectilinearGridAlgorithm.h".}
proc SetInputData*(this: var vtkRectilinearGridAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkRectilinearGridAlgorithm.h".}
proc SetInputData*(this: var vtkRectilinearGridAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "SetInputData",
                                        header: "vtkRectilinearGridAlgorithm.h".}
proc AddInputData*(this: var vtkRectilinearGridAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkRectilinearGridAlgorithm.h".}
proc AddInputData*(this: var vtkRectilinearGridAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "AddInputData",
                                        header: "vtkRectilinearGridAlgorithm.h".}