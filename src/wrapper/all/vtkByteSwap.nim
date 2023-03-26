## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkByteSwap.h
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
##  @class   vtkByteSwap
##  @brief   perform machine dependent byte swapping
##
##  vtkByteSwap is used by other classes to perform machine dependent byte
##  swapping. Byte swapping is often used when reading or writing binary
##  files.
##

import
  vtkCommonCoreModule, vtkObject

type
  vtkByteSwap* {.importcpp: "vtkByteSwap", header: "vtkByteSwap.h", bycopy.} = object of vtkObject
    vtkByteSwap* {.importc: "vtkByteSwap".}: VTK_NEWINSTANCE
    double* {.importc: "double".}: VTK_BYTE_SWAP_DECL
    char* {.importc: "char".}: VTK_BYTE_SWAP_DECL
    short* {.importc: "short".}: VTK_BYTE_SWAP_DECL
    int* {.importc: "int".}: VTK_BYTE_SWAP_DECL
    long* {.importc: "long".}: VTK_BYTE_SWAP_DECL


proc New*(): ptr vtkByteSwap {.importcpp: "vtkByteSwap::New(@)",
                           header: "vtkByteSwap.h".}
type
  vtkByteSwapSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkByteSwap::IsTypeOf(@)", header: "vtkByteSwap.h".}
proc IsA*(this: var vtkByteSwap; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkByteSwap.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkByteSwap {.
    importcpp: "vtkByteSwap::SafeDownCast(@)", header: "vtkByteSwap.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkByteSwap :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkByteSwap :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkByteSwap :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkByteSwap; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkByteSwap.h".}
template VTK_BYTE_SWAP_DECL*(T: untyped): void =
  proc SwapLE*(p: ptr cfloat) {.importcpp: "SwapLE(@)", header: "vtkByteSwap.h".}

proc SwapBE*(p: ptr cfloat) {.importcpp: "vtkByteSwap::SwapBE(@)",
                          header: "vtkByteSwap.h".}
proc SwapLERange*(p: ptr cfloat; num: csize_t) {.
    importcpp: "vtkByteSwap::SwapLERange(@)", header: "vtkByteSwap.h".}
proc SwapBERange*(p: ptr cfloat; num: csize_t) {.
    importcpp: "vtkByteSwap::SwapBERange(@)", header: "vtkByteSwap.h".}
proc SwapLERangeWrite*(p: ptr cfloat; num: csize_t; file: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapLERangeWrite(@)", header: "vtkByteSwap.h".}
proc SwapBERangeWrite*(p: ptr cfloat; num: csize_t; file: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapBERangeWrite(@)", header: "vtkByteSwap.h".}
proc SwapLERangeWrite*(p: ptr cfloat; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapLERangeWrite(@)", header: "vtkByteSwap.h".}
proc SwapBERangeWrite*(p: ptr cfloat; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapBERangeWrite(@)", header: "vtkByteSwap.h".}
## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( long long ) ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( signed char ) ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( unsigned char ) ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( unsigned short ) ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( unsigned int ) ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( unsigned long ) ;
## Error: token expected: ) but got: [identifier]!!!

## !!!Ignored construct:  VTK_BYTE_SWAP_DECL ( unsigned long long ) ;
## Error: token expected: ) but got: [identifier]!!!

proc Swap2LE*(p: pointer) {.importcpp: "vtkByteSwap::Swap2LE(@)",
                         header: "vtkByteSwap.h".}
proc Swap4LE*(p: pointer) {.importcpp: "vtkByteSwap::Swap4LE(@)",
                         header: "vtkByteSwap.h".}
proc Swap8LE*(p: pointer) {.importcpp: "vtkByteSwap::Swap8LE(@)",
                         header: "vtkByteSwap.h".}
proc Swap2LERange*(p: pointer; num: csize_t) {.
    importcpp: "vtkByteSwap::Swap2LERange(@)", header: "vtkByteSwap.h".}
proc Swap4LERange*(p: pointer; num: csize_t) {.
    importcpp: "vtkByteSwap::Swap4LERange(@)", header: "vtkByteSwap.h".}
proc Swap8LERange*(p: pointer; num: csize_t) {.
    importcpp: "vtkByteSwap::Swap8LERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite2LERange*(p: pointer; num: csize_t; f: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapWrite2LERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite4LERange*(p: pointer; num: csize_t; f: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapWrite4LERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite8LERange*(p: pointer; num: csize_t; f: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapWrite8LERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite2LERange*(p: pointer; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapWrite2LERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite4LERange*(p: pointer; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapWrite4LERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite8LERange*(p: pointer; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapWrite8LERange(@)", header: "vtkByteSwap.h".}
proc Swap2BE*(p: pointer) {.importcpp: "vtkByteSwap::Swap2BE(@)",
                         header: "vtkByteSwap.h".}
proc Swap4BE*(p: pointer) {.importcpp: "vtkByteSwap::Swap4BE(@)",
                         header: "vtkByteSwap.h".}
proc Swap8BE*(p: pointer) {.importcpp: "vtkByteSwap::Swap8BE(@)",
                         header: "vtkByteSwap.h".}
proc Swap2BERange*(p: pointer; num: csize_t) {.
    importcpp: "vtkByteSwap::Swap2BERange(@)", header: "vtkByteSwap.h".}
proc Swap4BERange*(p: pointer; num: csize_t) {.
    importcpp: "vtkByteSwap::Swap4BERange(@)", header: "vtkByteSwap.h".}
proc Swap8BERange*(p: pointer; num: csize_t) {.
    importcpp: "vtkByteSwap::Swap8BERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite2BERange*(p: pointer; num: csize_t; f: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapWrite2BERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite4BERange*(p: pointer; num: csize_t; f: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapWrite4BERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite8BERange*(p: pointer; num: csize_t; f: ptr FILE): bool {.
    importcpp: "vtkByteSwap::SwapWrite8BERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite2BERange*(p: pointer; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapWrite2BERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite4BERange*(p: pointer; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapWrite4BERange(@)", header: "vtkByteSwap.h".}
proc SwapWrite8BERange*(p: pointer; num: csize_t; os: ptr ostream) {.
    importcpp: "vtkByteSwap::SwapWrite8BERange(@)", header: "vtkByteSwap.h".}
proc SwapVoidRange*(buffer: pointer; numWords: csize_t; wordSize: csize_t) {.
    importcpp: "vtkByteSwap::SwapVoidRange(@)", header: "vtkByteSwap.h".}