## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedDataSetAlgorithm.h
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
##  @class vtkPartitionedDataSetAlgorithm
##  @brief Superclass for algorithms that produce vtkPartitionedDataSetAlgorithm
##
##  vtkPartitionedDataSetAlgorithm is intended as a superclass for algorithms that
##  produce a vtkPartitionedDataSet.
##

## !!!Ignored construct:  # vtkPartitionedDataSetAlgorithm_h [NewLine] # vtkPartitionedDataSetAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkPartitionedDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkPartitionedDataSetAlgorithm : public vtkAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPartitionedDataSetAlgorithm :: IsTypeOf ( type ) ; } static vtkPartitionedDataSetAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPartitionedDataSetAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPartitionedDataSetAlgorithm * NewInstance ( ) const { return vtkPartitionedDataSetAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedDataSetAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for the specified output port.
##  vtkPartitionedDataSet * GetOutput ( ) ; vtkPartitionedDataSet * GetOutput ( int ) ; /@} vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inInfo , vtkInformationVector * outInfo ) override ; protected : vtkPartitionedDataSetAlgorithm ( ) ; ~ vtkPartitionedDataSetAlgorithm ( ) override ; /@{ *
##  Methods for subclasses to override to handle different pipeline requests.
##  virtual int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } virtual int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } /@} int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPartitionedDataSetAlgorithm ( const vtkPartitionedDataSetAlgorithm & ) = delete ; void operator = ( const vtkPartitionedDataSetAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
