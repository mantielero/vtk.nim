## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellLinks.h
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
##  @class   vtkCellLinks
##  @brief   object represents upward pointers from points to list of cells using each point
##
##  vtkCellLinks is a supplemental object to vtkCellArray and vtkCellTypes,
##  enabling access from points to the cells using the points. vtkCellLinks is
##  a list of cell ids, each such link representing a dynamic list of cell ids
##  using the point. The information provided by this object can be used to
##  determine neighbors and construct other local topological information.
##
##  @warning
##  vtkCellLinks supports incremental (i.e., "editable") operations such as
##  inserting a new cell, or deleting a point. Because of this, it is less
##  memory efficient, and slower to construct and delete than static classes
##  such as vtkStaticCellLinks or vtkStaticCellLinksTemplate. However these
##  other classes are typically meant for one-time (static) construction.
##
##  @sa
##  vtkCellArray vtkCellTypes vtkStaticCellLinks vtkStaticCellLinksTemplate
##

import
  vtkAbstractCellLinks, vtkCommonDataModelModule

discard "forward decl of vtkDataSet"
discard "forward decl of vtkCellArray"
type
  vtkCellLinks* {.importcpp: "vtkCellLinks", header: "vtkCellLinks.h", bycopy.} = object of vtkAbstractCellLinks
    vtkCellLinks* {.importc: "vtkCellLinks".}: VTK_NEWINSTANCE
    ##  pointer to data
    ##  allocated size of data
    ##  maximum index inserted thus far
    ##  grow array by this point

  vtkCellLinksLink* {.importcpp: "vtkCellLinks::Link", header: "vtkCellLinks.h",
                     bycopy.} = object
    ncells* {.importc: "ncells".}: vtkIdType
    cells* {.importc: "cells".}: ptr vtkIdType


proc New*(): ptr vtkCellLinks {.importcpp: "vtkCellLinks::New(@)",
                            header: "vtkCellLinks.h".}
type
  vtkCellLinksSuperclass* = vtkAbstractCellLinks

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCellLinks::IsTypeOf(@)", header: "vtkCellLinks.h".}
proc IsA*(this: var vtkCellLinks; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCellLinks.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCellLinks {.
    importcpp: "vtkCellLinks::SafeDownCast(@)", header: "vtkCellLinks.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCellLinks :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractCellLinks :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellLinks :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellLinks :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCellLinks; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCellLinks.h".}
proc BuildLinks*(this: var vtkCellLinks; data: ptr vtkDataSet) {.
    importcpp: "BuildLinks", header: "vtkCellLinks.h".}
proc Allocate*(this: var vtkCellLinks; numLinks: vtkIdType; ext: vtkIdType = 1000) {.
    importcpp: "Allocate", header: "vtkCellLinks.h".}
proc Initialize*(this: var vtkCellLinks) {.importcpp: "Initialize",
                                       header: "vtkCellLinks.h".}
proc GetLink*(this: var vtkCellLinks; ptId: vtkIdType): var vtkCellLinksLink {.
    importcpp: "GetLink", header: "vtkCellLinks.h".}
proc GetNcells*(this: var vtkCellLinks; ptId: vtkIdType): vtkIdType {.
    importcpp: "GetNcells", header: "vtkCellLinks.h".}
proc GetCells*(this: var vtkCellLinks; ptId: vtkIdType): ptr vtkIdType {.
    importcpp: "GetCells", header: "vtkCellLinks.h".}
proc SelectCells*(this: var vtkCellLinks; minMaxDegree: array[2, vtkIdType];
                 cellSelection: ptr cuchar) {.importcpp: "SelectCells",
    header: "vtkCellLinks.h".}
proc InsertNextPoint*(this: var vtkCellLinks; numLinks: cint): vtkIdType {.
    importcpp: "InsertNextPoint", header: "vtkCellLinks.h".}
proc InsertNextCellReference*(this: var vtkCellLinks; ptId: vtkIdType;
                             cellId: vtkIdType) {.
    importcpp: "InsertNextCellReference", header: "vtkCellLinks.h".}
proc DeletePoint*(this: var vtkCellLinks; ptId: vtkIdType) {.importcpp: "DeletePoint",
    header: "vtkCellLinks.h".}
proc RemoveCellReference*(this: var vtkCellLinks; cellId: vtkIdType; ptId: vtkIdType) {.
    importcpp: "RemoveCellReference", header: "vtkCellLinks.h".}
proc AddCellReference*(this: var vtkCellLinks; cellId: vtkIdType; ptId: vtkIdType) {.
    importcpp: "AddCellReference", header: "vtkCellLinks.h".}
proc ResizeCellList*(this: var vtkCellLinks; ptId: vtkIdType; size: cint) {.
    importcpp: "ResizeCellList", header: "vtkCellLinks.h".}
proc Squeeze*(this: var vtkCellLinks) {.importcpp: "Squeeze", header: "vtkCellLinks.h".}
proc Reset*(this: var vtkCellLinks) {.importcpp: "Reset", header: "vtkCellLinks.h".}
proc GetActualMemorySize*(this: var vtkCellLinks): culong {.
    importcpp: "GetActualMemorySize", header: "vtkCellLinks.h".}
proc DeepCopy*(this: var vtkCellLinks; src: ptr vtkAbstractCellLinks) {.
    importcpp: "DeepCopy", header: "vtkCellLinks.h".}
## ----------------------------------------------------------------------------

proc InsertCellReference*(this: var vtkCellLinks; ptId: vtkIdType; pos: vtkIdType;
                         cellId: vtkIdType) {.importcpp: "InsertCellReference",
    header: "vtkCellLinks.h".}
## ----------------------------------------------------------------------------

proc DeletePoint*(this: var vtkCellLinks; ptId: vtkIdType) {.importcpp: "DeletePoint",
    header: "vtkCellLinks.h".}
## ----------------------------------------------------------------------------

proc InsertNextCellReference*(this: var vtkCellLinks; ptId: vtkIdType;
                             cellId: vtkIdType) {.
    importcpp: "InsertNextCellReference", header: "vtkCellLinks.h".}
## ----------------------------------------------------------------------------

proc RemoveCellReference*(this: var vtkCellLinks; cellId: vtkIdType; ptId: vtkIdType) {.
    importcpp: "RemoveCellReference", header: "vtkCellLinks.h".}
## ----------------------------------------------------------------------------

proc AddCellReference*(this: var vtkCellLinks; cellId: vtkIdType; ptId: vtkIdType) {.
    importcpp: "AddCellReference", header: "vtkCellLinks.h".}
## ----------------------------------------------------------------------------

proc ResizeCellList*(this: var vtkCellLinks; ptId: vtkIdType; size: cint) {.
    importcpp: "ResizeCellList", header: "vtkCellLinks.h".}