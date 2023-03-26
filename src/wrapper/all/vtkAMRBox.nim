## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAMRBox.h
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
##  @class   vtkAMRBox
##  @brief   Encloses a rectangular region of voxel like cells.
##
##
##  vtkAMRBox stores information for an AMR block
##
##  @sa
##  vtkAMRInformation
##

import
  vtkCommonDataModelModule, vtkObject, vtkStructuredData

type
  vtkAMRBox* {.importcpp: "vtkAMRBox", header: "vtkAMRBox.h", bycopy.} = object ## *
                                                                        ##  Construct the empty box.
                                                                        ##
                                                                        ## *
                                                                        ##  Returns the number of bytes allocated by this instance. In addition,
                                                                        ##  this number of bytes corresponds to the buffer size required to serialize
                                                                        ##  any vtkAMRBox instance.
                                                                        ##
                                                                        ## *
                                                                        ##  Initializes this box instance.
                                                                        ##
    ##  lo corner cell id.
    ##  hi corner cell id.
    ## /@{
    ## *
    ##  This method builds the AMR box with the given dimensions.
    ##  Note: the dimension of the AMR box is automatically detected
    ##  within this method.
    ##


proc constructvtkAMRBox*(): vtkAMRBox {.constructor, importcpp: "vtkAMRBox(@)",
                                     header: "vtkAMRBox.h".}
proc constructvtkAMRBox*(other: vtkAMRBox): vtkAMRBox {.constructor,
    importcpp: "vtkAMRBox(@)", header: "vtkAMRBox.h".}
proc constructvtkAMRBox*(ilo: cint; jlo: cint; klo: cint; ihi: cint; jhi: cint; khi: cint): vtkAMRBox {.
    constructor, importcpp: "vtkAMRBox(@)", header: "vtkAMRBox.h".}
proc constructvtkAMRBox*(origin: ptr cdouble; dimensions: ptr cint;
                        spacing: ptr cdouble; globalOrigin: ptr cdouble;
                        gridDescription: cint = VTK_XYZ_GRID): vtkAMRBox {.
    constructor, importcpp: "vtkAMRBox(@)", header: "vtkAMRBox.h".}
proc constructvtkAMRBox*(lo: array[3, cint]; hi: array[3, cint]): vtkAMRBox {.
    constructor, importcpp: "vtkAMRBox(@)", header: "vtkAMRBox.h".}
proc constructvtkAMRBox*(dims: array[6, cint]): vtkAMRBox {.constructor,
    importcpp: "vtkAMRBox(@)", header: "vtkAMRBox.h".}
proc destroyvtkAMRBox*(this: var vtkAMRBox) {.importcpp: "#.~vtkAMRBox()",
    header: "vtkAMRBox.h".}
proc Invalidate*(this: var vtkAMRBox) {.importcpp: "Invalidate", header: "vtkAMRBox.h".}
proc EmptyDimension*(this: vtkAMRBox; i: cint): bool {.noSideEffect,
    importcpp: "EmptyDimension", header: "vtkAMRBox.h".}
proc SetDimensions*(this: var vtkAMRBox; ilo: cint; jlo: cint; klo: cint; ihi: cint;
                   jhi: cint; khi: cint; desc: cint = VTK_XYZ_GRID) {.
    importcpp: "SetDimensions", header: "vtkAMRBox.h".}
proc SetDimensions*(this: var vtkAMRBox; lo: array[3, cint]; hi: array[3, cint];
                   desc: cint = VTK_XYZ_GRID) {.importcpp: "SetDimensions",
    header: "vtkAMRBox.h".}
proc SetDimensions*(this: var vtkAMRBox; dims: array[6, cint];
                   desc: cint = VTK_XYZ_GRID) {.importcpp: "SetDimensions",
    header: "vtkAMRBox.h".}
proc GetDimensions*(this: vtkAMRBox; lo: array[3, cint]; hi: array[3, cint]) {.
    noSideEffect, importcpp: "GetDimensions", header: "vtkAMRBox.h".}
proc GetDimensions*(this: vtkAMRBox; dims: array[6, cint]) {.noSideEffect,
    importcpp: "GetDimensions", header: "vtkAMRBox.h".}
proc GetNumberOfCells*(this: vtkAMRBox): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfCells", header: "vtkAMRBox.h".}
proc GetNumberOfCells*(this: vtkAMRBox; num: array[3, cint]) {.noSideEffect,
    importcpp: "GetNumberOfCells", header: "vtkAMRBox.h".}
proc GetNumberOfNodes*(this: vtkAMRBox; ext: array[3, cint]) {.noSideEffect,
    importcpp: "GetNumberOfNodes", header: "vtkAMRBox.h".}
proc GetNumberOfNodes*(this: vtkAMRBox): vtkIdType {.noSideEffect,
    importcpp: "GetNumberOfNodes", header: "vtkAMRBox.h".}
proc ComputeDimension*(this: vtkAMRBox): cint {.noSideEffect,
    importcpp: "ComputeDimension", header: "vtkAMRBox.h".}
proc GetLoCorner*(this: vtkAMRBox): ptr cint {.noSideEffect, importcpp: "GetLoCorner",
    header: "vtkAMRBox.h".}
proc GetHiCorner*(this: vtkAMRBox): ptr cint {.noSideEffect, importcpp: "GetHiCorner",
    header: "vtkAMRBox.h".}
proc GetValidHiCorner*(this: vtkAMRBox; hi: array[3, cint]) {.noSideEffect,
    importcpp: "GetValidHiCorner", header: "vtkAMRBox.h".}
