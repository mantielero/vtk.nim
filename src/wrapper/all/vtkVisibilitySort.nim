## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVisibilitySort.h
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
##  @class   vtkVisibilitySort
##  @brief   Abstract class that can sort cell data along a viewpoint.
##
##
##  vtkVisibilitySort encapsulates a method for depth sorting the cells of a
##  vtkDataSet for a given viewpoint.  It should be noted that subclasses
##  are not required to give an absolutely correct sorting.  Many types of
##  unstructured grids may have sorting cycles, meaning that there is no
##  possible correct sorting.  Some subclasses also only give an approximate
##  sorting in the interest of speed.
##
##  @attention
##  The Input field of this class tends to causes reference cycles.  To help
##  break these cycles, garbage collection is enabled on this object and the
##  input parameter is traced.  For this to work, though, an object in the
##  loop holding the visibility sort should also report that to the garbage
##  collector.
##
##

import
  vtkObject, vtkRenderingCoreModule

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkMatrix4x4"
discard "forward decl of vtkCamera"
type
  vtkVisibilitySort* {.importcpp: "vtkVisibilitySort",
                      header: "vtkVisibilitySort.h", bycopy.} = object of vtkObject
    vtkVisibilitySort* {.importc: "vtkVisibilitySort".}: VTK_NEWINSTANCE

  vtkVisibilitySortSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVisibilitySort::IsTypeOf(@)", header: "vtkVisibilitySort.h".}
proc IsA*(this: var vtkVisibilitySort; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVisibilitySort.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVisibilitySort {.
    importcpp: "vtkVisibilitySort::SafeDownCast(@)", header: "vtkVisibilitySort.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVisibilitySort :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVisibilitySort :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVisibilitySort :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVisibilitySort; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVisibilitySort.h".}
proc InitTraversal*(this: var vtkVisibilitySort) {.importcpp: "InitTraversal",
    header: "vtkVisibilitySort.h".}
proc GetNextCells*(this: var vtkVisibilitySort): ptr vtkIdTypeArray {.
    importcpp: "GetNextCells", header: "vtkVisibilitySort.h".}
proc SetMaxCellsReturned*(this: var vtkVisibilitySort; _arg: cint) {.
    importcpp: "SetMaxCellsReturned", header: "vtkVisibilitySort.h".}
proc GetMaxCellsReturnedMinValue*(this: var vtkVisibilitySort): cint {.
    importcpp: "GetMaxCellsReturnedMinValue", header: "vtkVisibilitySort.h".}
proc GetMaxCellsReturnedMaxValue*(this: var vtkVisibilitySort): cint {.
    importcpp: "GetMaxCellsReturnedMaxValue", header: "vtkVisibilitySort.h".}
## !!!Ignored construct:  virtual int GetMaxCellsReturned ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxCellsReturned  of  << this -> MaxCellsReturned ) ; return this -> MaxCellsReturned ; } ;
## Error: expected ';'!!!

proc SetModelTransform*(this: var vtkVisibilitySort; mat: ptr vtkMatrix4x4) {.
    importcpp: "SetModelTransform", header: "vtkVisibilitySort.h".}
proc GetnameModelTransform*(this: var vtkVisibilitySort): ptr vtkMatrix4x4 {.
    importcpp: "GetnameModelTransform", header: "vtkVisibilitySort.h".}
  ## /@}
proc GetnameModelTransformInverseModelTransform*(this: var vtkVisibilitySort): ptr vtkMatrix4x4 {.
    importcpp: "GetnameModelTransformInverseModelTransform",
    header: "vtkVisibilitySort.h".}
  ## /@{
  ## *
  ##  Set/Get the camera that specifies the viewing parameters.
  ##
proc SetCamera*(this: var vtkVisibilitySort; camera: ptr vtkCamera) {.
    importcpp: "SetCamera", header: "vtkVisibilitySort.h".}
proc GetnameModelTransformInverseModelTransformCamera*(
    this: var vtkVisibilitySort): ptr vtkCamera {.
    importcpp: "GetnameModelTransformInverseModelTransformCamera",
    header: "vtkVisibilitySort.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the data set containing the cells to sort.
  ##
proc SetInput*(this: var vtkVisibilitySort; data: ptr vtkDataSet) {.
    importcpp: "SetInput", header: "vtkVisibilitySort.h".}
proc GetnameModelTransformInverseModelTransformCameraInput*(
    this: var vtkVisibilitySort): ptr vtkDataSet {.
    importcpp: "GetnameModelTransformInverseModelTransformCameraInput",
    header: "vtkVisibilitySort.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the sorting direction.  Be default, the direction is set
  ##  to back to front.
  ##
## !!!Ignored construct:  virtual int GetMaxCellsReturnedDirection ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Direction  of  << this -> Direction ) ; return this -> Direction ; } ;
## Error: expected ';'!!!

proc SetDirection*(this: var vtkVisibilitySort; _arg: cint) {.
    importcpp: "SetDirection", header: "vtkVisibilitySort.h".}
proc SetDirectionToBackToFront*(this: var vtkVisibilitySort) {.
    importcpp: "SetDirectionToBackToFront", header: "vtkVisibilitySort.h".}
proc SetDirectionToFrontToBack*(this: var vtkVisibilitySort) {.
    importcpp: "SetDirectionToFrontToBack", header: "vtkVisibilitySort.h".}
const
  vtkVisibilitySortBACK_TO_FRONT* = 0
  vtkVisibilitySortFRONT_TO_BACK* = 1

proc UsesGarbageCollector*(this: vtkVisibilitySort): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkVisibilitySort.h".}