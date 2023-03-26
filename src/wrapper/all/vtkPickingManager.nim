## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPickingManager.h
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
## ==============================================================================
##
##   Library: MSVTK
##
##   Copyright (c) Kitware Inc.
##
##   Licensed under the Apache License, Version 2.0 (the "License");
##   you may not use this file except in compliance with the License.
##   You may obtain a copy of the License at
##
##       http://www.apache.org/licenses/LICENSE-2.0.txt
##
##   Unless required by applicable law or agreed to in writing, software
##   distributed under the License is distributed on an "AS IS" BASIS,
##   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##   See the License for the specific language governing permissions and
##   limitations under the License.
##
## ==============================================================================
## *
##  @class   vtkPickingManager
##  Class defines API to manage the picking process.
##
##  The Picking Manager (PM) coordinates picking across widgets simultaneously.
##  It maintains a collection of registered pickers;
##  when the manager is picked (e.g. vtkPickingManager::Pick()),
##  a pick is run on each picker but only the best picker
##  (e.g. closest to camera point) is selected.
##  It finally returns the widget/representation or picker that was
##  selected.
##  @warning
##  Every time a vtkWidget and/or a vtkWidgetRepresentation is instantiated,
##  it automatically registers its picker(s) and start being managed by
##  delegating all its pick calls to the picking manager.
##  It is possible to customize with the management in two ways:
##  * at the widget level, the "ManagesPicking" variable can be changed
##  from the widget/representation class to tell
##  whether to use the manager or not.
##  * Directly disable the picking manager itself with the boolean variable
##  \sa Enabled using vtkPickingManager::EnabledOn(), EnabledOff(),
##  SetEnabled(bool).
##  @par Important:
##  The picking manager is not active by default as it slightly reduces the
##  performances when interacting with the scene.
##  @par Important:
##  When registering pickers, a null object is considered valid because we can
##  managed picker without any associated object.
##  It is really important to note that a null object is different from one
##  to an other !!
##  This has been done to allow adding multiple times the same picker to the manager
##  by not passing the referenced object to not force the suppression of all pickers
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkAbstractPicker"
discard "forward decl of vtkAbstractPropPicker"
discard "forward decl of vtkAssemblyPath"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkRenderWindowInteractor"
type
  vtkPickingManager* {.importcpp: "vtkPickingManager",
                      header: "vtkPickingManager.h", bycopy.} = object of vtkObject
    vtkPickingManager* {.importc: "vtkPickingManager".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPickingManager {.importcpp: "vtkPickingManager::New(@)",
                                 header: "vtkPickingManager.h".}
type
  vtkPickingManagerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPickingManager::IsTypeOf(@)", header: "vtkPickingManager.h".}
proc IsA*(this: var vtkPickingManager; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPickingManager.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPickingManager {.
    importcpp: "vtkPickingManager::SafeDownCast(@)", header: "vtkPickingManager.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPickingManager :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPickingManager :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPickingManager :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPickingManager; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPickingManager.h".}
proc EnabledOn*(this: var vtkPickingManager) {.importcpp: "EnabledOn",
    header: "vtkPickingManager.h".}
proc EnabledOff*(this: var vtkPickingManager) {.importcpp: "EnabledOff",
    header: "vtkPickingManager.h".}
proc SetEnabled*(this: var vtkPickingManager; _arg: bool) {.importcpp: "SetEnabled",
    header: "vtkPickingManager.h".}
## !!!Ignored construct:  virtual bool GetEnabled ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Enabled  of  << this -> Enabled ) ; return this -> Enabled ; } ;
## Error: expected ';'!!!

proc SetOptimizeOnInteractorEvents*(this: var vtkPickingManager; optimize: bool) {.
    importcpp: "SetOptimizeOnInteractorEvents", header: "vtkPickingManager.h".}
## !!!Ignored construct:  virtual bool GetEnabledOptimizeOnInteractorEvents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OptimizeOnInteractorEvents  of  << this -> OptimizeOnInteractorEvents ) ; return this -> OptimizeOnInteractorEvents ; } ;
## Error: expected ';'!!!

proc SetInteractor*(this: var vtkPickingManager; iren: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkPickingManager.h".}
## !!!Ignored construct:  virtual vtkRenderWindowInteractor * GetEnabledOptimizeOnInteractorEventsInteractor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interactor  of  << this -> Interactor ) ; return this -> Interactor ; } ;
## Error: expected ';'!!!

proc AddPicker*(this: var vtkPickingManager; picker: ptr vtkAbstractPicker;
               `object`: ptr vtkObject = nil) {.importcpp: "AddPicker",
    header: "vtkPickingManager.h".}
proc RemovePicker*(this: var vtkPickingManager; picker: ptr vtkAbstractPicker;
                  `object`: ptr vtkObject = nil) {.importcpp: "RemovePicker",
    header: "vtkPickingManager.h".}
proc RemoveObject*(this: var vtkPickingManager; `object`: ptr vtkObject) {.
    importcpp: "RemoveObject", header: "vtkPickingManager.h".}
proc Pick*(this: var vtkPickingManager; picker: ptr vtkAbstractPicker;
          `object`: ptr vtkObject): bool {.importcpp: "Pick",
                                       header: "vtkPickingManager.h".}
proc Pick*(this: var vtkPickingManager; `object`: ptr vtkObject): bool {.
    importcpp: "Pick", header: "vtkPickingManager.h".}
proc Pick*(this: var vtkPickingManager; picker: ptr vtkAbstractPicker): bool {.
    importcpp: "Pick", header: "vtkPickingManager.h".}
proc GetAssemblyPath*(this: var vtkPickingManager; X: cdouble; Y: cdouble; Z: cdouble;
                     picker: ptr vtkAbstractPropPicker; renderer: ptr vtkRenderer;
                     obj: ptr vtkObject): ptr vtkAssemblyPath {.
    importcpp: "GetAssemblyPath", header: "vtkPickingManager.h".}
proc GetNumberOfPickers*(this: var vtkPickingManager): cint {.
    importcpp: "GetNumberOfPickers", header: "vtkPickingManager.h".}
proc GetNumberOfObjectsLinked*(this: var vtkPickingManager;
                              picker: ptr vtkAbstractPicker): cint {.
    importcpp: "GetNumberOfObjectsLinked", header: "vtkPickingManager.h".}