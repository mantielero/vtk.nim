## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUniformGridAMR.h
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
##  @class   vtkUniformGridAMR
##  @brief   a concrete implementation of vtkCompositeDataSet
##
##  vtkUniformGridAMR is an AMR (hierarchical) composite dataset that holds vtkUniformGrids.
##
##  @sa
##  vtkUniformGridAMRDataIterator
##

import
  vtkCommonDataModelModule, vtkCompositeDataSet

discard "forward decl of vtkCompositeDataIterator"
discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkAMRInformation"
discard "forward decl of vtkAMRDataInternals"
type
  vtkUniformGridAMR* {.importcpp: "vtkUniformGridAMR",
                      header: "vtkUniformGridAMR.h", bycopy.} = object of vtkCompositeDataSet
    vtkUniformGridAMR* {.importc: "vtkUniformGridAMR".}: VTK_NEWINSTANCE
    vtkCompositeDataIterator* {.importc: "vtkCompositeDataIterator".}: VTK_NEWINSTANCE
    ## *
    ##  Get the meta AMR meta data
    ##
    ## /@{
    ## *
    ##  Get/Set the meta AMR meta info
    ##


proc New*(): ptr vtkUniformGridAMR {.importcpp: "vtkUniformGridAMR::New(@)",
                                 header: "vtkUniformGridAMR.h".}
type
  vtkUniformGridAMRSuperclass* = vtkCompositeDataSet

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUniformGridAMR::IsTypeOf(@)", header: "vtkUniformGridAMR.h".}
proc IsA*(this: var vtkUniformGridAMR; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUniformGridAMR.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUniformGridAMR {.
    importcpp: "vtkUniformGridAMR::SafeDownCast(@)", header: "vtkUniformGridAMR.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUniformGridAMR :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositeDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUniformGridAMR :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUniformGridAMR :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUniformGridAMR; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUniformGridAMR.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc GetDataObjectType*(this: var vtkUniformGridAMR): cint {.
    importcpp: "GetDataObjectType", header: "vtkUniformGridAMR.h".}
proc Initialize*(this: var vtkUniformGridAMR) {.importcpp: "Initialize",
    header: "vtkUniformGridAMR.h".}
proc Initialize*(this: var vtkUniformGridAMR; numLevels: cint;
                blocksPerLevel: ptr cint) {.importcpp: "Initialize",
    header: "vtkUniformGridAMR.h".}
proc SetGridDescription*(this: var vtkUniformGridAMR; gridDescription: cint) {.
    importcpp: "SetGridDescription", header: "vtkUniformGridAMR.h".}
proc GetGridDescription*(this: var vtkUniformGridAMR): cint {.
    importcpp: "GetGridDescription", header: "vtkUniformGridAMR.h".}
proc GetNumberOfLevels*(this: var vtkUniformGridAMR): cuint {.
    importcpp: "GetNumberOfLevels", header: "vtkUniformGridAMR.h".}
proc GetTotalNumberOfBlocks*(this: var vtkUniformGridAMR): cuint {.
    importcpp: "GetTotalNumberOfBlocks", header: "vtkUniformGridAMR.h".}
proc GetNumberOfDataSets*(this: var vtkUniformGridAMR; level: cuint): cuint {.
    importcpp: "GetNumberOfDataSets", header: "vtkUniformGridAMR.h".}
proc GetBounds*(this: var vtkUniformGridAMR; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkUniformGridAMR.h".}
proc GetBounds*(this: var vtkUniformGridAMR): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkUniformGridAMR.h".}
proc GetMin*(this: var vtkUniformGridAMR; min: array[3, cdouble]) {.
    importcpp: "GetMin", header: "vtkUniformGridAMR.h".}
proc GetMax*(this: var vtkUniformGridAMR; max: array[3, cdouble]) {.
    importcpp: "GetMax", header: "vtkUniformGridAMR.h".}
proc SetDataSet*(this: var vtkUniformGridAMR; iter: ptr vtkCompositeDataIterator;
                dataObj: ptr vtkDataObject) {.importcpp: "SetDataSet",
    header: "vtkUniformGridAMR.h".}
proc SetDataSet*(this: var vtkUniformGridAMR; level: cuint; idx: cuint;
                grid: ptr vtkUniformGrid) {.importcpp: "SetDataSet",
    header: "vtkUniformGridAMR.h".}
## using statement

proc GetDataSet*(this: var vtkUniformGridAMR; iter: ptr vtkCompositeDataIterator): ptr vtkDataObject {.
    importcpp: "GetDataSet", header: "vtkUniformGridAMR.h".}
proc GetDataSet*(this: var vtkUniformGridAMR; level: cuint; idx: cuint): ptr vtkUniformGrid {.
    importcpp: "GetDataSet", header: "vtkUniformGridAMR.h".}
proc GetCompositeIndex*(this: var vtkUniformGridAMR; level: cuint; index: cuint): cint {.
    importcpp: "GetCompositeIndex", header: "vtkUniformGridAMR.h".}
proc GetLevelAndIndex*(this: var vtkUniformGridAMR; compositeIdx: cuint;
                      level: var cuint; idx: var cuint) {.
    importcpp: "GetLevelAndIndex", header: "vtkUniformGridAMR.h".}
proc ShallowCopy*(this: var vtkUniformGridAMR; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkUniformGridAMR.h".}
proc RecursiveShallowCopy*(this: var vtkUniformGridAMR; src: ptr vtkDataObject) {.
    importcpp: "RecursiveShallowCopy", header: "vtkUniformGridAMR.h".}
proc DeepCopy*(this: var vtkUniformGridAMR; src: ptr vtkDataObject) {.
    importcpp: "DeepCopy", header: "vtkUniformGridAMR.h".}
proc CopyStructure*(this: var vtkUniformGridAMR; src: ptr vtkCompositeDataSet) {.
    importcpp: "CopyStructure", header: "vtkUniformGridAMR.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkUniformGridAMR {.
    importcpp: "vtkUniformGridAMR::GetData(@)", header: "vtkUniformGridAMR.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkUniformGridAMR {.
    importcpp: "vtkUniformGridAMR::GetData(@)", header: "vtkUniformGridAMR.h".}