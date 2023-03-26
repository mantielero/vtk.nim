## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedLocations.h
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
##  @class   vtkExtractSelectedLocations
##  @brief   extract cells within a dataset that
##  contain the locations listen in the vtkSelection.
##
##  vtkExtractSelectedLocations extracts all cells whose volume contain at least
##  one point listed in the LOCATIONS content of the vtkSelection. This filter
##  adds a scalar array called vtkOriginalCellIds that says what input cell
##  produced each output cell. This is an example of a Pedigree ID which helps
##  to trace back results.
##
##  @sa
##  vtkSelection vtkExtractSelection
##
##  @deprecated vtkExtractSelectedLocations is deprecated in VTK 9.2 and will be removed.
##  Use `vtkExtractSelection` instead of `vtkExtractSelectedLocations`.
##
##  Example using vtkExtractSelectedLocations:
##
##  vtkNew<vtkExtractSelectedLocations> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##
##  Example using vtkExtractSelection:
##
##  vtkNew<vtkExtractSelection> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##

## !!!Ignored construct:  # vtkExtractSelectedLocations_h [NewLine] # vtkExtractSelectedLocations_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkExtractSelectionBase.h [NewLine] # vtkFiltersExtractionModule.h  For export macro [NewLine] class vtkSelection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSelectionNode"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_2_0 ( Use vtkExtractSelection instead of vtkExtractSelectedLocations. ) VTKFILTERSEXTRACTION_EXPORT vtkExtractSelectedLocations : public vtkExtractSelectionBase { public : static vtkExtractSelectedLocations * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractSelectionBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractSelectionBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractSelectedLocations :: IsTypeOf ( type ) ; } static vtkExtractSelectedLocations * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractSelectedLocations * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractSelectedLocations * NewInstance ( ) const { return vtkExtractSelectedLocations :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractSelectionBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedLocations :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedLocations :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkExtractSelectedLocations ( ) ; ~ vtkExtractSelectedLocations ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int ExtractCells ( vtkSelectionNode * sel , vtkDataSet * input , vtkDataSet * output ) ; int ExtractPoints ( vtkSelectionNode * sel , vtkDataSet * input , vtkDataSet * output ) ; private : vtkExtractSelectedLocations ( const vtkExtractSelectedLocations & ) = delete ; void operator = ( const vtkExtractSelectedLocations & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkExtractSelectedLocations.h
