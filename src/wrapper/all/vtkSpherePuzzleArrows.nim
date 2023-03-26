## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSpherePuzzleArrows.h
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
##  @class   vtkSpherePuzzleArrows
##  @brief   Visualize permutation of the sphere puzzle.
##
##  vtkSpherePuzzleArrows creates
##

import
  vtkFiltersModelingModule, vtkPolyDataAlgorithm

discard "forward decl of vtkCellArray"
discard "forward decl of vtkPoints"
discard "forward decl of vtkSpherePuzzle"
type
  vtkSpherePuzzleArrows* {.importcpp: "vtkSpherePuzzleArrows",
                          header: "vtkSpherePuzzleArrows.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkSpherePuzzleArrows* {.importc: "vtkSpherePuzzleArrows".}: VTK_NEWINSTANCE

  vtkSpherePuzzleArrowsSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSpherePuzzleArrows::IsTypeOf(@)",
    header: "vtkSpherePuzzleArrows.h".}
proc IsA*(this: var vtkSpherePuzzleArrows; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSpherePuzzleArrows.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSpherePuzzleArrows {.
    importcpp: "vtkSpherePuzzleArrows::SafeDownCast(@)",
    header: "vtkSpherePuzzleArrows.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSpherePuzzleArrows :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSpherePuzzleArrows :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSpherePuzzleArrows :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSpherePuzzleArrows; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSpherePuzzleArrows.h".}
proc New*(): ptr vtkSpherePuzzleArrows {.importcpp: "vtkSpherePuzzleArrows::New(@)",
                                     header: "vtkSpherePuzzleArrows.h".}
proc SetPermutation*(this: var vtkSpherePuzzleArrows; data: ptr cint) {.
    importcpp: "SetPermutation", header: "vtkSpherePuzzleArrows.h".}
## !!!Ignored construct:  virtual int * GetPermutation ( ) VTK_SIZEHINT ( 32 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Permutation  pointer  << this -> Permutation ) ; return this -> Permutation ; } VTK_WRAPEXCLUDE virtual void GetPermutation ( int data [ 32 ] ) { for ( int i = 0 ; i < 32 ; i ++ ) { data [ i ] = this -> Permutation [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPermutationComponent*(this: var vtkSpherePuzzleArrows; comp: cint; val: cint) {.
    importcpp: "SetPermutationComponent", header: "vtkSpherePuzzleArrows.h".}
proc SetPermutation*(this: var vtkSpherePuzzleArrows; puz: ptr vtkSpherePuzzle) {.
    importcpp: "SetPermutation", header: "vtkSpherePuzzleArrows.h".}