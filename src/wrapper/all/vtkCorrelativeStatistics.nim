## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkCorrelativeStatistics.h
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
## -------------------------------------------------------------------------
##   Copyright 2011 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkCorrelativeStatistics
##  @brief   A class for bivariate linear correlation
##
##
##  Given a selection of pairs of columns of interest, this class provides the
##  following functionalities, depending on the chosen execution options:
##  * Learn: calculate sample mean and M2 aggregates for each pair of variables
##    (cf. P. Pebay, Formulas for robust, one-pass parallel computation of covariances
##    and Arbitrary-Order Statistical Moments, Sandia Report SAND2008-6212, Sep 2008,
##    http://infoserve.sandia.gov/sand_doc/2008/086212.pdf for details)
##  * Derive: calculate unbiased covariance matrix estimators and its determinant,
##    linear regressions, and Pearson correlation coefficient.
##  * Assess: given an input data set, two means and a 2x2 covariance matrix,
##    mark each datum with corresponding relative deviation (2-dimensional Mahlanobis
##    distance).
##  * Test: Perform Jarque-Bera-Srivastava test of 2-d normality
##
##  @par Thanks:
##  Thanks to Philippe Pebay and David Thompson from Sandia National Laboratories
##  for implementing this class.
##  Updated by Philippe Pebay, Kitware SAS 2012
##

import
  vtkFiltersStatisticsModule, vtkStatisticsAlgorithm

discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkTable"
discard "forward decl of vtkVariant"
discard "forward decl of vtkDoubleArray"
type
  vtkCorrelativeStatistics* {.importcpp: "vtkCorrelativeStatistics",
                             header: "vtkCorrelativeStatistics.h", bycopy.} = object of vtkStatisticsAlgorithm
    vtkCorrelativeStatistics* {.importc: "vtkCorrelativeStatistics".}: VTK_NEWINSTANCE

  vtkCorrelativeStatisticsSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCorrelativeStatistics::IsTypeOf(@)",
    header: "vtkCorrelativeStatistics.h".}
proc IsA*(this: var vtkCorrelativeStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCorrelativeStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCorrelativeStatistics {.
    importcpp: "vtkCorrelativeStatistics::SafeDownCast(@)",
    header: "vtkCorrelativeStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCorrelativeStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCorrelativeStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCorrelativeStatistics; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCorrelativeStatistics.h".}
proc New*(): ptr vtkCorrelativeStatistics {.importcpp: "vtkCorrelativeStatistics::New(@)",
                                        header: "vtkCorrelativeStatistics.h".}
proc Aggregate*(this: var vtkCorrelativeStatistics; a2: ptr vtkDataObjectCollection;
               a3: ptr vtkMultiBlockDataSet) {.importcpp: "Aggregate",
    header: "vtkCorrelativeStatistics.h".}