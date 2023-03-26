## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEllipseArcSource.h
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
##  @class   vtkEllipseArcSource
##  @brief   create an elliptical arc
##
##
##  vtkEllipseArcSource is a source object that creates an elliptical arc
##  defined by a normal, a center and the major radius vector.
##  You can define an angle to draw only a section of the ellipse. The number of
##  segments composing the polyline is controlled by setting the object
##  resolution.
##
##  @sa
##  vtkArcSource
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkEllipseArcSource* {.importcpp: "vtkEllipseArcSource",
                        header: "vtkEllipseArcSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkEllipseArcSource* {.importc: "vtkEllipseArcSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkEllipseArcSource {.importcpp: "vtkEllipseArcSource::New(@)",
                                   header: "vtkEllipseArcSource.h".}
type
  vtkEllipseArcSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEllipseArcSource::IsTypeOf(@)", header: "vtkEllipseArcSource.h".}
proc IsA*(this: var vtkEllipseArcSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkEllipseArcSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEllipseArcSource {.
    importcpp: "vtkEllipseArcSource::SafeDownCast(@)",
    header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEllipseArcSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEllipseArcSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEllipseArcSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkEllipseArcSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkEllipseArcSource.h".}
proc SetCenter*(this: var vtkEllipseArcSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetCenter",
                               header: "vtkEllipseArcSource.h".}
proc SetCenter*(this: var vtkEllipseArcSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterNormal*(this: var vtkEllipseArcSource; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetCenterNormal",
                                     header: "vtkEllipseArcSource.h".}
proc SetCenterNormal*(this: var vtkEllipseArcSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterNormal", header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual double * GetCenterNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetCenterNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterNormalMajorRadiusVector*(this: var vtkEllipseArcSource;
                                      _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenterNormalMajorRadiusVector", header: "vtkEllipseArcSource.h".}
proc SetCenterNormalMajorRadiusVector*(this: var vtkEllipseArcSource;
                                      _arg: array[3, cdouble]) {.
    importcpp: "SetCenterNormalMajorRadiusVector", header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual double * GetCenterNormalMajorRadiusVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MajorRadiusVector  pointer  << this -> MajorRadiusVector ) ; return this -> MajorRadiusVector ; } VTK_WRAPEXCLUDE virtual void GetCenterNormalMajorRadiusVector ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> MajorRadiusVector [ i ] ; } } ;
## Error: expected ';'!!!

proc SetStartAngle*(this: var vtkEllipseArcSource; _arg: cdouble) {.
    importcpp: "SetStartAngle", header: "vtkEllipseArcSource.h".}
proc GetStartAngleMinValue*(this: var vtkEllipseArcSource): cdouble {.
    importcpp: "GetStartAngleMinValue", header: "vtkEllipseArcSource.h".}
proc GetStartAngleMaxValue*(this: var vtkEllipseArcSource): cdouble {.
    importcpp: "GetStartAngleMaxValue", header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual double GetStartAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StartAngle  of  << this -> StartAngle ) ; return this -> StartAngle ; } ;
## Error: expected ';'!!!

proc SetStartAngleSegmentAngle*(this: var vtkEllipseArcSource; _arg: cdouble) {.
    importcpp: "SetStartAngleSegmentAngle", header: "vtkEllipseArcSource.h".}
proc GetStartAngleMinValueSegmentAngleMinValue*(this: var vtkEllipseArcSource): cdouble {.
    importcpp: "GetStartAngleMinValueSegmentAngleMinValue",
    header: "vtkEllipseArcSource.h".}
proc GetStartAngleMaxValueSegmentAngleMaxValue*(this: var vtkEllipseArcSource): cdouble {.
    importcpp: "GetStartAngleMaxValueSegmentAngleMaxValue",
    header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual double GetStartAngleSegmentAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SegmentAngle  of  << this -> SegmentAngle ) ; return this -> SegmentAngle ; } ;
## Error: expected ';'!!!

proc SetStartAngleSegmentAngleResolution*(this: var vtkEllipseArcSource; _arg: cint) {.
    importcpp: "SetStartAngleSegmentAngleResolution",
    header: "vtkEllipseArcSource.h".}
proc GetStartAngleMinValueSegmentAngleMinValueResolutionMinValue*(
    this: var vtkEllipseArcSource): cint {.importcpp: "GetStartAngleMinValueSegmentAngleMinValueResolutionMinValue",
                                       header: "vtkEllipseArcSource.h".}
proc GetStartAngleMaxValueSegmentAngleMaxValueResolutionMaxValue*(
    this: var vtkEllipseArcSource): cint {.importcpp: "GetStartAngleMaxValueSegmentAngleMaxValueResolutionMaxValue",
                                       header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual int GetStartAngleSegmentAngleResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc SetClose*(this: var vtkEllipseArcSource; _arg: bool) {.importcpp: "SetClose",
    header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual bool GetStartAngleSegmentAngleResolutionClose ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Close  of  << this -> Close ) ; return this -> Close ; } ;
## Error: expected ';'!!!

proc CloseOn*(this: var vtkEllipseArcSource) {.importcpp: "CloseOn",
    header: "vtkEllipseArcSource.h".}
proc CloseOff*(this: var vtkEllipseArcSource) {.importcpp: "CloseOff",
    header: "vtkEllipseArcSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point,
  ##  This is the default.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetCloseOutputPointsPrecision*(this: var vtkEllipseArcSource; _arg: cint) {.
    importcpp: "SetCloseOutputPointsPrecision", header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual int GetStartAngleSegmentAngleResolutionCloseOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!

proc SetStartAngleSegmentAngleResolutionRatio*(this: var vtkEllipseArcSource;
    _arg: cdouble) {.importcpp: "SetStartAngleSegmentAngleResolutionRatio",
                   header: "vtkEllipseArcSource.h".}
proc GetStartAngleMinValueSegmentAngleMinValueResolutionMinValueRatioMinValue*(
    this: var vtkEllipseArcSource): cdouble {.importcpp: "GetStartAngleMinValueSegmentAngleMinValueResolutionMinValueRatioMinValue",
    header: "vtkEllipseArcSource.h".}
proc GetStartAngleMaxValueSegmentAngleMaxValueResolutionMaxValueRatioMaxValue*(
    this: var vtkEllipseArcSource): cdouble {.importcpp: "GetStartAngleMaxValueSegmentAngleMaxValueResolutionMaxValueRatioMaxValue",
    header: "vtkEllipseArcSource.h".}
## !!!Ignored construct:  virtual double GetStartAngleSegmentAngleResolutionCloseOutputPointsPrecisionRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Ratio  of  << this -> Ratio ) ; return this -> Ratio ; } ;
## Error: expected ';'!!!
