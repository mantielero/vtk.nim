## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFlyingEdges2D.h
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
##  @class   vtkFlyingEdges2D
##  @brief   generate isoline(s) from a structured points (image) dataset
##
##  vtkFlyingEdges2D is a reference implementation of the 2D version of the
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
##  builds x-edge case values (which, when the two x-edges defining a pixel
##  are combined, are equivalent to vertex-based case table except edge-based
##  approaches are separable to parallel computing). Next x-pixel rows are
##  processed to gather information from y-edges (basically to count the
##  number of edge intersections and lines generated). In the third pass a
##  prefix sum is used to count and allocate memory for the output
##  primitives. Finally in the fourth pass output primitives are generated into
##  pre-allocated arrays. This implementation uses pixel cell axes (a x-y dyad
##  located at the pixel origin) to ensure that each edge is intersected at
##  most one time.
##
##  See the paper "Flying Edges: A High-Performance Scalable Isocontouring
##  Algorithm" by Schroeder, Maynard, Geveci. Proc. of LDAV 2015. Chicago, IL.
##
##  @warning
##  This filter is specialized to 2D images. This implementation can produce
##  degenerate line segments (i.e., zero-length line segments).
##
##  @warning
##  If you are interested in extracting segmented regions from a label mask,
##  consider using vtkDiscreteFlyingEdges2D.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkFlyingEdges3D vtkContourFilter vtkSynchronizedTemplates2D
##  vtkMarchingSquares vtkDiscreteFlyingEdges2D
##

import
  vtkContourValues, vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkImageData"
type
  vtkFlyingEdges2D* {.importcpp: "vtkFlyingEdges2D", header: "vtkFlyingEdges2D.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkFlyingEdges2D* {.importc: "vtkFlyingEdges2D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFlyingEdges2D {.importcpp: "vtkFlyingEdges2D::New(@)",
                                header: "vtkFlyingEdges2D.h".}
type
  vtkFlyingEdges2DSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFlyingEdges2D::IsTypeOf(@)", header: "vtkFlyingEdges2D.h".}
proc IsA*(this: var vtkFlyingEdges2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkFlyingEdges2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFlyingEdges2D {.
    importcpp: "vtkFlyingEdges2D::SafeDownCast(@)", header: "vtkFlyingEdges2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFlyingEdges2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFlyingEdges2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFlyingEdges2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFlyingEdges2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFlyingEdges2D.h".}
proc GetMTime*(this: var vtkFlyingEdges2D): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkFlyingEdges2D.h".}
proc SetValue*(this: var vtkFlyingEdges2D; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkFlyingEdges2D.h".}
proc GetValue*(this: var vtkFlyingEdges2D; i: cint): cdouble {.importcpp: "GetValue",
    header: "vtkFlyingEdges2D.h".}
proc GetValues*(this: var vtkFlyingEdges2D): ptr cdouble {.importcpp: "GetValues",
    header: "vtkFlyingEdges2D.h".}
proc GetValues*(this: var vtkFlyingEdges2D; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkFlyingEdges2D.h".}
proc SetNumberOfContours*(this: var vtkFlyingEdges2D; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkFlyingEdges2D.h".}
proc GetNumberOfContours*(this: var vtkFlyingEdges2D): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkFlyingEdges2D.h".}
proc GenerateValues*(this: var vtkFlyingEdges2D; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkFlyingEdges2D.h".}
proc GenerateValues*(this: var vtkFlyingEdges2D; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkFlyingEdges2D.h".}
proc SetComputeScalars*(this: var vtkFlyingEdges2D; _arg: vtkTypeBool) {.
    importcpp: "SetComputeScalars", header: "vtkFlyingEdges2D.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkFlyingEdges2D) {.importcpp: "ComputeScalarsOn",
    header: "vtkFlyingEdges2D.h".}
proc ComputeScalarsOff*(this: var vtkFlyingEdges2D) {.
    importcpp: "ComputeScalarsOff", header: "vtkFlyingEdges2D.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get which component of the scalar array to contour on; defaults to 0.
  ##
proc SetComputeScalarsArrayComponent*(this: var vtkFlyingEdges2D; _arg: cint) {.
    importcpp: "SetComputeScalarsArrayComponent", header: "vtkFlyingEdges2D.h".}
## !!!Ignored construct:  virtual int GetComputeScalarsArrayComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayComponent  of  << this -> ArrayComponent ) ; return this -> ArrayComponent ; } ;
## Error: expected ';'!!!
