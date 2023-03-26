## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExplicitStructuredGridCrop.h
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
##  @class   vtkExplicitStructuredGridCrop
##  @brief   Filter which extracts a piece of explicit structured
##  grid changing its extents.
##

import
  vtkExplicitStructuredGridAlgorithm, vtkFiltersCoreModule

type
  vtkExplicitStructuredGridCrop* {.importcpp: "vtkExplicitStructuredGridCrop",
                                  header: "vtkExplicitStructuredGridCrop.h",
                                  bycopy.} = object of vtkExplicitStructuredGridAlgorithm
    vtkExplicitStructuredGridCrop* {.importc: "vtkExplicitStructuredGridCrop".}: VTK_NEWINSTANCE


proc New*(): ptr vtkExplicitStructuredGridCrop {.
    importcpp: "vtkExplicitStructuredGridCrop::New(@)",
    header: "vtkExplicitStructuredGridCrop.h".}
type
  vtkExplicitStructuredGridCropSuperclass* = vtkExplicitStructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExplicitStructuredGridCrop::IsTypeOf(@)",
    header: "vtkExplicitStructuredGridCrop.h".}
proc IsA*(this: var vtkExplicitStructuredGridCrop; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExplicitStructuredGridCrop.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExplicitStructuredGridCrop {.
    importcpp: "vtkExplicitStructuredGridCrop::SafeDownCast(@)",
    header: "vtkExplicitStructuredGridCrop.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExplicitStructuredGridCrop :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExplicitStructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExplicitStructuredGridCrop :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExplicitStructuredGridCrop :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExplicitStructuredGridCrop; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkExplicitStructuredGridCrop.h".}
proc SetOutputWholeExtent*(this: var vtkExplicitStructuredGridCrop;
                          extent: array[6, cint]; outInfo: ptr vtkInformation = nil) {.
    importcpp: "SetOutputWholeExtent", header: "vtkExplicitStructuredGridCrop.h".}
proc SetOutputWholeExtent*(this: var vtkExplicitStructuredGridCrop; minX: cint;
                          maxX: cint; minY: cint; maxY: cint; minZ: cint; maxZ: cint) {.
    importcpp: "SetOutputWholeExtent", header: "vtkExplicitStructuredGridCrop.h".}
proc GetOutputWholeExtent*(this: var vtkExplicitStructuredGridCrop;
                          extent: array[6, cint]) {.
    importcpp: "GetOutputWholeExtent", header: "vtkExplicitStructuredGridCrop.h".}
proc GetOutputWholeExtent*(this: var vtkExplicitStructuredGridCrop): ptr cint {.
    importcpp: "GetOutputWholeExtent", header: "vtkExplicitStructuredGridCrop.h".}
proc ResetOutputWholeExtent*(this: var vtkExplicitStructuredGridCrop) {.
    importcpp: "ResetOutputWholeExtent", header: "vtkExplicitStructuredGridCrop.h".}