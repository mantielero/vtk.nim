## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticCleanPolyData.h
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
##  @class   vtkStaticCleanPolyData
##  @brief   merge duplicate points, and/or remove unused points and/or remove degenerate cells
##
##  vtkStaticCleanPolyData is a filter that takes polygonal data as input and
##  generates polygonal data as output. vtkStaticCleanPolyData will merge
##  duplicate points (within specified tolerance), and if enabled, transform
##  degenerate cells into appropriate forms (for example, a triangle is
##  converted into a line if two points of triangle are merged).
##
##  Conversion of degenerate cells is controlled by the flags
##  ConvertLinesToPoints, ConvertPolysToLines, ConvertStripsToPolys which act
##  cumulatively such that a degenerate strip may become a poly.
##  The full set is
##  Line with 1 points -> Vert (if ConvertLinesToPoints)
##  Poly with 2 points -> Line (if ConvertPolysToLines)
##  Poly with 1 points -> Vert (if ConvertPolysToLines && ConvertLinesToPoints)
##  Strp with 3 points -> Poly (if ConvertStripsToPolys)
##  Strp with 2 points -> Line (if ConvertStripsToPolys && ConvertPolysToLines)
##  Strp with 1 points -> Vert (if ConvertStripsToPolys && ConvertPolysToLines
##    && ConvertLinesToPoints)
##
##  Internally this class uses vtkStaticPointLocator, which is a threaded, and
##  much faster locator (especially for large data) than the incremental
##  locators that vtkCleanPolyData uses. Note because of these and other
##  differences, the output of this filter may be different than
##  vtkCleanPolyData.
##
##  @warning
##  Merging points can alter topology, including introducing non-manifold
##  forms. The tolerance should be chosen carefully to avoid these problems.
##  Large tolerances (of size > locator bin width) may generate poor results.
##
##  @warning
##  Unlike vtkCleanPolyData, point merging is always performed (i.e., there
##  is no PointMergingOff()).
##
##  @warning
##  Unlike vtkCleanPolyData, conversion from one cell type to another is
##  disabled/off. This produces more predictable behavior in many applications.
##
##  @warning
##  The vtkStaticCleanPolyData filter is similar in operation to
##  vtkCleanPolyData. However, vtkStaticCleanPolyData is non-incremental and
##  uses a much faster (especially for larger datasets) threading approach and
##  when merging points with a non-zero tolerance. However because of the
##  difference in the traveral order in the point merging process, the output
##  of the filters may be different.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkCleanPolyData vtkStaticCleanUnstructuredGrid
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm, vtkStaticPointLocator

type
  vtkStaticCleanPolyData* {.importcpp: "vtkStaticCleanPolyData",
                           header: "vtkStaticCleanPolyData.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                  ## *
                                                                                                  ##  Standard methods to instantiate, print, and provide type information.
                                                                                                  ##
    vtkStaticCleanPolyData* {.importc: "vtkStaticCleanPolyData".}: VTK_NEWINSTANCE
    ##  Internal locator for performing point merging


proc New*(): ptr vtkStaticCleanPolyData {.importcpp: "vtkStaticCleanPolyData::New(@)",
                                      header: "vtkStaticCleanPolyData.h".}
proc PrintSelf*(this: var vtkStaticCleanPolyData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStaticCleanPolyData.h".}
type
  vtkStaticCleanPolyDataSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStaticCleanPolyData::IsTypeOf(@)",
    header: "vtkStaticCleanPolyData.h".}
proc IsA*(this: var vtkStaticCleanPolyData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStaticCleanPolyData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStaticCleanPolyData {.
    importcpp: "vtkStaticCleanPolyData::SafeDownCast(@)",
    header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStaticCleanPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStaticCleanPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStaticCleanPolyData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc SetToleranceIsAbsolute*(this: var vtkStaticCleanPolyData; _arg: bool) {.
    importcpp: "SetToleranceIsAbsolute", header: "vtkStaticCleanPolyData.h".}
proc ToleranceIsAbsoluteOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ToleranceIsAbsoluteOn", header: "vtkStaticCleanPolyData.h".}
proc ToleranceIsAbsoluteOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ToleranceIsAbsoluteOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToleranceIsAbsolute  of  << this -> ToleranceIsAbsolute ) ; return this -> ToleranceIsAbsolute ; } ;
## Error: expected ';'!!!

proc SetTolerance*(this: var vtkStaticCleanPolyData; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkStaticCleanPolyData.h".}
proc GetToleranceMinValue*(this: var vtkStaticCleanPolyData): cdouble {.
    importcpp: "GetToleranceMinValue", header: "vtkStaticCleanPolyData.h".}
proc GetToleranceMaxValue*(this: var vtkStaticCleanPolyData): cdouble {.
    importcpp: "GetToleranceMaxValue", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual double GetToleranceIsAbsoluteTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetToleranceAbsoluteTolerance*(this: var vtkStaticCleanPolyData; _arg: cdouble) {.
    importcpp: "SetToleranceAbsoluteTolerance", header: "vtkStaticCleanPolyData.h".}
proc GetToleranceMinValueAbsoluteToleranceMinValue*(
    this: var vtkStaticCleanPolyData): cdouble {.
    importcpp: "GetToleranceMinValueAbsoluteToleranceMinValue",
    header: "vtkStaticCleanPolyData.h".}
proc GetToleranceMaxValueAbsoluteToleranceMaxValue*(
    this: var vtkStaticCleanPolyData): cdouble {.
    importcpp: "GetToleranceMaxValueAbsoluteToleranceMaxValue",
    header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual double GetToleranceIsAbsoluteToleranceAbsoluteTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AbsoluteTolerance  of  << this -> AbsoluteTolerance ) ; return this -> AbsoluteTolerance ; } ;
## Error: expected ';'!!!

proc SetMergingArray*(this: var vtkStaticCleanPolyData; _arg: cstring) {.
    importcpp: "SetMergingArray", header: "vtkStaticCleanPolyData.h".}
proc GetMergingArray*(this: var vtkStaticCleanPolyData): cstring {.
    importcpp: "GetMergingArray", header: "vtkStaticCleanPolyData.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off conversion of degenerate lines to points. Default is Off.
  ##
proc SetToleranceIsAbsoluteConvertLinesToPoints*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.
    importcpp: "SetToleranceIsAbsoluteConvertLinesToPoints",
    header: "vtkStaticCleanPolyData.h".}
proc ConvertLinesToPointsOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ConvertLinesToPointsOn", header: "vtkStaticCleanPolyData.h".}
proc ConvertLinesToPointsOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ConvertLinesToPointsOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertLinesToPoints  of  << this -> ConvertLinesToPoints ) ; return this -> ConvertLinesToPoints ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLines*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.
    importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLines",
    header: "vtkStaticCleanPolyData.h".}
