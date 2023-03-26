## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeoProjection.h
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
##  @class   vtkGeoProjection
##  @brief   Represent a projection from a sphere to a plane
##
##
##  This class uses the PROJ.4 library to represent geographic coordinate
##  projections.
##

import
  vtkGeovisCoreModule, vtkObject

discard "forward decl of PJconsts"
type
  PJ* = PJconsts
  projPJ* = ptr PJ
  vtkGeoProjection* {.importcpp: "vtkGeoProjection", header: "vtkGeoProjection.h",
                     bycopy.} = object of vtkObject
    vtkGeoProjection* {.importc: "vtkGeoProjection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGeoProjection {.importcpp: "vtkGeoProjection::New(@)",
                                header: "vtkGeoProjection.h".}
proc PrintSelf*(this: var vtkGeoProjection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGeoProjection.h".}
type
  vtkGeoProjectionSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGeoProjection::IsTypeOf(@)", header: "vtkGeoProjection.h".}
proc IsA*(this: var vtkGeoProjection; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGeoProjection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGeoProjection {.
    importcpp: "vtkGeoProjection::SafeDownCast(@)", header: "vtkGeoProjection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGeoProjection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeoProjection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeoProjection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc GetNumberOfProjections*(): cint {.importcpp: "vtkGeoProjection::GetNumberOfProjections(@)",
                                    header: "vtkGeoProjection.h".}
proc GetProjectionName*(projection: cint): cstring {.
    importcpp: "vtkGeoProjection::GetProjectionName(@)",
    header: "vtkGeoProjection.h".}
proc GetProjectionDescription*(projection: cint): cstring {.
    importcpp: "vtkGeoProjection::GetProjectionDescription(@)",
    header: "vtkGeoProjection.h".}
proc SetName*(this: var vtkGeoProjection; _arg: cstring) {.importcpp: "SetName",
    header: "vtkGeoProjection.h".}
proc GetName*(this: var vtkGeoProjection): cstring {.importcpp: "GetName",
    header: "vtkGeoProjection.h".}
  ## /@}
  ## *
  ##  Return the index of the current projection's type in the list of all projection types.
  ##  On error, this will return -1. On success, it returns a number in [0,GetNumberOfProjections()[.
  ##
proc GetIndex*(this: var vtkGeoProjection): cint {.importcpp: "GetIndex",
    header: "vtkGeoProjection.h".}
proc GetDescription*(this: var vtkGeoProjection): cstring {.
    importcpp: "GetDescription", header: "vtkGeoProjection.h".}
proc SetCentralMeridian*(this: var vtkGeoProjection; _arg: cdouble) {.
    importcpp: "SetCentralMeridian", header: "vtkGeoProjection.h".}
## !!!Ignored construct:  virtual double GetCentralMeridian ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CentralMeridian  of  << this -> CentralMeridian ) ; return this -> CentralMeridian ; } ;
## Error: expected ';'!!!

proc GetProjection*(this: var vtkGeoProjection): projPJ {.importcpp: "GetProjection",
    header: "vtkGeoProjection.h".}
proc SetOptionalParameter*(this: var vtkGeoProjection; key: cstring; value: cstring) {.
    importcpp: "SetOptionalParameter", header: "vtkGeoProjection.h".}
proc RemoveOptionalParameter*(this: var vtkGeoProjection; a2: cstring) {.
    importcpp: "RemoveOptionalParameter", header: "vtkGeoProjection.h".}
proc GetNumberOfOptionalParameters*(this: var vtkGeoProjection): cint {.
    importcpp: "GetNumberOfOptionalParameters", header: "vtkGeoProjection.h".}
proc GetOptionalParameterKey*(this: var vtkGeoProjection; index: cint): cstring {.
    importcpp: "GetOptionalParameterKey", header: "vtkGeoProjection.h".}
proc GetOptionalParameterValue*(this: var vtkGeoProjection; index: cint): cstring {.
    importcpp: "GetOptionalParameterValue", header: "vtkGeoProjection.h".}
proc ClearOptionalParameters*(this: var vtkGeoProjection) {.
    importcpp: "ClearOptionalParameters", header: "vtkGeoProjection.h".}
proc SetNamePROJ4String*(this: var vtkGeoProjection; _arg: cstring) {.
    importcpp: "SetNamePROJ4String", header: "vtkGeoProjection.h".}
proc GetNamePROJ4String*(this: var vtkGeoProjection): cstring {.
    importcpp: "GetNamePROJ4String", header: "vtkGeoProjection.h".}
  ## /@}