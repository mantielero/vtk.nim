## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtk3DLinearGridCrinkleExtractor.h
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
##  @class   vtk3DLinearGridCrinkleExtractor
##  @brief   fast extraction of cells intersected by a plane
##
##  vtk3DLinearGridCrinkleExtractor is a specialized filter that, given a
##  specified implicit function, extracts unstructured grid cells that
##  intersect the implicit function. (Since the surface of these cells roughly
##  follows the implicit function but is "bumpy", it is referred to as a
##  "crinkle" suface.) This filter operates on vtkUnstructuredGrids consisting
##  of 3D linear cells: tetrahedra, hexahedra, voxels, pyramids, and/or
##  wedges. (The cells are linear in the sense that each cell edge is a
##  straight line.)  The filter is designed for high-speed, specialized
##  operation. All other cell types are skipped and produce no output.
##
##  To use this filter you must specify an input unstructured grid or
##  vtkCompositeDataSet (containing unstructured grids) and an implicit
##  function to cut with.
##
##  The RemoveUnusedPoints data member controls whether the filter remaps the
##  input points to the output. Since the algorithm simply extracts a subset
##  of the original data (points and cells), it is possible simply to pass the
##  input points to the output, which is much faster (factor of ~2X) then
##  mapping the input points to the output. Of course, not removing the unused
##  points means extra points in the output dataset, but because the input
##  points are shallow copied to the output, no additional memory is consumed.
##
##  @warning
##  When the input is of type vtkCompositeDataSet the filter will process the
##  unstructured grid(s) contained in the composite data set. As a result the
##  output of this filter is then a vtkMultiBlockDataSet containing multiple
##  vtkUnstructuredGrids. When a vtkUnstructuredGrid is provided as input the
##  output is a single vtkUnstructuredGrid.
##
##  @warning
##  Input cells that are not of 3D linear type (tetrahedron, hexahedron,
##  wedge, pyramid, and voxel) are simply skipped and not processed.
##
##  @warning
##  The filter is templated on types of input and output points, and input
##  scalar type. To reduce object file bloat, only real points (float,double) are
##  processed.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @warning
##  The vtkExtractGeometry filter is similar to this filter when
##  ExtractOnlyBoundaryCells is enabled.
##
##  @sa
##  vtk3DLinearGrid vtk3DLinearGridPlaneCutter vtkExtractGeometry
##

import
  vtkDataObjectAlgorithm, vtkFiltersCoreModule

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkImplicitFunction"
type
  vtk3DLinearGridCrinkleExtractor* {.importcpp: "vtk3DLinearGridCrinkleExtractor", header: "vtk3DLinearGridCrinkleExtractor.h",
                                    bycopy.} = object of vtkDataObjectAlgorithm ## /@{
                                                                           ## *
                                                                           ##  Standard methods for construction, type info, and printing.
                                                                           ##
    vtk3DLinearGridCrinkleExtractor* {.importc: "vtk3DLinearGridCrinkleExtractor".}: VTK_NEWINSTANCE
    ##  Process the data: input unstructured grid and output an unstructured grid


