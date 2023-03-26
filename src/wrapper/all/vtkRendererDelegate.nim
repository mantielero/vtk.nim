## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRendererDelegate.h
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
##  @class   vtkRendererDelegate
##  @brief   Render the props of a vtkRenderer
##
##  vtkRendererDelegate is an abstract class with a pure virtual method Render.
##  This method replaces the Render method of vtkRenderer to allow custom
##  rendering from an external project. A RendererDelegate is connected to
##  a vtkRenderer with method SetDelegate(). An external project just
##  has to provide a concrete implementation of vtkRendererDelegate.
##
##  @sa
##  vtkRenderer
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkRenderer"
type
  vtkRendererDelegate* {.importcpp: "vtkRendererDelegate",
                        header: "vtkRendererDelegate.h", bycopy.} = object of vtkObject
    vtkRendererDelegate* {.importc: "vtkRendererDelegate".}: VTK_NEWINSTANCE

  vtkRendererDelegateSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRendererDelegate::IsTypeOf(@)", header: "vtkRendererDelegate.h".}
proc IsA*(this: var vtkRendererDelegate; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRendererDelegate.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRendererDelegate {.
    importcpp: "vtkRendererDelegate::SafeDownCast(@)",
    header: "vtkRendererDelegate.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRendererDelegate :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRendererDelegate :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRendererDelegate :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRendererDelegate; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRendererDelegate.h".}
proc Render*(this: var vtkRendererDelegate; r: ptr vtkRenderer) {.importcpp: "Render",
    header: "vtkRendererDelegate.h".}
proc SetUsed*(this: var vtkRendererDelegate; _arg: bool) {.importcpp: "SetUsed",
    header: "vtkRendererDelegate.h".}
## !!!Ignored construct:  virtual bool GetUsed ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Used  of  << this -> Used ) ; return this -> Used ; } ;
## Error: expected ';'!!!

proc UsedOn*(this: var vtkRendererDelegate) {.importcpp: "UsedOn",
    header: "vtkRendererDelegate.h".}
proc UsedOff*(this: var vtkRendererDelegate) {.importcpp: "UsedOff",
    header: "vtkRendererDelegate.h".}
  ## /@}