## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractGhostCells.h
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
##  @class vtkExtractGhostCells
##  @brief Extracts ghost cells from the input and untag them (they become visible).
##
##  This filter takes a `vtkDataSet` as input, removes any non-ghost cell,
##  and renames the ghost cell array in the output to what `OutputGhostArrayName` is set to
##  so it is no longer treated as a ghost type array.
##  By default, `OutputGhostArrayName` is set to `GhostType`.
##

## !!!Ignored construct:  # vtkExtractGhostCells_h [NewLine] # vtkExtractGhostCells_h [NewLine] # vtkFiltersGeneralModule.h  for export macros # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkExtractGhostCells : public vtkUnstructuredGridAlgorithm { public : static vtkExtractGhostCells * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractGhostCells :: IsTypeOf ( type ) ; } static vtkExtractGhostCells * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractGhostCells * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractGhostCells * NewInstance ( ) const { return vtkExtractGhostCells :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractGhostCells :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractGhostCells :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set / Get the name of the ghost cell array in the output.
##  virtual void SetOutputGhostArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputGhostArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputGhostArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputGhostArrayName && _arg && ( ! strcmp ( this -> OutputGhostArrayName , _arg ) ) ) { return ; } delete [ ] this -> OutputGhostArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputGhostArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputGhostArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetOutputGhostArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputGhostArrayName  of  << ( this -> OutputGhostArrayName ? this -> OutputGhostArrayName : (null) ) ) ; return this -> OutputGhostArrayName ; } ; /@} protected : vtkExtractGhostCells ( ) ; ~ vtkExtractGhostCells ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * OutputGhostArrayName ; private : vtkExtractGhostCells ( const vtkExtractGhostCells & ) = delete ; void operator = ( const vtkExtractGhostCells & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
