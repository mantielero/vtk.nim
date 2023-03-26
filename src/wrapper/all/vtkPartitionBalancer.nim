## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPartitionBalancer.h
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
##  @class vtkPartitionBalancer
##  @brief Balances input partitioned data sets so each rank has the same number of data sets.
##
##  This filter can be applied on `vtkPartitionedDataSet` or `vtkPartitionedDataSetCollection`.
##
##  * Given an input `vtkPartitionedDataSet`, this filter adds
##  `nullptr` instances in the output `vtkPartitionedDataSet` following a pattern specified
##  as parameter. The output partitioned data set will have the same number of partitions across
##  all ranks.
##  * Given an input `vtkPartitionedDataSetCollection`, this filter is applied on each partitioned
##  data set separately, and is producing a `vtkPartitioneDataSetCollection`.
##
##  If some input partitions are `nullptr`, the output will see this partition squeezed out.
##  The filter will treat the input partitioned data set as if this `nullptr` partition was non
##  existent.
##
##  The way the output is laid out is driven by the parameter `Mode`;
##  * `Mode::Expand` generates, per partitioned data set, as many partitions as there are partitions
##  in the input across all ranks.
##  Given a valid partition (not `nullptr`) in the output partitioned data set at index
##  n in rank i, all partitioned data set of all ranks but i have a `nullptr` instance as index n.
##  Output partitions are sorted by rank number. i.e., for i < j, partition at rank i are indexed
##  before partitions of rank j. Here is an example. of what would be generated for a
##  given input. PDC holds for Partitioned Dataset Collection, and PD holds for Partitioned Dataset.
##  @verbatim
##  Input:
##  rank 0: PDC [ PD (DS0, DS1,     DS2) ] [PD (nullptr, DS100) ]
##  rank 1: PDC [ PD (DS3, nullptr, DS4) ] [PD ()               ]
##
##  Output:
##  rank 0: PDC [ PD (DS0,     DS1,     DS2,     nullptr, nullptr) ] [PD (DS100)   ]
##  rank 1: PDC [ PD (nullptr, nullptr, nullptr, DS3,     DS4)     ] [PD (nullptr) ]
##  @endverbatim
##  * `Mode::Squash` generates, per input partitioned data set, the minimum number of partitions
##  possible, appending `nullptr` in ranks lacking partitions. Using the same example as above:
##  @verbatim
##  Input:
##  rank 0: PDC [ PD (DS0, DS1,     DS2) ] [PD (nullptr, DS100) ]
##  rank 1: PDC [ PD (DS3, nullptr, DS4) ] [PD ()               ]
##
##  Output:
##  rank 0: PDC [ PD (DS0, DS1, DS2)     ] [PD (DS100)   ]
##  rank 1: PDC [ PD (DS3, DS4, nullptr) ] [PD (nullptr) ]
##  @endverbatim
##

import
  vtkFiltersParallelModule, vtkPartitionedDataSetAlgorithm

discard "forward decl of vtkMultiProcessController"
type
  vtkPartitionBalancer* {.importcpp: "vtkPartitionBalancer",
                         header: "vtkPartitionBalancer.h", bycopy.} = object of vtkPartitionedDataSetAlgorithm
    vtkPartitionBalancer* {.importc: "vtkPartitionBalancer".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPartitionBalancer {.importcpp: "vtkPartitionBalancer::New(@)",
                                    header: "vtkPartitionBalancer.h".}
type
  vtkPartitionBalancerSuperclass* = vtkPartitionedDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPartitionBalancer::IsTypeOf(@)",
    header: "vtkPartitionBalancer.h".}
proc IsA*(this: var vtkPartitionBalancer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPartitionBalancer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPartitionBalancer {.
    importcpp: "vtkPartitionBalancer::SafeDownCast(@)",
    header: "vtkPartitionBalancer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPartitionBalancer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPartitionedDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPartitionBalancer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPartitionBalancer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPartitionBalancer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPartitionBalancer.h".}
proc SetController*(this: var vtkPartitionBalancer;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkPartitionBalancer.h".}
proc GetnameController*(this: var vtkPartitionBalancer): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkPartitionBalancer.h".}
  ## /@}
  ## *
  ##  Modes defining the layout of the output.
  ##
type
  vtkPartitionBalancerMode* {.size: sizeof(cint),
                             importcpp: "vtkPartitionBalancer::Mode",
                             header: "vtkPartitionBalancer.h".} = enum
    Expand, Squash


proc SetMode*(this: var vtkPartitionBalancer; _arg: cint) {.importcpp: "SetMode",
    header: "vtkPartitionBalancer.h".}
proc GetModeMinValue*(this: var vtkPartitionBalancer): cint {.
    importcpp: "GetModeMinValue", header: "vtkPartitionBalancer.h".}
proc GetModeMaxValue*(this: var vtkPartitionBalancer): cint {.
    importcpp: "GetModeMaxValue", header: "vtkPartitionBalancer.h".}
## !!!Ignored construct:  virtual int GetMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Mode  of  << this -> Mode ) ; return this -> Mode ; } ;
## Error: expected ';'!!!

proc SetModeToExpand*(this: var vtkPartitionBalancer) {.
    importcpp: "SetModeToExpand", header: "vtkPartitionBalancer.h".}
proc SetModeToSquash*(this: var vtkPartitionBalancer) {.
    importcpp: "SetModeToSquash", header: "vtkPartitionBalancer.h".}