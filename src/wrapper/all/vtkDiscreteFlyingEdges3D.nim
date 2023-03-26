## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDiscreteFlyingEdges3D.h
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
##  @class   vtkDiscreteFlyingEdges3D
##  @brief   generate isosurface from 3D image data (volume)
##
##  vtkDiscreteFlyingEdges3D creates output representations of label maps
##  (e.g., segmented volumes) using a variation of the flying edges
##  algorithm. The input is a 3D image (volume( where each point is labeled
##  (integer labels are preferred to real values), and the output data is
##  polygonal data representing labeled regions. (Note that on output each
##  region [corresponding to a different contour value] is represented
##  independently; i.e., points are not shared between regions even if they
##  are coincident.)
##
##  This filter is similar to but produces different results than the filter
##  vtkDiscreteMarchingCubes. This filter can produce output normals, and each
##  labeled region is completely disconnected from neighboring regions
##  (coincident points are not merged). Both algorithms interpolate edges at
##  the halfway point between vertices with different segmentation labels.
##
##  See the paper "Flying Edges: A High-Performance Scalable Isocontouring
##  Algorithm" by Schroeder, Maynard, Geveci. Proc. of LDAV 2015. Chicago, IL.
##
##  @warning
##  This filter is specialized to 3D volumes. This implementation can produce
##  degenerate triangles (i.e., zero-area triangles).
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkDiscreteMarchingCubes vtkDiscreteFlyingEdges2D vtkDiscreteFlyingEdges3D
##

import
  vtkContourValues, vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkImageData"
type
  vtkDiscreteFlyingEdges3D* {.importcpp: "vtkDiscreteFlyingEdges3D",
                             header: "vtkDiscreteFlyingEdges3D.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkDiscreteFlyingEdges3D* {.importc: "vtkDiscreteFlyingEdges3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDiscreteFlyingEdges3D {.importcpp: "vtkDiscreteFlyingEdges3D::New(@)",
                                        header: "vtkDiscreteFlyingEdges3D.h".}
type
  vtkDiscreteFlyingEdges3DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDiscreteFlyingEdges3D::IsTypeOf(@)",
    header: "vtkDiscreteFlyingEdges3D.h".}
proc IsA*(this: var vtkDiscreteFlyingEdges3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDiscreteFlyingEdges3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDiscreteFlyingEdges3D {.
    importcpp: "vtkDiscreteFlyingEdges3D::SafeDownCast(@)",
    header: "vtkDiscreteFlyingEdges3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDiscreteFlyingEdges3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDiscreteFlyingEdges3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDiscreteFlyingEdges3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDiscreteFlyingEdges3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDiscreteFlyingEdges3D.h".}
proc GetMTime*(this: var vtkDiscreteFlyingEdges3D): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkDiscreteFlyingEdges3D.h".}
proc SetComputeNormals*(this: var vtkDiscreteFlyingEdges3D; _arg: cint) {.
    importcpp: "SetComputeNormals", header: "vtkDiscreteFlyingEdges3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ;
## Error: expected ';'!!!

proc ComputeNormalsOn*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "ComputeNormalsOn", header: "vtkDiscreteFlyingEdges3D.h".}
proc ComputeNormalsOff*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "ComputeNormalsOff", header: "vtkDiscreteFlyingEdges3D.h".}
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
proc SetComputeNormalsComputeGradients*(this: var vtkDiscreteFlyingEdges3D;
                                       _arg: cint) {.
    importcpp: "SetComputeNormalsComputeGradients",
    header: "vtkDiscreteFlyingEdges3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ;
## Error: expected ';'!!!

proc ComputeGradientsOn*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "ComputeGradientsOn", header: "vtkDiscreteFlyingEdges3D.h".}
proc ComputeGradientsOff*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "ComputeGradientsOff", header: "vtkDiscreteFlyingEdges3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of scalars.
  ##
proc SetComputeNormalsComputeGradientsComputeScalars*(
    this: var vtkDiscreteFlyingEdges3D; _arg: cint) {.
    importcpp: "SetComputeNormalsComputeGradientsComputeScalars",
    header: "vtkDiscreteFlyingEdges3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "ComputeScalarsOn", header: "vtkDiscreteFlyingEdges3D.h".}
proc ComputeScalarsOff*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "ComputeScalarsOff", header: "vtkDiscreteFlyingEdges3D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether to interpolate other attribute data. That is, as the
  ##  isosurface is generated, interpolate all point attribute data across
  ##  the edge. This is independent of scalar interpolation, which is
  ##  controlled by the ComputeScalars flag.
  ##
proc SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributes*(
    this: var vtkDiscreteFlyingEdges3D; _arg: cint) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributes",
    header: "vtkDiscreteFlyingEdges3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterpolateAttributes  of  << this -> InterpolateAttributes ) ; return this -> InterpolateAttributes ; } ;
## Error: expected ';'!!!

proc InterpolateAttributesOn*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "InterpolateAttributesOn", header: "vtkDiscreteFlyingEdges3D.h".}
proc InterpolateAttributesOff*(this: var vtkDiscreteFlyingEdges3D) {.
    importcpp: "InterpolateAttributesOff", header: "vtkDiscreteFlyingEdges3D.h".}
  ## /@}
  ## *
  ##  Set a particular contour value at contour number i. The index i ranges
  ##  between 0<=i<NumberOfContours.
  ##
proc SetValue*(this: var vtkDiscreteFlyingEdges3D; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkDiscreteFlyingEdges3D.h".}
proc GetValue*(this: var vtkDiscreteFlyingEdges3D; i: cint): cdouble {.
    importcpp: "GetValue", header: "vtkDiscreteFlyingEdges3D.h".}
proc GetValues*(this: var vtkDiscreteFlyingEdges3D): ptr cdouble {.
    importcpp: "GetValues", header: "vtkDiscreteFlyingEdges3D.h".}
proc GetValues*(this: var vtkDiscreteFlyingEdges3D; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkDiscreteFlyingEdges3D.h".}
proc SetNumberOfContours*(this: var vtkDiscreteFlyingEdges3D; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkDiscreteFlyingEdges3D.h".}
proc GetNumberOfContours*(this: var vtkDiscreteFlyingEdges3D): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkDiscreteFlyingEdges3D.h".}
proc GenerateValues*(this: var vtkDiscreteFlyingEdges3D; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkDiscreteFlyingEdges3D.h".}
proc GenerateValues*(this: var vtkDiscreteFlyingEdges3D; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkDiscreteFlyingEdges3D.h".}
proc SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributesArrayComponent*(
    this: var vtkDiscreteFlyingEdges3D; _arg: cint) {.importcpp: "SetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributesArrayComponent",
    header: "vtkDiscreteFlyingEdges3D.h".}
## !!!Ignored construct:  virtual int GetComputeNormalsComputeGradientsComputeScalarsInterpolateAttributesArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!
