## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellCenterDepthSort.h
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
##  Copyright 2003 Sandia Corporation.
##  Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##  license for use of this work by or on behalf of the
##  U.S. Government. Redistribution and use in source and binary forms, with
##  or without modification, are permitted provided that this Notice and any
##  statement of authorship are reproduced on all copies.
##
## *
##  @class   vtkCellCenterDepthSort
##  @brief   A simple implementation of vtkCellDepthSort.
##
##
##  vtkCellCenterDepthSort is a simple and fast implementation of depth
##  sort, but it only provides approximate results.  The sorting algorithm
##  finds the centroids of all the cells.  It then performs the dot product
##  of the centroids against a vector pointing in the direction of the
##  camera transformed into object space.  It then performs an ordinary sort
##  on the result.
##
##

import
  vtkRenderingCoreModule, vtkVisibilitySort

discard "forward decl of vtkFloatArray"
discard "forward decl of vtkCellCenterDepthSortStack"
type
  vtkCellCenterDepthSort* {.importcpp: "vtkCellCenterDepthSort",
                           header: "vtkCellCenterDepthSort.h", bycopy.} = object of vtkVisibilitySort
    vtkCellCenterDepthSort* {.importc: "vtkCellCenterDepthSort".}: VTK_NEWINSTANCE

  vtkCellCenterDepthSortSuperclass* = vtkVisibilitySort

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellCenterDepthSort::IsTypeOf(@)",
    header: "vtkCellCenterDepthSort.h".}
proc IsA*(this: var vtkCellCenterDepthSort; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCellCenterDepthSort.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellCenterDepthSort {.
    importcpp: "vtkCellCenterDepthSort::SafeDownCast(@)",
    header: "vtkCellCenterDepthSort.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellCenterDepthSort :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkVisibilitySort :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellCenterDepthSort :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellCenterDepthSort :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellCenterDepthSort; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellCenterDepthSort.h".}
proc New*(): ptr vtkCellCenterDepthSort {.importcpp: "vtkCellCenterDepthSort::New(@)",
                                      header: "vtkCellCenterDepthSort.h".}
proc InitTraversal*(this: var vtkCellCenterDepthSort) {.importcpp: "InitTraversal",
    header: "vtkCellCenterDepthSort.h".}
proc GetNextCells*(this: var vtkCellCenterDepthSort): ptr vtkIdTypeArray {.
    importcpp: "GetNextCells", header: "vtkCellCenterDepthSort.h".}