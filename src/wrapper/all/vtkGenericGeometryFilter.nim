## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericGeometryFilter.h
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
##  @class   vtkGenericGeometryFilter
##  @brief   extract geometry from data (or convert data to polygonal type)
##
##  vtkGenericGeometryFilter is a general-purpose filter to extract geometry (and
##  associated data) from any type of dataset. Geometry is obtained as
##  follows: all 0D, 1D, and 2D cells are extracted. All 2D faces that are
##  used by only one 3D cell (i.e., boundary faces) are extracted. It also is
##  possible to specify conditions on point ids, cell ids, and on
##  bounding box (referred to as "Extent") to control the extraction process.
##
##  This filter also may be used to convert any type of data to polygonal
##  type. The conversion process may be less than satisfactory for some 3D
##  datasets. For example, this filter will extract the outer surface of a
##  volume or structured grid dataset. (For structured data you may want to
##  use vtkImageDataGeometryFilter, vtkStructuredGridGeometryFilter,
##  vtkExtractUnstructuredGrid, vtkRectilinearGridGeometryFilter, or
##  vtkExtractVOI.)
##
##  @warning
##  When vtkGenericGeometryFilter extracts cells (or boundaries of cells) it
##  will (by default) merge duplicate vertices. This may cause problems
##  in some cases. For example, if you've run vtkPolyDataNormals to
##  generate normals, which may split meshes and create duplicate
##  vertices, vtkGenericGeometryFilter will merge these points back
##  together. Turn merging off to prevent this from occurring.
##
##  @sa
##  vtkImageDataGeometryFilter vtkStructuredGridGeometryFilter
##  vtkExtractGeometry vtkExtractVOI
##

import
  vtkFiltersGenericModule, vtkPolyDataAlgorithm

discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPointData"
type
  vtkGenericGeometryFilter* {.importcpp: "vtkGenericGeometryFilter",
                             header: "vtkGenericGeometryFilter.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkGenericGeometryFilter* {.importc: "vtkGenericGeometryFilter".}: VTK_NEWINSTANCE
    ##  Used internal by vtkGenericAdaptorCell::Tessellate()


proc New*(): ptr vtkGenericGeometryFilter {.importcpp: "vtkGenericGeometryFilter::New(@)",
                                        header: "vtkGenericGeometryFilter.h".}
type
  vtkGenericGeometryFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericGeometryFilter::IsTypeOf(@)",
    header: "vtkGenericGeometryFilter.h".}
