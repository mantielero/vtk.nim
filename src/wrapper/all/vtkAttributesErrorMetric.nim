## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAttributesErrorMetric.h
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
##  @class   vtkAttributesErrorMetric
##  @brief    Objects that compute
##  attribute-based error during cell tessellation.
##
##
##  It is a concrete error metric, based on an attribute criterium:
##  the variation of the active attribute/component value from a linear ramp
##
##  @sa
##  vtkGenericCellTessellator vtkGenericSubdivisionErrorMetric
##

import
  vtkCommonDataModelModule, vtkGenericSubdivisionErrorMetric

discard "forward decl of vtkGenericAttributeCollection"
discard "forward decl of vtkGenericDataSet"
type
  vtkAttributesErrorMetric* {.importcpp: "vtkAttributesErrorMetric",
                             header: "vtkAttributesErrorMetric.h", bycopy.} = object of vtkGenericSubdivisionErrorMetric ## *
                                                                                                                  ##  Construct the error metric with a default relative attribute accuracy
                                                                                                                  ##  equal to 0.1.
                                                                                                                  ##
    vtkAttributesErrorMetric* {.importc: "vtkAttributesErrorMetric".}: VTK_NEWINSTANCE
    ##  cached value computed from
    ##  AttributeTolerance and active attribute/component
    ##  cached value computed from active attribute/component


proc New*(): ptr vtkAttributesErrorMetric {.importcpp: "vtkAttributesErrorMetric::New(@)",
                                        header: "vtkAttributesErrorMetric.h".}
type
  vtkAttributesErrorMetricSuperclass* = vtkGenericSubdivisionErrorMetric

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAttributesErrorMetric::IsTypeOf(@)",
    header: "vtkAttributesErrorMetric.h".}
proc IsA*(this: var vtkAttributesErrorMetric; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAttributesErrorMetric.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAttributesErrorMetric {.
    importcpp: "vtkAttributesErrorMetric::SafeDownCast(@)",
    header: "vtkAttributesErrorMetric.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAttributesErrorMetric :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGenericSubdivisionErrorMetric :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAttributesErrorMetric :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAttributesErrorMetric :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAttributesErrorMetric; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAttributesErrorMetric.h".}
## !!!Ignored construct:  /@} /@{ *
##  Absolute tolerance of the active scalar (attribute+component).
##  Subdivision is required if the square distance between the real attribute
##  at the mid point on the edge and the interpolated attribute is greater
##  than AbsoluteAttributeTolerance.
##  This is the attribute accuracy.
##  0.01 will give better result than 0.1.
##  virtual double GetAbsoluteAttributeToleranceAbsoluteAttributeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AbsoluteAttributeTolerance  of  << this -> AbsoluteAttributeTolerance ) ; return this -> AbsoluteAttributeTolerance ; } ;
## Error: expected ';'!!!

proc SetAbsoluteAttributeTolerance*(this: var vtkAttributesErrorMetric;
                                   value: cdouble) {.
    importcpp: "SetAbsoluteAttributeTolerance",
    header: "vtkAttributesErrorMetric.h".}
## !!!Ignored construct:  /@{ *
##  Relative tolerance of the active scalar (attribute+component).
##  Subdivision is required if the square distance between the real attribute
##  at the mid point on the edge and the interpolated attribute is greater
##  than AttributeTolerance.
##  This is the attribute accuracy.
##  0.01 will give better result than 0.1.
##  virtual double GetAbsoluteAttributeToleranceAbsoluteAttributeToleranceAttributeToleranceAttributeTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeTolerance  of  << this -> AttributeTolerance ) ; return this -> AttributeTolerance ; } ;
## Error: expected ';'!!!

proc SetAttributeTolerance*(this: var vtkAttributesErrorMetric; value: cdouble) {.
    importcpp: "SetAttributeTolerance", header: "vtkAttributesErrorMetric.h".}
proc RequiresEdgeSubdivision*(this: var vtkAttributesErrorMetric;
                             leftPoint: ptr cdouble; midPoint: ptr cdouble;
                             rightPoint: ptr cdouble; alpha: cdouble): cint {.
    importcpp: "RequiresEdgeSubdivision", header: "vtkAttributesErrorMetric.h".}
proc GetError*(this: var vtkAttributesErrorMetric; leftPoint: ptr cdouble;
              midPoint: ptr cdouble; rightPoint: ptr cdouble; alpha: cdouble): cdouble {.
    importcpp: "GetError", header: "vtkAttributesErrorMetric.h".}