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
##  @class   vtkmThreshold
##  @brief   extracts cells where scalar value in cell satisfies threshold criterion
##
##  vtkmThreshold is a filter that extracts cells from any dataset type that
##  satisfy a threshold criterion. A cell satisfies the criterion if the
##  scalar value of every point or cell satisfies the criterion. The
##  criterion takes the form of between two values. The output of this
##  filter is an unstructured grid.
##
##  Note that scalar values are available from the point and cell attribute
##  data. By default, point data is used to obtain scalars, but you can
##  control this behavior. See the AttributeMode ivar below.
##
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkThreshold

type
  vtkmThreshold* {.importcpp: "vtkmThreshold", header: "vtkmThreshold.h", bycopy.} = object of vtkThreshold
    vtkmThreshold* {.importc: "vtkmThreshold".}: VTK_NEWINSTANCE

  vtkmThresholdSuperclass* = vtkThreshold

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmThreshold::IsTypeOf(@)", header: "vtkmThreshold.h".}
proc IsA*(this: var vtkmThreshold; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmThreshold.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmThreshold {.
    importcpp: "vtkmThreshold::SafeDownCast(@)", header: "vtkmThreshold.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmThreshold :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmThreshold :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmThreshold :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmThreshold; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmThreshold.h".}
proc New*(): ptr vtkmThreshold {.importcpp: "vtkmThreshold::New(@)",
                             header: "vtkmThreshold.h".}
## !!!Ignored construct:  /@{ *
##  When this flag is off (the default), then the computation will fall back
##  to the serial VTK version if VTK-m fails to run. When the flag is on,
##  the filter will generate an error if VTK-m fails to run. This is mostly
##  useful in testing to make sure the expected algorithm is run.
##  virtual vtkTypeBool GetForceVTKmForceVTKm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceVTKm  of  << this -> ForceVTKm ) ; return this -> ForceVTKm ; } ;
## Error: expected ';'!!!

proc SetForceVTKm*(this: var vtkmThreshold; _arg: vtkTypeBool) {.
    importcpp: "SetForceVTKm", header: "vtkmThreshold.h".}
proc ForceVTKmOn*(this: var vtkmThreshold) {.importcpp: "ForceVTKmOn",
    header: "vtkmThreshold.h".}
proc ForceVTKmOff*(this: var vtkmThreshold) {.importcpp: "ForceVTKmOff",
    header: "vtkmThreshold.h".}
  ## /@}