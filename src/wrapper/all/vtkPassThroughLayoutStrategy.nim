## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPassThroughLayoutStrategy.h
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
##  @class   vtkPassThroughLayoutStrategy
##  @brief   a layout strategy that does absolutely nothing
##
##
##  Yes, this incredible strategy does absoluted nothing to the data
##  so in affect passes through the graph untouched. This strategy
##  is useful in the cases where the graph is already laid out.
##

import
  vtkGraphLayoutStrategy, vtkInfovisLayoutModule

type
  vtkPassThroughLayoutStrategy* {.importcpp: "vtkPassThroughLayoutStrategy",
                                 header: "vtkPassThroughLayoutStrategy.h", bycopy.} = object of vtkGraphLayoutStrategy
    vtkPassThroughLayoutStrategy* {.importc: "vtkPassThroughLayoutStrategy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPassThroughLayoutStrategy {.
    importcpp: "vtkPassThroughLayoutStrategy::New(@)",
    header: "vtkPassThroughLayoutStrategy.h".}
type
  vtkPassThroughLayoutStrategySuperclass* = vtkGraphLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPassThroughLayoutStrategy::IsTypeOf(@)",
    header: "vtkPassThroughLayoutStrategy.h".}
proc IsA*(this: var vtkPassThroughLayoutStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPassThroughLayoutStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPassThroughLayoutStrategy {.
    importcpp: "vtkPassThroughLayoutStrategy::SafeDownCast(@)",
    header: "vtkPassThroughLayoutStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPassThroughLayoutStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPassThroughLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPassThroughLayoutStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPassThroughLayoutStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPassThroughLayoutStrategy.h".}
proc Initialize*(this: var vtkPassThroughLayoutStrategy) {.importcpp: "Initialize",
    header: "vtkPassThroughLayoutStrategy.h".}
proc Layout*(this: var vtkPassThroughLayoutStrategy) {.importcpp: "Layout",
    header: "vtkPassThroughLayoutStrategy.h".}
proc IsLayoutComplete*(this: var vtkPassThroughLayoutStrategy): cint {.
    importcpp: "IsLayoutComplete", header: "vtkPassThroughLayoutStrategy.h".}