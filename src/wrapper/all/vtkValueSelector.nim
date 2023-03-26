## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkValueSelector.h
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
##  @class vtkValueSelector
##  @brief selects elements matching chosen values.
##
##  vtkValueSelector is a vtkSelector that can select elements matching
##  values. This can handle a wide array of vtkSelectionNode::SelectionContent types.
##  These include vtkSelectionNode::GLOBALIDS, vtkSelectionNode::PEDIGREEIDS,
##  vtkSelectionNode::VALUES, vtkSelectionNode::INDICES, and
##  vtkSelectionNode::THRESHOLDS.
##
##  A few things to note:
##
##  * vtkSelectionNode::SelectionList must be 2-component array for
##    content-type = vtkSelectionNode::THRESHOLDS and 1-component array for all
##    other support content-types. For 1-component selection list, this will
##    match items where the field array (or index) value matches any value in the
##    selection list. For 2-component selection list, this will match those items
##    with values in inclusive-range specified by the two components.
##
##  * For vtkSelectionNode::VALUES or vtkSelectionNode::THRESHOLDS, the field
##    array to select on is defined by the name given the SelectionList itself.
##    If the SelectionList has no name (or is an empty string), then the active
##    scalars from the dataset will be chosen.
##

import
  vtkSelector

discard "forward decl of vtkConvertSelection"
type
  vtkValueSelector* {.importcpp: "vtkValueSelector", header: "vtkValueSelector.h",
                     bycopy.} = object of vtkSelector
    vtkValueSelector* {.importc: "vtkValueSelector".}: VTK_NEWINSTANCE


proc New*(): ptr vtkValueSelector {.importcpp: "vtkValueSelector::New(@)",
                                header: "vtkValueSelector.h".}
type
  vtkValueSelectorSuperclass* = vtkSelector

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkValueSelector::IsTypeOf(@)", header: "vtkValueSelector.h".}
proc IsA*(this: var vtkValueSelector; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkValueSelector.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkValueSelector {.
    importcpp: "vtkValueSelector::SafeDownCast(@)", header: "vtkValueSelector.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkValueSelector :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkValueSelector :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkValueSelector :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkValueSelector; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkValueSelector.h".}
proc Initialize*(this: var vtkValueSelector; node: ptr vtkSelectionNode) {.
    importcpp: "Initialize", header: "vtkValueSelector.h".}
proc Finalize*(this: var vtkValueSelector) {.importcpp: "Finalize",
    header: "vtkValueSelector.h".}