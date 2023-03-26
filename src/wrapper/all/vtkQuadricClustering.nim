## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQuadricClustering.h
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
##  @class   vtkQuadricClustering
##  @brief   reduce the number of triangles in a mesh
##
##  vtkQuadricClustering is a filter to reduce the number of triangles in a
##  triangle mesh, forming a good approximation to the original geometry.  The
##  input to vtkQuadricClustering is a vtkPolyData object, and all types of
##  polygonal data are handled.
##
##  The algorithm used is the one described by Peter Lindstrom in his Siggraph
##  2000 paper, "Out-of-Core Simplification of Large Polygonal Models."  The
##  general approach of the algorithm is to cluster vertices in a uniform
##  binning of space, accumulating the quadric of each triangle (pushed out to
##  the triangles vertices) within each bin, and then determining an optimal
##  position for a single vertex in a bin by using the accumulated quadric. In
##  more detail, the algorithm first gets the bounds of the input poly data.
##  It then breaks this bounding volume into a user-specified number of
##  spatial bins.  It then reads each triangle from the input and hashes its
##  vertices into these bins.  (If this is the first time a bin has been
##  visited, initialize its quadric to the 0 matrix.) The algorithm computes
##  the error quadric for this triangle and adds it to the existing quadric of
##  the bin in which each vertex is contained. Then, if 2 or more vertices of
##  the triangle fall in the same bin, the triangle is dicarded.  If the
##  triangle is not discarded, it adds the triangle to the list of output
##  triangles as a list of vertex identifiers.  (There is one vertex id per
##  bin.)  After all the triangles have been read, the representative vertex
##  for each bin is computed (an optimal location is found) using the quadric
##  for that bin.  This determines the spatial location of the vertices of
##  each of the triangles in the output.
##
##  To use this filter, specify the divisions defining the spatial subdivision
##  in the x, y, and z directions. You must also specify an input vtkPolyData.
##  Then choose to either 1) use the original points that minimize the quadric
##  error to produce the output triangles or 2) compute an optimal position in
##  each bin to produce the output triangles (recommended and default behavior).
##
##  This filter can take multiple inputs.  To do this, the user must explicitly
##  call StartAppend, Append (once for each input), and EndAppend.  StartAppend
##  sets up the data structure to hold the quadric matrices.  Append processes
##  each triangle in the input poly data it was called on, hashes its vertices
##  to the appropriate bins, determines whether to keep this triangle, and
##  updates the appropriate quadric matrices.  EndAppend determines the spatial
##  location of each of the representative vertices for the visited bins. While
##  this approach does not fit into the visualization architecture and requires
##  manual control, it has the advantage that extremely large data can be
##  processed in pieces and appended to the filter piece-by-piece.
##
##  @warning
##  This filter can drastically affect topology, i.e., topology is not
##  preserved.
##
##  @warning
##  The filter handles input triangle strips and arbitrary polygons. Arbitrary
##  polygons are assumed convex: during insertion they are triangulated using
##  a fan of triangles from the first point in the polygons. If the polygon is
##  concave, this can produce bad results. In this case, use vtkTriangleFilter
##  to triangulate the polygons first.
##
##  @warning
##  The filter also treats polylines and vertices.
##
##  @warning
##  Note that for certain types of geometry (e.g., a mostly 2D plane with
##  jitter in the normal direction), the decimator can perform badly. In this
##  situation, set the number of bins in the normal direction to one.
##
##  @warning
##  vtkBinnedDecimation produces similar results with significant speedup
##  and reduced memory consumption.
##
##  @sa
##  vtkQuadricDecimation vtkDecimatePro vtkDecimate vtkQuadricLODActor
##  vtkBinnedDecimation
##

