## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSphereSource.h
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
##  @class   vtkSphereSource
##  @brief   create a polygonal sphere centered at the origin
##
##  vtkSphereSource creates a sphere (represented by polygons) of specified
##  radius centered at the origin. The resolution (polygonal discretization)
##  in both the latitude (phi) and longitude (theta) directions can be
##  specified. It also is possible to create partial spheres by specifying
##  maximum phi and theta angles. By default, the surface tessellation of
##  the sphere uses triangles; however you can set LatLongTessellation to
##  produce a tessellation using quadrilaterals.
##
##  @warning
##  Resolution means the number of latitude or longitude lines for a complete
##  sphere. If you create partial spheres the number of latitude/longitude
##  lines may be off by one.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkSphereSource* {.importcpp: "vtkSphereSource", header: "vtkSphereSource.h",
                    bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                         ## *
                                                         ##  Standard methods for obtaining type information, and printing.
                                                         ##
    vtkSphereSource* {.importc: "vtkSphereSource".}: VTK_NEWINSTANCE

  vtkSphereSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSphereSource::IsTypeOf(@)", header: "vtkSphereSource.h".}
proc IsA*(this: var vtkSphereSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSphereSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSphereSource {.
    importcpp: "vtkSphereSource::SafeDownCast(@)", header: "vtkSphereSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSphereSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSphereSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSphereSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSphereSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSphereSource.h".}
proc New*(): ptr vtkSphereSource {.importcpp: "vtkSphereSource::New(@)",
                               header: "vtkSphereSource.h".}
proc SetRadius*(this: var vtkSphereSource; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkSphereSource.h".}
proc GetRadiusMinValue*(this: var vtkSphereSource): cdouble {.
    importcpp: "GetRadiusMinValue", header: "vtkSphereSource.h".}
proc GetRadiusMaxValue*(this: var vtkSphereSource): cdouble {.
    importcpp: "GetRadiusMaxValue", header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkSphereSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter", header: "vtkSphereSource.h".}
proc SetCenter*(this: var vtkSphereSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolution*(this: var vtkSphereSource; _arg: cint) {.
    importcpp: "SetRadiusThetaResolution", header: "vtkSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValue*(this: var vtkSphereSource): cint {.
    importcpp: "GetRadiusMinValueThetaResolutionMinValue",
    header: "vtkSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValue*(this: var vtkSphereSource): cint {.
    importcpp: "GetRadiusMaxValueThetaResolutionMaxValue",
    header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual int GetRadiusThetaResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaResolution  of  << this -> ThetaResolution ) ; return this -> ThetaResolution ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolution*(this: var vtkSphereSource; _arg: cint) {.
    importcpp: "SetRadiusThetaResolutionPhiResolution",
    header: "vtkSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValue*(
    this: var vtkSphereSource): cint {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValue",
                                   header: "vtkSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValue*(
    this: var vtkSphereSource): cint {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValue",
                                   header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual int GetRadiusThetaResolutionPhiResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiResolution  of  << this -> PhiResolution ) ; return this -> PhiResolution ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolutionStartTheta*(this: var vtkSphereSource;
    _arg: cdouble) {.importcpp: "SetRadiusThetaResolutionPhiResolutionStartTheta",
                   header: "vtkSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValue",
                                      header: "vtkSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValue",
                                      header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadiusThetaResolutionPhiResolutionStartTheta ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartTheta  of  << this -> StartTheta ) ; return this -> StartTheta ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolutionStartThetaEndTheta*(
    this: var vtkSphereSource; _arg: cdouble) {.
    importcpp: "SetRadiusThetaResolutionPhiResolutionStartThetaEndTheta",
    header: "vtkSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValueEndThetaMinValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValueEndThetaMinValue",
                                      header: "vtkSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValueEndThetaMaxValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValueEndThetaMaxValue",
                                      header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadiusThetaResolutionPhiResolutionStartThetaEndTheta ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndTheta  of  << this -> EndTheta ) ; return this -> EndTheta ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhi*(
    this: var vtkSphereSource; _arg: cdouble) {.importcpp: "SetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhi",
    header: "vtkSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValueEndThetaMinValueStartPhiMinValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValueEndThetaMinValueStartPhiMinValue",
                                      header: "vtkSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValueEndThetaMaxValueStartPhiMaxValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValueEndThetaMaxValueStartPhiMaxValue",
                                      header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhi ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartPhi  of  << this -> StartPhi ) ; return this -> StartPhi ; } ;
## Error: expected ';'!!!

proc SetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhiEndPhi*(
    this: var vtkSphereSource; _arg: cdouble) {.importcpp: "SetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhiEndPhi",
    header: "vtkSphereSource.h".}
proc GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValueEndThetaMinValueStartPhiMinValueEndPhiMinValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMinValueThetaResolutionMinValuePhiResolutionMinValueStartThetaMinValueEndThetaMinValueStartPhiMinValueEndPhiMinValue",
                                      header: "vtkSphereSource.h".}
proc GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValueEndThetaMaxValueStartPhiMaxValueEndPhiMaxValue*(
    this: var vtkSphereSource): cdouble {.importcpp: "GetRadiusMaxValueThetaResolutionMaxValuePhiResolutionMaxValueStartThetaMaxValueEndThetaMaxValueStartPhiMaxValueEndPhiMaxValue",
                                      header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual double GetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhiEndPhi ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EndPhi  of  << this -> EndPhi ) ; return this -> EndPhi ; } ;
## Error: expected ';'!!!

proc SetLatLongTessellation*(this: var vtkSphereSource; _arg: vtkTypeBool) {.
    importcpp: "SetLatLongTessellation", header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhiEndPhiLatLongTessellation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LatLongTessellation  of  << this -> LatLongTessellation ) ; return this -> LatLongTessellation ; } ;
## Error: expected ';'!!!

proc LatLongTessellationOn*(this: var vtkSphereSource) {.
    importcpp: "LatLongTessellationOn", header: "vtkSphereSource.h".}
proc LatLongTessellationOff*(this: var vtkSphereSource) {.
    importcpp: "LatLongTessellationOff", header: "vtkSphereSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetLatLongTessellationOutputPointsPrecision*(this: var vtkSphereSource;
    _arg: cint) {.importcpp: "SetLatLongTessellationOutputPointsPrecision",
                header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual int GetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhiEndPhiLatLongTessellationOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc SetLatLongTessellationOutputPointsPrecisionGenerateNormals*(
    this: var vtkSphereSource; _arg: vtkTypeBool) {.
    importcpp: "SetLatLongTessellationOutputPointsPrecisionGenerateNormals",
    header: "vtkSphereSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetRadiusThetaResolutionPhiResolutionStartThetaEndThetaStartPhiEndPhiLatLongTessellationOutputPointsPrecisionGenerateNormals ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateNormals  of  << this -> GenerateNormals ) ; return this -> GenerateNormals ; } ;
## Error: expected ';'!!!

proc GenerateNormalsOn*(this: var vtkSphereSource) {.importcpp: "GenerateNormalsOn",
    header: "vtkSphereSource.h".}
proc GenerateNormalsOff*(this: var vtkSphereSource) {.
    importcpp: "GenerateNormalsOff", header: "vtkSphereSource.h".}
  ## /@}