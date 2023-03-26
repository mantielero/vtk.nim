## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkKMeansStatistics.h
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
##  @class   vtkKMeansStatistics
##  @brief   A class for KMeans clustering
##
##
##  This class takes as input an optional vtkTable on port LEARN_PARAMETERS
##  specifying initial  set(s) of cluster values of the following form:
##  <pre>
##            K     | Col1            |  ...    | ColN
##       -----------+-----------------+---------+---------------
##            M     |clustCoord(1, 1) |  ...    | clustCoord(1, N)
##            M     |clustCoord(2, 1) |  ...    | clustCoord(2, N)
##            .     |       .         |   .     |        .
##            .     |       .         |   .     |        .
##            .     |       .         |   .     |        .
##            M     |clustCoord(M, 1) |  ...    | clustCoord(M, N)
##            L     |clustCoord(1, 1) |  ...    | clustCoord(1, N)
##            L     |clustCoord(2, 1) |  ...    | clustCoord(2, N)
##            .     |       .         |   .     |        .
##            .     |       .         |   .     |        .
##            .     |       .         |   .     |        .
##            L     |clustCoord(L, 1) |  ...    | clustCoord(L, N)
##  </pre>
##
##  Because the desired value of K is often not known in advance and the
##  results of the algorithm are dependent on the initial cluster centers,
##  we provide a mechanism for the user to test multiple runs or sets of cluster centers
##  within a single call to the Learn phase.  The first column of the table identifies
##  the number of clusters K in the particular run (the entries in this column should be
##  of type vtkIdType), while the remaining columns are a
##  subset of the columns contained in the table on port INPUT_DATA.  We require that
##  all user specified clusters be of the same dimension N and consequently, that the
##  LEARN_PARAMETERS table have N+1 columns. Due to this restriction, only one request
##  can be processed for each call to the Learn phase and subsequent requests are
##  silently ignored. Note that, if the first column of the LEARN_PARAMETERS table is not
##  of type vtkIdType, then the table will be ignored and a single run will be performed using
##  the first DefaultNumberOfClusters input data observations as initial cluster centers.
##
##  When the user does not supply an initial set of clusters, then the first
##  DefaultNumberOfClusters input data observations are used as initial cluster
##  centers and a single run is performed.
##
##
##  This class provides the following functionalities, depending on the operation
##  in which it is executed:
##  * Learn: calculates new cluster centers for each run.  The output metadata on
##    port OUTPUT_MODEL is a multiblock dataset containing at a minimum
##    one vtkTable with columns specifying the following for each run:
##    the run ID, number of clusters, number of iterations required for convergence,
##    total error associated with the cluster (sum of squared Euclidean distance from each
##  observation to its nearest cluster center), the cardinality of the cluster, and the new cluster
##  coordinates.
##
##  * Derive:  An additional vtkTable is stored in the multiblock dataset output on port
##  OUTPUT_MODEL. This table contains columns that store for each run: the runID, number of clusters,
##    total error for all clusters in the run, local rank, and global rank.
##    The local rank is computed by comparing squared Euclidean errors of all runs with
##    the same number of clusters.  The global rank is computed analagously across all runs.
##
##  * Assess: This requires a multiblock dataset (as computed from Learn and Derive) on input port
##  INPUT_MODEL and tabular data on input port INPUT_DATA that contains column names matching those
##    of the tables on input port INPUT_MODEL. The assess mode reports the closest cluster center
##    and associated squared Euclidean distance of each observation in port INPUT_DATA's table to the
##  cluster centers for each run in the multiblock dataset provided on port INPUT_MODEL.
##
##  The code can handle a wide variety of data types as it operates on vtkAbstractArrays
##  and is not limited to vtkDataArrays.  A default distance functor that
##  computes the sum of the squares of the Euclidean distance between two objects is provided
##  (vtkKMeansDistanceFunctor). The default distance functor can be overridden to use alternative
##  distance metrics.
##
##  @par Thanks:
##  Thanks to Janine Bennett, David Thompson, and Philippe Pebay of
##  Sandia National Laboratories for implementing this class.
##  Updated by Philippe Pebay, Kitware SAS 2012
##

