## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeSurfaceLICMapper.h
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
##  @class   vtkCompositeSurfaceLICMapper
##  @brief   mapper for composite dataset
##
##  vtkCompositeSurfaceLICMapper is similar to
##  vtkGenericCompositeSurfaceLICMapper but requires that its inputs all have the
##  same properties (normals, tcoord, scalars, etc) It will only draw
##  polys and it does not support edge flags. The advantage to using
##  this class is that it generally should be faster
##

import
  vtkCompositePolyDataMapper2, vtkNew, vtkRenderingLICOpenGL2Module

discard "forward decl of vtkSurfaceLICInterface"
type
  vtkCompositeSurfaceLICMapper* {.importcpp: "vtkCompositeSurfaceLICMapper",
                                 header: "vtkCompositeSurfaceLICMapper.h", bycopy.} = object of vtkCompositePolyDataMapper2
    vtkCompositeSurfaceLICMapper* {.importc: "vtkCompositeSurfaceLICMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeSurfaceLICMapper {.
    importcpp: "vtkCompositeSurfaceLICMapper::New(@)",
    header: "vtkCompositeSurfaceLICMapper.h".}
type
  vtkCompositeSurfaceLICMapperSuperclass* = vtkCompositePolyDataMapper2

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeSurfaceLICMapper::IsTypeOf(@)",
    header: "vtkCompositeSurfaceLICMapper.h".}
proc IsA*(this: var vtkCompositeSurfaceLICMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeSurfaceLICMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeSurfaceLICMapper {.
    importcpp: "vtkCompositeSurfaceLICMapper::SafeDownCast(@)",
    header: "vtkCompositeSurfaceLICMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeSurfaceLICMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositePolyDataMapper2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeSurfaceLICMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeSurfaceLICMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeSurfaceLICMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCompositeSurfaceLICMapper.h".}
proc GetLICInterface*(this: var vtkCompositeSurfaceLICMapper): ptr vtkSurfaceLICInterface {.
    importcpp: "GetLICInterface", header: "vtkCompositeSurfaceLICMapper.h".}
proc Render*(this: var vtkCompositeSurfaceLICMapper; ren: ptr vtkRenderer;
            act: ptr vtkActor) {.importcpp: "Render",
                              header: "vtkCompositeSurfaceLICMapper.h".}