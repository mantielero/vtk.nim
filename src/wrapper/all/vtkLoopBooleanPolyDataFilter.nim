## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLoopBooleanPolyDataFilter.h
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
##  @class   vtkLoopBooleanPolyDataFilter
##
##
##  Computes the boundary of the union, intersection, or difference
##  volume computed from the volumes defined by two input surfaces. The
##  two surfaces do not need to be manifold, but if they are not,
##  unexpected results may be obtained. The resulting surface is
##  available in the first output of the filter. The second output
##  contains a set of polylines that represent the intersection between
##  the two input surfaces.
##  The filter uses vtkIntersectionPolyDataFilter. Must have information
##  about the cells on mesh that the intersection lines touch. Filter assumes
##  this information is given.
##  The output result will have data about the Original Surface,
##  BoundaryPoints, Boundary Cells,
##  Free Edges, and Bad Triangles
##

import
  vtkDataSetAttributes, vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkIdList"
type
  vtkLoopBooleanPolyDataFilter* {.importcpp: "vtkLoopBooleanPolyDataFilter",
                                 header: "vtkLoopBooleanPolyDataFilter.h", bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                                                                              ##  Construct object that computes the boolean surface.
                                                                                                              ##
    vtkLoopBooleanPolyDataFilter* {.importc: "vtkLoopBooleanPolyDataFilter".}: VTK_NEWINSTANCE
    ## /@}


proc New*(): ptr vtkLoopBooleanPolyDataFilter {.
    importcpp: "vtkLoopBooleanPolyDataFilter::New(@)",
    header: "vtkLoopBooleanPolyDataFilter.h".}
type
  vtkLoopBooleanPolyDataFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLoopBooleanPolyDataFilter::IsTypeOf(@)",
    header: "vtkLoopBooleanPolyDataFilter.h".}
proc IsA*(this: var vtkLoopBooleanPolyDataFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLoopBooleanPolyDataFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLoopBooleanPolyDataFilter {.
    importcpp: "vtkLoopBooleanPolyDataFilter::SafeDownCast(@)",
    header: "vtkLoopBooleanPolyDataFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLoopBooleanPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLoopBooleanPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLoopBooleanPolyDataFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLoopBooleanPolyDataFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkLoopBooleanPolyDataFilter.h".}
## !!!Ignored construct:  /@{ *
##  Integer describing the number of intersection points and lines
##  virtual int GetNumberOfIntersectionPointsNumberOfIntersectionPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIntersectionPoints  of  << this -> NumberOfIntersectionPoints ) ; return this -> NumberOfIntersectionPoints ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int GetNumberOfIntersectionPointsNumberOfIntersectionPointsNumberOfIntersectionLines ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfIntersectionLines  of  << this -> NumberOfIntersectionLines ) ; return this -> NumberOfIntersectionLines ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  ONLY USED IF NO INTERSECTION BETWEEN SURFACES
##  Variable to determine what is output if no intersection occurs.
##  0 = neither (default), 1 = first, 2 = second, 3 = both
##  virtual int GetNumberOfIntersectionPointsNumberOfIntersectionPointsNumberOfIntersectionLinesNoIntersectionOutputNoIntersectionOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NoIntersectionOutput  of  << this -> NoIntersectionOutput ) ; return this -> NoIntersectionOutput ; } ;
## Error: expected ';'!!!

proc SetNoIntersectionOutput*(this: var vtkLoopBooleanPolyDataFilter; _arg: cint) {.
    importcpp: "SetNoIntersectionOutput", header: "vtkLoopBooleanPolyDataFilter.h".}
proc NoIntersectionOutputOn*(this: var vtkLoopBooleanPolyDataFilter) {.
    importcpp: "NoIntersectionOutputOn", header: "vtkLoopBooleanPolyDataFilter.h".}
proc NoIntersectionOutputOff*(this: var vtkLoopBooleanPolyDataFilter) {.
    importcpp: "NoIntersectionOutputOff", header: "vtkLoopBooleanPolyDataFilter.h".}
  ## /@}
  ##  Union intersection, or difference
type
  vtkLoopBooleanPolyDataFilterOperationType* {.size: sizeof(cint),
      importcpp: "vtkLoopBooleanPolyDataFilter::OperationType",
      header: "vtkLoopBooleanPolyDataFilter.h".} = enum
    VTK_UNION = 0, VTK_INTERSECTION, VTK_DIFFERENCE


type
  vtkLoopBooleanPolyDataFilterNoIntersectionOutputType* {.size: sizeof(cint),
      importcpp: "vtkLoopBooleanPolyDataFilter::NoIntersectionOutputType",
      header: "vtkLoopBooleanPolyDataFilter.h".} = enum
    VTK_NEITHER = 0, VTK_FIRST, VTK_SECOND, VTK_BOTH


proc SetOperation*(this: var vtkLoopBooleanPolyDataFilter; _arg: cint) {.
    importcpp: "SetOperation", header: "vtkLoopBooleanPolyDataFilter.h".}
proc GetOperationMinValue*(this: var vtkLoopBooleanPolyDataFilter): cint {.
    importcpp: "GetOperationMinValue", header: "vtkLoopBooleanPolyDataFilter.h".}
proc GetOperationMaxValue*(this: var vtkLoopBooleanPolyDataFilter): cint {.
    importcpp: "GetOperationMaxValue", header: "vtkLoopBooleanPolyDataFilter.h".}
## !!!Ignored construct:  virtual int GetNumberOfIntersectionPointsNumberOfIntersectionPointsNumberOfIntersectionLinesNoIntersectionOutputNoIntersectionOutputOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operation  of  << this -> Operation ) ; return this -> Operation ; } ;
## Error: expected ';'!!!

proc SetOperationToUnion*(this: var vtkLoopBooleanPolyDataFilter) {.
    importcpp: "SetOperationToUnion", header: "vtkLoopBooleanPolyDataFilter.h".}
proc SetOperationToIntersection*(this: var vtkLoopBooleanPolyDataFilter) {.
    importcpp: "SetOperationToIntersection",
    header: "vtkLoopBooleanPolyDataFilter.h".}
proc SetOperationToDifference*(this: var vtkLoopBooleanPolyDataFilter) {.
    importcpp: "SetOperationToDifference",
    header: "vtkLoopBooleanPolyDataFilter.h".}
## !!!Ignored construct:  /@} /@{ *
##  Check the status of the filter after update. If the status is zero,
##  there was an error in the operation. If status is one, everything
##  went smoothly
##  virtual int GetNumberOfIntersectionPointsNumberOfIntersectionPointsNumberOfIntersectionLinesNoIntersectionOutputNoIntersectionOutputOperationStatusStatus ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Status  of  << this -> Status ) ; return this -> Status ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set the tolerance for geometric tests
##  virtual double GetNumberOfIntersectionPointsNumberOfIntersectionPointsNumberOfIntersectionLinesNoIntersectionOutputNoIntersectionOutputOperationStatusStatusToleranceTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ;
## Error: expected ';'!!!

proc SetNoIntersectionOutputTolerance*(this: var vtkLoopBooleanPolyDataFilter;
                                      _arg: cdouble) {.
    importcpp: "SetNoIntersectionOutputTolerance",
    header: "vtkLoopBooleanPolyDataFilter.h".}
  ## /@}