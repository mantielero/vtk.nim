## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAdaptiveSubdivisionFilter.h
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
##  @class   vtkAdaptiveSubdivisionFilter
##  @brief   subdivide triangles based on edge and/or area metrics
##
##
##  vtkAdaptiveSubdivisionFilter is a filter that subdivides triangles based
##  on maximum edge length and/or triangle area. It uses a simple case-based,
##  multi-pass approach to repeatedly subdivide the input triangle mesh to
##  meet the area and/or edge length criteria. New points may be inserted only
##  on edges; depending on the number of edges to be subdivided a different
##  number of triangles are inserted ranging from two (i.e., two triangles
##  replace the original one) to four.
##
##  Triangle subdivision is controlled by specifying a maximum edge length
##  and/or triangle area that any given triangle may have. Subdivision
##  proceeds until their criteria are satisfied. Note that using excessively
##  small criteria values can produce enormous meshes with the possibility of
##  exhausting system memory. Also, if you want to ignore a particular
##  criterion value (e.g., triangle area) then simply set the criterion value
##  to a very large value (e.g., VTK_DOUBLE_MAX).
##
##  An incremental point locator is used because as new points are created, a
##  search is made to ensure that a point has not already been created. This
##  ensures that the mesh remains compatible (watertight) as long as certain
##  criteria are not used (triangle area limit, and number of triangles limit).
##
##  To prevent overly large triangle meshes from being created, it is possible
##  to set a limit on the number of triangles created. By default this number
##  is a very large number (i.e., no limit). Further, a limit on the number of
##  passes can also be set, this is mostly useful to generated animations of
##  the algorithm.
##
##  Finally, the attribute data (point and cell data) is treated as follows.
##  The cell data from a parent triangle is assigned to its subdivided
##  children.  Point data is interpolated along edges as the edges are
##  subdivided.
##
##  @warning
##  The subdivision is linear along edges. Thus do not expect smoothing or
##  blending effects to occur. If you need to smooth the resulting mesh use an
##  algorithm like vtkWindowedSincPolyDataFilter or vtkSmoothPolyDataFilter.
##
##  The filter retains mesh compatibility (watertightness) if the mesh was
##  originally compatible; and the area, max triangles criteria are not used.
##
##  @warning
##  The filter requires a triangle mesh. Use vtkTriangleFilter to tessellate
##  the mesh if necessary.
##
##  @sa
##  vtkInterpolatingSubdivisionFilter vtkLinearSubdivisionFilter
##  vtkButterflySubdivisionFilter vtkTriangleFilter
##

import
  vtkFiltersModelingModule, vtkPolyDataAlgorithm

discard "forward decl of vtkIncrementalPointLocator"
type
  vtkAdaptiveSubdivisionFilter* {.importcpp: "vtkAdaptiveSubdivisionFilter",
                                 header: "vtkAdaptiveSubdivisionFilter.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                              ## *
                                                                                                              ##  Standard methods for instantiation, type info, and printing.
                                                                                                              ##
    vtkAdaptiveSubdivisionFilter* {.importc: "vtkAdaptiveSubdivisionFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAdaptiveSubdivisionFilter {.
    importcpp: "vtkAdaptiveSubdivisionFilter::New(@)",
    header: "vtkAdaptiveSubdivisionFilter.h".}
type
  vtkAdaptiveSubdivisionFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAdaptiveSubdivisionFilter::IsTypeOf(@)",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc IsA*(this: var vtkAdaptiveSubdivisionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAdaptiveSubdivisionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAdaptiveSubdivisionFilter {.
    importcpp: "vtkAdaptiveSubdivisionFilter::SafeDownCast(@)",
    header: "vtkAdaptiveSubdivisionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAdaptiveSubdivisionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAdaptiveSubdivisionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAdaptiveSubdivisionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAdaptiveSubdivisionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkAdaptiveSubdivisionFilter.h".}
