## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPassThroughEdgeStrategy.h
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
##  @class   vtkPassThroughEdgeStrategy
##  @brief   passes edge routing information through
##
##
##  Simply passes existing edge layout information from the input to the
##  output without making changes.
##

import
  vtkEdgeLayoutStrategy, vtkInfovisLayoutModule

type
  vtkPassThroughEdgeStrategy* {.importcpp: "vtkPassThroughEdgeStrategy",
                               header: "vtkPassThroughEdgeStrategy.h", bycopy.} = object of vtkEdgeLayoutStrategy
    vtkPassThroughEdgeStrategy* {.importc: "vtkPassThroughEdgeStrategy".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPassThroughEdgeStrategy {.
    importcpp: "vtkPassThroughEdgeStrategy::New(@)",
    header: "vtkPassThroughEdgeStrategy.h".}
type
  vtkPassThroughEdgeStrategySuperclass* = vtkEdgeLayoutStrategy

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPassThroughEdgeStrategy::IsTypeOf(@)",
    header: "vtkPassThroughEdgeStrategy.h".}
proc IsA*(this: var vtkPassThroughEdgeStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPassThroughEdgeStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPassThroughEdgeStrategy {.
    importcpp: "vtkPassThroughEdgeStrategy::SafeDownCast(@)",
    header: "vtkPassThroughEdgeStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPassThroughEdgeStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkEdgeLayoutStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPassThroughEdgeStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPassThroughEdgeStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPassThroughEdgeStrategy; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPassThroughEdgeStrategy.h".}
proc Layout*(this: var vtkPassThroughEdgeStrategy) {.importcpp: "Layout",
    header: "vtkPassThroughEdgeStrategy.h".}