## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAMRInformation.h
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
##  @class   vtkAMRInformation
##  @brief   Meta data that describes the structure of an AMR data set
##
##
##  vtkAMRInformation encapsulates the following meta information for an AMR data set
##  - a list of vtkAMRBox objects
##  - Refinement ratio between AMR levels
##  - Grid spacing for each level
##  - The file block index for each block
##  - parent child information, if requested
##
##  @sa
##  vtkOverlappingAMR, vtkAMRBox
##

import
  vtkAMRBox, vtkCommonDataModelModule, vtkObject, vtkSmartPointer

type
  vtkAMRBoxList* = vector[vtkAMRBox]

discard "forward decl of vtkUnsignedIntArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkAMRIndexIterator"
type
  vtkAMRInformation* {.importcpp: "vtkAMRInformation",
                      header: "vtkAMRInformation.h", bycopy.} = object of vtkObject
    vtkAMRInformation* {.importc: "vtkAMRInformation".}: VTK_NEWINSTANCE
    ##  example: VTK_XYZ_GRID
    ##  the origin of the whole data set
    ##  vtkAMRBoxes, one per data set
    ##  NumBlocks[i] stores the total number of blocks from level 0 to level i-1
    ##  Typically, this maps to a file block index used by the reader
    ##  The grid spacing for all levels
    ##  the bounds of the entire domain
    ## -------------------------------------------------------------------------
    ##  Auxiliary information that be computed
    ## -------------------------------------------------------------------------
    ##  refinement ratio between two adjacent levels
    ##  only necessary if need to call
    ##  ComputeIndexPair
    ##  parent child information


proc New*(): ptr vtkAMRInformation {.importcpp: "vtkAMRInformation::New(@)",
                                 header: "vtkAMRInformation.h".}
type
  vtkAMRInformationSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAMRInformation::IsTypeOf(@)", header: "vtkAMRInformation.h".}
