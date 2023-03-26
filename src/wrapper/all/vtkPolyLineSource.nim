## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyLineSource.h
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
##  @class   vtkPolyLineSource
##  @brief   create a poly line from a list of input points
##
##  vtkPolyLineSource is a source object that creates a poly line from
##  user-specified points. The output is a vtkPolyLine.
##

import
  vtkFiltersSourcesModule, vtkPolyPointSource

discard "forward decl of vtkPoints"
type
  vtkPolyLineSource* {.importcpp: "vtkPolyLineSource",
                      header: "vtkPolyLineSource.h", bycopy.} = object of vtkPolyPointSource
    vtkPolyLineSource* {.importc: "vtkPolyLineSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyLineSource {.importcpp: "vtkPolyLineSource::New(@)",
                                 header: "vtkPolyLineSource.h".}
type
  vtkPolyLineSourceSuperclass* = vtkPolyPointSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyLineSource::IsTypeOf(@)", header: "vtkPolyLineSource.h".}
proc IsA*(this: var vtkPolyLineSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyLineSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyLineSource {.
    importcpp: "vtkPolyLineSource::SafeDownCast(@)", header: "vtkPolyLineSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyLineSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyPointSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyLineSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyLineSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyLineSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyLineSource.h".}
proc SetClosed*(this: var vtkPolyLineSource; _arg: vtkTypeBool) {.
    importcpp: "SetClosed", header: "vtkPolyLineSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetClosed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Closed  of  << this -> Closed ) ; return this -> Closed ; } ;
## Error: expected ';'!!!

proc ClosedOn*(this: var vtkPolyLineSource) {.importcpp: "ClosedOn",
    header: "vtkPolyLineSource.h".}
proc ClosedOff*(this: var vtkPolyLineSource) {.importcpp: "ClosedOff",
    header: "vtkPolyLineSource.h".}
  ## /@}