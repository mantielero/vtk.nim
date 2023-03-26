## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHomogeneousTransform.h
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
##  @class   vtkHomogeneousTransform
##  @brief   superclass for homogeneous transformations
##
##  vtkHomogeneousTransform provides a generic interface for homogeneous
##  transformations, i.e. transformations which can be represented by
##  multiplying a 4x4 matrix with a homogeneous coordinate.
##  @sa
##  vtkPerspectiveTransform vtkLinearTransform vtkIdentityTransform
##

import
  vtkAbstractTransform, vtkCommonTransformsModule

discard "forward decl of vtkMatrix4x4"
type
  vtkHomogeneousTransform* {.importcpp: "vtkHomogeneousTransform",
                            header: "vtkHomogeneousTransform.h", bycopy.} = object of vtkAbstractTransform
    vtkHomogeneousTransform* {.importc: "vtkHomogeneousTransform".}: VTK_NEWINSTANCE

  vtkHomogeneousTransformSuperclass* = vtkAbstractTransform

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHomogeneousTransform::IsTypeOf(@)",
    header: "vtkHomogeneousTransform.h".}
proc IsA*(this: var vtkHomogeneousTransform; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHomogeneousTransform.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHomogeneousTransform {.
    importcpp: "vtkHomogeneousTransform::SafeDownCast(@)",
    header: "vtkHomogeneousTransform.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHomogeneousTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHomogeneousTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHomogeneousTransform :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHomogeneousTransform; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHomogeneousTransform.h".}
proc TransformPoints*(this: var vtkHomogeneousTransform; inPts: ptr vtkPoints;
                     outPts: ptr vtkPoints) {.importcpp: "TransformPoints",
    header: "vtkHomogeneousTransform.h".}
proc TransformPointsNormalsVectors*(this: var vtkHomogeneousTransform;
                                   inPts: ptr vtkPoints; outPts: ptr vtkPoints;
                                   inNms: ptr vtkDataArray;
                                   outNms: ptr vtkDataArray;
                                   inVrs: ptr vtkDataArray;
                                   outVrs: ptr vtkDataArray;
                                   nOptionalVectors: cint = 0;
                                   inVrsArr: ptr ptr vtkDataArray = nil;
                                   outVrsArr: ptr ptr vtkDataArray = nil) {.
    importcpp: "TransformPointsNormalsVectors",
    header: "vtkHomogeneousTransform.h".}
proc GetMatrix*(this: var vtkHomogeneousTransform; m: ptr vtkMatrix4x4) {.
    importcpp: "GetMatrix", header: "vtkHomogeneousTransform.h".}
proc GetMatrix*(this: var vtkHomogeneousTransform): ptr vtkMatrix4x4 {.
    importcpp: "GetMatrix", header: "vtkHomogeneousTransform.h".}
proc GetHomogeneousInverse*(this: var vtkHomogeneousTransform): ptr vtkHomogeneousTransform {.
    importcpp: "GetHomogeneousInverse", header: "vtkHomogeneousTransform.h".}
proc InternalTransformPoint*(this: var vtkHomogeneousTransform;
                            `in`: array[3, cfloat]; `out`: array[3, cfloat]) {.
    importcpp: "InternalTransformPoint", header: "vtkHomogeneousTransform.h".}
proc InternalTransformPoint*(this: var vtkHomogeneousTransform;
                            `in`: array[3, cdouble]; `out`: array[3, cdouble]) {.
    importcpp: "InternalTransformPoint", header: "vtkHomogeneousTransform.h".}
proc InternalTransformDerivative*(this: var vtkHomogeneousTransform;
                                 `in`: array[3, cfloat]; `out`: array[3, cfloat];
                                 derivative: array[3, array[3, cfloat]]) {.
    importcpp: "InternalTransformDerivative", header: "vtkHomogeneousTransform.h".}
proc InternalTransformDerivative*(this: var vtkHomogeneousTransform;
                                 `in`: array[3, cdouble]; `out`: array[3, cdouble];
                                 derivative: array[3, array[3, cdouble]]) {.
    importcpp: "InternalTransformDerivative", header: "vtkHomogeneousTransform.h".}