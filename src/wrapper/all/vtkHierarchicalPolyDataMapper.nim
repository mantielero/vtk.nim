## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHierarchicalPolyDataMapper.h
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
##  @class   vtkHierarchicalPolyDataMapper
##  @brief   a class that renders hierarchical polygonal data
##
##  Legacy class. Use vtkCompositePolyDataMapper instead.
##
##  @sa
##  vtkPolyDataMapper
##

import
  vtkCompositePolyDataMapper, vtkRenderingCoreModule

type
  vtkHierarchicalPolyDataMapper* {.importcpp: "vtkHierarchicalPolyDataMapper",
                                  header: "vtkHierarchicalPolyDataMapper.h",
                                  bycopy.} = object of vtkCompositePolyDataMapper
    vtkHierarchicalPolyDataMapper* {.importc: "vtkHierarchicalPolyDataMapper".}: VTK_NEWINSTANCE


proc New*(): ptr vtkHierarchicalPolyDataMapper {.
    importcpp: "vtkHierarchicalPolyDataMapper::New(@)",
    header: "vtkHierarchicalPolyDataMapper.h".}
type
  vtkHierarchicalPolyDataMapperSuperclass* = vtkCompositePolyDataMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHierarchicalPolyDataMapper::IsTypeOf(@)",
    header: "vtkHierarchicalPolyDataMapper.h".}
proc IsA*(this: var vtkHierarchicalPolyDataMapper; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHierarchicalPolyDataMapper.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHierarchicalPolyDataMapper {.
    importcpp: "vtkHierarchicalPolyDataMapper::SafeDownCast(@)",
    header: "vtkHierarchicalPolyDataMapper.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHierarchicalPolyDataMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCompositePolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHierarchicalPolyDataMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHierarchicalPolyDataMapper :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHierarchicalPolyDataMapper; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkHierarchicalPolyDataMapper.h".}