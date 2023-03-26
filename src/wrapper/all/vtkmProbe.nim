## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class   vtkmProbe
##  @brief   Sample data at specified point locations
##
##  vtkmProbe is a filter that computes point attributes(e.g., scalars, vectors,
##  etc.) at specific point positions using the probe filter in VTK-m. The
##  filter has two inputs: the Input and Source.
##  The Input geometric structure is passed through the filter. The point
##  attributes are computed at the Input point positions by interpolating into
##  the source data. For example, we can compute data values on a plane(plane
##  specified as Input from a volume(Source). The source geometry must have cellSet
##  defined otherwise the vtkm filter won't work. The cell data of the source data
##  is copied to the output based on in which source cell each input point is. If
##  an array of the same name exists both in source's point and cell data, only
##  the one from the point data is probed. The valid point result is stored as
##  a field array whose default name is "vtkValidPointMask" in the point data and
##  the valid cell result(Invalid cells are the cells with at least one invalid
##  point) is stored as a field array whose default name is "vtkValidCellMask" in
##  the cell data.
##
##  This filter can be used to resample data, or convert one dataset form into
##  another. For example, an unstructured grid (vtkUnstructuredGrid) can be
##  probed with a volume (three-dimensional vtkImageData), and then volume
##  rendering techniques can be used to visualize the results. Another example:
##  a line or curve can be used to probe data to produce x-y plots along
##  that line or curve.
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkDataSetAlgorithm

type
  vtkmProbe* {.importcpp: "vtkmProbe", header: "vtkmProbe.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkmProbe* {.importc: "vtkmProbe".}: VTK_NEWINSTANCE

  vtkmProbeSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkmProbe::IsTypeOf(@)",
    header: "vtkmProbe.h".}
proc IsA*(this: var vtkmProbe; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmProbe.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmProbe {.
    importcpp: "vtkmProbe::SafeDownCast(@)", header: "vtkmProbe.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmProbe :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmProbe :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmProbe :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmProbe; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmProbe.h".}
proc New*(): ptr vtkmProbe {.importcpp: "vtkmProbe::New(@)", header: "vtkmProbe.h".}
proc SetSourceData*(this: var vtkmProbe; source: ptr vtkDataObject) {.
    importcpp: "SetSourceData", header: "vtkmProbe.h".}
proc GetSource*(this: var vtkmProbe): ptr vtkDataObject {.importcpp: "GetSource",
    header: "vtkmProbe.h".}
proc SetSourceConnection*(this: var vtkmProbe; algOutput: ptr vtkAlgorithmOutput) {.
    importcpp: "SetSourceConnection", header: "vtkmProbe.h".}
proc SetPassCellArrays*(this: var vtkmProbe; _arg: vtkTypeBool) {.
    importcpp: "SetPassCellArrays", header: "vtkmProbe.h".}
proc PassCellArraysOn*(this: var vtkmProbe) {.importcpp: "PassCellArraysOn",
    header: "vtkmProbe.h".}
proc PassCellArraysOff*(this: var vtkmProbe) {.importcpp: "PassCellArraysOff",
    header: "vtkmProbe.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPassCellArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassCellArrays  of  << this -> PassCellArrays ) ; return this -> PassCellArrays ; } ;
## Error: expected ';'!!!

proc SetPassCellArraysPassPointArrays*(this: var vtkmProbe; _arg: vtkTypeBool) {.
    importcpp: "SetPassCellArraysPassPointArrays", header: "vtkmProbe.h".}
proc PassPointArraysOn*(this: var vtkmProbe) {.importcpp: "PassPointArraysOn",
    header: "vtkmProbe.h".}
proc PassPointArraysOff*(this: var vtkmProbe) {.importcpp: "PassPointArraysOff",
    header: "vtkmProbe.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPassCellArraysPassPointArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPointArrays  of  << this -> PassPointArrays ) ; return this -> PassPointArrays ; } ;
## Error: expected ';'!!!

proc SetPassCellArraysPassPointArraysPassFieldArrays*(this: var vtkmProbe;
    _arg: vtkTypeBool) {.importcpp: "SetPassCellArraysPassPointArraysPassFieldArrays",
                       header: "vtkmProbe.h".}
proc PassFieldArraysOn*(this: var vtkmProbe) {.importcpp: "PassFieldArraysOn",
    header: "vtkmProbe.h".}
proc PassFieldArraysOff*(this: var vtkmProbe) {.importcpp: "PassFieldArraysOff",
    header: "vtkmProbe.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetPassCellArraysPassPointArraysPassFieldArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassFieldArrays  of  << this -> PassFieldArrays ) ; return this -> PassFieldArrays ; } ;
## Error: expected ';'!!!

proc SetPassCellArraysPassPointArraysPassFieldArraysValidPointMaskArrayName*(
    this: var vtkmProbe; _arg: string) {.importcpp: "SetPassCellArraysPassPointArraysPassFieldArraysValidPointMaskArrayName",
                                    header: "vtkmProbe.h".}
## !!!Ignored construct:  virtual std :: string GetPassCellArraysPassPointArraysPassFieldArraysValidPointMaskArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValidPointMaskArrayName  of  << this -> ValidPointMaskArrayName ) ; return this -> ValidPointMaskArrayName ; } ;
## Error: expected ';'!!!

proc SetPassCellArraysPassPointArraysPassFieldArraysValidPointMaskArrayNameValidCellMaskArrayName*(
    this: var vtkmProbe; _arg: string) {.importcpp: "SetPassCellArraysPassPointArraysPassFieldArraysValidPointMaskArrayNameValidCellMaskArrayName",
                                    header: "vtkmProbe.h".}
## !!!Ignored construct:  virtual std :: string GetPassCellArraysPassPointArraysPassFieldArraysValidPointMaskArrayNameValidCellMaskArrayName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ValidCellMaskArrayName  of  << this -> ValidCellMaskArrayName ) ; return this -> ValidCellMaskArrayName ; } ;
## Error: expected ';'!!!
