## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeometryFilter.h
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
##  @class   vtkGeometryFilter
##  @brief   extract boundary geometry from dataset (or convert data to polygonal type)
##
##  vtkGeometryFilter is a general-purpose filter to extract dataset boundary
##  geometry, topology, and associated attribute data from any type of
##  dataset. Geometry is obtained as follows: all 0D, 1D, and 2D cells are
##  extracted. All 2D faces that are used by only one 3D cell (i.e., boundary
##  faces) are extracted. It also is possible to specify conditions on point
##  ids, cell ids, and on a bounding box (referred to as "Extent") to control
##  the extraction process.  This point and cell id- and extent-based clipping
##  is a powerful way to "see inside" datasets; however it may impact
##  performance significantly.
##
##  This filter may also be used to convert any type of data to polygonal
##  type. This is particularly useful for surface rendering. The conversion
##  process may be less than satisfactory for some 3D datasets. For example,
##  this filter will extract the outer surface of a volume or structured grid
##  dataset (if point, cell, and extent clipping is disabled). (For structured
##  data you may want to use vtkImageDataGeometryFilter,
##  vtkStructuredGridGeometryFilter, vtkExtractUnstructuredGrid,
##  vtkRectilinearGridGeometryFilter, or vtkExtractVOI.)
##
##  Another important feature of vtkGeometryFilter is that it preserves
##  topological connectivity. This enables filters that depend on correct
##  connectivity (e.g., vtkQuadricDecimation, vtkFeatureEdges, etc.) to
##  operate properly . It is possible to label the output polydata with an
##  originating cell (PassThroughCellIds) or point id (PassThroughPointIds).
##  The output precision of created points (if they need to be created) can
##  also be specified.
##
##  Finally, this filter takes an optional second, vtkPolyData input. This
##  input represents a list of faces that are to be excluded from the output
##  of vtkGeometryFilter.
##
##  @warning
##  While vtkGeometryFilter and vtkDataSetSurfaceFilter perform similar operations,
##  there are important differences as follows:
##  1. vtkGeometryFilter can preserve (using RemoveGhostInterfaces) topological connectivity.
##     vtkDataSetSurfaceFilter produces output primitives which may be disconnected from one another.
##  2. vtkGeometryFilter can generate output based on cell ids, point ids, and/or
##     extent (bounding box) clipping. vtkDataSetSurfaceFilter strictly extracts
##     the boundary surface of a dataset.
##  3. vtkGeometryFilter is much faster than vtkDataSetSurfaceFilter, because it's
##     multi-threaded. As a result, vtkDataSetSurfaceFilter will delegate the processing
##     of linear unstructured grids to vtkGeometryFilter.
##  4. vtkGeometryFilter can (currently) only handle linear cells. The filter
##     will delegate to vtkDataSetSurfaceFilter for higher-order cells. (This
##     is a historical artifact and may be rectified in the future.)
##
##  @warning
##  If point merging (MergingOff) is disabled, the filter will (if possible)
##  use the input points and point attributes.  This can result in a lot of
##  unused points in the output, at some gain in filter performance.  If
##  enabled, point merging will generate only new points that are used by the
##  output polydata cells.
##
##  @warning
##  This class is templated. It may run slower than serial execution if the code
##  is not optimized during compilation. Build in Release or ReleaseWithDebugInfo.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkDataSetSurfaceFilter vtkImageDataGeometryFilter
##  vtkStructuredGridGeometryFilter vtkExtractGeometry vtkExtractVOI
##  vtkMarkBoundaryFilter vtkRemovePolyData
##

import
  vtkFiltersGeometryModule, vtkPolyDataAlgorithm

discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnstructuredGridBase"
discard "forward decl of vtkGeometryFilter"
discard "forward decl of vtkDataSetSurfaceFilter"
discard "forward decl of vtkGeometryFilterHelper"
type
  vtkGeometryFilterHelper* {.importcpp: "vtkGeometryFilterHelper",
                            header: "vtkGeometryFilter.h", bycopy.} = object
    IsLinear* {.importc: "IsLinear".}: cuchar


proc CharacterizeUnstructuredGrid*(a1: ptr vtkUnstructuredGridBase): ptr vtkGeometryFilterHelper {.
    importcpp: "vtkGeometryFilterHelper::CharacterizeUnstructuredGrid(@)",
    header: "vtkGeometryFilter.h".}
