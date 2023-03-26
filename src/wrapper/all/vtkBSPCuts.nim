## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBSPCuts.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkBSPCuts
##  @brief   This class represents an axis-aligned Binary Spatial
##     Partitioning of a 3D space.
##
##
##     This class converts between the vtkKdTree
##     representation of a tree of vtkKdNodes (used by vtkDistributedDataFilter)
##     and a compact array representation that might be provided by a
##     graph partitioning library like Zoltan.  Such a representation
##     could be used in message passing.
##
##  @sa
##       vtkKdTree vtkKdNode vtkDistributedDataFilter
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkKdNode"
type
  vtkBSPCuts* {.importcpp: "vtkBSPCuts", header: "vtkBSPCuts.h", bycopy.} = object of vtkDataObject
    vtkBSPCuts* {.importc: "vtkBSPCuts".}: VTK_NEWINSTANCE
    ##  required cut information
    ##  number of cuts, also length of each array
    ##  dimension (x/y/z - 0/1/2) where cut occurs
    ##  location of cut along axis
    ##  location in arrays of left (lower) child info
    ##  location in arrays of right (lower) child info
    ##  optional cut information
    ##  coordinate of uppermost data in lower half
    ##  coordinate of lowermost data in upper half
    ##  number of data values in partition


proc New*(): ptr vtkBSPCuts {.importcpp: "vtkBSPCuts::New(@)", header: "vtkBSPCuts.h".}
type
  vtkBSPCutsSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.importcpp: "vtkBSPCuts::IsTypeOf(@)",
    header: "vtkBSPCuts.h".}
proc IsA*(this: var vtkBSPCuts; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBSPCuts.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBSPCuts {.
    importcpp: "vtkBSPCuts::SafeDownCast(@)", header: "vtkBSPCuts.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBSPCuts :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBSPCuts :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBSPCuts :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBSPCuts; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBSPCuts.h".}
proc GetDataObjectType*(this: var vtkBSPCuts): cint {.importcpp: "GetDataObjectType",
    header: "vtkBSPCuts.h".}
proc CreateCuts*(this: var vtkBSPCuts; bounds: ptr cdouble; ncuts: cint; dim: ptr cint;
                coord: ptr cdouble; lower: ptr cint; upper: ptr cint;
                lowerDataCoord: ptr cdouble; upperDataCoord: ptr cdouble;
                npoints: ptr cint) {.importcpp: "CreateCuts", header: "vtkBSPCuts.h".}
proc CreateCuts*(this: var vtkBSPCuts; kd: ptr vtkKdNode) {.importcpp: "CreateCuts",
    header: "vtkBSPCuts.h".}
proc GetKdNodeTree*(this: var vtkBSPCuts): ptr vtkKdNode {.importcpp: "GetKdNodeTree",
    header: "vtkBSPCuts.h".}
## !!!Ignored construct:  *
##  Get the number of cuts in the partitioning, which also the size of
##  the arrays in the array representation of the partitioning.
##  virtual int GetNumberOfCutsNumberOfCuts ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfCuts  of  << this -> NumberOfCuts ) ; return this -> NumberOfCuts ; } ;
## Error: expected ';'!!!

proc GetArrays*(this: var vtkBSPCuts; len: cint; dim: ptr cint; coord: ptr cdouble;
               lower: ptr cint; upper: ptr cint; lowerDataCoord: ptr cdouble;
               upperDataCoord: ptr cdouble; npoints: ptr cint): cint {.
    importcpp: "GetArrays", header: "vtkBSPCuts.h".}
proc Equals*(this: var vtkBSPCuts; other: ptr vtkBSPCuts; tolerance: cdouble = 0.0): cint {.
    importcpp: "Equals", header: "vtkBSPCuts.h".}
proc PrintTree*(this: var vtkBSPCuts) {.importcpp: "PrintTree", header: "vtkBSPCuts.h".}
proc PrintArrays*(this: var vtkBSPCuts) {.importcpp: "PrintArrays",
                                      header: "vtkBSPCuts.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkBSPCuts {.
    importcpp: "vtkBSPCuts::GetData(@)", header: "vtkBSPCuts.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkBSPCuts {.
    importcpp: "vtkBSPCuts::GetData(@)", header: "vtkBSPCuts.h".}
proc Initialize*(this: var vtkBSPCuts) {.importcpp: "Initialize",
                                     header: "vtkBSPCuts.h".}
proc ShallowCopy*(this: var vtkBSPCuts; src: ptr vtkDataObject) {.
    importcpp: "ShallowCopy", header: "vtkBSPCuts.h".}
proc DeepCopy*(this: var vtkBSPCuts; src: ptr vtkDataObject) {.importcpp: "DeepCopy",
    header: "vtkBSPCuts.h".}