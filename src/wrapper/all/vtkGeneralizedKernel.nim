## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeneralizedKernel.h
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
##  @class   vtkGeneralizedKernel
##  @brief   flexible, general interpolation kernels
##
##
##  vtkGeneralizedKernel is an abstract class that defines an API for concrete
##  general-purpose, kernel subclasses. vtkGeneralizedKernels has important
##  properties that make them useful in a variety of interpolation
##  applications:
##  <pre>
##  1. The weights are normalized.
##  2. The footprint of the basis is configurable.
##  3. Probabilistic weighting functions can be used to favor certain weights.
##  </pre>
##  The following paragraphs describe each of these properties in more detail.
##
##  Normalized weightings simple mean Sum(w_i) = 1. This ensures that the
##  interpolation process is well behaved.
##
##  The interpolation footprint is the set of points that are used to perform
##  the interpolation process. For example, it is possible to choose between a
##  radius-based kernel selection, and one based on the N nearest
##  neighbors. Note that the performance and mathematical properties of
##  kernels may vary greatly depending on which kernel style is selected. For
##  example, if a radius-based kernel footprint is used, and the radius is too
##  big, the algorithm can perform in n^3 fashion.
##
##  Finally, in advanced usage, probability functions can be applied to the
##  interpolation weights (prior to normalization). These probability
##  functions are confidence estimates that the data at a particular point is
##  accurate. A typical application is when laser scans are used to acquire
##  point measurements, which return normals that indicate glancing returns
##  versus direct, near orthogonal hits. Another use is when point clouds are
##  combined, where some clouds are acquired with more accurate, detailed
##  devices versus a broad, potentially coarser acquisition process.
##
##  @warning
##  Some kernels, like the Voronoi kernel, cannot be subclasses of this class
##  because their definition inherently defines the basis style. For example,
##  the Voronoi kernel is simply the single closest point. SPH kernels are
##  similar, because they implicitly depend on a particle distribution
##  consistent with simulation constraints such as conservation of mass, etc.
##
##  @sa
##  vtkPointInterpolator vtkPointInterpolator2D vtkGaussianKernel vtkSPHKernel
##  vtkShepardKernel vtkLinearKernel vtkVoronoiKernel
##

import
  vtkFiltersPointsModule, vtkInterpolationKernel

type
  vtkGeneralizedKernel* {.importcpp: "vtkGeneralizedKernel",
                         header: "vtkGeneralizedKernel.h", bycopy.} = object of vtkInterpolationKernel ## /@{
                                                                                                ## *
                                                                                                ##  Standard methods for type and printing.
                                                                                                ##
    vtkGeneralizedKernel* {.importc: "vtkGeneralizedKernel".}: VTK_NEWINSTANCE

  vtkGeneralizedKernelSuperclass* = vtkInterpolationKernel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGeneralizedKernel::IsTypeOf(@)",
    header: "vtkGeneralizedKernel.h".}
proc IsA*(this: var vtkGeneralizedKernel; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGeneralizedKernel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGeneralizedKernel {.
    importcpp: "vtkGeneralizedKernel::SafeDownCast(@)",
    header: "vtkGeneralizedKernel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGeneralizedKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInterpolationKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeneralizedKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeneralizedKernel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGeneralizedKernel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGeneralizedKernel.h".}
proc ComputeBasis*(this: var vtkGeneralizedKernel; x: array[3, cdouble];
                  pIds: ptr vtkIdList; ptId: vtkIdType = 0): vtkIdType {.
    importcpp: "ComputeBasis", header: "vtkGeneralizedKernel.h".}
proc ComputeWeights*(this: var vtkGeneralizedKernel; x: array[3, cdouble];
                    pIds: ptr vtkIdList; prob: ptr vtkDoubleArray;
                    weights: ptr vtkDoubleArray): vtkIdType {.
    importcpp: "ComputeWeights", header: "vtkGeneralizedKernel.h".}
proc ComputeWeights*(this: var vtkGeneralizedKernel; x: array[3, cdouble];
                    pIds: ptr vtkIdList; weights: ptr vtkDoubleArray): vtkIdType {.
    importcpp: "ComputeWeights", header: "vtkGeneralizedKernel.h".}
type
  vtkGeneralizedKernelKernelStyle* {.size: sizeof(cint), importcpp: "vtkGeneralizedKernel::KernelStyle",
                                    header: "vtkGeneralizedKernel.h".} = enum
    RADIUS = 0, N_CLOSEST = 1


proc SetKernelFootprint*(this: var vtkGeneralizedKernel; _arg: cint) {.
    importcpp: "SetKernelFootprint", header: "vtkGeneralizedKernel.h".}
## !!!Ignored construct:  virtual int GetKernelFootprint ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << KernelFootprint  of  << this -> KernelFootprint ) ; return this -> KernelFootprint ; } ;
## Error: expected ';'!!!

proc SetKernelFootprintToRadius*(this: var vtkGeneralizedKernel) {.
    importcpp: "SetKernelFootprintToRadius", header: "vtkGeneralizedKernel.h".}
proc SetKernelFootprintToNClosest*(this: var vtkGeneralizedKernel) {.
    importcpp: "SetKernelFootprintToNClosest", header: "vtkGeneralizedKernel.h".}
proc SetRadius*(this: var vtkGeneralizedKernel; _arg: cdouble) {.
    importcpp: "SetRadius", header: "vtkGeneralizedKernel.h".}
proc GetRadiusMinValue*(this: var vtkGeneralizedKernel): cdouble {.
    importcpp: "GetRadiusMinValue", header: "vtkGeneralizedKernel.h".}
proc GetRadiusMaxValue*(this: var vtkGeneralizedKernel): cdouble {.
    importcpp: "GetRadiusMaxValue", header: "vtkGeneralizedKernel.h".}
## !!!Ignored construct:  virtual double GetKernelFootprintRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetRadiusNumberOfPoints*(this: var vtkGeneralizedKernel; _arg: cint) {.
    importcpp: "SetRadiusNumberOfPoints", header: "vtkGeneralizedKernel.h".}
proc GetRadiusMinValueNumberOfPointsMinValue*(this: var vtkGeneralizedKernel): cint {.
    importcpp: "GetRadiusMinValueNumberOfPointsMinValue",
    header: "vtkGeneralizedKernel.h".}
proc GetRadiusMaxValueNumberOfPointsMaxValue*(this: var vtkGeneralizedKernel): cint {.
    importcpp: "GetRadiusMaxValueNumberOfPointsMaxValue",
    header: "vtkGeneralizedKernel.h".}
## !!!Ignored construct:  virtual int GetKernelFootprintRadiusNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPoints  of  << this -> NumberOfPoints ) ; return this -> NumberOfPoints ; } ;
## Error: expected ';'!!!

proc SetKernelFootprintNormalizeWeights*(this: var vtkGeneralizedKernel; _arg: bool) {.
    importcpp: "SetKernelFootprintNormalizeWeights",
    header: "vtkGeneralizedKernel.h".}
## !!!Ignored construct:  virtual bool GetKernelFootprintRadiusNumberOfPointsNormalizeWeights ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormalizeWeights  of  << this -> NormalizeWeights ) ; return this -> NormalizeWeights ; } ;
## Error: expected ';'!!!

proc NormalizeWeightsOn*(this: var vtkGeneralizedKernel) {.
    importcpp: "NormalizeWeightsOn", header: "vtkGeneralizedKernel.h".}
proc NormalizeWeightsOff*(this: var vtkGeneralizedKernel) {.
    importcpp: "NormalizeWeightsOff", header: "vtkGeneralizedKernel.h".}
  ## /@}