## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSource.h
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
##  @class   vtkPointSource
##  @brief   create a random cloud of points
##
##  vtkPointSource is a source object that creates a user-specified number of
##  points within a specified radius about a specified center point.  By
##  default the location of the points is random within the sphere. It is also
##  possible to generate random points only on the surface of the sphere; or a
##  exponential distribution weighted towards the center point. The output
##  PolyData has the specified number of points and a single cell - a
##  vtkPolyVertex cell referencing all of the points.
##
##  @note
##  If Lambda set to zero, a uniform distribution is used. Negative lambda
##  values are allowed, but the distribution function becomes inverted.
##
##  @note
##  If you desire to create complex point clouds (e.g., stellar distributions)
##  then use multiple point sources and then append them together using the
##  an append filter (e.g., vtkAppendPolyData).
##
##  @sa
##  vtkAppendPolyData
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

const
  VTK_POINT_SHELL* = 0
  VTK_POINT_UNIFORM* = 1
  VTK_POINT_EXPONENTIAL* = 2

discard "forward decl of vtkRandomSequence"
type
  vtkPointSource* {.importcpp: "vtkPointSource", header: "vtkPointSource.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                             ## *
                                                                                                             ##  Standard methods for instantiation, type information, and printing.
                                                                                                             ##
    vtkPointSource* {.importc: "vtkPointSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPointSource {.importcpp: "vtkPointSource::New(@)",
                              header: "vtkPointSource.h".}
type
  vtkPointSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPointSource::IsTypeOf(@)", header: "vtkPointSource.h".}
proc IsA*(this: var vtkPointSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPointSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPointSource {.
    importcpp: "vtkPointSource::SafeDownCast(@)", header: "vtkPointSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPointSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPointSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPointSource.h".}
proc SetNumberOfPoints*(this: var vtkPointSource; _arg: vtkIdType) {.
    importcpp: "SetNumberOfPoints", header: "vtkPointSource.h".}
proc GetNumberOfPointsMinValue*(this: var vtkPointSource): vtkIdType {.
    importcpp: "GetNumberOfPointsMinValue", header: "vtkPointSource.h".}
proc GetNumberOfPointsMaxValue*(this: var vtkPointSource): vtkIdType {.
    importcpp: "GetNumberOfPointsMaxValue", header: "vtkPointSource.h".}
## !!!Ignored construct:  virtual vtkIdType GetNumberOfPoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPoints  of  << this -> NumberOfPoints ) ; return this -> NumberOfPoints ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkPointSource; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenter", header: "vtkPointSource.h".}
proc SetCenter*(this: var vtkPointSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkPointSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetNumberOfPointsRadius*(this: var vtkPointSource; _arg: cdouble) {.
    importcpp: "SetNumberOfPointsRadius", header: "vtkPointSource.h".}
proc GetNumberOfPointsMinValueRadiusMinValue*(this: var vtkPointSource): cdouble {.
    importcpp: "GetNumberOfPointsMinValueRadiusMinValue",
    header: "vtkPointSource.h".}
proc GetNumberOfPointsMaxValueRadiusMaxValue*(this: var vtkPointSource): cdouble {.
    importcpp: "GetNumberOfPointsMaxValueRadiusMaxValue",
    header: "vtkPointSource.h".}
## !!!Ignored construct:  virtual double GetNumberOfPointsRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetNumberOfPointsRadiusDistribution*(this: var vtkPointSource; _arg: cint) {.
    importcpp: "SetNumberOfPointsRadiusDistribution", header: "vtkPointSource.h".}
proc GetNumberOfPointsMinValueRadiusMinValueDistributionMinValue*(
    this: var vtkPointSource): cint {.importcpp: "GetNumberOfPointsMinValueRadiusMinValueDistributionMinValue",
                                  header: "vtkPointSource.h".}
proc GetNumberOfPointsMaxValueRadiusMaxValueDistributionMaxValue*(
    this: var vtkPointSource): cint {.importcpp: "GetNumberOfPointsMaxValueRadiusMaxValueDistributionMaxValue",
                                  header: "vtkPointSource.h".}
proc SetDistributionToShell*(this: var vtkPointSource) {.
    importcpp: "SetDistributionToShell", header: "vtkPointSource.h".}
proc SetDistributionToUniform*(this: var vtkPointSource) {.
    importcpp: "SetDistributionToUniform", header: "vtkPointSource.h".}
proc SetDistributionToExponential*(this: var vtkPointSource) {.
    importcpp: "SetDistributionToExponential", header: "vtkPointSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfPointsRadiusDistribution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Distribution  of  << this -> Distribution ) ; return this -> Distribution ; } ;
## Error: expected ';'!!!

proc SetLambda*(this: var vtkPointSource; _arg: cdouble) {.importcpp: "SetLambda",
    header: "vtkPointSource.h".}
## !!!Ignored construct:  virtual double GetNumberOfPointsRadiusDistributionLambda ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Lambda  of  << this -> Lambda ) ; return this -> Lambda ; } ;
## Error: expected ';'!!!

proc SetLambdaOutputPointsPrecision*(this: var vtkPointSource; _arg: cint) {.
    importcpp: "SetLambdaOutputPointsPrecision", header: "vtkPointSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfPointsRadiusDistributionLambdaOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc SetRandomSequence*(this: var vtkPointSource;
                       randomSequence: ptr vtkRandomSequence) {.
    importcpp: "SetRandomSequence", header: "vtkPointSource.h".}
proc GetnameRandomSequence*(this: var vtkPointSource): ptr vtkRandomSequence {.
    importcpp: "GetnameRandomSequence", header: "vtkPointSource.h".}
  ## /@}