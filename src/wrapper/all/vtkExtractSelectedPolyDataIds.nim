## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedPolyDataIds.h
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
##  @class   vtkExtractSelectedPolyDataIds
##  @brief   extract a list of cells from a polydata
##
##  vtkExtractSelectedPolyDataIds extracts all cells in vtkSelection from a
##  vtkPolyData.
##
##  @sa
##  vtkSelection
##
##  @deprecated vtkExtractSelectedPolyDataIds is deprecated in VTK 9.2 and will be removed.
##  Use `vtkExtractSelection` instead of `vtkExtractSelectedPolyDataIds`.
##
##  Example using vtkExtractSelectedPolyDataIds:
##
##  vtkNew<vtkExtractSelectedPolyDataIds> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##
##  Example using vtkExtractSelection:
##
##  vtkNew<vtkExtractSelection> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##
##  convert selFilter's output from vtkUnstructuredGrid to vtkPolydata
##

## !!!Ignored construct:  # vtkExtractSelectedPolyDataIds_h [NewLine] # vtkExtractSelectedPolyDataIds_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkFiltersExtractionModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkSelection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_2_0 ( Use vtkExtractSelection instead of vtkExtractSelectedPolyDataIds. ) VTKFILTERSEXTRACTION_EXPORT vtkExtractSelectedPolyDataIds : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractSelectedPolyDataIds :: IsTypeOf ( type ) ; } static vtkExtractSelectedPolyDataIds * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractSelectedPolyDataIds * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractSelectedPolyDataIds * NewInstance ( ) const { return vtkExtractSelectedPolyDataIds :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedPolyDataIds :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedPolyDataIds :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkExtractSelectedPolyDataIds * New ( ) ; protected : vtkExtractSelectedPolyDataIds ( ) ; ~ vtkExtractSelectedPolyDataIds ( ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; private : vtkExtractSelectedPolyDataIds ( const vtkExtractSelectedPolyDataIds & ) = delete ; void operator = ( const vtkExtractSelectedPolyDataIds & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkExtractSelectedPolyDataIds.h
