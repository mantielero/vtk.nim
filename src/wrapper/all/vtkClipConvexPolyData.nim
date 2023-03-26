## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkClipConvexPolyData.h
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
##  @class   vtkClipConvexPolyData
##  @brief   clip any dataset with user-specified implicit function or input scalar data
##
##  vtkClipConvexPolyData is a filter that clips a convex polydata with a set
##  of planes. Its main usage is for clipping a bounding volume with frustum
##  planes (used later one in volume rendering).
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPlaneCollection"
discard "forward decl of vtkPlane"
discard "forward decl of vtkClipConvexPolyDataInternals"
type
  vtkClipConvexPolyData* {.importcpp: "vtkClipConvexPolyData",
                          header: "vtkClipConvexPolyData.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkClipConvexPolyData* {.importc: "vtkClipConvexPolyData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkClipConvexPolyData {.importcpp: "vtkClipConvexPolyData::New(@)",
                                     header: "vtkClipConvexPolyData.h".}
type
  vtkClipConvexPolyDataSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkClipConvexPolyData::IsTypeOf(@)",
    header: "vtkClipConvexPolyData.h".}
proc IsA*(this: var vtkClipConvexPolyData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkClipConvexPolyData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkClipConvexPolyData {.
    importcpp: "vtkClipConvexPolyData::SafeDownCast(@)",
    header: "vtkClipConvexPolyData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkClipConvexPolyData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkClipConvexPolyData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkClipConvexPolyData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkClipConvexPolyData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkClipConvexPolyData.h".}
proc SetPlanes*(this: var vtkClipConvexPolyData; planes: ptr vtkPlaneCollection) {.
    importcpp: "SetPlanes", header: "vtkClipConvexPolyData.h".}
proc GetnamePlanes*(this: var vtkClipConvexPolyData): ptr vtkPlaneCollection {.
    importcpp: "GetnamePlanes", header: "vtkClipConvexPolyData.h".}
  ## /@}
  ## *
  ##  Redefines this method, as this filter depends on time of its components
  ##  (planes)
  ##
proc GetMTime*(this: var vtkClipConvexPolyData): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkClipConvexPolyData.h".}