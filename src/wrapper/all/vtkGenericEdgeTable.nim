## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericEdgeTable.h
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
##  @class   vtkGenericEdgeTable
##  @brief   keep track of edges (defined by pair of integer id's)
##
##  vtkGenericEdgeTable is used to indicate the existence of and hold
##  information about edges. Similar to vtkEdgeTable, this class is
##  more sophisticated in that it uses reference counting to keep track
##  of when information about an edge should be deleted.
##
##  vtkGenericEdgeTable is a helper class used in the adaptor framework.  It
##  is used during the tessellation process to hold information about the
##  error metric on each edge. This avoids recomputing the error metric each
##  time the same edge is visited.
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkEdgeTableEdge"
discard "forward decl of vtkEdgeTablePoints"
type
  vtkGenericEdgeTable* {.importcpp: "vtkGenericEdgeTable",
                        header: "vtkGenericEdgeTable.h", bycopy.} = object of vtkObject ## *
                                                                                 ##  Instantiate an empty edge table.
                                                                                 ##
    vtkGenericEdgeTable* {.importc: "vtkGenericEdgeTable".}: VTK_NEWINSTANCE
    ##  At end of process we should be able to retrieve points coord based on pointid
    ##  Main hash functions
    ##  For edge table:


proc New*(): ptr vtkGenericEdgeTable {.importcpp: "vtkGenericEdgeTable::New(@)",
                                   header: "vtkGenericEdgeTable.h".}
type
  vtkGenericEdgeTableSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericEdgeTable::IsTypeOf(@)", header: "vtkGenericEdgeTable.h".}
