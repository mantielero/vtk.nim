## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMapper2D.h
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
##  @class   vtkMapper2D
##  @brief   abstract class specifies interface for objects which render 2D actors
##
##  vtkMapper2D is an abstract class which defines the interface for objects
##  which render two dimensional actors (vtkActor2D).
##
##  @sa
##  vtkActor2D
##

import
  vtkAbstractMapper, vtkRenderingCoreModule

discard "forward decl of vtkViewport"
discard "forward decl of vtkActor2D"
type
  vtkMapper2D* {.importcpp: "vtkMapper2D", header: "vtkMapper2D.h", bycopy.} = object of vtkAbstractMapper
    vtkMapper2D* {.importc: "vtkMapper2D".}: VTK_NEWINSTANCE

  vtkMapper2DSuperclass* = vtkAbstractMapper

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMapper2D::IsTypeOf(@)", header: "vtkMapper2D.h".}
proc IsA*(this: var vtkMapper2D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMapper2D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMapper2D {.
    importcpp: "vtkMapper2D::SafeDownCast(@)", header: "vtkMapper2D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMapper2D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMapper2D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMapper2D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMapper2D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMapper2D.h".}
proc RenderOverlay*(this: var vtkMapper2D; a2: ptr vtkViewport; a3: ptr vtkActor2D) {.
    importcpp: "RenderOverlay", header: "vtkMapper2D.h".}
proc RenderOpaqueGeometry*(this: var vtkMapper2D; a2: ptr vtkViewport;
                          a3: ptr vtkActor2D) {.importcpp: "RenderOpaqueGeometry",
    header: "vtkMapper2D.h".}
proc RenderTranslucentPolygonalGeometry*(this: var vtkMapper2D; a2: ptr vtkViewport;
                                        a3: ptr vtkActor2D) {.
    importcpp: "RenderTranslucentPolygonalGeometry", header: "vtkMapper2D.h".}
proc HasTranslucentPolygonalGeometry*(this: var vtkMapper2D): vtkTypeBool {.
    importcpp: "HasTranslucentPolygonalGeometry", header: "vtkMapper2D.h".}