## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedIds.h
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
##  @class   vtkExtractSelectedIds
##  @brief   extract a list of cells from a dataset
##
##  vtkExtractSelectedIds extracts a set of cells and points from within a
##  vtkDataSet. The set of ids to extract are listed within a vtkSelection.
##  This filter adds a scalar array called vtkOriginalCellIds that says what
##  input cell produced each output cell. This is an example of a Pedigree ID
##  which helps to trace back results. Depending on whether the selection has
##  GLOBALIDS, VALUES or INDICES, the selection will use the contents of the
##  array named in the GLOBALIDS DataSetAttribute, and arbitrary array, or the
##  position (tuple id or number) within the cell or point array.
##
##  @sa
##  vtkSelection vtkExtractSelection
##
##  @deprecated vtkExtractSelectedIds is deprecated in VTK 9.2 and will be removed.
##  Use `vtkExtractSelection` instead of `vtkExtractSelectedIds`.
##
##  Example using vtkExtractSelectedIds:
##
##  vtkNew<vtkExtractSelectedIds> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##
##  Example using vtkExtractSelection:
##
##  vtkNew<vtkExtractSelection> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##

## !!!Ignored construct:  # vtkExtractSelectedIds_h [NewLine] # vtkExtractSelectedIds_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkExtractSelectionBase.h [NewLine] # vtkFiltersExtractionModule.h  For export macro [NewLine] class vtkSelection ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSelectionNode"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_2_0 ( Use vtkExtractSelection instead of vtkExtractSelectedIds. ) VTKFILTERSEXTRACTION_EXPORT vtkExtractSelectedIds : public vtkExtractSelectionBase { public : static vtkExtractSelectedIds * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractSelectionBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractSelectionBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractSelectedIds :: IsTypeOf ( type ) ; } static vtkExtractSelectedIds * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractSelectedIds * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractSelectedIds * NewInstance ( ) const { return vtkExtractSelectedIds :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractSelectionBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedIds :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedIds :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : vtkExtractSelectedIds ( ) ; ~ vtkExtractSelectedIds ( ) override ;  Overridden to indicate that the input must be a vtkDataSet. int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int ExtractCells ( vtkSelectionNode * sel , vtkDataSet * input , vtkDataSet * output ) ; int ExtractPoints ( vtkSelectionNode * sel , vtkDataSet * input , vtkDataSet * output ) ; private : vtkExtractSelectedIds ( const vtkExtractSelectedIds & ) = delete ; void operator = ( const vtkExtractSelectedIds & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkExtractSelectedIds.h
