## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellQuality.h
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
##  @class   vtkCellQuality
##  @brief   Calculate functions of quality of the elements of a mesh
##
##  vtkCellQuality computes one or more functions of (geometric) quality for each
##  cell of a mesh.  The per-cell quality is added to the mesh's cell data, in an
##  array named "CellQuality." Cell types not supported by this filter or undefined
##  quality of supported cell types will have an entry of -1.
##
##  @warning
##  Most quadrilateral quality functions are intended for planar quadrilaterals
##  only.  The minimal angle is not, strictly speaking, a quality function, but
##  it is provided because of its usage by many authors.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##

import
  vtkDataSetAlgorithm, vtkFiltersVerdictModule, vtkMeshQuality

discard "forward decl of vtkCell"
discard "forward decl of vtkCellQualityFunctor"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkPoints"
type
  vtkCellQuality* {.importcpp: "vtkCellQuality", header: "vtkCellQuality.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkCellQuality* {.importc: "vtkCellQuality".}: VTK_NEWINSTANCE
    ##  Default return value for unsupported geometry
    ##  Default return value for qualities that are not well-defined for certain
    ##  types of supported geometries. e.g. volume of a triangle


proc PrintSelf*(this: var vtkCellQuality; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellQuality.h".}
type
  vtkCellQualitySuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellQuality::IsTypeOf(@)", header: "vtkCellQuality.h".}
proc IsA*(this: var vtkCellQuality; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCellQuality.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellQuality {.
    importcpp: "vtkCellQuality::SafeDownCast(@)", header: "vtkCellQuality.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellQuality :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellQuality :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellQuality :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkCellQuality {.importcpp: "vtkCellQuality::New(@)",
                              header: "vtkCellQuality.h".}
type
  QualityMeasureTypes* = QualityMeasureTypes

proc SetQualityMeasure*(this: var vtkCellQuality; _arg: QualityMeasureTypes) {.
    importcpp: "SetQualityMeasure", header: "vtkCellQuality.h".}
proc SetQualityMeasure*(this: var vtkCellQuality; measure: cint) {.
    importcpp: "SetQualityMeasure", header: "vtkCellQuality.h".}
proc GetQualityMeasure*(this: vtkCellQuality): QualityMeasureTypes {.noSideEffect,
    importcpp: "GetQualityMeasure", header: "vtkCellQuality.h".}
proc SetQualityMeasureToArea*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToArea", header: "vtkCellQuality.h".}
proc SetQualityMeasureToAspectFrobenius*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToAspectFrobenius", header: "vtkCellQuality.h".}
proc SetQualityMeasureToAspectGamma*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToAspectGamma", header: "vtkCellQuality.h".}
proc SetQualityMeasureToAspectRatio*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToAspectRatio", header: "vtkCellQuality.h".}
proc SetQualityMeasureToCollapseRatio*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToCollapseRatio", header: "vtkCellQuality.h".}
proc SetQualityMeasureToCondition*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToCondition", header: "vtkCellQuality.h".}
proc SetQualityMeasureToDiagonal*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToDiagonal", header: "vtkCellQuality.h".}
proc SetQualityMeasureToDimension*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToDimension", header: "vtkCellQuality.h".}
proc SetQualityMeasureToDistortion*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToDistortion", header: "vtkCellQuality.h".}
proc SetQualityMeasureToJacobian*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToJacobian", header: "vtkCellQuality.h".}
proc SetQualityMeasureToMaxAngle*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToMaxAngle", header: "vtkCellQuality.h".}
proc SetQualityMeasureToMaxAspectFrobenius*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToMaxAspectFrobenius", header: "vtkCellQuality.h".}
proc SetQualityMeasureToMaxEdgeRatio*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToMaxEdgeRatio", header: "vtkCellQuality.h".}
proc SetQualityMeasureToMedAspectFrobenius*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToMedAspectFrobenius", header: "vtkCellQuality.h".}
proc SetQualityMeasureToMinAngle*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToMinAngle", header: "vtkCellQuality.h".}
proc SetQualityMeasureToOddy*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToOddy", header: "vtkCellQuality.h".}
proc SetQualityMeasureToRadiusRatio*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToRadiusRatio", header: "vtkCellQuality.h".}
proc SetQualityMeasureToRelativeSizeSquared*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToRelativeSizeSquared",
    header: "vtkCellQuality.h".}
proc SetQualityMeasureToScaledJacobian*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToScaledJacobian", header: "vtkCellQuality.h".}
proc SetQualityMeasureToShapeAndSize*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToShapeAndSize", header: "vtkCellQuality.h".}
proc SetQualityMeasureToShape*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToShape", header: "vtkCellQuality.h".}
proc SetQualityMeasureToShearAndSize*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToShearAndSize", header: "vtkCellQuality.h".}
proc SetQualityMeasureToShear*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToShear", header: "vtkCellQuality.h".}
proc SetQualityMeasureToSkew*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToSkew", header: "vtkCellQuality.h".}
proc SetQualityMeasureToStretch*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToStretch", header: "vtkCellQuality.h".}
proc SetQualityMeasureToTaper*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToTaper", header: "vtkCellQuality.h".}
proc SetQualityMeasureToVolume*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToVolume", header: "vtkCellQuality.h".}
proc SetQualityMeasureToWarpage*(this: var vtkCellQuality) {.
    importcpp: "SetQualityMeasureToWarpage", header: "vtkCellQuality.h".}
proc SetUnsupportedGeometry*(this: var vtkCellQuality; _arg: cdouble) {.
    importcpp: "SetUnsupportedGeometry", header: "vtkCellQuality.h".}
## !!!Ignored construct:  virtual double GetUnsupportedGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UnsupportedGeometry  of  << this -> UnsupportedGeometry ) ; return this -> UnsupportedGeometry ; } ;
## Error: expected ';'!!!

proc SetUnsupportedGeometryUndefinedQuality*(this: var vtkCellQuality; _arg: cdouble) {.
    importcpp: "SetUnsupportedGeometryUndefinedQuality",
    header: "vtkCellQuality.h".}
## !!!Ignored construct:  virtual double GetUnsupportedGeometryUndefinedQuality ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UndefinedQuality  of  << this -> UndefinedQuality ) ; return this -> UndefinedQuality ; } ;
## Error: expected ';'!!!

proc TriangleStripArea*(this: var vtkCellQuality; a2: ptr vtkCell): cdouble {.
    importcpp: "TriangleStripArea", header: "vtkCellQuality.h".}
proc PixelArea*(this: var vtkCellQuality; a2: ptr vtkCell): cdouble {.
    importcpp: "PixelArea", header: "vtkCellQuality.h".}
proc PolygonArea*(this: var vtkCellQuality; a2: ptr vtkCell): cdouble {.
    importcpp: "PolygonArea", header: "vtkCellQuality.h".}