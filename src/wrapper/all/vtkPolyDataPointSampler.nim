## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataPointSampler.h
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
##  @class   vtkPolyDataPointSampler
##  @brief   generate points from vtkPolyData
##
##  vtkPolyDataPointSampler generates points from input vtkPolyData. The
##  filter has two modes of operation: random point generation, or regular
##  point generation. In random generation mode, points are generated in each
##  polygonal entity using a random approach. In regular generation mode, the
##  points are placed approximately a specified distance apart. Optionally,
##  the points attributes can be interpolated from the generating vertices,
##  edges, and polygons.
##
##  In regular point generation mode, this filter functions as follows. First,
##  it regurgitates all input points, then it samples all lines, plus edges
##  associated with the input polygons and triangle strips to produce edge
##  points. Finally, the interiors of polygons and triangle strips are
##  subsampled to produce points. All of these operations can be enabled or
##  disabled separately. Note that this algorithm only approximately generates
##  points the specified distance apart. Generally the point density is finer
##  than requested.
##
##  In random point generation mode, this filter functions as follows. First,
##  it randomly regurgitates all input points (if enabled), then it randomly
##  samples all lines, plus edges associated with the input polygons and
##  triangle strips to produce edge points (if enabled). Finally, the
##  interiors of polygons and triangle strips are randomly subsampled to
##  produce points. All of these operations can be enabled or disabled
##  separately. Note that this algorithm only approximately generates points
##  the specified distance apart. Generally the point density is finer than
##  requested. Also note that the result is not truly random due to the
##  constraints of the mesh construction.
##
##  @warning
##  Although this algorithm processes general polygons. it does so by performing
##  a fan triangulation. This may produce poor results, especially for concave
##  polygons. For better results, use a triangle filter to pre-tesselate
##  polygons.
##
##  @warning
##  In random point generation mode, producing random edges and vertex points
##  from polygons and triangle strips is less random than is typically
##  desirable. You may wish to disable vertex and edge point generation for a
##  result that is closer to random.
##
##  @warning
##  Point generation can be useful in a variety of applications. For example,
##  generating seed points for glyphing or streamline generation. Another
##  useful application is generating points for implicit modeling. In many
##  cases implicit models can be more efficiently generated from points than
##  from polygons or other primitives.
##
##  @warning
##  When sampling polygons of five sides or more, the polygon is triangulated.
##  This can result in variations in point density near tesselation boudaries.
##
##  @sa
##  vtkTriangleFilter vtkImplicitModeller
##

import
  vtkEdgeTable, vtkFiltersModelingModule, vtkNew, vtkPolyDataAlgorithm

