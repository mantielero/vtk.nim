## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCIEDE2000.h
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
## =========================================================================
## The MIT License (MIT)
##
## Copyright (c) 2015 Greg Fiumara
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
## =========================================================================
## *
##  Private header used by vtkColorTransferFunction to support
##  LAB/CIEDE2000 interpolation.
##
##  Reference:
##  "Color Interpolation for Non-Euclidean Color Spaces",
##  Zeyen, M., Post, T., Hagen, H., Ahrens, J., Rogers, D. and Bujack, R.,
##  SciVis ShortPapers IEEE VIS 2018.
##  (https://datascience.dsscale.org/wp-content/uploads/sites/3/2019/01/ColorInterpolationforNon-EuclideanColorSpaces.pdf)
##
##  The implementation is a modified version based on the following:
##  https://github.com/gfiumara/CIEDE2000
##
##

## *
##  Node of the color path
##

type
  Node* {.importcpp: "CIEDE2000::Node", header: "vtkCIEDE2000.h", bycopy.} = object
    rgb* {.importc: "rgb".}: array[3, cdouble] ##  RGB color
    distance* {.importc: "distance".}: cdouble ##  Distance from the start


## *
##  Map a RGB color to its corresponding color in the sampled RGB space.
##

proc MapColor*(rgb: array[3, cdouble]) {.importcpp: "CIEDE2000::MapColor(@)",
                                     header: "vtkCIEDE2000.h".}
## *
##  Returns the distance between two colors as given by the
##  CIE Delta E 2000 (CIEDE2000) color distance measure.
##

proc GetCIEDeltaE2000*(lab1: array[3, cdouble]; lab2: array[3, cdouble]): cdouble {.
    importcpp: "CIEDE2000::GetCIEDeltaE2000(@)", header: "vtkCIEDE2000.h".}
## *
##  Calculates the shortest color path between two colors with respect
##  to the CIEDE2000 measure and returns its overall length.
##

proc GetColorPath*(rgb1: array[3, cdouble]; rgb2: array[3, cdouble];
                  path: var vector[Node]; forceExactSupportColors: bool): cdouble {.
    importcpp: "CIEDE2000::GetColorPath(@)", header: "vtkCIEDE2000.h".}
##  VTK-HeaderTest-Exclude: vtkCIEDE2000.h
