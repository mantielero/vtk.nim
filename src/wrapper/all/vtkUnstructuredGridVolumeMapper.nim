## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridVolumeMapper.h
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
##  @class   vtkUnstructuredGridVolumeMapper
##  @brief   Abstract class for an unstructured grid volume mapper
##
##
##  vtkUnstructuredGridVolumeMapper is the abstract definition of a volume mapper for
##  unstructured data (vtkUnstructuredGrid). Several basic types of volume mappers
##  are supported as subclasses.
##
##  @sa
##  vtkUnstructuredGridVolumeRayCastMapper
##

import
  vtkAbstractVolumeMapper, vtkRenderingVolumeModule

discard "forward decl of vtkRenderer"
discard "forward decl of vtkVolume"
discard "forward decl of vtkUnstructuredGridBase"
discard "forward decl of vtkWindow"
type
  vtkUnstructuredGridVolumeMapper* {.importcpp: "vtkUnstructuredGridVolumeMapper", header: "vtkUnstructuredGridVolumeMapper.h",
                                    bycopy.} = object of vtkAbstractVolumeMapper
    vtkUnstructuredGridVolumeMapper* {.importc: "vtkUnstructuredGridVolumeMapper".}: VTK_NEWINSTANCE

  vtkUnstructuredGridVolumeMapperSuperclass* = vtkAbstractVolumeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridVolumeMapper::IsTypeOf(@)",
    header: "vtkUnstructuredGridVolumeMapper.h".}
proc IsA*(this: var vtkUnstructuredGridVolumeMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridVolumeMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridVolumeMapper {.
    importcpp: "vtkUnstructuredGridVolumeMapper::SafeDownCast(@)",
    header: "vtkUnstructuredGridVolumeMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridVolumeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridVolumeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridVolumeMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUnstructuredGridVolumeMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkUnstructuredGridVolumeMapper.h".}
proc SetInputData*(this: var vtkUnstructuredGridVolumeMapper;
                  a2: ptr vtkUnstructuredGridBase) {.importcpp: "SetInputData",
    header: "vtkUnstructuredGridVolumeMapper.h".}
proc SetInputData*(this: var vtkUnstructuredGridVolumeMapper; a2: ptr vtkDataSet) {.
    importcpp: "SetInputData", header: "vtkUnstructuredGridVolumeMapper.h".}
proc GetInput*(this: var vtkUnstructuredGridVolumeMapper): ptr vtkUnstructuredGridBase {.
    importcpp: "GetInput", header: "vtkUnstructuredGridVolumeMapper.h".}
proc SetBlendMode*(this: var vtkUnstructuredGridVolumeMapper; _arg: cint) {.
    importcpp: "SetBlendMode", header: "vtkUnstructuredGridVolumeMapper.h".}
proc SetBlendModeToComposite*(this: var vtkUnstructuredGridVolumeMapper) {.
    importcpp: "SetBlendModeToComposite",
    header: "vtkUnstructuredGridVolumeMapper.h".}
proc SetBlendModeToMaximumIntensity*(this: var vtkUnstructuredGridVolumeMapper) {.
    importcpp: "SetBlendModeToMaximumIntensity",
    header: "vtkUnstructuredGridVolumeMapper.h".}
## !!!Ignored construct:  virtual int GetBlendMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BlendMode  of  << this -> BlendMode ) ; return this -> BlendMode ; } ;
## Error: expected ';'!!!

proc Render*(this: var vtkUnstructuredGridVolumeMapper; ren: ptr vtkRenderer;
            vol: ptr vtkVolume) {.importcpp: "Render",
                               header: "vtkUnstructuredGridVolumeMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkUnstructuredGridVolumeMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources",
    header: "vtkUnstructuredGridVolumeMapper.h".}
const
  vtkUnstructuredGridVolumeMapperCOMPOSITE_BLEND* = 0
  vtkUnstructuredGridVolumeMapperMAXIMUM_INTENSITY_BLEND* = 1
