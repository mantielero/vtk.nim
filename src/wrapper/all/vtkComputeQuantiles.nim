## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkComputeQuantiles.h
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
##  @class   vtkComputeQuantiles
##  @brief   Extract Ntiles and extremum values
##  of all columns of a table or all fields of a dataset.
##
##  vtkComputeQuantiles accepts any vtkDataObject as input and produces a vtkTable data as output
##  containing the extrema and quantiles.
##
##  The filter internally uses vtkOrderStatistics to divide the dataset into N intervals; so to
##  compute quartiles set the number of intervals to 4, for deciles set the number of intervals to 10
##  etc. The output table has the same number of columns as the input data set and has N+1 number of
##  rows to store the intervals and extrema.
##
##  @sa
##  vtkTableAlgorithm vtkOrderStatistics
##
##  @par Thanks:
##  This class was written by Kitware SAS and supported by EDF - www.edf.fr
##

## !!!Ignored construct:  # vtkComputeQuantiles_h [NewLine] # vtkComputeQuantiles_h [NewLine] # vtkFiltersStatisticsModule.h  For export macro # vtkTableAlgorithm.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkOrderStatistics"
discard "forward decl of vtkTable"
## !!!Ignored construct:  class VTKFILTERSSTATISTICS_EXPORT vtkComputeQuantiles : public vtkTableAlgorithm { public : static vtkComputeQuantiles * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkTableAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkTableAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkComputeQuantiles :: IsTypeOf ( type ) ; } static vtkComputeQuantiles * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkComputeQuantiles * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkComputeQuantiles * NewInstance ( ) const { return vtkComputeQuantiles :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTableAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkComputeQuantiles :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkComputeQuantiles :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; @{ *
##  Set/get the number of intervals into which the data is to be divided.
##  Default is 4.
##  virtual int GetNumberOfIntervals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIntervals  of  << this -> NumberOfIntervals ) ; return this -> NumberOfIntervals ; } ; virtual void SetNumberOfIntervals ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfIntervals  to  << _arg ) ; if ( this -> NumberOfIntervals != _arg ) { this -> NumberOfIntervals = _arg ; this -> Modified ( ) ; } } ; @} protected : vtkComputeQuantiles ( ) ; ~ vtkComputeQuantiles ( ) override = default ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; void ComputeTable ( vtkDataObject * , vtkTable * , vtkIdType ) ; virtual vtkOrderStatistics * CreateOrderStatisticsFilter ( ) ; int FieldAssociation = - 1 ; int NumberOfIntervals = 4 ; private : void operator = ( const vtkComputeQuantiles & ) = delete ; vtkComputeQuantiles ( const vtkComputeQuantiles & ) = delete ; int GetInputFieldAssociation ( ) ; vtkFieldData * GetInputFieldData ( vtkDataObject * input ) ; } ;
## Error: token expected: ; but got: [identifier]!!!
