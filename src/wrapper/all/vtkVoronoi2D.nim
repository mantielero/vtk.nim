## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVoronoi2D.h
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
##  @class   vtkVoronoi2D
##  @brief   create 2D Voronoi convex tiling of input points
##
##  vtkVoronoi2D is a filter that constructs a 2D Voronoi tessellation of a
##  list of input points. The points are assumed to lie in a plane. These
##  points may be represented by any dataset of type vtkPointSet and
##  subclasses. The output of the filter is a polygonal dataset. Each output
##  cell is a convex polygon.
##
##  The 2D Voronoi tessellation is a tiling of space, where each Voronoi tile
##  represents the region nearest to one of the input points. Voronoi
##  tessellations are important in computational geometry (and many other
##  fields), and are the dual of Delaunay triangulations.
##
##  The input to this filter is a list of points specified in 3D, even though
##  the triangulation is 2D. Thus the triangulation is constructed in the x-y
##  plane, and the z coordinate is ignored (although carried through to the
##  output). If you desire to triangulate in a different plane, you can use
##  the vtkTransformFilter to transform the points into and out of the x-y
##  plane or you can specify a transform to vtkVoronoi2D directly.  In the
##  latter case, the input points are transformed, the transformed points are
##  triangulated, and the output will use the triangulated topology for the
##  original (non-transformed) points.  This avoids transforming the data back
##  as would be required when using the vtkTransformFilter method.  Specifying
##  a transform directly also allows any transform to be used: rigid,
##  non-rigid, non-invertible, etc.
##
##  This filter is a reference implementation written with simplicity in
##  mind. Additional methods are available for debugging / instructional
##  purposes. This includes producing a single tile under various stages of
##  creation, as well as the Voronoi flower, related to the error metric for
##  point insertion / half-space clipping.
##
##  Publications are in preparation to describe the algorithm. A brief summary
##  is as follows. In parallel, each (generating) input point is associated
##  with an initial Voronoi tile, which is simply the bounding box of the
##  point set. A locator is then used to identify nearby points: each neighbor
##  in turn generates a clipping line positioned halfway between the
##  generating point and the neighboring point, and orthogonal to the line
##  connecting them. Clips are readily performed by evaluationg the vertices
##  of the convex Voronoi tile as being on either side (inside,outside) of the
##  clip line. If two intersections of the Voronoi tile are found, the portion
##  of the tile "outside" the clip line is discarded, resulting in a new
##  convex, Voronoi tile. As each clip occurs, the Voronoi "Flower" error
##  metric (the union of error spheres) is compared to the extent of the
##  region containing the neighboring clip points. The clip region (along with
##  the points contained in it) is grown by careful expansion (e.g., outward
##  spiraling iterator over all candidate clip points). When the Voronoi
##  Flower is contained within the clip region, the algorithm terminates and
##  the Voronoi tile is output. Once complete, it is possible to construct the
##  Delaunay triangulation from the Voronoi tessellation. Note that
##  topological and geometric information is used to generate a valid
##  triangulation (e.g., merging points and validating topology).
##
##  @warning
##  Coincident input points will result in overlapping tiles.  This is because
##  the Voronoi tessellation requires unique input points.
##
##  @warning
##  This is a novel approach which implements an embarrassingly parallel
##  algorithm. At the core of the algorithm a locator is used to determine
##  points close to a specified position. A vtkStaticPointLocator2D is used
##  because it is both threaded (when constructed) and supports thread-safe
##  queries. While other locators could be used in principal, they must
##  support thread-safe operations.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkDelaunay2D vtkTransformFilter vtkStaticPointLocator2D
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkStaticPointLocator2D"
discard "forward decl of vtkAbstractTransform"
discard "forward decl of vtkPointSet"
discard "forward decl of vtkSpheres"
type
  vtkVoronoi2D* {.importcpp: "vtkVoronoi2D", header: "vtkVoronoi2D.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                       ## *
                                                                                                       ##  Standard methods for instantiation, type information, and printing.
                                                                                                       ##
    vtkVoronoi2D* {.importc: "vtkVoronoi2D".}: VTK_NEWINSTANCE
    ##  selects the plane in 3D where the tessellation will be computed
    ##  Satisfy pipeline-related API


proc New*(): ptr vtkVoronoi2D {.importcpp: "vtkVoronoi2D::New(@)",
                            header: "vtkVoronoi2D.h".}
type
  vtkVoronoi2DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVoronoi2D::IsTypeOf(@)", header: "vtkVoronoi2D.h".}
proc IsA*(this: var vtkVoronoi2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVoronoi2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVoronoi2D {.
    importcpp: "vtkVoronoi2D::SafeDownCast(@)", header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVoronoi2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVoronoi2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVoronoi2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVoronoi2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVoronoi2D.h".}
proc SetPadding*(this: var vtkVoronoi2D; _arg: cdouble) {.importcpp: "SetPadding",
    header: "vtkVoronoi2D.h".}
proc GetPaddingMinValue*(this: var vtkVoronoi2D): cdouble {.
    importcpp: "GetPaddingMinValue", header: "vtkVoronoi2D.h".}
proc GetPaddingMaxValue*(this: var vtkVoronoi2D): cdouble {.
    importcpp: "GetPaddingMaxValue", header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  virtual double GetPadding ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Padding  of  << this -> Padding ) ; return this -> Padding ; } ;
## Error: expected ';'!!!

type
  vtkVoronoi2DGenerateScalarsStrategy* {.size: sizeof(cint), importcpp: "vtkVoronoi2D::GenerateScalarsStrategy",
                                        header: "vtkVoronoi2D.h".} = enum
    NONE = 0, POINT_IDS = 1, THREAD_IDS = 2


proc SetGenerateScalars*(this: var vtkVoronoi2D; _arg: cint) {.
    importcpp: "SetGenerateScalars", header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  virtual int GetPaddingGenerateScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateScalars  of  << this -> GenerateScalars ) ; return this -> GenerateScalars ; } ;
## Error: expected ';'!!!

proc SetGenerateScalarsToNone*(this: var vtkVoronoi2D) {.
    importcpp: "SetGenerateScalarsToNone", header: "vtkVoronoi2D.h".}
proc SetGenerateScalarsToPointIds*(this: var vtkVoronoi2D) {.
    importcpp: "SetGenerateScalarsToPointIds", header: "vtkVoronoi2D.h".}
proc SetGenerateScalarsToThreadIds*(this: var vtkVoronoi2D) {.
    importcpp: "SetGenerateScalarsToThreadIds", header: "vtkVoronoi2D.h".}
proc SetTransform*(this: var vtkVoronoi2D; a2: ptr vtkAbstractTransform) {.
    importcpp: "SetTransform", header: "vtkVoronoi2D.h".}
proc GetnameTransform*(this: var vtkVoronoi2D): ptr vtkAbstractTransform {.
    importcpp: "GetnameTransform", header: "vtkVoronoi2D.h".}
  ## /@}
type
  vtkVoronoi2DProjectionPlaneStrategy* {.size: sizeof(cint), importcpp: "vtkVoronoi2D::ProjectionPlaneStrategy",
                                        header: "vtkVoronoi2D.h".} = enum
    XY_PLANE = 0, SPECIFIED_TRANSFORM_PLANE = 1, BEST_FITTING_PLANE = 2


proc SetPaddingProjectionPlaneMode*(this: var vtkVoronoi2D; _arg: cint) {.
    importcpp: "SetPaddingProjectionPlaneMode", header: "vtkVoronoi2D.h".}
proc GetPaddingMinValueProjectionPlaneModeMinValue*(this: var vtkVoronoi2D): cint {.
    importcpp: "GetPaddingMinValueProjectionPlaneModeMinValue",
    header: "vtkVoronoi2D.h".}
proc GetPaddingMaxValueProjectionPlaneModeMaxValue*(this: var vtkVoronoi2D): cint {.
    importcpp: "GetPaddingMaxValueProjectionPlaneModeMaxValue",
    header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  virtual int GetPaddingGenerateScalarsProjectionPlaneMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProjectionPlaneMode  of  << this -> ProjectionPlaneMode ) ; return this -> ProjectionPlaneMode ; } ;
