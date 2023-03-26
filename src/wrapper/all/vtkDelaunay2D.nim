## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDelaunay2D.h
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
##  @class   vtkDelaunay2D
##  @brief   create 2D Delaunay triangulation of input points
##
##  vtkDelaunay2D is a filter that constructs a 2D Delaunay triangulation from
##  a list of input points. These points may be represented by any dataset of
##  type vtkPointSet and subclasses. The output of the filter is a polygonal
##  dataset. Usually the output is a triangle mesh, but if a non-zero alpha
##  distance value is specified (called the "alpha" value), then only
##  triangles, edges, and vertices laying within the alpha radius are
##  output. In other words, non-zero alpha values may result in arbitrary
##  combinations of triangles, lines, and vertices. (The notion of alpha value
##  is derived from Edelsbrunner's work on "alpha shapes".) Also, it is
##  possible to generate "constrained triangulations" using this filter.
##  A constrained triangulation is one where edges and loops (i.e., polygons)
##  can be defined and the triangulation will preserve them (read on for
##  more information).
##
##  The 2D Delaunay triangulation is defined as the triangulation that
##  satisfies the Delaunay criterion for n-dimensional simplexes (in this case
##  n=2 and the simplexes are triangles). This criterion states that a
##  circumsphere of each simplex in a triangulation contains only the n+1
##  defining points of the simplex. (See "The Visualization Toolkit" text
##  for more information.) In two dimensions, this translates into an optimal
##  triangulation. That is, the maximum interior angle of any triangle is less
##  than or equal to that of any possible triangulation.
##
##  Delaunay triangulations are used to build topological structures
##  from unorganized (or unstructured) points. The input to this filter
##  is a list of points specified in 3D, even though the triangulation
##  is 2D. Thus the triangulation is constructed in the x-y plane, and
##  the z coordinate is ignored (although carried through to the
##  output). If you desire to triangulate in a different plane, you
##  can use the vtkTransformFilter to transform the points into and
##  out of the x-y plane or you can specify a transform to the Delaunay2D
##  directly.  In the latter case, the input points are transformed, the
##  transformed points are triangulated, and the output will use the
##  triangulated topology for the original (non-transformed) points.  This
##  avoids transforming the data back as would be required when using the
##  vtkTransformFilter method.  Specifying a transform directly also allows
##  any transform to be used: rigid, non-rigid, non-invertible, etc.
##
##  If an input transform is used, then alpha values are applied (for the
##  most part) in the original data space.  The exception is when
##  BoundingTriangulation is on.  In this case, alpha values are applied in
##  the original data space unless a cell uses a bounding vertex.
##
##  The Delaunay triangulation can be numerically sensitive in some cases. To
##  prevent problems, try to avoid injecting points that will result in
##  triangles with bad aspect ratios (1000:1 or greater). In practice this
##  means inserting points that are "widely dispersed", and enables smooth
##  transition of triangle sizes throughout the mesh. (You may even want to
##  add extra points to create a better point distribution.) If numerical
##  problems are present, you will see a warning message to this effect at
##  the end of the triangulation process.
##
##  To create constrained meshes, you must define an additional
##  input. This input is an instance of vtkPolyData which contains
##  lines, polylines, and/or polygons that define constrained edges and
##  loops. Only the topology of (lines and polygons) from this second
##  input are used.  The topology is assumed to reference points in the
##  input point set (the one to be triangulated). In other words, the
##  lines and polygons use point ids from the first input point
##  set. Lines and polylines found in the input will be mesh edges in
##  the output. Polygons define a loop with inside and outside
##  regions. The inside of the polygon is determined by using the
##  right-hand-rule, i.e., looking down the z-axis a polygon should be
##  ordered counter-clockwise. Holes in a polygon should be ordered
##  clockwise. If you choose to create a constrained triangulation, the
##  final mesh may not satisfy the Delaunay criterion. (Noted: the
##  lines/polygon edges must not intersect when projected onto the 2D
##  plane.  It may not be possible to recover all edges due to not
##  enough points in the triangulation, or poorly defined edges
##  (coincident or excessively long).  The form of the lines or
##  polygons is a list of point ids that correspond to the input point
##  ids used to generate the triangulation.)
##
##  If an input transform is used, constraints are defined in the
##  "transformed" space.  So when the right hand rule is used for a
##  polygon constraint, that operation is applied using the transformed
##  points.  Since the input transform can be any transformation (rigid
##  or non-rigid), care must be taken in constructing constraints when
##  an input transform is used.
##
##  @warning
##  Points arranged on a regular lattice (termed degenerate cases) can be
##  triangulated in more than one way (at least according to the Delaunay
##  criterion). The choice of triangulation (as implemented by
##  this algorithm) depends on the order of the input points. The first three
##  points will form a triangle; other degenerate points will not break
##  this triangle.
##
##  @warning
##  Points that are coincident (or nearly so) may be discarded by the algorithm.
##  This is because the Delaunay triangulation requires unique input points.
##  You can control the definition of coincidence with the "Tolerance" instance
##  variable.
##
##  @warning
##  The output of the Delaunay triangulation is supposedly a convex hull. In
##  certain cases this implementation may not generate the convex hull. This
##  behavior can be controlled by the Offset instance variable. Offset is a
##  multiplier used to control the size of the initial triangulation. The
##  larger the offset value, the more likely you will generate a convex hull;
##  but the more likely you are to see numerical problems.
##
##  @sa
##  vtkDelaunay3D vtkTransformFilter vtkGaussianSplatter
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkAbstractTransform"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPointSet"
const
  VTK_DELAUNAY_XY_PLANE* = 0
  VTK_SET_TRANSFORM_PLANE* = 1
  VTK_BEST_FITTING_PLANE* = 2