proc New*(): ptr vtk3DLinearGridCrinkleExtractor {.
    importcpp: "vtk3DLinearGridCrinkleExtractor::New(@)",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
type
  vtk3DLinearGridCrinkleExtractorSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtk3DLinearGridCrinkleExtractor::IsTypeOf(@)",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
proc IsA*(this: var vtk3DLinearGridCrinkleExtractor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtk3DLinearGridCrinkleExtractor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtk3DLinearGridCrinkleExtractor {.
    importcpp: "vtk3DLinearGridCrinkleExtractor::SafeDownCast(@)",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtk3DLinearGridCrinkleExtractor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtk3DLinearGridCrinkleExtractor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtk3DLinearGridCrinkleExtractor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtk3DLinearGridCrinkleExtractor; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtk3DLinearGridCrinkleExtractor.h".}
proc SetImplicitFunction*(this: var vtk3DLinearGridCrinkleExtractor;
                         a2: ptr vtkImplicitFunction) {.
    importcpp: "SetImplicitFunction", header: "vtk3DLinearGridCrinkleExtractor.h".}
proc GetnameImplicitFunction*(this: var vtk3DLinearGridCrinkleExtractor): ptr vtkImplicitFunction {.
    importcpp: "GetnameImplicitFunction",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether to copy input point data/attributes onto the output
  ##  points. By default this option is on.
  ##
proc SetCopyPointData*(this: var vtk3DLinearGridCrinkleExtractor; _arg: bool) {.
    importcpp: "SetCopyPointData", header: "vtk3DLinearGridCrinkleExtractor.h".}
## !!!Ignored construct:  virtual bool GetCopyPointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyPointData  of  << this -> CopyPointData ) ; return this -> CopyPointData ; } ;
## Error: expected ';'!!!

proc CopyPointDataOn*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "CopyPointDataOn", header: "vtk3DLinearGridCrinkleExtractor.h".}
proc CopyPointDataOff*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "CopyPointDataOff", header: "vtk3DLinearGridCrinkleExtractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether to copy input cell data/attributes onto the output
  ##  cells. By default this option is off.
  ##
proc SetCopyPointDataCopyCellData*(this: var vtk3DLinearGridCrinkleExtractor;
                                  _arg: bool) {.
    importcpp: "SetCopyPointDataCopyCellData",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
## !!!Ignored construct:  virtual bool GetCopyPointDataCopyCellData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CopyCellData  of  << this -> CopyCellData ) ; return this -> CopyCellData ; } ;
## Error: expected ';'!!!

proc CopyCellDataOn*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "CopyCellDataOn", header: "vtk3DLinearGridCrinkleExtractor.h".}
proc CopyCellDataOff*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "CopyCellDataOff", header: "vtk3DLinearGridCrinkleExtractor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether to eliminate unused output points. When this flag is
  ##  disabled, the input points and associated point data are simply shallow
  ##  copied to the output (which improves performance).  When enabled, any
  ##  points that are not used by the output cells are not sent to the output,
  ##  nor is associated point data copied. By default this option is disabled.
  ##  Removing unused points does have a significant performance impact.
  ##
proc SetCopyPointDataCopyCellDataRemoveUnusedPoints*(
    this: var vtk3DLinearGridCrinkleExtractor; _arg: bool) {.
    importcpp: "SetCopyPointDataCopyCellDataRemoveUnusedPoints",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
## !!!Ignored construct:  virtual bool GetCopyPointDataCopyCellDataRemoveUnusedPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveUnusedPoints  of  << this -> RemoveUnusedPoints ) ; return this -> RemoveUnusedPoints ; } ;
## Error: expected ';'!!!

proc RemoveUnusedPointsOn*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "RemoveUnusedPointsOn", header: "vtk3DLinearGridCrinkleExtractor.h".}
proc RemoveUnusedPointsOff*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "RemoveUnusedPointsOff",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
  ## /@}
  ## *
  ##  Overloaded GetMTime() because of delegation to the helper
  ##  vtkImplicitFunction.
  ##
proc GetMTime*(this: var vtk3DLinearGridCrinkleExtractor): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtk3DLinearGridCrinkleExtractor.h".}
proc SetOutputPointsPrecision*(this: var vtk3DLinearGridCrinkleExtractor;
                              precision: cint) {.
    importcpp: "SetOutputPointsPrecision",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
proc GetOutputPointsPrecision*(this: vtk3DLinearGridCrinkleExtractor): cint {.
    noSideEffect, importcpp: "GetOutputPointsPrecision",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
proc SetCopyPointDataCopyCellDataRemoveUnusedPointsSequentialProcessing*(
    this: var vtk3DLinearGridCrinkleExtractor; _arg: bool) {.importcpp: "SetCopyPointDataCopyCellDataRemoveUnusedPointsSequentialProcessing",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
## !!!Ignored construct:  virtual bool GetCopyPointDataCopyCellDataRemoveUnusedPointsSequentialProcessing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SequentialProcessing  of  << this -> SequentialProcessing ) ; return this -> SequentialProcessing ; } ;
## Error: expected ';'!!!

proc SequentialProcessingOn*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "SequentialProcessingOn",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
proc SequentialProcessingOff*(this: var vtk3DLinearGridCrinkleExtractor) {.
    importcpp: "SequentialProcessingOff",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
  ## /@}
  ## *
  ##   Return the number of threads actually used during execution. This is
  ##   valid only after algorithm execution.
  ##
proc GetNumberOfThreadsUsed*(this: var vtk3DLinearGridCrinkleExtractor): cint {.
    importcpp: "GetNumberOfThreadsUsed",
    header: "vtk3DLinearGridCrinkleExtractor.h".}
proc CanFullyProcessDataObject*(`object`: ptr vtkDataObject): bool {.
    importcpp: "vtk3DLinearGridCrinkleExtractor::CanFullyProcessDataObject(@)",
    header: "vtk3DLinearGridCrinkleExtractor.h".}