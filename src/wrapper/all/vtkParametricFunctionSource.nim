## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkParametricFunctionSource.h
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
##  @class   vtkParametricFunctionSource
##  @brief   tessellate parametric functions
##
##  This class tessellates parametric functions. The user must specify how
##  many points in the parametric coordinate directions are required (i.e.,
##  the resolution), and the mode to use to generate scalars.
##
##  @par Thanks:
##  Andrew Maclean andrew.amaclean@gmail.com for creating and contributing
##  the class.
##
##  @sa
##  vtkParametricFunction
##
##  @sa
##  Implementation of parametrics for 1D lines:
##  vtkParametricSpline
##
##  @sa
##  Subclasses of vtkParametricFunction implementing non-orentable surfaces:
##  vtkParametricBoy vtkParametricCrossCap vtkParametricFigure8Klein
##  vtkParametricKlein vtkParametricMobius vtkParametricRoman
##
##  @sa
##  Subclasses of vtkParametricFunction implementing orientable surfaces:
##  vtkParametricConicSpiral vtkParametricDini vtkParametricEllipsoid
##  vtkParametricEnneper vtkParametricRandomHills vtkParametricSuperEllipsoid
##  vtkParametricSuperToroid vtkParametricTorus
##
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

discard "forward decl of vtkCellArray"
discard "forward decl of vtkParametricFunction"
type
  vtkParametricFunctionSource* {.importcpp: "vtkParametricFunctionSource",
                                header: "vtkParametricFunctionSource.h", bycopy.} = object of vtkPolyDataAlgorithm ##  Create output depending on function dimension
    vtkParametricFunctionSource* {.importc: "vtkParametricFunctionSource".}: VTK_NEWINSTANCE

  vtkParametricFunctionSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkParametricFunctionSource::IsTypeOf(@)",
    header: "vtkParametricFunctionSource.h".}
