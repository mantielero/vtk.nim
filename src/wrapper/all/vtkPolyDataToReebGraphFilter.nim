## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataToReebGraphFilter.h
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
##  @class   vtkPolyDataToReebGraphFilter
##  @brief   generate a Reeb graph from a scalar
##  field defined on a vtkPolyData.
##
##  The filter will first try to pull as a scalar field the vtkDataArray with
##  Id 'fieldId' of the mesh's vtkPointData.
##  If this field does not exist, the filter will use the vtkElevationFilter to
##  generate a default scalar field.
##

import
  vtkDirectedGraphAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkReebGraph"
type
  vtkPolyDataToReebGraphFilter* {.importcpp: "vtkPolyDataToReebGraphFilter",
                                 header: "vtkPolyDataToReebGraphFilter.h", bycopy.} = object of vtkDirectedGraphAlgorithm
    vtkPolyDataToReebGraphFilter* {.importc: "vtkPolyDataToReebGraphFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataToReebGraphFilter {.
    importcpp: "vtkPolyDataToReebGraphFilter::New(@)",
    header: "vtkPolyDataToReebGraphFilter.h".}
type
  vtkPolyDataToReebGraphFilterSuperclass* = vtkDirectedGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataToReebGraphFilter::IsTypeOf(@)",
    header: "vtkPolyDataToReebGraphFilter.h".}
proc IsA*(this: var vtkPolyDataToReebGraphFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataToReebGraphFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataToReebGraphFilter {.
    importcpp: "vtkPolyDataToReebGraphFilter::SafeDownCast(@)",
    header: "vtkPolyDataToReebGraphFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataToReebGraphFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDirectedGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataToReebGraphFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataToReebGraphFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataToReebGraphFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPolyDataToReebGraphFilter.h".}
proc SetFieldId*(this: var vtkPolyDataToReebGraphFilter; _arg: cint) {.
    importcpp: "SetFieldId", header: "vtkPolyDataToReebGraphFilter.h".}
## !!!Ignored construct:  virtual int GetFieldId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldId  of  << this -> FieldId ) ; return this -> FieldId ; } ;
## Error: expected ';'!!!

proc GetOutput*(this: var vtkPolyDataToReebGraphFilter): ptr vtkReebGraph {.
    importcpp: "GetOutput", header: "vtkPolyDataToReebGraphFilter.h".}