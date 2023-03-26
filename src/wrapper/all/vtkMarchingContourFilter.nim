## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMarchingContourFilter.h
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
##  @class   vtkMarchingContourFilter
##  @brief   generate isosurfaces/isolines from scalar values
##
##  vtkMarchingContourFilter is a filter that takes as input any dataset and
##  generates on output isosurfaces and/or isolines. The exact form
##  of the output depends upon the dimensionality of the input data.
##  Data consisting of 3D cells will generate isosurfaces, data
##  consisting of 2D cells will generate isolines, and data with 1D
##  or 0D cells will generate isopoints. Combinations of output type
##  are possible if the input dimension is mixed.
##
##  This filter will identify special dataset types (e.g., structured
##  points) and use the appropriate specialized filter to process the
##  data. For examples, if the input dataset type is a volume, this
##  filter will create an internal vtkMarchingCubes instance and use
##  it. This gives much better performance.
##
##  To use this filter you must specify one or more contour values.
##  You can either use the method SetValue() to specify each contour
##  value, or use GenerateValues() to generate a series of evenly
##  spaced contours. It is also possible to accelerate the operation of
##  this filter (at the cost of extra memory) by using a
##  vtkScalarTree. A scalar tree is used to quickly locate cells that
##  contain a contour surface. This is especially effective if multiple
##  contours are being extracted. If you want to use a scalar tree,
##  invoke the method UseScalarTreeOn().
##
##  @warning
##  For unstructured data or structured grids, normals and gradients
##  are not computed.  This calculation will be implemented in the
##  future. In the mean time, use vtkPolyDataNormals to compute the surface
##  normals.
##
##  @sa
##  vtkMarchingCubes vtkSliceCubes vtkDividingCubes vtkMarchingSquares
##  vtkImageMarchingCubes
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm, vtkContourValues

discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkScalarTree"
type
  vtkMarchingContourFilter* {.importcpp: "vtkMarchingContourFilter",
                             header: "vtkMarchingContourFilter.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkMarchingContourFilter* {.importc: "vtkMarchingContourFilter".}: VTK_NEWINSTANCE
    ##  special contouring for structured points

  vtkMarchingContourFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMarchingContourFilter::IsTypeOf(@)",
    header: "vtkMarchingContourFilter.h".}
