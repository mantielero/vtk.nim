## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPiecewiseFunctionAlgorithm.h
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
##  @class   vtkPiecewiseFunctionAlgorithm
##  @brief   Superclass for algorithms that produce only piecewise function as output
##
##
##  vtkPiecewiseFunctionAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this classes
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be PiecewiseFunction. If that
##  isn't the case then please override this method in your subclass.
##  You should implement the subclass's algorithm into
##  RequestData( request, inputVec, outputVec).
##

## !!!Ignored construct:  # vtkPiecewiseFunctionAlgorithm_h [NewLine] # vtkPiecewiseFunctionAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkPiecewiseFunction.h  makes things a bit easier [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataObject"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkPiecewiseFunctionAlgorithm : public vtkAlgorithm { public : static vtkPiecewiseFunctionAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPiecewiseFunctionAlgorithm :: IsTypeOf ( type ) ; } static vtkPiecewiseFunctionAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPiecewiseFunctionAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPiecewiseFunctionAlgorithm * NewInstance ( ) const { return vtkPiecewiseFunctionAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPiecewiseFunctionAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPiecewiseFunctionAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm.
##  vtkDataObject * GetOutput ( ) ; vtkDataObject * GetOutput ( int ) ; virtual void SetOutput ( vtkDataObject * d ) ; /@} *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  this method is not recommended for use, but lots of old style filters
##  use it vtkDataObject * GetInput ( ) ; vtkDataObject * GetInput ( int port ) ; /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void SetInputData ( vtkDataObject * ) ; void SetInputData ( int , vtkDataObject * ) ; /@} /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use AddInputConnection() to
##  setup a pipeline connection.
##  void AddInputData ( vtkDataObject * ) ; void AddInputData ( int , vtkDataObject * ) ; /@} protected : vtkPiecewiseFunctionAlgorithm ( ) ; ~ vtkPiecewiseFunctionAlgorithm ( ) override ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ;  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkPiecewiseFunctionAlgorithm ( const vtkPiecewiseFunctionAlgorithm & ) = delete ; void operator = ( const vtkPiecewiseFunctionAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
