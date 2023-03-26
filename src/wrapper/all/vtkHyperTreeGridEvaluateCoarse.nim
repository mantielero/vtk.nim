## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridEvaluateCoarse.h
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
##  @class   vtkHyperTreeGridEvaluateCoarse
##  @brief   The value of the parent cell is determined from an operation
##  defined on the values of the child cells.
##
##
##  vtkHyperTreeGridEvaluateCoarse is a filter that takes as input an hypertree
##  grid.
##  The value of the parent cell (coarse) is determined from an operation
##  defined on the values of the child cells (refined cell).
##
##  The predefined operators are :
##   - OPERATOR_DON_T_CHANGE_FAST:
##       Operator does not change coarse value (default), just shallow copy
##   - OPERATOR_DON_T_CHANGE:
##       Operator does not change coarse value but iterate over all cells,
##       just shallow copy
##   - OPERATOR_MIN:
##       The littlest value of the unmasked child cells
##   - OPERATOR_MAX:
##       The biggest value of the unmasked child cells
##   - OPERATOR_SUM:
##       The sum of the values of the unmasked child cells
##   - OPERATOR_AVERAGE:
##       The average of the values of the child cells. If the cell is masked
##       a value is put at "default value" (default value = 0 if not set
##       by SetDefault).
##   - OPERATOR_UNMASKED_AVERAGE:
##       The average of the values of the unmasked child cells
##   - OPERATOR_ELDER_CHILD:
##       Operator puts the value of the first child (elder child)
##   - OPERATOR_SPLATTING_AVERAGE:
##       The splatting average of the values of the child cells. If the cell
##       is masked a value is put at "default value" (default value = 0 if
##       not set by SetDefault).
##       The calculation of the average should normally be done by dividing by
##       the number of children (GetNumberOfChildren) which is worth f^d where
##       f, refinement factor and d, number of spatial dimension.
##       In the calculation of the mean for splatting, the division
##       involves f^(d-1).
##       In 3D, if a mesh is refined into 8 child cells each having a value
##       set to 0.5, all these children produce 4 splats of value 1. In fact,
##       the value of the expected splat at the coarse cell (parent) is 1.
##       But a standard average will give 0.5 (value / f^d). This is why
##       the calculation of the average for splatting is different
##       (value / f^(d-1)).
##
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien, 2016-18
##  This class was modified to take in account the field values with components
##  different of one, by Florent Denef, 2019
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersHyperTreeModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkBitArray"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedCursor"
type
  vtkHyperTreeGridEvaluateCoarse* {.importcpp: "vtkHyperTreeGridEvaluateCoarse",
                                   header: "vtkHyperTreeGridEvaluateCoarse.h",
                                   bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridEvaluateCoarse* {.importc: "vtkHyperTreeGridEvaluateCoarse".}: VTK_NEWINSTANCE


const
  vtkHyperTreeGridEvaluateCoarseOPERATOR_DON_T_CHANGE_FAST* = 0
  vtkHyperTreeGridEvaluateCoarseOPERATOR_DON_T_CHANGE* = 1
  vtkHyperTreeGridEvaluateCoarseOPERATOR_MIN* = 2
  vtkHyperTreeGridEvaluateCoarseOPERATOR_MAX* = 3
  vtkHyperTreeGridEvaluateCoarseOPERATOR_SUM* = 4
  vtkHyperTreeGridEvaluateCoarseOPERATOR_AVERAGE* = 5
  vtkHyperTreeGridEvaluateCoarseOPERATOR_UNMASKED_AVERAGE* = 6
  vtkHyperTreeGridEvaluateCoarseOPERATOR_ELDER_CHILD* = 7
  vtkHyperTreeGridEvaluateCoarseOPERATOR_SPLATTING_AVERAGE* = 8

proc New*(): ptr vtkHyperTreeGridEvaluateCoarse {.
    importcpp: "vtkHyperTreeGridEvaluateCoarse::New(@)",
    header: "vtkHyperTreeGridEvaluateCoarse.h".}
type
  vtkHyperTreeGridEvaluateCoarseSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridEvaluateCoarse::IsTypeOf(@)",
    header: "vtkHyperTreeGridEvaluateCoarse.h".}
proc IsA*(this: var vtkHyperTreeGridEvaluateCoarse; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridEvaluateCoarse.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridEvaluateCoarse {.
    importcpp: "vtkHyperTreeGridEvaluateCoarse::SafeDownCast(@)",
    header: "vtkHyperTreeGridEvaluateCoarse.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridEvaluateCoarse :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridEvaluateCoarse :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridEvaluateCoarse :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridEvaluateCoarse; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHyperTreeGridEvaluateCoarse.h".}
proc SetOperator*(this: var vtkHyperTreeGridEvaluateCoarse; _arg: cuint) {.
    importcpp: "SetOperator", header: "vtkHyperTreeGridEvaluateCoarse.h".}
## !!!Ignored construct:  virtual unsigned int GetOperator ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operator  of  << this -> Operator ) ; return this -> Operator ; } ;
## Error: expected ';'!!!

proc SetOperatorDefault*(this: var vtkHyperTreeGridEvaluateCoarse; _arg: cdouble) {.
    importcpp: "SetOperatorDefault", header: "vtkHyperTreeGridEvaluateCoarse.h".}
  ## /@}