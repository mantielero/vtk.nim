## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkReverseSense.h
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
##  @class   vtkReverseSense
##  @brief   reverse the ordering of polygonal cells and/or vertex normals
##
##
##  vtkReverseSense is a filter that reverses the order of polygonal cells
##  and/or reverses the direction of point and cell normals. Two flags are
##  used to control these operations. Cell reversal means reversing the order
##  of indices in the cell connectivity list. Normal reversal means
##  multiplying the normal vector by -1 (both point and cell normals,
##  if present).
##
##  @warning
##  Normals can be operated on only if they are present in the data.
##

## !!!Ignored construct:  # vtkReverseSense_h [NewLine] # vtkReverseSense_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkReverseSense : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkReverseSense :: IsTypeOf ( type ) ; } static vtkReverseSense * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkReverseSense * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkReverseSense * NewInstance ( ) const { return vtkReverseSense :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkReverseSense :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkReverseSense :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object so that behavior is to reverse cell ordering and
##  leave normal orientation as is.
##  static vtkReverseSense * New ( ) ; /@{ *
##  Flag controls whether to reverse cell ordering.
##  virtual void SetReverseCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReverseCells  to  << _arg ) ; if ( this -> ReverseCells != _arg ) { this -> ReverseCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetReverseCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReverseCells  of  << this -> ReverseCells ) ; return this -> ReverseCells ; } ; virtual void ReverseCellsOn ( ) { this -> SetReverseCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReverseCellsOff ( ) { this -> SetReverseCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Flag controls whether to reverse normal orientation.
##  virtual void SetReverseCellsReverseNormals ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ReverseNormals  to  << _arg ) ; if ( this -> ReverseNormals != _arg ) { this -> ReverseNormals = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetReverseCellsReverseNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReverseNormals  of  << this -> ReverseNormals ) ; return this -> ReverseNormals ; } ; virtual void ReverseNormalsOn ( ) { this -> SetReverseCellsReverseNormals ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReverseNormalsOff ( ) { this -> SetReverseCellsReverseNormals ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkReverseSense ( ) ; ~ vtkReverseSense ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkTypeBool ReverseCells ; vtkTypeBool ReverseNormals ; private : vtkReverseSense ( const vtkReverseSense & ) = delete ; void operator = ( const vtkReverseSense & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
