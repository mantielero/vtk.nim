## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostBreadthFirstSearchTree.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkBoostBreadthFirstSearchTree
##  @brief   Constructs a BFS tree from a graph
##
##
##
##  This vtk class uses the Boost breadth_first_search
##  generic algorithm to perform a breadth first search from a given
##  a 'source' vertex on the input graph (a vtkGraph).
##  The result is a tree with root node corresponding to the start node
##  of the search.
##
##  @sa
##  vtkGraph vtkBoostGraphAdapter
##

## !!!Ignored construct:  # vtkBoostBreadthFirstSearchTree_h [NewLine] # vtkBoostBreadthFirstSearchTree_h [NewLine] # vtkInfovisBoostGraphAlgorithmsModule.h  For export macro # vtkStdString.h  For string type # vtkVariant.h  For variant type [NewLine] # vtkTreeAlgorithm.h [NewLine] class VTKINFOVISBOOSTGRAPHALGORITHMS_EXPORT vtkBoostBreadthFirstSearchTree : public vtkTreeAlgorithm { public : static vtkBoostBreadthFirstSearchTree * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTreeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTreeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBoostBreadthFirstSearchTree :: IsTypeOf ( type ) ; } static vtkBoostBreadthFirstSearchTree * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBoostBreadthFirstSearchTree * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBoostBreadthFirstSearchTree * NewInstance ( ) const { return vtkBoostBreadthFirstSearchTree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTreeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostBreadthFirstSearchTree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostBreadthFirstSearchTree :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Set the index (into the vertex array) of the
##  breadth first search 'origin' vertex.
##  void SetOriginVertex ( vtkIdType index ) ; *
##  Set the breadth first search 'origin' vertex.
##  This method is basically the same as above
##  but allows the application to simply specify
##  an array name and value, instead of having to
##  know the specific index of the vertex.
##  void SetOriginVertex ( vtkStdString arrayName , vtkVariant value ) ; /@{ *
##  Stores the graph vertex ids for the tree vertices in an array
##  named "GraphVertexId".  Default is off.
##  virtual void SetCreateGraphVertexIdArray ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CreateGraphVertexIdArray  to  << _arg ) ; if ( this -> CreateGraphVertexIdArray != _arg ) { this -> CreateGraphVertexIdArray = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCreateGraphVertexIdArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CreateGraphVertexIdArray  of  << this -> CreateGraphVertexIdArray ) ; return this -> CreateGraphVertexIdArray ; } ; virtual void CreateGraphVertexIdArrayOn ( ) { this -> SetCreateGraphVertexIdArray ( static_cast < bool > ( 1 ) ) ; } virtual void CreateGraphVertexIdArrayOff ( ) { this -> SetCreateGraphVertexIdArray ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Turn on this option to reverse the edges in the graph.
##  virtual void SetCreateGraphVertexIdArrayReverseEdges ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReverseEdges  to  << _arg ) ; if ( this -> ReverseEdges != _arg ) { this -> ReverseEdges = _arg ; this -> Modified ( ) ; } } ; virtual bool GetCreateGraphVertexIdArrayReverseEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReverseEdges  of  << this -> ReverseEdges ) ; return this -> ReverseEdges ; } ; virtual void ReverseEdgesOn ( ) { this -> SetCreateGraphVertexIdArrayReverseEdges ( static_cast < bool > ( 1 ) ) ; } virtual void ReverseEdgesOff ( ) { this -> SetCreateGraphVertexIdArrayReverseEdges ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkBoostBreadthFirstSearchTree ( ) ; ~ vtkBoostBreadthFirstSearchTree ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkIdType OriginVertexIndex ; char * ArrayName ; vtkVariant OriginValue ; bool ArrayNameSet ; bool CreateGraphVertexIdArray ; bool ReverseEdges ; /@{ *
##  Using the convenience function for set strings internally
##  virtual void SetArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> ArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> ArrayName && _arg && ( ! strcmp ( this -> ArrayName , _arg ) ) ) { return ; } delete [ ] this -> ArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> ArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> ArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} *
##  This method is basically a helper function to find
##  the index of a specific value within a specific array
##  vtkIdType GetVertexIndex ( vtkAbstractArray * abstract , vtkVariant value ) ; vtkBoostBreadthFirstSearchTree ( const vtkBoostBreadthFirstSearchTree & ) = delete ; void operator = ( const vtkBoostBreadthFirstSearchTree & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
