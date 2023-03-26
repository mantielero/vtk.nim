## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractUserDefinedPiece.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkExtractUserDefinedPiece
##  @brief   Return user specified piece with ghost cells
##
##
##  Provided a function that determines which cells are zero-level
##  cells ("the piece"), this class outputs the piece with the
##  requested number of ghost levels.  The only difference between
##  this class and the class it is derived from is that the
##  zero-level cells are specified by a function you provide,
##  instead of determined by dividing up the cells based on cell Id.
##
##  @sa
##  vtkExtractUnstructuredGridPiece
##

## !!!Ignored construct:  # vtkExtractUserDefinedPiece_h [NewLine] # vtkExtractUserDefinedPiece_h [NewLine] # vtkExtractUnstructuredGridPiece.h [NewLine] # vtkFiltersParallelModule.h  For export macro [NewLine] class VTKFILTERSPARALLEL_EXPORT vtkExtractUserDefinedPiece : public vtkExtractUnstructuredGridPiece { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractUnstructuredGridPiece Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractUnstructuredGridPiece :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractUserDefinedPiece :: IsTypeOf ( type ) ; } static vtkExtractUserDefinedPiece * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractUserDefinedPiece * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractUserDefinedPiece * NewInstance ( ) const { return vtkExtractUserDefinedPiece :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractUnstructuredGridPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractUserDefinedPiece :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractUserDefinedPiece :: New ( ) ; } public : ; static vtkExtractUserDefinedPiece * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; typedef int ( * UserDefFunc ) ( vtkIdType cellID , vtkUnstructuredGrid * grid , void * constantData ) ;  Set the function used to identify the piece.  The function should
##  return 1 if the cell is in the piece, and 0 otherwise. void SetPieceFunction ( UserDefFunc func ) { this -> InPiece = func ; this -> Modified ( ) ; }  Set constant data to be used by the piece identifying function. void SetConstantData ( void * data , int len ) ;  Get constant data to be used by the piece identifying function.
##  Return the length of the data buffer. int GetConstantData ( void * * data ) ;  The function should return 1 if the cell
##  is in the piece, and 0 otherwise. protected : vtkExtractUserDefinedPiece ( ) ; ~ vtkExtractUserDefinedPiece ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ComputeCellTagsWithFunction ( vtkIntArray * tags , vtkIdList * pointOwnership , vtkUnstructuredGrid * input ) ; private : vtkExtractUserDefinedPiece ( const vtkExtractUserDefinedPiece & ) = delete ; void operator = ( const vtkExtractUserDefinedPiece & ) = delete ; void * ConstantData ; int ConstantDataLen ; UserDefFunc InPiece ; } ;
## Error: token expected: ; but got: [identifier]!!!
