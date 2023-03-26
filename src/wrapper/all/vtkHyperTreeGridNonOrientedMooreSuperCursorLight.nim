## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridNonOrientedMooreSuperCursorLight.h
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
##  @class   vtkHyperTreeGridNonOrientedMooreSuperCursorLight
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

## !!!Ignored construct:  # vtkHyperTreeGridNonOrientedMooreSuperCursorLight_h [NewLine] # vtkHyperTreeGridNonOrientedMooreSuperCursorLight_h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] # vtkHyperTreeGridNonOrientedSuperCursorLight.h [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTree"
discard "forward decl of vtkHyperTreeGrid"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHyperTreeGridNonOrientedMooreSuperCursorLight : public vtkHyperTreeGridNonOrientedSuperCursorLight { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHyperTreeGridNonOrientedSuperCursorLight Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHyperTreeGridNonOrientedSuperCursorLight :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedMooreSuperCursorLight :: IsTypeOf ( type ) ; } static vtkHyperTreeGridNonOrientedMooreSuperCursorLight * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridNonOrientedMooreSuperCursorLight * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridNonOrientedMooreSuperCursorLight * NewInstance ( ) const { return vtkHyperTreeGridNonOrientedMooreSuperCursorLight :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridNonOrientedSuperCursorLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridNonOrientedMooreSuperCursorLight :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridNonOrientedMooreSuperCursorLight :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkHyperTreeGridNonOrientedMooreSuperCursorLight * New ( ) ; *
##  Initialize cursor at root of given tree index in grid.
##  JB Le create ne s'applique que sur le HT central.
##  void Initialize ( vtkHyperTreeGrid * grid , vtkIdType treeIndex , bool create = false ) override ; *
##  Return the list of cursors pointing to the leaves touching a
##  given corner of the cell.
##  Return whether the considered cell is the owner of said corner.
##  JB Utilise aujourd'hui dans les filtres vtkHyperTreeGridContour et vtkHyperTreeGridPlaneCutter.
##  bool GetCornerCursors ( unsigned int , unsigned int , vtkIdList * ) ; protected : *
##  Constructor
##  vtkHyperTreeGridNonOrientedMooreSuperCursorLight ( ) = default ; ; *
##  Destructor
##  ~ vtkHyperTreeGridNonOrientedMooreSuperCursorLight ( ) override ; private : vtkHyperTreeGridNonOrientedMooreSuperCursorLight ( const vtkHyperTreeGridNonOrientedMooreSuperCursorLight & ) = delete ; void operator = ( const vtkHyperTreeGridNonOrientedMooreSuperCursorLight & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!