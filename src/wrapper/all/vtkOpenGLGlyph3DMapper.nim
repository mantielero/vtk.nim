## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLGlyph3DMapper.h
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
##  @class   vtkOpenGLGlyph3DMapper
##  @brief   vtkOpenGLGlyph3D on the GPU.
##
##  Do the same job than vtkGlyph3D but on the GPU. For this reason, it is
##  a mapper not a vtkPolyDataAlgorithm. Also, some methods of vtkOpenGLGlyph3D
##  don't make sense in vtkOpenGLGlyph3DMapper: GeneratePointIds, old-style
##  SetSource, PointIdsName, IsPointVisible.
##
##  @sa
##  vtkOpenGLGlyph3D
##

import
  vtkGlyph3DMapper, vtkNew, vtkRenderingOpenGL2Module

discard "forward decl of vtkOpenGLGlyph3DHelper"
discard "forward decl of vtkBitArray"
type
  vtkOpenGLGlyph3DMapper* {.importcpp: "vtkOpenGLGlyph3DMapper",
                           header: "vtkOpenGLGlyph3DMapper.h", bycopy.} = object of vtkGlyph3DMapper
    vtkOpenGLGlyph3DMapper* {.importc: "vtkOpenGLGlyph3DMapper".}: VTK_NEWINSTANCE
    ##  array of value for datasets
    ## *
    ##  Build data structures associated with
    ##
    ##  Last time BlockAttributes was modified.


proc New*(): ptr vtkOpenGLGlyph3DMapper {.importcpp: "vtkOpenGLGlyph3DMapper::New(@)",
                                      header: "vtkOpenGLGlyph3DMapper.h".}
type
  vtkOpenGLGlyph3DMapperSuperclass* = vtkGlyph3DMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLGlyph3DMapper::IsTypeOf(@)",
    header: "vtkOpenGLGlyph3DMapper.h".}
proc IsA*(this: var vtkOpenGLGlyph3DMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLGlyph3DMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLGlyph3DMapper {.
    importcpp: "vtkOpenGLGlyph3DMapper::SafeDownCast(@)",
    header: "vtkOpenGLGlyph3DMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLGlyph3DMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGlyph3DMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLGlyph3DMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLGlyph3DMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLGlyph3DMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLGlyph3DMapper.h".}
proc Render*(this: var vtkOpenGLGlyph3DMapper; ren: ptr vtkRenderer; a: ptr vtkActor) {.
    importcpp: "Render", header: "vtkOpenGLGlyph3DMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLGlyph3DMapper;
                              window: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLGlyph3DMapper.h".}
proc GetMaxNumberOfLOD*(this: var vtkOpenGLGlyph3DMapper): vtkIdType {.
    importcpp: "GetMaxNumberOfLOD", header: "vtkOpenGLGlyph3DMapper.h".}
proc SetNumberOfLOD*(this: var vtkOpenGLGlyph3DMapper; nb: vtkIdType) {.
    importcpp: "SetNumberOfLOD", header: "vtkOpenGLGlyph3DMapper.h".}
proc SetLODDistanceAndTargetReduction*(this: var vtkOpenGLGlyph3DMapper;
                                      index: vtkIdType; distance: cfloat;
                                      targetReduction: cfloat) {.
    importcpp: "SetLODDistanceAndTargetReduction",
    header: "vtkOpenGLGlyph3DMapper.h".}