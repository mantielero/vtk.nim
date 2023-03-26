## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRemoveGhosts.h
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
##  @class   vtkRemoveGhosts
##  @brief   Remove ghost points, cells and arrays
##
##
##  Removes ghost points, cells and associated data arrays. Works on
##  vtkPolyDatas and vtkUnstructuredGrids.
##

## !!!Ignored construct:  # vtkRemoveGhosts_h [NewLine] # vtkRemoveGhosts_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class vtkPolyData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnsignedCharArray"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkRemoveGhosts : public vtkPassInputTypeAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRemoveGhosts :: IsTypeOf ( type ) ; } static vtkRemoveGhosts * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRemoveGhosts * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRemoveGhosts * NewInstance ( ) const { return vtkRemoveGhosts :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRemoveGhosts :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRemoveGhosts :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkRemoveGhosts * New ( ) ; protected : vtkRemoveGhosts ( ) ; ~ vtkRemoveGhosts ( ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkRemoveGhosts ( const vtkRemoveGhosts & ) = delete ; void operator = ( const vtkRemoveGhosts & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
