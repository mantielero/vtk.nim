## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericCellIterator.h
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
##  @class   vtkGenericCellIterator
##  @brief   iterator used to traverse cells
##
##  This class (and subclasses) are used to iterate over cells. Use it
##  only in conjunction with vtkGenericDataSet (i.e., the adaptor framework).
##
##  Typical use is:
##  <pre>
##  vtkGenericDataSet *dataset;
##  vtkGenericCellIterator *it = dataset->NewCellIterator(2);
##  for (it->Begin(); !it->IsAtEnd(); it->Next());
##    {
##    spec=it->GetCell();
##    }
##  </pre>
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkGenericAdaptorCell"
type
  vtkGenericCellIterator* {.importcpp: "vtkGenericCellIterator",
                           header: "vtkGenericCellIterator.h", bycopy.} = object of vtkObject ## /@{
                                                                                       ## *
                                                                                       ##  Standard VTK construction and type macros.
                                                                                       ##
    vtkGenericCellIterator* {.importc: "vtkGenericCellIterator".}: VTK_NEWINSTANCE

  vtkGenericCellIteratorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericCellIterator::IsTypeOf(@)",
    header: "vtkGenericCellIterator.h".}
proc IsA*(this: var vtkGenericCellIterator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericCellIterator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericCellIterator {.
    importcpp: "vtkGenericCellIterator::SafeDownCast(@)",
    header: "vtkGenericCellIterator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericCellIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericCellIterator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericCellIterator; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericCellIterator.h".}
proc Begin*(this: var vtkGenericCellIterator) {.importcpp: "Begin",
    header: "vtkGenericCellIterator.h".}
proc IsAtEnd*(this: var vtkGenericCellIterator): vtkTypeBool {.importcpp: "IsAtEnd",
    header: "vtkGenericCellIterator.h".}
proc NewCell*(this: var vtkGenericCellIterator): ptr vtkGenericAdaptorCell {.
    importcpp: "NewCell", header: "vtkGenericCellIterator.h".}
proc GetCell*(this: var vtkGenericCellIterator; c: ptr vtkGenericAdaptorCell) {.
    importcpp: "GetCell", header: "vtkGenericCellIterator.h".}
proc GetCell*(this: var vtkGenericCellIterator): ptr vtkGenericAdaptorCell {.
    importcpp: "GetCell", header: "vtkGenericCellIterator.h".}
proc Next*(this: var vtkGenericCellIterator) {.importcpp: "Next",
    header: "vtkGenericCellIterator.h".}