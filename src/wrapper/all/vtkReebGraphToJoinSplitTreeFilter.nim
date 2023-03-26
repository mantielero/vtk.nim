## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReebGraphToJoinSplitTreeFilter.h
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
##  @class   vtkReebGraphToJoinSplitTreeFilter
##  @brief   converts a given Reeb graph
##  either to a join tree or a split tree (respectively the connectivity of the
##  sub- and sur- level sets).
##  Note: if you want to use simplification filters, do so on the input Reeb
##  graph first.
##
##  Reference:
##  "Computing contpour trees in all dimensions". H. Carr, J. Snoeyink, U. Axen.
##  SODA 2000, pp. 918-926.
##
##
##  The filter takes as an input the underlying mesh (port 0, a vtkPolyData for
##  2D meshes or a vtkUnstructuredGrid for 3D meshes) with an attached scalar
##  field (identified by FieldId, with setFieldId()) and an input Reeb graph
##  computed on that mesh (port 1).
##  The outputs is vtkReebGraph object describing either a join or split tree.
##

## !!!Ignored construct:  # vtkReebGraphToJoinSplitTreeFilter_h [NewLine] # vtkReebGraphToJoinSplitTreeFilter_h [NewLine] # vtkDirectedGraphAlgorithm.h [NewLine] # vtkFiltersReebGraphModule.h  For export macro [NewLine] class vtkReebGraph ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSREEBGRAPH_EXPORT vtkReebGraphToJoinSplitTreeFilter : public vtkDirectedGraphAlgorithm { public : static vtkReebGraphToJoinSplitTreeFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDirectedGraphAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDirectedGraphAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkReebGraphToJoinSplitTreeFilter :: IsTypeOf ( type ) ; } static vtkReebGraphToJoinSplitTreeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkReebGraphToJoinSplitTreeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkReebGraphToJoinSplitTreeFilter * NewInstance ( ) const { return vtkReebGraphToJoinSplitTreeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDirectedGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReebGraphToJoinSplitTreeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReebGraphToJoinSplitTreeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify if you want to get a join or a split tree.
##  Default value: false (join tree)
##  virtual void SetIsSplitTree ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IsSplitTree  to  << _arg ) ; if ( this -> IsSplitTree != _arg ) { this -> IsSplitTree = _arg ; this -> Modified ( ) ; } } ; virtual bool GetIsSplitTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsSplitTree  of  << this -> IsSplitTree ) ; return this -> IsSplitTree ; } ; /@} /@{ *
##  Set the scalar field Id
##  Default value: 0;
##  virtual void SetIsSplitTreeFieldId ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FieldId  to  << _arg ) ; if ( this -> FieldId != _arg ) { this -> FieldId = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetIsSplitTreeFieldId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FieldId  of  << this -> FieldId ) ; return this -> FieldId ; } ; /@} vtkReebGraph * GetOutput ( ) ; protected : vtkReebGraphToJoinSplitTreeFilter ( ) ; ~ vtkReebGraphToJoinSplitTreeFilter ( ) override ; bool IsSplitTree ; vtkIdType FieldId ; int FillInputPortInformation ( int portNumber , vtkInformation * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkReebGraphToJoinSplitTreeFilter ( const vtkReebGraphToJoinSplitTreeFilter & ) = delete ; void operator = ( const vtkReebGraphToJoinSplitTreeFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