## !!!Ignored construct:  # vtkQuadricClustering_h [NewLine] # vtkQuadricClustering_h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkFeatureEdges"
discard "forward decl of vtkPoints"
discard "forward decl of vtkQuadricClusteringCellSet"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkQuadricClustering : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard instantiation, type and print methods.
##  static vtkQuadricClustering * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkQuadricClustering :: IsTypeOf ( type ) ; } static vtkQuadricClustering * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkQuadricClustering * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkQuadricClustering * NewInstance ( ) const { return vtkQuadricClustering :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQuadricClustering :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQuadricClustering :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Set/Get the number of divisions along each axis for the spatial bins.
##  The number of spatial bins is NumberOfXDivisions*NumberOfYDivisions*
##  NumberOfZDivisions.  The filter may choose to ignore large numbers of
##  divisions if the input has few points and AutoAdjustNumberOfDivisions
##  is enabled.
##  void SetNumberOfXDivisions ( int num ) ; void SetNumberOfYDivisions ( int num ) ; void SetNumberOfZDivisions ( int num ) ; virtual int GetNumberOfXDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfXDivisions  of  << this -> NumberOfXDivisions ) ; return this -> NumberOfXDivisions ; } ; virtual int GetNumberOfXDivisionsNumberOfYDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfYDivisions  of  << this -> NumberOfYDivisions ) ; return this -> NumberOfYDivisions ; } ; virtual int GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfZDivisions  of  << this -> NumberOfZDivisions ) ; return this -> NumberOfZDivisions ; } ; void SetNumberOfDivisions ( int div [ 3 ] ) { this -> SetNumberOfDivisions ( div [ 0 ] , div [ 1 ] , div [ 2 ] ) ; } void SetNumberOfDivisions ( int div0 , int div1 , int div2 ) ; int * GetNumberOfDivisions ( ) VTK_SIZEHINT ( 3 ) ; void GetNumberOfDivisions ( int div [ 3 ] ) ; /@} /@{ *
##  Enable automatic adjustment of number of divisions. If off, the number
##  of divisions specified by the user is always used (as long as it is valid).
##  The default is On
##  virtual void SetAutoAdjustNumberOfDivisions ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AutoAdjustNumberOfDivisions  to  << _arg ) ; if ( this -> AutoAdjustNumberOfDivisions != _arg ) { this -> AutoAdjustNumberOfDivisions = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoAdjustNumberOfDivisions  of  << this -> AutoAdjustNumberOfDivisions ) ; return this -> AutoAdjustNumberOfDivisions ; } ; virtual void AutoAdjustNumberOfDivisionsOn ( ) { this -> SetAutoAdjustNumberOfDivisions ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void AutoAdjustNumberOfDivisionsOff ( ) { this -> SetAutoAdjustNumberOfDivisions ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  This is an alternative way to set up the bins.  If you are trying to match
##  boundaries between pieces, then you should use these methods rather than
##  SetNumberOfDivisions. To use these methods, specify the origin and spacing
##  of the spatial binning.
##  void SetDivisionOrigin ( double x , double y , double z ) ; void SetDivisionOrigin ( double o [ 3 ] ) { this -> SetDivisionOrigin ( o [ 0 ] , o [ 1 ] , o [ 2 ] ) ; } virtual double * GetDivisionOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DivisionOrigin  pointer  << this -> DivisionOrigin ) ; return this -> DivisionOrigin ; } VTK_WRAPEXCLUDE virtual void GetDivisionOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DivisionOrigin [ 0 ] ; _arg2 = this -> DivisionOrigin [ 1 ] ; _arg3 = this -> DivisionOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DivisionOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDivisionOrigin ( double _arg [ 3 ] ) { this -> GetDivisionOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; void SetDivisionSpacing ( double x , double y , double z ) ; void SetDivisionSpacing ( double s [ 3 ] ) { this -> SetDivisionSpacing ( s [ 0 ] , s [ 1 ] , s [ 2 ] ) ; } virtual double * GetDivisionOriginDivisionSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DivisionSpacing  pointer  << this -> DivisionSpacing ) ; return this -> DivisionSpacing ; } VTK_WRAPEXCLUDE virtual void GetDivisionOriginDivisionSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DivisionSpacing [ 0 ] ; _arg2 = this -> DivisionSpacing [ 1 ] ; _arg3 = this -> DivisionSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DivisionSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDivisionOriginDivisionSpacing ( double _arg [ 3 ] ) { this -> GetDivisionOriginDivisionSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Normally the point that minimizes the quadric error function is used as
##  the output of the bin.  When this flag is on, the bin point is forced to
##  be one of the points from the input (the one with the smallest
##  error). This option does not work (i.e., input points cannot be used)
##  when the append methods (StartAppend(), Append(), EndAppend()) are being
##  called directly.
##  virtual void SetAutoAdjustNumberOfDivisionsUseInputPoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseInputPoints  to  << _arg ) ; if ( this -> UseInputPoints != _arg ) { this -> UseInputPoints = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseInputPoints  of  << this -> UseInputPoints ) ; return this -> UseInputPoints ; } ; virtual void UseInputPointsOn ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseInputPointsOff ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  By default, this flag is off.  When "UseFeatureEdges" is on, then
##  quadrics are computed for boundary edges/feature edges.  They influence
##  the quadrics (position of points), but not the mesh.  Which features to
##  use can be controlled by the filter "FeatureEdges".
##  virtual void SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdges ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseFeatureEdges  to  << _arg ) ; if ( this -> UseFeatureEdges != _arg ) { this -> UseFeatureEdges = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdges ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseFeatureEdges  of  << this -> UseFeatureEdges ) ; return this -> UseFeatureEdges ; } ; virtual void UseFeatureEdgesOn ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdges ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseFeatureEdgesOff ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdges ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; vtkFeatureEdges * GetFeatureEdges ( ) { return this -> FeatureEdges ; } /@} /@{ *
##  By default, this flag is off.  It only has an effect when
##  "UseFeatureEdges" is also on.  When "UseFeaturePoints" is on, then
##  quadrics are computed for boundary / feature points used in the boundary
##  / feature edges.  They influence the quadrics (position of points), but
##  not the mesh.
##  virtual void SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePoints ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseFeaturePoints  to  << _arg ) ; if ( this -> UseFeaturePoints != _arg ) { this -> UseFeaturePoints = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseFeaturePoints  of  << this -> UseFeaturePoints ) ; return this -> UseFeaturePoints ; } ; virtual void UseFeaturePointsOn ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePoints ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseFeaturePointsOff ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePoints ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the angle to use in determining whether a point on a boundary /
##  feature edge is a feature point.
##  virtual void SetFeaturePointsAngle ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FeaturePointsAngle  to  << _arg ) ; if ( this -> FeaturePointsAngle != ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ) { this -> FeaturePointsAngle = ( _arg < 0.0 ? 0.0 : ( _arg > 180.0 ? 180.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetFeaturePointsAngleMinValue ( ) { return 0.0 ; } virtual double GetFeaturePointsAngleMaxValue ( ) { return 180.0 ; } ; virtual double GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsFeaturePointsAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FeaturePointsAngle  of  << this -> FeaturePointsAngle ) ; return this -> FeaturePointsAngle ; } ; /@} /@{ *
##  When this flag is on (and it is on by default), then triangles that are
##  completely contained in a bin are added to the bin quadrics.  When the
##  the flag is off the filter operates faster, but the surface may not be
##  as well behaved.
##  virtual void SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTriangles ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseInternalTriangles  to  << _arg ) ; if ( this -> UseInternalTriangles != _arg ) { this -> UseInternalTriangles = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsFeaturePointsAngleUseInternalTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseInternalTriangles  of  << this -> UseInternalTriangles ) ; return this -> UseInternalTriangles ; } ; virtual void UseInternalTrianglesOn ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTriangles ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void UseInternalTrianglesOff ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTriangles ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  These methods provide an alternative way of executing the filter.
##  PolyData can be added to the result in pieces (append).
##  In this mode, the user must specify the bounds of the entire model
##  as an argument to the "StartAppend" method.
##  void StartAppend ( double * bounds ) ; void StartAppend ( double x0 , double x1 , double y0 , double y1 , double z0 , double z1 ) { double b [ 6 ] ; b [ 0 ] = x0 ; b [ 1 ] = x1 ; b [ 2 ] = y0 ; b [ 3 ] = y1 ; b [ 4 ] = z0 ; b [ 5 ] = z1 ; this -> StartAppend ( b ) ; } void Append ( vtkPolyData * piece ) ; void EndAppend ( ) ; /@} /@{ *
##  This flag makes the filter copy cell data from input to output
##  (the best it can).  It uses input cells that trigger the addition
##  of output cells (no averaging).  This is off by default, and does
##  not work when append is being called explicitly (non-pipeline usage).
##  virtual void SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTrianglesCopyCellData ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CopyCellData  to  << _arg ) ; if ( this -> CopyCellData != _arg ) { this -> CopyCellData = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsFeaturePointsAngleUseInternalTrianglesCopyCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyCellData  of  << this -> CopyCellData ) ; return this -> CopyCellData ; } ; virtual void CopyCellDataOn ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTrianglesCopyCellData ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void CopyCellDataOff ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTrianglesCopyCellData ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify a boolean indicating whether to remove duplicate cells
##  (i.e. triangles).  This is a little slower, and takes more memory, but
##  in some cases can reduce the number of cells produced by an order of
##  magnitude. By default, this flag is true.
##  virtual void SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTrianglesCopyCellDataPreventDuplicateCells ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PreventDuplicateCells  to  << _arg ) ; if ( this -> PreventDuplicateCells != _arg ) { this -> PreventDuplicateCells = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetNumberOfXDivisionsNumberOfYDivisionsNumberOfZDivisionsAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsFeaturePointsAngleUseInternalTrianglesCopyCellDataPreventDuplicateCells ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreventDuplicateCells  of  << this -> PreventDuplicateCells ) ; return this -> PreventDuplicateCells ; } ; virtual void PreventDuplicateCellsOn ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTrianglesCopyCellDataPreventDuplicateCells ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PreventDuplicateCellsOff ( ) { this -> SetAutoAdjustNumberOfDivisionsUseInputPointsUseFeatureEdgesUseFeaturePointsUseInternalTrianglesCopyCellDataPreventDuplicateCells ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkQuadricClustering ( ) ; ~ vtkQuadricClustering ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; *
##  Given a point, determine what bin it falls into.
##  vtkIdType HashPoint ( double point [ 3 ] ) ; *
##  Determine the representative point for this bin.
##  void ComputeRepresentativePoint ( double quadric [ 9 ] , vtkIdType binId , double point [ 3 ] ) ; /@{ *
##  Add triangles to the quadric array.  If geometry flag is on then
##  triangles are added to the output.
##  void AddPolygons ( vtkCellArray * polys , vtkPoints * points , int geometryFlag , vtkPolyData * input , vtkPolyData * output ) ; void AddStrips ( vtkCellArray * strips , vtkPoints * points , int geometryFlag , vtkPolyData * input , vtkPolyData * output ) ; void AddTriangle ( vtkIdType * binIds , double * pt0 , double * pt1 , double * pt2 , int geometeryFlag , vtkPolyData * input , vtkPolyData * output ) ; /@} /@{ *
##  Add edges to the quadric array.  If geometry flag is on then
##  edges are added to the output.
##  void AddEdges ( vtkCellArray * edges , vtkPoints * points , int geometryFlag , vtkPolyData * input , vtkPolyData * output ) ; void AddEdge ( vtkIdType * binIds , double * pt0 , double * pt1 , int geometeryFlag , vtkPolyData * input , vtkPolyData * output ) ; /@} /@{ *
##  Add vertices to the quadric array.  If geometry flag is on then
##  vertices are added to the output.
##  void AddVertices ( vtkCellArray * verts , vtkPoints * points , int geometryFlag , vtkPolyData * input , vtkPolyData * output ) ; void AddVertex ( vtkIdType binId , double * pt , int geometryFlag , vtkPolyData * input , vtkPolyData * output ) ; /@} *
##  Initialize the quadric matrix to 0's.
##  void InitializeQuadric ( double quadric [ 9 ] ) ; *
##  Add this quadric to the quadric already associated with this bin.
##  void AddQuadric ( vtkIdType binId , double quadric [ 9 ] ) ; *
##  Find the feature points of a given set of edges.
##  The points returned are (1) those used by only one edge, (2) those
##  used by > 2 edges, and (3) those where the angle between 2 edges
##  using this point is < angle.
##  void FindFeaturePoints ( vtkCellArray * edges , vtkPoints * edgePts , double angle ) ; /@{ *
##  This method will rep[lace the quadric generated points with the
##  input points with the lowest error.
##  void EndAppendUsingPoints ( vtkPolyData * input , vtkPolyData * output ) ; vtkTypeBool UseInputPoints ; /@} *
##  This method sets the vertices of the output.
##  It duplicates the structure of the input cells (but decimiated).
##  void EndAppendVertexGeometry ( vtkPolyData * input , vtkPolyData * output ) ;  Unfinished option to handle boundary edges differently. void AppendFeatureQuadrics ( vtkPolyData * pd , vtkPolyData * output ) ; vtkTypeBool UseFeatureEdges ; vtkTypeBool UseFeaturePoints ; vtkTypeBool UseInternalTriangles ; int NumberOfXDivisions ; int NumberOfYDivisions ; int NumberOfZDivisions ;  Set this to eliminate duplicate cells vtkTypeBool PreventDuplicateCells ; vtkQuadricClusteringCellSet * CellSet ;  PIMPLd stl set for tracking inserted cells vtkIdType NumberOfBins ;  Used internally.
##  can be smaller than user values when input numb er of points is small. int NumberOfDivisions [ 3 ] ;  Since there are two was of specifying the grid, we have this flag
##  to indicate which the user has set.  When this flag is on,
##  the bin sizes are computed from the DivisionOrigin and DivisionSpacing. int ComputeNumberOfDivisions ; double DivisionOrigin [ 3 ] ; double DivisionSpacing [ 3 ] ; vtkTypeBool AutoAdjustNumberOfDivisions ; double Bounds [ 6 ] ; double XBinSize ; double YBinSize ; double ZBinSize ; double XBinStep ;  replace some divisions with multiplication double YBinStep ; double ZBinStep ; vtkIdType SliceSize ;  eliminate one multiplication struct PointQuadric { PointQuadric ( ) : VertexId ( - 1 ) , Dimension ( 255 ) { } vtkIdType VertexId ;  Dimension is supposed to be a flag representing the dimension of the
##  cells contributing to the quadric.  Lines: 1, Triangles: 2 (and points
##  0 in the future?) unsigned char Dimension ; double Quadric [ 9 ] ; } ; PointQuadric * QuadricArray ; vtkIdType NumberOfBinsUsed ;  Have to make these instance variables if we are going to allow
##  the algorithm to be driven by the Append methods. vtkCellArray * OutputTriangleArray ; vtkCellArray * OutputLines ; vtkFeatureEdges * FeatureEdges ; vtkPoints * FeaturePoints ; double FeaturePointsAngle ; vtkTypeBool CopyCellData ; int InCellCount ; int OutCellCount ; private : vtkQuadricClustering ( const vtkQuadricClustering & ) = delete ; void operator = ( const vtkQuadricClustering & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
