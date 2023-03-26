## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractVolumeMapper.h
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
##  @class   vtkAbstractVolumeMapper
##  @brief   Abstract class for a volume mapper
##
##
##  vtkAbstractVolumeMapper is the abstract definition of a volume mapper.
##  Specific subclasses deal with different specific types of data input
##
##  @sa
##  vtkVolumeMapper vtkUnstructuredGridVolumeMapper
##

import
  vtkAbstractMapper3D, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkVolume"
discard "forward decl of vtkWindow"
discard "forward decl of vtkDataSet"
type
  vtkAbstractVolumeMapper* {.importcpp: "vtkAbstractVolumeMapper",
                            header: "vtkAbstractVolumeMapper.h", bycopy.} = object of vtkAbstractMapper3D
    vtkAbstractVolumeMapper* {.importc: "vtkAbstractVolumeMapper".}: VTK_NEWINSTANCE

  vtkAbstractVolumeMapperSuperclass* = vtkAbstractMapper3D

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractVolumeMapper::IsTypeOf(@)",
    header: "vtkAbstractVolumeMapper.h".}
proc IsA*(this: var vtkAbstractVolumeMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractVolumeMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractVolumeMapper {.
    importcpp: "vtkAbstractVolumeMapper::SafeDownCast(@)",
    header: "vtkAbstractVolumeMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractMapper3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractVolumeMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractVolumeMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractVolumeMapper.h".}
proc GetDataSetInput*(this: var vtkAbstractVolumeMapper): ptr vtkDataSet {.
    importcpp: "GetDataSetInput", header: "vtkAbstractVolumeMapper.h".}
proc GetDataObjectInput*(this: var vtkAbstractVolumeMapper): ptr vtkDataObject {.
    importcpp: "GetDataObjectInput", header: "vtkAbstractVolumeMapper.h".}
## !!!Ignored construct:  /@} /@{ *
##  Return bounding box (array of six doubles) of data expressed as
##  (xmin,xmax, ymin,ymax, zmin,zmax).
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkAbstractVolumeMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkAbstractVolumeMapper.h".}
proc SetScalarMode*(this: var vtkAbstractVolumeMapper; _arg: cint) {.
    importcpp: "SetScalarMode", header: "vtkAbstractVolumeMapper.h".}
## !!!Ignored construct:  virtual int GetScalarMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarMode  of  << this -> ScalarMode ) ; return this -> ScalarMode ; } ;
## Error: expected ';'!!!

proc SetScalarModeArrayAccessMode*(this: var vtkAbstractVolumeMapper; _arg: cint) {.
    importcpp: "SetScalarModeArrayAccessMode", header: "vtkAbstractVolumeMapper.h".}
proc SetScalarModeToDefault*(this: var vtkAbstractVolumeMapper) {.
    importcpp: "SetScalarModeToDefault", header: "vtkAbstractVolumeMapper.h".}
proc SetScalarModeToUsePointData*(this: var vtkAbstractVolumeMapper) {.
    importcpp: "SetScalarModeToUsePointData", header: "vtkAbstractVolumeMapper.h".}
proc SetScalarModeToUseCellData*(this: var vtkAbstractVolumeMapper) {.
    importcpp: "SetScalarModeToUseCellData", header: "vtkAbstractVolumeMapper.h".}
proc SetScalarModeToUsePointFieldData*(this: var vtkAbstractVolumeMapper) {.
    importcpp: "SetScalarModeToUsePointFieldData",
    header: "vtkAbstractVolumeMapper.h".}
proc SetScalarModeToUseCellFieldData*(this: var vtkAbstractVolumeMapper) {.
    importcpp: "SetScalarModeToUseCellFieldData",
    header: "vtkAbstractVolumeMapper.h".}
proc SelectScalarArray*(this: var vtkAbstractVolumeMapper; arrayNum: cint) {.
    importcpp: "SelectScalarArray", header: "vtkAbstractVolumeMapper.h".}
proc SelectScalarArray*(this: var vtkAbstractVolumeMapper; arrayName: cstring) {.
    importcpp: "SelectScalarArray", header: "vtkAbstractVolumeMapper.h".}
proc GetArrayName*(this: var vtkAbstractVolumeMapper): cstring {.
    importcpp: "GetArrayName", header: "vtkAbstractVolumeMapper.h".}
proc GetArrayId*(this: var vtkAbstractVolumeMapper): cint {.importcpp: "GetArrayId",
    header: "vtkAbstractVolumeMapper.h".}
proc GetArrayAccessMode*(this: var vtkAbstractVolumeMapper): cint {.
    importcpp: "GetArrayAccessMode", header: "vtkAbstractVolumeMapper.h".}
proc GetScalarModeAsString*(this: var vtkAbstractVolumeMapper): cstring {.
    importcpp: "GetScalarModeAsString", header: "vtkAbstractVolumeMapper.h".}
proc GetGradientMagnitudeScale*(this: var vtkAbstractVolumeMapper): cfloat {.
    importcpp: "GetGradientMagnitudeScale", header: "vtkAbstractVolumeMapper.h".}
proc GetGradientMagnitudeBias*(this: var vtkAbstractVolumeMapper): cfloat {.
    importcpp: "GetGradientMagnitudeBias", header: "vtkAbstractVolumeMapper.h".}
proc GetGradientMagnitudeScale*(this: var vtkAbstractVolumeMapper; a2: cint): cfloat {.
    importcpp: "GetGradientMagnitudeScale", header: "vtkAbstractVolumeMapper.h".}
proc GetGradientMagnitudeBias*(this: var vtkAbstractVolumeMapper; a2: cint): cfloat {.
    importcpp: "GetGradientMagnitudeBias", header: "vtkAbstractVolumeMapper.h".}
proc Render*(this: var vtkAbstractVolumeMapper; ren: ptr vtkRenderer;
            vol: ptr vtkVolume) {.importcpp: "Render",
                               header: "vtkAbstractVolumeMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkAbstractVolumeMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkAbstractVolumeMapper.h".}