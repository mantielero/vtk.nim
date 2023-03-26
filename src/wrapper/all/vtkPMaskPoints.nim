## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPMaskPoints.h
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
##  @class   vtkPMaskPoints
##  @brief   parallel Mask Points
##
##  The difference between this implementation and vtkMaskPoints is
##  the use of the vtkMultiProcessController and that
##  ProportionalMaximumNumberOfPoints is obeyed.
##

import
  vtkFiltersParallelModule, vtkMaskPoints

discard "forward decl of vtkMultiProcessController"
type
  vtkPMaskPoints* {.importcpp: "vtkPMaskPoints", header: "vtkPMaskPoints.h", bycopy.} = object of vtkMaskPoints
    vtkPMaskPoints* {.importc: "vtkPMaskPoints".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPMaskPoints {.importcpp: "vtkPMaskPoints::New(@)",
                              header: "vtkPMaskPoints.h".}
type
  vtkPMaskPointsSuperclass* = vtkMaskPoints

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPMaskPoints::IsTypeOf(@)", header: "vtkPMaskPoints.h".}
proc IsA*(this: var vtkPMaskPoints; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPMaskPoints.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPMaskPoints {.
    importcpp: "vtkPMaskPoints::SafeDownCast(@)", header: "vtkPMaskPoints.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPMaskPoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMaskPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPMaskPoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPMaskPoints :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPMaskPoints; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPMaskPoints.h".}
proc GetController*(this: var vtkPMaskPoints): ptr vtkMultiProcessController {.
    importcpp: "GetController", header: "vtkPMaskPoints.h".}
proc SetController*(this: var vtkPMaskPoints; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkPMaskPoints.h".}