proc IsA*(this: var vtkGenericGeometryFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericGeometryFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericGeometryFilter {.
    importcpp: "vtkGenericGeometryFilter::SafeDownCast(@)",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericGeometryFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericGeometryFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericGeometryFilter.h".}
proc SetPointClipping*(this: var vtkGenericGeometryFilter; _arg: vtkTypeBool) {.
    importcpp: "SetPointClipping", header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointClipping  of  << this -> PointClipping ) ; return this -> PointClipping ; } ;
## Error: expected ';'!!!

proc PointClippingOn*(this: var vtkGenericGeometryFilter) {.
    importcpp: "PointClippingOn", header: "vtkGenericGeometryFilter.h".}
proc PointClippingOff*(this: var vtkGenericGeometryFilter) {.
    importcpp: "PointClippingOff", header: "vtkGenericGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off selection of geometry by cell id.
  ##
proc SetPointClippingCellClipping*(this: var vtkGenericGeometryFilter;
                                  _arg: vtkTypeBool) {.
    importcpp: "SetPointClippingCellClipping",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellClipping  of  << this -> CellClipping ) ; return this -> CellClipping ; } ;
## Error: expected ';'!!!

proc CellClippingOn*(this: var vtkGenericGeometryFilter) {.
    importcpp: "CellClippingOn", header: "vtkGenericGeometryFilter.h".}
proc CellClippingOff*(this: var vtkGenericGeometryFilter) {.
    importcpp: "CellClippingOff", header: "vtkGenericGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off selection of geometry via bounding box.
  ##
proc SetPointClippingCellClippingExtentClipping*(
    this: var vtkGenericGeometryFilter; _arg: vtkTypeBool) {.
    importcpp: "SetPointClippingCellClippingExtentClipping",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClippingExtentClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtentClipping  of  << this -> ExtentClipping ) ; return this -> ExtentClipping ; } ;
## Error: expected ';'!!!

proc ExtentClippingOn*(this: var vtkGenericGeometryFilter) {.
    importcpp: "ExtentClippingOn", header: "vtkGenericGeometryFilter.h".}
proc ExtentClippingOff*(this: var vtkGenericGeometryFilter) {.
    importcpp: "ExtentClippingOff", header: "vtkGenericGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the minimum point id for point id selection.
  ##
proc SetPointMinimum*(this: var vtkGenericGeometryFilter; _arg: vtkIdType) {.
    importcpp: "SetPointMinimum", header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMinValue*(this: var vtkGenericGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMinValue", header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMaxValue*(this: var vtkGenericGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMaxValue", header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMinimum  of  << this -> PointMinimum ) ; return this -> PointMinimum ; } ;
## Error: expected ';'!!!

proc SetPointMinimumPointMaximum*(this: var vtkGenericGeometryFilter;
                                 _arg: vtkIdType) {.
    importcpp: "SetPointMinimumPointMaximum", header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMinValuePointMaximumMinValue*(
    this: var vtkGenericGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMinValuePointMaximumMinValue",
    header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMaxValuePointMaximumMaxValue*(
    this: var vtkGenericGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMaxValuePointMaximumMaxValue",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMaximum  of  << this -> PointMaximum ) ; return this -> PointMaximum ; } ;
## Error: expected ';'!!!

proc SetPointMinimumPointMaximumCellMinimum*(this: var vtkGenericGeometryFilter;
    _arg: vtkIdType) {.importcpp: "SetPointMinimumPointMaximumCellMinimum",
                     header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValue*(
    this: var vtkGenericGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValue",
    header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValue*(
    this: var vtkGenericGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValue",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellMinimum  of  << this -> CellMinimum ) ; return this -> CellMinimum ; } ;
## Error: expected ';'!!!

proc SetPointMinimumPointMaximumCellMinimumCellMaximum*(
    this: var vtkGenericGeometryFilter; _arg: vtkIdType) {.
    importcpp: "SetPointMinimumPointMaximumCellMinimumCellMaximum",
    header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValueCellMaximumMinValue*(
    this: var vtkGenericGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValueCellMaximumMinValue",
    header: "vtkGenericGeometryFilter.h".}
proc GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValueCellMaximumMaxValue*(
    this: var vtkGenericGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValueCellMaximumMaxValue",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellMaximum  of  << this -> CellMaximum ) ; return this -> CellMaximum ; } ;
## Error: expected ';'!!!

proc SetExtent*(this: var vtkGenericGeometryFilter; xMin: cdouble; xMax: cdouble;
               yMin: cdouble; yMax: cdouble; zMin: cdouble; zMax: cdouble) {.
    importcpp: "SetExtent", header: "vtkGenericGeometryFilter.h".}
proc SetExtent*(this: var vtkGenericGeometryFilter; extent: array[6, cdouble]) {.
    importcpp: "SetExtent", header: "vtkGenericGeometryFilter.h".}
proc GetExtent*(this: var vtkGenericGeometryFilter): ptr cdouble {.
    importcpp: "GetExtent", header: "vtkGenericGeometryFilter.h".}
proc SetPointClippingCellClippingExtentClippingMerging*(
    this: var vtkGenericGeometryFilter; _arg: vtkTypeBool) {.
    importcpp: "SetPointClippingCellClippingExtentClippingMerging",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Merging  of  << this -> Merging ) ; return this -> Merging ; } ;
## Error: expected ';'!!!

proc MergingOn*(this: var vtkGenericGeometryFilter) {.importcpp: "MergingOn",
    header: "vtkGenericGeometryFilter.h".}
proc MergingOff*(this: var vtkGenericGeometryFilter) {.importcpp: "MergingOff",
    header: "vtkGenericGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set / get a spatial locator for merging points. By
  ##  default an instance of vtkMergePoints is used.
  ##
proc SetLocator*(this: var vtkGenericGeometryFilter;
                locator: ptr vtkIncrementalPointLocator) {.importcpp: "SetLocator",
    header: "vtkGenericGeometryFilter.h".}
proc GetnameLocator*(this: var vtkGenericGeometryFilter): ptr vtkIncrementalPointLocator {.
    importcpp: "GetnameLocator", header: "vtkGenericGeometryFilter.h".}
  ## /@}
  ## *
  ##  Create default locator. Used to create one when none is specified.
  ##
proc CreateDefaultLocator*(this: var vtkGenericGeometryFilter) {.
    importcpp: "CreateDefaultLocator", header: "vtkGenericGeometryFilter.h".}
proc GetMTime*(this: var vtkGenericGeometryFilter): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkGenericGeometryFilter.h".}
proc SetPointClippingCellClippingExtentClippingMergingPassThroughCellIds*(
    this: var vtkGenericGeometryFilter; _arg: vtkTypeBool) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingPassThroughCellIds",
    header: "vtkGenericGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingPassThroughCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughCellIds  of  << this -> PassThroughCellIds ) ; return this -> PassThroughCellIds ; } ;
## Error: expected ';'!!!

proc PassThroughCellIdsOn*(this: var vtkGenericGeometryFilter) {.
    importcpp: "PassThroughCellIdsOn", header: "vtkGenericGeometryFilter.h".}
proc PassThroughCellIdsOff*(this: var vtkGenericGeometryFilter) {.
    importcpp: "PassThroughCellIdsOff", header: "vtkGenericGeometryFilter.h".}
  ## /@}