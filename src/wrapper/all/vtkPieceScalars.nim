## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPieceScalars.h
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
##  @class   vtkPieceScalars
##  @brief   Sets all cell scalars from the update piece.
##
##
##  vtkPieceScalars is meant to display which piece is being requested
##  as scalar values.  It is useful for visualizing the partitioning for
##  streaming or distributed pipelines.
##
##  @sa
##  vtkPolyDataStreamer
##

## !!!Ignored construct:  # vtkPieceScalars_h [NewLine] # vtkPieceScalars_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersParallelModule.h  For export macro [NewLine] class vtkFloatArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIntArray"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkPieceScalars : public vtkDataSetAlgorithm { public : static vtkPieceScalars * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPieceScalars :: IsTypeOf ( type ) ; } static vtkPieceScalars * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPieceScalars * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPieceScalars * NewInstance ( ) const { return vtkPieceScalars :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPieceScalars :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPieceScalars :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Option to centerate cell scalars of points scalars.  Default is point scalars.
##  void SetScalarModeToCellData ( ) { this -> SetCellScalarsFlag ( 1 ) ; } void SetScalarModeToPointData ( ) { this -> SetCellScalarsFlag ( 0 ) ; } int GetScalarMode ( ) { return this -> CellScalarsFlag ; }  Dscription:
##  This option uses a random mapping between pieces and scalar values.
##  The scalar values are chosen between 0 and 1.  By default, random mode is off. virtual void SetRandomMode ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RandomMode  to  << _arg ) ; if ( this -> RandomMode != _arg ) { this -> RandomMode = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetRandomMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomMode  of  << this -> RandomMode ) ; return this -> RandomMode ; } ; virtual void RandomModeOn ( ) { this -> SetRandomMode ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void RandomModeOff ( ) { this -> SetRandomMode ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; protected : vtkPieceScalars ( ) ; ~ vtkPieceScalars ( ) override ;  Append the pieces. int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkIntArray * MakePieceScalars ( int piece , vtkIdType numScalars ) ; vtkFloatArray * MakeRandomScalars ( int piece , vtkIdType numScalars ) ; virtual void SetRandomModeCellScalarsFlag ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CellScalarsFlag  to  << _arg ) ; if ( this -> CellScalarsFlag != _arg ) { this -> CellScalarsFlag = _arg ; this -> Modified ( ) ; } } ; int CellScalarsFlag ; vtkTypeBool RandomMode ; private : vtkPieceScalars ( const vtkPieceScalars & ) = delete ; void operator = ( const vtkPieceScalars & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
