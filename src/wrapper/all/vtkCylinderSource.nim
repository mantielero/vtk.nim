## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCylinderSource.h
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
##  @class   vtkCylinderSource
##  @brief   generate a polygonal cylinder centered at the origin
##
##  vtkCylinderSource creates a polygonal cylinder centered at Center;
##  The axis of the cylinder is aligned along the global y-axis.
##  The height and radius of the cylinder can be specified, as well as the
##  number of sides. It is also possible to control whether the cylinder is
##  open-ended or capped. If you have the end points of the cylinder, you
##  should use a vtkLineSource followed by a vtkTubeFilter instead of the
##  vtkCylinderSource.
##
##  @sa
##  vtkCylinder
##

import
  vtkPolyDataAlgorithm, vtkCell  # vtkFiltersSourcesModule, 

type
  vtkCylinderSource* {.importcpp: "vtkCylinderSource",
                      header: "vtkCylinderSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkCylinderSource* {.importc: "vtkCylinderSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCylinderSource {.importcpp: "vtkCylinderSource::New(@)",
                                 header: "vtkCylinderSource.h".}
type
  vtkCylinderSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCylinderSource::IsTypeOf(@)", header: "vtkCylinderSource.h".}
proc IsA*(this: var vtkCylinderSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCylinderSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCylinderSource {.
    importcpp: "vtkCylinderSource::SafeDownCast(@)", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCylinderSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCylinderSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCylinderSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCylinderSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCylinderSource.h".}
proc SetHeight*(this: var vtkCylinderSource; _arg: cdouble) {.importcpp: "SetHeight",
    header: "vtkCylinderSource.h".}
proc GetHeightMinValue*(this: var vtkCylinderSource): cdouble {.
    importcpp: "GetHeightMinValue", header: "vtkCylinderSource.h".}
proc GetHeightMaxValue*(this: var vtkCylinderSource): cdouble {.
    importcpp: "GetHeightMaxValue", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  virtual double GetHeight ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Height  of  << this -> Height ) ; return this -> Height ; } ;
## Error: expected ';'!!!

proc SetHeightRadius*(this: var vtkCylinderSource; _arg: cdouble) {.
    importcpp: "SetHeightRadius", header: "vtkCylinderSource.h".}
proc GetHeightMinValueRadiusMinValue*(this: var vtkCylinderSource): cdouble {.
    importcpp: "GetHeightMinValueRadiusMinValue", header: "vtkCylinderSource.h".}
proc GetHeightMaxValueRadiusMaxValue*(this: var vtkCylinderSource): cdouble {.
    importcpp: "GetHeightMaxValueRadiusMaxValue", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  virtual double GetHeightRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  of  << this -> Radius ) ; return this -> Radius ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkCylinderSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkCylinderSource.h".}
proc SetCenter*(this: var vtkCylinderSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetHeightRadiusResolution*(this: var vtkCylinderSource; _arg: cint) {.
    importcpp: "SetHeightRadiusResolution", header: "vtkCylinderSource.h".}
proc GetHeightMinValueRadiusMinValueResolutionMinValue*(
    this: var vtkCylinderSource): cint {.importcpp: "GetHeightMinValueRadiusMinValueResolutionMinValue",
                                     header: "vtkCylinderSource.h".}
proc GetHeightMaxValueRadiusMaxValueResolutionMaxValue*(
    this: var vtkCylinderSource): cint {.importcpp: "GetHeightMaxValueRadiusMaxValueResolutionMaxValue",
                                     header: "vtkCylinderSource.h".}
## !!!Ignored construct:  virtual int GetHeightRadiusResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc SetCapping*(this: var vtkCylinderSource; _arg: vtkTypeBool) {.
    importcpp: "SetCapping", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetHeightRadiusResolutionCapping ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Capping  of  << this -> Capping ) ; return this -> Capping ; } ;
## Error: expected ';'!!!

proc CappingOn*(this: var vtkCylinderSource) {.importcpp: "CappingOn",
    header: "vtkCylinderSource.h".}
proc CappingOff*(this: var vtkCylinderSource) {.importcpp: "CappingOff",
    header: "vtkCylinderSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetCappingOutputPointsPrecision*(this: var vtkCylinderSource; _arg: cint) {.
    importcpp: "SetCappingOutputPointsPrecision", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  virtual int GetHeightRadiusResolutionCappingOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
