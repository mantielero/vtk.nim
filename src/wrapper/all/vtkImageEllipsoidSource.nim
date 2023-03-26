## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageEllipsoidSource.h
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
##  @class   vtkImageEllipsoidSource
##  @brief   Create a binary image of an ellipsoid.
##
##  vtkImageEllipsoidSource creates a binary image of a ellipsoid.  It was created
##  as an example of a simple source, and to test the mask filter.
##  It is also used internally in vtkImageDilateErode3D.
##

import
  vtkImageAlgorithm, vtkImagingSourcesModule

type
  vtkImageEllipsoidSource* {.importcpp: "vtkImageEllipsoidSource",
                            header: "vtkImageEllipsoidSource.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageEllipsoidSource* {.importc: "vtkImageEllipsoidSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageEllipsoidSource {.importcpp: "vtkImageEllipsoidSource::New(@)",
                                       header: "vtkImageEllipsoidSource.h".}
type
  vtkImageEllipsoidSourceSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageEllipsoidSource::IsTypeOf(@)",
    header: "vtkImageEllipsoidSource.h".}
proc IsA*(this: var vtkImageEllipsoidSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageEllipsoidSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageEllipsoidSource {.
    importcpp: "vtkImageEllipsoidSource::SafeDownCast(@)",
    header: "vtkImageEllipsoidSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageEllipsoidSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageEllipsoidSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageEllipsoidSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageEllipsoidSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageEllipsoidSource.h".}
proc SetWholeExtent*(this: var vtkImageEllipsoidSource; extent: array[6, cint]) {.
    importcpp: "SetWholeExtent", header: "vtkImageEllipsoidSource.h".}
proc SetWholeExtent*(this: var vtkImageEllipsoidSource; minX: cint; maxX: cint;
                    minY: cint; maxY: cint; minZ: cint; maxZ: cint) {.
    importcpp: "SetWholeExtent", header: "vtkImageEllipsoidSource.h".}
proc GetWholeExtent*(this: var vtkImageEllipsoidSource; extent: array[6, cint]) {.
    importcpp: "GetWholeExtent", header: "vtkImageEllipsoidSource.h".}
## !!!Ignored construct:  int * GetWholeExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> WholeExtent ; } /@} /@{ *
##  Set/Get the center of the ellipsoid.
##  virtual void SetCenter ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Center  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Center [ 0 ] != _arg1 ) || ( this -> Center [ 1 ] != _arg2 ) || ( this -> Center [ 2 ] != _arg3 ) ) { this -> Center [ 0 ] = _arg1 ; this -> Center [ 1 ] = _arg2 ; this -> Center [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetCenter ( const double _arg [ 3 ] ) { this -> SetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetCenterRadius*(this: var vtkImageEllipsoidSource; _arg1: cdouble;
                     _arg2: cdouble; _arg3: cdouble) {.importcpp: "SetCenterRadius",
    header: "vtkImageEllipsoidSource.h".}
proc SetCenterRadius*(this: var vtkImageEllipsoidSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterRadius", header: "vtkImageEllipsoidSource.h".}
## !!!Ignored construct:  virtual double * GetCenterRadius ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Radius  pointer  << this -> Radius ) ; return this -> Radius ; } VTK_WRAPEXCLUDE virtual void GetCenterRadius ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Radius [ 0 ] ; _arg2 = this -> Radius [ 1 ] ; _arg3 = this -> Radius [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Radius  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenterRadius ( double _arg [ 3 ] ) { this -> GetCenterRadius ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetInValue*(this: var vtkImageEllipsoidSource; _arg: cdouble) {.
    importcpp: "SetInValue", header: "vtkImageEllipsoidSource.h".}
## !!!Ignored construct:  virtual double GetInValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InValue  of  << this -> InValue ) ; return this -> InValue ; } ;
## Error: expected ';'!!!

proc SetInValueOutValue*(this: var vtkImageEllipsoidSource; _arg: cdouble) {.
    importcpp: "SetInValueOutValue", header: "vtkImageEllipsoidSource.h".}
## !!!Ignored construct:  virtual double GetInValueOutValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutValue  of  << this -> OutValue ) ; return this -> OutValue ; } ;
## Error: expected ';'!!!

proc SetInValueOutValueOutputScalarType*(this: var vtkImageEllipsoidSource;
                                        _arg: cint) {.
    importcpp: "SetInValueOutValueOutputScalarType",
    header: "vtkImageEllipsoidSource.h".}
## !!!Ignored construct:  virtual int GetInValueOutValueOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ;
## Error: expected ';'!!!

proc SetOutputScalarTypeToFloat*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToFloat", header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToDouble*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToDouble", header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToLong*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToLong", header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToUnsignedLong*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToUnsignedLong",
    header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToInt*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToInt", header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToUnsignedInt*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToUnsignedInt",
    header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToShort*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToShort", header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToUnsignedShort*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToUnsignedShort",
    header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToChar*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToChar", header: "vtkImageEllipsoidSource.h".}
proc SetOutputScalarTypeToUnsignedChar*(this: var vtkImageEllipsoidSource) {.
    importcpp: "SetOutputScalarTypeToUnsignedChar",
    header: "vtkImageEllipsoidSource.h".}