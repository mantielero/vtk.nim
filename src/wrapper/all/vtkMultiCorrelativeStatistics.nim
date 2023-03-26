## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkMultiCorrelativeStatistics.h
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
##   Copyright 2010 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkMultiCorrelativeStatistics
##  @brief   A class for multivariate linear correlation
##
##
##  Given a selection of sets of columns of interest, this class provides the
##  following functionalities, depending on the operation in which it is executed:
##  * Learn: calculates means, unbiased variance and covariance estimators of
##    column pairs coefficient.
##    More precisely, Learn calculates the averages and centered
##    variance/covariance sums; if \p finalize is set to true (default),
##    the final statistics are calculated.
##    The output metadata on port OUTPUT_MODEL is a multiblock dataset containing at a minimum
##    one vtkTable holding the raw sums in a sparse matrix style. If \a finalize is
##    true, then one additional vtkTable will be present for each requested set of
##    column correlations. These additional tables contain column averages, the
##    upper triangular portion of the covariance matrix (in the upper right hand
##    portion of the table) and the Cholesky decomposition of the covariance matrix
##    (in the lower portion of the table beneath the covariance triangle).
##    The leftmost column will be a vector of column averages.
##    The last entry in the column averages vector is the number of samples.
##    As an example, consider a request for a 3-column correlation with columns
##    named ColA, ColB, and ColC.
##    The resulting table will look like this:
##    <pre>
##       Column  |Mean     |ColA     |ColB     |ColC
##       --------+---------+---------+---------+---------
##       ColA    |avg(A)   |cov(A,A) |cov(A,B) |cov(A,C)
##       ColB    |avg(B)   |chol(1,1)|cov(B,B) |cov(B,C)
##       ColC    |avg(C)   |chol(2,1)|chol(2,2)|cov(C,C)
##       Cholesky|length(A)|chol(3,1)|chol(3,2)|chol(3,3)
##    </pre>
##    The mean point and the covariance matrix can be replaced by the median point and the
##    MAD matrix (Median Absolute Deviation) thanks to the MedianAbsoluteDeviation boolean.
##    In this mode, the resulting table will look like this:
##    <pre>
##       Column  |Mean     |ColA     |ColB     |ColC
##       --------+---------+---------+---------+---------
##       ColA    |med(A)   |MAD(A,A) |MAD(A,B) |MAD(A,C)
##       ColB    |med(B)   |chol(1,1)|MAD(B,B) |MAD(B,C)
##       ColC    |med(C)   |chol(2,1)|chol(2,2)|MAD(C,C)
##       Cholesky|length(A)|chol(3,1)|chol(3,2)|chol(3,3)
##    </pre>
##    The Median Absolute Deviation is known to be more robust than the covariance. It is
##    used in the robust PCA computation for instance.
##  * Assess: given a set of results matrices as specified above in input port INPUT_MODEL and
##    tabular data on input port INPUT_DATA that contains column names matching those
##    of the tables on input port INPUT_MODEL, the assess mode computes the relative
##    deviation of each observation in port INPUT_DATA's table according to the linear
##    correlations implied by each table in port INPUT_MODEL.
##
##  @par Thanks:
##  Thanks to Philippe Pebay, Jackson Mayo, and David Thompson of
##  Sandia National Laboratories for implementing this class.
##  Updated by Philippe Pebay, Kitware SAS 2012
##  Updated by Tristan Coulange and Joachim Pouderoux, Kitware SAS 2013
##

import
  vtkFiltersStatisticsModule, vtkStatisticsAlgorithm

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkOrderStatistics"
discard "forward decl of vtkVariant"
type
  vtkMultiCorrelativeStatistics* {.importcpp: "vtkMultiCorrelativeStatistics",
                                  header: "vtkMultiCorrelativeStatistics.h",
                                  bycopy.} = object of vtkStatisticsAlgorithm
    vtkMultiCorrelativeStatistics* {.importc: "vtkMultiCorrelativeStatistics".}: VTK_NEWINSTANCE
    ## *
    ##  Storing the number of ghosts in the input to avoid computing this value multiple times.
    ##

  vtkMultiCorrelativeStatisticsSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiCorrelativeStatistics::IsTypeOf(@)",
    header: "vtkMultiCorrelativeStatistics.h".}
proc IsA*(this: var vtkMultiCorrelativeStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiCorrelativeStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiCorrelativeStatistics {.
    importcpp: "vtkMultiCorrelativeStatistics::SafeDownCast(@)",
    header: "vtkMultiCorrelativeStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiCorrelativeStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiCorrelativeStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiCorrelativeStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiCorrelativeStatistics; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMultiCorrelativeStatistics.h".}
proc New*(): ptr vtkMultiCorrelativeStatistics {.
    importcpp: "vtkMultiCorrelativeStatistics::New(@)",
    header: "vtkMultiCorrelativeStatistics.h".}
proc Aggregate*(this: var vtkMultiCorrelativeStatistics;
               a2: ptr vtkDataObjectCollection; a3: ptr vtkMultiBlockDataSet) {.
    importcpp: "Aggregate", header: "vtkMultiCorrelativeStatistics.h".}
proc SetMedianAbsoluteDeviation*(this: var vtkMultiCorrelativeStatistics; _arg: bool) {.
    importcpp: "SetMedianAbsoluteDeviation",
    header: "vtkMultiCorrelativeStatistics.h".}
## !!!Ignored construct:  virtual bool GetMedianAbsoluteDeviation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MedianAbsoluteDeviation  of  << this -> MedianAbsoluteDeviation ) ; return this -> MedianAbsoluteDeviation ; } ;
## Error: expected ';'!!!

proc MedianAbsoluteDeviationOn*(this: var vtkMultiCorrelativeStatistics) {.
    importcpp: "MedianAbsoluteDeviationOn",
    header: "vtkMultiCorrelativeStatistics.h".}
proc MedianAbsoluteDeviationOff*(this: var vtkMultiCorrelativeStatistics) {.
    importcpp: "MedianAbsoluteDeviationOff",
    header: "vtkMultiCorrelativeStatistics.h".}
  ## /@}
  ## /@{
  ## * If there is a ghost array in the input, then ghosts matching `GhostsToSkip` mask
  ##  will be skipped. It is set to 0xff by default (every ghosts types are skipped).
  ##
  ##  @sa
  ##  vtkDataSetAttributes
  ##  vtkFieldData
  ##  vtkPointData
  ##  vtkCellData
  ##
proc SetMedianAbsoluteDeviationGhostsToSkip*(
    this: var vtkMultiCorrelativeStatistics; _arg: cuchar) {.
    importcpp: "SetMedianAbsoluteDeviationGhostsToSkip",
    header: "vtkMultiCorrelativeStatistics.h".}
## !!!Ignored construct:  virtual unsigned char GetMedianAbsoluteDeviationGhostsToSkip ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostsToSkip  of  << this -> GhostsToSkip ) ; return this -> GhostsToSkip ; } ;
## Error: expected ';'!!!