type
  vtkPolyDataPointSampler* {.importcpp: "vtkPolyDataPointSampler",
                            header: "vtkPolyDataPointSampler.h", bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                                                                    ##  Instantiate this class.
                                                                                                    ##
    vtkPolyDataPointSampler* {.importc: "vtkPolyDataPointSampler".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyDataPointSampler {.importcpp: "vtkPolyDataPointSampler::New(@)",
                                       header: "vtkPolyDataPointSampler.h".}
type
  vtkPolyDataPointSamplerSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataPointSampler::IsTypeOf(@)",
    header: "vtkPolyDataPointSampler.h".}
proc IsA*(this: var vtkPolyDataPointSampler; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataPointSampler.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataPointSampler {.
    importcpp: "vtkPolyDataPointSampler::SafeDownCast(@)",
    header: "vtkPolyDataPointSampler.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataPointSampler :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataPointSampler :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataPointSampler :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataPointSampler; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataPointSampler.h".}
proc SetDistance*(this: var vtkPolyDataPointSampler; _arg: cdouble) {.
    importcpp: "SetDistance", header: "vtkPolyDataPointSampler.h".}
proc GetDistanceMinValue*(this: var vtkPolyDataPointSampler): cdouble {.
    importcpp: "GetDistanceMinValue", header: "vtkPolyDataPointSampler.h".}
proc GetDistanceMaxValue*(this: var vtkPolyDataPointSampler): cdouble {.
    importcpp: "GetDistanceMaxValue", header: "vtkPolyDataPointSampler.h".}
## !!!Ignored construct:  virtual double GetDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Distance  of  << this -> Distance ) ; return this -> Distance ; } ;
## Error: expected ';'!!!

const
  vtkPolyDataPointSamplerREGULAR_GENERATION* = 0
  vtkPolyDataPointSamplerRANDOM_GENERATION* = 1

proc SetDistancePointGenerationMode*(this: var vtkPolyDataPointSampler; _arg: cint) {.
    importcpp: "SetDistancePointGenerationMode",
    header: "vtkPolyDataPointSampler.h".}
proc GetDistanceMinValuePointGenerationModeMinValue*(
    this: var vtkPolyDataPointSampler): cint {.
    importcpp: "GetDistanceMinValuePointGenerationModeMinValue",
    header: "vtkPolyDataPointSampler.h".}
proc GetDistanceMaxValuePointGenerationModeMaxValue*(
    this: var vtkPolyDataPointSampler): cint {.
    importcpp: "GetDistanceMaxValuePointGenerationModeMaxValue",
    header: "vtkPolyDataPointSampler.h".}
## !!!Ignored construct:  virtual int GetDistancePointGenerationMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointGenerationMode  of  << this -> PointGenerationMode ) ; return this -> PointGenerationMode ; } ;
## Error: expected ';'!!!

proc SetPointGenerationModeToRegular*(this: var vtkPolyDataPointSampler) {.
    importcpp: "SetPointGenerationModeToRegular",
    header: "vtkPolyDataPointSampler.h".}
proc SetPointGenerationModeToRandom*(this: var vtkPolyDataPointSampler) {.
    importcpp: "SetPointGenerationModeToRandom",
    header: "vtkPolyDataPointSampler.h".}
## !!!Ignored construct:  /@} /@{ *
##  Specify/retrieve a boolean flag indicating whether cell vertex points should
##  be output.
##  virtual bool GetDistancePointGenerationModeGenerateVertexPointsGenerateVertexPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateVertexPoints  of  << this -> GenerateVertexPoints ) ; return this -> GenerateVertexPoints ; } ;
## Error: expected ';'!!!

proc SetGenerateVertexPoints*(this: var vtkPolyDataPointSampler; _arg: bool) {.
    importcpp: "SetGenerateVertexPoints", header: "vtkPolyDataPointSampler.h".}
proc GenerateVertexPointsOn*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateVertexPointsOn", header: "vtkPolyDataPointSampler.h".}
proc GenerateVertexPointsOff*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateVertexPointsOff", header: "vtkPolyDataPointSampler.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify/retrieve a boolean flag indicating whether cell edges should
  ##  be sampled to produce output points. The default is true.
  ##
## !!!Ignored construct:  virtual bool GetDistancePointGenerationModeGenerateVertexPointsGenerateVertexPointsGenerateEdgePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateEdgePoints  of  << this -> GenerateEdgePoints ) ; return this -> GenerateEdgePoints ; } ;
## Error: expected ';'!!!

proc SetGenerateVertexPointsGenerateEdgePoints*(
    this: var vtkPolyDataPointSampler; _arg: bool) {.
    importcpp: "SetGenerateVertexPointsGenerateEdgePoints",
    header: "vtkPolyDataPointSampler.h".}
proc GenerateEdgePointsOn*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateEdgePointsOn", header: "vtkPolyDataPointSampler.h".}
proc GenerateEdgePointsOff*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateEdgePointsOff", header: "vtkPolyDataPointSampler.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify/retrieve a boolean flag indicating whether cell interiors should
  ##  be sampled to produce output points. The default is true.
  ##
## !!!Ignored construct:  virtual bool GetDistancePointGenerationModeGenerateVertexPointsGenerateVertexPointsGenerateEdgePointsGenerateInteriorPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateInteriorPoints  of  << this -> GenerateInteriorPoints ) ; return this -> GenerateInteriorPoints ; } ;
## Error: expected ';'!!!

proc SetGenerateVertexPointsGenerateEdgePointsGenerateInteriorPoints*(
    this: var vtkPolyDataPointSampler; _arg: bool) {.importcpp: "SetGenerateVertexPointsGenerateEdgePointsGenerateInteriorPoints",
    header: "vtkPolyDataPointSampler.h".}
proc GenerateInteriorPointsOn*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateInteriorPointsOn", header: "vtkPolyDataPointSampler.h".}
proc GenerateInteriorPointsOff*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateInteriorPointsOff", header: "vtkPolyDataPointSampler.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify/retrieve a boolean flag indicating whether cell vertices should
  ##  be generated. Cell vertices are useful if you actually want to display
  ##  the points (that is, for each point generated, a vertex is generated).
  ##  Recall that VTK only renders vertices and not points.  The default is
  ##  true.
  ##
## !!!Ignored construct:  virtual bool GetDistancePointGenerationModeGenerateVertexPointsGenerateVertexPointsGenerateEdgePointsGenerateInteriorPointsGenerateVertices ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateVertices  of  << this -> GenerateVertices ) ; return this -> GenerateVertices ; } ;
## Error: expected ';'!!!

proc SetGenerateVertexPointsGenerateEdgePointsGenerateInteriorPointsGenerateVertices*(
    this: var vtkPolyDataPointSampler; _arg: bool) {.importcpp: "SetGenerateVertexPointsGenerateEdgePointsGenerateInteriorPointsGenerateVertices",
    header: "vtkPolyDataPointSampler.h".}
proc GenerateVerticesOn*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateVerticesOn", header: "vtkPolyDataPointSampler.h".}
proc GenerateVerticesOff*(this: var vtkPolyDataPointSampler) {.
    importcpp: "GenerateVerticesOff", header: "vtkPolyDataPointSampler.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify/retrieve a boolean flag indicating whether point data should be
  ##  interpolated onto the newly generated points. If enabled, points
  ##  generated from existing vertices will carry the vertex point data;
  ##  points generated from edges will interpolate point data along each edge;
  ##  and interior point data (inside triangles, polygons cells) will be
  ##  interpolated from the cell vertices. By default this is off.
  ##
## !!!Ignored construct:  virtual bool GetDistancePointGenerationModeGenerateVertexPointsGenerateVertexPointsGenerateEdgePointsGenerateInteriorPointsGenerateVerticesInterpolatePointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolatePointData  of  << this -> InterpolatePointData ) ; return this -> InterpolatePointData ; } ;
## Error: expected ';'!!!

proc SetGenerateVertexPointsGenerateEdgePointsGenerateInteriorPointsGenerateVerticesInterpolatePointData*(
    this: var vtkPolyDataPointSampler; _arg: bool) {.importcpp: "SetGenerateVertexPointsGenerateEdgePointsGenerateInteriorPointsGenerateVerticesInterpolatePointData",
    header: "vtkPolyDataPointSampler.h".}
proc InterpolatePointDataOn*(this: var vtkPolyDataPointSampler) {.
    importcpp: "InterpolatePointDataOn", header: "vtkPolyDataPointSampler.h".}
proc InterpolatePointDataOff*(this: var vtkPolyDataPointSampler) {.
    importcpp: "InterpolatePointDataOff", header: "vtkPolyDataPointSampler.h".}
  ## /@}