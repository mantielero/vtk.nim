## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPruneTreeFilter.h
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
##  @class   vtkPruneTreeFilter
##  @brief   prune a subtree out of a vtkTree
##
##
##  Removes a subtree rooted at a particular vertex in a vtkTree.
##
##

## !!!Ignored construct:  # vtkPruneTreeFilter_h [NewLine] # vtkPruneTreeFilter_h [NewLine] # vtkInfovisCoreModule.h  For export macro # vtkTreeAlgorithm.h [NewLine] class vtkTree ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPVXMLElement"
## !!!Ignored construct:  class VTKINFOVISCORE_EXPORT vtkPruneTreeFilter : public vtkTreeAlgorithm { public : static vtkPruneTreeFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTreeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTreeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPruneTreeFilter :: IsTypeOf ( type ) ; } static vtkPruneTreeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPruneTreeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPruneTreeFilter * NewInstance ( ) const { return vtkPruneTreeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTreeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPruneTreeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPruneTreeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the parent vertex of the subtree to remove.
##  virtual vtkIdType GetParentVertex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParentVertex  of  << this -> ParentVertex ) ; return this -> ParentVertex ; } ; virtual void SetParentVertex ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ParentVertex  to  << _arg ) ; if ( this -> ParentVertex != _arg ) { this -> ParentVertex = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Should we remove the parent vertex, or just its descendants?
##  Default behavior is to remove the parent vertex.
##  virtual bool GetParentVertexShouldPruneParentVertex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShouldPruneParentVertex  of  << this -> ShouldPruneParentVertex ) ; return this -> ShouldPruneParentVertex ; } ; virtual void SetParentVertexShouldPruneParentVertex ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ShouldPruneParentVertex  to  << _arg ) ; if ( this -> ShouldPruneParentVertex != _arg ) { this -> ShouldPruneParentVertex = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkPruneTreeFilter ( ) ; ~ vtkPruneTreeFilter ( ) override ; vtkIdType ParentVertex ; bool ShouldPruneParentVertex ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkPruneTreeFilter ( const vtkPruneTreeFilter & ) = delete ; void operator = ( const vtkPruneTreeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
