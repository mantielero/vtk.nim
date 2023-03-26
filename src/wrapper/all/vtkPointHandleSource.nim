## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointHandleSource.h
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
##  @class   vtkPointHandleSource
##  @brief   handle source used to represent points.
##
##  vtkPointHandleSource is deriving vtkHandleSource interface.
##  This handle represents a point with its shape being a sphere.
##  Its center and radius can be modified.
##  If the point is also parametered by any direction, it is then
##  represented as a cone pointing in this direction.
##

import
  vtkFiltersSourcesModule, vtkHandleSource

discard "forward decl of vtkConeSource"
discard "forward decl of vtkSphereSource"
type
  vtkPointHandleSource* {.importcpp: "vtkPointHandleSource",
                         header: "vtkPointHandleSource.h", bycopy.} = object of vtkHandleSource
    vtkPointHandleSource* {.importc: "vtkPointHandleSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointHandleSource {.importcpp: "vtkPointHandleSource::New(@)",
                                    header: "vtkPointHandleSource.h".}
type
  vtkPointHandleSourceSuperclass* = vtkHandleSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointHandleSource::IsTypeOf(@)",
    header: "vtkPointHandleSource.h".}
proc IsA*(this: var vtkPointHandleSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPointHandleSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointHandleSource {.
    importcpp: "vtkPointHandleSource::SafeDownCast(@)",
    header: "vtkPointHandleSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointHandleSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHandleSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointHandleSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointHandleSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointHandleSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointHandleSource.h".}
## using statement

proc SetPosition*(this: var vtkPointHandleSource; xPos: cdouble; yPos: cdouble;
                 zPos: cdouble) {.importcpp: "SetPosition",
                                header: "vtkPointHandleSource.h".}
## using statement

proc GetPosition*(this: var vtkPointHandleSource): ptr cdouble {.
    importcpp: "GetPosition", header: "vtkPointHandleSource.h".}
## using statement

proc SetDirection*(this: var vtkPointHandleSource; xDir: cdouble; yDir: cdouble;
                  zDir: cdouble) {.importcpp: "SetDirection",
                                 header: "vtkPointHandleSource.h".}
## using statement

proc GetDirection*(this: var vtkPointHandleSource): ptr cdouble {.
    importcpp: "GetDirection", header: "vtkPointHandleSource.h".}