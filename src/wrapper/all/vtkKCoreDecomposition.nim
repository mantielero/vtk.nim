## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkKCoreDecomposition.h
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
##  @class   vtkKCoreDecomposition
##  @brief   Compute the k-core decomposition of the input graph.
##
##
##  The k-core decomposition is a graph partitioning strategy that is useful for
##  analyzing the structure of large networks. A k-core of a graph G is a maximal
##  connected subgraph of G in which all vertices have degree at least k.  The k-core
##  membership for each vertex of the input graph is found on the vertex data of the
##  output graph as an array named 'KCoreDecompositionNumbers' by default.  The algorithm
##  used to find the k-cores has O(number of graph edges) running time, and is described
##  in the following reference paper.
##
##  An O(m) Algorithm for Cores Decomposition of Networks
##    V. Batagelj, M. Zaversnik, 2001
##
##  @par Thanks:
##  Thanks to Thomas Otahal from Sandia National Laboratories for providing this
##  implementation.
##

## !!!Ignored construct:  # vtkKCoreDecomposition_h [NewLine] # vtkKCoreDecomposition_h [NewLine] # vtkGraphAlgorithm.h [NewLine] # vtkInfovisCoreModule.h  For export macro [NewLine] class vtkIntArray ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKINFOVISCORE_EXPORT vtkKCoreDecomposition : public vtkGraphAlgorithm { public : static vtkKCoreDecomposition * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGraphAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGraphAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkKCoreDecomposition :: IsTypeOf ( type ) ; } static vtkKCoreDecomposition * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkKCoreDecomposition * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkKCoreDecomposition * NewInstance ( ) const { return vtkKCoreDecomposition :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKCoreDecomposition :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKCoreDecomposition :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the output array name. If no output array name is
##  set then the name 'KCoreDecompositionNumbers' is used.
##  virtual void SetOutputArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputArrayName && _arg && ( ! strcmp ( this -> OutputArrayName , _arg ) ) ) { return ; } delete [ ] this -> OutputArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} /@{ *
##  Directed graphs only.  Use only the in edges to
##  compute the vertex degree of a vertex.  The default
##  is to use both in and out edges to compute vertex
##  degree.
##  virtual void SetUseInDegreeNeighbors ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseInDegreeNeighbors  to  << _arg ) ; if ( this -> UseInDegreeNeighbors != _arg ) { this -> UseInDegreeNeighbors = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseInDegreeNeighbors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseInDegreeNeighbors  of  << this -> UseInDegreeNeighbors ) ; return this -> UseInDegreeNeighbors ; } ; virtual void UseInDegreeNeighborsOn ( ) { this -> SetUseInDegreeNeighbors ( static_cast < bool > ( 1 ) ) ; } virtual void UseInDegreeNeighborsOff ( ) { this -> SetUseInDegreeNeighbors ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Directed graphs only.  Use only the out edges to
##  compute the vertex degree of a vertex.  The default
##  is to use both in and out edges to compute vertex
##  degree.
##  virtual void SetUseInDegreeNeighborsUseOutDegreeNeighbors ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseOutDegreeNeighbors  to  << _arg ) ; if ( this -> UseOutDegreeNeighbors != _arg ) { this -> UseOutDegreeNeighbors = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseInDegreeNeighborsUseOutDegreeNeighbors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseOutDegreeNeighbors  of  << this -> UseOutDegreeNeighbors ) ; return this -> UseOutDegreeNeighbors ; } ; virtual void UseOutDegreeNeighborsOn ( ) { this -> SetUseInDegreeNeighborsUseOutDegreeNeighbors ( static_cast < bool > ( 1 ) ) ; } virtual void UseOutDegreeNeighborsOff ( ) { this -> SetUseInDegreeNeighborsUseOutDegreeNeighbors ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Check the input graph for self loops and parallel
##  edges.  The k-core is not defined for graphs that
##  contain either of these.  Default is on.
##  virtual void SetUseInDegreeNeighborsUseOutDegreeNeighborsCheckInputGraph ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CheckInputGraph  to  << _arg ) ; if ( this -> CheckInputGraph != _arg ) { this -> CheckInputGraph = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseInDegreeNeighborsUseOutDegreeNeighborsCheckInputGraph ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CheckInputGraph  of  << this -> CheckInputGraph ) ; return this -> CheckInputGraph ; } ; virtual void CheckInputGraphOn ( ) { this -> SetUseInDegreeNeighborsUseOutDegreeNeighborsCheckInputGraph ( static_cast < bool > ( 1 ) ) ; } virtual void CheckInputGraphOff ( ) { this -> SetUseInDegreeNeighborsUseOutDegreeNeighborsCheckInputGraph ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkKCoreDecomposition ( ) ; ~ vtkKCoreDecomposition ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : char * OutputArrayName ; bool UseInDegreeNeighbors ; bool UseOutDegreeNeighbors ; bool CheckInputGraph ;  K-core partitioning implementation void Cores ( vtkGraph * g , vtkIntArray * KCoreNumbers ) ; vtkKCoreDecomposition ( const vtkKCoreDecomposition & ) = delete ; void operator = ( const vtkKCoreDecomposition & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
