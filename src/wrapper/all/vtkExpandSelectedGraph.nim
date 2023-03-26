## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExpandSelectedGraph.h
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
##  @class   vtkExpandSelectedGraph
##  @brief   expands a selection set of a vtkGraph
##
##
##  The first input is a vtkSelection containing the selected vertices.
##  The second input is a vtkGraph.
##  This filter 'grows' the selection set in one of the following ways
##  1) SetBFSDistance controls how many 'hops' the selection is grown
##     from each seed point in the selection set (defaults to 1)
##  2) IncludeShortestPaths controls whether this filter tries to
##     'connect' the vertices in the selection set by computing the
##     shortest path between the vertices (if such a path exists)
##  Note: IncludeShortestPaths is currently non-functional
##

## !!!Ignored construct:  # vtkExpandSelectedGraph_h [NewLine] # vtkExpandSelectedGraph_h [NewLine] # vtkInfovisCoreModule.h  For export macro # vtkSelectionAlgorithm.h [NewLine] class vtkGraph ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdTypeArray"
## !!!Ignored construct:  class VTKINFOVISCORE_EXPORT vtkExpandSelectedGraph : public vtkSelectionAlgorithm { public : static vtkExpandSelectedGraph * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSelectionAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSelectionAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExpandSelectedGraph :: IsTypeOf ( type ) ; } static vtkExpandSelectedGraph * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExpandSelectedGraph * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExpandSelectedGraph * NewInstance ( ) const { return vtkExpandSelectedGraph :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExpandSelectedGraph :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExpandSelectedGraph :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  A convenience method for setting the second input (i.e. the graph).
##  void SetGraphConnection ( vtkAlgorithmOutput * in ) ; *
##  Specify the first vtkSelection input and the second vtkGraph input.
##  int FillInputPortInformation ( int port , vtkInformation * info ) override ; /@{ *
##  Set/Get BFSDistance which controls how many 'hops' the selection
##  is grown from each seed point in the selection set (defaults to 1)
##  virtual void SetBFSDistance ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BFSDistance  to  << _arg ) ; if ( this -> BFSDistance != _arg ) { this -> BFSDistance = _arg ; this -> Modified ( ) ; } } ; virtual int GetBFSDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BFSDistance  of  << this -> BFSDistance ) ; return this -> BFSDistance ; } ; /@} /@{ *
##  Set/Get IncludeShortestPaths controls whether this filter tries to
##  'connect' the vertices in the selection set by computing the
##  shortest path between the vertices (if such a path exists)
##  Note: IncludeShortestPaths is currently non-functional
##  virtual void SetBFSDistanceIncludeShortestPaths ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IncludeShortestPaths  to  << _arg ) ; if ( this -> IncludeShortestPaths != _arg ) { this -> IncludeShortestPaths = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBFSDistanceIncludeShortestPaths ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncludeShortestPaths  of  << this -> IncludeShortestPaths ) ; return this -> IncludeShortestPaths ; } ; virtual void IncludeShortestPathsOn ( ) { this -> SetIncludeShortestPaths ( static_cast < bool > ( 1 ) ) ; } virtual void IncludeShortestPathsOff ( ) { this -> SetIncludeShortestPaths ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the vertex domain to use in the expansion.
##  virtual void SetDomain ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Domain  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Domain == nullptr && _arg == nullptr ) { return ; } if ( this -> Domain && _arg && ( ! strcmp ( this -> Domain , _arg ) ) ) { return ; } delete [ ] this -> Domain ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Domain = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Domain = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetDomain ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << Domain  of  << ( this -> Domain ? this -> Domain : (null) ) ) ; return this -> Domain ; } ; /@} /@{ *
##  Whether or not to use the domain when deciding to add a vertex to the
##  expansion. Defaults to false.
##  virtual void SetBFSDistanceIncludeShortestPathsUseDomain ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseDomain  to  << _arg ) ; if ( this -> UseDomain != _arg ) { this -> UseDomain = _arg ; this -> Modified ( ) ; } } ; virtual bool GetBFSDistanceIncludeShortestPathsUseDomain ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseDomain  of  << this -> UseDomain ) ; return this -> UseDomain ; } ; virtual void UseDomainOn ( ) { this -> SetIncludeShortestPathsUseDomain ( static_cast < bool > ( 1 ) ) ; } virtual void UseDomainOff ( ) { this -> SetIncludeShortestPathsUseDomain ( static_cast < bool > ( 0 ) ) ; } ; /@} protected : vtkExpandSelectedGraph ( ) ; ~ vtkExpandSelectedGraph ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void Expand ( vtkIdTypeArray * , vtkGraph * ) ; int BFSDistance ; bool IncludeShortestPaths ; char * Domain ; bool UseDomain ; private : vtkExpandSelectedGraph ( const vtkExpandSelectedGraph & ) = delete ; void operator = ( const vtkExpandSelectedGraph & ) = delete ; void BFSExpandSelection ( vtkIdTypeArray * selection , vtkGraph * graph ) ; } ;
## Error: token expected: ; but got: [identifier]!!!
