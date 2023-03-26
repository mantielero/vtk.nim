## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArcSource.h
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
##  @class   vtkArcSource
##  @brief   create a circular arc
##
##
##  vtkArcSource is a source object that creates an arc defined by two
##  endpoints and a center. The number of segments composing the polyline
##  is controlled by setting the object resolution.
##  Alternatively, one can use a better API (that does not allow for
##  inconsistent nor ambiguous inputs), using a starting point (polar vector,
##  measured from the arc's center), a normal to the plane of the arc,
##  and an angle defining the arc length.
##  Since the default API remains the original one, in order to use
##  the improved API, one must switch the UseNormalAndAngle flag to TRUE.
##
##  The development of an improved, consistent API (based on point, normal,
##  and angle) was supported by CEA/DIF - Commissariat a l'Energie Atomique,
##  Centre DAM Ile-De-France, BP12, F-91297 Arpajon, France, and implemented
##  by Philippe Pebay, Kitware SAS 2012.
##
##  @sa
##  vtkEllipseArcSource
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkArcSource* {.importcpp: "vtkArcSource", header: "vtkArcSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkArcSource* {.importc: "vtkArcSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkArcSource {.importcpp: "vtkArcSource::New(@)",
                            header: "vtkArcSource.h".}
type
  vtkArcSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArcSource::IsTypeOf(@)", header: "vtkArcSource.h".}
proc IsA*(this: var vtkArcSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArcSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArcSource {.
    importcpp: "vtkArcSource::SafeDownCast(@)", header: "vtkArcSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArcSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArcSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArcSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArcSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArcSource.h".}
proc SetPoint1*(this: var vtkArcSource; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetPoint1", header: "vtkArcSource.h".}
proc SetPoint1*(this: var vtkArcSource; _arg: array[3, cdouble]) {.
    importcpp: "SetPoint1", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual double * GetPoint1 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point1  pointer  << this -> Point1 ) ; return this -> Point1 ; } VTK_WRAPEXCLUDE virtual void GetPoint1 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point1 [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoint1Point2*(this: var vtkArcSource; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetPoint1Point2",
                                     header: "vtkArcSource.h".}
proc SetPoint1Point2*(this: var vtkArcSource; _arg: array[3, cdouble]) {.
    importcpp: "SetPoint1Point2", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual double * GetPoint1Point2 ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Point2  pointer  << this -> Point2 ) ; return this -> Point2 ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point2 ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Point2 [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoint1Point2Center*(this: var vtkArcSource; _arg1: cdouble; _arg2: cdouble;
                           _arg3: cdouble) {.importcpp: "SetPoint1Point2Center",
    header: "vtkArcSource.h".}
proc SetPoint1Point2Center*(this: var vtkArcSource; _arg: array[3, cdouble]) {.
    importcpp: "SetPoint1Point2Center", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual double * GetPoint1Point2Center ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point2Center ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoint1Point2CenterNormal*(this: var vtkArcSource; _arg1: cdouble;
                                 _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetPoint1Point2CenterNormal", header: "vtkArcSource.h".}
proc SetPoint1Point2CenterNormal*(this: var vtkArcSource; _arg: array[3, cdouble]) {.
    importcpp: "SetPoint1Point2CenterNormal", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual double * GetPoint1Point2CenterNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point2CenterNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ;
## Error: expected ';'!!!

proc SetPoint1Point2CenterNormalPolarVector*(this: var vtkArcSource; _arg1: cdouble;
    _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetPoint1Point2CenterNormalPolarVector",
                                  header: "vtkArcSource.h".}
proc SetPoint1Point2CenterNormalPolarVector*(this: var vtkArcSource;
    _arg: array[3, cdouble]) {.importcpp: "SetPoint1Point2CenterNormalPolarVector",
                            header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual double * GetPoint1Point2CenterNormalPolarVector ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PolarVector  pointer  << this -> PolarVector ) ; return this -> PolarVector ; } VTK_WRAPEXCLUDE virtual void GetPoint1Point2CenterNormalPolarVector ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> PolarVector [ i ] ; } } ;
## Error: expected ';'!!!

proc SetAngle*(this: var vtkArcSource; _arg: cdouble) {.importcpp: "SetAngle",
    header: "vtkArcSource.h".}
proc GetAngleMinValue*(this: var vtkArcSource): cdouble {.
    importcpp: "GetAngleMinValue", header: "vtkArcSource.h".}
proc GetAngleMaxValue*(this: var vtkArcSource): cdouble {.
    importcpp: "GetAngleMaxValue", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual double GetAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Angle  of  << this -> Angle ) ; return this -> Angle ; } ;
## Error: expected ';'!!!

proc SetAngleResolution*(this: var vtkArcSource; _arg: cint) {.
    importcpp: "SetAngleResolution", header: "vtkArcSource.h".}
proc GetAngleMinValueResolutionMinValue*(this: var vtkArcSource): cint {.
    importcpp: "GetAngleMinValueResolutionMinValue", header: "vtkArcSource.h".}
proc GetAngleMaxValueResolutionMaxValue*(this: var vtkArcSource): cint {.
    importcpp: "GetAngleMaxValueResolutionMaxValue", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual int GetAngleResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Resolution  of  << this -> Resolution ) ; return this -> Resolution ; } ;
## Error: expected ';'!!!

proc SetNegative*(this: var vtkArcSource; _arg: bool) {.importcpp: "SetNegative",
    header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual bool GetAngleResolutionNegative ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Negative  of  << this -> Negative ) ; return this -> Negative ; } ;
## Error: expected ';'!!!

proc NegativeOn*(this: var vtkArcSource) {.importcpp: "NegativeOn",
                                       header: "vtkArcSource.h".}
proc NegativeOff*(this: var vtkArcSource) {.importcpp: "NegativeOff",
                                        header: "vtkArcSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Activate the API based on a normal vector, a starting point
  ##  (polar vector) and an angle defining the arc length.
  ##  The previous API (which remains the default) allows for inputs that are
  ##  inconsistent (when Point1 and Point2 are not equidistant from Center)
  ##  or ambiguous (when Point1, Point2, and Center are aligned).
  ##  Note: false by default.
  ##
proc SetNegativeUseNormalAndAngle*(this: var vtkArcSource; _arg: bool) {.
    importcpp: "SetNegativeUseNormalAndAngle", header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual bool GetAngleResolutionNegativeUseNormalAndAngle ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseNormalAndAngle  of  << this -> UseNormalAndAngle ) ; return this -> UseNormalAndAngle ; } ;
## Error: expected ';'!!!

proc UseNormalAndAngleOn*(this: var vtkArcSource) {.
    importcpp: "UseNormalAndAngleOn", header: "vtkArcSource.h".}
proc UseNormalAndAngleOff*(this: var vtkArcSource) {.
    importcpp: "UseNormalAndAngleOff", header: "vtkArcSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the desired precision for the output points.
  ##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
  ##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
  ##
proc SetNegativeUseNormalAndAngleOutputPointsPrecision*(this: var vtkArcSource;
    _arg: cint) {.importcpp: "SetNegativeUseNormalAndAngleOutputPointsPrecision",
                header: "vtkArcSource.h".}
## !!!Ignored construct:  virtual int GetAngleResolutionNegativeUseNormalAndAngleOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