proc Empty*(this: vtkAMRBox): bool {.noSideEffect, importcpp: "Empty",
                                 header: "vtkAMRBox.h".}
proc IsInvalid*(this: vtkAMRBox): bool {.noSideEffect, importcpp: "IsInvalid",
                                     header: "vtkAMRBox.h".}
proc `==`*(this: vtkAMRBox; other: vtkAMRBox): bool {.noSideEffect,
    importcpp: "(# == #)", header: "vtkAMRBox.h".}
proc Print*(this: vtkAMRBox; os: var ostream): var ostream {.noSideEffect,
    importcpp: "Print", header: "vtkAMRBox.h".}
proc Serialize*(this: var vtkAMRBox; buffer: ptr cuchar; bytesize: var vtkIdType) {.
    importcpp: "Serialize", header: "vtkAMRBox.h".}
proc Serialize*(this: vtkAMRBox; buffer: ptr cint) {.noSideEffect,
    importcpp: "Serialize", header: "vtkAMRBox.h".}
proc Deserialize*(this: var vtkAMRBox; buffer: ptr cuchar; bytesize: vtkIdType) {.
    importcpp: "Deserialize", header: "vtkAMRBox.h".}
proc DoesBoxIntersectAlongDimension*(this: vtkAMRBox; other: vtkAMRBox; q: cint): bool {.
    noSideEffect, importcpp: "DoesBoxIntersectAlongDimension",
    header: "vtkAMRBox.h".}
proc DoesIntersect*(this: vtkAMRBox; other: vtkAMRBox): bool {.noSideEffect,
    importcpp: "DoesIntersect", header: "vtkAMRBox.h".}
proc Coarsen*(this: var vtkAMRBox; r: cint) {.importcpp: "Coarsen",
                                        header: "vtkAMRBox.h".}
proc Refine*(this: var vtkAMRBox; r: cint) {.importcpp: "Refine", header: "vtkAMRBox.h".}
proc Grow*(this: var vtkAMRBox; byN: cint) {.importcpp: "Grow", header: "vtkAMRBox.h".}
proc Shrink*(this: var vtkAMRBox; byN: cint) {.importcpp: "Shrink",
    header: "vtkAMRBox.h".}
proc Shift*(this: var vtkAMRBox; i: cint; j: cint; k: cint) {.importcpp: "Shift",
    header: "vtkAMRBox.h".}
proc Shift*(this: var vtkAMRBox; I: array[3, cint]) {.importcpp: "Shift",
    header: "vtkAMRBox.h".}
proc Intersect*(this: var vtkAMRBox; other: vtkAMRBox): bool {.importcpp: "Intersect",
    header: "vtkAMRBox.h".}
proc Contains*(this: vtkAMRBox; i: cint; j: cint; k: cint): bool {.noSideEffect,
    importcpp: "Contains", header: "vtkAMRBox.h".}
proc Contains*(this: vtkAMRBox; I: array[3, cint]): bool {.noSideEffect,
    importcpp: "Contains", header: "vtkAMRBox.h".}
proc Contains*(this: vtkAMRBox; a2: vtkAMRBox): bool {.noSideEffect,
    importcpp: "Contains", header: "vtkAMRBox.h".}
proc GetGhostVector*(this: vtkAMRBox; r: cint; nghost: array[6, cint]) {.noSideEffect,
    importcpp: "GetGhostVector", header: "vtkAMRBox.h".}
proc RemoveGhosts*(this: var vtkAMRBox; r: cint) {.importcpp: "RemoveGhosts",
    header: "vtkAMRBox.h".}
proc GetBytesize*(): vtkIdType {.importcpp: "vtkAMRBox::GetBytesize(@)",
                              header: "vtkAMRBox.h".}
proc GetCellLinearIndex*(box: vtkAMRBox; i: cint; j: cint; k: cint;
                        imageDimension: array[3, cint]): cint {.
    importcpp: "vtkAMRBox::GetCellLinearIndex(@)", header: "vtkAMRBox.h".}
proc GetBounds*(box: vtkAMRBox; origin: array[3, cdouble]; spacing: array[3, cdouble];
               bounds: array[6, cdouble]) {.importcpp: "vtkAMRBox::GetBounds(@)",
    header: "vtkAMRBox.h".}
proc GetBoxOrigin*(box: vtkAMRBox; X0: array[3, cdouble]; spacing: array[3, cdouble];
                  x0: array[3, cdouble]) {.importcpp: "vtkAMRBox::GetBoxOrigin(@)",
                                        header: "vtkAMRBox.h".}
proc HasPoint*(box: vtkAMRBox; origin: array[3, cdouble]; spacing: array[3, cdouble];
              x: cdouble; y: cdouble; z: cdouble): bool {.
    importcpp: "vtkAMRBox::HasPoint(@)", header: "vtkAMRBox.h".}
proc ComputeStructuredCoordinates*(box: vtkAMRBox; dataOrigin: array[3, cdouble];
                                  h: array[3, cdouble]; x: array[3, cdouble];
                                  ijk: array[3, cint]; pcoords: array[3, cdouble]): cint {.
    importcpp: "vtkAMRBox::ComputeStructuredCoordinates(@)", header: "vtkAMRBox.h".}
## *****************************************************************************
## /@{
## *
##  Fill the region of "pArray" enclosed by "destRegion" with "fillValue"
##  "pArray" is defined on "arrayRegion".
##

proc FillRegion*[T](pArray: ptr T; arrayRegion: vtkAMRBox; destRegion: vtkAMRBox;
                   fillValue: T) =
  discard

##  VTK-HeaderTest-Exclude: vtkAMRBox.h
