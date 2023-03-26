## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExplicitStructuredGridToUnstructuredGrid.h
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
##  @class   vtkExplicitStructuredGridToUnstructuredGrid
##  @brief   Filter which converts an explicit structured grid into an unstructured grid.
##

## !!!Ignored construct:  # vtkExplicitStructuredGridToUnstructuredGrid_h [NewLine] # vtkExplicitStructuredGridToUnstructuredGrid_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKFILTERSCORE_EXPORT vtkExplicitStructuredGridToUnstructuredGrid : public vtkUnstructuredGridAlgorithm { public : static vtkExplicitStructuredGridToUnstructuredGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExplicitStructuredGridToUnstructuredGrid :: IsTypeOf ( type ) ; } static vtkExplicitStructuredGridToUnstructuredGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExplicitStructuredGridToUnstructuredGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExplicitStructuredGridToUnstructuredGrid * NewInstance ( ) const { return vtkExplicitStructuredGridToUnstructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExplicitStructuredGridToUnstructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExplicitStructuredGridToUnstructuredGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkExplicitStructuredGridToUnstructuredGrid ( ) = default ; ~ vtkExplicitStructuredGridToUnstructuredGrid ( ) override = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkExplicitStructuredGridToUnstructuredGrid ( const vtkExplicitStructuredGridToUnstructuredGrid & ) = delete ; void operator = ( const vtkExplicitStructuredGridToUnstructuredGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
