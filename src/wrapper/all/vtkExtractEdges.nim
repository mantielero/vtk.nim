## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractEdges.h
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
##  @class   vtkExtractEdges
##  @brief   extract cell edges from any type of dataset
##
##  vtkExtractEdges is a filter to extract edges from a dataset. Edges
##  are extracted as lines in an output vtkPolyData.
##
##  There are two modes of extraction depending on the data member
##  UseAllPoints, If UseAllPoints is enabled, then the output points contain
##  all of the input points, and the point ids of the output lines (i.e.,
##  edges) remain unchanged from the input point numbering.  If UseAllPoints
##  is disabled (which is the default), then the numbering of the output points
##  may change, and any unused points are omitted from the filter output.
##
##  @warning
##  If present in the filter input, output cell data is produced for the
##  output edges. Since an edge may be used by more than one cell, this is
##  potentially an undefined behavior. To ensure deterministic output, the
##  cell data from the cell with smallest cell id is copied to the output
##  edge.
##
##  @sa
##  vtkFeatureEdges
##

import
  vtkFiltersCoreModule, vtkIncrementalPointLocator, vtkPolyDataAlgorithm

type
  vtkExtractEdges* {.importcpp: "vtkExtractEdges", header: "vtkExtractEdges.h",
                    bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                         ## *
                                                         ##  Standard methods for instantiation, obtaining type information, and
                                                         ##  printing the state of an instance.
                                                         ##  default an instance of vtkMergePoints is used.
                                                         ##
    vtkExtractEdges* {.importc: "vtkExtractEdges".}: VTK_NEWINSTANCE
    ##  Usual pipeline methods


proc New*(): ptr vtkExtractEdges {.importcpp: "vtkExtractEdges::New(@)",
                               header: "vtkExtractEdges.h".}
type
  vtkExtractEdgesSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExtractEdges::IsTypeOf(@)", header: "vtkExtractEdges.h".}
proc IsA*(this: var vtkExtractEdges; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkExtractEdges.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExtractEdges {.
    importcpp: "vtkExtractEdges::SafeDownCast(@)", header: "vtkExtractEdges.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExtractEdges :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractEdges :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractEdges :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExtractEdges; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExtractEdges.h".}
proc SetLocator*(this: var vtkExtractEdges; _arg: ptr vtkIncrementalPointLocator) {.
    importcpp: "SetLocator", header: "vtkExtractEdges.h".}
proc Getname*(this: var vtkExtractEdges): ptr vtkIncrementalPointLocator {.
    importcpp: "Getname", header: "vtkExtractEdges.h".}
  ## /@}
  ## *
  ##  Create default locator. Used to create one when none is specified.
  ##
proc CreateDefaultLocator*(this: var vtkExtractEdges) {.
    importcpp: "CreateDefaultLocator", header: "vtkExtractEdges.h".}
proc SetUseAllPoints*(this: var vtkExtractEdges; _arg: bool) {.
    importcpp: "SetUseAllPoints", header: "vtkExtractEdges.h".}
## !!!Ignored construct:  virtual bool GetUseAllPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseAllPoints  of  << this -> UseAllPoints ) ; return this -> UseAllPoints ; } ;
## Error: expected ';'!!!

proc UseAllPointsOn*(this: var vtkExtractEdges) {.importcpp: "UseAllPointsOn",
    header: "vtkExtractEdges.h".}
proc UseAllPointsOff*(this: var vtkExtractEdges) {.importcpp: "UseAllPointsOff",
    header: "vtkExtractEdges.h".}
  ## /@}
  ## *
  ##  Return the modified time also considering the locator since it may be
  ##  modified independent of this filter.
  ##
proc GetMTime*(this: var vtkExtractEdges): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkExtractEdges.h".}