## Error: expected ';'!!!

proc SetProjectionPlaneModeToXYPlane*(this: var vtkVoronoi2D) {.
    importcpp: "SetProjectionPlaneModeToXYPlane", header: "vtkVoronoi2D.h".}
proc SetProjectionPlaneModeToSpecifiedTransformPlane*(this: var vtkVoronoi2D) {.
    importcpp: "SetProjectionPlaneModeToSpecifiedTransformPlane",
    header: "vtkVoronoi2D.h".}
proc SetProjectionPlaneModeToBestFittingPlane*(this: var vtkVoronoi2D) {.
    importcpp: "SetProjectionPlaneModeToBestFittingPlane",
    header: "vtkVoronoi2D.h".}
proc SetPaddingProjectionPlaneModePointOfInterest*(this: var vtkVoronoi2D;
    _arg: vtkIdType) {.importcpp: "SetPaddingProjectionPlaneModePointOfInterest",
                     header: "vtkVoronoi2D.h".}
proc GetPaddingMinValueProjectionPlaneModeMinValuePointOfInterestMinValue*(
    this: var vtkVoronoi2D): vtkIdType {.importcpp: "GetPaddingMinValueProjectionPlaneModeMinValuePointOfInterestMinValue",
                                     header: "vtkVoronoi2D.h".}
