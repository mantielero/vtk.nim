## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellDerivatives.h
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
##  @class   vtkCellDerivatives
##  @brief   compute derivatives of scalars and vectors
##
##  vtkCellDerivatives is a filter that computes derivatives of scalars
##  and vectors at the center of cells. You can choose to generate
##  different output including the scalar gradient (a vector), computed
##  tensor vorticity (a vector), gradient of input vectors (a tensor),
##  and strain matrix (linearized or Green-Lagrange) of the input vectors
##  (a tensor); or you may choose to pass data through to the output.
##
##  Note that it is assumed that on input scalars and vector point data
##  is available, which are then used to generate cell vectors and tensors.
##  (The interpolation functions of the cells are used to compute the
##  derivatives which is why point data is required.)
##
##  Note that the tensor components used to be sent out in column, but they
##  are now sent out not in row.
##
##  @warning
##  The computed derivatives are cell attribute data; you can convert them to
##  point attribute data by using the vtkCellDataToPointData filter.
##  Note that, due to the interpolation function used (obtained using
##  1/r**2 normalized sum), the derivatives calculated for polygons
##  with more than 4 vertices are inaccurate in most cases.
##
##  @warning
##  The point data is passed through the filter to the output.
##
##  @sa
##  vtkVectorNorm
##

## !!!Ignored construct:  # vtkCellDerivatives_h [NewLine] # vtkCellDerivatives_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersGeneralModule.h  For export macro [NewLine] # VTK_VECTOR_MODE_PASS_VECTORS 0 [NewLine] # VTK_VECTOR_MODE_COMPUTE_GRADIENT 1 [NewLine] # VTK_VECTOR_MODE_COMPUTE_VORTICITY 2 [NewLine] # VTK_TENSOR_MODE_PASS_TENSORS 0 [NewLine] # VTK_TENSOR_MODE_COMPUTE_GRADIENT 1 [NewLine] # VTK_TENSOR_MODE_COMPUTE_STRAIN 2 [NewLine] # VTK_TENSOR_MODE_COMPUTE_GREEN_LAGRANGE_STRAIN 3 [NewLine] class VTKFILTERSGENERAL_EXPORT vtkCellDerivatives : public vtkDataSetAlgorithm { public : /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellDerivatives :: IsTypeOf ( type ) ; } static vtkCellDerivatives * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellDerivatives * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellDerivatives * NewInstance ( ) const { return vtkCellDerivatives :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellDerivatives :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellDerivatives :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Construct to compute the gradient of the scalars and vectors.
##  static vtkCellDerivatives * New ( ) ; /@{ *
##  Control how the filter works to generate vector cell data. You
##  can choose to pass the input cell vectors, compute the gradient
##  of the input scalars, or extract the vorticity of the computed
##  vector gradient tensor. By default (VectorModeToComputeGradient),
##  the filter will take the gradient of the input scalar data.
##  virtual void SetVectorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  VectorMode  to  << _arg ) ; if ( this -> VectorMode != _arg ) { this -> VectorMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetVectorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorMode  of  << this -> VectorMode ) ; return this -> VectorMode ; } ; void SetVectorModeToPassVectors ( ) { this -> SetVectorMode ( VTK_VECTOR_MODE_PASS_VECTORS ) ; } void SetVectorModeToComputeGradient ( ) { this -> SetVectorMode ( VTK_VECTOR_MODE_COMPUTE_GRADIENT ) ; } void SetVectorModeToComputeVorticity ( ) { this -> SetVectorMode ( VTK_VECTOR_MODE_COMPUTE_VORTICITY ) ; } const char * GetVectorModeAsString ( ) ; /@} /@{ *
##  Control how the filter works to generate tensor cell data. You can
##  choose to pass the input cell tensors, compute the gradient of
##  the input vectors, or compute the strain tensor (linearized or
##  Green-Lagrange strain)of the vector gradient tensor. By default
##  (TensorModeToComputeGradient), the filter will take the gradient
##  of the vector data to construct a tensor.
##  virtual void SetVectorModeTensorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TensorMode  to  << _arg ) ; if ( this -> TensorMode != _arg ) { this -> TensorMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetVectorModeTensorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TensorMode  of  << this -> TensorMode ) ; return this -> TensorMode ; } ; void SetTensorModeToPassTensors ( ) { this -> SetTensorMode ( VTK_TENSOR_MODE_PASS_TENSORS ) ; } void SetTensorModeToComputeGradient ( ) { this -> SetTensorMode ( VTK_TENSOR_MODE_COMPUTE_GRADIENT ) ; } void SetTensorModeToComputeStrain ( ) { this -> SetTensorMode ( VTK_TENSOR_MODE_COMPUTE_STRAIN ) ; } void SetTensorModeToComputeGreenLagrangeStrain ( ) { this -> SetTensorMode ( VTK_TENSOR_MODE_COMPUTE_GREEN_LAGRANGE_STRAIN ) ; } const char * GetTensorModeAsString ( ) ; /@} protected : vtkCellDerivatives ( ) ; ~ vtkCellDerivatives ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int VectorMode ; int TensorMode ; private : vtkCellDerivatives ( const vtkCellDerivatives & ) = delete ; void operator = ( const vtkCellDerivatives & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
