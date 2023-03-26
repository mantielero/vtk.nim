## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenGLVolumeLookupTables.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## =============================================================================
## Copyright and License information
## =============================================================================
## *
##  @class vtkOpenGLVolumeLookupTables
##  @brief Internal class that manages multiple lookup tables
##
##

import
  vtkObject

##  Forward declarations

discard "forward decl of vtkWindow"
type
  vtkOpenGLVolumeLookupTables*[T] {.importcpp: "vtkOpenGLVolumeLookupTables<\'0>",
                                   header: "vtkOpenGLVolumeLookupTables.h", bycopy.} = object of vtkObject
    vtkOpenGLVolumeLookupTables* {.importc: "vtkOpenGLVolumeLookupTables".}: VTK_NEWINSTANCE

  vtkOpenGLVolumeLookupTablesSuperclass* = vtkObject

proc IsTypeOf*[T](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenGLVolumeLookupTables::IsTypeOf(@)",
    header: "vtkOpenGLVolumeLookupTables.h".}
proc IsA*[T](this: var vtkOpenGLVolumeLookupTables[T]; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOpenGLVolumeLookupTables.h".}
proc SafeDownCast*[T](o: ptr vtkObjectBase): ptr vtkOpenGLVolumeLookupTables {.
    importcpp: "vtkOpenGLVolumeLookupTables::SafeDownCast(@)",
    header: "vtkOpenGLVolumeLookupTables.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenGLVolumeLookupTables :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenGLVolumeLookupTables :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenGLVolumeLookupTables :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*[T](this: var vtkOpenGLVolumeLookupTables[T]; os: var ostream;
                  indent: vtkIndent) {.importcpp: "PrintSelf",
                                     header: "vtkOpenGLVolumeLookupTables.h".}
proc New*[T](): ptr vtkOpenGLVolumeLookupTables[T] {.
    importcpp: "vtkOpenGLVolumeLookupTables::New(@)",
    header: "vtkOpenGLVolumeLookupTables.h".}
proc Create*[T](this: var vtkOpenGLVolumeLookupTables[T]; numberOfTables: size_t) {.
    importcpp: "Create", header: "vtkOpenGLVolumeLookupTables.h".}
proc GetTable*[T](this: vtkOpenGLVolumeLookupTables[T]; i: size_t): ptr T {.
    noSideEffect, importcpp: "GetTable", header: "vtkOpenGLVolumeLookupTables.h".}
proc GetNumberOfTables*[T](this: vtkOpenGLVolumeLookupTables[T]): size_t {.
    noSideEffect, importcpp: "GetNumberOfTables",
    header: "vtkOpenGLVolumeLookupTables.h".}
proc ReleaseGraphicsResources*[T](this: var vtkOpenGLVolumeLookupTables[T];
                                 win: ptr vtkWindow) {.
    importcpp: "ReleaseGraphicsResources", header: "vtkOpenGLVolumeLookupTables.h".}
import
  vtkOpenGLVolumeLookupTables
