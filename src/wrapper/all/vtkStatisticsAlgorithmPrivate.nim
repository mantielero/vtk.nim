## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkStatisticsAlgorithmPrivate.h
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
##  @class   vtkDescriptiveStatistics
##  @brief   Private implementation for bivariate
##  statistics algorithms.
##
##
##  The main purpose of this class is to avoid exposure of STL container
##  through the APIs of the vtkStatistics classes APIs
##
##  @par Thanks:
##  Thanks to Philippe Pebay and David Thompson from Sandia National Laboratories
##  for implementing this class.
##

import
  vtkStdString

type
  vtkStatisticsAlgorithmPrivate* {.importcpp: "vtkStatisticsAlgorithmPrivate",
                                  header: "vtkStatisticsAlgorithmPrivate.h",
                                  bycopy.} = object ##  --------------------------------------------------------------------
                                                 ## *
                                                 ##  Empty current set of requests
                                                 ##
    Requests* {.importc: "Requests".}: set[set[vtkStdString]]
    Buffer* {.importc: "Buffer".}: set[vtkStdString]


proc ResetRequests*(this: var vtkStatisticsAlgorithmPrivate) {.
    importcpp: "ResetRequests", header: "vtkStatisticsAlgorithmPrivate.h".}
proc ResetBuffer*(this: var vtkStatisticsAlgorithmPrivate): cint {.
    importcpp: "ResetBuffer", header: "vtkStatisticsAlgorithmPrivate.h".}
proc SetBufferColumnStatus*(this: var vtkStatisticsAlgorithmPrivate;
                           colName: cstring; status: cint): cint {.
    importcpp: "SetBufferColumnStatus", header: "vtkStatisticsAlgorithmPrivate.h".}
proc AddBufferToRequests*(this: var vtkStatisticsAlgorithmPrivate): cint {.
    importcpp: "AddBufferToRequests", header: "vtkStatisticsAlgorithmPrivate.h".}
proc AddColumnToRequests*(this: var vtkStatisticsAlgorithmPrivate; col: cstring): cint {.
    importcpp: "AddColumnToRequests", header: "vtkStatisticsAlgorithmPrivate.h".}
proc AddColumnPairToRequests*(this: var vtkStatisticsAlgorithmPrivate;
                             cola: cstring; colb: cstring): cint {.
    importcpp: "AddColumnPairToRequests",
    header: "vtkStatisticsAlgorithmPrivate.h".}
proc GetNumberOfRequests*(this: var vtkStatisticsAlgorithmPrivate): vtkIdType {.
    importcpp: "GetNumberOfRequests", header: "vtkStatisticsAlgorithmPrivate.h".}
proc GetNumberOfColumnsForRequest*(this: var vtkStatisticsAlgorithmPrivate;
                                  r: vtkIdType): vtkIdType {.
    importcpp: "GetNumberOfColumnsForRequest",
    header: "vtkStatisticsAlgorithmPrivate.h".}
proc GetColumnForRequest*(this: var vtkStatisticsAlgorithmPrivate; r: vtkIdType;
                         c: vtkIdType; columnName: var vtkStdString): bool {.
    importcpp: "GetColumnForRequest", header: "vtkStatisticsAlgorithmPrivate.h".}
##  VTK-HeaderTest-Exclude: vtkStatisticsAlgorithmPrivate.h
