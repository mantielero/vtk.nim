## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDuplicatePolyData.h
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
##  @class   vtkDuplicatePolyData
##  @brief   For distributed tiled displays.
##
##  This filter collects poly data and duplicates it on every node.
##  Converts data parallel so every node has a complete copy of the data.
##  The filter is used at the end of a pipeline for driving a tiled
##  display.
##

import
  vtkFiltersParallelModule, vtkPolyDataAlgorithm

discard "forward decl of vtkSocketController"
discard "forward decl of vtkMultiProcessController"
type
  vtkDuplicatePolyData* {.importcpp: "vtkDuplicatePolyData",
                         header: "vtkDuplicatePolyData.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkDuplicatePolyData* {.importc: "vtkDuplicatePolyData".}: VTK_NEWINSTANCE
    ##  For client server mode.


proc New*(): ptr vtkDuplicatePolyData {.importcpp: "vtkDuplicatePolyData::New(@)",
                                    header: "vtkDuplicatePolyData.h".}
type
  vtkDuplicatePolyDataSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDuplicatePolyData::IsTypeOf(@)",
    header: "vtkDuplicatePolyData.h".}
proc IsA*(this: var vtkDuplicatePolyData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDuplicatePolyData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDuplicatePolyData {.
    importcpp: "vtkDuplicatePolyData::SafeDownCast(@)",
    header: "vtkDuplicatePolyData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDuplicatePolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDuplicatePolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDuplicatePolyData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDuplicatePolyData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDuplicatePolyData.h".}
proc SetController*(this: var vtkDuplicatePolyData;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkDuplicatePolyData.h".}
proc GetnameController*(this: var vtkDuplicatePolyData): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkDuplicatePolyData.h".}
  ## /@}
proc InitializeSchedule*(this: var vtkDuplicatePolyData; numProcs: cint) {.
    importcpp: "InitializeSchedule", header: "vtkDuplicatePolyData.h".}
proc SetSynchronous*(this: var vtkDuplicatePolyData; _arg: vtkTypeBool) {.
    importcpp: "SetSynchronous", header: "vtkDuplicatePolyData.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetSynchronous ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Synchronous  of  << this -> Synchronous ) ; return this -> Synchronous ; } ;
## Error: expected ';'!!!

proc SynchronousOn*(this: var vtkDuplicatePolyData) {.importcpp: "SynchronousOn",
    header: "vtkDuplicatePolyData.h".}
proc SynchronousOff*(this: var vtkDuplicatePolyData) {.importcpp: "SynchronousOff",
    header: "vtkDuplicatePolyData.h".}
  ## /@}
  ## /@{
  ## *
  ##  This duplicate filter works in client server mode when this
  ##  controller is set.  We have a client flag to differentiate the
  ##  client and server because the socket controller is odd:
  ##  Proth processes think their id is 0.
  ##
proc GetSocketController*(this: var vtkDuplicatePolyData): ptr vtkSocketController {.
    importcpp: "GetSocketController", header: "vtkDuplicatePolyData.h".}
proc SetSocketController*(this: var vtkDuplicatePolyData;
                         controller: ptr vtkSocketController) {.
    importcpp: "SetSocketController", header: "vtkDuplicatePolyData.h".}
proc SetSynchronousClientFlag*(this: var vtkDuplicatePolyData; _arg: cint) {.
    importcpp: "SetSynchronousClientFlag", header: "vtkDuplicatePolyData.h".}
## !!!Ignored construct:  virtual int GetSynchronousClientFlag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ClientFlag  of  << this -> ClientFlag ) ; return this -> ClientFlag ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  This returns to size of the output (on this process).
##  This method is not really used.  It is needed to have
##  the same API as vtkCollectPolyData.
##  virtual unsigned long GetSynchronousClientFlagMemorySizeMemorySize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MemorySize  of  << this -> MemorySize ) ; return this -> MemorySize ; } ;
## Error: expected ';'!!!