type
  vtkDelaunay2D* {.importcpp: "vtkDelaunay2D", header: "vtkDelaunay2D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkDelaunay2D* {.importc: "vtkDelaunay2D".}: VTK_NEWINSTANCE
    ##  selects the plane in 3D where the Delaunay triangulation will be
    ##  computed.
    ##  the created mesh
    ##  the raw points in double precision

  vtkDelaunay2DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDelaunay2D::IsTypeOf(@)", header: "vtkDelaunay2D.h".}
proc IsA*(this: var vtkDelaunay2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDelaunay2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDelaunay2D {.
    importcpp: "vtkDelaunay2D::SafeDownCast(@)", header: "vtkDelaunay2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDelaunay2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDelaunay2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDelaunay2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDelaunay2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDelaunay2D.h".}
proc New*(): ptr vtkDelaunay2D {.importcpp: "vtkDelaunay2D::New(@)",
                             header: "vtkDelaunay2D.h".}
proc SetSourceData*(this: var vtkDelaunay2D; a2: ptr vtkPolyData) {.
    importcpp: "SetSourceData", header: "vtkDelaunay2D.h".}
proc SetSourceConnection*(this: var vtkDelaunay2D; algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkDelaunay2D.h".}
proc GetSource*(this: var vtkDelaunay2D): ptr vtkPolyData {.importcpp: "GetSource",
    header: "vtkDelaunay2D.h".}
proc SetAlpha*(this: var vtkDelaunay2D; _arg: cdouble) {.importcpp: "SetAlpha",
    header: "vtkDelaunay2D.h".}
proc GetAlphaMinValue*(this: var vtkDelaunay2D): cdouble {.
    importcpp: "GetAlphaMinValue", header: "vtkDelaunay2D.h".}
proc GetAlphaMaxValue*(this: var vtkDelaunay2D): cdouble {.
    importcpp: "GetAlphaMaxValue", header: "vtkDelaunay2D.h".}
## !!!Ignored construct:  virtual double GetAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Alpha  of  << this -> Alpha ) ; return this -> Alpha ; } ;
## Error: expected ';'!!!

proc SetAlphaTolerance*(this: var vtkDelaunay2D; _arg: cdouble) {.
    importcpp: "SetAlphaTolerance", header: "vtkDelaunay2D.h".}
proc GetAlphaMinValueToleranceMinValue*(this: var vtkDelaunay2D): cdouble {.
    importcpp: "GetAlphaMinValueToleranceMinValue", header: "vtkDelaunay2D.h".}
proc GetAlphaMaxValueToleranceMaxValue*(this: var vtkDelaunay2D): cdouble {.
    importcpp: "GetAlphaMaxValueToleranceMaxValue", header: "vtkDelaunay2D.h".}
## !!!Ignored construct:  virtual double GetAlphaTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetAlphaToleranceOffset*(this: var vtkDelaunay2D; _arg: cdouble) {.
    importcpp: "SetAlphaToleranceOffset", header: "vtkDelaunay2D.h".}
proc GetAlphaMinValueToleranceMinValueOffsetMinValue*(this: var vtkDelaunay2D): cdouble {.
    importcpp: "GetAlphaMinValueToleranceMinValueOffsetMinValue",
    header: "vtkDelaunay2D.h".}
proc GetAlphaMaxValueToleranceMaxValueOffsetMaxValue*(this: var vtkDelaunay2D): cdouble {.
    importcpp: "GetAlphaMaxValueToleranceMaxValueOffsetMaxValue",
    header: "vtkDelaunay2D.h".}
## !!!Ignored construct:  virtual double GetAlphaToleranceOffset ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  of  << this -> Offset ) ; return this -> Offset ; } ;
## Error: expected ';'!!!

proc SetBoundingTriangulation*(this: var vtkDelaunay2D; _arg: vtkTypeBool) {.
    importcpp: "SetBoundingTriangulation", header: "vtkDelaunay2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAlphaToleranceOffsetBoundingTriangulation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BoundingTriangulation  of  << this -> BoundingTriangulation ) ; return this -> BoundingTriangulation ; } ;
## Error: expected ';'!!!

proc BoundingTriangulationOn*(this: var vtkDelaunay2D) {.
    importcpp: "BoundingTriangulationOn", header: "vtkDelaunay2D.h".}
proc BoundingTriangulationOff*(this: var vtkDelaunay2D) {.
    importcpp: "BoundingTriangulationOff", header: "vtkDelaunay2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set / get the transform which is applied to points to generate a
  ##  2D problem.  This maps a 3D dataset into a 2D dataset where
  ##  triangulation can be done on the XY plane.  The points are
  ##  transformed and triangulated.  The topology of triangulated
  ##  points is used as the output topology.  The output points are the
  ##  original (untransformed) points.  The transform can be any
  ##  subclass of vtkAbstractTransform (thus it does not need to be a
  ##  linear or invertible transform).
  ##
proc SetTransform*(this: var vtkDelaunay2D; a2: ptr vtkAbstractTransform) {.
    importcpp: "SetTransform", header: "vtkDelaunay2D.h".}
proc GetnameTransform*(this: var vtkDelaunay2D): ptr vtkAbstractTransform {.
    importcpp: "GetnameTransform", header: "vtkDelaunay2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Define the method to project the input 3D points into a 2D plane for
  ##  triangulation. When the VTK_DELAUNAY_XY_PLANE is set, the z-coordinate
  ##  is simply ignored. When VTK_SET_TRANSFORM_PLANE is set, then a transform
  ##  must be supplied and the points are transformed using it. Finally, if
  ##  VTK_BEST_FITTING_PLANE is set, then the filter computes a best fitting
  ##  plane and projects the points onto it.
  ##
proc SetAlphaToleranceOffsetProjectionPlaneMode*(this: var vtkDelaunay2D; _arg: cint) {.
    importcpp: "SetAlphaToleranceOffsetProjectionPlaneMode",
    header: "vtkDelaunay2D.h".}
proc GetAlphaMinValueToleranceMinValueOffsetMinValueProjectionPlaneModeMinValue*(
    this: var vtkDelaunay2D): cint {.importcpp: "GetAlphaMinValueToleranceMinValueOffsetMinValueProjectionPlaneModeMinValue",
                                 header: "vtkDelaunay2D.h".}
proc GetAlphaMaxValueToleranceMaxValueOffsetMaxValueProjectionPlaneModeMaxValue*(
    this: var vtkDelaunay2D): cint {.importcpp: "GetAlphaMaxValueToleranceMaxValueOffsetMaxValueProjectionPlaneModeMaxValue",
                                 header: "vtkDelaunay2D.h".}
## !!!Ignored construct:  virtual int GetAlphaToleranceOffsetBoundingTriangulationProjectionPlaneMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionPlaneMode  of  << this -> ProjectionPlaneMode ) ; return this -> ProjectionPlaneMode ; } ;
## Error: expected ';'!!!

proc ComputeBestFittingPlane*(input: ptr vtkPointSet): ptr vtkAbstractTransform {.
    importcpp: "vtkDelaunay2D::ComputeBestFittingPlane(@)",
    header: "vtkDelaunay2D.h".}