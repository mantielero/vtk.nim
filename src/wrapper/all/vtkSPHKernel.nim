## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSPHKernel.h
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
##  @class   vtkSPHKernel
##  @brief   a family of SPH interpolation kernels
##
##
##  vtkSPHKernel is an abstract superclass for smoothed-particle hydrodynamics
##  interpolation kernels as described by D.J. Price (see full reference
##  below).
##
##  Note that the kernel operates over a volume in space defined by a radius
##  at a sampling point. The kernel implicitly assumes that the particles
##  making up the input data satisfies physical properties such as
##  conservation of mass. Therefore subclasses of this kernel are not
##  generally applicable for interpolation processes, and therefore operate in
##  conjunction with the vthSPHInterpolator class.
##
##  By default the kernel computes local particle volume from the spatial step^3.
##  However, if both an optional mass and density arrays are provided then they are
##  used to compute local volume.
##
##  Also be default, the local neighborhood around a point to be interpolated is
##  computed as the CutoffFactor * SpatialStep. (Note the CutoffFactor varies for
##  each type of SPH kernel.) However, the user may specify a CutoffArray which
##  enables variable cutoff distances per each point.
##
##  @warning
##  For more information see D.J. Price, Smoothed particle hydrodynamics and
##  magnetohydrodynamics, J. Comput. Phys. 231:759-794, 2012. Especially
##  equation 49.
##
##  @par Acknowledgments:
##  The following work has been generously supported by Altair Engineering
##  and FluiDyna GmbH. Please contact Steve Cosgrove or Milos Stanic for
##  more information.
##
##  @sa
##  vtkSPHKernel vtkSPHQuinticKernel vtkInterpolationKernel vtkGaussianKernel
##  vtkShepardKernel vtkLinearKernel
##

import
  vtkFiltersPointsModule, vtkInterpolationKernel, vtkStdString

