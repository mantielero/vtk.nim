## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMergeTimeFilter.h
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
##  @class   vtkMergeTimeFilter
##  @brief   Create a multiblock containing one block per input, with unified timestep list.
##
##  vtkMergeTimeFilter takes multiple temporal datasets as input and synchronize them.
##
##  The output data is a multiblock dataset containing one block per input dataset.
##  The output timesteps is the union (or the intersection) of each input timestep lists.
##  Duplicates time values are removed, dependending on a tolerance, either absolute or relative.
##
##  When source time is exactly 0., absolute tolerance is used even in relative mode.
##
##  Note that the actual merge of timesteps is done duing the RequestInformation pass.
##  In the 'Relative' mode, inputs are processed in order and compararison is done with
##  previously processed inputs.
##

import
  vtkFiltersGeneralModule, vtkMultiBlockDataSetAlgorithm

type
  vtkMergeTimeFilter* {.importcpp: "vtkMergeTimeFilter",
                       header: "vtkMergeTimeFilter.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkMergeTimeFilter* {.importc: "vtkMergeTimeFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMergeTimeFilter {.importcpp: "vtkMergeTimeFilter::New(@)",
                                  header: "vtkMergeTimeFilter.h".}
type
  vtkMergeTimeFilterSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMergeTimeFilter::IsTypeOf(@)", header: "vtkMergeTimeFilter.h".}
proc IsA*(this: var vtkMergeTimeFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMergeTimeFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMergeTimeFilter {.
    importcpp: "vtkMergeTimeFilter::SafeDownCast(@)",
    header: "vtkMergeTimeFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMergeTimeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMergeTimeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMergeTimeFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMergeTimeFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMergeTimeFilter.h".}
proc SetTolerance*(this: var vtkMergeTimeFilter; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkMergeTimeFilter.h".}
proc GetToleranceMinValue*(this: var vtkMergeTimeFilter): cdouble {.
    importcpp: "GetToleranceMinValue", header: "vtkMergeTimeFilter.h".}
proc GetToleranceMaxValue*(this: var vtkMergeTimeFilter): cdouble {.
    importcpp: "GetToleranceMaxValue", header: "vtkMergeTimeFilter.h".}
## !!!Ignored construct:  virtual double GetTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetUseRelativeTolerance*(this: var vtkMergeTimeFilter; _arg: bool) {.
    importcpp: "SetUseRelativeTolerance", header: "vtkMergeTimeFilter.h".}
## !!!Ignored construct:  virtual bool GetToleranceUseRelativeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseRelativeTolerance  of  << this -> UseRelativeTolerance ) ; return this -> UseRelativeTolerance ; } ;
## Error: expected ';'!!!

proc UseRelativeToleranceOn*(this: var vtkMergeTimeFilter) {.
    importcpp: "UseRelativeToleranceOn", header: "vtkMergeTimeFilter.h".}
proc UseRelativeToleranceOff*(this: var vtkMergeTimeFilter) {.
    importcpp: "UseRelativeToleranceOff", header: "vtkMergeTimeFilter.h".}
  ## @}
  ## @{
  ## *
  ##  Set/Get if the merge use intersection instead of union.
  ##  Default is false (union is used).
  ##
proc SetUseRelativeToleranceUseIntersection*(this: var vtkMergeTimeFilter;
    _arg: bool) {.importcpp: "SetUseRelativeToleranceUseIntersection",
                header: "vtkMergeTimeFilter.h".}
## !!!Ignored construct:  virtual bool GetToleranceUseRelativeToleranceUseIntersection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseIntersection  of  << this -> UseIntersection ) ; return this -> UseIntersection ; } ;
## Error: expected ';'!!!

proc UseIntersectionOn*(this: var vtkMergeTimeFilter) {.
    importcpp: "UseIntersectionOn", header: "vtkMergeTimeFilter.h".}
proc UseIntersectionOff*(this: var vtkMergeTimeFilter) {.
    importcpp: "UseIntersectionOff", header: "vtkMergeTimeFilter.h".}
  ## @}