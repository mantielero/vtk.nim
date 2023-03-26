## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTDxInteractorStyleCamera.h
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
##  @class   vtkTDxInteractorStyleCamera
##  @brief   interactive manipulation of the camera with a 3DConnexion device
##
##
##  vtkTDxInteractorStyleCamera allows the end-user to manipulate tha camera
##  with a 3DConnexion device.
##
##  @sa
##  vtkInteractorStyle vtkRenderWindowInteractor
##  vtkTDxInteractorStyle
##

import
  vtkRenderingCoreModule, vtkTDxInteractorStyle

discard "forward decl of vtkTransform"
type
  vtkTDxInteractorStyleCamera* {.importcpp: "vtkTDxInteractorStyleCamera",
                                header: "vtkTDxInteractorStyleCamera.h", bycopy.} = object of vtkTDxInteractorStyle
    vtkTDxInteractorStyleCamera* {.importc: "vtkTDxInteractorStyleCamera".}: VTK_NEWINSTANCE
    ##  Used for internal intermediate calculation.


proc New*(): ptr vtkTDxInteractorStyleCamera {.
    importcpp: "vtkTDxInteractorStyleCamera::New(@)",
    header: "vtkTDxInteractorStyleCamera.h".}
type
  vtkTDxInteractorStyleCameraSuperclass* = vtkTDxInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTDxInteractorStyleCamera::IsTypeOf(@)",
    header: "vtkTDxInteractorStyleCamera.h".}
proc IsA*(this: var vtkTDxInteractorStyleCamera; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTDxInteractorStyleCamera.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTDxInteractorStyleCamera {.
    importcpp: "vtkTDxInteractorStyleCamera::SafeDownCast(@)",
    header: "vtkTDxInteractorStyleCamera.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTDxInteractorStyleCamera :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTDxInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTDxInteractorStyleCamera :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTDxInteractorStyleCamera :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTDxInteractorStyleCamera; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTDxInteractorStyleCamera.h".}
proc OnMotionEvent*(this: var vtkTDxInteractorStyleCamera;
                   motionInfo: ptr vtkTDxMotionEventInfo) {.
    importcpp: "OnMotionEvent", header: "vtkTDxInteractorStyleCamera.h".}