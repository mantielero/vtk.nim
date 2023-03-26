## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkExtentRCBPartitioner.h
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
##  @class   vtkExtentRCBPartitioner
##  @brief   This method partitions a global extent to N partitions where N is a user
##   supplied parameter.
##

import
  vtkCommonExecutionModelModule, vtkObject

type
  vtkExtentRCBPartitioner* {.importcpp: "vtkExtentRCBPartitioner",
                            header: "vtkExtentRCBPartitioner.h", bycopy.} = object of vtkObject
    vtkExtentRCBPartitioner* {.importc: "vtkExtentRCBPartitioner".}: VTK_NEWINSTANCE
    ##  indicates whether nodes are duplicated between
    ##  partitions, so that they are abutting. This is
    ##  set to true by default. If disabled, the resulting
    ##  partitions will have gaps.


proc New*(): ptr vtkExtentRCBPartitioner {.importcpp: "vtkExtentRCBPartitioner::New(@)",
                                       header: "vtkExtentRCBPartitioner.h".}
type
  vtkExtentRCBPartitionerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtentRCBPartitioner::IsTypeOf(@)",
    header: "vtkExtentRCBPartitioner.h".}
proc IsA*(this: var vtkExtentRCBPartitioner; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExtentRCBPartitioner.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtentRCBPartitioner {.
    importcpp: "vtkExtentRCBPartitioner::SafeDownCast(@)",
    header: "vtkExtentRCBPartitioner.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtentRCBPartitioner :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtentRCBPartitioner :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtentRCBPartitioner :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtentRCBPartitioner; oss: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtentRCBPartitioner.h".}
proc SetNumberOfPartitions*(this: var vtkExtentRCBPartitioner; N: cint) {.
    importcpp: "SetNumberOfPartitions", header: "vtkExtentRCBPartitioner.h".}
proc SetGlobalExtent*(this: var vtkExtentRCBPartitioner; imin: cint; imax: cint;
                     jmin: cint; jmax: cint; kmin: cint; kmax: cint) {.
    importcpp: "SetGlobalExtent", header: "vtkExtentRCBPartitioner.h".}
proc SetGlobalExtent*(this: var vtkExtentRCBPartitioner; ext: array[6, cint]) {.
    importcpp: "SetGlobalExtent", header: "vtkExtentRCBPartitioner.h".}
proc SetDuplicateNodes*(this: var vtkExtentRCBPartitioner; _arg: vtkTypeBool) {.
    importcpp: "SetDuplicateNodes", header: "vtkExtentRCBPartitioner.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDuplicateNodes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DuplicateNodes  of  << this -> DuplicateNodes ) ; return this -> DuplicateNodes ; } ;
## Error: expected ';'!!!

proc DuplicateNodesOn*(this: var vtkExtentRCBPartitioner) {.
    importcpp: "DuplicateNodesOn", header: "vtkExtentRCBPartitioner.h".}
proc DuplicateNodesOff*(this: var vtkExtentRCBPartitioner) {.
    importcpp: "DuplicateNodesOff", header: "vtkExtentRCBPartitioner.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get macro for the number of ghost layers.
  ##
proc SetDuplicateNodesNumberOfGhostLayers*(this: var vtkExtentRCBPartitioner;
    _arg: cint) {.importcpp: "SetDuplicateNodesNumberOfGhostLayers",
                header: "vtkExtentRCBPartitioner.h".}
## !!!Ignored construct:  virtual int GetDuplicateNodesNumberOfGhostLayers ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfGhostLayers  of  << this -> NumberOfGhostLayers ) ; return this -> NumberOfGhostLayers ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Returns the number of extents.
##  virtual int GetDuplicateNodesNumberOfGhostLayersNumExtentsNumExtents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumExtents  of  << this -> NumExtents ) ; return this -> NumExtents ; } ;
## Error: expected ';'!!!

proc Partition*(this: var vtkExtentRCBPartitioner) {.importcpp: "Partition",
    header: "vtkExtentRCBPartitioner.h".}
proc GetPartitionExtent*(this: var vtkExtentRCBPartitioner; idx: cint;
                        ext: array[6, cint]) {.importcpp: "GetPartitionExtent",
    header: "vtkExtentRCBPartitioner.h".}