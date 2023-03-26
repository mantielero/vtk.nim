## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorStyleSwitchBase.h
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
##  @class   vtkInteractorStyleSwitchBase
##  @brief   dummy interface class.
##
##  The class vtkInteractorStyleSwitchBase is here to allow the
##  vtkRenderWindowInteractor to instantiate a default interactor style and
##  preserve backward compatible behavior when the object factory is overridden
##  and vtkInteractorStyleSwitch is returned.
##
##  @sa
##  vtkInteractorStyleSwitchBase vtkRenderWindowInteractor
##

import
  vtkInteractorStyle, vtkRenderingCoreModule

type
  vtkInteractorStyleSwitchBase* {.importcpp: "vtkInteractorStyleSwitchBase",
                                 header: "vtkInteractorStyleSwitchBase.h", bycopy.} = object of vtkInteractorStyle
    vtkInteractorStyleSwitchBase* {.importc: "vtkInteractorStyleSwitchBase".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInteractorStyleSwitchBase {.
    importcpp: "vtkInteractorStyleSwitchBase::New(@)",
    header: "vtkInteractorStyleSwitchBase.h".}
type
  vtkInteractorStyleSwitchBaseSuperclass* = vtkInteractorStyle

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorStyleSwitchBase::IsTypeOf(@)",
    header: "vtkInteractorStyleSwitchBase.h".}
proc IsA*(this: var vtkInteractorStyleSwitchBase; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorStyleSwitchBase.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorStyleSwitchBase {.
    importcpp: "vtkInteractorStyleSwitchBase::SafeDownCast(@)",
    header: "vtkInteractorStyleSwitchBase.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorStyleSwitchBase :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorStyle :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorStyleSwitchBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorStyleSwitchBase :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorStyleSwitchBase; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorStyleSwitchBase.h".}
proc GetInteractor*(this: var vtkInteractorStyleSwitchBase): ptr vtkRenderWindowInteractor {.
    importcpp: "GetInteractor", header: "vtkInteractorStyleSwitchBase.h".}