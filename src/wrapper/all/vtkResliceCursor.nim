## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResliceCursor.h
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
##  @class   vtkResliceCursor
##  @brief   Geometry for a reslice cursor
##
##  This class represents a reslice cursor. It consists of two cross
##  sectional hairs, with an optional thickness. The crosshairs
##  hairs may have a hole in the center. These may be translated or rotated
##  independent of each other in the view. The result is used to reslice
##  the data along these cross sections. This allows the user to perform
##  multi-planar thin or thick reformat of the data on an image view, rather
##  than a 3D view.
##  @sa
##  vtkResliceCursorWidget vtkResliceCursor vtkResliceCursorPolyDataAlgorithm
##  vtkResliceCursorRepresentation vtkResliceCursorThickLineRepresentation
##  vtkResliceCursorActor vtkImagePlaneWidget
##

import
  vtkInteractionWidgetsModule, vtkObject

discard "forward decl of vtkImageData"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPlane"
discard "forward decl of vtkPlaneCollection"
type
  vtkResliceCursor* {.importcpp: "vtkResliceCursor", header: "vtkResliceCursor.h",
                     bycopy.} = object of vtkObject
    vtkResliceCursor* {.importc: "vtkResliceCursor".}: VTK_NEWINSTANCE

  vtkResliceCursorSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkResliceCursor::IsTypeOf(@)", header: "vtkResliceCursor.h".}
