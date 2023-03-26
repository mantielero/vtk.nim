## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageBSplineInterpolator.h
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
##  @class   vtkImageBSplineInterpolator
##  @brief   perform b-spline interpolation on images
##
##  vtkImageBSplineInterpolator can be used to perform b-spline interpolation
##  on images that have been filtered with vtkImageBSplineCoefficients.  The
##  b-spline interpolants provide the maximum possible degree of continuity
##  for a given kernel size, but require that the image data be pre-filtered
##  to generate b-spline coefficients before the interpolation is performed.
##  Interpolating data that has not been pre-filtered will give incorrect
##  results.
##  @sa
##  vtkImageReslice vtkImageBSplineCoefficients vtkBSplineTransform
##  @par Thanks:
##  This class was written by David Gobbi at the Seaman Family MR Research
##  Centre, Foothills Medical Centre, Calgary, Alberta.
##  DG Gobbi and YP Starreveld,
##  "Uniform B-Splines for the VTK Imaging Pipeline,"
##  VTK Journal, 2011,
##  http://hdl.handle.net/10380/3252
##

import
  vtkAbstractImageInterpolator, vtkImagingCoreModule

const
  VTK_IMAGE_BSPLINE_DEGREE_MAX* = 9

discard "forward decl of vtkImageData"
discard "forward decl of vtkInterpolationInfo"
type
  vtkImageBSplineInterpolator* {.importcpp: "vtkImageBSplineInterpolator",
                                header: "vtkImageBSplineInterpolator.h", bycopy.} = object of vtkAbstractImageInterpolator
    vtkImageBSplineInterpolator* {.importc: "vtkImageBSplineInterpolator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageBSplineInterpolator {.
    importcpp: "vtkImageBSplineInterpolator::New(@)",
    header: "vtkImageBSplineInterpolator.h".}
type
  vtkImageBSplineInterpolatorSuperclass* = vtkAbstractImageInterpolator

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageBSplineInterpolator::IsTypeOf(@)",
    header: "vtkImageBSplineInterpolator.h".}
proc IsA*(this: var vtkImageBSplineInterpolator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageBSplineInterpolator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageBSplineInterpolator {.
    importcpp: "vtkImageBSplineInterpolator::SafeDownCast(@)",
    header: "vtkImageBSplineInterpolator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageBSplineInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractImageInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageBSplineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageBSplineInterpolator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageBSplineInterpolator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkImageBSplineInterpolator.h".}
proc SetSplineDegree*(this: var vtkImageBSplineInterpolator; degree: cint) {.
    importcpp: "SetSplineDegree", header: "vtkImageBSplineInterpolator.h".}
proc GetSplineDegree*(this: var vtkImageBSplineInterpolator): cint {.
    importcpp: "GetSplineDegree", header: "vtkImageBSplineInterpolator.h".}
proc GetSplineDegreeMinValue*(this: var vtkImageBSplineInterpolator): cint {.
    importcpp: "GetSplineDegreeMinValue", header: "vtkImageBSplineInterpolator.h".}
proc GetSplineDegreeMaxValue*(this: var vtkImageBSplineInterpolator): cint {.
    importcpp: "GetSplineDegreeMaxValue", header: "vtkImageBSplineInterpolator.h".}
proc ComputeSupportSize*(this: var vtkImageBSplineInterpolator;
                        matrix: array[16, cdouble]; size: array[3, cint]) {.
    importcpp: "ComputeSupportSize", header: "vtkImageBSplineInterpolator.h".}
proc IsSeparable*(this: var vtkImageBSplineInterpolator): bool {.
    importcpp: "IsSeparable", header: "vtkImageBSplineInterpolator.h".}
proc PrecomputeWeightsForExtent*(this: var vtkImageBSplineInterpolator;
                                matrix: array[16, cdouble]; extent: array[6, cint];
                                newExtent: array[6, cint];
                                weights: ptr vtkInterpolationWeights) {.
    importcpp: "PrecomputeWeightsForExtent",
    header: "vtkImageBSplineInterpolator.h".}
proc PrecomputeWeightsForExtent*(this: var vtkImageBSplineInterpolator;
                                matrix: array[16, cfloat]; extent: array[6, cint];
                                newExtent: array[6, cint];
                                weights: ptr vtkInterpolationWeights) {.
    importcpp: "PrecomputeWeightsForExtent",
    header: "vtkImageBSplineInterpolator.h".}
proc FreePrecomputedWeights*(this: var vtkImageBSplineInterpolator;
                            weights: ptr vtkInterpolationWeights) {.
    importcpp: "FreePrecomputedWeights", header: "vtkImageBSplineInterpolator.h".}