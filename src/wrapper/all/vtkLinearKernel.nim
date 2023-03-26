## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLinearKernel.h
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
##  @class   vtkLinearKernel
##  @brief   a linear interpolation kernel
##
##
##  vtkLinearKernel is an interpolation kernel that averages the contributions
##  of all points in the basis.
##
##  @sa
##  vtkPointInterpolator vtkInterpolationKernel vtkGeneralizedKernel
##  vtkGaussianKernel vtkLinearKernel vtkShepardKernel
##

## !!!Ignored construct:  # vtkLinearKernel_h [NewLine] # vtkLinearKernel_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkGeneralizedKernel.h [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkLinearKernel : public vtkGeneralizedKernel { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and printing.
##  static vtkLinearKernel * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGeneralizedKernel Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGeneralizedKernel :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLinearKernel :: IsTypeOf ( type ) ; } static vtkLinearKernel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLinearKernel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLinearKernel * NewInstance ( ) const { return vtkLinearKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGeneralizedKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinearKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinearKernel :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@}  Re-use any superclass signatures that we don't override. using vtkGeneralizedKernel :: ComputeWeights ; *
##  Given a point x, a list of basis points pIds, and a probability
##  weighting function prob, compute interpolation weights associated with
##  these basis points.  Note that basis points list pIds, the probability
##  weighting prob, and the weights array are provided by the caller of the
##  method, and may be dynamically resized as necessary. The method returns
##  the number of weights (pIds may be resized in some cases). Typically
##  this method is called after ComputeBasis(), although advanced users can
##  invoke ComputeWeights() and provide the interpolation basis points pIds
##  directly. The probably weighting prob are numbers 0<=prob<=1 which are
##  multiplied against the interpolation weights before normalization. They
##  are estimates of local confidence of weights. The prob may be nullptr in
##  which all probabilities are considered =1.
##  vtkIdType ComputeWeights ( double x [ 3 ] , vtkIdList * pIds , vtkDoubleArray * prob , vtkDoubleArray * weights ) override ; protected : vtkLinearKernel ( ) ; ~ vtkLinearKernel ( ) override ; private : vtkLinearKernel ( const vtkLinearKernel & ) = delete ; void operator = ( const vtkLinearKernel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