proc GetPaddingMaxValueProjectionPlaneModeMaxValuePointOfInterestMaxValue*(
    this: var vtkVoronoi2D): vtkIdType {.importcpp: "GetPaddingMaxValueProjectionPlaneModeMaxValuePointOfInterestMaxValue",
                                     header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  virtual vtkIdType GetPaddingGenerateScalarsProjectionPlaneModePointOfInterest ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointOfInterest  of  << this -> PointOfInterest ) ; return this -> PointOfInterest ; } ;
## Error: expected ';'!!!

proc SetPaddingProjectionPlaneModePointOfInterestMaximumNumberOfTileClips*(
    this: var vtkVoronoi2D; _arg: vtkIdType) {.importcpp: "SetPaddingProjectionPlaneModePointOfInterestMaximumNumberOfTileClips",
    header: "vtkVoronoi2D.h".}
proc GetPaddingMinValueProjectionPlaneModeMinValuePointOfInterestMinValueMaximumNumberOfTileClipsMinValue*(
    this: var vtkVoronoi2D): vtkIdType {.importcpp: "GetPaddingMinValueProjectionPlaneModeMinValuePointOfInterestMinValueMaximumNumberOfTileClipsMinValue",
                                     header: "vtkVoronoi2D.h".}
proc GetPaddingMaxValueProjectionPlaneModeMaxValuePointOfInterestMaxValueMaximumNumberOfTileClipsMaxValue*(
    this: var vtkVoronoi2D): vtkIdType {.importcpp: "GetPaddingMaxValueProjectionPlaneModeMaxValuePointOfInterestMaxValueMaximumNumberOfTileClipsMaxValue",
                                     header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  virtual vtkIdType GetPaddingGenerateScalarsProjectionPlaneModePointOfInterestMaximumNumberOfTileClips ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfTileClips  of  << this -> MaximumNumberOfTileClips ) ; return this -> MaximumNumberOfTileClips ; } ;
## Error: expected ';'!!!

proc GetLocator*(this: var vtkVoronoi2D): ptr vtkStaticPointLocator2D {.
    importcpp: "GetLocator", header: "vtkVoronoi2D.h".}
proc SetGenerateScalarsGenerateVoronoiFlower*(this: var vtkVoronoi2D;
    _arg: vtkTypeBool) {.importcpp: "SetGenerateScalarsGenerateVoronoiFlower",
                       header: "vtkVoronoi2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPaddingGenerateScalarsProjectionPlaneModePointOfInterestMaximumNumberOfTileClipsGenerateVoronoiFlower ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateVoronoiFlower  of  << this -> GenerateVoronoiFlower ) ; return this -> GenerateVoronoiFlower ; } ;
## Error: expected ';'!!!

proc GenerateVoronoiFlowerOn*(this: var vtkVoronoi2D) {.
    importcpp: "GenerateVoronoiFlowerOn", header: "vtkVoronoi2D.h".}
proc GenerateVoronoiFlowerOff*(this: var vtkVoronoi2D) {.
    importcpp: "GenerateVoronoiFlowerOff", header: "vtkVoronoi2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Return the Voronoi flower (a collection of spheres) for the point of
  ##  interest in the form of a vtkSpheres implicit function. This is valid
  ##  only if GenerateVoronoiFlower and the PointOfInterest are set, and after
  ##  the filter executes. Typically this is used for debugging or educational
  ##  purposes.
  ##
proc GetnameTransformSpheres*(this: var vtkVoronoi2D): ptr vtkSpheres {.
    importcpp: "GetnameTransformSpheres", header: "vtkVoronoi2D.h".}
  ## /@}
  ## *
  ##   Return the number of threads actually used during execution. This is
  ##   valid only after algorithm execution.
  ##
proc GetNumberOfThreadsUsed*(this: var vtkVoronoi2D): cint {.
    importcpp: "GetNumberOfThreadsUsed", header: "vtkVoronoi2D.h".}
proc GetMTime*(this: var vtkVoronoi2D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkVoronoi2D.h".}