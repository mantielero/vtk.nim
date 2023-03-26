## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFlyingEdges3D.h
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
##  @class   vtkFlyingEdges3D
##  @brief   generate isosurface from 3D image data (volume)
##
##  vtkFlyingEdges3D is a reference implementation of the 3D version of the
##  flying edges algorithm. It is designed to be highly scalable (i.e.,
##  parallelizable) for large data. It implements certain performance
##  optimizations including computational trimming to rapidly eliminate
##  processing of data regions, packed bit representation of case table
##  values, single edge intersection, elimination of point merging, and
##  elimination of any reallocs (due to dynamic data insertion). Note that
##  computational trimming is a method to reduce total computational cost in
##  which partial computational results can be used to eliminate future
##  computations.
##
##  This is a four-pass algorithm. The first pass processes all x-edges and
##  builds x-edge case values (which, when the four x-edges defining a voxel
##  are combined, are equivalent to vertex-based case table except edge-based
##  approaches are separable in support of parallel computing). Next x-voxel
##  rows are processed to gather information from yz-edges (basically to count
##  the number of y-z edge intersections and triangles generated). In the third
##  pass a prefix sum is used to count and allocate memory for the output
##  primitives. Finally in the fourth pass output primitives are generated into
##  pre-allocated arrays. This implementation uses voxel cell axes (a x-y-z
##  triad located at the voxel origin) to ensure that each edge is intersected
##  at most one time. Note that this implementation also reuses the VTK
##  Marching Cubes case table, although the vertex-based MC table is
##  transformed into an edge-based table on object instantiation.
##
##  See the paper "Flying Edges: A High-Performance Scalable Isocontouring
##  Algorithm" by Schroeder, Maynard, Geveci. Proc. of LDAV 2015. Chicago, IL.
##
##  @warning
##  This filter is specialized to 3D volumes. This implementation can produce
##  degenerate triangles (i.e., zero-area triangles).
##
##  @warning
##  If you are interested in extracting segmented regions from a label mask,
##  consider using vtkDiscreteFlyingEdges3D.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkContourFilter vtkFlyingEdges2D vtkSynchronizedTemplates3D
##  vtkMarchingCubes vtkDiscreteFlyingEdges3D vtkContour3DLinearGrid
##  vtkFlyingEdgesPlaneCutter
##

import
  vtkContourValues, vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkImageData"
type
  vtkFlyingEdges3D* {.importcpp: "vtkFlyingEdges3D", header: "vtkFlyingEdges3D.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkFlyingEdges3D* {.importc: "vtkFlyingEdges3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFlyingEdges3D {.importcpp: "vtkFlyingEdges3D::New(@)",
                                header: "vtkFlyingEdges3D.h".}
type
  vtkFlyingEdges3DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFlyingEdges3D::IsTypeOf(@)", header: "vtkFlyingEdges3D.h".}
proc IsA*(this: var vtkFlyingEdges3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFlyingEdges3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFlyingEdges3D {.
    importcpp: "vtkFlyingEdges3D::SafeDownCast(@)", header: "vtkFlyingEdges3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFlyingEdges3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFlyingEdges3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFlyingEdges3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFlyingEdges3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFlyingEdges3D.h".}
proc GetMTime*(this: var vtkFlyingEdges3D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkFlyingEdges3D.h".}
proc SetComputeNormals*(this: var vtkFlyingEdges3D; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormals", header: "vtkFlyingEdges3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ;
## Error: expected ';'!!!

proc ComputeNormalsOn*(this: var vtkFlyingEdges3D) {.importcpp: "ComputeNormalsOn",
    header: "vtkFlyingEdges3D.h".}
proc ComputeNormalsOff*(this: var vtkFlyingEdges3D) {.
    importcpp: "ComputeNormalsOff", header: "vtkFlyingEdges3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of gradients. Gradient computation is fairly
  ##  expensive in both time and storage. Note that if ComputeNormals is on,
  ##  gradients will have to be calculated, but will not be stored in the
  ##  output dataset. If the output data will be processed by filters that
  ##  modify topology or geometry, it may be wise to turn Normals and
  ##  Gradients off.
  ##
proc SetComputeNormalsComputeGradients*(this: var vtkFlyingEdges3D;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradients", header: "vtkFlyingEdges3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ;
## Error: expected ';'!!!

proc ComputeGradientsOn*(this: var vtkFlyingEdges3D) {.
    importcpp: "ComputeGradientsOn", header: "vtkFlyingEdges3D.h".}
proc ComputeGradientsOff*(this: var vtkFlyingEdges3D) {.
    importcpp: "ComputeGradientsOff", header: "vtkFlyingEdges3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of scalars.
  ##
proc SetComputeNormalsComputeGradientsComputeScalars*(this: var vtkFlyingEdges3D;
    _arg: vtkTypeBool) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalars",
                       header: "vtkFlyingEdges3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkFlyingEdges3D) {.importcpp: "ComputeScalarsOn",
    header: "vtkFlyingEdges3D.h".}
proc ComputeScalarsOff*(this: var vtkFlyingEdges3D) {.
    importcpp: "ComputeScalarsOff", header: "vtkFlyingEdges3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether to interpolate other attribute data. That is, as the
  ##  isosurface is generated, interpolate all point attribute data across
  ##  the edge. This is independent of scalar interpolation, which is
  ##  controlled by the ComputeScalars flag.
  ##
proc SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributes*(
    this: var vtkFlyingEdges3D; _arg: vtkTypeBool) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributes",
    header: "vtkFlyingEdges3D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ;
## Error: expected ';'!!!

proc InterpolateAttributesOn*(this: var vtkFlyingEdges3D) {.
    importcpp: "InterpolateAttributesOn", header: "vtkFlyingEdges3D.h".}
proc InterpolateAttributesOff*(this: var vtkFlyingEdges3D) {.
    importcpp: "InterpolateAttributesOff", header: "vtkFlyingEdges3D.h".}
  ## /@}
  ## *
  ##  Set a particular contour value at contour number i. The index i ranges
  ##  between 0<=i<NumberOfContours.
  ##
proc SetValue*(this: var vtkFlyingEdges3D; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkFlyingEdges3D.h".}
proc GetValue*(this: var vtkFlyingEdges3D; i: cint): cdouble {.importcpp: "GetValue",
    header: "vtkFlyingEdges3D.h".}
proc GetValues*(this: var vtkFlyingEdges3D): ptr cdouble {.importcpp: "GetValues",
    header: "vtkFlyingEdges3D.h".}
proc GetValues*(this: var vtkFlyingEdges3D; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkFlyingEdges3D.h".}
proc SetNumberOfContours*(this: var vtkFlyingEdges3D; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkFlyingEdges3D.h".}
proc GetNumberOfContours*(this: var vtkFlyingEdges3D): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkFlyingEdges3D.h".}
proc GenerateValues*(this: var vtkFlyingEdges3D; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkFlyingEdges3D.h".}
proc GenerateValues*(this: var vtkFlyingEdges3D; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkFlyingEdges3D.h".}
proc SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributesArrayComponent*(
    this: var vtkFlyingEdges3D; _arg: cint) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributesArrayComponent",
    header: "vtkFlyingEdges3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributesArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!
