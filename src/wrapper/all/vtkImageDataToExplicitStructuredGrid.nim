## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDataToExplicitStructuredGrid.h
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
##  @class   vtkImageDataToExplicitStructuredGrid
##  @brief   Filter which converts a 3D image data into an explicit structured grid.
##

## !!!Ignored construct:  # vtkImageDataToExplicitStructuredGrid_h [NewLine] # vtkImageDataToExplicitStructuredGrid_h [NewLine] # vtkExplicitStructuredGridAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro [NewLine] class VTKFILTERSCORE_EXPORT vtkImageDataToExplicitStructuredGrid : public vtkExplicitStructuredGridAlgorithm { public : static vtkImageDataToExplicitStructuredGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExplicitStructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExplicitStructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageDataToExplicitStructuredGrid :: IsTypeOf ( type ) ; } static vtkImageDataToExplicitStructuredGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageDataToExplicitStructuredGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageDataToExplicitStructuredGrid * NewInstance ( ) const { return vtkImageDataToExplicitStructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExplicitStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDataToExplicitStructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDataToExplicitStructuredGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkImageDataToExplicitStructuredGrid ( ) = default ; ~ vtkImageDataToExplicitStructuredGrid ( ) override = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkImageDataToExplicitStructuredGrid ( const vtkImageDataToExplicitStructuredGrid & ) = delete ; void operator = ( const vtkImageDataToExplicitStructuredGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
