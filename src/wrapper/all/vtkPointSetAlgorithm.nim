## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSetAlgorithm.h
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
##  @class   vtkPointSetAlgorithm
##  @brief   Superclass for algorithms that produce output of the same type as input
##
##  vtkPointSetAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this classes
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be PointSet. If that
##  isn't the case then please override this method in your subclass.
##  You should implement the subclass's algorithm into
##  RequestData( request, inputVec, outputVec).
##

## !!!Ignored construct:  # vtkPointSetAlgorithm_h [NewLine] # vtkPointSetAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkPointSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPolyData"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGrid"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkPointSetAlgorithm : public vtkAlgorithm { public : static vtkPointSetAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointSetAlgorithm :: IsTypeOf ( type ) ; } static vtkPointSetAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointSetAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointSetAlgorithm * NewInstance ( ) const { return vtkPointSetAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSetAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm.
##  vtkPointSet * GetOutput ( ) ; vtkPointSet * GetOutput ( int ) ; /@} *
##  Get the output as vtkPolyData.
##  vtkPolyData * GetPolyDataOutput ( ) ; *
##  Get the output as vtkStructuredGrid.
##  vtkStructuredGrid * GetStructuredGridOutput ( ) ; *
##  Get the output as vtkUnstructuredGrid.
##  vtkUnstructuredGrid * GetUnstructuredGridOutput ( ) ; /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void SetInputData ( vtkDataObject * ) ; void SetInputData ( int , vtkDataObject * ) ; void SetInputData ( vtkPointSet * ) ; void SetInputData ( int , vtkPointSet * ) ; /@} /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use AddInputConnection() to
##  setup a pipeline connection.
##  void AddInputData ( vtkDataObject * ) ; void AddInputData ( vtkPointSet * ) ; void AddInputData ( int , vtkPointSet * ) ; void AddInputData ( int , vtkDataObject * ) ; /@}  this method is not recommended for use, but lots of old style filters
##  use it vtkDataObject * GetInput ( ) ; *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; protected : vtkPointSetAlgorithm ( ) ; ~ vtkPointSetAlgorithm ( ) override = default ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int ExecuteInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } /@{ *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int ComputeInputUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } /@}  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPointSetAlgorithm ( const vtkPointSetAlgorithm & ) = delete ; void operator = ( const vtkPointSetAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
