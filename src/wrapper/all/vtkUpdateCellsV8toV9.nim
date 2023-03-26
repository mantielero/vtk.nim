## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUpdateCellsV8toV9.h
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
##  @class   vtkUpdateCellsV8toV9
##  @brief   Update cells from v8 node layout to v9 node layout
##

import
  vtkCellArray, vtkCellData, vtkCellType, vtkCellTypes, vtkHigherOrderHexahedron,
  vtkIdList, vtkIdTypeArray, vtkNew, vtkUnstructuredGrid

proc vtkUpdateCellsV8toV9*(output: ptr vtkUnstructuredGrid) =
  discard

proc vtkNeedsNewFileVersionV8toV9*(distinctCellTypes: ptr vtkUnsignedCharArray): bool =
  discard
