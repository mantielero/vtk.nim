## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridPartialPreIntegration.h
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
##  @class   vtkUnstructuredGridPartialPreIntegration
##  @brief   performs piecewise linear ray integration.
##
##
##
##  vtkUnstructuredGridPartialPreIntegration performs piecewise linear ray
##  integration.  This will give the same results as
##  vtkUnstructuredGridLinearRayIntegration (with potentially a error due to
##  table lookup quantization), but should be notably faster.  The algorithm
##  used is given by Moreland and Angel, "A Fast High Accuracy Volume
##  Renderer for Unstructured Data."
##
##  This class is thread safe only after the first instance is created.
##
##

import
  vtkMath, vtkRenderingVolumeModule, vtkUnstructuredGridVolumeRayIntegrator

discard "forward decl of vtkPartialPreIntegrationTransferFunction"
discard "forward decl of vtkVolumeProperty"
type
  vtkUnstructuredGridPartialPreIntegration* {.
      importcpp: "vtkUnstructuredGridPartialPreIntegration",
      header: "vtkUnstructuredGridPartialPreIntegration.h", bycopy.} = object of vtkUnstructuredGridVolumeRayIntegrator
    vtkUnstructuredGridPartialPreIntegration*
        {.importc: "vtkUnstructuredGridPartialPreIntegration".}: VTK_NEWINSTANCE

  vtkUnstructuredGridPartialPreIntegrationSuperclass* = vtkUnstructuredGridVolumeRayIntegrator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::IsTypeOf(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc IsA*(this: var vtkUnstructuredGridPartialPreIntegration; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUnstructuredGridPartialPreIntegration {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::SafeDownCast(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUnstructuredGridPartialPreIntegration :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridVolumeRayIntegrator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridPartialPreIntegration :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridPartialPreIntegration :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkUnstructuredGridPartialPreIntegration {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::New(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc PrintSelf*(this: var vtkUnstructuredGridPartialPreIntegration; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc Initialize*(this: var vtkUnstructuredGridPartialPreIntegration;
                volume: ptr vtkVolume; scalars: ptr vtkDataArray) {.
    importcpp: "Initialize", header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc Integrate*(this: var vtkUnstructuredGridPartialPreIntegration;
               intersectionLengths: ptr vtkDoubleArray;
               nearIntersections: ptr vtkDataArray;
               farIntersections: ptr vtkDataArray; color: array[4, cfloat]) {.
    importcpp: "Integrate", header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc IntegrateRay*(length: cdouble; intensity_front: cdouble;
                  attenuation_front: cdouble; intensity_back: cdouble;
                  attenuation_back: cdouble; color: array[4, cfloat]) {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::IntegrateRay(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc IntegrateRay*(length: cdouble; color_front: array[3, cdouble];
                  attenuation_front: cdouble; color_back: array[3, cdouble];
                  attenuation_back: cdouble; color: array[4, cfloat]) {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::IntegrateRay(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc Psi*(taufD: cfloat; taubD: cfloat): cfloat {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::Psi(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc GetPsiTable*(size: var cint): ptr cfloat {.
    importcpp: "vtkUnstructuredGridPartialPreIntegration::GetPsiTable(@)",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc BuildPsiTable*() {.importcpp: "vtkUnstructuredGridPartialPreIntegration::BuildPsiTable(@)",
                      header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc Psi*(this: var vtkUnstructuredGridPartialPreIntegration; taufD: cfloat;
         taubD: cfloat): cfloat {.importcpp: "Psi", header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc GetPsiTable*(this: var vtkUnstructuredGridPartialPreIntegration; size: var cint): ptr cfloat {.
    importcpp: "GetPsiTable", header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc IntegrateRay*(this: var vtkUnstructuredGridPartialPreIntegration;
                  length: cdouble; intensity_front: cdouble;
                  attenuation_front: cdouble; intensity_back: cdouble;
                  attenuation_back: cdouble; color: array[4, cfloat]) {.
    importcpp: "IntegrateRay",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}
proc IntegrateRay*(this: var vtkUnstructuredGridPartialPreIntegration;
                  length: cdouble; color_front: array[3, cdouble];
                  attenuation_front: cdouble; color_back: array[3, cdouble];
                  attenuation_back: cdouble; color: array[4, cfloat]) {.
    importcpp: "IntegrateRay",
    header: "vtkUnstructuredGridPartialPreIntegration.h".}