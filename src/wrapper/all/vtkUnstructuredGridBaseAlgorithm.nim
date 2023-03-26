## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridBaseAlgorithm.h
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
##  @class   vtkUnstructuredGridBaseAlgorithm
##  @brief   Superclass for algorithms that
##  produce only vtkUnstructureGridBase subclasses as output
##
##  vtkUnstructuredGridBaseAlgorithm is a convenience class to make writing
##  algorithms easier. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this classes
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be UnstructuredGridBase. If
##  that isn't the case then please override this method in your subclass.
##

## !!!Ignored construct:  # vtkUnstructuredGridBaseAlgorithm_h [NewLine] # vtkUnstructuredGridBaseAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnstructuredGridBase"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkUnstructuredGridBaseAlgorithm : public vtkAlgorithm { public : static vtkUnstructuredGridBaseAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridBaseAlgorithm :: IsTypeOf ( type ) ; } static vtkUnstructuredGridBaseAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridBaseAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridBaseAlgorithm * NewInstance ( ) const { return vtkUnstructuredGridBaseAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridBaseAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridBaseAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm.
##  vtkUnstructuredGridBase * GetOutput ( ) ; vtkUnstructuredGridBase * GetOutput ( int ) ; virtual void SetOutput ( vtkDataObject * d ) ; /@} *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void SetInputData ( vtkDataObject * ) ; void SetInputData ( int , vtkDataObject * ) ; /@} /@{ *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void AddInputData ( vtkDataObject * ) ; void AddInputData ( int , vtkDataObject * ) ; /@} protected : vtkUnstructuredGridBaseAlgorithm ( ) ; ~ vtkUnstructuredGridBaseAlgorithm ( ) override ;  convenience method virtual int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestDataObject ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ;  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkUnstructuredGridBaseAlgorithm ( const vtkUnstructuredGridBaseAlgorithm & ) = delete ; void operator = ( const vtkUnstructuredGridBaseAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