proc IsA*(this: var vtkResliceCursor; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkResliceCursor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkResliceCursor {.
    importcpp: "vtkResliceCursor::SafeDownCast(@)", header: "vtkResliceCursor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkResliceCursor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResliceCursor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResliceCursor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkResliceCursor {.importcpp: "vtkResliceCursor::New(@)",
                                header: "vtkResliceCursor.h".}
proc SetImage*(this: var vtkResliceCursor; a2: ptr vtkImageData) {.
    importcpp: "SetImage", header: "vtkResliceCursor.h".}
proc GetnameImage*(this: var vtkResliceCursor): ptr vtkImageData {.
    importcpp: "GetnameImage", header: "vtkResliceCursor.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the cente of the reslice cursor.
  ##
proc SetCenter*(this: var vtkResliceCursor; a2: cdouble; a3: cdouble; a4: cdouble) {.
    importcpp: "SetCenter", header: "vtkResliceCursor.h".}
proc SetCenter*(this: var vtkResliceCursor; center: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkResliceCursor.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetThickness*(this: var vtkResliceCursor; _arg1: cdouble; _arg2: cdouble;
                  _arg3: cdouble) {.importcpp: "SetThickness",
                                  header: "vtkResliceCursor.h".}
proc SetThickness*(this: var vtkResliceCursor; _arg: array[3, cdouble]) {.
    importcpp: "SetThickness", header: "vtkResliceCursor.h".}
## !!!Ignored construct:  virtual double * GetCenterThickness ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Thickness  pointer  << this -> Thickness ) ; return this -> Thickness ; } VTK_WRAPEXCLUDE virtual void GetCenterThickness ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Thickness [ 0 ] ; _arg2 = this -> Thickness [ 1 ] ; _arg3 = this -> Thickness [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Thickness  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThickness ( double _arg [ 3 ] ) { this -> GetCenterThickness ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetThickMode*(this: var vtkResliceCursor; _arg: vtkTypeBool) {.
    importcpp: "SetThickMode", header: "vtkResliceCursor.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetThickMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ThickMode  of  << this -> ThickMode ) ; return this -> ThickMode ; } ;
## Error: expected ';'!!!

proc ThickModeOn*(this: var vtkResliceCursor) {.importcpp: "ThickModeOn",
    header: "vtkResliceCursor.h".}
proc ThickModeOff*(this: var vtkResliceCursor) {.importcpp: "ThickModeOff",
    header: "vtkResliceCursor.h".}
  ## /@}
  ## *
  ##  Get the 3D PolyData representation
  ##
proc GetPolyData*(this: var vtkResliceCursor): ptr vtkPolyData {.
    importcpp: "GetPolyData", header: "vtkResliceCursor.h".}
proc GetCenterlineAxisPolyData*(this: var vtkResliceCursor; axis: cint): ptr vtkPolyData {.
    importcpp: "GetCenterlineAxisPolyData", header: "vtkResliceCursor.h".}
proc PrintSelf*(this: var vtkResliceCursor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkResliceCursor.h".}
proc GetPlane*(this: var vtkResliceCursor; n: cint): ptr vtkPlane {.
    importcpp: "GetPlane", header: "vtkResliceCursor.h".}
proc Update*(this: var vtkResliceCursor) {.importcpp: "Update",
                                       header: "vtkResliceCursor.h".}
## !!!Ignored construct:  /@{ *
##  Get the computed axes directions
##  virtual double * GetCenterThicknessXAxisXAxis ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << XAxis  pointer  << this -> XAxis ) ; return this -> XAxis ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxis ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> XAxis [ 0 ] ; _arg2 = this -> XAxis [ 1 ] ; _arg3 = this -> XAxis [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << XAxis  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxis ( double _arg [ 3 ] ) { this -> GetCenterThicknessXAxisXAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetCenterThicknessXAxisXAxisYAxis ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << YAxis  pointer  << this -> YAxis ) ; return this -> YAxis ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxis ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> YAxis [ 0 ] ; _arg2 = this -> YAxis [ 1 ] ; _arg3 = this -> YAxis [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << YAxis  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxis ( double _arg [ 3 ] ) { this -> GetCenterThicknessXAxisXAxisYAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetCenterThicknessXAxisXAxisYAxisZAxis ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZAxis  pointer  << this -> ZAxis ) ; return this -> ZAxis ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxis ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ZAxis [ 0 ] ; _arg2 = this -> ZAxis [ 1 ] ; _arg3 = this -> ZAxis [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ZAxis  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxis ( double _arg [ 3 ] ) { this -> GetCenterThicknessXAxisXAxisYAxisZAxis ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetThicknessXAxis*(this: var vtkResliceCursor; _arg1: cdouble; _arg2: cdouble;
                       _arg3: cdouble) {.importcpp: "SetThicknessXAxis",
                                       header: "vtkResliceCursor.h".}
proc SetThicknessXAxis*(this: var vtkResliceCursor; _arg: array[3, cdouble]) {.
    importcpp: "SetThicknessXAxis", header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxis*(this: var vtkResliceCursor; _arg1: cdouble;
                            _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetThicknessXAxisYAxis", header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxis*(this: var vtkResliceCursor; _arg: array[3, cdouble]) {.
    importcpp: "SetThicknessXAxisYAxis", header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxis*(this: var vtkResliceCursor; _arg1: cdouble;
                                 _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetThicknessXAxisYAxisZAxis", header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxis*(this: var vtkResliceCursor;
                                 _arg: array[3, cdouble]) {.
    importcpp: "SetThicknessXAxisYAxisZAxis", header: "vtkResliceCursor.h".}
proc GetAxis*(this: var vtkResliceCursor; i: cint): ptr cdouble {.importcpp: "GetAxis",
    header: "vtkResliceCursor.h".}
## !!!Ignored construct:  /@} *
##  Get/Set the view up
##  virtual double * GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << XViewUp  pointer  << this -> XViewUp ) ; return this -> XViewUp ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUp ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> XViewUp [ 0 ] ; _arg2 = this -> XViewUp [ 1 ] ; _arg3 = this -> XViewUp [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << XViewUp  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUp ( double _arg [ 3 ] ) { this -> GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUp ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << YViewUp  pointer  << this -> YViewUp ) ; return this -> YViewUp ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUp ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> YViewUp [ 0 ] ; _arg2 = this -> YViewUp [ 1 ] ; _arg3 = this -> YViewUp [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << YViewUp  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUp ( double _arg [ 3 ] ) { this -> GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUp ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUpZViewUp ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ZViewUp  pointer  << this -> ZViewUp ) ; return this -> ZViewUp ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUpZViewUp ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ZViewUp [ 0 ] ; _arg2 = this -> ZViewUp [ 1 ] ; _arg3 = this -> ZViewUp [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ZViewUp  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUpZViewUp ( double _arg [ 3 ] ) { this -> GetCenterThicknessXAxisXAxisYAxisZAxisXViewUpXViewUpYViewUpZViewUp ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetThicknessXAxisYAxisZAxisXViewUp*(this: var vtkResliceCursor; _arg1: cdouble;
                                        _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetThicknessXAxisYAxisZAxisXViewUp", header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxisXViewUp*(this: var vtkResliceCursor;
                                        _arg: array[3, cdouble]) {.
    importcpp: "SetThicknessXAxisYAxisZAxisXViewUp", header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxisXViewUpYViewUp*(this: var vtkResliceCursor;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetThicknessXAxisYAxisZAxisXViewUpYViewUp",
    header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxisXViewUpYViewUp*(this: var vtkResliceCursor;
    _arg: array[3, cdouble]) {.importcpp: "SetThicknessXAxisYAxisZAxisXViewUpYViewUp",
                            header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxisXViewUpYViewUpZViewUp*(
    this: var vtkResliceCursor; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetThicknessXAxisYAxisZAxisXViewUpYViewUpZViewUp",
    header: "vtkResliceCursor.h".}
proc SetThicknessXAxisYAxisZAxisXViewUpYViewUpZViewUp*(
    this: var vtkResliceCursor; _arg: array[3, cdouble]) {.
    importcpp: "SetThicknessXAxisYAxisZAxisXViewUpYViewUpZViewUp",
    header: "vtkResliceCursor.h".}
proc GetViewUp*(this: var vtkResliceCursor; i: cint): ptr cdouble {.
    importcpp: "GetViewUp", header: "vtkResliceCursor.h".}
proc SetThickModeHole*(this: var vtkResliceCursor; _arg: cint) {.
    importcpp: "SetThickModeHole", header: "vtkResliceCursor.h".}
## !!!Ignored construct:  virtual int GetThickModeHole ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Hole  of  << this -> Hole ) ; return this -> Hole ; } ;
## Error: expected ';'!!!

proc SetThickModeHoleHoleWidth*(this: var vtkResliceCursor; _arg: cdouble) {.
    importcpp: "SetThickModeHoleHoleWidth", header: "vtkResliceCursor.h".}
## !!!Ignored construct:  virtual double GetThickModeHoleHoleWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HoleWidth  of  << this -> HoleWidth ) ; return this -> HoleWidth ; } ;
## Error: expected ';'!!!

proc SetThickModeHoleHoleWidthHoleWidthInPixels*(this: var vtkResliceCursor;
    _arg: cdouble) {.importcpp: "SetThickModeHoleHoleWidthHoleWidthInPixels",
                   header: "vtkResliceCursor.h".}
## !!!Ignored construct:  virtual double GetThickModeHoleHoleWidthHoleWidthInPixels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HoleWidthInPixels  of  << this -> HoleWidthInPixels ) ; return this -> HoleWidthInPixels ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkResliceCursor): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkResliceCursor.h".}
proc Reset*(this: var vtkResliceCursor) {.importcpp: "Reset",
                                      header: "vtkResliceCursor.h".}