## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHandleSource.h
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
##  @class   vtkHandleSource
##  @brief   interface that can be inherited to define handler sources for any kind of interaction.
##
##  vtkHandleSource is a pure abstract class defining an interface for handler sources.
##  Any child of this class is supposed to define an access to its position, size and direction, if
##  any. On this purpose, the internal getters/setters are left to be redefined by the subclasses.
##  It is derived by vtkPointHandleSource for example.
##  @sa
##  vtkPointHandleSource, vtkCameraHandleSource
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkHandleSource* {.importcpp: "vtkHandleSource", header: "vtkHandleSource.h",
                    bycopy.} = object of vtkPolyDataAlgorithm
    vtkHandleSource* {.importc: "vtkHandleSource".}: VTK_NEWINSTANCE

  vtkHandleSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHandleSource::IsTypeOf(@)", header: "vtkHandleSource.h".}
proc IsA*(this: var vtkHandleSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkHandleSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHandleSource {.
    importcpp: "vtkHandleSource::SafeDownCast(@)", header: "vtkHandleSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHandleSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHandleSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHandleSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHandleSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHandleSource.h".}
proc SetDirectional*(this: var vtkHandleSource; _arg: bool) {.
    importcpp: "SetDirectional", header: "vtkHandleSource.h".}
## !!!Ignored construct:  virtual bool GetDirectional ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Directional  of  << this -> Directional ) ; return this -> Directional ; } ;
## Error: expected ';'!!!

proc DirectionalOn*(this: var vtkHandleSource) {.importcpp: "DirectionalOn",
    header: "vtkHandleSource.h".}
proc DirectionalOff*(this: var vtkHandleSource) {.importcpp: "DirectionalOff",
    header: "vtkHandleSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the position of the handle.
  ##
proc SetPosition*(this: var vtkHandleSource; pos: array[3, cdouble]) {.
    importcpp: "SetPosition", header: "vtkHandleSource.h".}
proc SetPosition*(this: var vtkHandleSource; xPos: cdouble; yPos: cdouble; zPos: cdouble) {.
    importcpp: "SetPosition", header: "vtkHandleSource.h".}
proc GetPosition*(this: var vtkHandleSource; pos: array[3, cdouble]) {.
    importcpp: "GetPosition", header: "vtkHandleSource.h".}
proc GetPosition*(this: var vtkHandleSource): ptr cdouble {.importcpp: "GetPosition",
    header: "vtkHandleSource.h".}
proc SetDirection*(this: var vtkHandleSource; dir: array[3, cdouble]) {.
    importcpp: "SetDirection", header: "vtkHandleSource.h".}
proc SetDirection*(this: var vtkHandleSource; xDir: cdouble; yDir: cdouble;
                  zDir: cdouble) {.importcpp: "SetDirection",
                                 header: "vtkHandleSource.h".}
proc GetDirection*(this: var vtkHandleSource; dir: array[3, cdouble]) {.
    importcpp: "GetDirection", header: "vtkHandleSource.h".}
proc GetDirection*(this: var vtkHandleSource): ptr cdouble {.
    importcpp: "GetDirection", header: "vtkHandleSource.h".}
proc SetDirectionalSize*(this: var vtkHandleSource; _arg: cdouble) {.
    importcpp: "SetDirectionalSize", header: "vtkHandleSource.h".}
## !!!Ignored construct:  virtual double GetDirectionalSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Size  of  << this -> Size ) ; return this -> Size ; } ;
## Error: expected ';'!!!
