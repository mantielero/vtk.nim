## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHyperTreeGridOrientedCursor.h
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
##  @class   vtkHyperTreeGridOrientedCursor
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
##  JB This class was re-written for more optimisation by Jacques-Bernard Lekien,
##  Guenole Harel and Jerome Dubois, 2018.
##  This work was supported by Commissariat a l'Energie Atomique
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

## !!!Ignored construct:  # vtkHyperTreeGridOrientedCursor_h [NewLine] # vtkHyperTreeGridOrientedCursor_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkHyperTreeGridEntry.h  Used internally # vtkObject.h [NewLine] class vtkHyperTree ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkHyperTreeGrid"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHyperTreeGridOrientedCursor : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHyperTreeGridOrientedCursor :: IsTypeOf ( type ) ; } static vtkHyperTreeGridOrientedCursor * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHyperTreeGridOrientedCursor * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHyperTreeGridOrientedCursor * NewInstance ( ) const { return vtkHyperTreeGridOrientedCursor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHyperTreeGridOrientedCursor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHyperTreeGridOrientedCursor :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkHyperTreeGridOrientedCursor * New ( ) ; *
##  Create a copy of `this'.
##  \post results_exists:result!=0
##  vtkHyperTreeGridOrientedCursor * Clone ( ) ; *
##  Initialize cursor at root of given tree index in grid.
##  void Initialize ( vtkHyperTreeGrid * grid , vtkIdType treeIndex , bool create = false ) ; *
##  JB
##  void Initialize ( vtkHyperTreeGrid * grid , vtkHyperTree * tree , unsigned int level , vtkIdType index ) ; *
##  JB
##  void Initialize ( vtkHyperTreeGrid * grid , vtkHyperTree * tree , unsigned int level , vtkHyperTreeGridEntry & entry ) ; /@{ *
##  Set the hyper tree grid to which the cursor is pointing.
##  vtkHyperTreeGrid * GetGrid ( ) ; /@} /@{ *
##  Return if a Tree pointing exist
##  bool HasTree ( ) const ; /@} /@{ *
##  Set the hyper tree to which the cursor is pointing.
##  vtkHyperTree * GetTree ( ) const ; /@} *
##  Return the index of the current vertex in the tree.
##  vtkIdType GetVertexId ( ) ; *
##  Return the global index (relative to the grid) of the
##  current vertex in the tree.
##  vtkIdType GetGlobalNodeIndex ( ) ; *
##  Return the dimension of the tree.
##  \post positive_result: result>0
##  unsigned char GetDimension ( ) ; *
##  Return the number of children for each node (non-vertex leaf) of the tree.
##  \post positive_number: result>0
##  unsigned char GetNumberOfChildren ( ) ; *
##  JB
##  void SetGlobalIndexStart ( vtkIdType index ) ; *
##  JB
##  void SetGlobalIndexFromLocal ( vtkIdType index ) ; *
##  Set the blanking mask is empty or not
##  \pre not_tree: tree
##  void SetMask ( bool state ) ; *
##  Determine whether blanking mask is empty or not
##  bool IsMasked ( ) ; *
##  Is the cursor pointing to a leaf?
##  bool IsLeaf ( ) ; *
##  JB Fait chier normalement on devrait passer par GetEntry
##  void SubdivideLeaf ( ) ; *
##  Is the cursor at tree root?
##  bool IsRoot ( ) ; *
##  Get the level of the tree vertex pointed by the cursor.
##  unsigned int GetLevel ( ) ; *
##  Move the cursor to child `child' of the current vertex.
##  \pre not_tree: HasTree()
##  \pre not_leaf: !IsLeaf()
##  \pre valid_child: ichild>=0 && ichild<GetNumberOfChildren()
##  \pre depth_limiter: GetLevel() <= GetDepthLimiter()
##  void ToChild ( unsigned char ichild ) ; protected : *
##  Constructor
##  vtkHyperTreeGridOrientedCursor ( ) ; *
##  Destructor
##  ~ vtkHyperTreeGridOrientedCursor ( ) override ; *
##  JB Reference sur l'hyper tree grid parcouru actuellement.
##  vtkHyperTreeGrid * Grid ; *
##  JB
##  vtkHyperTree * Tree ; *
##  JB
##  unsigned int Level ;  Hyper tree grid to which the cursor is attached vtkHyperTreeGridEntry Entry ; private : vtkHyperTreeGridOrientedCursor ( const vtkHyperTreeGridOrientedCursor & ) = delete ; void operator = ( const vtkHyperTreeGridOrientedCursor & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
