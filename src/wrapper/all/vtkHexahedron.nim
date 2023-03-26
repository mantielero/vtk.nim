## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHexahedron.h
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
##  @class   vtkHexahedron
##  @brief   a cell that represents a linear 3D hexahedron
##
##  vtkHexahedron is a concrete implementation of vtkCell to represent a
##  linear, 3D rectangular hexahedron (e.g., "brick" topology). vtkHexahedron
##  uses the standard isoparametric shape functions for a linear
##  hexahedron. The hexahedron is defined by the eight points (0-7) where
##  (0,1,2,3) is the base of the hexahedron which, using the right hand rule,
##  forms a quadrilaterial whose normal points in the direction of the
##  opposite face (4,5,6,7).
##
##  @sa
##  vtkConvexPointSet vtkPyramid vtkTetra vtkVoxel vtkWedge
##

## !!!Ignored construct:  # vtkHexahedron_h [NewLine] # vtkHexahedron_h [NewLine] # vtkCell3D.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class vtkLine ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkQuad"
discard "forward decl of vtkIncrementalPointLocator"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkHexahedron : public vtkCell3D { public : static vtkHexahedron * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell3D Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell3D :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkHexahedron :: IsTypeOf ( type ) ; } static vtkHexahedron * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkHexahedron * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkHexahedron * NewInstance ( ) const { return vtkHexahedron :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHexahedron :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHexahedron :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  See vtkCell3D API for description of these methods.
##  void GetEdgePoints ( vtkIdType edgeId , const vtkIdType * & pts ) override ; vtkIdType GetFacePoints ( vtkIdType faceId , const vtkIdType * & pts ) override ; void GetEdgeToAdjacentFaces ( vtkIdType edgeId , const vtkIdType * & pts ) override ; vtkIdType GetFaceToAdjacentFaces ( vtkIdType faceId , const vtkIdType * & faceIds ) override ; vtkIdType GetPointToIncidentEdges ( vtkIdType pointId , const vtkIdType * & edgeIds ) override ; vtkIdType GetPointToIncidentFaces ( vtkIdType pointId , const vtkIdType * & faceIds ) override ; vtkIdType GetPointToOneRingPoints ( vtkIdType pointId , const vtkIdType * & pts ) override ; bool GetCentroid ( double centroid [ 3 ] ) const override ; /@} *
##  static constexpr handle on the number of points.
##  static constexpr vtkIdType NumberOfPoints = 8 ; *
##  static contexpr handle on the number of faces.
##  static constexpr vtkIdType NumberOfEdges = 12 ; *
##  static contexpr handle on the number of edges.
##  static constexpr vtkIdType NumberOfFaces = 6 ; *
##  static contexpr handle on the maximum face size. It can also be used
##  to know the number of faces adjacent to one face.
##  static constexpr vtkIdType MaximumFaceSize = 4 ; *
##  static constexpr handle on the maximum valence of this cell.
##  The valence of a vertex is the number of incident edges (or equivalently faces)
##  to this vertex. It is also equal to the size of a one ring neighborhood of a vertex.
##  static constexpr vtkIdType MaximumValence = 3 ; /@{ *
##  See the vtkCell API for descriptions of these methods.
##  int GetCellType ( ) override { return VTK_HEXAHEDRON ; } int GetNumberOfEdges ( ) override { return 12 ; } int GetNumberOfFaces ( ) override { return 6 ; } vtkCell * GetEdge ( int edgeId ) override ; vtkCell * GetFace ( int faceId ) override ; int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; /@} int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; double * GetParametricCoords ( ) override ; *
##  Return the case table for table-based isocontouring (aka marching cubes
##  style implementations). A linear 3D cell with N vertices will have 2**N
##  cases. The returned case array lists three edges in order to produce one
##  output triangle which may be repeated to generate multiple triangles. The
##  list of cases terminates with a -1 entry.
##  static int * GetTriangleCases ( int caseId ) ; static void InterpolationFunctions ( const double pcoords [ 3 ] , double weights [ 8 ] ) ; static void InterpolationDerivs ( const double pcoords [ 3 ] , double derivs [ 24 ] ) ; /@{ *
##  Compute the interpolation functions/derivatives
##  (aka shape functions/derivatives)
##  void InterpolateFunctions ( const double pcoords [ 3 ] , double weights [ 8 ] ) override { vtkHexahedron :: InterpolationFunctions ( pcoords , weights ) ; } void InterpolateDerivs ( const double pcoords [ 3 ] , double derivs [ 24 ] ) override { vtkHexahedron :: InterpolationDerivs ( pcoords , derivs ) ; } /@} /@{ *
##  Return the ids of the vertices defining edge/face (`edgeId`/`faceId').
##  Ids are related to the cell, not to the dataset.
##
##  @note The return type changed. It used to be int*, it is now const vtkIdType*.
##  This is so ids are unified between vtkCell and vtkPoints, and so vtkCell ids
##  can be used as inputs in algorithms such as vtkPolygon::ComputeNormal.
##  static const vtkIdType * GetEdgeArray ( vtkIdType edgeId ) VTK_SIZEHINT ( 2 ) ; static const vtkIdType * GetFaceArray ( vtkIdType faceId ) VTK_SIZEHINT ( 4 ) ; /@} *
##  Static method version of GetEdgeToAdjacentFaces.
##  static const vtkIdType * GetEdgeToAdjacentFacesArray ( vtkIdType edgeId ) VTK_SIZEHINT ( 2 ) ; *
##  Static method version of GetFaceToAdjacentFaces.
##  static const vtkIdType * GetFaceToAdjacentFacesArray ( vtkIdType faceId ) VTK_SIZEHINT ( 4 ) ; *
##  Static method version of GetPointToIncidentEdgesArray.
##  static const vtkIdType * GetPointToIncidentEdgesArray ( vtkIdType pointId ) VTK_SIZEHINT ( 3 ) ; *
##  Static method version of GetPointToIncidentFacesArray.
##  static const vtkIdType * GetPointToIncidentFacesArray ( vtkIdType pointId ) VTK_SIZEHINT ( 3 ) ; *
##  Static method version of GetPointToOneRingPoints.
##  static const vtkIdType * GetPointToOneRingPointsArray ( vtkIdType pointId ) VTK_SIZEHINT ( 3 ) ; *
##  Static method version of GetCentroid.
##  static bool ComputeCentroid ( vtkPoints * points , const vtkIdType * pointIds , double centroid [ 3 ] ) ; *
##  Given parametric coordinates compute inverse Jacobian transformation
##  matrix. Returns 9 elements of 3x3 inverse Jacobian plus interpolation
##  function derivatives.
##  void JacobianInverse ( const double pcoords [ 3 ] , double * * inverse , double derivs [ 24 ] ) ; protected : vtkHexahedron ( ) ; ~ vtkHexahedron ( ) override ; vtkLine * Line ; vtkQuad * Quad ; private : vtkHexahedron ( const vtkHexahedron & ) = delete ; void operator = ( const vtkHexahedron & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