proc IsA*(this: var vtkGenericEdgeTable; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericEdgeTable.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericEdgeTable {.
    importcpp: "vtkGenericEdgeTable::SafeDownCast(@)",
    header: "vtkGenericEdgeTable.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericEdgeTable :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericEdgeTable :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericEdgeTable :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericEdgeTable; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericEdgeTable.h".}
proc InsertEdge*(this: var vtkGenericEdgeTable; e1: vtkIdType; e2: vtkIdType;
                cellId: vtkIdType; `ref`: cint; ptId: var vtkIdType) {.
    importcpp: "InsertEdge", header: "vtkGenericEdgeTable.h".}
proc InsertEdge*(this: var vtkGenericEdgeTable; e1: vtkIdType; e2: vtkIdType;
                cellId: vtkIdType; `ref`: cint = 1) {.importcpp: "InsertEdge",
    header: "vtkGenericEdgeTable.h".}
proc RemoveEdge*(this: var vtkGenericEdgeTable; e1: vtkIdType; e2: vtkIdType): cint {.
    importcpp: "RemoveEdge", header: "vtkGenericEdgeTable.h".}
proc CheckEdge*(this: var vtkGenericEdgeTable; e1: vtkIdType; e2: vtkIdType;
               ptId: var vtkIdType): cint {.importcpp: "CheckEdge",
                                        header: "vtkGenericEdgeTable.h".}
proc IncrementEdgeReferenceCount*(this: var vtkGenericEdgeTable; e1: vtkIdType;
                                 e2: vtkIdType; cellId: vtkIdType): cint {.
    importcpp: "IncrementEdgeReferenceCount", header: "vtkGenericEdgeTable.h".}
proc CheckEdgeReferenceCount*(this: var vtkGenericEdgeTable; e1: vtkIdType;
                             e2: vtkIdType): cint {.
    importcpp: "CheckEdgeReferenceCount", header: "vtkGenericEdgeTable.h".}
proc Initialize*(this: var vtkGenericEdgeTable; start: vtkIdType) {.
    importcpp: "Initialize", header: "vtkGenericEdgeTable.h".}
proc GetNumberOfComponents*(this: var vtkGenericEdgeTable): cint {.
    importcpp: "GetNumberOfComponents", header: "vtkGenericEdgeTable.h".}
proc SetNumberOfComponents*(this: var vtkGenericEdgeTable; count: cint) {.
    importcpp: "SetNumberOfComponents", header: "vtkGenericEdgeTable.h".}
proc CheckPoint*(this: var vtkGenericEdgeTable; ptId: vtkIdType): cint {.
    importcpp: "CheckPoint", header: "vtkGenericEdgeTable.h".}
proc CheckPoint*(this: var vtkGenericEdgeTable; ptId: vtkIdType;
                point: array[3, cdouble]; scalar: ptr cdouble): cint {.
    importcpp: "CheckPoint", header: "vtkGenericEdgeTable.h".}
proc InsertPoint*(this: var vtkGenericEdgeTable; ptId: vtkIdType;
                 point: array[3, cdouble]) {.importcpp: "InsertPoint",
    header: "vtkGenericEdgeTable.h".}
proc InsertPointAndScalar*(this: var vtkGenericEdgeTable; ptId: vtkIdType;
                          pt: array[3, cdouble]; s: ptr cdouble) {.
    importcpp: "InsertPointAndScalar", header: "vtkGenericEdgeTable.h".}
proc RemovePoint*(this: var vtkGenericEdgeTable; ptId: vtkIdType) {.
    importcpp: "RemovePoint", header: "vtkGenericEdgeTable.h".}
proc IncrementPointReferenceCount*(this: var vtkGenericEdgeTable; ptId: vtkIdType) {.
    importcpp: "IncrementPointReferenceCount", header: "vtkGenericEdgeTable.h".}
proc DumpTable*(this: var vtkGenericEdgeTable) {.importcpp: "DumpTable",
    header: "vtkGenericEdgeTable.h".}
proc LoadFactor*(this: var vtkGenericEdgeTable) {.importcpp: "LoadFactor",
    header: "vtkGenericEdgeTable.h".}
type
  vtkGenericEdgeTablePointEntry* {.importcpp: "vtkGenericEdgeTable::PointEntry",
                                  header: "vtkGenericEdgeTable.h", bycopy.} = object
    PointId* {.importc: "PointId".}: vtkIdType
    Coord* {.importc: "Coord".}: array[3, cdouble]
    Scalar* {.importc: "Scalar".}: ptr cdouble ##  point data: all point-centered attributes at this point
    numberOfComponents* {.importc: "numberOfComponents".}: cint
    Reference* {.importc: "Reference".}: cint ##  signed char
                                          ## *
                                          ##  Constructor with a scalar field of `size' doubles.
                                          ##  \pre positive_number_of_components: size>0
                                          ##


proc constructvtkGenericEdgeTablePointEntry*(size: cint): vtkGenericEdgeTablePointEntry {.
    constructor, importcpp: "vtkGenericEdgeTable::PointEntry(@)",
    header: "vtkGenericEdgeTable.h".}
proc destroyvtkGenericEdgeTablePointEntry*(
    this: var vtkGenericEdgeTablePointEntry) {.importcpp: "#.~PointEntry()",
    header: "vtkGenericEdgeTable.h".}
proc constructvtkGenericEdgeTablePointEntry*(other: vtkGenericEdgeTablePointEntry): vtkGenericEdgeTablePointEntry {.
    constructor, importcpp: "vtkGenericEdgeTable::PointEntry(@)",
    header: "vtkGenericEdgeTable.h".}
type
  vtkGenericEdgeTableEdgeEntry* {.importcpp: "vtkGenericEdgeTable::EdgeEntry",
                                 header: "vtkGenericEdgeTable.h", bycopy.} = object
    E1* {.importc: "E1".}: vtkIdType
    E2* {.importc: "E2".}: vtkIdType
    Reference* {.importc: "Reference".}: cint ##  signed char
    ToSplit* {.importc: "ToSplit".}: cint ##  signed char
    PtId* {.importc: "PtId".}: vtkIdType
    CellId* {.importc: "CellId".}: vtkIdType ##  CellId the edge refer to at a step in tessellation


proc constructvtkGenericEdgeTableEdgeEntry*(): vtkGenericEdgeTableEdgeEntry {.
    constructor, importcpp: "vtkGenericEdgeTable::EdgeEntry(@)",
    header: "vtkGenericEdgeTable.h".}
proc destroyvtkGenericEdgeTableEdgeEntry*(this: var vtkGenericEdgeTableEdgeEntry) {.
    importcpp: "#.~EdgeEntry()", header: "vtkGenericEdgeTable.h".}
proc constructvtkGenericEdgeTableEdgeEntry*(copy: vtkGenericEdgeTableEdgeEntry): vtkGenericEdgeTableEdgeEntry {.
    constructor, importcpp: "vtkGenericEdgeTable::EdgeEntry(@)",
    header: "vtkGenericEdgeTable.h".}