proc IsA*(this: var vtkParametricFunctionSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkParametricFunctionSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkParametricFunctionSource {.
    importcpp: "vtkParametricFunctionSource::SafeDownCast(@)",
    header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkParametricFunctionSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkParametricFunctionSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkParametricFunctionSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkParametricFunctionSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkParametricFunctionSource.h".}
proc New*(): ptr vtkParametricFunctionSource {.
    importcpp: "vtkParametricFunctionSource::New(@)",
    header: "vtkParametricFunctionSource.h".}
proc SetParametricFunction*(this: var vtkParametricFunctionSource;
                           a2: ptr vtkParametricFunction) {.
    importcpp: "SetParametricFunction", header: "vtkParametricFunctionSource.h".}
proc GetnameParametricFunction*(this: var vtkParametricFunctionSource): ptr vtkParametricFunction {.
    importcpp: "GetnameParametricFunction",
    header: "vtkParametricFunctionSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the number of subdivisions / tessellations in the u parametric
  ##  direction. Note that the number of tessellant points in the u
  ##  direction is the UResolution + 1.
  ##
proc SetUResolution*(this: var vtkParametricFunctionSource; _arg: cint) {.
    importcpp: "SetUResolution", header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMinValue*(this: var vtkParametricFunctionSource): cint {.
    importcpp: "GetUResolutionMinValue", header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMaxValue*(this: var vtkParametricFunctionSource): cint {.
    importcpp: "GetUResolutionMaxValue", header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual int GetUResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UResolution  of  << this -> UResolution ) ; return this -> UResolution ; } ;
## Error: expected ';'!!!

proc SetUResolutionVResolution*(this: var vtkParametricFunctionSource; _arg: cint) {.
    importcpp: "SetUResolutionVResolution",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMinValueVResolutionMinValue*(
    this: var vtkParametricFunctionSource): cint {.
    importcpp: "GetUResolutionMinValueVResolutionMinValue",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMaxValueVResolutionMaxValue*(
    this: var vtkParametricFunctionSource): cint {.
    importcpp: "GetUResolutionMaxValueVResolutionMaxValue",
    header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual int GetUResolutionVResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VResolution  of  << this -> VResolution ) ; return this -> VResolution ; } ;
## Error: expected ';'!!!

proc SetUResolutionVResolutionWResolution*(this: var vtkParametricFunctionSource;
    _arg: cint) {.importcpp: "SetUResolutionVResolutionWResolution",
                header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMinValueVResolutionMinValueWResolutionMinValue*(
    this: var vtkParametricFunctionSource): cint {.
    importcpp: "GetUResolutionMinValueVResolutionMinValueWResolutionMinValue",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValue*(
    this: var vtkParametricFunctionSource): cint {.
    importcpp: "GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValue",
    header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual int GetUResolutionVResolutionWResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WResolution  of  << this -> WResolution ) ; return this -> WResolution ; } ;
## Error: expected ';'!!!

proc GenerateTextureCoordinatesOn*(this: var vtkParametricFunctionSource) {.
    importcpp: "GenerateTextureCoordinatesOn",
    header: "vtkParametricFunctionSource.h".}
proc GenerateTextureCoordinatesOff*(this: var vtkParametricFunctionSource) {.
    importcpp: "GenerateTextureCoordinatesOff",
    header: "vtkParametricFunctionSource.h".}
proc SetUResolutionVResolutionWResolutionGenerateTextureCoordinates*(
    this: var vtkParametricFunctionSource; _arg: vtkTypeBool) {.importcpp: "SetUResolutionVResolutionWResolutionGenerateTextureCoordinates",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMinValueVResolutionMinValueWResolutionMinValueGenerateTextureCoordinatesMinValue*(
    this: var vtkParametricFunctionSource): vtkTypeBool {.importcpp: "GetUResolutionMinValueVResolutionMinValueWResolutionMinValueGenerateTextureCoordinatesMinValue",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValueGenerateTextureCoordinatesMaxValue*(
    this: var vtkParametricFunctionSource): vtkTypeBool {.importcpp: "GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValueGenerateTextureCoordinatesMaxValue",
    header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUResolutionVResolutionWResolutionGenerateTextureCoordinates ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTextureCoordinates  of  << this -> GenerateTextureCoordinates ) ; return this -> GenerateTextureCoordinates ; } ;
## Error: expected ';'!!!

proc GenerateNormalsOn*(this: var vtkParametricFunctionSource) {.
    importcpp: "GenerateNormalsOn", header: "vtkParametricFunctionSource.h".}
proc GenerateNormalsOff*(this: var vtkParametricFunctionSource) {.
    importcpp: "GenerateNormalsOff", header: "vtkParametricFunctionSource.h".}
proc SetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormals*(
    this: var vtkParametricFunctionSource; _arg: vtkTypeBool) {.importcpp: "SetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormals",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMinValueVResolutionMinValueWResolutionMinValueGenerateTextureCoordinatesMinValueGenerateNormalsMinValue*(
    this: var vtkParametricFunctionSource): vtkTypeBool {.importcpp: "GetUResolutionMinValueVResolutionMinValueWResolutionMinValueGenerateTextureCoordinatesMinValueGenerateNormalsMinValue",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValueGenerateTextureCoordinatesMaxValueGenerateNormalsMaxValue*(
    this: var vtkParametricFunctionSource): vtkTypeBool {.importcpp: "GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValueGenerateTextureCoordinatesMaxValueGenerateNormalsMaxValue",
    header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateNormals  of  << this -> GenerateNormals ) ; return this -> GenerateNormals ; } ;
## Error: expected ';'!!!

type
  vtkParametricFunctionSourceSCALAR_MODE* {.size: sizeof(cint),
      importcpp: "vtkParametricFunctionSource::SCALAR_MODE",
      header: "vtkParametricFunctionSource.h".} = enum
    SCALAR_NONE = 0, SCALAR_U, SCALAR_V, SCALAR_U0, SCALAR_V0, SCALAR_U0V0,
    SCALAR_MODULUS, SCALAR_PHASE, SCALAR_QUADRANT, SCALAR_X, SCALAR_Y, SCALAR_Z,
    SCALAR_DISTANCE, SCALAR_FUNCTION_DEFINED


proc SetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormalsScalarMode*(
    this: var vtkParametricFunctionSource; _arg: cint) {.importcpp: "SetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormalsScalarMode",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMinValueVResolutionMinValueWResolutionMinValueGenerateTextureCoordinatesMinValueGenerateNormalsMinValueScalarModeMinValue*(
    this: var vtkParametricFunctionSource): cint {.importcpp: "GetUResolutionMinValueVResolutionMinValueWResolutionMinValueGenerateTextureCoordinatesMinValueGenerateNormalsMinValueScalarModeMinValue",
    header: "vtkParametricFunctionSource.h".}
proc GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValueGenerateTextureCoordinatesMaxValueGenerateNormalsMaxValueScalarModeMaxValue*(
    this: var vtkParametricFunctionSource): cint {.importcpp: "GetUResolutionMaxValueVResolutionMaxValueWResolutionMaxValueGenerateTextureCoordinatesMaxValueGenerateNormalsMaxValueScalarModeMaxValue",
    header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual int GetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormalsScalarMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarMode  of  << this -> ScalarMode ) ; return this -> ScalarMode ; } ;
## Error: expected ';'!!!

proc SetScalarModeToNone*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToNone", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToU*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToU", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToV*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToV", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToU0*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToU0", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToV0*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToV0", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToU0V0*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToU0V0", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToModulus*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToModulus", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToPhase*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToPhase", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToQuadrant*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToQuadrant", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToX*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToX", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToY*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToY", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToZ*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToZ", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToDistance*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToDistance", header: "vtkParametricFunctionSource.h".}
proc SetScalarModeToFunctionDefined*(this: var vtkParametricFunctionSource) {.
    importcpp: "SetScalarModeToFunctionDefined",
    header: "vtkParametricFunctionSource.h".}
proc GetMTime*(this: var vtkParametricFunctionSource): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkParametricFunctionSource.h".}
proc SetOutputPointsPrecision*(this: var vtkParametricFunctionSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkParametricFunctionSource.h".}
## !!!Ignored construct:  virtual int GetUResolutionVResolutionWResolutionGenerateTextureCoordinatesGenerateNormalsScalarModeOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
