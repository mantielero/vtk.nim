## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticCleanUnstructuredGrid.h
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
##  @class   vtkStaticCleanUnstructuredGrid
##  @brief   merge duplicate points, removed unused points, in an vtkUnstructuredGrid
##
##  vtkStaticCleanUnstructuredGrid is a filter that takes a
##  vtkUnstructuredGrid as input and produces a vtkUnstructuredGrid on output,
##  merging coincident points (as defined by a merging tolerance) and
##  optionally removing unused points. The filter does not modify the topology
##  of the input dataset, nor change the types of cells. It may however,
##  renumber the cell connectivity ids.
##
##  For better performance, this filter employs threading using
##  vtkStaticPointLocator and its associated threaded methods. When the
##  merging tolerances==0.0, execution speeds are much faster as compared to
##  non-zero tolerances. When the merging tolerance > 0.0, there are issues
##  of processing order which can be controlled through the locator
##  (returned via GetLocator()). This behavior can be controlled by the
##  SetTraversalOrder() method - by default threading occurs via BIN_ORDER
##  (see vtkStaticPointLocator for more information).
##
##  @warning
##  Merging points can alter cell geometry and produce degenerate cells. The
##  tolerance should be chosen carefully to avoid these problems. For example,
##  in an extreme case with a relatively large tolerance, all points of a
##  vtkHexahedron could be merged to a single point, in which case the
##  resulting hexahedron would be defined by eight repeats of the same point.
##
##  @warning
##  If RemoveUnusedPoints is enabled, then any point not used by any of the
##  unstructured grid cells is eliminated (and not passed to the
##  output). Enabling this feature does impact performance.
##
##  @warning
##  If ProduceMergeMap is enabled, then an output data array is produced,
##  associated with the output field data, that maps each input point to an
##  output point (or to -1 if an input point is unused in the output).
##
##  @warning
##  Merging points affects point coordinates and data attributes. By default,
##  if points are merged, the point position and attribute data of only one
##  point (i.e., the point that all other points are merged to) is
##  retained. If AveragePointData is enabled, then the resulting point position
##  and attribute data values are determined by averaging the position and
##  attribute values of all the points that are merged together. This option
##  may have a significant performance impact if enabled.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkCleanPolyData vtkStaticCleanPolyData vtkStaticPointLocator
##

import
  vtkFiltersCoreModule, vtkSmartPointer, vtkStaticPointLocator,
  vtkUnstructuredGridAlgorithm

discard "forward decl of vtkCellArray"
discard "forward decl of vtkCellData"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
type
  vtkStaticCleanUnstructuredGrid* {.importcpp: "vtkStaticCleanUnstructuredGrid",
                                   header: "vtkStaticCleanUnstructuredGrid.h",
                                   bycopy.} = object of vtkUnstructuredGridAlgorithm ## /@{
                                                                                ## *
                                                                                ##  Standard methods for instantiation, obtaining type information, and
                                                                                ##  printing the state of the object.
                                                                                ##
    vtkStaticCleanUnstructuredGrid* {.importc: "vtkStaticCleanUnstructuredGrid".}: VTK_NEWINSTANCE
    ##  Internal locator for performing point merging
    ##  These methods are made static so that vtkStaticCleanPolyData can use them


proc New*(): ptr vtkStaticCleanUnstructuredGrid {.
    importcpp: "vtkStaticCleanUnstructuredGrid::New(@)",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc PrintSelf*(this: var vtkStaticCleanUnstructuredGrid; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkStaticCleanUnstructuredGrid.h".}
type
  vtkStaticCleanUnstructuredGridSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStaticCleanUnstructuredGrid::IsTypeOf(@)",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc IsA*(this: var vtkStaticCleanUnstructuredGrid; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStaticCleanUnstructuredGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStaticCleanUnstructuredGrid {.
    importcpp: "vtkStaticCleanUnstructuredGrid::SafeDownCast(@)",
    header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStaticCleanUnstructuredGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStaticCleanUnstructuredGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStaticCleanUnstructuredGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc SetToleranceIsAbsolute*(this: var vtkStaticCleanUnstructuredGrid; _arg: bool) {.
    importcpp: "SetToleranceIsAbsolute",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc ToleranceIsAbsoluteOn*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "ToleranceIsAbsoluteOn", header: "vtkStaticCleanUnstructuredGrid.h".}
proc ToleranceIsAbsoluteOff*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "ToleranceIsAbsoluteOff",
    header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToleranceIsAbsolute  of  << this -> ToleranceIsAbsolute ) ; return this -> ToleranceIsAbsolute ; } ;
## Error: expected ';'!!!

proc SetAbsoluteTolerance*(this: var vtkStaticCleanUnstructuredGrid; _arg: cdouble) {.
    importcpp: "SetAbsoluteTolerance", header: "vtkStaticCleanUnstructuredGrid.h".}
