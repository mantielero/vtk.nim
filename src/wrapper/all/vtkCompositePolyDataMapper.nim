## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositePolyDataMapper.h
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
##  @class   vtkCompositePolyDataMapper
##  @brief   a class that renders hierarchical polygonal data
##
##  This class uses a set of vtkPolyDataMappers to render input data
##  which may be hierarchical. The input to this mapper may be
##  either vtkPolyData or a vtkCompositeDataSet built from
##  polydata. If something other than vtkPolyData is encountered,
##  an error message will be produced.
##  @sa
##  vtkPolyDataMapper
##

import
  vtkMapper, vtkRenderingCoreModule

discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkInformation"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkActor"
discard "forward decl of vtkCompositePolyDataMapperInternals"
type
  vtkCompositePolyDataMapper* {.importcpp: "vtkCompositePolyDataMapper",
                               header: "vtkCompositePolyDataMapper.h", bycopy.} = object of vtkMapper
    vtkCompositePolyDataMapper* {.importc: "vtkCompositePolyDataMapper".}: VTK_NEWINSTANCE
    ## *
    ##  These are the internal polydata mapper that do the
    ##  rendering. We save then so that they can keep their
    ##  display lists.
    ##
    ## *
    ##  Time stamp for when we need to update the
    ##  internal mappers
    ##


proc New*(): ptr vtkCompositePolyDataMapper {.
    importcpp: "vtkCompositePolyDataMapper::New(@)",
    header: "vtkCompositePolyDataMapper.h".}
type
  vtkCompositePolyDataMapperSuperclass* = vtkMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositePolyDataMapper::IsTypeOf(@)",
    header: "vtkCompositePolyDataMapper.h".}
proc IsA*(this: var vtkCompositePolyDataMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositePolyDataMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositePolyDataMapper {.
    importcpp: "vtkCompositePolyDataMapper::SafeDownCast(@)",
    header: "vtkCompositePolyDataMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositePolyDataMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositePolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositePolyDataMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositePolyDataMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCompositePolyDataMapper.h".}
proc Render*(this: var vtkCompositePolyDataMapper; ren: ptr vtkRenderer;
            a: ptr vtkActor) {.importcpp: "Render",
                            header: "vtkCompositePolyDataMapper.h".}
## !!!Ignored construct:  /@{ *
##  Standard vtkProp method to get 3D bounds of a 3D prop
##  double * GetBounds ( ) VTK_SIZEHINT ( 6 ) override ;
## Error: expected ';'!!!

proc GetBounds*(this: var vtkCompositePolyDataMapper; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkCompositePolyDataMapper.h".}
proc ReleaseGraphicsResources*(this: var vtkCompositePolyDataMapper;
                              a2: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkCompositePolyDataMapper.h".}
proc HasOpaqueGeometry*(this: var vtkCompositePolyDataMapper): bool {.
    importcpp: "HasOpaqueGeometry", header: "vtkCompositePolyDataMapper.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkCompositePolyDataMapper): bool {.
    importcpp: "HasTranslucentPolygonalGeometry",
    header: "vtkCompositePolyDataMapper.h".}