discard "forward decl of vtkIdList"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkFloatArray"
type
  vtkSPHKernel* {.importcpp: "vtkSPHKernel", header: "vtkSPHKernel.h", bycopy.} = object of vtkInterpolationKernel ## /@{
                                                                                                         ## *
                                                                                                         ##  Standard methods for instantiation, obtaining type information, and printing.
                                                                                                         ##
    vtkSPHKernel* {.importc: "vtkSPHKernel".}: VTK_NEWINSTANCE
    ##  also known as smoothing length h
    ##  sptial dimension of the kernel
    ##  Optional arrays aid in the interpolation process (computes volume)
    ##  Internal data members generated during construction and initialization
    ##  Terminology is spatial step = smoothing length h
    ##  varies across each kernel, e.g. cubic=2, quartic=2.5, quintic=3
    ##  the spatial step * cutoff factor
    ##  normalization constant
    ##  distance normalization factor 1/(spatial step)
    ##  dimensional normalization factor sigma/(spatial step)^Dimension
    ##  if mass and density arrays not specified, use this
    ##  if single component cutoff array provided
    ##  if both mass and density arrays are present

  vtkSPHKernelSuperclass* = vtkInterpolationKernel

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSPHKernel::IsTypeOf(@)", header: "vtkSPHKernel.h".}
proc IsA*(this: var vtkSPHKernel; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSPHKernel.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSPHKernel {.
    importcpp: "vtkSPHKernel::SafeDownCast(@)", header: "vtkSPHKernel.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSPHKernel :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInterpolationKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSPHKernel :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSPHKernel :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSPHKernel; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSPHKernel.h".}
proc SetSpatialStep*(this: var vtkSPHKernel; _arg: cdouble) {.
    importcpp: "SetSpatialStep", header: "vtkSPHKernel.h".}
proc GetSpatialStepMinValue*(this: var vtkSPHKernel): cdouble {.
    importcpp: "GetSpatialStepMinValue", header: "vtkSPHKernel.h".}
proc GetSpatialStepMaxValue*(this: var vtkSPHKernel): cdouble {.
    importcpp: "GetSpatialStepMaxValue", header: "vtkSPHKernel.h".}
## !!!Ignored construct:  virtual double GetSpatialStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SpatialStep  of  << this -> SpatialStep ) ; return this -> SpatialStep ; } ;
## Error: expected ';'!!!

proc SetSpatialStepDimension*(this: var vtkSPHKernel; _arg: cint) {.
    importcpp: "SetSpatialStepDimension", header: "vtkSPHKernel.h".}
proc GetSpatialStepMinValueDimensionMinValue*(this: var vtkSPHKernel): cint {.
    importcpp: "GetSpatialStepMinValueDimensionMinValue", header: "vtkSPHKernel.h".}
proc GetSpatialStepMaxValueDimensionMaxValue*(this: var vtkSPHKernel): cint {.
    importcpp: "GetSpatialStepMaxValueDimensionMaxValue", header: "vtkSPHKernel.h".}
## !!!Ignored construct:  virtual int GetSpatialStepDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Dimension  of  << this -> Dimension ) ; return this -> Dimension ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Return the cutoff factor. This is hard wired into the kernel (e.g., the
##  vtkSPHQuinticKernel has a cutoff factor = 3.0).
##  virtual double GetSpatialStepDimensionCutoffFactorCutoffFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CutoffFactor  of  << this -> CutoffFactor ) ; return this -> CutoffFactor ; } ;
## Error: expected ';'!!!

proc SetCutoffArray*(this: var vtkSPHKernel; a2: ptr vtkDataArray) {.
    importcpp: "SetCutoffArray", header: "vtkSPHKernel.h".}
proc GetnameCutoffArray*(this: var vtkSPHKernel): ptr vtkDataArray {.
    importcpp: "GetnameCutoffArray", header: "vtkSPHKernel.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the (optional) density array. Used with the mass array to
  ##  compute local particle volumes.
  ##
proc SetDensityArray*(this: var vtkSPHKernel; a2: ptr vtkDataArray) {.
    importcpp: "SetDensityArray", header: "vtkSPHKernel.h".}
proc GetnameCutoffArrayDensityArray*(this: var vtkSPHKernel): ptr vtkDataArray {.
    importcpp: "GetnameCutoffArrayDensityArray", header: "vtkSPHKernel.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the (optional) mass array. Used with the density array to
  ##  compute local particle volumes.
  ##
proc SetMassArray*(this: var vtkSPHKernel; a2: ptr vtkDataArray) {.
    importcpp: "SetMassArray", header: "vtkSPHKernel.h".}
proc GetnameCutoffArrayDensityArrayMassArray*(this: var vtkSPHKernel): ptr vtkDataArray {.
    importcpp: "GetnameCutoffArrayDensityArrayMassArray", header: "vtkSPHKernel.h".}
  ## /@}
  ## *
  ##  Produce the computational parameters for the kernel. Invoke this method
  ##  after setting initial values like SpatialStep.
  ##
proc Initialize*(this: var vtkSPHKernel; loc: ptr vtkAbstractPointLocator;
                ds: ptr vtkDataSet; pd: ptr vtkPointData) {.importcpp: "Initialize",
    header: "vtkSPHKernel.h".}
proc ComputeBasis*(this: var vtkSPHKernel; x: array[3, cdouble]; pIds: ptr vtkIdList;
                  ptId: vtkIdType = 0): vtkIdType {.importcpp: "ComputeBasis",
    header: "vtkSPHKernel.h".}
proc ComputeWeights*(this: var vtkSPHKernel; x: array[3, cdouble]; pIds: ptr vtkIdList;
                    weights: ptr vtkDoubleArray): vtkIdType {.
    importcpp: "ComputeWeights", header: "vtkSPHKernel.h".}
proc ComputeDerivWeights*(this: var vtkSPHKernel; x: array[3, cdouble];
                         pIds: ptr vtkIdList; weights: ptr vtkDoubleArray;
                         gradWeights: ptr vtkDoubleArray): vtkIdType {.
    importcpp: "ComputeDerivWeights", header: "vtkSPHKernel.h".}
proc ComputeFunctionWeight*(this: var vtkSPHKernel; d: cdouble): cdouble {.
    importcpp: "ComputeFunctionWeight", header: "vtkSPHKernel.h".}
proc ComputeDerivWeight*(this: var vtkSPHKernel; d: cdouble): cdouble {.
    importcpp: "ComputeDerivWeight", header: "vtkSPHKernel.h".}
## !!!Ignored construct:  /@{ *
##  Return the SPH normalization factor. This also includes the contribution
##  of 1/h^d, where h is the smoothing length (i.e., spatial step) and d is
##  the dimension of the kernel. The returned value is only valid after the
##  kernel is initialized.
##  virtual double GetSpatialStepDimensionCutoffFactorCutoffFactorNormFactorNormFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NormFactor  of  << this -> NormFactor ) ; return this -> NormFactor ; } ;
## Error: expected ';'!!!
