## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRegularPolygonSource.h
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
##  @class   vtkRegularPolygonSource
##  @brief   create a regular, n-sided polygon and/or polyline
##
##  vtkRegularPolygonSource is a source object that creates a single n-sided polygon and/or
##  polyline. The polygon is centered at a specified point, orthogonal to
##  a specified normal, and with a circumscribing radius set by the user. The user can
##  also specify the number of sides of the polygon ranging from [3,N].
##
##  This object can be used for seeding streamlines or defining regions for clipping/cutting.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkRegularPolygonSource* {.importcpp: "vtkRegularPolygonSource",
                            header: "vtkRegularPolygonSource.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                    ## *
                                                                                                    ##  Standard methods for instantiation, obtaining type and printing instance values.
                                                                                                    ##
    vtkRegularPolygonSource* {.importc: "vtkRegularPolygonSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRegularPolygonSource {.importcpp: "vtkRegularPolygonSource::New(@)",
                                       header: "vtkRegularPolygonSource.h".}
type
  vtkRegularPolygonSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRegularPolygonSource::IsTypeOf(@)",
    header: "vtkRegularPolygonSource.h".}
proc IsA*(this: var vtkRegularPolygonSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRegularPolygonSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRegularPolygonSource {.
    importcpp: "vtkRegularPolygonSource::SafeDownCast(@)",
    header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRegularPolygonSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRegularPolygonSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRegularPolygonSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRegularPolygonSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRegularPolygonSource.h".}
proc SetNumberOfSides*(this: var vtkRegularPolygonSource; _arg: cint) {.
    importcpp: "SetNumberOfSides", header: "vtkRegularPolygonSource.h".}
proc GetNumberOfSidesMinValue*(this: var vtkRegularPolygonSource): cint {.
    importcpp: "GetNumberOfSidesMinValue", header: "vtkRegularPolygonSource.h".}
proc GetNumberOfSidesMaxValue*(this: var vtkRegularPolygonSource): cint {.
    importcpp: "GetNumberOfSidesMaxValue", header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfSides ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSides  of  << this -> NumberOfSides ) ; return this -> NumberOfSides ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkRegularPolygonSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkRegularPolygonSource.h".}
proc SetCenter*(this: var vtkRegularPolygonSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterNormal*(this: var vtkRegularPolygonSource; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetCenterNormal",
    header: "vtkRegularPolygonSource.h".}
proc SetCenterNormal*(this: var vtkRegularPolygonSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterNormal", header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual double * GetCenterNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetCenterNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ;
## Error: expected ';'!!!

proc SetRadius*(this: var vtkRegularPolygonSource; _arg: cdouble) {.
    importcpp: "SetRadius", header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual double GetNumberOfSidesRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetRadiusGeneratePolygon*(this: var vtkRegularPolygonSource; _arg: vtkTypeBool) {.
    importcpp: "SetRadiusGeneratePolygon", header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfSidesRadiusGeneratePolygon ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePolygon  of  << this -> GeneratePolygon ) ; return this -> GeneratePolygon ; } ;
## Error: expected ';'!!!

proc GeneratePolygonOn*(this: var vtkRegularPolygonSource) {.
    importcpp: "GeneratePolygonOn", header: "vtkRegularPolygonSource.h".}
proc GeneratePolygonOff*(this: var vtkRegularPolygonSource) {.
    importcpp: "GeneratePolygonOff", header: "vtkRegularPolygonSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Control whether a polyline is produced. By default, GeneratePolyline is enabled.
  ##
proc SetRadiusGeneratePolygonGeneratePolyline*(this: var vtkRegularPolygonSource;
    _arg: vtkTypeBool) {.importcpp: "SetRadiusGeneratePolygonGeneratePolyline",
                       header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNumberOfSidesRadiusGeneratePolygonGeneratePolyline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GeneratePolyline  of  << this -> GeneratePolyline ) ; return this -> GeneratePolyline ; } ;
## Error: expected ';'!!!

proc GeneratePolylineOn*(this: var vtkRegularPolygonSource) {.
    importcpp: "GeneratePolylineOn", header: "vtkRegularPolygonSource.h".}
proc GeneratePolylineOff*(this: var vtkRegularPolygonSource) {.
    importcpp: "GeneratePolylineOff", header: "vtkRegularPolygonSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetRadiusGeneratePolygonGeneratePolylineOutputPointsPrecision*(
    this: var vtkRegularPolygonSource; _arg: cint) {.
    importcpp: "SetRadiusGeneratePolygonGeneratePolylineOutputPointsPrecision",
    header: "vtkRegularPolygonSource.h".}
## !!!Ignored construct:  virtual int GetNumberOfSidesRadiusGeneratePolygonGeneratePolylineOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
