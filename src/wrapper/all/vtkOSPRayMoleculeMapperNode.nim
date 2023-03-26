## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOSPRayMoleculeMapperNode.h
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
##  @class   vtkOSPRayMoleculeMapperNode
##  @brief   links vtkMoleculeMapper to OSPRay
##
##  Translates vtkMoleculeMapper state into OSPRay rendering calls
##

import
  vtkPolyDataMapperNode, vtkRenderingRayTracingModule, RTWrapper/RTWrapper

type
  vtkOSPRayMoleculeMapperNode* {.importcpp: "vtkOSPRayMoleculeMapperNode",
                                header: "vtkOSPRayMoleculeMapperNode.h", bycopy.} = object of vtkPolyDataMapperNode
    vtkOSPRayMoleculeMapperNode* {.importc: "vtkOSPRayMoleculeMapperNode".}: VTK_NEWINSTANCE


proc New*(): ptr vtkOSPRayMoleculeMapperNode {.
    importcpp: "vtkOSPRayMoleculeMapperNode::New(@)",
    header: "vtkOSPRayMoleculeMapperNode.h".}
type
  vtkOSPRayMoleculeMapperNodeSuperclass* = vtkPolyDataMapperNode

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOSPRayMoleculeMapperNode::IsTypeOf(@)",
    header: "vtkOSPRayMoleculeMapperNode.h".}
proc IsA*(this: var vtkOSPRayMoleculeMapperNode; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOSPRayMoleculeMapperNode.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOSPRayMoleculeMapperNode {.
    importcpp: "vtkOSPRayMoleculeMapperNode::SafeDownCast(@)",
    header: "vtkOSPRayMoleculeMapperNode.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOSPRayMoleculeMapperNode :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOSPRayMoleculeMapperNode :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOSPRayMoleculeMapperNode :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOSPRayMoleculeMapperNode; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkOSPRayMoleculeMapperNode.h".}
proc Render*(this: var vtkOSPRayMoleculeMapperNode; prepass: bool) {.
    importcpp: "Render", header: "vtkOSPRayMoleculeMapperNode.h".}