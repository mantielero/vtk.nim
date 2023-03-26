## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractSelectedThresholds.h
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
##  @class   vtkExtractSelectedThresholds
##  @brief   extract a cells or points from a
##  dataset that have values within a set of thresholds.
##
##
##  vtkExtractSelectedThresholds extracts all cells and points with attribute
##  values that lie within a vtkSelection's THRESHOLD contents. The selecion
##  can specify to threshold a particular array within either the point or cell
##  attribute data of the input. This is similar to vtkThreshold
##  but allows multiple thresholds ranges.
##  This filter adds a scalar array called vtkOriginalCellIds that says what
##  input cell produced each output cell. This is an example of a Pedigree ID
##  which helps to trace back results.
##
##  @sa
##  vtkSelection vtkExtractSelection vtkThreshold
##
##  @deprecated vtkExtractSelectedThresholds is deprecated in VTK 9.2 and will be removed.
##  Use `vtkExtractSelection` instead of `vtkExtractSelectedThresholds`.
##
##  Example using vtkExtractSelectedThresholds:
##
##  vtkNew<vtkExtractSelectedThresholds> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##
##  Example using vtkExtractSelection:
##
##  vtkNew<vtkExtractSelection> selFilter;
##  selFilter->SetInputConnection(0, sphereSource->GetOutputPort());
##  selFilter->SetInputConnection(1, selectionSource->GetOutputPort());
##

## !!!Ignored construct:  # vtkExtractSelectedThresholds_h [NewLine] # vtkExtractSelectedThresholds_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_2_0 # vtkExtractSelectionBase.h [NewLine] # vtkFiltersExtractionModule.h  For export macro [NewLine] class vtkDataArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkSelection"
discard "forward decl of vtkSelectionNode"
discard "forward decl of vtkTable"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_2_0 ( Use vtkExtractSelection instead of vtkExtractSelectedThresholds. ) VTKFILTERSEXTRACTION_EXPORT vtkExtractSelectedThresholds : public vtkExtractSelectionBase { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkExtractSelectionBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkExtractSelectionBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractSelectedThresholds :: IsTypeOf ( type ) ; } static vtkExtractSelectedThresholds * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractSelectedThresholds * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractSelectedThresholds * NewInstance ( ) const { return vtkExtractSelectedThresholds :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExtractSelectionBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractSelectedThresholds :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractSelectedThresholds :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Constructor
##  static vtkExtractSelectedThresholds * New ( ) ; *
##  Function for determining whether a value in a data array passes
##  the threshold test(s) provided in lims.  Returns 1 if the value
##  passes at least one of the threshold tests.
##  If \c scalars is nullptr, then the id itself is used as the scalar value.
##  static int EvaluateValue ( vtkDataArray * scalars , vtkIdType id , vtkDataArray * lims ) { return vtkExtractSelectedThresholds :: EvaluateValue ( scalars , 0 , id , lims ) ; } *
##  Same as the other EvaluateValue except that the component to be compared
##  can be picked using array_component_no (use -1 for magnitude).
##  If \c scalars is nullptr, then the id itself is used as the scalar value.
##  static int EvaluateValue ( vtkDataArray * array , int array_component_no , vtkIdType id , vtkDataArray * lims ) ; *
##  Function for determining whether a value in a data array passes
##  the threshold test(s) provided in lims.  Returns 1 if the value
##  passes at least one of the threshold tests.  Also returns in
##  AboveCount, BelowCount and InsideCount the number of tests where
##  the value was above, below or inside the interval.
##  If \c scalars is nullptr, then the id itself is used as the scalar value.
##  static int EvaluateValue ( vtkDataArray * scalars , vtkIdType id , vtkDataArray * lims , int * AboveCount , int * BelowCount , int * InsideCount ) { return vtkExtractSelectedThresholds :: EvaluateValue ( scalars , 0 , id , lims , AboveCount , BelowCount , InsideCount ) ; } *
##  Same as the other EvaluateValue except that the component to be compared
##  can be picked using array_component_no (use -1 for magnitude).
##  If \c scalars is nullptr, then the id itself is used as the scalar value.
##  static int EvaluateValue ( vtkDataArray * scalars , int array_component_no , vtkIdType id , vtkDataArray * lims , int * AboveCount , int * BelowCount , int * InsideCount ) ; protected : vtkExtractSelectedThresholds ( ) ; ~ vtkExtractSelectedThresholds ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int ExtractCells ( vtkSelectionNode * sel , vtkDataSet * input , vtkDataSet * output , int usePointScalars ) ; int ExtractPoints ( vtkSelectionNode * sel , vtkDataSet * input , vtkDataSet * output ) ; int ExtractRows ( vtkSelectionNode * sel , vtkTable * input , vtkTable * output ) ; private : vtkExtractSelectedThresholds ( const vtkExtractSelectedThresholds & ) = delete ; void operator = ( const vtkExtractSelectedThresholds & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkExtractSelectedThresholds.h
