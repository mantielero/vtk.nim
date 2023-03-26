## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMarchingCubesTriangleCases.h
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
##  marching cubes case table for generating isosurfaces
##

import
  vtkCommonDataModelModule, vtkSystemIncludes

type
  EDGE_LIST* = cint
  vtkMarchingCubesTriangleCases* {.importcpp: "vtkMarchingCubesTriangleCases",
                                  header: "vtkMarchingCubesTriangleCases.h",
                                  bycopy.} = object
    edges* {.importc: "edges".}: array[16, EDGE_LIST]


proc GetCases*(): ptr vtkMarchingCubesTriangleCases {.
    importcpp: "vtkMarchingCubesTriangleCases::GetCases(@)",
    header: "vtkMarchingCubesTriangleCases.h".}
##  VTK-HeaderTest-Exclude: vtkMarchingCubesTriangleCases.h
