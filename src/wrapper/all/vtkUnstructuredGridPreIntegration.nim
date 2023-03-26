## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridPreIntegration.h
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
##
##  Copyright 2004 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##  license for use of this work by or on behalf of the
##  U.S. Government. Redistribution and use in source and binary forms, with
##  or without modification, are permitted provided that this Notice and any
##  statement of authorship are reproduced on all copies.
##
## *
##  @class   vtkUnstructuredGridPreIntegration
##  @brief   performs ray integration with pre-integration tables.
##
##
##
##  vtkUnstructuredGridPreIntegration performs ray integration by looking
##  into a precomputed table.  The result should be equivalent to that
##  computed by vtkUnstructuredGridLinearRayIntegrator and
##  vtkUnstructuredGridPartialPreIntegration, but faster than either one.
##  The pre-integration algorithm was first introduced by Roettger, Kraus,
##  and Ertl in "Hardware-Accelerated Volume And Isosurface Rendering Based
##  On Cell-Projection."
##
##  Due to table size limitations, a table can only be indexed by
##  independent scalars.  Thus, dependent scalars are not supported.
##
##

import
  vtkRenderingVolumeModule, vtkUnstructuredGridVolumeRayIntegrator

discard "forward decl of vtkVolumeProperty"
type
  vtkUnstructuredGridPreIntegration* {.importcpp: "vtkUnstructuredGridPreIntegration", header: "vtkUnstructuredGridPreIntegration.h",
                                      bycopy.} = object of vtkUnstructuredGridVolumeRayIntegrator
    vtkUnstructuredGridPreIntegration* {.importc: "vtkUnstructuredGridPreIntegration".}: VTK_NEWINSTANCE

  vtkUnstructuredGridPreIntegrationSuperclass* = vtkUnstructuredGridVolumeRayIntegrator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridPreIntegration::IsTypeOf(@)",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc IsA*(this: var vtkUnstructuredGridPreIntegration; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridPreIntegration.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridPreIntegration {.
    importcpp: "vtkUnstructuredGridPreIntegration::SafeDownCast(@)",
    header: "vtkUnstructuredGridPreIntegration.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridPreIntegration :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeRayIntegrator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridPreIntegration :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridPreIntegration :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkUnstructuredGridPreIntegration {.
    importcpp: "vtkUnstructuredGridPreIntegration::New(@)",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc PrintSelf*(this: var vtkUnstructuredGridPreIntegration; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkUnstructuredGridPreIntegration.h".}
proc Initialize*(this: var vtkUnstructuredGridPreIntegration; volume: ptr vtkVolume;
                scalars: ptr vtkDataArray) {.importcpp: "Initialize",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc Integrate*(this: var vtkUnstructuredGridPreIntegration;
               intersectionLengths: ptr vtkDoubleArray;
               nearIntersections: ptr vtkDataArray;
               farIntersections: ptr vtkDataArray; color: array[4, cfloat]) {.
    importcpp: "Integrate", header: "vtkUnstructuredGridPreIntegration.h".}
proc GetnameIntegrator*(this: var vtkUnstructuredGridPreIntegration): ptr vtkUnstructuredGridVolumeRayIntegrator {.
    importcpp: "GetnameIntegrator", header: "vtkUnstructuredGridPreIntegration.h".}
proc SetIntegrator*(this: var vtkUnstructuredGridPreIntegration;
                   a2: ptr vtkUnstructuredGridVolumeRayIntegrator) {.
    importcpp: "SetIntegrator", header: "vtkUnstructuredGridPreIntegration.h".}
proc SetIntegrationTableScalarResolution*(
    this: var vtkUnstructuredGridPreIntegration; _arg: cint) {.
    importcpp: "SetIntegrationTableScalarResolution",
    header: "vtkUnstructuredGridPreIntegration.h".}
## !!!Ignored construct:  virtual int GetIntegrationTableScalarResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationTableScalarResolution  of  << this -> IntegrationTableScalarResolution ) ; return this -> IntegrationTableScalarResolution ; } ;
## Error: expected ';'!!!

proc SetIntegrationTableScalarResolutionIntegrationTableLengthResolution*(
    this: var vtkUnstructuredGridPreIntegration; _arg: cint) {.importcpp: "SetIntegrationTableScalarResolutionIntegrationTableLengthResolution",
    header: "vtkUnstructuredGridPreIntegration.h".}
## !!!Ignored construct:  virtual int GetIntegrationTableScalarResolutionIntegrationTableLengthResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IntegrationTableLengthResolution  of  << this -> IntegrationTableLengthResolution ) ; return this -> IntegrationTableLengthResolution ; } ;
## Error: expected ';'!!!

proc GetIntegrationTableScalarShift*(this: var vtkUnstructuredGridPreIntegration;
                                    component: cint = 0): cdouble {.
    importcpp: "GetIntegrationTableScalarShift",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc GetIntegrationTableScalarScale*(this: var vtkUnstructuredGridPreIntegration;
                                    component: cint = 0): cdouble {.
    importcpp: "GetIntegrationTableScalarScale",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc GetIntegrationTableLengthScale*(this: var vtkUnstructuredGridPreIntegration): cdouble {.
    importcpp: "GetIntegrationTableLengthScale",
    header: "vtkUnstructuredGridPreIntegration.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/set whether to use incremental pre-integration (by default it's
##  on).  Incremental pre-integration is much faster but can introduce
##  error due to numerical imprecision.  Under most circumstances, the
##  error is not noticeable.
##  virtual vtkTypeBool GetIntegrationTableScalarResolutionIntegrationTableLengthResolutionIncrementalPreIntegrationIncrementalPreIntegration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IncrementalPreIntegration  of  << this -> IncrementalPreIntegration ) ; return this -> IncrementalPreIntegration ; } ;
## Error: expected ';'!!!

proc SetIntegrationTableScalarResolutionIntegrationTableLengthResolutionIncrementalPreIntegration*(
    this: var vtkUnstructuredGridPreIntegration; _arg: vtkTypeBool) {.importcpp: "SetIntegrationTableScalarResolutionIntegrationTableLengthResolutionIncrementalPreIntegration",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc IncrementalPreIntegrationOn*(this: var vtkUnstructuredGridPreIntegration) {.
    importcpp: "IncrementalPreIntegrationOn",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc IncrementalPreIntegrationOff*(this: var vtkUnstructuredGridPreIntegration) {.
    importcpp: "IncrementalPreIntegrationOff",
    header: "vtkUnstructuredGridPreIntegration.h".}
  ## /@}
  ## *
  ##  Get the partial pre-integration table for the given scalar component.
  ##  The tables are built when Initialize is called.  A segment of length d
  ##  with a front scalar of sf and a back scalar of sb is referenced in the
  ##  resulting table as 4 * ((l * \c IntegrationTableLengthScale) * \c
  ##  IntegrationTableScalarResolution * \c IntegrationTableScalarResolution
  ##  + (sb * \c IntegrationTableScalarScale + \c
  ##  IntegrationTableScalarShift) * \c IntegrationTableScalarResolution
  ##  + (sf * \c IntegrationTableScalarScale + \c
  ##  IntegrationTableScalarShift)).
  ##
proc GetPreIntegrationTable*(this: var vtkUnstructuredGridPreIntegration;
                            component: cint = 0): ptr cfloat {.
    importcpp: "GetPreIntegrationTable",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc GetTableEntry*(this: var vtkUnstructuredGridPreIntegration;
                   scalar_front: cdouble; scalar_back: cdouble; length: cdouble;
                   component: cint = 0): ptr cfloat {.importcpp: "GetTableEntry",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc GetIndexedTableEntry*(this: var vtkUnstructuredGridPreIntegration;
                          scalar_front_index: cint; scalar_back_index: cint;
                          length_index: cint; component: cint = 0): ptr cfloat {.
    importcpp: "GetIndexedTableEntry",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc GetIndexedTableEntry*(this: var vtkUnstructuredGridPreIntegration;
                          scalar_front_index: cint; scalar_back_index: cint;
                          length_index: cint; component: cint): ptr cfloat {.
    importcpp: "GetIndexedTableEntry",
    header: "vtkUnstructuredGridPreIntegration.h".}
proc GetTableEntry*(this: var vtkUnstructuredGridPreIntegration;
                   scalar_front: cdouble; scalar_back: cdouble; length: cdouble;
                   component: cint): ptr cfloat {.importcpp: "GetTableEntry",
    header: "vtkUnstructuredGridPreIntegration.h".}