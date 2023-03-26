## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCompositeDataProbeFilter.h
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
##  @class   vtkCompositeDataProbeFilter
##  @brief   subclass of vtkProbeFilter which supports
##  composite datasets in the input.
##
##  vtkCompositeDataProbeFilter supports probing into multi-group datasets.
##  It sequentially probes through each concrete dataset within the composite
##  probing at only those locations at which there were no hits when probing
##  earlier datasets. For Hierarchical datasets, this traversal through leaf
##  datasets is done in reverse order of levels i.e. highest level first.
##  To keep the ability of using locators with a composite input, we use a map that
##  maps a dataset belonging to the composite input to its FindCell strategy.
##
##  When dealing with composite datasets, partial arrays are common i.e.
##  data-arrays that are not available in all of the blocks. By default, this
##  filter only passes those point and cell data-arrays that are available in all
##  the blocks i.e. partial array are removed.
##  When PassPartialArrays is turned on, this behavior is changed to take a
##  union of all arrays present thus partial arrays are passed as well. However,
##  for composite dataset input, this filter still produces a non-composite
##  output. For all those locations in a block of where a particular data array
##  is missing, this filter uses vtkMath::Nan() for double and float arrays,
##  while 0 for all other types of arrays i.e int, char etc.
##

import
  vtkFiltersCoreModule, vtkProbeFilter

discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkFindCellStrategy"
discard "forward decl of vtkSmartPointer"
type
  vtkCompositeDataProbeFilter* {.importcpp: "vtkCompositeDataProbeFilter",
                                header: "vtkCompositeDataProbeFilter.h", bycopy.} = object of vtkProbeFilter
    vtkCompositeDataProbeFilter* {.importc: "vtkCompositeDataProbeFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCompositeDataProbeFilter {.
    importcpp: "vtkCompositeDataProbeFilter::New(@)",
    header: "vtkCompositeDataProbeFilter.h".}
type
  vtkCompositeDataProbeFilterSuperclass* = vtkProbeFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCompositeDataProbeFilter::IsTypeOf(@)",
    header: "vtkCompositeDataProbeFilter.h".}
proc IsA*(this: var vtkCompositeDataProbeFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCompositeDataProbeFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCompositeDataProbeFilter {.
    importcpp: "vtkCompositeDataProbeFilter::SafeDownCast(@)",
    header: "vtkCompositeDataProbeFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCompositeDataProbeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCompositeDataProbeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCompositeDataProbeFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCompositeDataProbeFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkCompositeDataProbeFilter.h".}
proc SetPassPartialArrays*(this: var vtkCompositeDataProbeFilter; _arg: bool) {.
    importcpp: "SetPassPartialArrays", header: "vtkCompositeDataProbeFilter.h".}
## !!!Ignored construct:  virtual bool GetPassPartialArrays ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassPartialArrays  of  << this -> PassPartialArrays ) ; return this -> PassPartialArrays ; } ;
## Error: expected ';'!!!

proc PassPartialArraysOn*(this: var vtkCompositeDataProbeFilter) {.
    importcpp: "PassPartialArraysOn", header: "vtkCompositeDataProbeFilter.h".}
proc PassPartialArraysOff*(this: var vtkCompositeDataProbeFilter) {.
    importcpp: "PassPartialArraysOff", header: "vtkCompositeDataProbeFilter.h".}
  ## /@}
  ## *
  ##  Set the structure mapping a dataset belonging to the composite input to
  ##  its FindCell strategy. If a leaf is not a key of the provided map then no
  ##  strategy will be used for this leaf.
  ##
proc SetFindCellStrategyMap*(this: var vtkCompositeDataProbeFilter; map: map[
    ptr vtkDataSet, vtkSmartPointer[vtkFindCellStrategy]]) {.
    importcpp: "SetFindCellStrategyMap", header: "vtkCompositeDataProbeFilter.h".}