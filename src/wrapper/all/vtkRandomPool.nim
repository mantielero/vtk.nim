## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRandomPool.h
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
##  @class   vtkRandomPool
##  @brief   convenience class to quickly generate a pool of random numbers
##
##  vtkRandomPool generates random numbers, and can do so using
##  multithreading.  It supports parallel applications where generating random
##  numbers on the fly is difficult (i.e., non-deterministic). Also, it can be
##  used to populate vtkDataArrays in an efficient manner. By default it uses
##  an instance of vtkMersenneTwister to generate random sequences, but any
##  subclass of vtkRandomSequence may be used. It also supports simple methods
##  to generate, access, and pass random memory pools between objects.
##
##  In threaded applications, these class may be conveniently used to
##  pre-generate a sequence of random numbers, followed by the use of
##  deterministic accessor methods to produce random sequences without
##  problems etc. due to unpredictable work load and order of thread
##  execution.
##
##  @warning
##  The class uses vtkMultiThreader if the size of the pool is larger than
##  the specified chunk size. Also, vtkSMPTools may be used to scale the
##  components in the method PopulateDataArray().
##

import
  vtkCommonCoreModule, vtkObject

discard "forward decl of vtkRandomSequence"
discard "forward decl of vtkDataArray"
type
  vtkRandomPool* {.importcpp: "vtkRandomPool", header: "vtkRandomPool.h", bycopy.} = object of vtkObject ## /@{
                                                                                               ## *
                                                                                               ##  Standard methods for instantiation, type information, and printing.
                                                                                               ##
    vtkRandomPool* {.importc: "vtkRandomPool".}: VTK_NEWINSTANCE
    ##  Data members to support public API
    ##  Internal data members


proc New*(): ptr vtkRandomPool {.importcpp: "vtkRandomPool::New(@)",
                             header: "vtkRandomPool.h".}
type
  vtkRandomPoolSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRandomPool::IsTypeOf(@)", header: "vtkRandomPool.h".}
proc IsA*(this: var vtkRandomPool; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkRandomPool.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRandomPool {.
    importcpp: "vtkRandomPool::SafeDownCast(@)", header: "vtkRandomPool.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRandomPool :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRandomPool :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRandomPool :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRandomPool; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRandomPool.h".}
proc SetSequence*(this: var vtkRandomPool; seq: ptr vtkRandomSequence) {.
    importcpp: "SetSequence", header: "vtkRandomPool.h".}
proc GetnameSequence*(this: var vtkRandomPool): ptr vtkRandomSequence {.
    importcpp: "GetnameSequence", header: "vtkRandomPool.h".}
  ## /@}
  ## /@{
  ## *
  ##  Methods to set and get the size of the pool. The size must be specified
  ##  before invoking GeneratePool(). Note the number of components will
  ##  affect the total size (allocated memory is Size*NumberOfComponents).
  ##
proc SetSize*(this: var vtkRandomPool; _arg: vtkIdType) {.importcpp: "SetSize",
    header: "vtkRandomPool.h".}
proc GetSizeMinValue*(this: var vtkRandomPool): vtkIdType {.
    importcpp: "GetSizeMinValue", header: "vtkRandomPool.h".}
proc GetSizeMaxValue*(this: var vtkRandomPool): vtkIdType {.
    importcpp: "GetSizeMaxValue", header: "vtkRandomPool.h".}
## !!!Ignored construct:  virtual vtkIdType GetSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Size  of  << this -> Size ) ; return this -> Size ; } ;
## Error: expected ';'!!!

proc SetSizeNumberOfComponents*(this: var vtkRandomPool; _arg: vtkIdType) {.
    importcpp: "SetSizeNumberOfComponents", header: "vtkRandomPool.h".}
proc GetSizeMinValueNumberOfComponentsMinValue*(this: var vtkRandomPool): vtkIdType {.
    importcpp: "GetSizeMinValueNumberOfComponentsMinValue",
    header: "vtkRandomPool.h".}
proc GetSizeMaxValueNumberOfComponentsMaxValue*(this: var vtkRandomPool): vtkIdType {.
    importcpp: "GetSizeMaxValueNumberOfComponentsMaxValue",
    header: "vtkRandomPool.h".}
## !!!Ignored construct:  virtual vtkIdType GetSizeNumberOfComponents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfComponents  of  << this -> NumberOfComponents ) ; return this -> NumberOfComponents ; } ;
## Error: expected ';'!!!

proc GetTotalSize*(this: var vtkRandomPool): vtkIdType {.importcpp: "GetTotalSize",
    header: "vtkRandomPool.h".}
proc GeneratePool*(this: var vtkRandomPool): ptr cdouble {.importcpp: "GeneratePool",
    header: "vtkRandomPool.h".}
proc GetPool*(this: var vtkRandomPool): ptr cdouble {.importcpp: "GetPool",
    header: "vtkRandomPool.h".}
proc GetValue*(this: var vtkRandomPool; i: vtkIdType): cdouble {.importcpp: "GetValue",
    header: "vtkRandomPool.h".}
proc GetValue*(this: var vtkRandomPool; i: vtkIdType; compNum: cint): cdouble {.
    importcpp: "GetValue", header: "vtkRandomPool.h".}
proc PopulateDataArray*(this: var vtkRandomPool; da: ptr vtkDataArray;
                       minRange: cdouble; maxRange: cdouble) {.
    importcpp: "PopulateDataArray", header: "vtkRandomPool.h".}
proc PopulateDataArray*(this: var vtkRandomPool; da: ptr vtkDataArray;
                       compNumber: cint; minRange: cdouble; maxRange: cdouble) {.
    importcpp: "PopulateDataArray", header: "vtkRandomPool.h".}
proc SetSizeNumberOfComponentsChunkSize*(this: var vtkRandomPool; _arg: vtkIdType) {.
    importcpp: "SetSizeNumberOfComponentsChunkSize", header: "vtkRandomPool.h".}
proc GetSizeMinValueNumberOfComponentsMinValueChunkSizeMinValue*(
    this: var vtkRandomPool): vtkIdType {.importcpp: "GetSizeMinValueNumberOfComponentsMinValueChunkSizeMinValue",
                                      header: "vtkRandomPool.h".}
proc GetSizeMaxValueNumberOfComponentsMaxValueChunkSizeMaxValue*(
    this: var vtkRandomPool): vtkIdType {.importcpp: "GetSizeMaxValueNumberOfComponentsMaxValueChunkSizeMaxValue",
                                      header: "vtkRandomPool.h".}
## !!!Ignored construct:  virtual vtkIdType GetSizeNumberOfComponentsChunkSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ChunkSize  of  << this -> ChunkSize ) ; return this -> ChunkSize ; } ;
## Error: expected ';'!!!
