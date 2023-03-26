## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierWedge.h
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
##  @class   vtkBezierWedge
##  @brief   A 3D cell that represents an arbitrary order Bezier wedge
##
##  vtkBezierWedge is a concrete implementation of vtkCell to represent a
##  3D wedge using Bezier shape functions of user specified order.
##  A wedge consists of two triangular and three quadrilateral faces.
##  The first six points of the wedge (0-5) are the "corner" points
##  where the first three points are the base of the wedge. This wedge
##  point ordering is opposite the vtkWedge ordering though in that
##  the base of the wedge defined by the first three points (0,1,2) form
##  a triangle whose normal points inward (toward the triangular face (3,4,5)).
##  While this is opposite the vtkWedge convention it is consistent with
##  every other cell type in VTK. The first 2 parametric coordinates of the
##  Bezier wedge or for the triangular base and vary between 0 and 1. The
##  third parametric coordinate is between the two triangular faces and goes
##  from 0 to 1 as well.
##

## !!!Ignored construct:  # vtkBezierWedge_h [NewLine] # vtkBezierWedge_h [NewLine] # vtkCellType.h  For GetCellType. # vtkCommonDataModelModule.h  For export macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkHigherOrderWedge.h [NewLine] # vtkNew.h  For member variable. # vtkSmartPointer.h  For member variable. [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkWedge"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
discard "forward decl of vtkBezierCurve"
discard "forward decl of vtkBezierInterpolation"
discard "forward decl of vtkBezierQuadrilateral"
discard "forward decl of vtkBezierTriangle"
discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkBezierWedge : public vtkHigherOrderWedge { public : static vtkBezierWedge * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHigherOrderWedge Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHigherOrderWedge :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBezierWedge :: IsTypeOf ( type ) ; } static vtkBezierWedge * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBezierWedge * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBezierWedge * NewInstance ( ) const { return vtkBezierWedge :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderWedge :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierWedge :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierWedge :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override { return VTK_BEZIER_WEDGE ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int faceId ) override ; VTK_DEPRECATED_IN_9_1_0 ( EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation. ) void EvaluateLocationProjectedNode ( int & subId , const vtkIdType point_id , double x [ 3 ] , double * weights ) ; void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override ; void SetRationalWeightsFromPointData ( vtkPointData * point_data , const vtkIdType numPts ) ; vtkHigherOrderQuadrilateral * GetBoundaryQuad ( ) override ; vtkHigherOrderTriangle * GetBoundaryTri ( ) override ; vtkHigherOrderCurve * GetEdgeCell ( ) override ; vtkHigherOrderInterpolation * GetInterpolation ( ) override ; vtkDoubleArray * GetRationalWeights ( ) ; protected : vtkBezierWedge ( ) ; ~ vtkBezierWedge ( ) override ; vtkNew < vtkDoubleArray > RationalWeights ; vtkNew < vtkBezierQuadrilateral > BdyQuad ; vtkNew < vtkBezierTriangle > BdyTri ; vtkNew < vtkBezierCurve > BdyEdge ; vtkNew < vtkBezierInterpolation > Interp ; vtkNew < vtkBezierCurve > EdgeCell ; private : vtkBezierWedge ( const vtkBezierWedge & ) = delete ; void operator = ( const vtkBezierWedge & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
