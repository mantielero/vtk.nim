## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetMapper.h
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
##  @class   vtkDataSetMapper
##  @brief   map vtkDataSet and derived classes to graphics primitives
##
##  vtkDataSetMapper is a mapper to map data sets (i.e., vtkDataSet and
##  all derived classes) to graphics primitives. The mapping procedure
##  is as follows: all 0D, 1D, and 2D cells are converted into points,
##  lines, and polygons/triangle strips and then mapped to the graphics
##  system. The 2D faces of 3D cells are mapped only if they are used by
##  only one cell, i.e., on the boundary of the data set.
##

import
  vtkMapper, vtkRenderingCoreModule

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkDataSetSurfaceFilter"
type
  vtkDataSetMapper* {.importcpp: "vtkDataSetMapper", header: "vtkDataSetMapper.h",
                     bycopy.} = object of vtkMapper
    vtkDataSetMapper* {.importc: "vtkDataSetMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataSetMapper {.importcpp: "vtkDataSetMapper::New(@)",
                                header: "vtkDataSetMapper.h".}
type
  vtkDataSetMapperSuperclass* = vtkMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataSetMapper::IsTypeOf(@)", header: "vtkDataSetMapper.h".}
proc IsA*(this: var vtkDataSetMapper; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDataSetMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataSetMapper {.
    importcpp: "vtkDataSetMapper::SafeDownCast(@)", header: "vtkDataSetMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataSetMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataSetMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataSetMapper.h".}
proc Render*(this: var vtkDataSetMapper; ren: ptr vtkRenderer; act: ptr vtkActor) {.
    importcpp: "Render", header: "vtkDataSetMapper.h".}
proc GetnamePolyDataMapper*(this: var vtkDataSetMapper): ptr vtkPolyDataMapper {.
    importcpp: "GetnamePolyDataMapper", header: "vtkDataSetMapper.h".}
  ## /@}
  ## *
  ##  Release any graphics resources that are being consumed by this mapper.
  ##  The parameter window could be used to determine which graphic
  ##  resources to release.
  ##
proc ReleaseGraphicsResources*(this: var vtkDataSetMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkDataSetMapper.h".}
proc GetMTime*(this: var vtkDataSetMapper): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkDataSetMapper.h".}
proc SetInputData*(this: var vtkDataSetMapper; input: ptr vtkDataSet) {.
    importcpp: "SetInputData", header: "vtkDataSetMapper.h".}
proc GetInput*(this: var vtkDataSetMapper): ptr vtkDataSet {.importcpp: "GetInput",
    header: "vtkDataSetMapper.h".}