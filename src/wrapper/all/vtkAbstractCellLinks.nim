## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractCellLinks.h
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
##  @class   vtkAbstractCellLinks
##  @brief   an abstract base class for classes that build
##  topological links from points to cells
##
##  vtkAbstractCellLinks is a family of supplemental objects to vtkCellArray and
##  vtkCellTypes, enabling fast access from points to the cells using the
##  points. vtkAbstractCellLinks is an array of links, each link representing a
##  list of cell ids using a particular point. The information provided by
##  this object can be used to determine neighbors and construct other local
##  topological information.
##
##  @sa
##  vtkCellLinks vtkStaticCellLinks vtkStaticCellLinksTemplate
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkDataSet"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdList"
type
  vtkAbstractCellLinks* {.importcpp: "vtkAbstractCellLinks",
                         header: "vtkAbstractCellLinks.h", bycopy.} = object of vtkObject ## /@{
                                                                                   ## *
                                                                                   ##  Standard type and print methods.
                                                                                   ##
    vtkAbstractCellLinks* {.importc: "vtkAbstractCellLinks".}: VTK_NEWINSTANCE
    ##  control whether to thread or not
    ##  derived classes set this instance variable when constructed

  vtkAbstractCellLinksSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractCellLinks::IsTypeOf(@)",
    header: "vtkAbstractCellLinks.h".}
proc IsA*(this: var vtkAbstractCellLinks; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractCellLinks.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractCellLinks {.
    importcpp: "vtkAbstractCellLinks::SafeDownCast(@)",
    header: "vtkAbstractCellLinks.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractCellLinks :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractCellLinks :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractCellLinks :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractCellLinks; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractCellLinks.h".}
proc BuildLinks*(this: var vtkAbstractCellLinks; data: ptr vtkDataSet) {.
    importcpp: "BuildLinks", header: "vtkAbstractCellLinks.h".}
proc Initialize*(this: var vtkAbstractCellLinks) {.importcpp: "Initialize",
    header: "vtkAbstractCellLinks.h".}
proc Squeeze*(this: var vtkAbstractCellLinks) {.importcpp: "Squeeze",
    header: "vtkAbstractCellLinks.h".}
proc Reset*(this: var vtkAbstractCellLinks) {.importcpp: "Reset",
    header: "vtkAbstractCellLinks.h".}
proc GetActualMemorySize*(this: var vtkAbstractCellLinks): culong {.
    importcpp: "GetActualMemorySize", header: "vtkAbstractCellLinks.h".}
proc DeepCopy*(this: var vtkAbstractCellLinks; src: ptr vtkAbstractCellLinks) {.
    importcpp: "DeepCopy", header: "vtkAbstractCellLinks.h".}
type
  vtkAbstractCellLinksCellLinksTypes* {.size: sizeof(cint), importcpp: "vtkAbstractCellLinks::CellLinksTypes",
                                       header: "vtkAbstractCellLinks.h".} = enum
    LINKS_NOT_DEFINED = 0, CELL_LINKS = 1, STATIC_CELL_LINKS_USHORT = 2,
    STATIC_CELL_LINKS_UINT = 3, STATIC_CELL_LINKS_IDTYPE = 4,
    STATIC_CELL_LINKS_SPECIALIZED = 5


proc ComputeType*(maxPtId: vtkIdType; maxCellId: vtkIdType; ca: ptr vtkCellArray): cint {.
    importcpp: "vtkAbstractCellLinks::ComputeType(@)",
    header: "vtkAbstractCellLinks.h".}
proc GetType*(this: var vtkAbstractCellLinks): cint {.importcpp: "GetType",
    header: "vtkAbstractCellLinks.h".}
proc SelectCells*(this: var vtkAbstractCellLinks; minMaxDegree: array[2, vtkIdType];
                 cellSelection: ptr cuchar) {.importcpp: "SelectCells",
    header: "vtkAbstractCellLinks.h".}
proc SetSequentialProcessing*(this: var vtkAbstractCellLinks; _arg: bool) {.
    importcpp: "SetSequentialProcessing", header: "vtkAbstractCellLinks.h".}
## !!!Ignored construct:  virtual bool GetSequentialProcessing ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SequentialProcessing  of  << this -> SequentialProcessing ) ; return this -> SequentialProcessing ; } ;
## Error: expected ';'!!!

proc SequentialProcessingOn*(this: var vtkAbstractCellLinks) {.
    importcpp: "SequentialProcessingOn", header: "vtkAbstractCellLinks.h".}
proc SequentialProcessingOff*(this: var vtkAbstractCellLinks) {.
    importcpp: "SequentialProcessingOff", header: "vtkAbstractCellLinks.h".}
  ## /@}