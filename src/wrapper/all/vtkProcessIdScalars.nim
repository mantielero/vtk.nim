## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProcessIdScalars.h
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
##  @class   vtkProcessIdScalars
##  @brief   Sets cell or point scalars to the processor rank.
##
##
##  vtkProcessIdScalars is meant to display which processor owns which cells
##  and points.  It is useful for visualizing the partitioning for
##  streaming or distributed pipelines.
##
##  @sa
##  vtkPolyDataStreamer
##

import
  vtkDataSetAlgorithm, vtkFiltersParallelModule

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkMultiProcessController"
type
  vtkProcessIdScalars* {.importcpp: "vtkProcessIdScalars",
                        header: "vtkProcessIdScalars.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkProcessIdScalars* {.importc: "vtkProcessIdScalars".}: VTK_NEWINSTANCE


proc New*(): ptr vtkProcessIdScalars {.importcpp: "vtkProcessIdScalars::New(@)",
                                   header: "vtkProcessIdScalars.h".}
type
  vtkProcessIdScalarsSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkProcessIdScalars::IsTypeOf(@)", header: "vtkProcessIdScalars.h".}
proc IsA*(this: var vtkProcessIdScalars; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkProcessIdScalars.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkProcessIdScalars {.
    importcpp: "vtkProcessIdScalars::SafeDownCast(@)",
    header: "vtkProcessIdScalars.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkProcessIdScalars :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProcessIdScalars :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProcessIdScalars :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkProcessIdScalars; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkProcessIdScalars.h".}
proc SetScalarModeToCellData*(this: var vtkProcessIdScalars) {.
    importcpp: "SetScalarModeToCellData", header: "vtkProcessIdScalars.h".}
proc SetScalarModeToPointData*(this: var vtkProcessIdScalars) {.
    importcpp: "SetScalarModeToPointData", header: "vtkProcessIdScalars.h".}
proc SetCellScalarsFlag*(this: var vtkProcessIdScalars; _arg: cint) {.
    importcpp: "SetCellScalarsFlag", header: "vtkProcessIdScalars.h".}
proc GetScalarMode*(this: var vtkProcessIdScalars): cint {.
    importcpp: "GetScalarMode", header: "vtkProcessIdScalars.h".}
proc SetCellScalarsFlagRandomMode*(this: var vtkProcessIdScalars; _arg: vtkTypeBool) {.
    importcpp: "SetCellScalarsFlagRandomMode", header: "vtkProcessIdScalars.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRandomMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RandomMode  of  << this -> RandomMode ) ; return this -> RandomMode ; } ;
## Error: expected ';'!!!

proc RandomModeOn*(this: var vtkProcessIdScalars) {.importcpp: "RandomModeOn",
    header: "vtkProcessIdScalars.h".}
proc RandomModeOff*(this: var vtkProcessIdScalars) {.importcpp: "RandomModeOff",
    header: "vtkProcessIdScalars.h".}
  ## /@}
  ## /@{
  ## *
  ##  By default this filter uses the global controller,
  ##  but this method can be used to set another instead.
  ##
proc SetController*(this: var vtkProcessIdScalars; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkProcessIdScalars.h".}
proc GetnameController*(this: var vtkProcessIdScalars): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkProcessIdScalars.h".}
  ## /@}