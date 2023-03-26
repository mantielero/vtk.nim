## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticCellLinksTemplate.h
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
##  @class   vtkStaticCellLinksTemplate
##  @brief   object represents upward pointers from points
##  to list of cells using each point (template implementation)
##
##
##  vtkStaticCellLinksTemplate is a supplemental object to vtkCellArray and
##  vtkCellTypes, enabling access to the list of cells using each point.
##  vtkStaticCellLinksTemplate is an array of links, each link represents a
##  list of cell ids using a particular point. The information provided by
##  this object can be used to determine neighbors (e.g., face neighbors,
##  edge neighbors)and construct other local topological information. This
##  class is a faster implementation of vtkCellLinks. However, it cannot be
##  incrementally constructed; it is meant to be constructed once (statically)
##  and must be rebuilt if the cells change.
##
##  This is a templated implementation for vtkStaticCellLinks. The reason for
##  the templating is to gain performance and reduce memory by using smaller
##  integral types to represent ids. For example, if the maximum id can be
##  represented by an int (as compared to a vtkIdType), it is possible to
##  reduce memory requirements by half and increase performance. This
##  templated class can be used directly; alternatively the
##  non-templated class vtkStaticCellLinks can be used for convenience;
##  although it uses vtkIdType and so will lose some speed and memory
##  advantages.
##
##  @sa
##  vtkAbstractCellLinks vtkCellLinks vtkStaticCellLinks
##

discard "forward decl of vtkDataSet"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkExplicitStructuredGrid"
discard "forward decl of vtkCellArray"
import
  vtkAbstractCellLinks

type
  vtkStaticCellLinksTemplate*[TIds] {.importcpp: "vtkStaticCellLinksTemplate<\'0>",
                                     header: "vtkStaticCellLinksTemplate.h",
                                     bycopy.} = object ## /@{
                                                    ## *
                                                    ##  Instantiate and destructor methods.
                                                    ##
                                                    ##  The various templated data members
    ##  These point to the core data structures
    ##  contiguous runs of cell ids
    ##  offsets for each point into the links array
    ##  Support for execution


proc constructvtkStaticCellLinksTemplate*[TIds](): vtkStaticCellLinksTemplate[TIds] {.
    constructor, importcpp: "vtkStaticCellLinksTemplate<\'*0>(@)",
    header: "vtkStaticCellLinksTemplate.h".}
proc destroyvtkStaticCellLinksTemplate*[TIds](
    this: var vtkStaticCellLinksTemplate[TIds]) {.
    importcpp: "#.~vtkStaticCellLinksTemplate()",
    header: "vtkStaticCellLinksTemplate.h".}
proc Initialize*[TIds](this: var vtkStaticCellLinksTemplate[TIds]) {.
    importcpp: "Initialize", header: "vtkStaticCellLinksTemplate.h".}
proc BuildLinks*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                      ds: ptr vtkDataSet) {.importcpp: "BuildLinks",
    header: "vtkStaticCellLinksTemplate.h".}
proc BuildLinks*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                      pd: ptr vtkPolyData) {.importcpp: "BuildLinks",
    header: "vtkStaticCellLinksTemplate.h".}
proc BuildLinks*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                      ugrid: ptr vtkUnstructuredGrid) {.importcpp: "BuildLinks",
    header: "vtkStaticCellLinksTemplate.h".}
proc BuildLinks*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                      esgrid: ptr vtkExplicitStructuredGrid) {.
    importcpp: "BuildLinks", header: "vtkStaticCellLinksTemplate.h".}
proc SerialBuildLinks*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                            numPts: vtkIdType; numCells: vtkIdType;
                            cellArray: ptr vtkCellArray) {.
    importcpp: "SerialBuildLinks", header: "vtkStaticCellLinksTemplate.h".}
proc ThreadedBuildLinks*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                              numPts: vtkIdType; numCells: vtkIdType;
                              cellArray: ptr vtkCellArray) {.
    importcpp: "ThreadedBuildLinks", header: "vtkStaticCellLinksTemplate.h".}
proc GetNumberOfCells*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                            ptId: vtkIdType): TIds {.importcpp: "GetNumberOfCells",
    header: "vtkStaticCellLinksTemplate.h".}
proc GetNcells*[TIds](this: var vtkStaticCellLinksTemplate[TIds]; ptId: vtkIdType): vtkIdType {.
    importcpp: "GetNcells", header: "vtkStaticCellLinksTemplate.h".}
proc MatchesCell*[TIds; TGivenIds](this: var vtkStaticCellLinksTemplate[TIds];
                                 npts: TGivenIds; pts: ptr TGivenIds): bool {.
    importcpp: "MatchesCell", header: "vtkStaticCellLinksTemplate.h".}
proc GetCells*[TIds](this: var vtkStaticCellLinksTemplate[TIds]; ptId: vtkIdType): ptr TIds {.
    importcpp: "GetCells", header: "vtkStaticCellLinksTemplate.h".}
proc GetCells*[TIds](this: var vtkStaticCellLinksTemplate[TIds]; npts: vtkIdType;
                    pts: ptr vtkIdType; cells: ptr vtkIdList) {.importcpp: "GetCells",
    header: "vtkStaticCellLinksTemplate.h".}
proc GetLinksSize*[TIds](this: var vtkStaticCellLinksTemplate[TIds]): TIds {.
    importcpp: "GetLinksSize", header: "vtkStaticCellLinksTemplate.h".}
proc GetOffset*[TIds](this: var vtkStaticCellLinksTemplate[TIds]; ptId: vtkIdType): TIds {.
    importcpp: "GetOffset", header: "vtkStaticCellLinksTemplate.h".}
proc GetActualMemorySize*[TIds](this: var vtkStaticCellLinksTemplate[TIds]): culong {.
    importcpp: "GetActualMemorySize", header: "vtkStaticCellLinksTemplate.h".}
proc DeepCopy*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                    src: ptr vtkAbstractCellLinks) {.importcpp: "DeepCopy",
    header: "vtkStaticCellLinksTemplate.h".}
proc SelectCells*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                       minMaxDegree: array[2, vtkIdType]; cellSelection: ptr cuchar) {.
    importcpp: "SelectCells", header: "vtkStaticCellLinksTemplate.h".}
proc SetSequentialProcessing*[TIds](this: var vtkStaticCellLinksTemplate[TIds];
                                   seq: vtkTypeBool) {.
    importcpp: "SetSequentialProcessing", header: "vtkStaticCellLinksTemplate.h".}
proc GetSequentialProcessing*[TIds](this: var vtkStaticCellLinksTemplate[TIds]): vtkTypeBool {.
    importcpp: "GetSequentialProcessing", header: "vtkStaticCellLinksTemplate.h".}
import
  vtkStaticCellLinksTemplate

##  VTK-HeaderTest-Exclude: vtkStaticCellLinksTemplate.h
