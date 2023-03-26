## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiBlockUnstructuredGridVolumeMapper.h
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
##  \class vtkMultiBlockUnstructuredGridVolumeMapper
##  \brief Mapper to render volumes defined as vtkMultiBlockDataSet.
##
##

import
  vtkNew, vtkRenderingVolumeOpenGL2Module, vtkUnstructuredGridVolumeMapper

discard "forward decl of vtkDataObjectTree"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkProjectedTetrahedraMapper"
type
  vtkMultiBlockUnstructuredGridVolumeMapper* {.
      importcpp: "vtkMultiBlockUnstructuredGridVolumeMapper",
      header: "vtkMultiBlockUnstructuredGridVolumeMapper.h", bycopy.} = object of vtkUnstructuredGridVolumeMapper ## *
                                                                                                           ##  Traverse the vtkMultiBlockDataSet and create shallow copies to its valid blocks
                                                                                                           ##  (vtkUnstructuredGrid blocks). References are kept in a vector which is sorted back-to-front
                                                                                                           ##  on every render call.
                                                                                                           ##
    vtkMultiBlockUnstructuredGridVolumeMapper*
        {.importc: "vtkMultiBlockUnstructuredGridVolumeMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMultiBlockUnstructuredGridVolumeMapper {.
    importcpp: "vtkMultiBlockUnstructuredGridVolumeMapper::New(@)",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
type
  vtkMultiBlockUnstructuredGridVolumeMapperSuperclass* = vtkUnstructuredGridVolumeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiBlockUnstructuredGridVolumeMapper::IsTypeOf(@)",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc IsA*(this: var vtkMultiBlockUnstructuredGridVolumeMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiBlockUnstructuredGridVolumeMapper {.
    importcpp: "vtkMultiBlockUnstructuredGridVolumeMapper::SafeDownCast(@)",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiBlockUnstructuredGridVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiBlockUnstructuredGridVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiBlockUnstructuredGridVolumeMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
               os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc GetBounds*(this: var vtkMultiBlockUnstructuredGridVolumeMapper): ptr cdouble {.
    importcpp: "GetBounds", header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
## using statement

proc SelectScalarArray*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
                       arrayNum: cint) {.importcpp: "SelectScalarArray", header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc SelectScalarArray*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
                       arrayName: cstring) {.importcpp: "SelectScalarArray",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc SetScalarMode*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
                   ScalarMode: cint) {.importcpp: "SetScalarMode", header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc SetArrayAccessMode*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
                        accessMode: cint) {.importcpp: "SetArrayAccessMode",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc Render*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
            ren: ptr vtkRenderer; vol: ptr vtkVolume) {.importcpp: "Render",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
                              window: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
proc SetUseFloatingPointFrameBuffer*(this: var vtkMultiBlockUnstructuredGridVolumeMapper;
                                    use: bool) {.
    importcpp: "SetUseFloatingPointFrameBuffer",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}
## !!!Ignored construct:  virtual bool GetUseFloatingPointFrameBuffer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseFloatingPointFrameBuffer  of  << this -> UseFloatingPointFrameBuffer ) ; return this -> UseFloatingPointFrameBuffer ; } ;
## Error: expected ';'!!!

proc SetBlendMode*(this: var vtkMultiBlockUnstructuredGridVolumeMapper; mode: cint) {.
    importcpp: "SetBlendMode",
    header: "vtkMultiBlockUnstructuredGridVolumeMapper.h".}