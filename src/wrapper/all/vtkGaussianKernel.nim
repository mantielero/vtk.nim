## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGaussianKernel.h
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
##  @class   vtkGaussianKernel
##  @brief   a spherical Gaussian interpolation kernel
##
##
##  vtkGaussianKernel is an interpolation kernel that simply returns the
##  weights for all points found in the sphere defined by radius R. The
##  weights are computed as: exp(-(s*r/R)^2) where r is the distance from the
##  point to be interpolated to a neighboring point within R. The sharpness s
##  simply affects the rate of fall off of the Gaussian. (A more general
##  Gaussian kernel is available from vtkEllipsoidalGaussianKernel.)
##
##  @warning
##  The weights are normalized sp that SUM(Wi) = 1. If a neighbor point p
##  precisely lies on the point to be interpolated, then the interpolated
##  point takes on the values associated with p.
##
##  @sa
##  vtkPointInterpolator vtkInterpolationKernel vtkEllipsoidalGaussianKernel
##  vtkVoronoiKernel vtkSPHKernel vtkShepardKernel
##

## !!!Ignored construct:  # vtkGaussianKernel_h [NewLine] # vtkGaussianKernel_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkGeneralizedKernel.h [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkGaussianKernel : public vtkGeneralizedKernel { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and printing.
##  static vtkGaussianKernel * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkGeneralizedKernel Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkGeneralizedKernel :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGaussianKernel :: IsTypeOf ( type ) ; } static vtkGaussianKernel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGaussianKernel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGaussianKernel * NewInstance ( ) const { return vtkGaussianKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGeneralizedKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGaussianKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGaussianKernel :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Initialize the kernel. Overload the superclass to set up internal
##  computational values.
##  void Initialize ( vtkAbstractPointLocator * loc , vtkDataSet * ds , vtkPointData * pd ) override ;  Re-use any superclass signatures that we don't override. using vtkGeneralizedKernel :: ComputeWeights ; *
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
##  vtkIdType ComputeWeights ( double x [ 3 ] , vtkIdList * pIds , vtkDoubleArray * prob , vtkDoubleArray * weights ) override ; /@{ *
##  Set / Get the sharpness (i.e., falloff) of the Gaussian. By default
##  Sharpness=2. As the sharpness increases the effects of distant points
##  are reduced.
##  virtual void SetSharpness ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Sharpness  to  << _arg ) ; if ( this -> Sharpness != ( _arg < 1 ? 1 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ) { this -> Sharpness = ( _arg < 1 ? 1 : ( _arg > VTK_FLOAT_MAX ? VTK_FLOAT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetSharpnessMinValue ( ) { return 1 ; } virtual double GetSharpnessMaxValue ( ) { return VTK_FLOAT_MAX ; } ; virtual double GetSharpness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Sharpness  of  << this -> Sharpness ) ; return this -> Sharpness ; } ; /@} protected : vtkGaussianKernel ( ) ; ~ vtkGaussianKernel ( ) override ; double Sharpness ;  Internal structure to reduce computation double F2 ; private : vtkGaussianKernel ( const vtkGaussianKernel & ) = delete ; void operator = ( const vtkGaussianKernel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
