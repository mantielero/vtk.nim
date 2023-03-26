## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkTransferAttributes.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
##   -------------------------------------------------------------------------
## *
##  @class   vtkTransferAttributes
##  @brief   transfer data from a graph representation
##  to a tree representation using direct mapping or pedigree ids.
##
##
##  The filter requires
##  both a vtkGraph and vtkTree as input.  The tree vertices must be a
##  superset of the graph vertices.  A common example is when the graph vertices
##  correspond to the leaves of the tree, but the internal vertices of the tree
##  represent groupings of graph vertices.  The algorithm matches the vertices
##  using the array "PedigreeId".  The user may alternately set the
##  DirectMapping flag to indicate that the two structures must have directly
##  corresponding offsets (i.e. node i in the graph must correspond to node i in
##  the tree).
##
##

import
  vtkInfovisCoreModule, vtkPassInputTypeAlgorithm, vtkVariant

type
  vtkTransferAttributes* {.importcpp: "vtkTransferAttributes",
                          header: "vtkTransferAttributes.h", bycopy.} = object of vtkPassInputTypeAlgorithm ## *
                                                                                                     ##  Create a vtkTransferAttributes object.
                                                                                                     ##  Initial values are DirectMapping = false, DefaultValue = 1,
                                                                                                     ##  SourceArrayName=0, TargetArrayName = 0,
                                                                                                     ##  SourceFieldType=vtkDataObject::FIELD_ASSOCIATION_POINTS,
                                                                                                     ##  TargetFieldType=vtkDataObject::FIELD_ASSOCIATION_POINTS
                                                                                                     ##
    vtkTransferAttributes* {.importc: "vtkTransferAttributes".}: VTK_NEWINSTANCE
    ## *
    ##  Convert the vtkGraph into vtkPolyData.
    ##


proc New*(): ptr vtkTransferAttributes {.importcpp: "vtkTransferAttributes::New(@)",
                                     header: "vtkTransferAttributes.h".}
type
  vtkTransferAttributesSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransferAttributes::IsTypeOf(@)",
    header: "vtkTransferAttributes.h".}
proc IsA*(this: var vtkTransferAttributes; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransferAttributes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransferAttributes {.
    importcpp: "vtkTransferAttributes::SafeDownCast(@)",
    header: "vtkTransferAttributes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransferAttributes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransferAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransferAttributes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransferAttributes; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTransferAttributes.h".}
proc SetDirectMapping*(this: var vtkTransferAttributes; _arg: bool) {.
    importcpp: "SetDirectMapping", header: "vtkTransferAttributes.h".}
## !!!Ignored construct:  virtual bool GetDirectMapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DirectMapping  of  << this -> DirectMapping ) ; return this -> DirectMapping ; } ;
## Error: expected ';'!!!

proc DirectMappingOn*(this: var vtkTransferAttributes) {.
    importcpp: "DirectMappingOn", header: "vtkTransferAttributes.h".}
proc DirectMappingOff*(this: var vtkTransferAttributes) {.
    importcpp: "DirectMappingOff", header: "vtkTransferAttributes.h".}
  ## /@}
  ## /@{
  ## *
  ##  The field name to use for storing the source array.
  ##
proc GetSourceArrayName*(this: var vtkTransferAttributes): cstring {.
    importcpp: "GetSourceArrayName", header: "vtkTransferAttributes.h".}
proc SetSourceArrayName*(this: var vtkTransferAttributes; _arg: cstring) {.
    importcpp: "SetSourceArrayName", header: "vtkTransferAttributes.h".}
  ## /@}
  ## /@{
  ## *
  ##  The field name to use for storing the source array.
  ##
proc GetSourceArrayNameTargetArrayName*(this: var vtkTransferAttributes): cstring {.
    importcpp: "GetSourceArrayNameTargetArrayName",
    header: "vtkTransferAttributes.h".}
proc SetSourceArrayNameTargetArrayName*(this: var vtkTransferAttributes;
                                       _arg: cstring) {.
    importcpp: "SetSourceArrayNameTargetArrayName",
    header: "vtkTransferAttributes.h".}
  ## /@}
  ## /@{
  ## *
  ##  The source field type for accessing the source array. Valid values are
  ##  those from enum vtkDataObject::FieldAssociations.
  ##
## !!!Ignored construct:  virtual int GetDirectMappingSourceFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SourceFieldType  of  << this -> SourceFieldType ) ; return this -> SourceFieldType ; } ;
## Error: expected ';'!!!

proc SetDirectMappingSourceFieldType*(this: var vtkTransferAttributes; _arg: cint) {.
    importcpp: "SetDirectMappingSourceFieldType",
    header: "vtkTransferAttributes.h".}
  ## /@}
  ## /@{
  ## *
  ##  The target field type for accessing the target array. Valid values are
  ##  those from enum vtkDataObject::FieldAssociations.
  ##
## !!!Ignored construct:  virtual int GetDirectMappingSourceFieldTypeTargetFieldType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetFieldType  of  << this -> TargetFieldType ) ; return this -> TargetFieldType ; } ;
## Error: expected ';'!!!

proc SetDirectMappingSourceFieldTypeTargetFieldType*(
    this: var vtkTransferAttributes; _arg: cint) {.
    importcpp: "SetDirectMappingSourceFieldTypeTargetFieldType",
    header: "vtkTransferAttributes.h".}
  ## /@}
  ## /@{
  ## *
  ##  Method to get/set the default value.
  ##
proc GetDefaultValue*(this: var vtkTransferAttributes): vtkVariant {.
    importcpp: "GetDefaultValue", header: "vtkTransferAttributes.h".}
proc SetDefaultValue*(this: var vtkTransferAttributes; value: vtkVariant) {.
    importcpp: "SetDefaultValue", header: "vtkTransferAttributes.h".}
proc FillInputPortInformation*(this: var vtkTransferAttributes; port: cint;
                              info: ptr vtkInformation): cint {.
    importcpp: "FillInputPortInformation", header: "vtkTransferAttributes.h".}