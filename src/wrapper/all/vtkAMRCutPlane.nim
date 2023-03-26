## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRCutPlane.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRCutPlane
##
##
##   A concrete instance of vtkMultiBlockDataSet that provides functionality for
##  cutting an AMR dataset (an instance of vtkOverlappingAMR) with user supplied
##  implicit plane function defined by a normal and center.
##

import
  vtkFiltersAMRModule, vtkMultiBlockDataSetAlgorithm

discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkOverlappingAMR"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkIndent"
discard "forward decl of vtkPlane"
discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkCell"
discard "forward decl of vtkPoints"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkCellData"
type
  vtkAMRCutPlane* {.importcpp: "vtkAMRCutPlane", header: "vtkAMRCutPlane.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkAMRCutPlane* {.importc: "vtkAMRCutPlane".}: VTK_NEWINSTANCE


proc New*(): ptr vtkAMRCutPlane {.importcpp: "vtkAMRCutPlane::New(@)",
                              header: "vtkAMRCutPlane.h".}
type
  vtkAMRCutPlaneSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAMRCutPlane::IsTypeOf(@)", header: "vtkAMRCutPlane.h".}
proc IsA*(this: var vtkAMRCutPlane; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkAMRCutPlane.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAMRCutPlane {.
    importcpp: "vtkAMRCutPlane::SafeDownCast(@)", header: "vtkAMRCutPlane.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAMRCutPlane :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRCutPlane :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRCutPlane :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAMRCutPlane; oss: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAMRCutPlane.h".}
proc SetCenter*(this: var vtkAMRCutPlane; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenter", header: "vtkAMRCutPlane.h".}
proc SetCenter*(this: var vtkAMRCutPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkAMRCutPlane.h".}
  ## /@}
  ## /@{
  ## *
  ##  Sets the normal
  ##
proc SetCenterNormal*(this: var vtkAMRCutPlane; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetCenterNormal",
                                     header: "vtkAMRCutPlane.h".}
proc SetCenterNormal*(this: var vtkAMRCutPlane; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterNormal", header: "vtkAMRCutPlane.h".}
  ## /@}
  ## /@{
  ## *
  ##  Sets the level of resolution
  ##
proc SetLevelOfResolution*(this: var vtkAMRCutPlane; _arg: cint) {.
    importcpp: "SetLevelOfResolution", header: "vtkAMRCutPlane.h".}
## !!!Ignored construct:  virtual int GetLevelOfResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LevelOfResolution  of  << this -> LevelOfResolution ) ; return this -> LevelOfResolution ; } ;
## Error: expected ';'!!!

proc SetLevelOfResolutionUseNativeCutter*(this: var vtkAMRCutPlane; _arg: bool) {.
    importcpp: "SetLevelOfResolutionUseNativeCutter", header: "vtkAMRCutPlane.h".}
## !!!Ignored construct:  virtual bool GetLevelOfResolutionUseNativeCutter ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseNativeCutter  of  << this -> UseNativeCutter ) ; return this -> UseNativeCutter ; } ;
## Error: expected ';'!!!

proc UseNativeCutterOn*(this: var vtkAMRCutPlane) {.importcpp: "UseNativeCutterOn",
    header: "vtkAMRCutPlane.h".}
proc UseNativeCutterOff*(this: var vtkAMRCutPlane) {.
    importcpp: "UseNativeCutterOff", header: "vtkAMRCutPlane.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get a multiprocess controller for parallel processing.
  ##  By default this parameter is set to nullptr by the constructor.
  ##
proc SetController*(this: var vtkAMRCutPlane; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkAMRCutPlane.h".}
proc GetnameController*(this: var vtkAMRCutPlane): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkAMRCutPlane.h".}
  ## /@}
  ##  Standard pipeline routines
proc RequestData*(this: var vtkAMRCutPlane; a2: ptr vtkInformation;
                 a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestData", header: "vtkAMRCutPlane.h".}
proc FillInputPortInformation*(this: var vtkAMRCutPlane; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkAMRCutPlane.h".}
proc FillOutputPortInformation*(this: var vtkAMRCutPlane; port: cint;
                               info: ptr vtkInformation): cint {.
    importcpp: "FillOutputPortInformation", header: "vtkAMRCutPlane.h".}
proc RequestInformation*(this: var vtkAMRCutPlane; rqst: ptr vtkInformation;
                        inputVector: ptr ptr vtkInformationVector;
                        outputVector: ptr vtkInformationVector): cint {.
    importcpp: "RequestInformation", header: "vtkAMRCutPlane.h".}
proc RequestUpdateExtent*(this: var vtkAMRCutPlane; a2: ptr vtkInformation;
                         a3: ptr ptr vtkInformationVector;
                         a4: ptr vtkInformationVector): cint {.
    importcpp: "RequestUpdateExtent", header: "vtkAMRCutPlane.h".}