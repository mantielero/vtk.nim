## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkObject.h
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
##  @class   vtkMatrixMathFilter
##  @brief   Calculate functions of quality of the elements
##   of a mesh
##
##
##  vtkMatrixMathFilter computes one or more functions of mathematical quality for the
##  cells or points in a mesh. The per-cell or per-point quality is added to the
##  mesh's cell data or point data, in an array with names varied with different
##  quality being queried. Note this filter always assume the data associate with
##  the cells or points are 3 by 3 matrix.
##

import
  vtkDataSetAlgorithm, vtkFiltersVerdictModule

discard "forward decl of vtkCell"
discard "forward decl of vtkDataArray"
type
  vtkMatrixMathFilter* {.importcpp: "vtkMatrixMathFilter",
                        header: "vtkMatrixMathFilter.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkMatrixMathFilter* {.importc: "vtkMatrixMathFilter".}: VTK_NEWINSTANCE


proc PrintSelf*(this: var vtkMatrixMathFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMatrixMathFilter.h".}
type
  vtkMatrixMathFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMatrixMathFilter::IsTypeOf(@)", header: "vtkMatrixMathFilter.h".}
proc IsA*(this: var vtkMatrixMathFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMatrixMathFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMatrixMathFilter {.
    importcpp: "vtkMatrixMathFilter::SafeDownCast(@)",
    header: "vtkMatrixMathFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMatrixMathFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMatrixMathFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMatrixMathFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkMatrixMathFilter {.importcpp: "vtkMatrixMathFilter::New(@)",
                                   header: "vtkMatrixMathFilter.h".}
proc SetOperation*(this: var vtkMatrixMathFilter; _arg: cint) {.
    importcpp: "SetOperation", header: "vtkMatrixMathFilter.h".}
## !!!Ignored construct:  virtual int GetOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operation  of  << this -> Operation ) ; return this -> Operation ; } ;
## Error: expected ';'!!!

proc SetOperationToDeterminant*(this: var vtkMatrixMathFilter) {.
    importcpp: "SetOperationToDeterminant", header: "vtkMatrixMathFilter.h".}
proc SetOperationToEigenvalue*(this: var vtkMatrixMathFilter) {.
    importcpp: "SetOperationToEigenvalue", header: "vtkMatrixMathFilter.h".}
proc SetOperationToEigenvector*(this: var vtkMatrixMathFilter) {.
    importcpp: "SetOperationToEigenvector", header: "vtkMatrixMathFilter.h".}
proc SetOperationToInverse*(this: var vtkMatrixMathFilter) {.
    importcpp: "SetOperationToInverse", header: "vtkMatrixMathFilter.h".}