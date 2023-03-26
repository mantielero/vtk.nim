## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMarchingSquaresLineCases.h
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

##
##  Marching squares cases for generating isolines.
##

import
  vtkCommonDataModelModule, vtkSystemIncludes

type
  EDGE_LIST* = cint
  vtkMarchingSquaresLineCases* {.importcpp: "vtkMarchingSquaresLineCases",
                                header: "vtkMarchingSquaresLineCases.h", bycopy.} = object
    edges* {.importc: "edges".}: array[5, EDGE_LIST]


proc GetCases*(): ptr vtkMarchingSquaresLineCases {.
    importcpp: "vtkMarchingSquaresLineCases::GetCases(@)",
    header: "vtkMarchingSquaresLineCases.h".}
##  VTK-HeaderTest-Exclude: vtkMarchingSquaresLineCases.h
