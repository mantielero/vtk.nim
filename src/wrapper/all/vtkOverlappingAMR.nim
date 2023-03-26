## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOverlappingAMR.h
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
##  @class   vtkOverlappingAMR
##  @brief   hierarchical dataset of vtkUniformGrids
##
##
##  vtkOverlappingAMR extends vtkUniformGridAMR by exposing access to the
##  amr meta data, which stores all structural information represented
##  by an vtkAMRInformation object
##
##  @sa
##  vtkAMRInformation
##

import
  vtkCommonDataModelModule, vtkUniformGridAMR

discard "forward decl of vtkAMRBox"
discard "forward decl of vtkCompositeDataIterator"
discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkAMRInformation"
discard "forward decl of vtkInformationIdTypeKey"
type
  vtkOverlappingAMR* {.importcpp: "vtkOverlappingAMR",
                      header: "vtkOverlappingAMR.h", bycopy.} = object of vtkUniformGridAMR
    vtkOverlappingAMR* {.importc: "vtkOverlappingAMR".}: VTK_NEWINSTANCE
    vtkCompositeDataIterator* {.importc: "vtkCompositeDataIterator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOverlappingAMR {.importcpp: "vtkOverlappingAMR::New(@)",
                                 header: "vtkOverlappingAMR.h".}
proc GetDataObjectType*(this: var vtkOverlappingAMR): cint {.
    importcpp: "GetDataObjectType", header: "vtkOverlappingAMR.h".}
type
  vtkOverlappingAMRSuperclass* = vtkUniformGridAMR

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOverlappingAMR::IsTypeOf(@)", header: "vtkOverlappingAMR.h".}
proc IsA*(this: var vtkOverlappingAMR; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOverlappingAMR.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOverlappingAMR {.
    importcpp: "vtkOverlappingAMR::SafeDownCast(@)", header: "vtkOverlappingAMR.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOverlappingAMR :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUniformGridAMR :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOverlappingAMR :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOverlappingAMR :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOverlappingAMR; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOverlappingAMR.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc SetOrigin*(this: var vtkOverlappingAMR; origin: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkOverlappingAMR.h".}
proc GetOrigin*(this: var vtkOverlappingAMR): ptr cdouble {.importcpp: "GetOrigin",
    header: "vtkOverlappingAMR.h".}
proc SetSpacing*(this: var vtkOverlappingAMR; level: cuint; spacing: array[3, cdouble]) {.
    importcpp: "SetSpacing", header: "vtkOverlappingAMR.h".}
proc GetSpacing*(this: var vtkOverlappingAMR; level: cuint; spacing: array[3, cdouble]) {.
    importcpp: "GetSpacing", header: "vtkOverlappingAMR.h".}
proc SetAMRBox*(this: var vtkOverlappingAMR; level: cuint; id: cuint; box: vtkAMRBox) {.
    importcpp: "SetAMRBox", header: "vtkOverlappingAMR.h".}
proc GetAMRBox*(this: var vtkOverlappingAMR; level: cuint; id: cuint): vtkAMRBox {.
    importcpp: "GetAMRBox", header: "vtkOverlappingAMR.h".}
proc GetBounds*(this: var vtkOverlappingAMR; level: cuint; id: cuint;
               bb: array[6, cdouble]) {.importcpp: "GetBounds",
                                     header: "vtkOverlappingAMR.h".}
proc GetOrigin*(this: var vtkOverlappingAMR; level: cuint; id: cuint;
               origin: array[3, cdouble]) {.importcpp: "GetOrigin",
    header: "vtkOverlappingAMR.h".}
proc NUMBER_OF_BLANKED_POINTS*(): ptr vtkInformationIdTypeKey {.
    importcpp: "vtkOverlappingAMR::NUMBER_OF_BLANKED_POINTS(@)",
    header: "vtkOverlappingAMR.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkOverlappingAMR {.
    importcpp: "vtkOverlappingAMR::GetData(@)", header: "vtkOverlappingAMR.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkOverlappingAMR {.
    importcpp: "vtkOverlappingAMR::GetData(@)", header: "vtkOverlappingAMR.h".}
proc SetRefinementRatio*(this: var vtkOverlappingAMR; level: cuint; refRatio: cint) {.
    importcpp: "SetRefinementRatio", header: "vtkOverlappingAMR.h".}
proc GetRefinementRatio*(this: var vtkOverlappingAMR; level: cuint): cint {.
    importcpp: "GetRefinementRatio", header: "vtkOverlappingAMR.h".}
proc SetAMRBlockSourceIndex*(this: var vtkOverlappingAMR; level: cuint; id: cuint;
                            sourceId: cint) {.importcpp: "SetAMRBlockSourceIndex",
    header: "vtkOverlappingAMR.h".}
proc GetAMRBlockSourceIndex*(this: var vtkOverlappingAMR; level: cuint; id: cuint): cint {.
    importcpp: "GetAMRBlockSourceIndex", header: "vtkOverlappingAMR.h".}
proc GetRefinementRatio*(this: var vtkOverlappingAMR;
                        iter: ptr vtkCompositeDataIterator): cint {.
    importcpp: "GetRefinementRatio", header: "vtkOverlappingAMR.h".}
proc HasChildrenInformation*(this: var vtkOverlappingAMR): bool {.
    importcpp: "HasChildrenInformation", header: "vtkOverlappingAMR.h".}
proc GenerateParentChildInformation*(this: var vtkOverlappingAMR) {.
    importcpp: "GenerateParentChildInformation", header: "vtkOverlappingAMR.h".}
proc GetParents*(this: var vtkOverlappingAMR; level: cuint; index: cuint;
                numParents: var cuint): ptr cuint {.importcpp: "GetParents",
    header: "vtkOverlappingAMR.h".}
proc GetChildren*(this: var vtkOverlappingAMR; level: cuint; index: cuint;
                 numChildren: var cuint): ptr cuint {.importcpp: "GetChildren",
    header: "vtkOverlappingAMR.h".}
proc PrintParentChildInfo*(this: var vtkOverlappingAMR; level: cuint; index: cuint) {.
    importcpp: "PrintParentChildInfo", header: "vtkOverlappingAMR.h".}
proc GetBounds*(this: var vtkOverlappingAMR; b: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkOverlappingAMR.h".}
proc FindGrid*(this: var vtkOverlappingAMR; q: array[3, cdouble]; level: var cuint;
              gridId: var cuint): bool {.importcpp: "FindGrid",
                                     header: "vtkOverlappingAMR.h".}
proc GetAMRInfo*(this: var vtkOverlappingAMR): ptr vtkAMRInformation {.
    importcpp: "GetAMRInfo", header: "vtkOverlappingAMR.h".}
proc SetAMRInfo*(this: var vtkOverlappingAMR; info: ptr vtkAMRInformation) {.
    importcpp: "SetAMRInfo", header: "vtkOverlappingAMR.h".}
proc Audit*(this: var vtkOverlappingAMR) {.importcpp: "Audit",
                                       header: "vtkOverlappingAMR.h".}