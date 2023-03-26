## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkStructuredGridPartitioner.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkStructuredGridPartitioner
##
##
##   A concrete implementation of vtkMultiBlockDataSetAlgorithm that provides
##   functionality for partitioning a VTK structured grid dataset. The partition-
##   ing method used is Recursive Coordinate Bisection (RCB) where each time the
##   longest dimension is split.
##
##  @sa
##   vtkUniformGridPartitioner vtkRectilinearGridPartitioner
##

import
  vtkFiltersGeometryModule, vtkMultiBlockDataSetAlgorithm

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkIndent"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkPoints"
type
  vtkStructuredGridPartitioner* {.importcpp: "vtkStructuredGridPartitioner",
                                 header: "vtkStructuredGridPartitioner.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkStructuredGridPartitioner* {.importc: "vtkStructuredGridPartitioner".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredGridPartitioner {.
    importcpp: "vtkStructuredGridPartitioner::New(@)",
    header: "vtkStructuredGridPartitioner.h".}
type
  vtkStructuredGridPartitionerSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredGridPartitioner::IsTypeOf(@)",
    header: "vtkStructuredGridPartitioner.h".}
proc IsA*(this: var vtkStructuredGridPartitioner; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredGridPartitioner.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredGridPartitioner {.
    importcpp: "vtkStructuredGridPartitioner::SafeDownCast(@)",
    header: "vtkStructuredGridPartitioner.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredGridPartitioner :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredGridPartitioner :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredGridPartitioner :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredGridPartitioner; oss: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkStructuredGridPartitioner.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get macro for the number of subdivisions.
##  virtual int GetNumberOfPartitionsNumberOfPartitions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPartitions  of  << this -> NumberOfPartitions ) ; return this -> NumberOfPartitions ; } ;
## Error: expected ';'!!!

proc SetNumberOfPartitions*(this: var vtkStructuredGridPartitioner; _arg: cint) {.
    importcpp: "SetNumberOfPartitions", header: "vtkStructuredGridPartitioner.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get macro for the number of ghost layers.
  ##
## !!!Ignored construct:  virtual int GetNumberOfPartitionsNumberOfPartitionsNumberOfGhostLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfGhostLayers  of  << this -> NumberOfGhostLayers ) ; return this -> NumberOfGhostLayers ; } ;
## Error: expected ';'!!!

proc SetNumberOfPartitionsNumberOfGhostLayers*(
    this: var vtkStructuredGridPartitioner; _arg: cint) {.
    importcpp: "SetNumberOfPartitionsNumberOfGhostLayers",
    header: "vtkStructuredGridPartitioner.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get & boolean macro for the DuplicateNodes property.
  ##
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfPartitionsNumberOfPartitionsNumberOfGhostLayersDuplicateNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DuplicateNodes  of  << this -> DuplicateNodes ) ; return this -> DuplicateNodes ; } ;
## Error: expected ';'!!!

proc SetNumberOfPartitionsNumberOfGhostLayersDuplicateNodes*(
    this: var vtkStructuredGridPartitioner; _arg: vtkTypeBool) {.
    importcpp: "SetNumberOfPartitionsNumberOfGhostLayersDuplicateNodes",
    header: "vtkStructuredGridPartitioner.h".}
proc DuplicateNodesOn*(this: var vtkStructuredGridPartitioner) {.
    importcpp: "DuplicateNodesOn", header: "vtkStructuredGridPartitioner.h".}
proc DuplicateNodesOff*(this: var vtkStructuredGridPartitioner) {.
    importcpp: "DuplicateNodesOff", header: "vtkStructuredGridPartitioner.h".}
  ## /@}