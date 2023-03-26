## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSetToLabelHierarchy.h
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
##  @class   vtkPointSetToLabelHierarchy
##  @brief   build a label hierarchy for a graph or point set.
##
##
##
##  Every point in the input vtkPoints object is taken to be an
##  anchor point for a label. Statistics on the input points
##  are used to subdivide an octree referencing the points
##  until the points each octree node contains have a variance
##  close to the node size and a limited population (< 100).
##

import
  vtkLabelHierarchyAlgorithm, vtkRenderingLabelModule

discard "forward decl of vtkTextProperty"
type
  vtkPointSetToLabelHierarchy* {.importcpp: "vtkPointSetToLabelHierarchy",
                                header: "vtkPointSetToLabelHierarchy.h", bycopy.} = object of vtkLabelHierarchyAlgorithm
    vtkPointSetToLabelHierarchy* {.importc: "vtkPointSetToLabelHierarchy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointSetToLabelHierarchy {.
    importcpp: "vtkPointSetToLabelHierarchy::New(@)",
    header: "vtkPointSetToLabelHierarchy.h".}
type
  vtkPointSetToLabelHierarchySuperclass* = vtkLabelHierarchyAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointSetToLabelHierarchy::IsTypeOf(@)",
    header: "vtkPointSetToLabelHierarchy.h".}
proc IsA*(this: var vtkPointSetToLabelHierarchy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPointSetToLabelHierarchy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointSetToLabelHierarchy {.
    importcpp: "vtkPointSetToLabelHierarchy::SafeDownCast(@)",
    header: "vtkPointSetToLabelHierarchy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointSetToLabelHierarchy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkLabelHierarchyAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSetToLabelHierarchy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSetToLabelHierarchy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointSetToLabelHierarchy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPointSetToLabelHierarchy.h".}
proc SetTargetLabelCount*(this: var vtkPointSetToLabelHierarchy; _arg: cint) {.
    importcpp: "SetTargetLabelCount", header: "vtkPointSetToLabelHierarchy.h".}
## !!!Ignored construct:  virtual int GetTargetLabelCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TargetLabelCount  of  << this -> TargetLabelCount ) ; return this -> TargetLabelCount ; } ;
## Error: expected ';'!!!

proc SetTargetLabelCountMaximumDepth*(this: var vtkPointSetToLabelHierarchy;
                                     _arg: cint) {.
    importcpp: "SetTargetLabelCountMaximumDepth",
    header: "vtkPointSetToLabelHierarchy.h".}
## !!!Ignored construct:  virtual int GetTargetLabelCountMaximumDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumDepth  of  << this -> MaximumDepth ) ; return this -> MaximumDepth ; } ;
## Error: expected ';'!!!

proc SetLabelArrayName*(this: var vtkPointSetToLabelHierarchy; name: cstring) {.
    importcpp: "SetLabelArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc GetLabelArrayName*(this: var vtkPointSetToLabelHierarchy): cstring {.
    importcpp: "GetLabelArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc SetSizeArrayName*(this: var vtkPointSetToLabelHierarchy; name: cstring) {.
    importcpp: "SetSizeArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc GetSizeArrayName*(this: var vtkPointSetToLabelHierarchy): cstring {.
    importcpp: "GetSizeArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc SetPriorityArrayName*(this: var vtkPointSetToLabelHierarchy; name: cstring) {.
    importcpp: "SetPriorityArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc GetPriorityArrayName*(this: var vtkPointSetToLabelHierarchy): cstring {.
    importcpp: "GetPriorityArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc SetIconIndexArrayName*(this: var vtkPointSetToLabelHierarchy; name: cstring) {.
    importcpp: "SetIconIndexArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc GetIconIndexArrayName*(this: var vtkPointSetToLabelHierarchy): cstring {.
    importcpp: "GetIconIndexArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc SetOrientationArrayName*(this: var vtkPointSetToLabelHierarchy; name: cstring) {.
    importcpp: "SetOrientationArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc GetOrientationArrayName*(this: var vtkPointSetToLabelHierarchy): cstring {.
    importcpp: "GetOrientationArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc SetBoundedSizeArrayName*(this: var vtkPointSetToLabelHierarchy; name: cstring) {.
    importcpp: "SetBoundedSizeArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc GetBoundedSizeArrayName*(this: var vtkPointSetToLabelHierarchy): cstring {.
    importcpp: "GetBoundedSizeArrayName", header: "vtkPointSetToLabelHierarchy.h".}
proc SetTextProperty*(this: var vtkPointSetToLabelHierarchy;
                     tprop: ptr vtkTextProperty) {.importcpp: "SetTextProperty",
    header: "vtkPointSetToLabelHierarchy.h".}
proc GetnameTextProperty*(this: var vtkPointSetToLabelHierarchy): ptr vtkTextProperty {.
    importcpp: "GetnameTextProperty", header: "vtkPointSetToLabelHierarchy.h".}
  ## /@}