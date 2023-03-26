## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPExtractRectilinearGrid.h
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
##  @class   vtkPExtractRectilinearGrid
##  @brief   Extract VOI and/or sub-sample a distributed
##   rectilinear grid dataset.
##
##
##   vtkPExtractRectilinearGrid inherits from vtkExtractVOI & provides additional
##   functionality when dealing with a distributed dataset. Specifically, when
##   sub-sampling a dataset, a gap may be introduced between partitions. This
##   filter handles such cases correctly by growing the grid to the right to
##   close the gap.
##
##  @sa
##   vtkExtractRectilinearGrid
##

## !!!Ignored construct:  # vtkPExtractRectilinearGrid_h [NewLine] # vtkPExtractRectilinearGrid_h [NewLine] # vtkExtractRectilinearGrid.h [NewLine] # vtkFiltersParallelMPIModule.h  For export macro [NewLine]  Forward Declarations class vtkInformation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationVector"
discard "forward decl of vtkMPIController"
## !!!Ignored construct:  class VTKFILTERSPARALLELMPI_EXPORT vtkPExtractRectilinearGrid : public vtkExtractRectilinearGrid { public : static vtkPExtractRectilinearGrid * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractRectilinearGrid Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractRectilinearGrid :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPExtractRectilinearGrid :: IsTypeOf ( type ) ; } static vtkPExtractRectilinearGrid * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPExtractRectilinearGrid * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPExtractRectilinearGrid * NewInstance ( ) const { return vtkPExtractRectilinearGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractRectilinearGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExtractRectilinearGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExtractRectilinearGrid :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkPExtractRectilinearGrid ( ) ; virtual ~ vtkPExtractRectilinearGrid ( ) ;  Standard VTK Pipeline methods int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void SetController ( vtkMPIController * ) ; vtkMPIController * Controller ; private : vtkPExtractRectilinearGrid ( const vtkPExtractRectilinearGrid & ) = delete ; void operator = ( const vtkPExtractRectilinearGrid & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
