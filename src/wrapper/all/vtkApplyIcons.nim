## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkApplyIcons.h
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
##  @class   vtkApplyIcons
##  @brief   apply icons to a data set.
##
##
##  vtkApplyIcons performs a iconing of the dataset using default icons,
##  lookup tables, annotations, and/or a selection. The output is a
##  vtkIntArray containing the icon index for each
##  element in the dataset. The first input is the dataset to be iconed, which
##  may be a vtkTable, vtkGraph subclass, or vtkDataSet subclass.
##
##  The second (optional) input is a vtkAnnotationLayers object, which stores
##  a list of annotation layers, with each layer holding a list of
##  vtkAnnotation objects. The annotation specifies a subset of data along with
##  other properties, including icon. For annotations with icon properties,
##  this algorithm will use the icon index of annotated elements,
##  using a "top one wins" strategy.
##
##  The third (optional) input is a vtkSelection object, meant for specifying
##  the current selection. You can control the icon of the selection, or whether
##  there is a set of selected icons at a particular offset in the icon sheet.
##
##  The algorithm takes an input array, specified with
##  SetInputArrayToProcess(0, 0, 0, vtkDataObject::FIELD_ASSOCIATION_POINTS, name)
##  This sets data arrays to use to icon the data with
##  the associated lookup table. For vtkGraph and vtkTable inputs, you would use
##  FIELD_ASSOCIATION_VERTICES, FIELD_ASSOCIATION_EDGES, or
##  FIELD_ASSOCIATION_ROWS as appropriate. The icon array will be added to the same
##  set of attributes that the input array came from. If there is no input array,
##  the icon array will be applied to the attributes associated with the
##  AttributeType parameter.
##
##  Icons are assigned with the following priorities:
##  <ol>
##  <li> If an item is part of the selection, it is glyphed with that icon.
##  <li> Otherwise, if the item is part of an annotation, it is glyphed
##       with the icon of the final (top) annotation in the set of layers.
##  <li> Otherwise, if a lookup table is used, it is glyphed using the
##       lookup table icon for the data value of the element.
##  <li> Otherwise it will be glyphed with the default icon.
##  </ol>
##

import
  vtkPassInputTypeAlgorithm, vtkVariant, vtkViewsInfovisModule

