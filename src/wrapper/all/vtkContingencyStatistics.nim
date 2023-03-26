## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkContingencyStatistics.h
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
##  @class   vtkContingencyStatistics
##  @brief   A class for bivariate correlation contigency
##  tables, conditional probabilities, and information entropy
##
##
##  Given a pair of columns of interest, this class provides the
##  following functionalities, depending on the operation in which it is executed:
##  * Learn: calculate contigency tables and corresponding discrete joint
##    probability distribution.
##  * Derive: calculate conditional probabilities, information entropies, and
##    pointwise mutual information.
##  * Assess: given two columns of interest with the same number of entries as
##    input in port INPUT_DATA, and a corresponding bivariate probability distribution,
##  * Test: calculate Chi-square independence statistic and, if VTK to R interface is available,
##    retrieve corresponding p-value for independence testing.
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
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkDoubleArray"
type
  vtkContingencyStatistics* {.importcpp: "vtkContingencyStatistics",
                             header: "vtkContingencyStatistics.h", bycopy.} = object of vtkStatisticsAlgorithm
    vtkContingencyStatistics* {.importc: "vtkContingencyStatistics".}: VTK_NEWINSTANCE

  vtkContingencyStatisticsSuperclass* = vtkStatisticsAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkContingencyStatistics::IsTypeOf(@)",
    header: "vtkContingencyStatistics.h".}
proc IsA*(this: var vtkContingencyStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkContingencyStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkContingencyStatistics {.
    importcpp: "vtkContingencyStatistics::SafeDownCast(@)",
    header: "vtkContingencyStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkContingencyStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkStatisticsAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkContingencyStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkContingencyStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkContingencyStatistics; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkContingencyStatistics.h".}
proc New*(): ptr vtkContingencyStatistics {.importcpp: "vtkContingencyStatistics::New(@)",
                                        header: "vtkContingencyStatistics.h".}
proc Aggregate*(this: var vtkContingencyStatistics; a2: ptr vtkDataObjectCollection;
               a3: ptr vtkMultiBlockDataSet) {.importcpp: "Aggregate",
    header: "vtkContingencyStatistics.h".}