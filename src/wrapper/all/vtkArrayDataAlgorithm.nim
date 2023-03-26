## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayDataAlgorithm.h
##
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
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
##
## *
##  @class   vtkArrayDataAlgorithm
##  @brief   Superclass for algorithms that produce
##  vtkArrayDatas as output
##
##
##  vtkArrayDataAlgorithm is a convenience class to make writing algorithms
##  easier. It is also designed to help transition old algorithms to the new
##  pipeline architecture. There are some assumptions and defaults made by this
##  class you should be aware of. This class defaults such that your filter
##  will have one input port and one output port. If that is not the case
##  simply change it with SetNumberOfInputPorts etc. See this class
##  constructor for the default. This class also provides a FillInputPortInfo
##  method that by default says that all inputs will be vtkArrayData. If that
##  isn't the case then please override this method in your subclass.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

## !!!Ignored construct:  # vtkArrayDataAlgorithm_h [NewLine] # vtkArrayDataAlgorithm_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkCommonExecutionModelModule.h  For export macro [NewLine] class vtkArrayData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkArrayDataAlgorithm : public vtkAlgorithm { public : static vtkArrayDataAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkArrayDataAlgorithm :: IsTypeOf ( type ) ; } static vtkArrayDataAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkArrayDataAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkArrayDataAlgorithm * NewInstance ( ) const { return vtkArrayDataAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrayDataAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  see vtkAlgorithm for details
##  vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  Get the output data object for a port on this algorithm.
##  vtkArrayData * GetOutput ( ) { return this -> GetOutput ( 0 ) ; } vtkArrayData * GetOutput ( int index ) ; *
##  Assign a data object as input. Note that this method does not
##  establish a pipeline connection. Use SetInputConnection() to
##  setup a pipeline connection.
##  void SetInputData ( vtkDataObject * obj ) { this -> SetInputData ( 0 , obj ) ; } void SetInputData ( int index , vtkDataObject * obj ) ; protected : vtkArrayDataAlgorithm ( ) ; ~ vtkArrayDataAlgorithm ( ) override ;  convenience method virtual int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) ; *
##  This is called by the superclass.
##  This is the method you should override.
##  virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ;  see algorithm for more info int FillOutputPortInformation ( int port , vtkInformation * info ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkArrayDataAlgorithm ( const vtkArrayDataAlgorithm & ) = delete ; void operator = ( const vtkArrayDataAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
