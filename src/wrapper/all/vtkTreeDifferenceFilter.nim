## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTreeDifferenceFilter.h
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
##  @class   vtkTreeDifferenceFilter
##  @brief   compare two trees
##
##
##  vtkTreeDifferenceFilter compares two trees by analyzing a vtkDoubleArray.
##  Each tree must have a copy of this array.  A user of this filter should
##  call SetComparisonArrayName to specify the array that should be used as
##  the basis of coparison.  This array can either be part of the trees'
##  EdgeData or VertexData.
##
##

import
  vtkGraphAlgorithm, vtkInfovisCoreModule, vtkSmartPointer

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkTree"
type
  vtkTreeDifferenceFilter* {.importcpp: "vtkTreeDifferenceFilter",
                            header: "vtkTreeDifferenceFilter.h", bycopy.} = object of vtkGraphAlgorithm
    vtkTreeDifferenceFilter* {.importc: "vtkTreeDifferenceFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTreeDifferenceFilter {.importcpp: "vtkTreeDifferenceFilter::New(@)",
                                       header: "vtkTreeDifferenceFilter.h".}
type
  vtkTreeDifferenceFilterSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTreeDifferenceFilter::IsTypeOf(@)",
    header: "vtkTreeDifferenceFilter.h".}
proc IsA*(this: var vtkTreeDifferenceFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTreeDifferenceFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTreeDifferenceFilter {.
    importcpp: "vtkTreeDifferenceFilter::SafeDownCast(@)",
    header: "vtkTreeDifferenceFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTreeDifferenceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTreeDifferenceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTreeDifferenceFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTreeDifferenceFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTreeDifferenceFilter.h".}
proc SetIdArrayName*(this: var vtkTreeDifferenceFilter; _arg: cstring) {.
    importcpp: "SetIdArrayName", header: "vtkTreeDifferenceFilter.h".}
proc GetIdArrayName*(this: var vtkTreeDifferenceFilter): cstring {.
    importcpp: "GetIdArrayName", header: "vtkTreeDifferenceFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the name of the array that we're comparing between the two trees.
  ##  The named array must be a vtkDoubleArray.
  ##
proc SetIdArrayNameComparisonArrayName*(this: var vtkTreeDifferenceFilter;
                                       _arg: cstring) {.
    importcpp: "SetIdArrayNameComparisonArrayName",
    header: "vtkTreeDifferenceFilter.h".}
proc GetIdArrayNameComparisonArrayName*(this: var vtkTreeDifferenceFilter): cstring {.
    importcpp: "GetIdArrayNameComparisonArrayName",
    header: "vtkTreeDifferenceFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the name of a new vtkDoubleArray that will contain the results of
  ##  the comparison between the two trees.  This new array will be added to
  ##  the input tree's VertexData or EdgeData, based on the value of
  ##  ComparisonArrayIsVertexData.  If this method is not called, the new
  ##  vtkDoubleArray will be named "difference" by default.
  ##
proc SetIdArrayNameComparisonArrayNameOutputArrayName*(
    this: var vtkTreeDifferenceFilter; _arg: cstring) {.
    importcpp: "SetIdArrayNameComparisonArrayNameOutputArrayName",
    header: "vtkTreeDifferenceFilter.h".}
proc GetIdArrayNameComparisonArrayNameOutputArrayName*(
    this: var vtkTreeDifferenceFilter): cstring {.
    importcpp: "GetIdArrayNameComparisonArrayNameOutputArrayName",
    header: "vtkTreeDifferenceFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify whether the comparison array is within the trees' vertex data or
  ##  not.  By default, we assume that the array to compare is within the trees'
  ##  EdgeData().
  ##
proc SetComparisonArrayIsVertexData*(this: var vtkTreeDifferenceFilter; _arg: bool) {.
    importcpp: "SetComparisonArrayIsVertexData",
    header: "vtkTreeDifferenceFilter.h".}
## !!!Ignored construct:  virtual bool GetComparisonArrayIsVertexData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComparisonArrayIsVertexData  of  << this -> ComparisonArrayIsVertexData ) ; return this -> ComparisonArrayIsVertexData ; } ;
## Error: expected ';'!!!
