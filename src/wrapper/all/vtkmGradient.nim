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
##  @class   vtkmGradient
##  @brief   A general filter for gradient estimation.
##
##  Estimates the gradient of a field in a data set.  The gradient calculation
##  is dependent on the input dataset type.  The created gradient array
##  is of the same type as the array it is calculated from (e.g. point data
##  or cell data) as well as data type (e.g. float, double). The output array has
##  3*number of components of the input data array.  The ordering for the
##  output tuple will be {du/dx, du/dy, du/dz, dv/dx, dv/dy, dv/dz, dw/dx,
##  dw/dy, dw/dz} for an input array {u, v, w}.
##
##  Also options to additionally compute the divergence, vorticity and
##  Q criterion of input vector fields.
##
##

import
  vtkAcceleratorsVTKmFiltersModule, vtkGradientFilter

type
  vtkmGradient* {.importcpp: "vtkmGradient", header: "vtkmGradient.h", bycopy.} = object of vtkGradientFilter
    vtkmGradient* {.importc: "vtkmGradient".}: VTK_NEWINSTANCE

  vtkmGradientSuperclass* = vtkGradientFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkmGradient::IsTypeOf(@)", header: "vtkmGradient.h".}
proc IsA*(this: var vtkmGradient; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkmGradient.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkmGradient {.
    importcpp: "vtkmGradient::SafeDownCast(@)", header: "vtkmGradient.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkmGradient :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGradientFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkmGradient :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkmGradient :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkmGradient; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkmGradient.h".}
proc New*(): ptr vtkmGradient {.importcpp: "vtkmGradient::New(@)",
                            header: "vtkmGradient.h".}
## !!!Ignored construct:  /@{ *
##  When this flag is off (the default), then the computation will fall back
##  to the serial VTK version if VTK-m fails to run. When the flag is on,
##  the filter will generate an error if VTK-m fails to run. This is mostly
##  useful in testing to make sure the expected algorithm is run.
##  virtual vtkTypeBool GetForceVTKmForceVTKm ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceVTKm  of  << this -> ForceVTKm ) ; return this -> ForceVTKm ; } ;
## Error: expected ';'!!!

proc SetForceVTKm*(this: var vtkmGradient; _arg: vtkTypeBool) {.
    importcpp: "SetForceVTKm", header: "vtkmGradient.h".}
proc ForceVTKmOn*(this: var vtkmGradient) {.importcpp: "ForceVTKmOn",
                                        header: "vtkmGradient.h".}
proc ForceVTKmOff*(this: var vtkmGradient) {.importcpp: "ForceVTKmOff",
    header: "vtkmGradient.h".}
  ## /@}