## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractMapper.h
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
##  @class   vtkAbstractMapper
##  @brief   abstract class specifies interface to map data
##
##  vtkAbstractMapper is an abstract class to specify interface between data and
##  graphics primitives or software rendering techniques. Subclasses of
##  vtkAbstractMapper can be used for rendering 2D data, geometry, or volumetric
##  data.
##
##  @sa
##  vtkAbstractMapper3D vtkMapper vtkPolyDataMapper vtkVolumeMapper
##

import
  vtkAlgorithm, vtkRenderingCoreModule

const
  VTK_SCALAR_MODE_DEFAULT* = 0
  VTK_SCALAR_MODE_USE_POINT_DATA* = 1
  VTK_SCALAR_MODE_USE_CELL_DATA* = 2
  VTK_SCALAR_MODE_USE_POINT_FIELD_DATA* = 3
  VTK_SCALAR_MODE_USE_CELL_FIELD_DATA* = 4
  VTK_SCALAR_MODE_USE_FIELD_DATA* = 5
  VTK_GET_ARRAY_BY_ID* = 0
  VTK_GET_ARRAY_BY_NAME* = 1

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPlaneCollection"
discard "forward decl of vtkPlanes"
discard "forward decl of vtkTimerLog"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkWindow"
type
  vtkAbstractMapper* {.importcpp: "vtkAbstractMapper",
                      header: "vtkAbstractMapper.h", bycopy.} = object of vtkAlgorithm
    vtkAbstractMapper* {.importc: "vtkAbstractMapper".}: VTK_NEWINSTANCE
    ##  Window used for the previous render

  vtkAbstractMapperSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractMapper::IsTypeOf(@)", header: "vtkAbstractMapper.h".}
proc IsA*(this: var vtkAbstractMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractMapper {.
    importcpp: "vtkAbstractMapper::SafeDownCast(@)", header: "vtkAbstractMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractMapper.h".}
proc GetMTime*(this: var vtkAbstractMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkAbstractMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkAbstractMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkAbstractMapper.h".}
## !!!Ignored construct:  /@{ *
##  Get the time required to draw the geometry last time it was rendered
##  virtual double GetTimeToDrawTimeToDraw ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeToDraw  of  << this -> TimeToDraw ) ; return this -> TimeToDraw ; } ;
## Error: expected ';'!!!

proc AddClippingPlane*(this: var vtkAbstractMapper; plane: ptr vtkPlane) {.
    importcpp: "AddClippingPlane", header: "vtkAbstractMapper.h".}
proc RemoveClippingPlane*(this: var vtkAbstractMapper; plane: ptr vtkPlane) {.
    importcpp: "RemoveClippingPlane", header: "vtkAbstractMapper.h".}
proc RemoveAllClippingPlanes*(this: var vtkAbstractMapper) {.
    importcpp: "RemoveAllClippingPlanes", header: "vtkAbstractMapper.h".}
proc SetClippingPlanes*(this: var vtkAbstractMapper; a2: ptr vtkPlaneCollection) {.
    importcpp: "SetClippingPlanes", header: "vtkAbstractMapper.h".}
proc GetnameClippingPlanes*(this: var vtkAbstractMapper): ptr vtkPlaneCollection {.
    importcpp: "GetnameClippingPlanes", header: "vtkAbstractMapper.h".}
  ## /@}
  ## *
  ##  An alternative way to set clipping planes: use up to six planes found
  ##  in the supplied instance of the implicit function vtkPlanes.
  ##
proc SetClippingPlanes*(this: var vtkAbstractMapper; planes: ptr vtkPlanes) {.
    importcpp: "SetClippingPlanes", header: "vtkAbstractMapper.h".}
proc ShallowCopy*(this: var vtkAbstractMapper; m: ptr vtkAbstractMapper) {.
    importcpp: "ShallowCopy", header: "vtkAbstractMapper.h".}
proc GetScalars*(input: ptr vtkDataSet; scalarMode: cint; arrayAccessMode: cint;
                arrayId: cint; arrayName: cstring; cellFlag: var cint): ptr vtkDataArray {.
    importcpp: "vtkAbstractMapper::GetScalars(@)", header: "vtkAbstractMapper.h".}
proc GetAbstractScalars*(input: ptr vtkDataSet; scalarMode: cint;
                        arrayAccessMode: cint; arrayId: cint; arrayName: cstring;
                        cellFlag: var cint): ptr vtkAbstractArray {.
    importcpp: "vtkAbstractMapper::GetAbstractScalars(@)",
    header: "vtkAbstractMapper.h".}
proc GetGhostArray*(input: ptr vtkDataSet; scalarMode: cint; ghostsToSkip: var cuchar): ptr vtkUnsignedCharArray {.
    importcpp: "vtkAbstractMapper::GetGhostArray(@)",
    header: "vtkAbstractMapper.h".}
proc GetNumberOfClippingPlanes*(this: var vtkAbstractMapper): cint {.
    importcpp: "GetNumberOfClippingPlanes", header: "vtkAbstractMapper.h".}