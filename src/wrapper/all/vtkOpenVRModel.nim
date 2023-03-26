## =========================================================================
##
## Program:   Visualization Toolkit
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkOpenVRModel
##  @brief   OpenVR device model
##
##  This internal class is used to load models
##  such as for the trackers and controllers and to
##  render them in the scene
##

import
  vtkRenderingOpenVRModule, vtkVRModel

type
  vtkOpenVRModel* {.importcpp: "vtkOpenVRModel", header: "vtkOpenVRModel.h", bycopy.} = object of vtkVRModel
    vtkOpenVRModel* {.importc: "vtkOpenVRModel".}: VTK_NEWINSTANCE
    RawModel* {.importc: "RawModel".}: ptr RenderModel_t


proc New*(): ptr vtkOpenVRModel {.importcpp: "vtkOpenVRModel::New(@)",
                              header: "vtkOpenVRModel.h".}
type
  vtkOpenVRModelSuperclass* = vtkVRModel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenVRModel::IsTypeOf(@)", header: "vtkOpenVRModel.h".}
proc IsA*(this: var vtkOpenVRModel; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOpenVRModel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenVRModel {.
    importcpp: "vtkOpenVRModel::SafeDownCast(@)", header: "vtkOpenVRModel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenVRModel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVRModel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenVRModel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenVRModel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!
