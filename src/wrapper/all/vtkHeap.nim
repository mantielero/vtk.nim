## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHeap.h
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
##  @class   vtkHeap
##  @brief   replacement for malloc/free and new/delete
##
##  This class is a replacement for malloc/free and new/delete for software
##  that has inherent memory leak or performance problems. For example,
##  external software such as the PLY library (vtkPLY) and VRML importer
##  (vtkVRMLImporter) are often written with lots of malloc() calls but
##  without the corresponding free() invocations. The class
##  vtkOrderedTriangulator may create and delete millions of new/delete calls.
##  This class allows the overloading of the C++ new operator (or other memory
##  allocation requests) by using the method AllocateMemory(). Memory is
##  deleted with an invocation of CleanAll() (which deletes ALL memory; any
##  given memory allocation cannot be deleted). Note: a block size can be used
##  to control the size of each memory allocation. Requests for memory are
##  fulfilled from the block until the block runs out, then a new block is
##  created.
##
##  @warning
##  Do not use this class as a general replacement for system memory
##  allocation.  This class should be used only as a last resort if memory
##  leaks cannot be tracked down and eliminated by conventional means. Also,
##  deleting memory from vtkHeap is not supported. Only the deletion of
##  the entire heap is. (A Reset() method allows you to reuse previously
##  allocated memory.)
##
##  @sa
##  vtkVRMLImporter vtkPLY vtkOrderedTriangulator
##

import
  vtkCommonMiscModule, vtkObject

discard "forward decl of vtkHeapBlock"
type
  vtkHeap* {.importcpp: "vtkHeap", header: "vtkHeap.h", bycopy.} = object of vtkObject
    vtkHeap* {.importc: "vtkHeap".}: VTK_NEWINSTANCE
    ##  Manage the blocks
    ##  Manage the memory in the block
    ##  the position in the Current block


proc New*(): ptr vtkHeap {.importcpp: "vtkHeap::New(@)", header: "vtkHeap.h".}
type
  vtkHeapSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkHeap::IsTypeOf(@)",
    header: "vtkHeap.h".}
proc IsA*(this: var vtkHeap; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkHeap.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHeap {.
    importcpp: "vtkHeap::SafeDownCast(@)", header: "vtkHeap.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHeap :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHeap :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHeap :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHeap; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHeap.h".}
proc AllocateMemory*(this: var vtkHeap; n: csize_t): pointer {.
    importcpp: "AllocateMemory", header: "vtkHeap.h".}
proc SetBlockSize*(this: var vtkHeap; a2: csize_t) {.importcpp: "SetBlockSize",
    header: "vtkHeap.h".}
proc GetBlockSize*(this: var vtkHeap): csize_t {.importcpp: "GetBlockSize",
    header: "vtkHeap.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get the number of allocations thus far.
##  virtual int GetNumberOfBlocksNumberOfBlocks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBlocks  of  << this -> NumberOfBlocks ) ; return this -> NumberOfBlocks ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetNumberOfBlocksNumberOfBlocksNumberOfAllocations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfAllocations  of  << this -> NumberOfAllocations ) ; return this -> NumberOfAllocations ; } ;
## Error: expected ';'!!!

proc Reset*(this: var vtkHeap) {.importcpp: "Reset", header: "vtkHeap.h".}
proc StringDup*(this: var vtkHeap; str: cstring): cstring {.importcpp: "StringDup",
    header: "vtkHeap.h".}