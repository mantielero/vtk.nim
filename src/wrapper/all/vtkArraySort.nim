## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArraySort.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkArraySort
##  @brief   Controls sorting of sparse array coordinates.
##
##
##  vtkArraySort stores an ordered set of dimensions along which the
##  values stored in a sparse array should be sorted.
##
##  Convenience constructors are provided for specifying one, two, and
##  three dimensions.  To sort along more than three dimensions, use the
##  default constructor, SetDimensions(), and operator[] to assign each
##  dimension to be sorted.
##
##  @sa
##  vtkSparseArray
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National
##  Laboratories.
##

import
  vtkArrayCoordinates, vtkCommonCoreModule, vtkSystemIncludes

type
  vtkArraySort* {.importcpp: "vtkArraySort", header: "vtkArraySort.h", bycopy.} = object

  vtkArraySortDimensionT* = DimensionT

proc constructvtkArraySort*(): vtkArraySort {.constructor,
    importcpp: "vtkArraySort(@)", header: "vtkArraySort.h".}
proc constructvtkArraySort*(i: vtkArraySortDimensionT): vtkArraySort {.constructor,
    importcpp: "vtkArraySort(@)", header: "vtkArraySort.h".}
proc constructvtkArraySort*(i: vtkArraySortDimensionT; j: vtkArraySortDimensionT): vtkArraySort {.
    constructor, importcpp: "vtkArraySort(@)", header: "vtkArraySort.h".}
proc constructvtkArraySort*(i: vtkArraySortDimensionT; j: vtkArraySortDimensionT;
                           k: vtkArraySortDimensionT): vtkArraySort {.constructor,
    importcpp: "vtkArraySort(@)", header: "vtkArraySort.h".}
proc GetDimensions*(this: vtkArraySort): vtkArraySortDimensionT {.noSideEffect,
    importcpp: "GetDimensions", header: "vtkArraySort.h".}
proc SetDimensions*(this: var vtkArraySort; dimensions: vtkArraySortDimensionT) {.
    importcpp: "SetDimensions", header: "vtkArraySort.h".}
proc `[]`*(this: var vtkArraySort; i: vtkArraySortDimensionT): var vtkArraySortDimensionT {.
    importcpp: "#[@]", header: "vtkArraySort.h".}
proc `[]`*(this: vtkArraySort; i: vtkArraySortDimensionT): vtkArraySortDimensionT {.
    noSideEffect, importcpp: "#[@]", header: "vtkArraySort.h".}
proc `==`*(this: vtkArraySort; rhs: vtkArraySort): bool {.noSideEffect,
    importcpp: "(# == #)", header: "vtkArraySort.h".}
##  VTK-HeaderTest-Exclude: vtkArraySort.h