proc ConvertPolysToLinesOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ConvertPolysToLinesOn", header: "vtkStaticCleanPolyData.h".}
proc ConvertPolysToLinesOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ConvertPolysToLinesOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertPolysToLines  of  << this -> ConvertPolysToLines ) ; return this -> ConvertPolysToLines ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys",
    header: "vtkStaticCleanPolyData.h".}
proc ConvertStripsToPolysOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ConvertStripsToPolysOn", header: "vtkStaticCleanPolyData.h".}
proc ConvertStripsToPolysOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ConvertStripsToPolysOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolys ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConvertStripsToPolys  of  << this -> ConvertStripsToPolys ) ; return this -> ConvertStripsToPolys ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPoints*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPoints",
    header: "vtkStaticCleanPolyData.h".}
proc RemoveUnusedPointsOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "RemoveUnusedPointsOn", header: "vtkStaticCleanPolyData.h".}
proc RemoveUnusedPointsOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "RemoveUnusedPointsOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RemoveUnusedPoints  of  << this -> RemoveUnusedPoints ) ; return this -> RemoveUnusedPoints ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMap*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMap",
    header: "vtkStaticCleanPolyData.h".}
proc ProduceMergeMapOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ProduceMergeMapOn", header: "vtkStaticCleanPolyData.h".}
proc ProduceMergeMapOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "ProduceMergeMapOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMap ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProduceMergeMap  of  << this -> ProduceMergeMap ) ; return this -> ProduceMergeMap ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointData*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointData",
    header: "vtkStaticCleanPolyData.h".}
proc AveragePointDataOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "AveragePointDataOn", header: "vtkStaticCleanPolyData.h".}
proc AveragePointDataOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "AveragePointDataOff", header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointData ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AveragePointData  of  << this -> AveragePointData ) ; return this -> AveragePointData ; } ;
## Error: expected ';'!!!

proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecision*(
    this: var vtkStaticCleanPolyData; _arg: cint) {.importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecision",
    header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual int GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc GetnameLocator*(this: var vtkStaticCleanPolyData): ptr vtkStaticPointLocator {.
    importcpp: "GetnameLocator", header: "vtkStaticCleanPolyData.h".}
  ## /@{
  ##  This filter is difficult to stream.  To produce invariant results, the
  ##  whole input must be processed at once.  This flag allows the user to
  ##  select whether strict piece invariance is required.  By default it is
  ##  on.  When off, the filter can stream, but results may change.
proc SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecisionPieceInvariant*(
    this: var vtkStaticCleanPolyData; _arg: bool) {.importcpp: "SetToleranceIsAbsoluteConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecisionPieceInvariant",
    header: "vtkStaticCleanPolyData.h".}
## !!!Ignored construct:  virtual bool GetToleranceIsAbsoluteToleranceAbsoluteToleranceConvertLinesToPointsConvertPolysToLinesConvertStripsToPolysRemoveUnusedPointsProduceMergeMapAveragePointDataOutputPointsPrecisionPieceInvariant ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PieceInvariant  of  << this -> PieceInvariant ) ; return this -> PieceInvariant ; } ;
## Error: expected ';'!!!

proc PieceInvariantOn*(this: var vtkStaticCleanPolyData) {.
    importcpp: "PieceInvariantOn", header: "vtkStaticCleanPolyData.h".}
proc PieceInvariantOff*(this: var vtkStaticCleanPolyData) {.
    importcpp: "PieceInvariantOff", header: "vtkStaticCleanPolyData.h".}
  ## /@}
  ## *
  ##  Get the MTime of this object also considering the locator.
  ##
proc GetMTime*(this: var vtkStaticCleanPolyData): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkStaticCleanPolyData.h".}