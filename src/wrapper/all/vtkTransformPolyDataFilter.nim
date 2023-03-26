## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformPolyDataFilter.h
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
##  @class   vtkTransformPolyDataFilter
##  @brief   transform points and associated normals and vectors for polygonal dataset
##
##  vtkTransformPolyDataFilter is a filter to transform point
##  coordinates and associated point and cell normals and
##  vectors. Other point and cell data is passed through the filter
##  unchanged. This filter is specialized for polygonal data. See
##  vtkTransformFilter for more general data.
##
##  An alternative method of transformation is to use vtkActor's methods
##  to scale, rotate, and translate objects. The difference between the
##  two methods is that vtkActor's transformation simply effects where
##  objects are rendered (via the graphics pipeline), whereas
##  vtkTransformPolyDataFilter actually modifies point coordinates in the
##  visualization pipeline. This is necessary for some objects
##  (e.g., vtkProbeFilter) that require point coordinates as input.
##
##  @sa
##  vtkTransform vtkTransformFilter vtkActor
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

discard "forward decl of vtkAbstractTransform"
type
  vtkTransformPolyDataFilter* {.importcpp: "vtkTransformPolyDataFilter",
                               header: "vtkTransformPolyDataFilter.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                          ## *
                                                                                                          ##  Standard methods for instantiation, obtaining type information, and
                                                                                                          ##  printing.
                                                                                                          ##
    vtkTransformPolyDataFilter* {.importc: "vtkTransformPolyDataFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransformPolyDataFilter {.
    importcpp: "vtkTransformPolyDataFilter::New(@)",
    header: "vtkTransformPolyDataFilter.h".}
type
  vtkTransformPolyDataFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransformPolyDataFilter::IsTypeOf(@)",
    header: "vtkTransformPolyDataFilter.h".}
proc IsA*(this: var vtkTransformPolyDataFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransformPolyDataFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransformPolyDataFilter {.
    importcpp: "vtkTransformPolyDataFilter::SafeDownCast(@)",
    header: "vtkTransformPolyDataFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransformPolyDataFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformPolyDataFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformPolyDataFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransformPolyDataFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkTransformPolyDataFilter.h".}
proc GetMTime*(this: var vtkTransformPolyDataFilter): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkTransformPolyDataFilter.h".}
proc SetTransform*(this: var vtkTransformPolyDataFilter;
                  a2: ptr vtkAbstractTransform) {.importcpp: "SetTransform",
    header: "vtkTransformPolyDataFilter.h".}
proc GetnameTransform*(this: var vtkTransformPolyDataFilter): ptr vtkAbstractTransform {.
    importcpp: "GetnameTransform", header: "vtkTransformPolyDataFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output types. See the documentation
  ##  for the vtkAlgorithm::DesiredOutputPrecision enum for an explanation of
  ##  the available precision settings.
  ##
proc SetOutputPointsPrecision*(this: var vtkTransformPolyDataFilter; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkTransformPolyDataFilter.h".}
## !!!Ignored construct:  virtual int GetOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