type
  vtkApplyIcons* {.importcpp: "vtkApplyIcons", header: "vtkApplyIcons.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkApplyIcons* {.importc: "vtkApplyIcons".}: VTK_NEWINSTANCE


proc New*(): ptr vtkApplyIcons {.importcpp: "vtkApplyIcons::New(@)",
                             header: "vtkApplyIcons.h".}
type
  vtkApplyIconsSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkApplyIcons::IsTypeOf(@)", header: "vtkApplyIcons.h".}
proc IsA*(this: var vtkApplyIcons; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkApplyIcons.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkApplyIcons {.
    importcpp: "vtkApplyIcons::SafeDownCast(@)", header: "vtkApplyIcons.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkApplyIcons :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkApplyIcons :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkApplyIcons :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkApplyIcons; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkApplyIcons.h".}
proc SetIconType*(this: var vtkApplyIcons; v: vtkVariant; icon: cint) {.
    importcpp: "SetIconType", header: "vtkApplyIcons.h".}
proc SetIconType*(this: var vtkApplyIcons; v: cdouble; icon: cint) {.
    importcpp: "SetIconType", header: "vtkApplyIcons.h".}
proc SetIconType*(this: var vtkApplyIcons; v: cstring; icon: cint) {.
    importcpp: "SetIconType", header: "vtkApplyIcons.h".}
proc ClearAllIconTypes*(this: var vtkApplyIcons) {.importcpp: "ClearAllIconTypes",
    header: "vtkApplyIcons.h".}
proc SetUseLookupTable*(this: var vtkApplyIcons; _arg: bool) {.
    importcpp: "SetUseLookupTable", header: "vtkApplyIcons.h".}
## !!!Ignored construct:  virtual bool GetUseLookupTable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseLookupTable  of  << this -> UseLookupTable ) ; return this -> UseLookupTable ; } ;
## Error: expected ';'!!!

proc UseLookupTableOn*(this: var vtkApplyIcons) {.importcpp: "UseLookupTableOn",
    header: "vtkApplyIcons.h".}
proc UseLookupTableOff*(this: var vtkApplyIcons) {.importcpp: "UseLookupTableOff",
    header: "vtkApplyIcons.h".}
  ## /@}
  ## /@{
  ## *
  ##  The default point icon for all unannotated, unselected elements
  ##  of the data. This is used if UsePointLookupTable is off.
  ##
proc SetUseLookupTableDefaultIcon*(this: var vtkApplyIcons; _arg: cint) {.
    importcpp: "SetUseLookupTableDefaultIcon", header: "vtkApplyIcons.h".}
## !!!Ignored construct:  virtual int GetUseLookupTableDefaultIcon ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DefaultIcon  of  << this -> DefaultIcon ) ; return this -> DefaultIcon ; } ;
## Error: expected ';'!!!

proc SetUseLookupTableDefaultIconSelectedIcon*(this: var vtkApplyIcons; _arg: cint) {.
    importcpp: "SetUseLookupTableDefaultIconSelectedIcon",
    header: "vtkApplyIcons.h".}
## !!!Ignored construct:  virtual int GetUseLookupTableDefaultIconSelectedIcon ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectedIcon  of  << this -> SelectedIcon ) ; return this -> SelectedIcon ; } ;
## Error: expected ';'!!!

proc SetIconOutputArrayName*(this: var vtkApplyIcons; _arg: cstring) {.
    importcpp: "SetIconOutputArrayName", header: "vtkApplyIcons.h".}
proc GetIconOutputArrayName*(this: var vtkApplyIcons): cstring {.
    importcpp: "GetIconOutputArrayName", header: "vtkApplyIcons.h".}
  ## /@}
const
  vtkApplyIconsSELECTED_ICON* = 0
  vtkApplyIconsSELECTED_OFFSET* = 1
  vtkApplyIconsANNOTATION_ICON* = 2
  vtkApplyIconsIGNORE_SELECTION* = 3

proc SetUseLookupTableDefaultIconSelectedIconSelectionMode*(
    this: var vtkApplyIcons; _arg: cint) {.importcpp: "SetUseLookupTableDefaultIconSelectedIconSelectionMode",
                                      header: "vtkApplyIcons.h".}
## !!!Ignored construct:  virtual int GetUseLookupTableDefaultIconSelectedIconSelectionMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SelectionMode  of  << this -> SelectionMode ) ; return this -> SelectionMode ; } ;
## Error: expected ';'!!!

proc SetSelectionModeToSelectedIcon*(this: var vtkApplyIcons) {.
    importcpp: "SetSelectionModeToSelectedIcon", header: "vtkApplyIcons.h".}
proc SetSelectionModeToSelectedOffset*(this: var vtkApplyIcons) {.
    importcpp: "SetSelectionModeToSelectedOffset", header: "vtkApplyIcons.h".}
proc SetSelectionModeToAnnotationIcon*(this: var vtkApplyIcons) {.
    importcpp: "SetSelectionModeToAnnotationIcon", header: "vtkApplyIcons.h".}
proc SetSelectionModeToIgnoreSelection*(this: var vtkApplyIcons) {.
    importcpp: "SetSelectionModeToIgnoreSelection", header: "vtkApplyIcons.h".}
proc SetUseLookupTableDefaultIconSelectedIconSelectionModeAttributeType*(
    this: var vtkApplyIcons; _arg: cint) {.importcpp: "SetUseLookupTableDefaultIconSelectedIconSelectionModeAttributeType",
                                      header: "vtkApplyIcons.h".}
## !!!Ignored construct:  virtual int GetUseLookupTableDefaultIconSelectedIconSelectionModeAttributeType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeType  of  << this -> AttributeType ) ; return this -> AttributeType ; } ;
## Error: expected ';'!!!
