## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVoronoiKernel.h
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
##  @class   vtkVoronoiKernel
##  @brief   a Voronoi interpolation kernel
##
##
##  vtkVoronoiKernel is an interpolation kernel that simply returns the
##  closest point to a point to be interpolated. A single weight is returned
##  with value=1.0.
##
##  @warning
##  In degenerate cases (where a point x is equidistance from more than one
##  point) the kernel basis arbitrarily chooses one of the equidistant points.
##
##  @sa
##  vtkInterpolationKernel vtkGeneralizedKernel vtkProbabilisticVoronoiKernel
##

## !!!Ignored construct:  # vtkVoronoiKernel_h [NewLine] # vtkVoronoiKernel_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkInterpolationKernel.h [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkVoronoiKernel : public vtkInterpolationKernel { public : /@{ *
##  Standard methods for instantiation, obtaining type information, and printing.
##  static vtkVoronoiKernel * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkInterpolationKernel Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkInterpolationKernel :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVoronoiKernel :: IsTypeOf ( type ) ; } static vtkVoronoiKernel * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVoronoiKernel * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVoronoiKernel * NewInstance ( ) const { return vtkVoronoiKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInterpolationKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVoronoiKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVoronoiKernel :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Given a point x (and optional associated ptId), determine the points
##  around x which form an interpolation basis. The user must provide the
##  vtkIdList pIds, which will be dynamically resized as necessary. The
##  method returns the number of points in the basis. Typically this method
##  is called before ComputeWeights().
##  vtkIdType ComputeBasis ( double x [ 3 ] , vtkIdList * pIds , vtkIdType ptId = 0 ) override ; *
##  Given a point x, and a list of basis points pIds, compute interpolation
##  weights associated with these basis points.  Note that both the nearby
##  basis points list pIds and the weights array are provided by the caller
##  of the method, and may be dynamically resized as necessary. Typically
##  this method is called after ComputeBasis(), although advanced users can
##  invoke ComputeWeights() and provide the interpolation basis points pIds
##  directly.
##  vtkIdType ComputeWeights ( double x [ 3 ] , vtkIdList * pIds , vtkDoubleArray * weights ) override ; protected : vtkVoronoiKernel ( ) ; ~ vtkVoronoiKernel ( ) override ; private : vtkVoronoiKernel ( const vtkVoronoiKernel & ) = delete ; void operator = ( const vtkVoronoiKernel & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
