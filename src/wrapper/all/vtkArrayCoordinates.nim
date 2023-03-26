## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayCoordinates.h
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
##  @class   vtkArrayCoordinates
##  @brief   Stores coordinate into an N-way array.
##
##
##  vtkArrayCoordinates stores a collection of coordinates that can be
##  used to access values in a vtkArray containing an arbitrary number of
##  dimensions.
##
##  Convenience constructors are provided for working with one, two, and
##  three dimensions.  For higher dimensions, use the default constructor,
##  SetDimensions() and operator[] to assign a coordinate value along each
##  dimension.
##
##  @sa
##  vtkArray, vtkArrayExtents
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National
##  Laboratories.
##

import
  vtkCommonCoreModule, vtkSystemIncludes

type
  vtkArrayCoordinates* {.importcpp: "vtkArrayCoordinates",
                        header: "vtkArrayCoordinates.h", bycopy.} = object

  vtkArrayCoordinatesCoordinateT* = vtkIdType
  vtkArrayCoordinatesDimensionT* = vtkIdType

proc constructvtkArrayCoordinates*(): vtkArrayCoordinates {.constructor,
    importcpp: "vtkArrayCoordinates(@)", header: "vtkArrayCoordinates.h".}
proc constructvtkArrayCoordinates*(i: vtkArrayCoordinatesCoordinateT): vtkArrayCoordinates {.
    constructor, importcpp: "vtkArrayCoordinates(@)",
    header: "vtkArrayCoordinates.h".}
proc constructvtkArrayCoordinates*(i: vtkArrayCoordinatesCoordinateT;
                                  j: vtkArrayCoordinatesCoordinateT): vtkArrayCoordinates {.
    constructor, importcpp: "vtkArrayCoordinates(@)",
    header: "vtkArrayCoordinates.h".}
proc constructvtkArrayCoordinates*(i: vtkArrayCoordinatesCoordinateT;
                                  j: vtkArrayCoordinatesCoordinateT;
                                  k: vtkArrayCoordinatesCoordinateT): vtkArrayCoordinates {.
    constructor, importcpp: "vtkArrayCoordinates(@)",
    header: "vtkArrayCoordinates.h".}
proc GetDimensions*(this: vtkArrayCoordinates): vtkArrayCoordinatesDimensionT {.
    noSideEffect, importcpp: "GetDimensions", header: "vtkArrayCoordinates.h".}
proc SetDimensions*(this: var vtkArrayCoordinates;
                   dimensions: vtkArrayCoordinatesDimensionT) {.
    importcpp: "SetDimensions", header: "vtkArrayCoordinates.h".}
proc `[]`*(this: var vtkArrayCoordinates; i: vtkArrayCoordinatesDimensionT): var vtkArrayCoordinatesCoordinateT {.
    importcpp: "#[@]", header: "vtkArrayCoordinates.h".}
proc `[]`*(this: vtkArrayCoordinates; i: vtkArrayCoordinatesDimensionT): vtkArrayCoordinatesCoordinateT {.
    noSideEffect, importcpp: "#[@]", header: "vtkArrayCoordinates.h".}
proc GetCoordinate*(this: vtkArrayCoordinates; i: vtkArrayCoordinatesDimensionT): vtkArrayCoordinatesCoordinateT {.
    noSideEffect, importcpp: "GetCoordinate", header: "vtkArrayCoordinates.h".}
proc SetCoordinate*(this: var vtkArrayCoordinates; i: vtkArrayCoordinatesDimensionT;
                   a3: vtkArrayCoordinatesCoordinateT) {.
    importcpp: "SetCoordinate", header: "vtkArrayCoordinates.h".}
proc `==`*(this: vtkArrayCoordinates; rhs: vtkArrayCoordinates): bool {.noSideEffect,
    importcpp: "(# == #)", header: "vtkArrayCoordinates.h".}
##  VTK-HeaderTest-Exclude: vtkArrayCoordinates.h
