## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkConeSource.h
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
##  @class   vtkConeSource
##  @brief   generate polygonal cone
##
##  vtkConeSource creates a cone centered at a specified point and pointing in
##  a specified direction. (By default, the center is the origin and the
##  direction is the x-axis.) Depending upon the resolution of this object,
##  different representations are created. If resolution=0 a line is created;
##  if resolution=1, a single triangle is created; if resolution=2, two
##  crossed triangles are created. For resolution > 2, a 3D cone (with
##  resolution number of sides) is created. It also is possible to control
##  whether the bottom of the cone is capped with a (resolution-sided)
##  polygon, and to specify the height and radius of the cone.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm, vtkCell

type
  vtkConeSource* {.importcpp: "vtkConeSource", header: "vtkConeSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkConeSource* {.importc: "vtkConeSource".}: VTK_NEWINSTANCE

  vtkConeSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkConeSource::IsTypeOf(@)", header: "vtkConeSource.h".}
proc IsA*(this: var vtkConeSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkConeSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkConeSource {.
    importcpp: "vtkConeSource::SafeDownCast(@)", header: "vtkConeSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkConeSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkConeSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkConeSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkConeSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkConeSource.h".}
proc New*(): ptr vtkConeSource {.importcpp: "vtkConeSource::New(@)",
                             header: "vtkConeSource.h".}
proc SetHeight*(this: var vtkConeSource; _arg: cdouble) {.importcpp: "SetHeight",
    header: "vtkConeSource.h".}
proc GetHeightMinValue*(this: var vtkConeSource): cdouble {.
    importcpp: "GetHeightMinValue", header: "vtkConeSource.h".}
proc GetHeightMaxValue*(this: var vtkConeSource): cdouble {.
    importcpp: "GetHeightMaxValue", header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual double GetHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Height  of  << this -> Height ) ; return this -> Height ; } ;
## Error: expected ';'!!!

proc SetHeightRadius*(this: var vtkConeSource; _arg: cdouble) {.
    importcpp: "SetHeightRadius", header: "vtkConeSource.h".}
proc GetHeightMinValueRadiusMinValue*(this: var vtkConeSource): cdouble {.
    importcpp: "GetHeightMinValueRadiusMinValue", header: "vtkConeSource.h".}
proc GetHeightMaxValueRadiusMaxValue*(this: var vtkConeSource): cdouble {.
    importcpp: "GetHeightMaxValueRadiusMaxValue", header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual double GetHeightRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetHeightRadiusResolution*(this: var vtkConeSource; _arg: cint) {.
    importcpp: "SetHeightRadiusResolution", header: "vtkConeSource.h".}
proc GetHeightMinValueRadiusMinValueResolutionMinValue*(this: var vtkConeSource): cint {.
    importcpp: "GetHeightMinValueRadiusMinValueResolutionMinValue",
    header: "vtkConeSource.h".}
proc GetHeightMaxValueRadiusMaxValueResolutionMaxValue*(this: var vtkConeSource): cint {.
    importcpp: "GetHeightMaxValueRadiusMaxValueResolutionMaxValue",
    header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual int GetHeightRadiusResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkConeSource; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenter", header: "vtkConeSource.h".}
proc SetCenter*(this: var vtkConeSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterDirection*(this: var vtkConeSource; _arg1: cdouble; _arg2: cdouble;
                        _arg3: cdouble) {.importcpp: "SetCenterDirection",
                                        header: "vtkConeSource.h".}
proc SetCenterDirection*(this: var vtkConeSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterDirection", header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual double * GetCenterDirection ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Direction  pointer  << this -> Direction ) ; return this -> Direction ; } VTK_WRAPEXCLUDE virtual void GetCenterDirection ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Direction [ i ] ; } } ;
## Error: expected ';'!!!

proc SetAngle*(this: var vtkConeSource; angle: cdouble) {.importcpp: "SetAngle",
    header: "vtkConeSource.h".}
proc GetAngle*(this: var vtkConeSource): cdouble {.importcpp: "GetAngle",
    header: "vtkConeSource.h".}
proc SetCapping*(this: var vtkConeSource; _arg: vtkTypeBool) {.
    importcpp: "SetCapping", header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetHeightRadiusResolutionCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ;
## Error: expected ';'!!!

proc CappingOn*(this: var vtkConeSource) {.importcpp: "CappingOn",
                                       header: "vtkConeSource.h".}
proc CappingOff*(this: var vtkConeSource) {.importcpp: "CappingOff",
                                        header: "vtkConeSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetCappingOutputPointsPrecision*(this: var vtkConeSource; _arg: cint) {.
    importcpp: "SetCappingOutputPointsPrecision", header: "vtkConeSource.h".}
## !!!Ignored construct:  virtual int GetHeightRadiusResolutionCappingOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