import
  vtkFiltersStatisticsModule, vtkStatisticsAlgorithm

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkKMeansDistanceFunctor"
discard "forward decl of vtkMultiBlockDataSet"
type
  vtkKMeansStatistics* {.importcpp: "vtkKMeansStatistics",
                        header: "vtkKMeansStatistics.h", bycopy.} = object of vtkStatisticsAlgorithm
    vtkKMeansStatistics* {.importc: "vtkKMeansStatistics".}: VTK_NEWINSTANCE
    ## *
    ##  This is the name of the column that specifies the number of clusters in each run.
    ##  This is only used if the user has not specified initial clusters.
    ##
    ## *
    ##  This is the maximum number of iterations allowed if the new cluster centers have not yet
    ##  converged.
    ##
    ## *
    ##  This is the percentage of data elements that swap cluster IDs
    ##
    ## *
    ##  This is the Distance functor.  The default is Euclidean distance, however this can be
    ##  overridden.
    ##
    ## *
    ##  Number of ghosts in input data.
    ##

  vtkKMeansStatisticsSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkKMeansStatistics::IsTypeOf(@)", header: "vtkKMeansStatistics.h".}
proc IsA*(this: var vtkKMeansStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkKMeansStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkKMeansStatistics {.
    importcpp: "vtkKMeansStatistics::SafeDownCast(@)",
    header: "vtkKMeansStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkKMeansStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKMeansStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKMeansStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkKMeansStatistics; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkKMeansStatistics.h".}
proc New*(): ptr vtkKMeansStatistics {.importcpp: "vtkKMeansStatistics::New(@)",
                                   header: "vtkKMeansStatistics.h".}
proc SetDistanceFunctor*(this: var vtkKMeansStatistics;
                        a2: ptr vtkKMeansDistanceFunctor) {.
    importcpp: "SetDistanceFunctor", header: "vtkKMeansStatistics.h".}
proc GetnameDistanceFunctor*(this: var vtkKMeansStatistics): ptr vtkKMeansDistanceFunctor {.
    importcpp: "GetnameDistanceFunctor", header: "vtkKMeansStatistics.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the \a DefaultNumberOfClusters, used when no initial cluster coordinates are specified.
  ##
proc SetDefaultNumberOfClusters*(this: var vtkKMeansStatistics; _arg: cint) {.
    importcpp: "SetDefaultNumberOfClusters", header: "vtkKMeansStatistics.h".}
## !!!Ignored construct:  virtual int GetDefaultNumberOfClusters ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultNumberOfClusters  of  << this -> DefaultNumberOfClusters ) ; return this -> DefaultNumberOfClusters ; } ;
## Error: expected ';'!!!

proc SetKValuesArrayName*(this: var vtkKMeansStatistics; _arg: cstring) {.
    importcpp: "SetKValuesArrayName", header: "vtkKMeansStatistics.h".}
proc GetKValuesArrayName*(this: var vtkKMeansStatistics): cstring {.
    importcpp: "GetKValuesArrayName", header: "vtkKMeansStatistics.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the MaxNumIterations used to terminate iterations on
  ##  cluster center coordinates when the relative tolerance can not be met.
  ##
proc SetDefaultNumberOfClustersMaxNumIterations*(this: var vtkKMeansStatistics;
    _arg: cint) {.importcpp: "SetDefaultNumberOfClustersMaxNumIterations",
                header: "vtkKMeansStatistics.h".}
## !!!Ignored construct:  virtual int GetDefaultNumberOfClustersMaxNumIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumIterations  of  << this -> MaxNumIterations ) ; return this -> MaxNumIterations ; } ;
## Error: expected ';'!!!

proc SetDefaultNumberOfClustersMaxNumIterationsTolerance*(
    this: var vtkKMeansStatistics; _arg: cdouble) {.
    importcpp: "SetDefaultNumberOfClustersMaxNumIterationsTolerance",
    header: "vtkKMeansStatistics.h".}
## !!!Ignored construct:  virtual double GetDefaultNumberOfClustersMaxNumIterationsTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc Aggregate*(this: var vtkKMeansStatistics; a2: ptr vtkDataObjectCollection;
               a3: ptr vtkMultiBlockDataSet) {.importcpp: "Aggregate",
    header: "vtkKMeansStatistics.h".}
proc SetParameter*(this: var vtkKMeansStatistics; parameter: cstring; index: cint;
                  value: vtkVariant): bool {.importcpp: "SetParameter",
    header: "vtkKMeansStatistics.h".}
proc SetDefaultNumberOfClustersMaxNumIterationsToleranceGhostsToSkip*(
    this: var vtkKMeansStatistics; _arg: cuchar) {.importcpp: "SetDefaultNumberOfClustersMaxNumIterationsToleranceGhostsToSkip",
    header: "vtkKMeansStatistics.h".}
## !!!Ignored construct:  virtual unsigned char GetDefaultNumberOfClustersMaxNumIterationsToleranceGhostsToSkip ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostsToSkip  of  << this -> GhostsToSkip ) ; return this -> GhostsToSkip ; } ;
## Error: expected ';'!!!
