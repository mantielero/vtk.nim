## =========================================================================
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalBoxDataSet.h
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
##  @class   vtkHierarchicalBoxDataSet
##  @brief   Backwards compatibility class
##
##
##  An empty class for backwards compatibility
##
##  @sa
##  vtkUniformGridAM vtkOverlappingAMR vtkNonOverlappingAMR
##

import
  vtkCommonDataModelModule, vtkOverlappingAMR

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
type
  vtkHierarchicalBoxDataSet* {.importcpp: "vtkHierarchicalBoxDataSet",
                              header: "vtkHierarchicalBoxDataSet.h", bycopy.} = object of vtkOverlappingAMR
    vtkHierarchicalBoxDataSet* {.importc: "vtkHierarchicalBoxDataSet".}: VTK_NEWINSTANCE
    vtkCompositeDataIterator* {.importc: "vtkCompositeDataIterator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkHierarchicalBoxDataSet {.
    importcpp: "vtkHierarchicalBoxDataSet::New(@)",
    header: "vtkHierarchicalBoxDataSet.h".}
type
  vtkHierarchicalBoxDataSetSuperclass* = vtkOverlappingAMR

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHierarchicalBoxDataSet::IsTypeOf(@)",
    header: "vtkHierarchicalBoxDataSet.h".}
proc IsA*(this: var vtkHierarchicalBoxDataSet; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHierarchicalBoxDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHierarchicalBoxDataSet {.
    importcpp: "vtkHierarchicalBoxDataSet::SafeDownCast(@)",
    header: "vtkHierarchicalBoxDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHierarchicalBoxDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOverlappingAMR :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalBoxDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalBoxDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHierarchicalBoxDataSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHierarchicalBoxDataSet.h".}
## !!!Ignored construct:  * NewIterator ( ) override ;
## Error: identifier expected, but got: *!!!

proc GetDataObjectType*(this: var vtkHierarchicalBoxDataSet): cint {.
    importcpp: "GetDataObjectType", header: "vtkHierarchicalBoxDataSet.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkHierarchicalBoxDataSet {.
    importcpp: "vtkHierarchicalBoxDataSet::GetData(@)",
    header: "vtkHierarchicalBoxDataSet.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkHierarchicalBoxDataSet {.
    importcpp: "vtkHierarchicalBoxDataSet::GetData(@)",
    header: "vtkHierarchicalBoxDataSet.h".}