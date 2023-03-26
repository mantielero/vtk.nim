## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLHyperTreeGridMapper.h
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
##  @class   vtkOpenGLHyperTreeGridMapper
##  @brief   map vtkHyperTreeGrid to graphics primitives
##
##  vtkOpenGLHyperTreeGridMapper is a class that uses OpenGL to do the actual
##  rendering of Hyper Tree Grid.
##

import
  vtkHyperTreeGridMapper, vtkSetGet, vtkSmartPointer, vtkRenderingOpenGL2Module

type
  vtkOpenGLHyperTreeGridMapper* {.importcpp: "vtkOpenGLHyperTreeGridMapper",
                                 header: "vtkOpenGLHyperTreeGridMapper.h", bycopy.} = object of vtkHyperTreeGridMapper
    vtkOpenGLHyperTreeGridMapper* {.importc: "vtkOpenGLHyperTreeGridMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOpenGLHyperTreeGridMapper {.
    importcpp: "vtkOpenGLHyperTreeGridMapper::New(@)",
    header: "vtkOpenGLHyperTreeGridMapper.h".}
type
  vtkOpenGLHyperTreeGridMapperSuperclass* = vtkHyperTreeGridMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLHyperTreeGridMapper::IsTypeOf(@)",
    header: "vtkOpenGLHyperTreeGridMapper.h".}
proc IsA*(this: var vtkOpenGLHyperTreeGridMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLHyperTreeGridMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenGLHyperTreeGridMapper {.
    importcpp: "vtkOpenGLHyperTreeGridMapper::SafeDownCast(@)",
    header: "vtkOpenGLHyperTreeGridMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLHyperTreeGridMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLHyperTreeGridMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLHyperTreeGridMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenGLHyperTreeGridMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkOpenGLHyperTreeGridMapper.h".}