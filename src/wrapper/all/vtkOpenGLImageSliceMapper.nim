## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLImageSliceMapper.h
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
##  @class   vtkOpenGLImageSliceMapper
##  @brief   OpenGL mapper for image slice display
##
##  vtkOpenGLImageSliceMapper is a concrete implementation of the abstract
##  class vtkImageSliceMapper that interfaces to the OpenGL library.
##  @par Thanks:
##  Thanks to David Gobbi at the Seaman Family MR Centre and Dept. of Clinical
##  Neurosciences, Foothills Medical Centre, Calgary, for providing this class.
##

import
  vtkImageSliceMapper, vtkRenderingOpenGL2Module

discard "forward decl of vtkRenderWindow"
discard "forward decl of vtkOpenGLRenderWindow"
discard "forward decl of vtkActor"
type
  vtkOpenGLImageSliceMapper* {.importcpp: "vtkOpenGLImageSliceMapper",
                              header: "vtkOpenGLImageSliceMapper.h", bycopy.} = object of vtkImageSliceMapper
    vtkOpenGLImageSliceMapper* {.importc: "vtkOpenGLImageSliceMapper".}: VTK_NEWINSTANCE
    ##  RenderWindow used for previous render


proc New*(): ptr vtkOpenGLImageSliceMapper {.
    importcpp: "vtkOpenGLImageSliceMapper::New(@)",
    header: "vtkOpenGLImageSliceMapper.h".}
type
  vtkOpenGLImageSliceMapperSuperclass* = vtkImageSliceMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLImageSliceMapper::IsTypeOf(@)",
    header: "vtkOpenGLImageSliceMapper.h".}
proc IsA*(this: var vtkOpenGLImageSliceMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLImageSliceMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLImageSliceMapper {.
    importcpp: "vtkOpenGLImageSliceMapper::SafeDownCast(@)",
    header: "vtkOpenGLImageSliceMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLImageSliceMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSliceMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLImageSliceMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLImageSliceMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLImageSliceMapper; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenGLImageSliceMapper.h".}
proc Render*(this: var vtkOpenGLImageSliceMapper; ren: ptr vtkRenderer;
            prop: ptr vtkImageSlice) {.importcpp: "Render",
                                    header: "vtkOpenGLImageSliceMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkOpenGLImageSliceMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLImageSliceMapper.h".}