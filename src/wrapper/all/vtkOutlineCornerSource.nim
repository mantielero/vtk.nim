## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOutlineCornerSource.h
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
##  @class   vtkOutlineCornerSource
##  @brief   create wireframe outline corners around bounding box
##
##  vtkOutlineCornerSource creates wireframe outline corners around a user-specified
##  bounding box.
##

import
  vtkFiltersSourcesModule, vtkOutlineSource

type
  vtkOutlineCornerSource* {.importcpp: "vtkOutlineCornerSource",
                           header: "vtkOutlineCornerSource.h", bycopy.} = object of vtkOutlineSource
    vtkOutlineCornerSource* {.importc: "vtkOutlineCornerSource".}: VTK_NEWINSTANCE

  vtkOutlineCornerSourceSuperclass* = vtkOutlineSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOutlineCornerSource::IsTypeOf(@)",
    header: "vtkOutlineCornerSource.h".}
proc IsA*(this: var vtkOutlineCornerSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOutlineCornerSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOutlineCornerSource {.
    importcpp: "vtkOutlineCornerSource::SafeDownCast(@)",
    header: "vtkOutlineCornerSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOutlineCornerSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOutlineSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOutlineCornerSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOutlineCornerSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOutlineCornerSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOutlineCornerSource.h".}
proc New*(): ptr vtkOutlineCornerSource {.importcpp: "vtkOutlineCornerSource::New(@)",
                                      header: "vtkOutlineCornerSource.h".}
proc SetCornerFactor*(this: var vtkOutlineCornerSource; _arg: cdouble) {.
    importcpp: "SetCornerFactor", header: "vtkOutlineCornerSource.h".}
proc GetCornerFactorMinValue*(this: var vtkOutlineCornerSource): cdouble {.
    importcpp: "GetCornerFactorMinValue", header: "vtkOutlineCornerSource.h".}
proc GetCornerFactorMaxValue*(this: var vtkOutlineCornerSource): cdouble {.
    importcpp: "GetCornerFactorMaxValue", header: "vtkOutlineCornerSource.h".}
## !!!Ignored construct:  virtual double GetCornerFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerFactor  of  << this -> CornerFactor ) ; return this -> CornerFactor ; } ;
## Error: expected ';'!!!
