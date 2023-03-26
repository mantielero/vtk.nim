## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataTangents.h
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
##  @class   vtkPolyDataTangents
##  @brief   compute tangents for triangulated polydata
##
##  vtkPolyDataTangents is a filter that computes point and/or cell tangents for a triangulated
##  polydata.
##  This filter requires an input with both normals and tcoords on points.
##

import
  vtkFiltersCoreModule, vtkPolyDataAlgorithm

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPolyData"
type
  vtkPolyDataTangents* {.importcpp: "vtkPolyDataTangents",
                        header: "vtkPolyDataTangents.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkPolyDataTangents* {.importc: "vtkPolyDataTangents".}: VTK_NEWINSTANCE

  vtkPolyDataTangentsSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyDataTangents::IsTypeOf(@)", header: "vtkPolyDataTangents.h".}
proc IsA*(this: var vtkPolyDataTangents; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyDataTangents.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyDataTangents {.
    importcpp: "vtkPolyDataTangents::SafeDownCast(@)",
    header: "vtkPolyDataTangents.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyDataTangents :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataTangents :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataTangents :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyDataTangents; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyDataTangents.h".}
proc New*(): ptr vtkPolyDataTangents {.importcpp: "vtkPolyDataTangents::New(@)",
                                   header: "vtkPolyDataTangents.h".}
proc SetComputePointTangents*(this: var vtkPolyDataTangents; _arg: bool) {.
    importcpp: "SetComputePointTangents", header: "vtkPolyDataTangents.h".}
## !!!Ignored construct:  virtual bool GetComputePointTangents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputePointTangents  of  << this -> ComputePointTangents ) ; return this -> ComputePointTangents ; } ;
## Error: expected ';'!!!

proc ComputePointTangentsOn*(this: var vtkPolyDataTangents) {.
    importcpp: "ComputePointTangentsOn", header: "vtkPolyDataTangents.h".}
proc ComputePointTangentsOff*(this: var vtkPolyDataTangents) {.
    importcpp: "ComputePointTangentsOff", header: "vtkPolyDataTangents.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the computation of cell tangents.
  ##  Default is false.
  ##
proc SetComputePointTangentsComputeCellTangents*(this: var vtkPolyDataTangents;
    _arg: bool) {.importcpp: "SetComputePointTangentsComputeCellTangents",
                header: "vtkPolyDataTangents.h".}
## !!!Ignored construct:  virtual bool GetComputePointTangentsComputeCellTangents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeCellTangents  of  << this -> ComputeCellTangents ) ; return this -> ComputeCellTangents ; } ;
## Error: expected ';'!!!

proc ComputeCellTangentsOn*(this: var vtkPolyDataTangents) {.
    importcpp: "ComputeCellTangentsOn", header: "vtkPolyDataTangents.h".}
proc ComputeCellTangentsOff*(this: var vtkPolyDataTangents) {.
    importcpp: "ComputeCellTangentsOff", header: "vtkPolyDataTangents.h".}
  ## /@}