proc IsA*(this: var vtkAMRInformation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAMRInformation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAMRInformation {.
    importcpp: "vtkAMRInformation::SafeDownCast(@)", header: "vtkAMRInformation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAMRInformation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRInformation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRInformation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAMRInformation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAMRInformation.h".}
proc `==`*(this: var vtkAMRInformation; other: vtkAMRInformation): bool {.
    importcpp: "(# == #)", header: "vtkAMRInformation.h".}
proc Initialize*(this: var vtkAMRInformation; numLevels: cint;
                blocksPerLevel: ptr cint) {.importcpp: "Initialize",
    header: "vtkAMRInformation.h".}
## !!!Ignored construct:  /@{ *
##  returns the value of vtkUniformGrid::GridDescription() of any block
##  virtual int GetGridDescriptionGridDescription ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GridDescription  of  << this -> GridDescription ) ; return this -> GridDescription ; } ;
## Error: expected ';'!!!

proc SetGridDescription*(this: var vtkAMRInformation; description: cint) {.
    importcpp: "SetGridDescription", header: "vtkAMRInformation.h".}
proc GetOrigin*(this: var vtkAMRInformation; origin: array[3, cdouble]) {.
    importcpp: "GetOrigin", header: "vtkAMRInformation.h".}
proc GetOrigin*(this: var vtkAMRInformation): ptr cdouble {.importcpp: "GetOrigin",
    header: "vtkAMRInformation.h".}
proc SetOrigin*(this: var vtkAMRInformation; origin: ptr cdouble) {.
    importcpp: "SetOrigin", header: "vtkAMRInformation.h".}
proc GetNumberOfLevels*(this: vtkAMRInformation): cuint {.noSideEffect,
    importcpp: "GetNumberOfLevels", header: "vtkAMRInformation.h".}
proc GetNumberOfDataSets*(this: vtkAMRInformation; level: cuint): cuint {.
    noSideEffect, importcpp: "GetNumberOfDataSets", header: "vtkAMRInformation.h".}
proc GetTotalNumberOfBlocks*(this: var vtkAMRInformation): cuint {.
    importcpp: "GetTotalNumberOfBlocks", header: "vtkAMRInformation.h".}
proc GetIndex*(this: vtkAMRInformation; level: cuint; id: cuint): cint {.noSideEffect,
    importcpp: "GetIndex", header: "vtkAMRInformation.h".}
proc ComputeIndexPair*(this: var vtkAMRInformation; index: cuint; level: var cuint;
                      id: var cuint) {.importcpp: "ComputeIndexPair",
                                    header: "vtkAMRInformation.h".}
proc GetBounds*(this: var vtkAMRInformation): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkAMRInformation.h".}
proc GetBounds*(this: var vtkAMRInformation; level: cuint; id: cuint; bb: ptr cdouble) {.
    importcpp: "GetBounds", header: "vtkAMRInformation.h".}
proc GetOrigin*(this: var vtkAMRInformation; level: cuint; id: cuint;
               origin: ptr cdouble): bool {.importcpp: "GetOrigin",
                                        header: "vtkAMRInformation.h".}
proc GetSpacing*(this: var vtkAMRInformation; level: cuint; spacing: array[3, cdouble]) {.
    importcpp: "GetSpacing", header: "vtkAMRInformation.h".}
proc HasSpacing*(this: var vtkAMRInformation; level: cuint): bool {.
    importcpp: "HasSpacing", header: "vtkAMRInformation.h".}
proc SetAMRBox*(this: var vtkAMRInformation; level: cuint; id: cuint; box: vtkAMRBox) {.
    importcpp: "SetAMRBox", header: "vtkAMRInformation.h".}
proc GetAMRBox*(this: vtkAMRInformation; level: cuint; id: cuint): vtkAMRBox {.
    noSideEffect, importcpp: "GetAMRBox", header: "vtkAMRInformation.h".}
proc GetCoarsenedAMRBox*(this: vtkAMRInformation; level: cuint; id: cuint;
                        box: var vtkAMRBox): bool {.noSideEffect,
    importcpp: "GetCoarsenedAMRBox", header: "vtkAMRInformation.h".}
proc GetAMRBlockSourceIndex*(this: var vtkAMRInformation; index: cint): cint {.
    importcpp: "GetAMRBlockSourceIndex", header: "vtkAMRInformation.h".}
proc SetAMRBlockSourceIndex*(this: var vtkAMRInformation; index: cint; sourceId: cint) {.
    importcpp: "SetAMRBlockSourceIndex", header: "vtkAMRInformation.h".}
proc GenerateRefinementRatio*(this: var vtkAMRInformation) {.
    importcpp: "GenerateRefinementRatio", header: "vtkAMRInformation.h".}
proc HasRefinementRatio*(this: var vtkAMRInformation): bool {.
    importcpp: "HasRefinementRatio", header: "vtkAMRInformation.h".}
proc SetRefinementRatio*(this: var vtkAMRInformation; level: cuint; ratio: cint) {.
    importcpp: "SetRefinementRatio", header: "vtkAMRInformation.h".}
proc GetRefinementRatio*(this: vtkAMRInformation; level: cuint): cint {.noSideEffect,
    importcpp: "GetRefinementRatio", header: "vtkAMRInformation.h".}
proc SetSpacing*(this: var vtkAMRInformation; level: cuint; h: ptr cdouble) {.
    importcpp: "SetSpacing", header: "vtkAMRInformation.h".}
proc HasChildrenInformation*(this: var vtkAMRInformation): bool {.
    importcpp: "HasChildrenInformation", header: "vtkAMRInformation.h".}
proc GetParents*(this: var vtkAMRInformation; level: cuint; index: cuint;
                numParents: var cuint): ptr cuint {.importcpp: "GetParents",
    header: "vtkAMRInformation.h".}
proc GetChildren*(this: var vtkAMRInformation; level: cuint; index: cuint;
                 numChildren: var cuint): ptr cuint {.importcpp: "GetChildren",
    header: "vtkAMRInformation.h".}
proc PrintParentChildInfo*(this: var vtkAMRInformation; level: cuint; index: cuint) {.
    importcpp: "PrintParentChildInfo", header: "vtkAMRInformation.h".}
proc GenerateParentChildInformation*(this: var vtkAMRInformation) {.
    importcpp: "GenerateParentChildInformation", header: "vtkAMRInformation.h".}
proc Audit*(this: var vtkAMRInformation): bool {.importcpp: "Audit",
    header: "vtkAMRInformation.h".}
proc FindCell*(this: var vtkAMRInformation; q: array[3, cdouble]; level: cuint;
              index: cuint; cellIdx: var cint): bool {.importcpp: "FindCell",
    header: "vtkAMRInformation.h".}
proc FindGrid*(this: var vtkAMRInformation; q: array[3, cdouble]; level: cint;
              gridId: var cuint): bool {.importcpp: "FindGrid",
                                     header: "vtkAMRInformation.h".}
proc FindGrid*(this: var vtkAMRInformation; q: array[3, cdouble]; level: var cuint;
              gridId: var cuint): bool {.importcpp: "FindGrid",
                                     header: "vtkAMRInformation.h".}
proc GetNumBlocks*(this: vtkAMRInformation): vector[cint] {.noSideEffect,
    importcpp: "GetNumBlocks", header: "vtkAMRInformation.h".}
proc GetChildrenAtLevel*(this: var vtkAMRInformation; i: cuint): var vector[
    vector[cuint]] {.importcpp: "GetChildrenAtLevel", header: "vtkAMRInformation.h".}
proc DeepCopy*(this: var vtkAMRInformation; other: ptr vtkAMRInformation) {.
    importcpp: "DeepCopy", header: "vtkAMRInformation.h".}
## !!!Ignored construct:  std :: vector < std :: vector < std :: vector < unsigned int >> > AllChildren ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  std :: vector < std :: vector < std :: vector < unsigned int >> > AllParents ;
## Error: identifier expected, but got: <!!!
