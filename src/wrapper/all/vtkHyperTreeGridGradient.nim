## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridGradient.h
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
##  @class   vtkHyperTreeGridGradient
##  @brief   Compute the gradient of a scalar field
##  on a Hyper Tree Grid.
##
##  This filter compute the gradient of a given cell scalars array on a
##  Hyper Tree Grid. This result in a new array attached to the original input.
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm vtkGradientFilter
##
##  @par Thanks:
##  This class was created by Charles Gueunet, 2022
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersHyperTreeModule, vtkHyperTreeGridAlgorithm, vtkNew, vtkSmartPointer

discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedMooreSuperCursor"
discard "forward decl of vtkBitArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkHyperTreeGridGradient* {.importcpp: "vtkHyperTreeGridGradient",
                             header: "vtkHyperTreeGridGradient.h", bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridGradient* {.importc: "vtkHyperTreeGridGradient".}: VTK_NEWINSTANCE
    ## *
    ##  Keep track of selected input scalars
    ##
    ## *
    ##  Computed gradient
    ##
    ##  shortcut to HTG fields


proc New*(): ptr vtkHyperTreeGridGradient {.importcpp: "vtkHyperTreeGridGradient::New(@)",
                                        header: "vtkHyperTreeGridGradient.h".}
type
  vtkHyperTreeGridGradientSuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridGradient::IsTypeOf(@)",
    header: "vtkHyperTreeGridGradient.h".}
proc IsA*(this: var vtkHyperTreeGridGradient; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridGradient.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridGradient {.
    importcpp: "vtkHyperTreeGridGradient::SafeDownCast(@)",
    header: "vtkHyperTreeGridGradient.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridGradient :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridGradient :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridGradient :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridGradient; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHyperTreeGridGradient.h".}
proc SetResultArrayName*(this: var vtkHyperTreeGridGradient; _arg: string) {.
    importcpp: "SetResultArrayName", header: "vtkHyperTreeGridGradient.h".}
## !!!Ignored construct:  virtual std :: string GetResultArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ResultArrayName  of  << this -> ResultArrayName ) ; return this -> ResultArrayName ; } ;
## Error: expected ';'!!!
