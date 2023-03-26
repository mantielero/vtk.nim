## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelection.h
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
##  @class   vtkExtractSelection
##  @brief   extract a subset from a vtkDataSet.
##
##  vtkExtractSelection extracts some subset of cells and points from
##  its input dataobject. The dataobject is given on its first input port.
##  The subset is described by the contents of the vtkSelection on its
##  second input port.  Depending on the contents of the vtkSelection
##  this will create various vtkSelectors to identify the
##  selected elements.
##
##  This filter supports vtkCompositeDataSet (output is vtkMultiBlockDataSet),
##  vtkTable and vtkDataSet (output is vtkUnstructuredGrid).
##  Other types of input are not processed and the corresponding output is a
##  default constructed object of the input type.
##
##  @sa
##  vtkSelection vtkSelector vtkSelectionNode
##

import
  vtkDataObjectAlgorithm, vtkFiltersExtractionModule, vtkSelectionNode,
  vtkSmartPointer

discard "forward decl of vtkSignedCharArray"
discard "forward decl of vtkSelection"
discard "forward decl of vtkSelectionNode"
discard "forward decl of vtkSelector"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkTable"
type
  vtkExtractSelection* {.importcpp: "vtkExtractSelection",
                        header: "vtkExtractSelection.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkExtractSelection* {.importc: "vtkExtractSelection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExtractSelection {.importcpp: "vtkExtractSelection::New(@)",
                                   header: "vtkExtractSelection.h".}
type
  vtkExtractSelectionSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractSelection::IsTypeOf(@)", header: "vtkExtractSelection.h".}
proc IsA*(this: var vtkExtractSelection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtractSelection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractSelection {.
    importcpp: "vtkExtractSelection::SafeDownCast(@)",
    header: "vtkExtractSelection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractSelection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractSelection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractSelection.h".}
proc SetSelectionConnection*(this: var vtkExtractSelection;
                            algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSelectionConnection", header: "vtkExtractSelection.h".}
proc SetPreserveTopology*(this: var vtkExtractSelection; _arg: bool) {.
    importcpp: "SetPreserveTopology", header: "vtkExtractSelection.h".}
## !!!Ignored construct:  virtual bool GetPreserveTopology ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveTopology  of  << this -> PreserveTopology ) ; return this -> PreserveTopology ; } ;
## Error: expected ';'!!!

proc PreserveTopologyOn*(this: var vtkExtractSelection) {.
    importcpp: "PreserveTopologyOn", header: "vtkExtractSelection.h".}
proc PreserveTopologyOff*(this: var vtkExtractSelection) {.
    importcpp: "PreserveTopologyOff", header: "vtkExtractSelection.h".}
  ## /@}