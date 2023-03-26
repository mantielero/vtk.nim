## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInEdgeIterator.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkInEdgeIterator
##  @brief   Iterates through all incoming edges to a vertex.
##
##
##  vtkInEdgeIterator iterates through all edges whose target is a particular
##  vertex. Instantiate this class directly and call Initialize() to traverse
##  the vertex of a graph. Alternately, use GetInEdges() on the graph to
##  initialize the iterator. it->Next() returns a vtkInEdgeType structure,
##  which contains Id, the edge's id, and Source, the edge's source vertex.
##
##  @sa
##  vtkGraph vtkOutEdgeIterator
##

import
  vtkCommonDataModelModule, vtkObject, vtkGraph

discard "forward decl of vtkGraphEdge"
type
  vtkInEdgeIterator* {.importcpp: "vtkInEdgeIterator",
                      header: "vtkInEdgeIterator.h", bycopy.} = object of vtkObject
    vtkInEdgeIterator* {.importc: "vtkInEdgeIterator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInEdgeIterator {.importcpp: "vtkInEdgeIterator::New(@)",
                                 header: "vtkInEdgeIterator.h".}
type
  vtkInEdgeIteratorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInEdgeIterator::IsTypeOf(@)", header: "vtkInEdgeIterator.h".}
proc IsA*(this: var vtkInEdgeIterator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInEdgeIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInEdgeIterator {.
    importcpp: "vtkInEdgeIterator::SafeDownCast(@)", header: "vtkInEdgeIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInEdgeIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInEdgeIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInEdgeIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInEdgeIterator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInEdgeIterator.h".}
proc Initialize*(this: var vtkInEdgeIterator; g: ptr vtkGraph; v: vtkIdType) {.
    importcpp: "Initialize", header: "vtkInEdgeIterator.h".}
proc GetnameGraph*(this: var vtkInEdgeIterator): ptr vtkGraph {.
    importcpp: "GetnameGraph", header: "vtkInEdgeIterator.h".}
## !!!Ignored construct:  virtual vtkIdType GetVertex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Vertex  of  << this -> Vertex ) ; return this -> Vertex ; } ;
## Error: expected ';'!!!

proc Next*(this: var vtkInEdgeIterator): vtkInEdgeType {.importcpp: "Next",
    header: "vtkInEdgeIterator.h".}
proc NextGraphEdge*(this: var vtkInEdgeIterator): ptr vtkGraphEdge {.
    importcpp: "NextGraphEdge", header: "vtkInEdgeIterator.h".}
proc HasNext*(this: var vtkInEdgeIterator): bool {.importcpp: "HasNext",
    header: "vtkInEdgeIterator.h".}