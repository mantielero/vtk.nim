## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkShrinkFilter.h
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
##  @class   vtkShrinkFilter
##  @brief   shrink cells composing an arbitrary data set
##
##  vtkShrinkFilter shrinks cells composing an arbitrary data set
##  towards their centroid. The centroid of a cell is computed as the
##  average position of the cell points. Shrinking results in
##  disconnecting the cells from one another. The output of this filter
##  is of general dataset type vtkUnstructuredGrid.
##
##  @warning
##  It is possible to turn cells inside out or cause self intersection
##  in special cases.
##
##  @sa
##  vtkShrinkPolyData
##

import
  vtkFiltersGeneralModule, vtkUnstructuredGridAlgorithm

type
  vtkShrinkFilter* {.importcpp: "vtkShrinkFilter", header: "vtkShrinkFilter.h",
                    bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkShrinkFilter* {.importc: "vtkShrinkFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkShrinkFilter {.importcpp: "vtkShrinkFilter::New(@)",
                               header: "vtkShrinkFilter.h".}
type
  vtkShrinkFilterSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkShrinkFilter::IsTypeOf(@)", header: "vtkShrinkFilter.h".}
proc IsA*(this: var vtkShrinkFilter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkShrinkFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkShrinkFilter {.
    importcpp: "vtkShrinkFilter::SafeDownCast(@)", header: "vtkShrinkFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkShrinkFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkShrinkFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkShrinkFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkShrinkFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkShrinkFilter.h".}
proc SetShrinkFactor*(this: var vtkShrinkFilter; _arg: cdouble) {.
    importcpp: "SetShrinkFactor", header: "vtkShrinkFilter.h".}
proc GetShrinkFactorMinValue*(this: var vtkShrinkFilter): cdouble {.
    importcpp: "GetShrinkFactorMinValue", header: "vtkShrinkFilter.h".}
proc GetShrinkFactorMaxValue*(this: var vtkShrinkFilter): cdouble {.
    importcpp: "GetShrinkFactorMaxValue", header: "vtkShrinkFilter.h".}
## !!!Ignored construct:  virtual double GetShrinkFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShrinkFactor  of  << this -> ShrinkFactor ) ; return this -> ShrinkFactor ; } ;
## Error: expected ';'!!!
