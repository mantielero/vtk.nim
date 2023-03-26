## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBezierHexahedron.h
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
##  @class   vtkBezierHexahedron
##  @brief   A 3D cell that represents an arbitrary order Bezier hex
##
##  vtkBezierHexahedron is a concrete implementation of vtkCell to represent a
##  3D hexahedron using Bezier shape functions of user specified order.
##
##  @sa
##  vtkHexahedron
##

## !!!Ignored construct:  # vtkBezierHexahedron_h [NewLine] # vtkBezierHexahedron_h [NewLine] # vtkCellType.h  For GetCellType. # vtkCommonDataModelModule.h  For export macro # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkHigherOrderHexahedron.h [NewLine] # vtkNew.h  For member variable. # vtkSmartPointer.h  For member variable. [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkHexahedron"
discard "forward decl of vtkIdList"
discard "forward decl of vtkBezierCurve"
discard "forward decl of vtkBezierInterpolation"
discard "forward decl of vtkBezierQuadrilateral"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
discard "forward decl of vtkDataSet"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkBezierHexahedron : public vtkHigherOrderHexahedron { public : static vtkBezierHexahedron * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHigherOrderHexahedron Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHigherOrderHexahedron :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBezierHexahedron :: IsTypeOf ( type ) ; } static vtkBezierHexahedron * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBezierHexahedron * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBezierHexahedron * NewInstance ( ) const { return vtkBezierHexahedron :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderHexahedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBezierHexahedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBezierHexahedron :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override { return VTK_BEZIER_HEXAHEDRON ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int faceId ) override ; VTK_DEPRECATED_IN_9_1_0 ( EvaluateLocationProjectedNode is deprecated, use instead EvaluateLocation. ) void EvaluateLocationProjectedNode ( int & subId , const vtkIdType point_id , double x [ 3 ] , double * weights ) ; void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override ; void SetRationalWeightsFromPointData ( vtkPointData * point_data , const vtkIdType numPts ) ; vtkDoubleArray * GetRationalWeights ( ) ; vtkHigherOrderCurve * GetEdgeCell ( ) override ; vtkHigherOrderQuadrilateral * GetFaceCell ( ) override ; vtkHigherOrderInterpolation * GetInterpolation ( ) override ; protected : vtkHexahedron * GetApproximateHex ( int subId , vtkDataArray * scalarsIn = nullptr , vtkDataArray * scalarsOut = nullptr ) override ; vtkBezierHexahedron ( ) ; ~ vtkBezierHexahedron ( ) override ; vtkNew < vtkDoubleArray > RationalWeights ; vtkNew < vtkBezierQuadrilateral > FaceCell ; vtkNew < vtkBezierCurve > EdgeCell ; vtkNew < vtkBezierInterpolation > Interp ; private : vtkBezierHexahedron ( const vtkBezierHexahedron & ) = delete ; void operator = ( const vtkBezierHexahedron & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
