## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInterpolateDataSetAttributes.h
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
##  @class   vtkInterpolateDataSetAttributes
##  @brief   interpolate scalars, vectors, etc. and other dataset attributes
##
##  vtkInterpolateDataSetAttributes is a filter that interpolates data set
##  attribute values between input data sets. The input to the filter
##  must be datasets of the same type, same number of cells, and same
##  number of points. The output of the filter is a data set of the same
##  type as the input dataset and whose attribute values have been
##  interpolated at the parametric value specified.
##
##  The filter is used by specifying two or more input data sets (total of N),
##  and a parametric value t (0 <= t <= N-1). The output will contain
##  interpolated data set attributes common to all input data sets. (For
##  example, if one input has scalars and vectors, and another has just
##  scalars, then only scalars will be interpolated and output.)
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkDataSetCollection"
type
  vtkInterpolateDataSetAttributes* {.importcpp: "vtkInterpolateDataSetAttributes", header: "vtkInterpolateDataSetAttributes.h",
                                    bycopy.} = object of vtkDataSetAlgorithm
    vtkInterpolateDataSetAttributes* {.importc: "vtkInterpolateDataSetAttributes".}: VTK_NEWINSTANCE
    ##  list of data sets to interpolate
    ##  interpolation parameter


proc New*(): ptr vtkInterpolateDataSetAttributes {.
    importcpp: "vtkInterpolateDataSetAttributes::New(@)",
    header: "vtkInterpolateDataSetAttributes.h".}
type
  vtkInterpolateDataSetAttributesSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInterpolateDataSetAttributes::IsTypeOf(@)",
    header: "vtkInterpolateDataSetAttributes.h".}
proc IsA*(this: var vtkInterpolateDataSetAttributes; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInterpolateDataSetAttributes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInterpolateDataSetAttributes {.
    importcpp: "vtkInterpolateDataSetAttributes::SafeDownCast(@)",
    header: "vtkInterpolateDataSetAttributes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInterpolateDataSetAttributes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInterpolateDataSetAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInterpolateDataSetAttributes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInterpolateDataSetAttributes; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInterpolateDataSetAttributes.h".}
proc GetInputList*(this: var vtkInterpolateDataSetAttributes): ptr vtkDataSetCollection {.
    importcpp: "GetInputList", header: "vtkInterpolateDataSetAttributes.h".}
proc SetT*(this: var vtkInterpolateDataSetAttributes; _arg: cdouble) {.
    importcpp: "SetT", header: "vtkInterpolateDataSetAttributes.h".}
proc GetTMinValue*(this: var vtkInterpolateDataSetAttributes): cdouble {.
    importcpp: "GetTMinValue", header: "vtkInterpolateDataSetAttributes.h".}
proc GetTMaxValue*(this: var vtkInterpolateDataSetAttributes): cdouble {.
    importcpp: "GetTMaxValue", header: "vtkInterpolateDataSetAttributes.h".}
## !!!Ignored construct:  virtual double GetT ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << T  of  << this -> T ) ; return this -> T ; } ;
## Error: expected ';'!!!
