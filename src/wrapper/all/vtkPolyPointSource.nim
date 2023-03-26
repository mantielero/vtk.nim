## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyPointSource.h
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
##  @class   vtkPolyPointSource
##  @brief   create points from a list of input points
##
##  vtkPolyPointSource is a source object that creates a vert from
##  user-specified points. The output is a vtkPolyData.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPoints"
type
  vtkPolyPointSource* {.importcpp: "vtkPolyPointSource",
                       header: "vtkPolyPointSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkPolyPointSource* {.importc: "vtkPolyPointSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPolyPointSource {.importcpp: "vtkPolyPointSource::New(@)",
                                  header: "vtkPolyPointSource.h".}
type
  vtkPolyPointSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPolyPointSource::IsTypeOf(@)", header: "vtkPolyPointSource.h".}
proc IsA*(this: var vtkPolyPointSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPolyPointSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPolyPointSource {.
    importcpp: "vtkPolyPointSource::SafeDownCast(@)",
    header: "vtkPolyPointSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPolyPointSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyPointSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyPointSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPolyPointSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPolyPointSource.h".}
proc SetNumberOfPoints*(this: var vtkPolyPointSource; numPoints: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkPolyPointSource.h".}
proc GetNumberOfPoints*(this: var vtkPolyPointSource): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkPolyPointSource.h".}
proc Resize*(this: var vtkPolyPointSource; numPoints: vtkIdType) {.
    importcpp: "Resize", header: "vtkPolyPointSource.h".}
proc SetPoint*(this: var vtkPolyPointSource; id: vtkIdType; x: cdouble; y: cdouble;
              z: cdouble) {.importcpp: "SetPoint", header: "vtkPolyPointSource.h".}
proc SetPoints*(this: var vtkPolyPointSource; points: ptr vtkPoints) {.
    importcpp: "SetPoints", header: "vtkPolyPointSource.h".}
proc GetnamePoints*(this: var vtkPolyPointSource): ptr vtkPoints {.
    importcpp: "GetnamePoints", header: "vtkPolyPointSource.h".}
  ## /@}
  ## *
  ##  Get the mtime plus consider its Points
  ##
proc GetMTime*(this: var vtkPolyPointSource): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkPolyPointSource.h".}