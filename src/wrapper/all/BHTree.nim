## =========================================================================
##
## Copyright (c) 2007, Los Alamos National Security, LLC
##
## All rights reserved.
##
## Copyright 2007. Los Alamos National Security, LLC.
## This software was produced under U.S. Government contract DE-AC52-06NA25396
## for Los Alamos National Laboratory (LANL), which is operated by
## Los Alamos National Security, LLC for the U.S. Department of Energy.
## The U.S. Government has rights to use, reproduce, and distribute this software.
## NEITHER THE GOVERNMENT NOR LOS ALAMOS NATIONAL SECURITY, LLC MAKES ANY WARRANTY,
## EXPRESS OR IMPLIED, OR ASSUMES ANY LIABILITY FOR THE USE OF THIS SOFTWARE.
## If software is modified to produce derivative works, such modified software
## should be clearly marked, so as not to confuse it with the version available
## from LANL.
##
## Additionally, redistribution and use in source and binary forms, with or
## without modification, are permitted provided that the following conditions
## are met:
## -   Redistributions of source code must retain the above copyright notice,
##     this list of conditions and the following disclaimer.
## -   Redistributions in binary form must reproduce the above copyright notice,
##     this list of conditions and the following disclaimer in the documentation
##     and/or other materials provided with the distribution.
## -   Neither the name of Los Alamos National Security, LLC, Los Alamos National
##     Laboratory, LANL, the U.S. Government, nor the names of its contributors
##     may be used to endorse or promote products derived from this software
##     without specific prior written permission.
##
## THIS SOFTWARE IS PROVIDED BY LOS ALAMOS NATIONAL SECURITY, LLC AND CONTRIBUTORS
## "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
## THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
## ARE DISCLAIMED. IN NO EVENT SHALL LOS ALAMOS NATIONAL SECURITY, LLC OR
## CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
## EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
## PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
## OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
## WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
## OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
## ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##
## =========================================================================
##  .NAME BHTree - Create a Barnes Hut tree from the given points
##
##  .SECTION Description
##  BHTree takes point locations and distributes them recursively in
##  a Barnes Hut tree.  The tree is a quadtree or octree, dividing on physical
##  location such that one point or one node appears within a child
##  so that it is essentially AMR.
##
##  This is used to ensure unique points in the vtk data set and so the
##  succeeding steps of threading the tree for iteration is not done.
##
##  BHLeaf is the actual point with the index matching the vtkPoints index.
##  BHNode are negative numbers.  This allows a quick recognition of a leaf
##  or a node.  Children numbered with 0 are empty.
##

var MAX_DIM* {.importcpp: "MAX_DIM", header: "BHTree.h".}: cint

var MAX_CHILD* {.importcpp: "MAX_CHILD", header: "BHTree.h".}: cint

## ///////////////////////////////////////////////////////////////////////
##
##  Leaf information
##
## ///////////////////////////////////////////////////////////////////////

type
  BHLeaf* {.importcpp: "BHLeaf", header: "BHTree.h", bycopy.} = object
    location* {.importc: "location".}: array[MAX_DIM, cdouble]


proc constructBHLeaf*(dim: cint; loc: ptr cdouble): BHLeaf {.constructor,
    importcpp: "BHLeaf(@)", header: "BHTree.h".}
proc constructBHLeaf*(): BHLeaf {.constructor, importcpp: "BHLeaf(@)",
                               header: "BHTree.h".}
proc sameAs*(this: var BHLeaf; dim: cint; loc: ptr cdouble): bool {.importcpp: "sameAs",
    header: "BHTree.h".}
## ///////////////////////////////////////////////////////////////////////
##
##  BH node information
##
##  Barnes Hut octree structure for N-body is represented by vector
##  of BHNode which divide space into octants which are filled with one
##  particle or one branching node.  As the tree is built the child[8]
##  array is used.  Afterwards the tree is walked linking the nodes and
##  replacing the child structure with data about the tree.  When building
##  the tree child information is an integer which is the index of the
##  halo particle which was put into a vector of BHLeaf, or the index
##  of the BHNode offset by the number of particles
##
## ///////////////////////////////////////////////////////////////////////

type
  BHNode* {.importcpp: "BHNode", header: "BHTree.h", bycopy.} = object
    length* {.importc: "length".}: array[MAX_DIM, cdouble] ##  Length of octant on each side
    center* {.importc: "center".}: array[MAX_DIM, cdouble] ##  Physical center of octant
    child* {.importc: "child".}: array[MAX_CHILD, cint] ##  Index of leaf or node


proc constructBHNode*(): BHNode {.constructor, importcpp: "BHNode(@)",
                               header: "BHTree.h".}
proc constructBHNode*(dim: cint; numChild: cint; minLoc: ptr cdouble;
                     maxLoc: ptr cdouble): BHNode {.constructor,
    importcpp: "BHNode(@)", header: "BHTree.h".}
proc constructBHNode*(dim: cint; numChild: cint; parent: ptr BHNode; child: cint): BHNode {.
    constructor, importcpp: "BHNode(@)", header: "BHTree.h".}
## ///////////////////////////////////////////////////////////////////////
##
##  Barnes Hut Tree
##
## ///////////////////////////////////////////////////////////////////////

type
  BHTree* {.importcpp: "BHTree", header: "BHTree.h", bycopy.} = object
    ##  Physical range of data
    ##  Physical range of data


proc constructBHTree*(dimension: cint; numChild: cint; minLoc: ptr cdouble;
                     maxLoc: ptr cdouble): BHTree {.constructor,
    importcpp: "BHTree(@)", header: "BHTree.h".}
  ##  Bounding box of tree
proc destroyBHTree*(this: var BHTree) {.importcpp: "#.~BHTree()", header: "BHTree.h".}
proc insertLeaf*(this: var BHTree; loc: ptr cdouble): cint {.importcpp: "insertLeaf",
    header: "BHTree.h".}
proc getChildIndex*(this: var BHTree; node: ptr BHNode; loc: ptr cdouble): cint {.
    importcpp: "getChildIndex", header: "BHTree.h".}
proc print*(this: var BHTree) {.importcpp: "print", header: "BHTree.h".}