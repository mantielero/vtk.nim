## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkViewUpdater.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkViewUpdater
##  @brief   Updates views automatically
##
##
##  vtkViewUpdater registers with annotation change events for a set of
##  annotation links, and updates all views when an annotation link fires an
##  annotation changed event. This is often needed when multiple views share
##  a selection with vtkAnnotationLink.
##

import
  vtkObject, vtkViewsInfovisModule

discard "forward decl of vtkAnnotationLink"
discard "forward decl of vtkView"
type
  vtkViewUpdater* {.importcpp: "vtkViewUpdater", header: "vtkViewUpdater.h", bycopy.} = object of vtkObject
    vtkViewUpdater* {.importc: "vtkViewUpdater".}: VTK_NEWINSTANCE


proc New*(): ptr vtkViewUpdater {.importcpp: "vtkViewUpdater::New(@)",
                              header: "vtkViewUpdater.h".}
type
  vtkViewUpdaterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkViewUpdater::IsTypeOf(@)", header: "vtkViewUpdater.h".}
proc IsA*(this: var vtkViewUpdater; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkViewUpdater.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkViewUpdater {.
    importcpp: "vtkViewUpdater::SafeDownCast(@)", header: "vtkViewUpdater.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkViewUpdater :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkViewUpdater :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkViewUpdater :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkViewUpdater; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkViewUpdater.h".}
proc AddView*(this: var vtkViewUpdater; view: ptr vtkView) {.importcpp: "AddView",
    header: "vtkViewUpdater.h".}
proc RemoveView*(this: var vtkViewUpdater; view: ptr vtkView) {.
    importcpp: "RemoveView", header: "vtkViewUpdater.h".}
proc AddAnnotationLink*(this: var vtkViewUpdater; link: ptr vtkAnnotationLink) {.
    importcpp: "AddAnnotationLink", header: "vtkViewUpdater.h".}