proc CopyFilterParams*(gf: ptr vtkGeometryFilter; dssf: ptr vtkDataSetSurfaceFilter) {.
    importcpp: "vtkGeometryFilterHelper::CopyFilterParams(@)",
    header: "vtkGeometryFilter.h".}
proc CopyFilterParams*(dssf: ptr vtkDataSetSurfaceFilter; gf: ptr vtkGeometryFilter) {.
    importcpp: "vtkGeometryFilterHelper::CopyFilterParams(@)",
    header: "vtkGeometryFilter.h".}
type
  vtkGeometryFilter* {.importcpp: "vtkGeometryFilter",
                      header: "vtkGeometryFilter.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                        ## *
                                                                                        ##  Standard methods for instantiation, type information, and printing.
                                                                                        ##
    vtkGeometryFilter* {.importc: "vtkGeometryFilter".}: VTK_NEWINSTANCE
    ##  These methods support compatibility with vtkDataSetSurfaceFilter


proc New*(): ptr vtkGeometryFilter {.importcpp: "vtkGeometryFilter::New(@)",
                                 header: "vtkGeometryFilter.h".}
type
  vtkGeometryFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGeometryFilter::IsTypeOf(@)", header: "vtkGeometryFilter.h".}
proc IsA*(this: var vtkGeometryFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGeometryFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGeometryFilter {.
    importcpp: "vtkGeometryFilter::SafeDownCast(@)", header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGeometryFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeometryFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeometryFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGeometryFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGeometryFilter.h".}
proc SetPointClipping*(this: var vtkGeometryFilter; _arg: bool) {.
    importcpp: "SetPointClipping", header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual bool GetPointClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointClipping  of  << this -> PointClipping ) ; return this -> PointClipping ; } ;
## Error: expected ';'!!!

proc PointClippingOn*(this: var vtkGeometryFilter) {.importcpp: "PointClippingOn",
    header: "vtkGeometryFilter.h".}
proc PointClippingOff*(this: var vtkGeometryFilter) {.importcpp: "PointClippingOff",
    header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off selection of geometry by cell id.
  ##
proc SetPointClippingCellClipping*(this: var vtkGeometryFilter; _arg: bool) {.
    importcpp: "SetPointClippingCellClipping", header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual bool GetPointClippingCellClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellClipping  of  << this -> CellClipping ) ; return this -> CellClipping ; } ;
## Error: expected ';'!!!

proc CellClippingOn*(this: var vtkGeometryFilter) {.importcpp: "CellClippingOn",
    header: "vtkGeometryFilter.h".}
proc CellClippingOff*(this: var vtkGeometryFilter) {.importcpp: "CellClippingOff",
    header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off selection of geometry via bounding box.
  ##
proc SetPointClippingCellClippingExtentClipping*(this: var vtkGeometryFilter;
    _arg: bool) {.importcpp: "SetPointClippingCellClippingExtentClipping",
                header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual bool GetPointClippingCellClippingExtentClipping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExtentClipping  of  << this -> ExtentClipping ) ; return this -> ExtentClipping ; } ;
## Error: expected ';'!!!

proc ExtentClippingOn*(this: var vtkGeometryFilter) {.importcpp: "ExtentClippingOn",
    header: "vtkGeometryFilter.h".}
proc ExtentClippingOff*(this: var vtkGeometryFilter) {.
    importcpp: "ExtentClippingOff", header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the minimum point id for point id selection.
  ##
proc SetPointMinimum*(this: var vtkGeometryFilter; _arg: vtkIdType) {.
    importcpp: "SetPointMinimum", header: "vtkGeometryFilter.h".}
proc GetPointMinimumMinValue*(this: var vtkGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMinValue", header: "vtkGeometryFilter.h".}
proc GetPointMinimumMaxValue*(this: var vtkGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMaxValue", header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMinimum  of  << this -> PointMinimum ) ; return this -> PointMinimum ; } ;
## Error: expected ';'!!!

proc SetPointMinimumPointMaximum*(this: var vtkGeometryFilter; _arg: vtkIdType) {.
    importcpp: "SetPointMinimumPointMaximum", header: "vtkGeometryFilter.h".}
proc GetPointMinimumMinValuePointMaximumMinValue*(this: var vtkGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMinValuePointMaximumMinValue",
    header: "vtkGeometryFilter.h".}
proc GetPointMinimumMaxValuePointMaximumMaxValue*(this: var vtkGeometryFilter): vtkIdType {.
    importcpp: "GetPointMinimumMaxValuePointMaximumMaxValue",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PointMaximum  of  << this -> PointMaximum ) ; return this -> PointMaximum ; } ;
## Error: expected ';'!!!

proc SetPointMinimumPointMaximumCellMinimum*(this: var vtkGeometryFilter;
    _arg: vtkIdType) {.importcpp: "SetPointMinimumPointMaximumCellMinimum",
                     header: "vtkGeometryFilter.h".}
proc GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValue*(
    this: var vtkGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValue",
    header: "vtkGeometryFilter.h".}
proc GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValue*(
    this: var vtkGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValue",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellMinimum  of  << this -> CellMinimum ) ; return this -> CellMinimum ; } ;
## Error: expected ';'!!!

proc SetPointMinimumPointMaximumCellMinimumCellMaximum*(
    this: var vtkGeometryFilter; _arg: vtkIdType) {.
    importcpp: "SetPointMinimumPointMaximumCellMinimumCellMaximum",
    header: "vtkGeometryFilter.h".}
proc GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValueCellMaximumMinValue*(
    this: var vtkGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMinValuePointMaximumMinValueCellMinimumMinValueCellMaximumMinValue",
    header: "vtkGeometryFilter.h".}
proc GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValueCellMaximumMaxValue*(
    this: var vtkGeometryFilter): vtkIdType {.importcpp: "GetPointMinimumMaxValuePointMaximumMaxValueCellMinimumMaxValueCellMaximumMaxValue",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkIdType GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CellMaximum  of  << this -> CellMaximum ) ; return this -> CellMaximum ; } ;
## Error: expected ';'!!!

proc SetExtent*(this: var vtkGeometryFilter; xMin: cdouble; xMax: cdouble;
               yMin: cdouble; yMax: cdouble; zMin: cdouble; zMax: cdouble) {.
    importcpp: "SetExtent", header: "vtkGeometryFilter.h".}
proc SetExtent*(this: var vtkGeometryFilter; extent: array[6, cdouble]) {.
    importcpp: "SetExtent", header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  double * GetExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> Extent ; } /@} /@{ *
##  Turn on/off merging of points. This will reduce the number of output
##  points, at some cost to performance. If Merging is off, then if possible
##  (i.e., if the point representation is explicit), the filter will reuse
##  the input points to create the output polydata. Certain input dataset
##  types (with implicit point representations) will always create new
##  points (effectively performing a merge operation).
##  virtual void SetPointClippingCellClippingExtentClippingMerging ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Merging  to  << _arg ) ; if ( this -> Merging != _arg ) { this -> Merging = _arg ; this -> Modified ( ) ; } } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual bool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Merging  of  << this -> Merging ) ; return this -> Merging ; } ;
## Error: expected ';'!!!

proc MergingOn*(this: var vtkGeometryFilter) {.importcpp: "MergingOn",
    header: "vtkGeometryFilter.h".}
proc MergingOff*(this: var vtkGeometryFilter) {.importcpp: "MergingOff",
    header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output types. See the
  ##  documentation for the vtkAlgorithm::DesiredOutputPrecision enum for an
  ##  explanation of the available precision settings. This only applies for
  ##  data types where we create points (merging) as opposed to passing them
  ##  from input to output, such as unstructured grids.
  ##
proc SetOutputPointsPrecision*(this: var vtkGeometryFilter; precision: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkGeometryFilter.h".}
proc GetOutputPointsPrecision*(this: vtkGeometryFilter): cint {.noSideEffect,
    importcpp: "GetOutputPointsPrecision", header: "vtkGeometryFilter.h".}
proc SetPointClippingCellClippingExtentClippingMergingFastMode*(
    this: var vtkGeometryFilter; _arg: bool) {.
    importcpp: "SetPointClippingCellClippingExtentClippingMergingFastMode",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual bool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FastMode  of  << this -> FastMode ) ; return this -> FastMode ; } ;
## Error: expected ';'!!!

proc FastModeOn*(this: var vtkGeometryFilter) {.importcpp: "FastModeOn",
    header: "vtkGeometryFilter.h".}
proc FastModeOff*(this: var vtkGeometryFilter) {.importcpp: "FastModeOff",
    header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If fast mode is enabled, then Degree controls which cells are
  ##  visited. Basically, any cell connected to a point with connectivity
  ##  degree <= is visited and processed. Low degree points tend to be
  ##  located on the boundary of datasets - thus attached cells frequently
  ##  produce output boundary fragments.
  ##
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) virtual void SetDegree ( unsigned int vtkNotUsed ( arg ) ) { } VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) virtual unsigned int GetDegreeMinValue ( ) { return 1 ; } VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) virtual unsigned int GetDegreeMaxValue ( ) { return static_cast < int > ( ~ 0u >> 1 ) ; } VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) virtual unsigned int GetDegree ( ) { return 4 ; } /@} /@{ *
##  Set / get a spatial locator for merging points. By default an instance
##  of vtkMergePoints is used. (This method is now deprecated and has no
##  effect.)
##  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) void SetLocator ( vtkIncrementalPointLocator * locator ) ;
## Error: identifier expected, but got: This method is no longer used and has no effect.!!!

## !!!Ignored construct:  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) virtual vtkIncrementalPointLocator * GetnameLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Locator  address  << static_cast < vtkIncrementalPointLocator * > ( this -> Locator ) ) ; return this -> Locator ; } ;
## Error: identifier expected, but got: This method is no longer used and has no effect.!!!

## !!!Ignored construct:  /@} *
##  Create default locator. Used to create one when none is specified.
##  This method is now deprecated.
##  VTK_DEPRECATED_IN_9_2_0 ( This method is no longer used and has no effect. ) void CreateDefaultLocator ( ) ;
## Error: identifier expected, but got: This method is no longer used and has no effect.!!!

proc SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariant*(
    this: var vtkGeometryFilter; _arg: cint) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariant",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual int GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastModePieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ;
## Error: expected ';'!!!

proc SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIds*(
    this: var vtkGeometryFilter; _arg: vtkTypeBool) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIds",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastModePieceInvariantPassThroughCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughCellIds  of  << this -> PassThroughCellIds ) ; return this -> PassThroughCellIds ; } ;
## Error: expected ';'!!!

proc PassThroughCellIdsOn*(this: var vtkGeometryFilter) {.
    importcpp: "PassThroughCellIdsOn", header: "vtkGeometryFilter.h".}
proc PassThroughCellIdsOff*(this: var vtkGeometryFilter) {.
    importcpp: "PassThroughCellIdsOff", header: "vtkGeometryFilter.h".}
proc SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIds*(
    this: var vtkGeometryFilter; _arg: vtkTypeBool) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIds",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughPointIds  of  << this -> PassThroughPointIds ) ; return this -> PassThroughPointIds ; } ;
## Error: expected ';'!!!

proc PassThroughPointIdsOn*(this: var vtkGeometryFilter) {.
    importcpp: "PassThroughPointIdsOn", header: "vtkGeometryFilter.h".}
proc PassThroughPointIdsOff*(this: var vtkGeometryFilter) {.
    importcpp: "PassThroughPointIdsOff", header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  If PassThroughCellIds or PassThroughPointIds is on, then these ivars
  ##  control the name given to the field in which the ids are written into.  If
  ##  set to nullptr, then vtkOriginalCellIds or vtkOriginalPointIds (the default)
  ##  is used, respectively.
  ##
proc SetOriginalCellIdsName*(this: var vtkGeometryFilter; _arg: cstring) {.
    importcpp: "SetOriginalCellIdsName", header: "vtkGeometryFilter.h".}
proc GetOriginalCellIdsName*(this: var vtkGeometryFilter): cstring {.
    importcpp: "GetOriginalCellIdsName", header: "vtkGeometryFilter.h".}
proc SetOriginalCellIdsNameOriginalPointIdsName*(this: var vtkGeometryFilter;
    _arg: cstring) {.importcpp: "SetOriginalCellIdsNameOriginalPointIdsName",
                   header: "vtkGeometryFilter.h".}
proc GetOriginalPointIdsName*(this: var vtkGeometryFilter): cstring {.
    importcpp: "GetOriginalPointIdsName", header: "vtkGeometryFilter.h".}
proc SetExcludedFacesData*(this: var vtkGeometryFilter; a2: ptr vtkPolyData) {.
    importcpp: "SetExcludedFacesData", header: "vtkGeometryFilter.h".}
proc SetExcludedFacesConnection*(this: var vtkGeometryFilter;
                                algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetExcludedFacesConnection", header: "vtkGeometryFilter.h".}
proc GetExcludedFaces*(this: var vtkGeometryFilter): ptr vtkPolyData {.
    importcpp: "GetExcludedFaces", header: "vtkGeometryFilter.h".}
proc SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevel*(
    this: var vtkGeometryFilter; _arg: cint) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevel",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual int GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NonlinearSubdivisionLevel  of  << this -> NonlinearSubdivisionLevel ) ; return this -> NonlinearSubdivisionLevel ; } ;
## Error: expected ';'!!!

proc SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevelDelegation*(
    this: var vtkGeometryFilter; _arg: vtkTypeBool) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevelDelegation",
    header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevelDelegation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Delegation  of  << this -> Delegation ) ; return this -> Delegation ; } ;
## Error: expected ';'!!!

proc DelegationOn*(this: var vtkGeometryFilter) {.importcpp: "DelegationOn",
    header: "vtkGeometryFilter.h".}
proc DelegationOff*(this: var vtkGeometryFilter) {.importcpp: "DelegationOff",
    header: "vtkGeometryFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get if Ghost interfaces will be removed.
  ##  When you are rendering you want to remove ghost interfaces.
  ##  There are certain algorithms though that need the ghost interfaces.
  ##
  ##  Since Rendering is the most common case, the Default is on.
  ##
  ##  Note: This flag is meaningful only for vtkUnstructuredGrid/vtkUnstructuredGridBase.
  ##  DON'T change it if there are no ghost cells.
  ##
proc SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevelDelegationRemoveGhostInterfaces*(
    this: var vtkGeometryFilter; _arg: bool) {.importcpp: "SetPointClippingCellClippingExtentClippingMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevelDelegationRemoveGhostInterfaces",
    header: "vtkGeometryFilter.h".}
proc RemoveGhostInterfacesOn*(this: var vtkGeometryFilter) {.
    importcpp: "RemoveGhostInterfacesOn", header: "vtkGeometryFilter.h".}
proc RemoveGhostInterfacesOff*(this: var vtkGeometryFilter) {.
    importcpp: "RemoveGhostInterfacesOff", header: "vtkGeometryFilter.h".}
## !!!Ignored construct:  virtual bool GetPointClippingCellClippingExtentClippingPointMinimumPointMaximumCellMinimumCellMaximumMergingFastModePieceInvariantPassThroughCellIdsPassThroughPointIdsNonlinearSubdivisionLevelDelegationRemoveGhostInterfaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveGhostInterfaces  of  << this -> RemoveGhostInterfaces ) ; return this -> RemoveGhostInterfaces ; } ;
## Error: expected ';'!!!

proc PolyDataExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                     output: ptr vtkPolyData; exc: ptr vtkPolyData): cint {.
    importcpp: "PolyDataExecute", header: "vtkGeometryFilter.h".}
proc PolyDataExecute*(this: var vtkGeometryFilter; a2: ptr vtkDataSet;
                     a3: ptr vtkPolyData): cint {.importcpp: "PolyDataExecute",
    header: "vtkGeometryFilter.h".}
proc UnstructuredGridExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                             output: ptr vtkPolyData;
                             info: ptr vtkGeometryFilterHelper;
                             exc: ptr vtkPolyData): cint {.
    importcpp: "UnstructuredGridExecute", header: "vtkGeometryFilter.h".}
proc UnstructuredGridExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                             output: ptr vtkPolyData): cint {.
    importcpp: "UnstructuredGridExecute", header: "vtkGeometryFilter.h".}
proc StructuredExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                       output: ptr vtkPolyData; inInfo: ptr vtkInformation;
                       exc: ptr vtkPolyData; extractFace: ptr bool = nil): cint {.
    importcpp: "StructuredExecute", header: "vtkGeometryFilter.h".}
proc StructuredExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                       output: ptr vtkPolyData; inInfo: ptr vtkInformation;
                       extractFace: ptr bool = nil): cint {.
    importcpp: "StructuredExecute", header: "vtkGeometryFilter.h".}
proc DataSetExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                    output: ptr vtkPolyData; exc: ptr vtkPolyData): cint {.
    importcpp: "DataSetExecute", header: "vtkGeometryFilter.h".}
proc DataSetExecute*(this: var vtkGeometryFilter; input: ptr vtkDataSet;
                    output: ptr vtkPolyData): cint {.importcpp: "DataSetExecute",
    header: "vtkGeometryFilter.h".}