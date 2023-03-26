## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRDataSetCache.h
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
##  @class   vtkAMRDataSetCache
##
##
##   A concrete implementation of vtkObject that provides functionality for
##   caching AMR blocks. The primary intent of this class is to be used by the
##   AMR reader infrastructure for caching blocks/data in memory to minimize
##   out-of-core operations.
##

import
  vtkIOAMRModule, vtkObject

discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkDataArray"
type
  vtkAMRDataSetCache* {.importcpp: "vtkAMRDataSetCache",
                       header: "vtkAMRDataSetCache.h", bycopy.} = object of vtkObject
    vtkAMRDataSetCache* {.importc: "vtkAMRDataSetCache".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAMRDataSetCache {.importcpp: "vtkAMRDataSetCache::New(@)",
                                  header: "vtkAMRDataSetCache.h".}
type
  vtkAMRDataSetCacheSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAMRDataSetCache::IsTypeOf(@)", header: "vtkAMRDataSetCache.h".}
proc IsA*(this: var vtkAMRDataSetCache; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAMRDataSetCache.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAMRDataSetCache {.
    importcpp: "vtkAMRDataSetCache::SafeDownCast(@)",
    header: "vtkAMRDataSetCache.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAMRDataSetCache :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRDataSetCache :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRDataSetCache :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAMRDataSetCache; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAMRDataSetCache.h".}
proc InsertAMRBlock*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                    amrGrid: ptr vtkUniformGrid) {.importcpp: "InsertAMRBlock",
    header: "vtkAMRDataSetCache.h".}
proc InsertAMRBlockPointData*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                             dataArray: ptr vtkDataArray) {.
    importcpp: "InsertAMRBlockPointData", header: "vtkAMRDataSetCache.h".}
proc InsertAMRBlockCellData*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                            dataArray: ptr vtkDataArray) {.
    importcpp: "InsertAMRBlockCellData", header: "vtkAMRDataSetCache.h".}
proc GetAMRBlockCellData*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                         dataName: cstring): ptr vtkDataArray {.
    importcpp: "GetAMRBlockCellData", header: "vtkAMRDataSetCache.h".}
proc GetAMRBlockPointData*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                          dataName: cstring): ptr vtkDataArray {.
    importcpp: "GetAMRBlockPointData", header: "vtkAMRDataSetCache.h".}
proc GetAMRBlock*(this: var vtkAMRDataSetCache; compositeIdx: cint): ptr vtkUniformGrid {.
    importcpp: "GetAMRBlock", header: "vtkAMRDataSetCache.h".}
proc HasAMRBlockCellData*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                         name: cstring): bool {.importcpp: "HasAMRBlockCellData",
    header: "vtkAMRDataSetCache.h".}
proc HasAMRBlockPointData*(this: var vtkAMRDataSetCache; compositeIdx: cint;
                          name: cstring): bool {.importcpp: "HasAMRBlockPointData",
    header: "vtkAMRDataSetCache.h".}
proc HasAMRBlock*(this: var vtkAMRDataSetCache; compositeIdx: cint): bool {.
    importcpp: "HasAMRBlock", header: "vtkAMRDataSetCache.h".}