proc IsA*(this: var vtkMarchingContourFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMarchingContourFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMarchingContourFilter {.
    importcpp: "vtkMarchingContourFilter::SafeDownCast(@)",
    header: "vtkMarchingContourFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMarchingContourFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMarchingContourFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMarchingContourFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMarchingContourFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMarchingContourFilter.h".}
proc New*(): ptr vtkMarchingContourFilter {.importcpp: "vtkMarchingContourFilter::New(@)",
                                        header: "vtkMarchingContourFilter.h".}
proc SetValue*(this: var vtkMarchingContourFilter; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkMarchingContourFilter.h".}
proc GetValue*(this: var vtkMarchingContourFilter; i: cint): cdouble {.
    importcpp: "GetValue", header: "vtkMarchingContourFilter.h".}
proc GetValues*(this: var vtkMarchingContourFilter): ptr cdouble {.
    importcpp: "GetValues", header: "vtkMarchingContourFilter.h".}
proc GetValues*(this: var vtkMarchingContourFilter; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkMarchingContourFilter.h".}
proc SetNumberOfContours*(this: var vtkMarchingContourFilter; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkMarchingContourFilter.h".}
proc GetNumberOfContours*(this: var vtkMarchingContourFilter): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkMarchingContourFilter.h".}
proc GenerateValues*(this: var vtkMarchingContourFilter; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkMarchingContourFilter.h".}
proc GenerateValues*(this: var vtkMarchingContourFilter; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkMarchingContourFilter.h".}
proc GetMTime*(this: var vtkMarchingContourFilter): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkMarchingContourFilter.h".}
proc SetComputeNormals*(this: var vtkMarchingContourFilter; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormals", header: "vtkMarchingContourFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeNormals  of  << this -> ComputeNormals ) ; return this -> ComputeNormals ; } ;
## Error: expected ';'!!!

proc ComputeNormalsOn*(this: var vtkMarchingContourFilter) {.
    importcpp: "ComputeNormalsOn", header: "vtkMarchingContourFilter.h".}
proc ComputeNormalsOff*(this: var vtkMarchingContourFilter) {.
    importcpp: "ComputeNormalsOff", header: "vtkMarchingContourFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of gradients. Gradient computation is
  ##  fairly expensive in both time and storage. Note that if
  ##  ComputeNormals is on, gradients will have to be calculated, but
  ##  will not be stored in the output dataset.  If the output data
  ##  will be processed by filters that modify topology or geometry, it
  ##  may be wise to turn Normals and Gradients off.
  ##
proc SetComputeNormalsComputeGradients*(this: var vtkMarchingContourFilter;
                                       _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradients",
    header: "vtkMarchingContourFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ;
## Error: expected ';'!!!

proc ComputeGradientsOn*(this: var vtkMarchingContourFilter) {.
    importcpp: "ComputeGradientsOn", header: "vtkMarchingContourFilter.h".}
proc ComputeGradientsOff*(this: var vtkMarchingContourFilter) {.
    importcpp: "ComputeGradientsOff", header: "vtkMarchingContourFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the computation of scalars.
  ##
proc SetComputeNormalsComputeGradientsComputeScalars*(
    this: var vtkMarchingContourFilter; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradientsComputeScalars",
    header: "vtkMarchingContourFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeScalars  of  << this -> ComputeScalars ) ; return this -> ComputeScalars ; } ;
## Error: expected ';'!!!

proc ComputeScalarsOn*(this: var vtkMarchingContourFilter) {.
    importcpp: "ComputeScalarsOn", header: "vtkMarchingContourFilter.h".}
proc ComputeScalarsOff*(this: var vtkMarchingContourFilter) {.
    importcpp: "ComputeScalarsOff", header: "vtkMarchingContourFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Enable the use of a scalar tree to accelerate contour extraction.
  ##
proc SetComputeNormalsComputeGradientsComputeScalarsUseScalarTree*(
    this: var vtkMarchingContourFilter; _arg: vtkTypeBool) {.
    importcpp: "SetComputeNormalsComputeGradientsComputeScalarsUseScalarTree",
    header: "vtkMarchingContourFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeNormalsComputeGradientsComputeScalarsUseScalarTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseScalarTree  of  << this -> UseScalarTree ) ; return this -> UseScalarTree ; } ;
## Error: expected ';'!!!

proc UseScalarTreeOn*(this: var vtkMarchingContourFilter) {.
    importcpp: "UseScalarTreeOn", header: "vtkMarchingContourFilter.h".}
proc UseScalarTreeOff*(this: var vtkMarchingContourFilter) {.
    importcpp: "UseScalarTreeOff", header: "vtkMarchingContourFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set / get a spatial locator for merging points. By default,
  ##  an instance of vtkMergePoints is used.
  ##
proc SetLocator*(this: var vtkMarchingContourFilter;
                locator: ptr vtkIncrementalPointLocator) {.importcpp: "SetLocator",
    header: "vtkMarchingContourFilter.h".}
proc GetnameLocator*(this: var vtkMarchingContourFilter): ptr vtkIncrementalPointLocator {.
    importcpp: "GetnameLocator", header: "vtkMarchingContourFilter.h".}
  ## /@}
  ## *
  ##  Create default locator. Used to create one when none is
  ##  specified. The locator is used to merge coincident points.
  ##
proc CreateDefaultLocator*(this: var vtkMarchingContourFilter) {.
    importcpp: "CreateDefaultLocator", header: "vtkMarchingContourFilter.h".}
## *
##  Set a particular contour value at contour number i. The index i ranges
##  between 0<=i<NumberOfContours.
##

proc SetValue*(this: var vtkMarchingContourFilter; i: cint; value: cdouble) {.
    importcpp: "SetValue", header: "vtkMarchingContourFilter.h".}
## *
##  Get the ith contour value.
##

proc GetValue*(this: var vtkMarchingContourFilter; i: cint): cdouble {.
    importcpp: "GetValue", header: "vtkMarchingContourFilter.h".}
## *
##  Get a pointer to an array of contour values. There will be
##  GetNumberOfContours() values in the list.
##

proc GetValues*(this: var vtkMarchingContourFilter): ptr cdouble {.
    importcpp: "GetValues", header: "vtkMarchingContourFilter.h".}
## *
##  Fill a supplied list with contour values. There will be
##  GetNumberOfContours() values in the list. Make sure you allocate
##  enough memory to hold the list.
##

proc GetValues*(this: var vtkMarchingContourFilter; contourValues: ptr cdouble) {.
    importcpp: "GetValues", header: "vtkMarchingContourFilter.h".}
## *
##  Set the number of contours to place into the list. You only really
##  need to use this method to reduce list size. The method SetValue()
##  will automatically increase list size as needed.
##

proc SetNumberOfContours*(this: var vtkMarchingContourFilter; number: cint) {.
    importcpp: "SetNumberOfContours", header: "vtkMarchingContourFilter.h".}
## *
##  Get the number of contours in the list of contour values.
##

proc GetNumberOfContours*(this: var vtkMarchingContourFilter): vtkIdType {.
    importcpp: "GetNumberOfContours", header: "vtkMarchingContourFilter.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(this: var vtkMarchingContourFilter; numContours: cint;
                    range: array[2, cdouble]) {.importcpp: "GenerateValues",
    header: "vtkMarchingContourFilter.h".}
## *
##  Generate numContours equally spaced contour values between specified
##  range. Contour values will include min/max range values.
##

proc GenerateValues*(this: var vtkMarchingContourFilter; numContours: cint;
                    rangeStart: cdouble; rangeEnd: cdouble) {.
    importcpp: "GenerateValues", header: "vtkMarchingContourFilter.h".}