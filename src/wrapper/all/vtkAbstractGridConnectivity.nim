## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAbstractGridConnectivity.h
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
##  @class   vtkAbstractGridConnectivity
##
##
##   A superclass that defines the interface to be implemented by all
##   concrete grid connectivity classes. Grid connectivity classes provide the
##   mechanism to achieve the following:
##   <ul>
##     <li>
##       <b> Handling of partitioned/distributed data </b>
##       <p>
##        Construct the neighboring topology information for each partition,e.g.,
##        used for creating communication lists and in computing statistics,i.e.,
##        average, mean, etc.
##       </p>
##       <b> Creation of ghost layers </b>
##       <p>
##        Provides the mechanism for automatically generating ghost information
##        given a partitioned/distributed grid configuration.
##       </p>
##     </li>
##   </ul>
##
##  @sa
##   vtkStructuredGridConnectivity vtkStructuredAMRGridConnectivity
##

##  VTK includes

import
  vtkCellData, vtkFiltersGeometryModule, vtkObject, vtkPointData, vtkPoints,
  vtkUnsignedCharArray

##  Forward declarations

discard "forward decl of vtkPointData"
discard "forward decl of vtkCellData"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkPoints"
type
  vtkAbstractGridConnectivity* {.importcpp: "vtkAbstractGridConnectivity",
                                header: "vtkAbstractGridConnectivity.h", bycopy.} = object of vtkObject
    vtkAbstractGridConnectivity* {.importc: "vtkAbstractGridConnectivity".}: VTK_NEWINSTANCE
    ##  Arrays registered by the user for each grid
    ##  Arrays computed internally for each grid

  vtkAbstractGridConnectivitySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractGridConnectivity::IsTypeOf(@)",
    header: "vtkAbstractGridConnectivity.h".}
proc IsA*(this: var vtkAbstractGridConnectivity; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractGridConnectivity.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractGridConnectivity {.
    importcpp: "vtkAbstractGridConnectivity::SafeDownCast(@)",
    header: "vtkAbstractGridConnectivity.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractGridConnectivity :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractGridConnectivity :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractGridConnectivity :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractGridConnectivity; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAbstractGridConnectivity.h".}
proc SetNumberOfGhostLayers*(this: var vtkAbstractGridConnectivity; _arg: cuint) {.
    importcpp: "SetNumberOfGhostLayers", header: "vtkAbstractGridConnectivity.h".}
## !!!Ignored construct:  virtual unsigned int GetNumberOfGhostLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfGhostLayers  of  << this -> NumberOfGhostLayers ) ; return this -> NumberOfGhostLayers ; } ;
## Error: expected ';'!!!

proc SetNumberOfGrids*(this: var vtkAbstractGridConnectivity; N: cuint) {.
    importcpp: "SetNumberOfGrids", header: "vtkAbstractGridConnectivity.h".}
proc GetNumberOfGrids*(this: var vtkAbstractGridConnectivity): cuint {.
    importcpp: "GetNumberOfGrids", header: "vtkAbstractGridConnectivity.h".}
proc ComputeNeighbors*(this: var vtkAbstractGridConnectivity) {.
    importcpp: "ComputeNeighbors", header: "vtkAbstractGridConnectivity.h".}
proc CreateGhostLayers*(this: var vtkAbstractGridConnectivity; N: cint = 1) {.
    importcpp: "CreateGhostLayers", header: "vtkAbstractGridConnectivity.h".}
proc GetGhostedPointGhostArray*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkUnsignedCharArray {.
    importcpp: "GetGhostedPointGhostArray",
    header: "vtkAbstractGridConnectivity.h".}
proc GetGhostedCellGhostArray*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkUnsignedCharArray {.
    importcpp: "GetGhostedCellGhostArray", header: "vtkAbstractGridConnectivity.h".}
proc GetGhostedGridPointData*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkPointData {.
    importcpp: "GetGhostedGridPointData", header: "vtkAbstractGridConnectivity.h".}
proc GetGhostedGridCellData*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkCellData {.
    importcpp: "GetGhostedGridCellData", header: "vtkAbstractGridConnectivity.h".}
proc GetGhostedPoints*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkPoints {.
    importcpp: "GetGhostedPoints", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGhostedPointGhostArray*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkUnsignedCharArray {.
    importcpp: "GetGhostedPointGhostArray",
    header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGhostedCellGhostArray*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkUnsignedCharArray {.
    importcpp: "GetGhostedCellGhostArray", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGhostedGridPointData*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkPointData {.
    importcpp: "GetGhostedGridPointData", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGhostedGridCellData*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkCellData {.
    importcpp: "GetGhostedGridCellData", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc GetGhostedPoints*(this: var vtkAbstractGridConnectivity; gridID: cint): ptr vtkPoints {.
    importcpp: "GetGhostedPoints", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc AllocateUserRegisterDataStructures*(this: var vtkAbstractGridConnectivity) {.
    importcpp: "AllocateUserRegisterDataStructures",
    header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc DeAllocateUserRegisterDataStructures*(this: var vtkAbstractGridConnectivity) {.
    importcpp: "DeAllocateUserRegisterDataStructures",
    header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc AllocateInternalDataStructures*(this: var vtkAbstractGridConnectivity) {.
    importcpp: "AllocateInternalDataStructures",
    header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc DeAllocateInternalDataStructures*(this: var vtkAbstractGridConnectivity) {.
    importcpp: "DeAllocateInternalDataStructures",
    header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc RegisterGridGhostArrays*(this: var vtkAbstractGridConnectivity; gridID: cint;
                             nodesArray: ptr vtkUnsignedCharArray;
                             cellsArray: ptr vtkUnsignedCharArray) {.
    importcpp: "RegisterGridGhostArrays", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc RegisterFieldData*(this: var vtkAbstractGridConnectivity; gridID: cint;
                       PointData: ptr vtkPointData; CellData: ptr vtkCellData) {.
    importcpp: "RegisterFieldData", header: "vtkAbstractGridConnectivity.h".}
## ------------------------------------------------------------------------------

proc RegisterGridNodes*(this: var vtkAbstractGridConnectivity; gridID: cint;
                       nodes: ptr vtkPoints) {.importcpp: "RegisterGridNodes",
    header: "vtkAbstractGridConnectivity.h".}