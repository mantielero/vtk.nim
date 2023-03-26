## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBoostBiconnectedComponents.h
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
##  @class   vtkBoostBiconnectedComponents
##  @brief   Find the biconnected components of a graph
##
##
##  The biconnected components of a graph are maximal regions of the graph where
##  the removal of any single vertex from the region will not disconnect the
##  graph.  Every edge belongs to exactly one biconnected component.  The
##  biconnected component of each edge is given in the edge array named
##  "biconnected component".  The biconnected component of each vertex is also
##  given in the vertex array named "biconnected component".  Cut vertices (or
##  articulation points) belong to multiple biconnected components, and break
##  the graph apart if removed.  These are indicated by assigning a component
##  value of -1.  To get the biconnected components that a cut vertex belongs
##  to, traverse its edge list and collect the distinct component ids for its
##  incident edges.
##
##  Self-loop edges that start and end at the same vertex are not
##  assigned a biconnected component, and are given component id -1.
##
##  @warning
##  The boost graph bindings currently only support boost version 1.33.1.
##  There are apparently backwards-compatibility issues with later versions.
##

## !!!Ignored construct:  # vtkBoostBiconnectedComponents_h [NewLine] # vtkBoostBiconnectedComponents_h [NewLine] # vtkInfovisBoostGraphAlgorithmsModule.h  For export macro # vtkUndirectedGraphAlgorithm.h [NewLine] class VTKINFOVISBOOSTGRAPHALGORITHMS_EXPORT vtkBoostBiconnectedComponents : public vtkUndirectedGraphAlgorithm { public : static vtkBoostBiconnectedComponents * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUndirectedGraphAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUndirectedGraphAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBoostBiconnectedComponents :: IsTypeOf ( type ) ; } static vtkBoostBiconnectedComponents * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBoostBiconnectedComponents * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBoostBiconnectedComponents * NewInstance ( ) const { return vtkBoostBiconnectedComponents :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUndirectedGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBoostBiconnectedComponents :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBoostBiconnectedComponents :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the output array name. If no output array name is
##  set then the name "biconnected component" is used.
##  virtual void SetOutputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputArrayName && _arg && ( ! strcmp ( this -> OutputArrayName , _arg ) ) ) { return ; } delete [ ] this -> OutputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} protected : vtkBoostBiconnectedComponents ( ) ; ~ vtkBoostBiconnectedComponents ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : char * OutputArrayName ; vtkBoostBiconnectedComponents ( const vtkBoostBiconnectedComponents & ) = delete ; void operator = ( const vtkBoostBiconnectedComponents & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
