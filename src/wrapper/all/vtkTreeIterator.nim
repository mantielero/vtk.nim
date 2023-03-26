## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTreeIterator.h
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
##  @class   vtkTreeIterator
##  @brief   Abstract class for iterator over a vtkTree.
##
##
##  The base class for tree iterators vtkTreeBFSIterator and vtkTreeDFSIterator.
##
##  After setting up the iterator, the normal mode of operation is to
##  set up a <code>while(iter->HasNext())</code> loop, with the statement
##  <code>vtkIdType vertex = iter->Next()</code> inside the loop.
##
##  @sa
##  vtkTreeBFSIterator vtkTreeDFSIterator
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkTree"
type
  vtkTreeIterator* {.importcpp: "vtkTreeIterator", header: "vtkTreeIterator.h",
                    bycopy.} = object of vtkObject
    vtkTreeIterator* {.importc: "vtkTreeIterator".}: VTK_NEWINSTANCE

  vtkTreeIteratorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTreeIterator::IsTypeOf(@)", header: "vtkTreeIterator.h".}
proc IsA*(this: var vtkTreeIterator; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTreeIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTreeIterator {.
    importcpp: "vtkTreeIterator::SafeDownCast(@)", header: "vtkTreeIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTreeIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTreeIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTreeIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTreeIterator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTreeIterator.h".}
proc SetTree*(this: var vtkTreeIterator; tree: ptr vtkTree) {.importcpp: "SetTree",
    header: "vtkTreeIterator.h".}
proc GetnameTree*(this: var vtkTreeIterator): ptr vtkTree {.importcpp: "GetnameTree",
    header: "vtkTreeIterator.h".}
  ## /@}
  ## /@{
  ## *
  ##  The start vertex of the traversal.
  ##  The tree iterator will only iterate over the subtree rooted at vertex.
  ##  If not set (or set to a negative value), starts at the root of the tree.
  ##
proc SetStartVertex*(this: var vtkTreeIterator; vertex: vtkIdType) {.
    importcpp: "SetStartVertex", header: "vtkTreeIterator.h".}
## !!!Ignored construct:  virtual vtkIdType GetStartVertex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartVertex  of  << this -> StartVertex ) ; return this -> StartVertex ; } ;
## Error: expected ';'!!!

proc Next*(this: var vtkTreeIterator): vtkIdType {.importcpp: "Next",
    header: "vtkTreeIterator.h".}
proc HasNext*(this: var vtkTreeIterator): bool {.importcpp: "HasNext",
    header: "vtkTreeIterator.h".}
proc Restart*(this: var vtkTreeIterator) {.importcpp: "Restart",
                                       header: "vtkTreeIterator.h".}