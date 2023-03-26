## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkHighestDensityRegionsStatistics.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkHighestDensityRegionsStatistics
##  @brief   Compute a random vector of
##  density f from input observations points. f is computed using a smooth
##  kernel method.
##
##
##  Given a selection of pairs of columns of interest, this class provides the
##  following functionalities, depending on the chosen execution options:
##  * Learn: calculates density estimator f of a random vector using a smooth
##    gaussian kernel. The output metadata on port OUTPUT_MODEL is a multiblock
##    dataset containing at one vtkTable holding three columns which are for the
##    first columns the input columns of interest and for the last columns the
##    density estimators of each input pair of columns of interest.
##  * Derive: calculate normalized (as a percentage) quantiles coming from
##    Learn output. The second block of the multibloc dataset contains a
##    vtkTable holding some pairs of columns which are for the second one the
##    quantiles ordered from the stronger to the lower and for the first one
##    the correspondand quantile index.
##  * Assess: not implemented.
##  * Test: not implemented.
##

import
  vtkFiltersStatisticsModule, vtkStatisticsAlgorithm

discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkVariant"
type
  vtkHighestDensityRegionsStatistics* {.importcpp: "vtkHighestDensityRegionsStatistics", header: "vtkHighestDensityRegionsStatistics.h",
                                       bycopy.} = object of vtkStatisticsAlgorithm ## *
                                                                              ##  Helper that returns a smooth gaussian kernel of a vector of dimension two,
                                                                              ##  using its coordinates. For X = [khx, khy] and H a positive matrix of dim 2,
                                                                              ##  KH(X) = sqrt(det(H)) * K((1 / sqrt(H)) * X).
                                                                              ##  Look ComputeStandardGaussianKernel for the K kernel definition.
                                                                              ##
    vtkHighestDensityRegionsStatistics* {.
        importc: "vtkHighestDensityRegionsStatistics".}: VTK_NEWINSTANCE
    ## /@}
    ## *
    ##  Store the number of requested columns pair computed by learn method.
    ##

  vtkHighestDensityRegionsStatisticsSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHighestDensityRegionsStatistics::IsTypeOf(@)",
    header: "vtkHighestDensityRegionsStatistics.h".}
proc IsA*(this: var vtkHighestDensityRegionsStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkHighestDensityRegionsStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHighestDensityRegionsStatistics {.
    importcpp: "vtkHighestDensityRegionsStatistics::SafeDownCast(@)",
    header: "vtkHighestDensityRegionsStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHighestDensityRegionsStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHighestDensityRegionsStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHighestDensityRegionsStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHighestDensityRegionsStatistics; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkHighestDensityRegionsStatistics.h".}
proc New*(): ptr vtkHighestDensityRegionsStatistics {.
    importcpp: "vtkHighestDensityRegionsStatistics::New(@)",
    header: "vtkHighestDensityRegionsStatistics.h".}
proc Aggregate*(this: var vtkHighestDensityRegionsStatistics;
               a2: ptr vtkDataObjectCollection; a3: ptr vtkMultiBlockDataSet) {.
    importcpp: "Aggregate", header: "vtkHighestDensityRegionsStatistics.h".}
proc SetSigma*(this: var vtkHighestDensityRegionsStatistics; sigma: cdouble) {.
    importcpp: "SetSigma", header: "vtkHighestDensityRegionsStatistics.h".}
proc SetSigmaMatrix*(this: var vtkHighestDensityRegionsStatistics; s11: cdouble;
                    s12: cdouble; s21: cdouble; s22: cdouble) {.
    importcpp: "SetSigmaMatrix", header: "vtkHighestDensityRegionsStatistics.h".}
proc ComputeHDR*(this: var vtkHighestDensityRegionsStatistics;
                inObservations: ptr vtkDataArray; outDensity: ptr vtkDataArray): cdouble {.
    importcpp: "ComputeHDR", header: "vtkHighestDensityRegionsStatistics.h".}
proc ComputeHDR*(this: var vtkHighestDensityRegionsStatistics;
                inObs: ptr vtkDataArray; inPOI: ptr vtkDataArray;
                outDensity: ptr vtkDataArray): cdouble {.importcpp: "ComputeHDR",
    header: "vtkHighestDensityRegionsStatistics.h".}