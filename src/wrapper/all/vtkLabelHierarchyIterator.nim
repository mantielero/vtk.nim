## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLabelHierarchyIterator.h
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
##  @class   vtkLabelHierarchyIterator
##  @brief   iterator over vtkLabelHierarchy
##
##
##  Abstract superclass for iterators over vtkLabelHierarchy.
##

import
  vtkObject, vtkRenderingLabelModule, vtkStdString

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkLabelHierarchy"
discard "forward decl of vtkPolyData"
type
  vtkLabelHierarchyIterator* {.importcpp: "vtkLabelHierarchyIterator",
                              header: "vtkLabelHierarchyIterator.h", bycopy.} = object of vtkObject
    vtkLabelHierarchyIterator* {.importc: "vtkLabelHierarchyIterator".}: VTK_NEWINSTANCE

  vtkLabelHierarchyIteratorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLabelHierarchyIterator::IsTypeOf(@)",
    header: "vtkLabelHierarchyIterator.h".}
proc IsA*(this: var vtkLabelHierarchyIterator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLabelHierarchyIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLabelHierarchyIterator {.
    importcpp: "vtkLabelHierarchyIterator::SafeDownCast(@)",
    header: "vtkLabelHierarchyIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLabelHierarchyIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLabelHierarchyIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLabelHierarchyIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLabelHierarchyIterator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLabelHierarchyIterator.h".}
proc Begin*(this: var vtkLabelHierarchyIterator; a2: ptr vtkIdTypeArray) {.
    importcpp: "Begin", header: "vtkLabelHierarchyIterator.h".}
proc Next*(this: var vtkLabelHierarchyIterator) {.importcpp: "Next",
    header: "vtkLabelHierarchyIterator.h".}
proc IsAtEnd*(this: var vtkLabelHierarchyIterator): bool {.importcpp: "IsAtEnd",
    header: "vtkLabelHierarchyIterator.h".}
proc GetPoint*(this: var vtkLabelHierarchyIterator; x: array[3, cdouble]) {.
    importcpp: "GetPoint", header: "vtkLabelHierarchyIterator.h".}
proc GetSize*(this: var vtkLabelHierarchyIterator; sz: array[2, cdouble]) {.
    importcpp: "GetSize", header: "vtkLabelHierarchyIterator.h".}
proc GetBoundedSize*(this: var vtkLabelHierarchyIterator; sz: array[2, cdouble]) {.
    importcpp: "GetBoundedSize", header: "vtkLabelHierarchyIterator.h".}
proc GetType*(this: var vtkLabelHierarchyIterator): cint {.importcpp: "GetType",
    header: "vtkLabelHierarchyIterator.h".}
proc GetLabel*(this: var vtkLabelHierarchyIterator): vtkStdString {.
    importcpp: "GetLabel", header: "vtkLabelHierarchyIterator.h".}
proc GetOrientation*(this: var vtkLabelHierarchyIterator): cdouble {.
    importcpp: "GetOrientation", header: "vtkLabelHierarchyIterator.h".}
proc GetLabelId*(this: var vtkLabelHierarchyIterator): vtkIdType {.
    importcpp: "GetLabelId", header: "vtkLabelHierarchyIterator.h".}
proc GetnameHierarchy*(this: var vtkLabelHierarchyIterator): ptr vtkLabelHierarchy {.
    importcpp: "GetnameHierarchy", header: "vtkLabelHierarchyIterator.h".}
  ## /@}
  ## *
  ##  Sets a polydata to fill with geometry representing
  ##  the bounding boxes of the traversed octree nodes.
  ##
proc SetTraversedBounds*(this: var vtkLabelHierarchyIterator; a2: ptr vtkPolyData) {.
    importcpp: "SetTraversedBounds", header: "vtkLabelHierarchyIterator.h".}
proc GetNodeGeometry*(this: var vtkLabelHierarchyIterator; ctr: array[3, cdouble];
                     size: var cdouble) {.importcpp: "GetNodeGeometry",
                                       header: "vtkLabelHierarchyIterator.h".}
proc BoxNode*(this: var vtkLabelHierarchyIterator) {.importcpp: "BoxNode",
    header: "vtkLabelHierarchyIterator.h".}
proc BoxAllNodes*(this: var vtkLabelHierarchyIterator; a2: ptr vtkPolyData) {.
    importcpp: "BoxAllNodes", header: "vtkLabelHierarchyIterator.h".}
proc SetAllBounds*(this: var vtkLabelHierarchyIterator; _arg: cint) {.
    importcpp: "SetAllBounds", header: "vtkLabelHierarchyIterator.h".}
## !!!Ignored construct:  virtual int GetAllBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AllBounds  of  << this -> AllBounds ) ; return this -> AllBounds ; } ;
## Error: expected ';'!!!
