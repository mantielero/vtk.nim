## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCapsuleSource.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## =========================================================================
##
##   Program: Bender
##   Copyright (c) Kitware Inc.
##
##   Licensed under the Apache License, Version 2.0 (the "License");
##   you may not use this file except in compliance with the License.
##   You may obtain a copy of the License at
##
##       http://www.apache.org/licenses/LICENSE-2.0.txt
##
##   Unless required by applicable law or agreed to in writing, software
##   distributed under the License is distributed on an "AS IS" BASIS,
##   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##   See the License for the specific language governing permissions and
##   limitations under the License.
##
## =========================================================================
## *
##  @class   vtkCapsuleSource
##  @brief   Generate a capsule centered at the origin
##
##  vtkCapsuleSource creates a capsule (represented by polygons) of specified
##  radius centered at the origin. The resolution (polygonal discretization) in
##  both the latitude (phi) and longitude (theta) directions can be specified as
##  well as the length of the capsule cylinder (CylinderLength). By default, the
##  surface tessellation of the sphere uses triangles; however you can set
##  LatLongTessellation to produce a tessellation using quadrilaterals (except
##  at the poles of the capsule).
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm, vtkSphereSource

type
  vtkCapsuleSource* {.importcpp: "vtkCapsuleSource", header: "vtkCapsuleSource.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkCapsuleSource* {.importc: "vtkCapsuleSource".}: VTK_NEWINSTANCE

  vtkCapsuleSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCapsuleSource::IsTypeOf(@)", header: "vtkCapsuleSource.h".}
proc IsA*(this: var vtkCapsuleSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCapsuleSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCapsuleSource {.
    importcpp: "vtkCapsuleSource::SafeDownCast(@)", header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCapsuleSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCapsuleSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCapsuleSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCapsuleSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCapsuleSource.h".}
proc New*(): ptr vtkCapsuleSource {.importcpp: "vtkCapsuleSource::New(@)",
                                header: "vtkCapsuleSource.h".}
proc SetRadius*(this: var vtkCapsuleSource; _arg: cdouble) {.importcpp: "SetRadius",
    header: "vtkCapsuleSource.h".}
proc GetRadiusMinValue*(this: var vtkCapsuleSource): cdouble {.
    importcpp: "GetRadiusMinValue", header: "vtkCapsuleSource.h".}
proc GetRadiusMaxValue*(this: var vtkCapsuleSource): cdouble {.
    importcpp: "GetRadiusMaxValue", header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual double GetRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkCapsuleSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkCapsuleSource.h".}
proc SetCenter*(this: var vtkCapsuleSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetRadiusCylinderLength*(this: var vtkCapsuleSource; _arg: cdouble) {.
    importcpp: "SetRadiusCylinderLength", header: "vtkCapsuleSource.h".}
proc GetRadiusMinValueCylinderLengthMinValue*(this: var vtkCapsuleSource): cdouble {.
    importcpp: "GetRadiusMinValueCylinderLengthMinValue",
    header: "vtkCapsuleSource.h".}
proc GetRadiusMaxValueCylinderLengthMaxValue*(this: var vtkCapsuleSource): cdouble {.
    importcpp: "GetRadiusMaxValueCylinderLengthMaxValue",
    header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual double GetRadiusCylinderLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CylinderLength  of  << this -> CylinderLength ) ; return this -> CylinderLength ; } ;
## Error: expected ';'!!!

proc SetRadiusCylinderLengthThetaResolution*(this: var vtkCapsuleSource; _arg: cint) {.
    importcpp: "SetRadiusCylinderLengthThetaResolution",
    header: "vtkCapsuleSource.h".}
proc GetRadiusMinValueCylinderLengthMinValueThetaResolutionMinValue*(
    this: var vtkCapsuleSource): cint {.importcpp: "GetRadiusMinValueCylinderLengthMinValueThetaResolutionMinValue",
                                    header: "vtkCapsuleSource.h".}
proc GetRadiusMaxValueCylinderLengthMaxValueThetaResolutionMaxValue*(
    this: var vtkCapsuleSource): cint {.importcpp: "GetRadiusMaxValueCylinderLengthMaxValueThetaResolutionMaxValue",
                                    header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual int GetRadiusCylinderLengthThetaResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThetaResolution  of  << this -> ThetaResolution ) ; return this -> ThetaResolution ; } ;
## Error: expected ';'!!!

proc SetRadiusCylinderLengthThetaResolutionPhiResolution*(
    this: var vtkCapsuleSource; _arg: cint) {.
    importcpp: "SetRadiusCylinderLengthThetaResolutionPhiResolution",
    header: "vtkCapsuleSource.h".}
proc GetRadiusMinValueCylinderLengthMinValueThetaResolutionMinValuePhiResolutionMinValue*(
    this: var vtkCapsuleSource): cint {.importcpp: "GetRadiusMinValueCylinderLengthMinValueThetaResolutionMinValuePhiResolutionMinValue",
                                    header: "vtkCapsuleSource.h".}
proc GetRadiusMaxValueCylinderLengthMaxValueThetaResolutionMaxValuePhiResolutionMaxValue*(
    this: var vtkCapsuleSource): cint {.importcpp: "GetRadiusMaxValueCylinderLengthMaxValueThetaResolutionMaxValuePhiResolutionMaxValue",
                                    header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual int GetRadiusCylinderLengthThetaResolutionPhiResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PhiResolution  of  << this -> PhiResolution ) ; return this -> PhiResolution ; } ;
## Error: expected ';'!!!

proc SetLatLongTessellation*(this: var vtkCapsuleSource; _arg: cint) {.
    importcpp: "SetLatLongTessellation", header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual int GetRadiusCylinderLengthThetaResolutionPhiResolutionLatLongTessellation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LatLongTessellation  of  << this -> LatLongTessellation ) ; return this -> LatLongTessellation ; } ;
## Error: expected ';'!!!

proc LatLongTessellationOn*(this: var vtkCapsuleSource) {.
    importcpp: "LatLongTessellationOn", header: "vtkCapsuleSource.h".}
proc LatLongTessellationOff*(this: var vtkCapsuleSource) {.
    importcpp: "LatLongTessellationOff", header: "vtkCapsuleSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetLatLongTessellationOutputPointsPrecision*(this: var vtkCapsuleSource;
    _arg: cint) {.importcpp: "SetLatLongTessellationOutputPointsPrecision",
                header: "vtkCapsuleSource.h".}
## !!!Ignored construct:  virtual int GetRadiusCylinderLengthThetaResolutionPhiResolutionLatLongTessellationOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