proc GetAbsoluteToleranceMinValue*(this: var vtkStaticCleanUnstructuredGrid): cdouble {.
    importcpp: "GetAbsoluteToleranceMinValue",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc GetAbsoluteToleranceMaxValue*(this: var vtkStaticCleanUnstructuredGrid): cdouble {.
    importcpp: "GetAbsoluteToleranceMaxValue",
    header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual double GetToleranceIsAbsoluteAbsoluteTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AbsoluteTolerance  of  << this -> AbsoluteTolerance ) ; return this -> AbsoluteTolerance ; } ;
## Error: expected ';'!!!

proc SetAbsoluteToleranceTolerance*(this: var vtkStaticCleanUnstructuredGrid;
                                   _arg: cdouble) {.
    importcpp: "SetAbsoluteToleranceTolerance",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc GetAbsoluteToleranceMinValueToleranceMinValue*(
    this: var vtkStaticCleanUnstructuredGrid): cdouble {.
    importcpp: "GetAbsoluteToleranceMinValueToleranceMinValue",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc GetAbsoluteToleranceMaxValueToleranceMaxValue*(
    this: var vtkStaticCleanUnstructuredGrid): cdouble {.
    importcpp: "GetAbsoluteToleranceMaxValueToleranceMaxValue",
    header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual double GetToleranceIsAbsoluteAbsoluteToleranceTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetMergingArray*(this: var vtkStaticCleanUnstructuredGrid; _arg: cstring) {.
    importcpp: "SetMergingArray", header: "vtkStaticCleanUnstructuredGrid.h".}
proc GetMergingArray*(this: var vtkStaticCleanUnstructuredGrid): cstring {.
    importcpp: "GetMergingArray", header: "vtkStaticCleanUnstructuredGrid.h".}
  ## /@}
  ## /@{
  ## *
  ##  Indicate whether points unused by any cell are removed from the output.
  ##  By default this point removal is on. Note that when this is off, the
  ##  filter can successfully process datasets with no cells (and just
  ##  points). If on in this case, and there are no cells, than the output
  ##  will be empty.
  ##
proc SetToleranceIsAbsoluteRemoveUnusedPoints*(
    this: var vtkStaticCleanUnstructuredGrid; _arg: bool) {.
    importcpp: "SetToleranceIsAbsoluteRemoveUnusedPoints",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc RemoveUnusedPointsOn*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "RemoveUnusedPointsOn", header: "vtkStaticCleanUnstructuredGrid.h".}
proc RemoveUnusedPointsOff*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "RemoveUnusedPointsOff", header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteAbsoluteToleranceToleranceRemoveUnusedPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveUnusedPoints  of  << this -> RemoveUnusedPoints ) ; return this -> RemoveUnusedPoints ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMap*(
    this: var vtkStaticCleanUnstructuredGrid; _arg: bool) {.
    importcpp: "SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMap",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc ProduceMergeMapOn*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "ProduceMergeMapOn", header: "vtkStaticCleanUnstructuredGrid.h".}
proc ProduceMergeMapOff*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "ProduceMergeMapOff", header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteAbsoluteToleranceToleranceRemoveUnusedPointsProduceMergeMap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceMergeMap  of  << this -> ProduceMergeMap ) ; return this -> ProduceMergeMap ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMapAveragePointData*(
    this: var vtkStaticCleanUnstructuredGrid; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMapAveragePointData",
    header: "vtkStaticCleanUnstructuredGrid.h".}
proc AveragePointDataOn*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "AveragePointDataOn", header: "vtkStaticCleanUnstructuredGrid.h".}
proc AveragePointDataOff*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "AveragePointDataOff", header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteAbsoluteToleranceToleranceRemoveUnusedPointsProduceMergeMapAveragePointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AveragePointData  of  << this -> AveragePointData ) ; return this -> AveragePointData ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecision*(
    this: var vtkStaticCleanUnstructuredGrid; _arg: cint) {.importcpp: "SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecision",
    header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual int GetToleranceIsAbsoluteAbsoluteToleranceToleranceRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc GetnameLocator*(this: var vtkStaticCleanUnstructuredGrid): ptr vtkStaticPointLocator {.
    importcpp: "GetnameLocator", header: "vtkStaticCleanUnstructuredGrid.h".}
  ## /@{
  ##  This filter is difficult to stream.  To produce invariant results, the
  ##  whole input must be processed at once.  This flag allows the user to
  ##  select whether strict piece invariance is required.  By default it is
  ##  on.  When off, the filter can stream, but results may change.
proc SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecisionPieceInvariant*(
    this: var vtkStaticCleanUnstructuredGrid; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecisionPieceInvariant",
    header: "vtkStaticCleanUnstructuredGrid.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteAbsoluteToleranceToleranceRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecisionPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ;
## Error: expected ';'!!!

proc PieceInvariantOn*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "PieceInvariantOn", header: "vtkStaticCleanUnstructuredGrid.h".}
proc PieceInvariantOff*(this: var vtkStaticCleanUnstructuredGrid) {.
    importcpp: "PieceInvariantOff", header: "vtkStaticCleanUnstructuredGrid.h".}
  ## /@}
  ## *
  ##  Get the MTime of this object also considering the locator.
  ##
proc GetMTime*(this: var vtkStaticCleanUnstructuredGrid): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkStaticCleanUnstructuredGrid.h".}