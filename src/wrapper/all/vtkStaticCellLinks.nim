## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStaticCellLinks.h
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
##  @class   vtkStaticCellLinks
##  @brief   object represents upward pointers from points
##  to list of cells using each point
##
##  vtkStaticCellLinks is a supplemental object to vtkCellArray and
##  vtkCellTypes, enabling access from points to the cells using the
##  points. vtkStaticCellLinks is an array of links, each link represents a
##  list of cell ids using a particular point. The information provided by
##  this object can be used to determine cell neighbors and construct other
##  local topological information. This class is a faster implementation of
##  vtkCellLinks. However, it cannot be incrementally constructed; it is meant
##  to be constructed once (statically) and must be rebuilt if the cells
##  change.
##
##  @warning
##  This is a drop-in replacement for vtkCellLinks using static link
##  construction. It uses the templated vtkStaticCellLinksTemplate class,
##  instantiating vtkStaticCellLinksTemplate with a vtkIdType template
##  parameter. Note that for best performance, the vtkStaticCellLinksTemplate
##  class may be used directly, instantiating it with the appropriate id
##  type. This class is also wrappable and can be used from an interpreted
##  language such as Python.
##
##  @sa
##  vtkCellLinks vtkStaticCellLinksTemplate
##

import
  vtkAbstractCellLinks, vtkCommonDataModelModule, vtkStaticCellLinksTemplate

discard "forward decl of vtkDataSet"
discard "forward decl of vtkCellArray"
type
  vtkStaticCellLinks* {.importcpp: "vtkStaticCellLinks",
                       header: "vtkStaticCellLinks.h", bycopy.} = object of vtkAbstractCellLinks ## /@{
                                                                                          ## *
                                                                                          ##  Standard methods for instantiation, type manipulation and printing.
                                                                                          ##
    vtkStaticCellLinks* {.importc: "vtkStaticCellLinks".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStaticCellLinks {.importcpp: "vtkStaticCellLinks::New(@)",
                                  header: "vtkStaticCellLinks.h".}
type
  vtkStaticCellLinksSuperclass* = vtkAbstractCellLinks

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStaticCellLinks::IsTypeOf(@)", header: "vtkStaticCellLinks.h".}
proc IsA*(this: var vtkStaticCellLinks; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStaticCellLinks.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStaticCellLinks {.
    importcpp: "vtkStaticCellLinks::SafeDownCast(@)",
    header: "vtkStaticCellLinks.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStaticCellLinks :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractCellLinks :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStaticCellLinks :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStaticCellLinks :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStaticCellLinks; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStaticCellLinks.h".}
proc BuildLinks*(this: var vtkStaticCellLinks; ds: ptr vtkDataSet) {.
    importcpp: "BuildLinks", header: "vtkStaticCellLinks.h".}
proc GetNumberOfCells*(this: var vtkStaticCellLinks; ptId: vtkIdType): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkStaticCellLinks.h".}
proc GetNcells*(this: var vtkStaticCellLinks; ptId: vtkIdType): vtkIdType {.
    importcpp: "GetNcells", header: "vtkStaticCellLinks.h".}
proc GetCells*(this: var vtkStaticCellLinks; ptId: vtkIdType): ptr vtkIdType {.
    importcpp: "GetCells", header: "vtkStaticCellLinks.h".}
proc SelectCells*(this: var vtkStaticCellLinks; minMaxDegree: array[2, vtkIdType];
                 cellSelection: ptr cuchar) {.importcpp: "SelectCells",
    header: "vtkStaticCellLinks.h".}
proc Initialize*(this: var vtkStaticCellLinks) {.importcpp: "Initialize",
    header: "vtkStaticCellLinks.h".}
proc Squeeze*(this: var vtkStaticCellLinks) {.importcpp: "Squeeze",
    header: "vtkStaticCellLinks.h".}
proc Reset*(this: var vtkStaticCellLinks) {.importcpp: "Reset",
                                        header: "vtkStaticCellLinks.h".}
proc GetActualMemorySize*(this: var vtkStaticCellLinks): culong {.
    importcpp: "GetActualMemorySize", header: "vtkStaticCellLinks.h".}
proc DeepCopy*(this: var vtkStaticCellLinks; src: ptr vtkAbstractCellLinks) {.
    importcpp: "DeepCopy", header: "vtkStaticCellLinks.h".}