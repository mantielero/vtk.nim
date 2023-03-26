## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAppendDataSets.h
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
##  @class   vtkAppendDataSets
##  @brief   Appends one or more datasets together into a single output vtkPointSet.
##
##  vtkAppendDataSets is a filter that appends one of more datasets into a single output
##  point set. The type of the output is set with the OutputDataSetType option. Only inputs
##  that can be converted to the selected output dataset type are appended to the output.
##  By default, the output is vtkUnstructuredGrid, and all input types can be appended to it.
##  If the OutputDataSetType is set to produce vtkPolyData, then only datasets that can be
##  converted to vtkPolyData (i.e., vtkPolyData) are appended to the output.
##
##  All cells are extracted and appended, but point and cell attributes (i.e., scalars,
##  vectors, normals, field data, etc.) are extracted and appended only if all datasets
##  have the same point and/or cell attributes available. (For example, if one dataset
##  has scalars but another does not, scalars will not be appended.)
##
##  Points can be merged if MergePoints is set to true. In this case, points are
##  really merged if there are no ghost cells and no global point ids, or if
##  there are global point ids. In the case of the presence of global point ids,
##  the filter exclusively relies on those ids, not checking if points are
##  coincident. It assumes that the global ids were properly set. In the case of
##  the absence of global ids, points withing Tolerance are merged.
##
##  @sa
##  vtkAppendFilter vtkAppendPolyData
##

import
  vtkFiltersCoreModule, vtkPointSetAlgorithm

discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetCollection"
type
  vtkAppendDataSets* {.importcpp: "vtkAppendDataSets",
                      header: "vtkAppendDataSets.h", bycopy.} = object of vtkPointSetAlgorithm
    vtkAppendDataSets* {.importc: "vtkAppendDataSets".}: VTK_NEWINSTANCE
    ##  Tolerance used for point merging
    ##  If true, tolerance is used as is. If false, tolerance is multiplied by
    ##  the diagonal of the bounding box of the input.
    ##  Output data set type.
    ##  Precision of output points.


proc New*(): ptr vtkAppendDataSets {.importcpp: "vtkAppendDataSets::New(@)",
                                 header: "vtkAppendDataSets.h".}
type
  vtkAppendDataSetsSuperclass* = vtkPointSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAppendDataSets::IsTypeOf(@)", header: "vtkAppendDataSets.h".}
proc IsA*(this: var vtkAppendDataSets; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAppendDataSets.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAppendDataSets {.
    importcpp: "vtkAppendDataSets::SafeDownCast(@)", header: "vtkAppendDataSets.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAppendDataSets :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAppendDataSets :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAppendDataSets :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAppendDataSets; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAppendDataSets.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set if the filter should merge coincidental points
##  Note: The filter will only merge points if the ghost cell array doesn't exist
##  Defaults to Off
##  virtual bool GetMergePointsMergePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MergePoints  of  << this -> MergePoints ) ; return this -> MergePoints ; } ;
## Error: expected ';'!!!

proc SetMergePoints*(this: var vtkAppendDataSets; _arg: bool) {.
    importcpp: "SetMergePoints", header: "vtkAppendDataSets.h".}
proc MergePointsOn*(this: var vtkAppendDataSets) {.importcpp: "MergePointsOn",
    header: "vtkAppendDataSets.h".}
proc MergePointsOff*(this: var vtkAppendDataSets) {.importcpp: "MergePointsOff",
    header: "vtkAppendDataSets.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the tolerance to use to find coincident points when `MergePoints`
  ##  is `true`. Default is 0.0.
  ##
  ##  This is simply passed on to the internal vtkLocator used to merge points.
  ##  @sa `vtkLocator::SetTolerance`.
  ##
proc SetTolerance*(this: var vtkAppendDataSets; _arg: cdouble) {.
    importcpp: "SetTolerance", header: "vtkAppendDataSets.h".}
proc GetToleranceMinValue*(this: var vtkAppendDataSets): cdouble {.
    importcpp: "GetToleranceMinValue", header: "vtkAppendDataSets.h".}
proc GetToleranceMaxValue*(this: var vtkAppendDataSets): cdouble {.
    importcpp: "GetToleranceMaxValue", header: "vtkAppendDataSets.h".}
## !!!Ignored construct:  virtual double GetMergePointsMergePointsTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetMergePointsToleranceIsAbsolute*(this: var vtkAppendDataSets; _arg: bool) {.
    importcpp: "SetMergePointsToleranceIsAbsolute", header: "vtkAppendDataSets.h".}
## !!!Ignored construct:  virtual bool GetMergePointsMergePointsToleranceToleranceIsAbsolute ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ToleranceIsAbsolute  of  << this -> ToleranceIsAbsolute ) ; return this -> ToleranceIsAbsolute ; } ;
## Error: expected ';'!!!

proc ToleranceIsAbsoluteOn*(this: var vtkAppendDataSets) {.
    importcpp: "ToleranceIsAbsoluteOn", header: "vtkAppendDataSets.h".}
proc ToleranceIsAbsoluteOff*(this: var vtkAppendDataSets) {.
    importcpp: "ToleranceIsAbsoluteOff", header: "vtkAppendDataSets.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the output type produced by this filter. Only input datasets compatible with the
  ##  output type will be merged in the output. For example, if the output type is vtkPolyData, then
  ##  blocks of type vtkImageData, vtkStructuredGrid, etc. will not be merged - only vtkPolyData
  ##  can be merged into a vtkPolyData. On the other hand, if the output type is
  ##  vtkUnstructuredGrid, then blocks of almost any type will be merged in the output.
  ##  Valid values are VTK_POLY_DATA and VTK_UNSTRUCTURED_GRID defined in vtkType.h.
  ##  Defaults to VTK_UNSTRUCTURED_GRID.
  ##
proc SetMergePointsToleranceIsAbsoluteOutputDataSetType*(
    this: var vtkAppendDataSets; _arg: cint) {.
    importcpp: "SetMergePointsToleranceIsAbsoluteOutputDataSetType",
    header: "vtkAppendDataSets.h".}
## !!!Ignored construct:  virtual int GetMergePointsMergePointsToleranceToleranceIsAbsoluteOutputDataSetType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputDataSetType  of  << this -> OutputDataSetType ) ; return this -> OutputDataSetType ; } ;
## Error: expected ';'!!!

proc SetToleranceOutputPointsPrecision*(this: var vtkAppendDataSets; _arg: cint) {.
    importcpp: "SetToleranceOutputPointsPrecision", header: "vtkAppendDataSets.h".}
proc GetToleranceMinValueOutputPointsPrecisionMinValue*(
    this: var vtkAppendDataSets): cint {.importcpp: "GetToleranceMinValueOutputPointsPrecisionMinValue",
                                     header: "vtkAppendDataSets.h".}
proc GetToleranceMaxValueOutputPointsPrecisionMaxValue*(
    this: var vtkAppendDataSets): cint {.importcpp: "GetToleranceMaxValueOutputPointsPrecisionMaxValue",
                                     header: "vtkAppendDataSets.h".}
## !!!Ignored construct:  virtual int GetMergePointsMergePointsToleranceToleranceIsAbsoluteOutputDataSetTypeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc ProcessRequest*(this: var vtkAppendDataSets; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkAppendDataSets.h".}