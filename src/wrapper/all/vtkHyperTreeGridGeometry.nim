## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridGeometry.h
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
##  @class   vtkHyperTreeGridGeometry
##  @brief   Hyper tree grid outer surface
##
##  @sa
##  vtkHyperTreeGrid vtkHyperTreeGridAlgorithm
##
##  @par Thanks:
##  This class was written by Philippe Pebay, Joachim Pouderoux, and Charles Law, Kitware 2013
##  This class was modified by Guenole Harel and Jacques-Bernard Lekien, 2014
##  This class was rewritten by Philippe Pebay, 2016
##  This class was modified by Jacques-Bernard Lekien and Guenole Harel, 2018
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersHyperTreeModule, vtkHyperTreeGridAlgorithm

discard "forward decl of vtkBitArray"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkHyperTreeGridNonOrientedGeometryCursor"
discard "forward decl of vtkHyperTreeGridNonOrientedVonNeumannSuperCursor"
discard "forward decl of vtkIdList"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPoints"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkHyperTreeGridGeometry* {.importcpp: "vtkHyperTreeGridGeometry",
                             header: "vtkHyperTreeGridGeometry.h", bycopy.} = object of vtkHyperTreeGridAlgorithm
    vtkHyperTreeGridGeometry* {.importc: "vtkHyperTreeGridGeometry".}: VTK_NEWINSTANCE
    ## *
    ##  Pure Material Mask
    ##
    ## *
    ##  Dimension of input grid
    ##
    ## *
    ##  Orientation of input grid when dimension < 3
    ##
    ## *
    ##  Branch Factor
    ##
    ## *
    ##  Storage for points of output unstructured mesh
    ##
    ## *
    ##  Storage for cells of output unstructured mesh
    ##
    ## *
    ## JB Un locator est utilise afin de produire un maillage avec moins
    ## JB de points. Le gain en 3D est de l'ordre d'un facteur 4 !
    ##
    ##  JB A RECUPERER DANS LE .H VTK9
    ## *
    ##  Array used to hide edges
    ##  left by masked cells.
    ##


proc New*(): ptr vtkHyperTreeGridGeometry {.importcpp: "vtkHyperTreeGridGeometry::New(@)",
                                        header: "vtkHyperTreeGridGeometry.h".}
type
  vtkHyperTreeGridGeometrySuperclass* = vtkHyperTreeGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHyperTreeGridGeometry::IsTypeOf(@)",
    header: "vtkHyperTreeGridGeometry.h".}
proc IsA*(this: var vtkHyperTreeGridGeometry; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHyperTreeGridGeometry.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHyperTreeGridGeometry {.
    importcpp: "vtkHyperTreeGridGeometry::SafeDownCast(@)",
    header: "vtkHyperTreeGridGeometry.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHyperTreeGridGeometry :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridGeometry :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridGeometry :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHyperTreeGridGeometry; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHyperTreeGridGeometry.h".}
proc SetMerging*(this: var vtkHyperTreeGridGeometry; _arg: bool) {.
    importcpp: "SetMerging", header: "vtkHyperTreeGridGeometry.h".}
## !!!Ignored construct:  virtual bool GetMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Merging  of  << this -> Merging ) ; return this -> Merging ; } ;
## Error: expected ';'!!!
