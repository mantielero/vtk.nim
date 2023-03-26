## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCuller.h
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
##  @class   vtkCuller
##  @brief   a superclass for prop cullers
##
##  A culler has a cull method called by the vtkRenderer. The cull
##  method is called before any rendering is performed,
##  and it allows the culler to do some processing on the props and
##  to modify their AllocatedRenderTime and re-order them in the prop list.
##
##  @sa
##  vtkFrustumCoverageCuller
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkProp"
discard "forward decl of vtkRenderer"
type
  vtkCuller* {.importcpp: "vtkCuller", header: "vtkCuller.h", bycopy.} = object of vtkObject
    vtkCuller* {.importc: "vtkCuller".}: VTK_NEWINSTANCE

  vtkCullerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkCuller::IsTypeOf(@)",
    header: "vtkCuller.h".}
proc IsA*(this: var vtkCuller; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCuller.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCuller {.
    importcpp: "vtkCuller::SafeDownCast(@)", header: "vtkCuller.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCuller :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCuller :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCuller :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCuller; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCuller.h".}
proc Cull*(this: var vtkCuller; ren: ptr vtkRenderer; propList: ptr ptr vtkProp;
          listLength: var cint; initialized: var cint): cdouble {.importcpp: "Cull",
    header: "vtkCuller.h".}