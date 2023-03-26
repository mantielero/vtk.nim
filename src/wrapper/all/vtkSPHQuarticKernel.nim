## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSPHQuarticKernel.h
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
##  @class   vtkSPHQuarticKernel
##  @brief   a quartic SPH interpolation kernel
##
##
##  vtkSPHQuarticKernel is an smooth particle hydrodynamics interpolation kernel as
##  described by D.J. Price. This is a quartic formulation.
##
##  @warning
##  For more information see D.J. Price, Smoothed particle hydrodynamics and
##  magnetohydrodynamics, J. Comput. Phys. 231:759-794, 2012. Especially
##  equation 49.
##
##  @par Acknowledgments:
##  The following work has been generously supported by Altair Engineering
##  and FluiDyna GmbH. Please contact Steve Cosgrove or Milos Stanic for
##  more information.
##
##  @sa
##  vtkSPHKernel vtkSPHInterpolator
##

## !!!Ignored construct:  # vtkSPHQuarticKernel_h [NewLine] # vtkSPHQuarticKernel_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkSPHKernel.h [NewLine] # < algorithm >  For std::min() [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkSPHQuarticKernel : public vtkSPHKernel { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and printing.
##  static vtkSPHQuarticKernel * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkSPHKernel Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkSPHKernel :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSPHQuarticKernel :: IsTypeOf ( type ) ; } static vtkSPHQuarticKernel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSPHQuarticKernel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSPHQuarticKernel * NewInstance ( ) const { return vtkSPHQuarticKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSPHKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSPHQuarticKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSPHQuarticKernel :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Produce the computational parameters for the kernel. Invoke this method
##  after setting initial values like SpatialStep.
##  void Initialize ( vtkAbstractPointLocator * loc , vtkDataSet * ds , vtkPointData * pd ) override ; /@{ *
##  Compute weighting factor given a normalized distance from a sample point.
##  double ComputeFunctionWeight ( const double d ) override { double tmp1 = 2.5 - std :: min ( d , 2.5 ) ; double tmp2 = 1.5 - std :: min ( d , 1.5 ) ; double tmp3 = 0.5 - std :: min ( d , 0.5 ) ; return ( tmp1 * tmp1 * tmp1 * tmp1 - 5.0 * tmp2 * tmp2 * tmp2 * tmp2 + 10.0 * tmp3 * tmp3 * tmp3 * tmp3 ) ; } /@} /@{ *
##  Compute weighting factor for derivative quantities given a normalized
##  distance from a sample point.
##  double ComputeDerivWeight ( const double d ) override { double tmp1 = 2.5 - std :: min ( d , 2.5 ) ; double tmp2 = 1.5 - std :: min ( d , 1.5 ) ; double tmp3 = 0.5 - std :: min ( d , 0.5 ) ; return ( - 4.0 * tmp1 * tmp1 * tmp1 + 20.0 * tmp2 * tmp2 * tmp2 - 40.0 * tmp3 * tmp3 * tmp3 ) ; } /@} protected : vtkSPHQuarticKernel ( ) ; ~ vtkSPHQuarticKernel ( ) override ; private : vtkSPHQuarticKernel ( const vtkSPHQuarticKernel & ) = delete ; void operator = ( const vtkSPHQuarticKernel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
