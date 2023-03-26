## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOutlineCornerFilter.h
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
##  @class   vtkOutlineCornerFilter
##  @brief   create wireframe outline corners for arbitrary data set
##
##  vtkOutlineCornerFilter is a filter that generates wireframe outline corners of any
##  data set. The outline consists of the eight corners of the dataset
##  bounding box.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

discard "forward decl of vtkOutlineCornerSource"
type
  vtkOutlineCornerFilter* {.importcpp: "vtkOutlineCornerFilter",
                           header: "vtkOutlineCornerFilter.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkOutlineCornerFilter* {.importc: "vtkOutlineCornerFilter".}: VTK_NEWINSTANCE

  vtkOutlineCornerFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOutlineCornerFilter::IsTypeOf(@)",
    header: "vtkOutlineCornerFilter.h".}
proc IsA*(this: var vtkOutlineCornerFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkOutlineCornerFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOutlineCornerFilter {.
    importcpp: "vtkOutlineCornerFilter::SafeDownCast(@)",
    header: "vtkOutlineCornerFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOutlineCornerFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOutlineCornerFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOutlineCornerFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOutlineCornerFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOutlineCornerFilter.h".}
proc New*(): ptr vtkOutlineCornerFilter {.importcpp: "vtkOutlineCornerFilter::New(@)",
                                      header: "vtkOutlineCornerFilter.h".}
proc SetCornerFactor*(this: var vtkOutlineCornerFilter; _arg: cdouble) {.
    importcpp: "SetCornerFactor", header: "vtkOutlineCornerFilter.h".}
proc GetCornerFactorMinValue*(this: var vtkOutlineCornerFilter): cdouble {.
    importcpp: "GetCornerFactorMinValue", header: "vtkOutlineCornerFilter.h".}
proc GetCornerFactorMaxValue*(this: var vtkOutlineCornerFilter): cdouble {.
    importcpp: "GetCornerFactorMaxValue", header: "vtkOutlineCornerFilter.h".}
## !!!Ignored construct:  virtual double GetCornerFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CornerFactor  of  << this -> CornerFactor ) ; return this -> CornerFactor ; } ;
## Error: expected ';'!!!
