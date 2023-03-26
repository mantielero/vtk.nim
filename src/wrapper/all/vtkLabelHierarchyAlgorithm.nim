## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLabelHierarchyAlgorithm.h
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
##  @class   vtkLabelHierarchyAlgorithm
##  @brief   Superclass for algorithms that produce only label hierarchies as output
##
##
##  vtkLabelHierarchyAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this class
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be DataObjects. If that
##  isn't the case then please override this method in your subclass. This
##  class breaks out the downstream requests into separate functions such as
##  RequestData and RequestInformation.  You should
##  implement RequestData( request, inputVec, outputVec) in subclasses.
##

import
  vtkAlgorithm, vtkRenderingLabelModule

discard "forward decl of vtkDataSet"
discard "forward decl of vtkLabelHierarchy"
type
  vtkLabelHierarchyAlgorithm* {.importcpp: "vtkLabelHierarchyAlgorithm",
                               header: "vtkLabelHierarchyAlgorithm.h", bycopy.} = object of vtkAlgorithm
    vtkLabelHierarchyAlgorithm* {.importc: "vtkLabelHierarchyAlgorithm".}: VTK_NEWINSTANCE


proc New*(): ptr vtkLabelHierarchyAlgorithm {.
    importcpp: "vtkLabelHierarchyAlgorithm::New(@)",
    header: "vtkLabelHierarchyAlgorithm.h".}
type
  vtkLabelHierarchyAlgorithmSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLabelHierarchyAlgorithm::IsTypeOf(@)",
    header: "vtkLabelHierarchyAlgorithm.h".}
proc IsA*(this: var vtkLabelHierarchyAlgorithm; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLabelHierarchyAlgorithm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLabelHierarchyAlgorithm {.
    importcpp: "vtkLabelHierarchyAlgorithm::SafeDownCast(@)",
    header: "vtkLabelHierarchyAlgorithm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLabelHierarchyAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLabelHierarchyAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLabelHierarchyAlgorithm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLabelHierarchyAlgorithm; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkLabelHierarchyAlgorithm.h".}
proc GetOutput*(this: var vtkLabelHierarchyAlgorithm): ptr vtkLabelHierarchy {.
    importcpp: "GetOutput", header: "vtkLabelHierarchyAlgorithm.h".}
proc GetOutput*(this: var vtkLabelHierarchyAlgorithm; a2: cint): ptr vtkLabelHierarchy {.
    importcpp: "GetOutput", header: "vtkLabelHierarchyAlgorithm.h".}
proc SetOutput*(this: var vtkLabelHierarchyAlgorithm; d: ptr vtkDataObject) {.
    importcpp: "SetOutput", header: "vtkLabelHierarchyAlgorithm.h".}
proc ProcessRequest*(this: var vtkLabelHierarchyAlgorithm; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkLabelHierarchyAlgorithm.h".}
proc GetInput*(this: var vtkLabelHierarchyAlgorithm): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkLabelHierarchyAlgorithm.h".}
proc GetInput*(this: var vtkLabelHierarchyAlgorithm; port: cint): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkLabelHierarchyAlgorithm.h".}
proc GetLabelHierarchyInput*(this: var vtkLabelHierarchyAlgorithm; port: cint): ptr vtkLabelHierarchy {.
    importcpp: "GetLabelHierarchyInput", header: "vtkLabelHierarchyAlgorithm.h".}
proc SetInputData*(this: var vtkLabelHierarchyAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkLabelHierarchyAlgorithm.h".}
proc SetInputData*(this: var vtkLabelHierarchyAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "SetInputData",
                                        header: "vtkLabelHierarchyAlgorithm.h".}
proc AddInputData*(this: var vtkLabelHierarchyAlgorithm; a2: ptr vtkDataObject) {.
    importcpp: "AddInputData", header: "vtkLabelHierarchyAlgorithm.h".}
proc AddInputData*(this: var vtkLabelHierarchyAlgorithm; a2: cint;
                  a3: ptr vtkDataObject) {.importcpp: "AddInputData",
                                        header: "vtkLabelHierarchyAlgorithm.h".}