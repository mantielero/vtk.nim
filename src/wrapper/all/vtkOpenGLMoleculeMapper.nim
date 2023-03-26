## =========================================================================
##
##   Program:   Visualization Toolkit
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
##  @class   vtkOpenGLMoleculeMapper
##  @brief   An accelerated class for rendering molecules
##
##  A vtkMoleculeMapper that uses imposters to do the rendering. It uses
##  vtkOpenGLSphereMapper and vtkOpenGLStickMapper to do the rendering.
##

import
  vtkDomainsChemistryOpenGL2Module, vtkMoleculeMapper, vtkNew

discard "forward decl of vtkOpenGLSphereMapper"
discard "forward decl of vtkOpenGLStickMapper"
type
  vtkOpenGLMoleculeMapper* {.importcpp: "vtkOpenGLMoleculeMapper",
                            header: "vtkOpenGLMoleculeMapper.h", bycopy.} = object of vtkMoleculeMapper
    vtkOpenGLMoleculeMapper* {.importc: "vtkOpenGLMoleculeMapper".}: VTK_NEWINSTANCE
    ## /@}


proc New*(): ptr vtkOpenGLMoleculeMapper {.importcpp: "vtkOpenGLMoleculeMapper::New(@)",
                                       header: "vtkOpenGLMoleculeMapper.h".}
type
  vtkOpenGLMoleculeMapperSuperclass* = vtkMoleculeMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLMoleculeMapper::IsTypeOf(@)",
    header: "vtkOpenGLMoleculeMapper.h".}
proc IsA*(this: var vtkOpenGLMoleculeMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLMoleculeMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLMoleculeMapper {.
    importcpp: "vtkOpenGLMoleculeMapper::SafeDownCast(@)",
    header: "vtkOpenGLMoleculeMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLMoleculeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLMoleculeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLMoleculeMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLMoleculeMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLMoleculeMapper.h".}
proc Render*(this: var vtkOpenGLMoleculeMapper; a2: ptr vtkRenderer; a3: ptr vtkActor) {.
    importcpp: "Render", header: "vtkOpenGLMoleculeMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLMoleculeMapper; a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLMoleculeMapper.h".}
proc GetFastAtomMapper*(this: var vtkOpenGLMoleculeMapper): ptr vtkOpenGLSphereMapper {.
    importcpp: "GetFastAtomMapper", header: "vtkOpenGLMoleculeMapper.h".}
proc ProcessSelectorPixelBuffers*(this: var vtkOpenGLMoleculeMapper;
                                 sel: ptr vtkHardwareSelector;
                                 pixeloffsets: var vector[cuint]; prop: ptr vtkProp) {.
    importcpp: "ProcessSelectorPixelBuffers", header: "vtkOpenGLMoleculeMapper.h".}
proc SetMapScalars*(this: var vtkOpenGLMoleculeMapper; map: bool) {.
    importcpp: "SetMapScalars", header: "vtkOpenGLMoleculeMapper.h".}