## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridLinearRayIntegrator.h
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
##  @class   vtkUnstructuredGridLinearRayIntegrator
##  @brief   performs piecewise linear ray integration.
##
##
##
##  vtkUnstructuredGridLinearRayIntegrator performs piecewise linear ray
##  integration.  Considering that transfer functions in VTK are piecewise
##  linear, this class should give the "correct" integration under most
##  circumstances.  However, the computations performed are fairly hefty and
##  should, for the most part, only be used as a benchmark for other, faster
##  methods.
##
##  @sa
##  vtkUnstructuredGridPartialPreIntegration
##
##

import
  vtkRenderingVolumeModule, vtkUnstructuredGridVolumeRayIntegrator

discard "forward decl of vtkLinearRayIntegratorTransferFunction"
discard "forward decl of vtkVolumeProperty"
type
  vtkUnstructuredGridLinearRayIntegrator* {.
      importcpp: "vtkUnstructuredGridLinearRayIntegrator",
      header: "vtkUnstructuredGridLinearRayIntegrator.h", bycopy.} = object of vtkUnstructuredGridVolumeRayIntegrator
    vtkUnstructuredGridLinearRayIntegrator*
        {.importc: "vtkUnstructuredGridLinearRayIntegrator".}: VTK_NEWINSTANCE

  vtkUnstructuredGridLinearRayIntegratorSuperclass* = vtkUnstructuredGridVolumeRayIntegrator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridLinearRayIntegrator::IsTypeOf(@)",
    header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc IsA*(this: var vtkUnstructuredGridLinearRayIntegrator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridLinearRayIntegrator {.
    importcpp: "vtkUnstructuredGridLinearRayIntegrator::SafeDownCast(@)",
    header: "vtkUnstructuredGridLinearRayIntegrator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridLinearRayIntegrator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeRayIntegrator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridLinearRayIntegrator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridLinearRayIntegrator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkUnstructuredGridLinearRayIntegrator {.
    importcpp: "vtkUnstructuredGridLinearRayIntegrator::New(@)",
    header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc PrintSelf*(this: var vtkUnstructuredGridLinearRayIntegrator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc Initialize*(this: var vtkUnstructuredGridLinearRayIntegrator;
                volume: ptr vtkVolume; scalars: ptr vtkDataArray) {.
    importcpp: "Initialize", header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc Integrate*(this: var vtkUnstructuredGridLinearRayIntegrator;
               intersectionLengths: ptr vtkDoubleArray;
               nearIntersections: ptr vtkDataArray;
               farIntersections: ptr vtkDataArray; color: array[4, cfloat]) {.
    importcpp: "Integrate", header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc IntegrateRay*(length: cdouble; intensity_front: cdouble;
                  attenuation_front: cdouble; intensity_back: cdouble;
                  attenuation_back: cdouble; color: array[4, cfloat]) {.
    importcpp: "vtkUnstructuredGridLinearRayIntegrator::IntegrateRay(@)",
    header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc IntegrateRay*(length: cdouble; color_front: array[3, cdouble];
                  attenuation_front: cdouble; color_back: array[3, cdouble];
                  attenuation_back: cdouble; color: array[4, cfloat]) {.
    importcpp: "vtkUnstructuredGridLinearRayIntegrator::IntegrateRay(@)",
    header: "vtkUnstructuredGridLinearRayIntegrator.h".}
proc Psi*(length: cfloat; attenuation_front: cfloat; attenuation_back: cfloat): cfloat {.
    importcpp: "vtkUnstructuredGridLinearRayIntegrator::Psi(@)",
    header: "vtkUnstructuredGridLinearRayIntegrator.h".}