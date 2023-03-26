## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImagePointIterator.h
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
##  @class   vtkImagePointIterator
##  @brief   iterate over all data points in an image.
##
##  This class will iterate over an image.  For each position, it provides
##  the (x,y,z) position, the (I,J,K) index, and the point Id.  If a stencil
##  is provided, then it also reports, for each point, whether the point is
##  inside the stencil.
##  <p>The iterator can go through the image point-by-point or span-by-span.
##  The Next() method advances to the next point, while the NextSpan() method
##  skips to the beginning of the next span, where a span is defined as a
##  start position and point count within an image row.
##  @sa
##  vtkImageData vtkImageStencilData vtkImageProgressIterator
##

import
  vtkImagePointDataIterator

type
  vtkImagePointIterator* {.importcpp: "vtkImagePointIterator",
                          header: "vtkImagePointIterator.h", bycopy.} = object of vtkImagePointDataIterator ## *
                                                                                                     ##  Default constructor, its use must be followed by Initialize().
                                                                                                     ##
    Spacing* {.importc: "Spacing".}: array[3, cdouble]
    Position* {.importc: "Position".}: array[3, cdouble]


proc constructvtkImagePointIterator*(): vtkImagePointIterator {.constructor,
    importcpp: "vtkImagePointIterator(@)", header: "vtkImagePointIterator.h".}
proc constructvtkImagePointIterator*(image: ptr vtkImageData;
                                    extent: array[6, cint] = nil;
                                    stencil: ptr vtkImageStencilData = nil;
                                    algorithm: ptr vtkAlgorithm = nil;
                                    threadId: cint = 0): vtkImagePointIterator {.
    constructor, importcpp: "vtkImagePointIterator(@)",
    header: "vtkImagePointIterator.h".}
proc Initialize*(this: var vtkImagePointIterator; image: ptr vtkImageData;
                extent: array[6, cint] = nil; stencil: ptr vtkImageStencilData = nil;
                algorithm: ptr vtkAlgorithm = nil; threadId: cint = 0) {.
    importcpp: "Initialize", header: "vtkImagePointIterator.h".}
proc NextSpan*(this: var vtkImagePointIterator) {.importcpp: "NextSpan",
    header: "vtkImagePointIterator.h".}
proc Next*(this: var vtkImagePointIterator) {.importcpp: "Next",
    header: "vtkImagePointIterator.h".}
proc IsAtEnd*(this: var vtkImagePointIterator): bool {.importcpp: "IsAtEnd",
    header: "vtkImagePointIterator.h".}
## !!!Ignored construct:  *
##  Get the current position.
##  double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { return this -> Position ; } /@{ *
##  Get the current position and place it in the provided array.
##  void GetPosition ( double x [ 3 ] ) { x [ 0 ] = this -> Position [ 0 ] ; x [ 1 ] = this -> Position [ 1 ] ; x [ 2 ] = this -> Position [ 2 ] ; } /@} /@{ *
##  Get the current position and place it in the provided array.
##  void GetPosition ( float x [ 3 ] ) { x [ 0 ] = this -> Position [ 0 ] ; x [ 1 ] = this -> Position [ 1 ] ; x [ 2 ] = this -> Position [ 2 ] ; } /@} protected : /@{ *
##  Helper method to update the position coordinate from the index.
##  void UpdatePosition ( ) { this -> Position [ 0 ] = this -> Origin [ 0 ] + this -> Index [ 0 ] * this -> Spacing [ 0 ] ; this -> Position [ 1 ] = this -> Origin [ 1 ] + this -> Index [ 1 ] * this -> Spacing [ 1 ] ; this -> Position [ 2 ] = this -> Origin [ 2 ] + this -> Index [ 2 ] * this -> Spacing [ 2 ] ; } /@} double Origin [ 3 ] ;
## Error: expected ';'!!!

##  VTK-HeaderTest-Exclude: vtkImagePointIterator.h
