## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPPCAStatistics.h
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
## -------------------------------------------------------------------------
##   Copyright 2011 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkPPCAStatistics
##  @brief   A class for parallel principal component analysis
##
##  vtkPPCAStatistics is vtkPCAStatistics subclass for parallel datasets.
##  It learns and derives the global statistical model on each node, but assesses each
##  individual data points on the node that owns it.
##
##  @par Thanks:
##  Thanks to Philippe Pebay, David Thompson and Janine Bennett from
##  Sandia National Laboratories for implementing this class.
##

import
  vtkFiltersParallelStatisticsModule, vtkPCAStatistics

discard "forward decl of vtkMultiProcessController"
type
  vtkPPCAStatistics* {.importcpp: "vtkPPCAStatistics",
                      header: "vtkPPCAStatistics.h", bycopy.} = object of vtkPCAStatistics
    vtkPPCAStatistics* {.importc: "vtkPPCAStatistics".}: VTK_NEWINSTANCE
    ##  Execute the parallel calculations required by the Learn option.

  vtkPPCAStatisticsSuperclass* = vtkPCAStatistics

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPPCAStatistics::IsTypeOf(@)", header: "vtkPPCAStatistics.h".}
proc IsA*(this: var vtkPPCAStatistics; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPPCAStatistics.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPPCAStatistics {.
    importcpp: "vtkPPCAStatistics::SafeDownCast(@)", header: "vtkPPCAStatistics.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPPCAStatistics :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPCAStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPPCAStatistics :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPPCAStatistics :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPPCAStatistics; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPPCAStatistics.h".}
proc New*(): ptr vtkPPCAStatistics {.importcpp: "vtkPPCAStatistics::New(@)",
                                 header: "vtkPPCAStatistics.h".}
proc SetController*(this: var vtkPPCAStatistics; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkPPCAStatistics.h".}
proc GetnameController*(this: var vtkPPCAStatistics): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPPCAStatistics.h".}
  ## /@}