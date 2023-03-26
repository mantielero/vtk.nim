## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkUniformGridAMRAlgorithm.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkUniformGridAMRAlgorithm
##   vtkUniformGridAMR as output.
##
##
##   A base class for all algorithms that take as input any type of data object
##   including composite datasets and produce vtkUniformGridAMR in the output.
##

## !!!Ignored construct:  # vtkUniformGridAMRAlgorithm_h [NewLine] # vtkUniformGridAMRAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkUniformGridAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkExecutive"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkUniformGridAMRAlgorithm : public vtkAlgorithm { public : static vtkUniformGridAMRAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUniformGridAMRAlgorithm :: IsTypeOf ( type ) ; } static vtkUniformGridAMRAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUniformGridAMRAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUniformGridAMRAlgorithm * NewInstance ( ) const { return vtkUniformGridAMRAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUniformGridAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUniformGridAMRAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the output data object for a port on this algorithm
##  vtkUniformGridAMR * GetOutput ( ) ; vtkUniformGridAMR * GetOutput ( int ) ; /@} /@{ *
##  Set an input of this algorithm.
##  void SetInputData ( vtkDataObject * ) ; void SetInputData ( int , vtkDataObject * ) ; /@} *
##  See vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; protected : vtkUniformGridAMRAlgorithm ( ) ; ~ vtkUniformGridAMRAlgorithm ( ) override ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestDataObject ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) { return 1 ; } *
##  Create a default executive
##  vtkExecutive * CreateDefaultExecutive ( ) override ; /@{ *
##  See algorithm for more info.
##  int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; /@} vtkDataObject * GetInput ( int port ) ; private : vtkUniformGridAMRAlgorithm ( const vtkUniformGridAMRAlgorithm & ) = delete ; void operator = ( const vtkUniformGridAMRAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
