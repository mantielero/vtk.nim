## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalBoxDataSetAlgorithm.h
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
##  @class   vtkHierarchicalBoxDataSetAlgorithm
##  @brief   superclass for algorithms that
##  produce vtkHierarchicalBoxDataSet as output.
##
##  Algorithms that take any type of data object (including composite dataset)
##  and produce a vtkHierarchicalBoxDataSet in the output can subclass from this
##  class.
##

## !!!Ignored construct:  # vtkHierarchicalBoxDataSetAlgorithm_h [NewLine] # vtkHierarchicalBoxDataSetAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkHierarchicalBoxDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkHierarchicalBoxDataSetAlgorithm : public vtkAlgorithm { public : static vtkHierarchicalBoxDataSetAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHierarchicalBoxDataSetAlgorithm :: IsTypeOf ( type ) ; } static vtkHierarchicalBoxDataSetAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHierarchicalBoxDataSetAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHierarchicalBoxDataSetAlgorithm * NewInstance ( ) const { return vtkHierarchicalBoxDataSetAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalBoxDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalBoxDataSetAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm.
##  vtkHierarchicalBoxDataSet * GetOutput ( ) ; vtkHierarchicalBoxDataSet * GetOutput ( int ) ; /@} /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void SetInputData ( vtkDataObject * ) ; void SetInputData ( int , vtkDataObject * ) ; /@} *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; protected : vtkHierarchicalBoxDataSetAlgorithm ( ) ; ~ vtkHierarchicalBoxDataSetAlgorithm ( ) override ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } /@{ *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } /@}  Create a default executive. vtkExecutive * CreateDefaultExecutive ( ) override ;  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; vtkDataObject * GetInput ( int port ) ; private : vtkHierarchicalBoxDataSetAlgorithm ( const vtkHierarchicalBoxDataSetAlgorithm & ) = delete ; void operator = ( const vtkHierarchicalBoxDataSetAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
