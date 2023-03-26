## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationIterator.h
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
##  @class   vtkInformationIterator
##  @brief   Iterates over keys of an information object
##
##  vtkInformationIterator can be used to iterate over the keys of an
##  information object. The corresponding values can then be directly
##  obtained from the information object using the keys.
##
##  @sa
##  vtkInformation vtkInformationKey
##

import
  vtkCommonCoreModule, vtkObject

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationKey"
discard "forward decl of vtkInformationIteratorInternals"
type
  vtkInformationIterator* {.importcpp: "vtkInformationIterator",
                           header: "vtkInformationIterator.h", bycopy.} = object of vtkObject
    vtkInformationIterator* {.importc: "vtkInformationIterator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkInformationIterator {.importcpp: "vtkInformationIterator::New(@)",
                                      header: "vtkInformationIterator.h".}
type
  vtkInformationIteratorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationIterator::IsTypeOf(@)",
    header: "vtkInformationIterator.h".}
proc IsA*(this: var vtkInformationIterator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationIterator {.
    importcpp: "vtkInformationIterator::SafeDownCast(@)",
    header: "vtkInformationIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationIterator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformationIterator.h".}
proc SetInformation*(this: var vtkInformationIterator; a2: ptr vtkInformation) {.
    importcpp: "SetInformation", header: "vtkInformationIterator.h".}
proc GetnameInformation*(this: var vtkInformationIterator): ptr vtkInformation {.
    importcpp: "GetnameInformation", header: "vtkInformationIterator.h".}
  ## /@}
  ## *
  ##  Set the function to iterate over. The iterator
  ##  will not hold a reference to the information object.
  ##  Can be used to optimize certain places by avoiding
  ##  garbage collection.
  ##
proc SetInformationWeak*(this: var vtkInformationIterator; a2: ptr vtkInformation) {.
    importcpp: "SetInformationWeak", header: "vtkInformationIterator.h".}
proc InitTraversal*(this: var vtkInformationIterator) {.importcpp: "InitTraversal",
    header: "vtkInformationIterator.h".}
proc GoToFirstItem*(this: var vtkInformationIterator) {.importcpp: "GoToFirstItem",
    header: "vtkInformationIterator.h".}
proc GoToNextItem*(this: var vtkInformationIterator) {.importcpp: "GoToNextItem",
    header: "vtkInformationIterator.h".}
proc IsDoneWithTraversal*(this: var vtkInformationIterator): cint {.
    importcpp: "IsDoneWithTraversal", header: "vtkInformationIterator.h".}
proc GetCurrentKey*(this: var vtkInformationIterator): ptr vtkInformationKey {.
    importcpp: "GetCurrentKey", header: "vtkInformationIterator.h".}