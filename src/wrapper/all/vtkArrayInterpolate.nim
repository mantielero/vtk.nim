## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayInterpolate.h
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
##  @class   vtkArrayInterpolate
##
##  Computes the weighted sum of a collection of slices from a source
##  array, and stores the results in a slice of a target array.  Note that
##  the number of source slices and weights must match, and the extents of
##  each source slice must match the extents of the target slice.
##
##  Note: The implementation assumes that operator*(T, double) is defined,
##  and that there is an implicit conversion from its result back to T.
##
##  If you need to interpolate arrays of T other than double, you will
##  likely want to create your own specialization of this function.
##
##  The implementation should produce correct results for dense and sparse
##  arrays, but may perform poorly on sparse.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National
##  Laboratories.
##

import
  vtkTypedArray

discard "forward decl of vtkArrayExtents"
discard "forward decl of vtkArraySlices"
discard "forward decl of vtkArrayWeights"
proc vtkInterpolate*[T](source_array: ptr vtkTypedArray[T];
                       source_slices: vtkArraySlices;
                       source_weights: vtkArrayWeights;
                       target_slice: vtkArrayExtents;
                       target_array: ptr vtkTypedArray[T]) {.
    importcpp: "vtkInterpolate(@)", header: "vtkArrayInterpolate.h".}
import
  vtkArrayInterpolate

##  VTK-HeaderTest-Exclude: vtkArrayInterpolate.h
