## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConvexPointSet.h
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
##  @class   vtkConvexPointSet
##  @brief   a 3D cell defined by a set of convex points
##
##  vtkConvexPointSet is a concrete implementation that represents a 3D cell
##  defined by a convex set of points. An example of such a cell is an octant
##  (from an octree). vtkConvexPointSet uses the ordered triangulations
##  approach (vtkOrderedTriangulator) to create triangulations guaranteed to
##  be compatible across shared faces. This allows a general approach to
##  processing complex, convex cell types.
##
##  @sa
##  vtkHexahedron vtkPyramid vtkTetra vtkVoxel vtkWedge
##

## !!!Ignored construct:  # vtkConvexPointSet_h [NewLine] # vtkConvexPointSet_h [NewLine] # vtkCell3D.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] class vtkUnstructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellArray"
discard "forward decl of vtkTriangle"
discard "forward decl of vtkTetra"
discard "forward decl of vtkDoubleArray"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkConvexPointSet : public vtkCell3D { public : static vtkConvexPointSet * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCell3D Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCell3D :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkConvexPointSet :: IsTypeOf ( type ) ; } static vtkConvexPointSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkConvexPointSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkConvexPointSet * NewInstance ( ) const { return vtkConvexPointSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCell3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConvexPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConvexPointSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  See vtkCell3D API for description of this method.
##  virtual int HasFixedTopology ( ) { return 0 ; } /@{ *
##  See vtkCell3D API for description of these methods.
##  @warning These method are unimplemented in vtkConvexPointSet
##  void GetEdgePoints ( vtkIdType vtkNotUsed ( edgeId ) , const vtkIdType * & vtkNotUsed ( pts ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetEdgePoints Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; } vtkIdType GetFacePoints ( vtkIdType vtkNotUsed ( faceId ) , const vtkIdType * & vtkNotUsed ( pts ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetFacePoints Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; return 0 ; } void GetEdgeToAdjacentFaces ( vtkIdType vtkNotUsed ( edgeId ) , const vtkIdType * & vtkNotUsed ( pts ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetEdgeToAdjacentFaces Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; } vtkIdType GetFaceToAdjacentFaces ( vtkIdType vtkNotUsed ( faceId ) , const vtkIdType * & vtkNotUsed ( faceIds ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetFaceToAdjacentFaces Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; return 0 ; } vtkIdType GetPointToIncidentEdges ( vtkIdType vtkNotUsed ( pointId ) , const vtkIdType * & vtkNotUsed ( edgeIds ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetPointToIncidentEdges Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; return 0 ; } vtkIdType GetPointToIncidentFaces ( vtkIdType vtkNotUsed ( pointId ) , const vtkIdType * & vtkNotUsed ( faceIds ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetPointToIncidentFaces Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; return 0 ; } vtkIdType GetPointToOneRingPoints ( vtkIdType vtkNotUsed ( pointId ) , const vtkIdType * & vtkNotUsed ( pts ) ) override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetPointToOneRingPoints Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; return 0 ; } bool GetCentroid ( double vtkNotUsed ( centroid ) [ 3 ] ) const override { do { if ( vtkObject :: GetGlobalWarningDisplay ( ) ) { vtkOStreamWrapper :: EndlType endl ; vtkOStreamWrapper :: UseEndl ( endl ) ; vtkOStrStreamWrapper vtkmsg ; vtkObject * _object = const_cast < vtkObject * > ( static_cast < const vtkObject * > ( this ) ) ; if ( _object ) { vtkmsg << _object -> GetObjectDescription ( ) << :  ; } else { vtkmsg << (nullptr):  ; } vtkmsg <<  << vtkConvexPointSet::GetCentroid Not Implemented ; std :: string _filename = vtksys :: SystemTools :: GetFilenameName ( __FILE__ ) ; vtkOutputWindowDisplayWarningText ( _filename . c_str ( ) , __LINE__ , vtkmsg . str ( ) , _object ) ; vtkmsg . rdbuf ( ) -> freeze ( 0 ) ; } } while ( false ) ; return false ; } /@} *
##  See vtkCell3D API for description of this method.
##  double * GetParametricCoords ( ) override ; *
##  See the vtkCell API for descriptions of these methods.
##  int GetCellType ( ) override { return VTK_CONVEX_POINT_SET ; } *
##  This cell requires that it be initialized prior to access.
##  int RequiresInitialization ( ) override { return 1 ; } void Initialize ( ) override ; /@{ *
##  A convex point set has no explicit cell edge or faces; however
##  implicitly (after triangulation) it does. Currently the method
##  GetNumberOfEdges() always returns 0 while the GetNumberOfFaces() returns
##  the number of boundary triangles of the triangulation of the convex
##  point set. The method GetNumberOfFaces() triggers a triangulation of the
##  convex point set; repeated calls to GetFace() then return the boundary
##  faces. (Note: GetNumberOfEdges() currently returns 0 because it is a
##  rarely used method and hard to implement. It can be changed in the future.
##  int GetNumberOfEdges ( ) override { return 0 ; } vtkCell * GetEdge ( int ) override { return nullptr ; } int GetNumberOfFaces ( ) override ; vtkCell * GetFace ( int faceId ) override ; /@} *
##  Satisfy the vtkCell API. This method contours by triangulating the
##  cell and then contouring the resulting tetrahedra.
##  void Contour ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * verts , vtkCellArray * lines , vtkCellArray * polys , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd ) override ; *
##  Satisfy the vtkCell API. This method contours by triangulating the
##  cell and then adding clip-edge intersection points into the
##  triangulation; extracting the clipped region.
##  void Clip ( double value , vtkDataArray * cellScalars , vtkIncrementalPointLocator * locator , vtkCellArray * connectivity , vtkPointData * inPd , vtkPointData * outPd , vtkCellData * inCd , vtkIdType cellId , vtkCellData * outCd , int insideOut ) override ; *
##  Satisfy the vtkCell API. This method determines the subId, pcoords,
##  and weights by triangulating the convex point set, and then
##  determining which tetrahedron the point lies in.
##  int EvaluatePosition ( const double x [ 3 ] , double closestPoint [ 3 ] , int & subId , double pcoords [ 3 ] , double & dist2 , double weights [ ] ) override ; *
##  The inverse of EvaluatePosition.
##  void EvaluateLocation ( int & subId , const double pcoords [ 3 ] , double x [ 3 ] , double * weights ) override ; *
##  Triangulates the cells and then intersects them to determine the
##  intersection point.
##  int IntersectWithLine ( const double p1 [ 3 ] , const double p2 [ 3 ] , double tol , double & t , double x [ 3 ] , double pcoords [ 3 ] , int & subId ) override ; *
##  Triangulate using methods of vtkOrderedTriangulator.
##  int Triangulate ( int index , vtkIdList * ptIds , vtkPoints * pts ) override ; *
##  Computes derivatives by triangulating and from subId and pcoords,
##  evaluating derivatives on the resulting tetrahedron.
##  void Derivatives ( int subId , const double pcoords [ 3 ] , const double * values , int dim , double * derivs ) override ; *
##  Returns the set of points forming a face of the triangulation of these
##  points that are on the boundary of the cell that are closest
##  parametrically to the point specified.
##  int CellBoundary ( int subId , const double pcoords [ 3 ] , vtkIdList * pts ) override ; *
##  Return the center of the cell in parametric coordinates.
##  int GetParametricCenter ( double pcoords [ 3 ] ) override ; *
##  A convex point set is triangulated prior to any operations on it so
##  it is not a primary cell, it is a composite cell.
##  int IsPrimaryCell ( ) override { return 0 ; } /@{ *
##  Compute the interpolation functions/derivatives
##  (aka shape functions/derivatives)
##  void InterpolateFunctions ( const double pcoords [ 3 ] , double * sf ) override ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override ; /@} protected : vtkConvexPointSet ( ) ; ~ vtkConvexPointSet ( ) override ; vtkTetra * Tetra ; vtkIdList * TetraIds ; vtkPoints * TetraPoints ; vtkDoubleArray * TetraScalars ; vtkCellArray * BoundaryTris ; vtkTriangle * Triangle ; vtkDoubleArray * ParametricCoords ; private : vtkConvexPointSet ( const vtkConvexPointSet & ) = delete ; void operator = ( const vtkConvexPointSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc GetParametricCenter*(pcoords: array[3, cdouble]): cint {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetParametricCenter(@)",
    header: "vtkConvexPointSet.h".}