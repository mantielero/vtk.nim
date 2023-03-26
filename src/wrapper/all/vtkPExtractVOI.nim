## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPExtractVOI.h
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
##  @class   vtkPExtractGrid
##  @brief   Extract VOI and/or sub-sample a distributed
##   structured dataset.
##
##
##   vtkPExtractVOI inherits from vtkExtractVOI and provides additional
##   functionality when dealing with a distributed dataset. Specifically, when
##   sub-sampling a dataset, a gap may be introduced between partitions. This
##   filter handles such cases correctly by growing the grid to the right to
##   close the gap.
##
##  @sa
##   vtkExtractVOI
##

## !!!Ignored construct:  # vtkPExtractVOI_h [NewLine] # vtkPExtractVOI_h [NewLine] # vtkExtractVOI.h [NewLine] # vtkFiltersParallelMPIModule.h  For export macro [NewLine]  Forward Declarations class vtkInformation ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformationVector"
discard "forward decl of vtkMPIController"
## !!!Ignored construct:  class VTKFILTERSPARALLELMPI_EXPORT vtkPExtractVOI : public vtkExtractVOI { public : static vtkPExtractVOI * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractVOI Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractVOI :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPExtractVOI :: IsTypeOf ( type ) ; } static vtkPExtractVOI * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPExtractVOI * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPExtractVOI * NewInstance ( ) const { return vtkPExtractVOI :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractVOI :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPExtractVOI :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPExtractVOI :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkPExtractVOI ( ) ; ~ vtkPExtractVOI ( ) override ;  Standard VTK Pipeline methods int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void SetController ( vtkMPIController * ) ; vtkMPIController * Controller ; private : vtkPExtractVOI ( const vtkPExtractVOI & ) = delete ; void operator = ( const vtkPExtractVOI & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
