## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionedDataSetCollectionCollectionAlgorithm.h
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
##  @class vtkPartitionedDataSetCollectionAlgorithm
##  @brief Superclass for algorithms that produce vtkPartitionedDataSetCollectionAlgorithm
##
##  vtkPartitionedDataSetCollectionAlgorithm is intended as a superclass for algorithms that
##  produce a vtkPartitionedDataSetCollection.
##

## !!!Ignored construct:  # vtkPartitionedDataSetCollectionAlgorithm_h [NewLine] # vtkPartitionedDataSetCollectionAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkPartitionedDataSetCollection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkPartitionedDataSetCollectionAlgorithm : public vtkAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPartitionedDataSetCollectionAlgorithm :: IsTypeOf ( type ) ; } static vtkPartitionedDataSetCollectionAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPartitionedDataSetCollectionAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPartitionedDataSetCollectionAlgorithm * NewInstance ( ) const { return vtkPartitionedDataSetCollectionAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionedDataSetCollectionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionedDataSetCollectionAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for the specified output port.
##  vtkPartitionedDataSetCollection * GetOutput ( ) ; vtkPartitionedDataSetCollection * GetOutput ( int ) ; /@} vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inInfo , vtkInformationVector * outInfo ) override ; protected : vtkPartitionedDataSetCollectionAlgorithm ( ) ; ~ vtkPartitionedDataSetCollectionAlgorithm ( ) override ; /@{ *
##  Methods for subclasses to override to handle different pipeline requests.
##  virtual int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } virtual int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } /@} int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPartitionedDataSetCollectionAlgorithm ( const vtkPartitionedDataSetCollectionAlgorithm & ) = delete ; void operator = ( const vtkPartitionedDataSetCollectionAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
