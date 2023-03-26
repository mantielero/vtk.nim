## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPMergeArrays.h
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
##  @class   vtkPMergeArrays
##  @brief   Multiple inputs with one output, parallel version
##
##  Like it's super class, this filter tries to combine all arrays from
##  inputs into one output.
##
##  @sa
##  vtkMergeArrays
##

## !!!Ignored construct:  # vtkPMergeArrays_h [NewLine] # vtkPMergeArrays_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkMergeArrays.h [NewLine] class VTKFILTERSPARALLEL_EXPORT vtkPMergeArrays : public vtkMergeArrays { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMergeArrays Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMergeArrays :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPMergeArrays :: IsTypeOf ( type ) ; } static vtkPMergeArrays * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPMergeArrays * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPMergeArrays * NewInstance ( ) const { return vtkPMergeArrays :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMergeArrays :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPMergeArrays :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPMergeArrays :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkPMergeArrays * New ( ) ; protected : vtkPMergeArrays ( ) ; ~ vtkPMergeArrays ( ) override = default ; int MergeDataObjectFields ( vtkDataObject * input , int idx , vtkDataObject * output ) override ; private : vtkPMergeArrays ( const vtkPMergeArrays & ) = delete ; void operator = ( const vtkPMergeArrays & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