proc SetMaximumEdgeLength*(this: var vtkAdaptiveSubdivisionFilter; _arg: cdouble) {.
    importcpp: "SetMaximumEdgeLength", header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMinValue*(this: var vtkAdaptiveSubdivisionFilter): cdouble {.
    importcpp: "GetMaximumEdgeLengthMinValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMaxValue*(this: var vtkAdaptiveSubdivisionFilter): cdouble {.
    importcpp: "GetMaximumEdgeLengthMaxValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
## !!!Ignored construct:  virtual double GetMaximumEdgeLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumEdgeLength  of  << this -> MaximumEdgeLength ) ; return this -> MaximumEdgeLength ; } ;
## Error: expected ';'!!!

proc SetMaximumEdgeLengthMaximumTriangleArea*(
    this: var vtkAdaptiveSubdivisionFilter; _arg: cdouble) {.
    importcpp: "SetMaximumEdgeLengthMaximumTriangleArea",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMinValueMaximumTriangleAreaMinValue*(
    this: var vtkAdaptiveSubdivisionFilter): cdouble {.
    importcpp: "GetMaximumEdgeLengthMinValueMaximumTriangleAreaMinValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMaxValueMaximumTriangleAreaMaxValue*(
    this: var vtkAdaptiveSubdivisionFilter): cdouble {.
    importcpp: "GetMaximumEdgeLengthMaxValueMaximumTriangleAreaMaxValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
## !!!Ignored construct:  virtual double GetMaximumEdgeLengthMaximumTriangleArea ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumTriangleArea  of  << this -> MaximumTriangleArea ) ; return this -> MaximumTriangleArea ; } ;
## Error: expected ';'!!!

proc SetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTriangles*(
    this: var vtkAdaptiveSubdivisionFilter; _arg: vtkIdType) {.importcpp: "SetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTriangles",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMinValueMaximumTriangleAreaMinValueMaximumNumberOfTrianglesMinValue*(
    this: var vtkAdaptiveSubdivisionFilter): vtkIdType {.importcpp: "GetMaximumEdgeLengthMinValueMaximumTriangleAreaMinValueMaximumNumberOfTrianglesMinValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMaxValueMaximumTriangleAreaMaxValueMaximumNumberOfTrianglesMaxValue*(
    this: var vtkAdaptiveSubdivisionFilter): vtkIdType {.importcpp: "GetMaximumEdgeLengthMaxValueMaximumTriangleAreaMaxValueMaximumNumberOfTrianglesMaxValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTriangles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfTriangles  of  << this -> MaximumNumberOfTriangles ) ; return this -> MaximumNumberOfTriangles ; } ;
## Error: expected ';'!!!

proc SetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTrianglesMaximumNumberOfPasses*(
    this: var vtkAdaptiveSubdivisionFilter; _arg: vtkIdType) {.importcpp: "SetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTrianglesMaximumNumberOfPasses",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMinValueMaximumTriangleAreaMinValueMaximumNumberOfTrianglesMinValueMaximumNumberOfPassesMinValue*(
    this: var vtkAdaptiveSubdivisionFilter): vtkIdType {.importcpp: "GetMaximumEdgeLengthMinValueMaximumTriangleAreaMinValueMaximumNumberOfTrianglesMinValueMaximumNumberOfPassesMinValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMaximumEdgeLengthMaxValueMaximumTriangleAreaMaxValueMaximumNumberOfTrianglesMaxValueMaximumNumberOfPassesMaxValue*(
    this: var vtkAdaptiveSubdivisionFilter): vtkIdType {.importcpp: "GetMaximumEdgeLengthMaxValueMaximumTriangleAreaMaxValueMaximumNumberOfTrianglesMaxValueMaximumNumberOfPassesMaxValue",
    header: "vtkAdaptiveSubdivisionFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTrianglesMaximumNumberOfPasses ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfPasses  of  << this -> MaximumNumberOfPasses ) ; return this -> MaximumNumberOfPasses ; } ;
## Error: expected ';'!!!

proc SetLocator*(this: var vtkAdaptiveSubdivisionFilter;
                locator: ptr vtkIncrementalPointLocator) {.importcpp: "SetLocator",
    header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetnameLocator*(this: var vtkAdaptiveSubdivisionFilter): ptr vtkIncrementalPointLocator {.
    importcpp: "GetnameLocator", header: "vtkAdaptiveSubdivisionFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output types. See the documentation
  ##  for the vtkAlgorithm::Precision enum for an explanation of the available
  ##  precision settings.
  ##
proc SetOutputPointsPrecision*(this: var vtkAdaptiveSubdivisionFilter; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision",
    header: "vtkAdaptiveSubdivisionFilter.h".}
## !!!Ignored construct:  virtual int GetMaximumEdgeLengthMaximumTriangleAreaMaximumNumberOfTrianglesMaximumNumberOfPassesOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc CreateDefaultLocator*(this: var vtkAdaptiveSubdivisionFilter) {.
    importcpp: "CreateDefaultLocator", header: "vtkAdaptiveSubdivisionFilter.h".}
proc GetMTime*(this: var vtkAdaptiveSubdivisionFilter): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkAdaptiveSubdivisionFilter.h".}