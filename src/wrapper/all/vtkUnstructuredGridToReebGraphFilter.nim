## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridToReebGraphFilter.h
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
##  @class   vtkUnstructuredGridToReebGraphFilter
##  @brief   generate a Reeb graph from a
##  scalar field defined on a vtkUnstructuredGrid.
##
##  The filter will first try to pull as a scalar field the vtkDataArray with
##  Id 'fieldId' of the mesh's vtkPointData.
##  If this field does not exist, the filter will use the vtkElevationFilter to
##  generate a default scalar field.
##

import
  vtkDirectedGraphAlgorithm, vtkFiltersReebGraphModule

discard "forward decl of vtkReebGraph"
type
  vtkUnstructuredGridToReebGraphFilter* {.
      importcpp: "vtkUnstructuredGridToReebGraphFilter",
      header: "vtkUnstructuredGridToReebGraphFilter.h", bycopy.} = object of vtkDirectedGraphAlgorithm
    vtkUnstructuredGridToReebGraphFilter*
        {.importc: "vtkUnstructuredGridToReebGraphFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkUnstructuredGridToReebGraphFilter {.
    importcpp: "vtkUnstructuredGridToReebGraphFilter::New(@)",
    header: "vtkUnstructuredGridToReebGraphFilter.h".}
type
  vtkUnstructuredGridToReebGraphFilterSuperclass* = vtkDirectedGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridToReebGraphFilter::IsTypeOf(@)",
    header: "vtkUnstructuredGridToReebGraphFilter.h".}
proc IsA*(this: var vtkUnstructuredGridToReebGraphFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridToReebGraphFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridToReebGraphFilter {.
    importcpp: "vtkUnstructuredGridToReebGraphFilter::SafeDownCast(@)",
    header: "vtkUnstructuredGridToReebGraphFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridToReebGraphFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDirectedGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridToReebGraphFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridToReebGraphFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUnstructuredGridToReebGraphFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkUnstructuredGridToReebGraphFilter.h".}
proc SetFieldId*(this: var vtkUnstructuredGridToReebGraphFilter; _arg: cint) {.
    importcpp: "SetFieldId", header: "vtkUnstructuredGridToReebGraphFilter.h".}
## !!!Ignored construct:  virtual int GetFieldId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldId  of  << this -> FieldId ) ; return this -> FieldId ; } ;
## Error: expected ';'!!!

proc GetOutput*(this: var vtkUnstructuredGridToReebGraphFilter): ptr vtkReebGraph {.
    importcpp: "GetOutput", header: "vtkUnstructuredGridToReebGraphFilter.h".}