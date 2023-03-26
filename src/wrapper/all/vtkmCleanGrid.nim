## =============================================================================
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE.txt for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
##   Copyright 2012 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##
## =============================================================================
## *
##  @class   vtkmCleanGrid
##  @brief   removes redundant or unused cells and/or points
##
##  vtkmCleanGrid is a filter that takes vtkDataSet data as input and
##  generates vtkUnstructuredGrid as output. vtkmCleanGrid will convert all cells
##  to an explicit representation, and if enabled, will remove unused points.
##
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkDataSet"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkmCleanGrid* {.importcpp: "vtkmCleanGrid", header: "vtkmCleanGrid.h", bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkmCleanGrid* {.importc: "vtkmCleanGrid".}: VTK_NEWINSTANCE

  vtkmCleanGridSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmCleanGrid::IsTypeOf(@)", header: "vtkmCleanGrid.h".}
proc IsA*(this: var vtkmCleanGrid; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmCleanGrid.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmCleanGrid {.
    importcpp: "vtkmCleanGrid::SafeDownCast(@)", header: "vtkmCleanGrid.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmCleanGrid :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmCleanGrid :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmCleanGrid :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmCleanGrid; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmCleanGrid.h".}
proc New*(): ptr vtkmCleanGrid {.importcpp: "vtkmCleanGrid::New(@)",
                             header: "vtkmCleanGrid.h".}
proc SetCompactPoints*(this: var vtkmCleanGrid; _arg: bool) {.
    importcpp: "SetCompactPoints", header: "vtkmCleanGrid.h".}
## !!!Ignored construct:  virtual bool GetCompactPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CompactPoints  of  << this -> CompactPoints ) ; return this -> CompactPoints ; } ;
## Error: expected ';'!!!

proc CompactPointsOn*(this: var vtkmCleanGrid) {.importcpp: "CompactPointsOn",
    header: "vtkmCleanGrid.h".}
proc CompactPointsOff*(this: var vtkmCleanGrid) {.importcpp: "CompactPointsOff",
    header: "vtkmCleanGrid.h".}
  ## /@}