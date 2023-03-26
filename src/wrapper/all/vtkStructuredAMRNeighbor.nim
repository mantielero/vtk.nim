## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkStructuredAMRNeighbor.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkStructuredAMRNeighbor
##  @brief   An internal, light-weight object used to store neighbor information for
##   AMR grids.
##
##  @sa
##   vtkStructuredNeighbor vtkStructuredAMRGridConnectivity
##

import
  vtkFiltersGeometryModule, vtkStructuredNeighbor

type
  vtkStructuredAMRNeighbor* {.importcpp: "vtkStructuredAMRNeighbor",
                             header: "vtkStructuredAMRNeighbor.h", bycopy.} = object of vtkStructuredNeighbor ##  An enum that defines the neighbor relationship between the 2 grids.
    GridOverlapExtent* {.importc: "GridOverlapExtent".}: array[6, cint] ##  The overlap extent w.r.t. this grid
    GridLevel* {.importc: "GridLevel".}: cint ##  The level of the grid that has this neighbor
    NeighborLevel* {.importc: "NeighborLevel".}: cint ##  The level of the neighboring grid
    RelationShip* {.importc: "RelationShip".}: cint ##  The relationship of the grid with this neighbor
                                                ## *
                                                ##  Default constructor.
                                                ##

  vtkStructuredAMRNeighborNeighborRelationship* {.size: sizeof(cint),
      importcpp: "vtkStructuredAMRNeighbor::NeighborRelationship",
      header: "vtkStructuredAMRNeighbor.h".} = enum
    PARENT,                   ##  Neighbor fully contains this grid
    PARTIALLY_OVERLAPPING_PARENT, ##  Neighbor partially contains this grid
    CHILD,                    ##  This grid fully contains the neighbor
    PARTIALLY_OVERLAPPING_CHILD, ##  This grid partially contains the neighbor
    SAME_LEVEL_SIBLING,       ##  Grids are adjacent at the same level
    COARSE_TO_FINE_SIBLING,   ##  Grid is adjacent with a finer neighbor
    FINE_TO_COARSE_SIBLING,   ##  Grid is adjacent with a coarser neighbor
    UNDEFINED


proc constructvtkStructuredAMRNeighbor*(): vtkStructuredAMRNeighbor {.constructor,
    importcpp: "vtkStructuredAMRNeighbor(@)", header: "vtkStructuredAMRNeighbor.h".}
proc constructvtkStructuredAMRNeighbor*(gridLevel: cint; neiID: cint;
                                       neighborLevel: cint;
                                       gridOverlap: array[6, cint];
                                       neiOverlap: array[6, cint];
                                       orient: array[3, cint]; relationShip: cint): vtkStructuredAMRNeighbor {.
    constructor, importcpp: "vtkStructuredAMRNeighbor(@)",
    header: "vtkStructuredAMRNeighbor.h".}
proc constructvtkStructuredAMRNeighbor*(N: vtkStructuredAMRNeighbor): vtkStructuredAMRNeighbor {.
    constructor, importcpp: "vtkStructuredAMRNeighbor(@)",
    header: "vtkStructuredAMRNeighbor.h".}
proc destroyvtkStructuredAMRNeighbor*(this: var vtkStructuredAMRNeighbor) {.
    importcpp: "#.~vtkStructuredAMRNeighbor()",
    header: "vtkStructuredAMRNeighbor.h".}
proc GetReceiveExtentOnGrid*(this: var vtkStructuredAMRNeighbor; ng: cint;
                            gridExtent: array[6, cint]; ext: array[6, cint]) {.
    importcpp: "GetReceiveExtentOnGrid", header: "vtkStructuredAMRNeighbor.h".}
proc GetRelationShipString*(this: var vtkStructuredAMRNeighbor): string {.
    importcpp: "GetRelationShipString", header: "vtkStructuredAMRNeighbor.h".}
proc ComputeSendAndReceiveExtent*(this: var vtkStructuredAMRNeighbor;
                                 gridRealExtent: array[6, cint];
                                 gridGhostedExtent: array[6, cint];
                                 neiRealExtent: array[6, cint];
                                 WholeExtent: array[6, cint]; N: cint) {.
    importcpp: "ComputeSendAndReceiveExtent", header: "vtkStructuredAMRNeighbor.h".}
##  VTK-HeaderTest-Exclude: vtkStructuredAMRNeighbor.h
