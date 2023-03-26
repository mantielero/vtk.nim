## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSampleImplicitFunctionFilter.h
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
##  @class   vtkSampleImplicitFunctionFilter
##  @brief   sample an implicit function over a dataset,
##  generating scalar values and optional gradient vectors
##
##
##  vtkSampleImplicitFunctionFilter is a filter that evaluates an implicit function and
##  (optional) gradients at each point in an input vtkDataSet. The output
##  of the filter are new scalar values (the function values) and the
##  optional vector (function gradient) array.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkSampleFunction vtkImplicitModeller
##

import
  vtkDataSetAlgorithm, vtkFiltersGeneralModule

discard "forward decl of vtkImplicitFunction"
discard "forward decl of vtkDataArray"
type
  vtkSampleImplicitFunctionFilter* {.importcpp: "vtkSampleImplicitFunctionFilter", header: "vtkSampleImplicitFunctionFilter.h",
                                    bycopy.} = object of vtkDataSetAlgorithm ## /@{
                                                                        ## *
                                                                        ##  Standard instantiation, type information, and print methods.
                                                                        ##
    vtkSampleImplicitFunctionFilter* {.importc: "vtkSampleImplicitFunctionFilter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkSampleImplicitFunctionFilter {.
    importcpp: "vtkSampleImplicitFunctionFilter::New(@)",
    header: "vtkSampleImplicitFunctionFilter.h".}
type
  vtkSampleImplicitFunctionFilterSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSampleImplicitFunctionFilter::IsTypeOf(@)",
    header: "vtkSampleImplicitFunctionFilter.h".}
proc IsA*(this: var vtkSampleImplicitFunctionFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSampleImplicitFunctionFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSampleImplicitFunctionFilter {.
    importcpp: "vtkSampleImplicitFunctionFilter::SafeDownCast(@)",
    header: "vtkSampleImplicitFunctionFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSampleImplicitFunctionFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSampleImplicitFunctionFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSampleImplicitFunctionFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSampleImplicitFunctionFilter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkSampleImplicitFunctionFilter.h".}
proc SetImplicitFunction*(this: var vtkSampleImplicitFunctionFilter;
                         a2: ptr vtkImplicitFunction) {.
    importcpp: "SetImplicitFunction", header: "vtkSampleImplicitFunctionFilter.h".}
proc GetnameImplicitFunction*(this: var vtkSampleImplicitFunctionFilter): ptr vtkImplicitFunction {.
    importcpp: "GetnameImplicitFunction",
    header: "vtkSampleImplicitFunctionFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off the computation of gradients.
  ##
proc SetComputeGradients*(this: var vtkSampleImplicitFunctionFilter;
                         _arg: vtkTypeBool) {.importcpp: "SetComputeGradients",
    header: "vtkSampleImplicitFunctionFilter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetComputeGradients ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeGradients  of  << this -> ComputeGradients ) ; return this -> ComputeGradients ; } ;
## Error: expected ';'!!!

proc ComputeGradientsOn*(this: var vtkSampleImplicitFunctionFilter) {.
    importcpp: "ComputeGradientsOn", header: "vtkSampleImplicitFunctionFilter.h".}
proc ComputeGradientsOff*(this: var vtkSampleImplicitFunctionFilter) {.
    importcpp: "ComputeGradientsOff", header: "vtkSampleImplicitFunctionFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the scalar array name for this data set. The initial value is
  ##  "Implicit scalars".
  ##
proc SetScalarArrayName*(this: var vtkSampleImplicitFunctionFilter; _arg: cstring) {.
    importcpp: "SetScalarArrayName", header: "vtkSampleImplicitFunctionFilter.h".}
proc GetScalarArrayName*(this: var vtkSampleImplicitFunctionFilter): cstring {.
    importcpp: "GetScalarArrayName", header: "vtkSampleImplicitFunctionFilter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the gradient array name for this data set. The initial value is
  ##  "Implicit gradients".
  ##
proc SetScalarArrayNameGradientArrayName*(
    this: var vtkSampleImplicitFunctionFilter; _arg: cstring) {.
    importcpp: "SetScalarArrayNameGradientArrayName",
    header: "vtkSampleImplicitFunctionFilter.h".}
proc GetScalarArrayNameGradientArrayName*(
    this: var vtkSampleImplicitFunctionFilter): cstring {.
    importcpp: "GetScalarArrayNameGradientArrayName",
    header: "vtkSampleImplicitFunctionFilter.h".}
  ## /@}
  ## *
  ##  Return the MTime also taking into account the implicit function.
  ##
proc GetMTime*(this: var vtkSampleImplicitFunctionFilter): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkSampleImplicitFunctionFilter.h".}