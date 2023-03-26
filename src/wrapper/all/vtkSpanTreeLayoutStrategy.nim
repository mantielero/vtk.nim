## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSpanTreeLayoutStrategy.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##   This software is distributed WITHOUT ANY WARRANTY; without even
##   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##   PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##  Copyright 2008 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##  the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkSpanTreeLayoutStrategy
##
##  vtkSpanTreeLayout is a strategy for drawing directed graphs that
##  works by first extracting a spanning tree (more accurately, a
##  spanning forest), and using this both to position graph vertices
##  and to plan the placement of non-tree edges.  The latter are drawn
##  with the aid of edge points to produce a tidy drawing.
##
##  The approach is best suited to "quasi-trees", graphs where the number
##  of edges is of the same order as the number of nodes; it is less well
##  suited to denser graphs.  The boolean flag DepthFirstSpanningTree
##  determines whether a depth-first or breadth-first strategy is used to
##  construct the underlying forest, and the choice of strategy affects
##  the output layout significantly.  Informal experiments suggest that
##  the breadth-first strategy is better for denser graphs.
##
##  Different layouts could also be produced by plugging in alternative
##  tree layout strategies.  To work with the method of routing non-tree
##  edges, any strategy should draw a tree so that levels are equally
##  spaced along the z-axis, precluding for example the use of a radial
##  or balloon layout.
##
##  vtkSpanTreeLayout is based on an approach to 3D graph layout first
##  developed as part of the "tulip" tool by Dr. David Auber at LaBRI,
##  U.Bordeaux: see www.tulip-software.org
##
##  This implementation departs from the original version in that:
##  (a) it is reconstructed to use Titan/VTK data structures;
##  (b) it uses a faster method for dealing with non-tree edges,
##      requiring at most two edge points per edge
##  (c) allows for plugging in different tree layout methods
##  (d) allows selection of two different strategies for building
##      the underlying layout tree, which can yield significantly
##      different results depending on the data.
##
##  @par Thanks:
##  Thanks to David Duke from the University of Leeds for providing this
##  implementation.
##

import
  vtkGraphLayoutStrategy, vtkInfovisLayoutModule

type
  vtkSpanTreeLayoutStrategy* {.importcpp: "vtkSpanTreeLayoutStrategy",
                              header: "vtkSpanTreeLayoutStrategy.h", bycopy.} = object of vtkGraphLayoutStrategy
    vtkSpanTreeLayoutStrategy* {.importc: "vtkSpanTreeLayoutStrategy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSpanTreeLayoutStrategy {.
    importcpp: "vtkSpanTreeLayoutStrategy::New(@)",
    header: "vtkSpanTreeLayoutStrategy.h".}
type
  vtkSpanTreeLayoutStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSpanTreeLayoutStrategy::IsTypeOf(@)",
    header: "vtkSpanTreeLayoutStrategy.h".}
proc IsA*(this: var vtkSpanTreeLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSpanTreeLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSpanTreeLayoutStrategy {.
    importcpp: "vtkSpanTreeLayoutStrategy::SafeDownCast(@)",
    header: "vtkSpanTreeLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSpanTreeLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSpanTreeLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSpanTreeLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSpanTreeLayoutStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSpanTreeLayoutStrategy.h".}
proc SetDepthFirstSpanningTree*(this: var vtkSpanTreeLayoutStrategy; _arg: bool) {.
    importcpp: "SetDepthFirstSpanningTree", header: "vtkSpanTreeLayoutStrategy.h".}
## !!!Ignored construct:  virtual bool GetDepthFirstSpanningTree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DepthFirstSpanningTree  of  << this -> DepthFirstSpanningTree ) ; return this -> DepthFirstSpanningTree ; } ;
## Error: expected ';'!!!

proc DepthFirstSpanningTreeOn*(this: var vtkSpanTreeLayoutStrategy) {.
    importcpp: "DepthFirstSpanningTreeOn", header: "vtkSpanTreeLayoutStrategy.h".}
proc DepthFirstSpanningTreeOff*(this: var vtkSpanTreeLayoutStrategy) {.
    importcpp: "DepthFirstSpanningTreeOff", header: "vtkSpanTreeLayoutStrategy.h".}
  ## /@}
  ## *
  ##  Perform the layout.
  ##
proc Layout*(this: var vtkSpanTreeLayoutStrategy) {.importcpp: "Layout",
    header: "vtkSpanTreeLayoutStrategy.h".}