## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeTriangle.h
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
##  @class   vtkLagrangeTriangle
##  @brief   A 2D cell that represents an arbitrary order Lagrange triangle
##
##  vtkLagrangeTriangle is a concrete implementation of vtkCell to represent a
##  2D triangle using Lagrange shape functions of user specified order.
##
##  The number of points in a Lagrange cell determines the order over which they
##  are iterated relative to the parametric coordinate system of the cell. The
##  first points that are reported are vertices. They appear in the same order in
##  which they would appear in linear cells. Mid-edge points are reported next.
##  They are reported in sequence. For two- and three-dimensional (3D) cells, the
##  following set of points to be reported are face points. Finally, 3D cells
##  report points interior to their volume.
##

## !!!Ignored construct:  # vtkLagrangeTriangle_h [NewLine] # vtkLagrangeTriangle_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkHigherOrderTriangle.h [NewLine] # < vector >  For caching [NewLine] class vtkDoubleArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkLagrangeCurve"
discard "forward decl of vtkTriangle"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkLagrangeTriangle : public vtkHigherOrderTriangle { public : static vtkLagrangeTriangle * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHigherOrderTriangle Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHigherOrderTriangle :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLagrangeTriangle :: IsTypeOf ( type ) ; } static vtkLagrangeTriangle * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLagrangeTriangle * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLagrangeTriangle * NewInstance ( ) const { return vtkLagrangeTriangle :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeTriangle :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeTriangle :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override { return VTK_LAGRANGE_TRIANGLE ; } vtkCell * GetEdge ( int edgeId ) override ; void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override ; vtkHigherOrderCurve * GetEdgeCell ( ) override ; protected : vtkLagrangeTriangle ( ) ; ~ vtkLagrangeTriangle ( ) override ; vtkIdType GetNumberOfSubtriangles ( ) const { return this -> NumberOfSubtriangles ; } vtkIdType ComputeNumberOfSubtriangles ( ) ; vtkNew < vtkLagrangeCurve > EdgeCell ; private : vtkLagrangeTriangle ( const vtkLagrangeTriangle & ) = delete ; void operator = ( const vtkLagrangeTriangle & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
