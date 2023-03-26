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
##  @class   vtkmWarpVector
##  @brief   deform geometry with vector data
##
##  vtkWarpVector is a filter that modifies point coordinates by moving
##  points along vector times the scale factor. Useful for showing flow
##  profiles or mechanical deformation.
##
##  The filter passes both its point data and cell data to its output.
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkWarpVector

type
  vtkmWarpVector* {.importcpp: "vtkmWarpVector", header: "vtkmWarpVector.h", bycopy.} = object of vtkWarpVector
    vtkmWarpVector* {.importc: "vtkmWarpVector".}: VTK_NEWINSTANCE

  vtkmWarpVectorSuperclass* = vtkWarpVector

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmWarpVector::IsTypeOf(@)", header: "vtkmWarpVector.h".}
proc IsA*(this: var vtkmWarpVector; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmWarpVector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmWarpVector {.
    importcpp: "vtkmWarpVector::SafeDownCast(@)", header: "vtkmWarpVector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmWarpVector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpVector :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmWarpVector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmWarpVector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmWarpVector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmWarpVector.h".}
proc New*(): ptr vtkmWarpVector {.importcpp: "vtkmWarpVector::New(@)",
                              header: "vtkmWarpVector.h".}