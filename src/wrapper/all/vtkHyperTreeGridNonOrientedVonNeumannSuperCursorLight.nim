## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright Nonice for more information.
##
## =========================================================================
## *
##  @class   vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight
##  @brief   Objects for traversal a HyperTreeGrid.
##
##  JB A REVOIR
##  Objects that can perform depth traversal of a hyper tree grid,
##  take into account more parameters (related to the grid structure) than
##  the compact hyper tree cursor implemented in vtkHyperTree can.
##  This is an abstract class.
##  Cursors are created by the HyperTreeGrid implementation.
##
##  @sa
##  vtkHyperTreeCursor vtkHyperTree vtkHyperTreeGrid
##
##  @par Thanks:
##  This class was written by Guenole Harel and Jacques-Bernard Lekien, 2014.
##  This class was re-written by Philippe Pebay, 2016.
##  This class was re-written and optimized by Jacques-Bernard Lekien,
##  Guenole Harel and Jerome Dubois, 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight_h [NewLine] # vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight_h [NewLine] # vtkHyperTreeGridNonOrientedSuperCursorLight.h [NewLine] class vtkHyperTreeGrid ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight : public vtkHyperTreeGridNonOrientedSuperCursorLight { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridNonOrientedSuperCursorLight Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridNonOrientedSuperCursorLight :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight :: IsTypeOf ( type ) ; } static vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight * NewInstance ( ) const { return vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridNonOrientedSuperCursorLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight * New ( ) ; *
##  Initialize cursor at root of given tree index in grid.
##  JB Le create ne s'applique que sur le HT central.
##  void Initialize ( vtkHyperTreeGrid * grid , vtkIdType treeIndex , bool create = false ) override ; protected : *
##  Constructor
##  vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight ( ) = default ; *
##  Destructor
##  ~ vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight ( ) override ; private : vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight ( const vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight & ) = delete ; void operator = ( const vtkHyperTreeGridNonOrientedVonNeumannSuperCursorLight & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
