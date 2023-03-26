## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrayPrint.h
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
##  @class   vtkArrayPrint
##  @brief   Print arrays in different formats
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National
##  Laboratories.
##

import
  vtkTypedArray

## / @relates vtkArrayPrint
## / Serializes the contents of an array to a stream as a series of
## / coordinates.  For 2D arrays of double values, the output is compatible
## / with the MatrixMarket "Coordinate Text File" format.

proc vtkPrintCoordinateFormat*[T](stream: var ostream; array: ptr vtkTypedArray[T]) {.
    importcpp: "vtkPrintCoordinateFormat(@)", header: "vtkArrayPrint.h".}
## / @relates vtkArrayPrint
## / Serializes the contents of a matrix to a stream in human-readable form.

proc vtkPrintMatrixFormat*[T](stream: var ostream; matrix: ptr vtkTypedArray[T]) {.
    importcpp: "vtkPrintMatrixFormat(@)", header: "vtkArrayPrint.h".}
## / @relates vtkArrayPrint
## / Serializes the contents of a vector to a stream in human-readable form.

proc vtkPrintVectorFormat*[T](stream: var ostream; vector: ptr vtkTypedArray[T]) {.
    importcpp: "vtkPrintVectorFormat(@)", header: "vtkArrayPrint.h".}
import
  vtkArrayPrint

##  VTK-HeaderTest-Exclude: vtkArrayPrint.h
