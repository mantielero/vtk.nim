## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDiskSource.h
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
##  @class   vtkDiskSource
##  @brief   create a disk with hole in center
##
##  vtkDiskSource creates a polygonal disk with a hole in the center. The
##  disk has zero height. The user can specify the inner and outer radius
##  of the disk, the radial and circumferential resolution of the
##  polygonal representation, and the center and plane normal of the disk
##  (i.e., the center and disk normal control the position and orientation
##  of the disk).
##
##  @sa
##  vtkLinearExtrusionFilter
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

discard "forward decl of vtkTransform"
type
  vtkDiskSource* {.importcpp: "vtkDiskSource", header: "vtkDiskSource.h", bycopy.} = object of vtkPolyDataAlgorithm ## /@{
                                                                                                          ## *
                                                                                                          ##  Standard methods to  instantiate the class, obtain type information,
                                                                                                          ##  and print the state of the object.
                                                                                                          ##
    vtkDiskSource* {.importc: "vtkDiskSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDiskSource {.importcpp: "vtkDiskSource::New(@)",
                             header: "vtkDiskSource.h".}
type
  vtkDiskSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDiskSource::IsTypeOf(@)", header: "vtkDiskSource.h".}
proc IsA*(this: var vtkDiskSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDiskSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDiskSource {.
    importcpp: "vtkDiskSource::SafeDownCast(@)", header: "vtkDiskSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDiskSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDiskSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDiskSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDiskSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDiskSource.h".}
proc SetInnerRadius*(this: var vtkDiskSource; _arg: cdouble) {.
    importcpp: "SetInnerRadius", header: "vtkDiskSource.h".}
proc GetInnerRadiusMinValue*(this: var vtkDiskSource): cdouble {.
    importcpp: "GetInnerRadiusMinValue", header: "vtkDiskSource.h".}
proc GetInnerRadiusMaxValue*(this: var vtkDiskSource): cdouble {.
    importcpp: "GetInnerRadiusMaxValue", header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual double GetInnerRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InnerRadius  of  << this -> InnerRadius ) ; return this -> InnerRadius ; } ;
## Error: expected ';'!!!

proc SetInnerRadiusOuterRadius*(this: var vtkDiskSource; _arg: cdouble) {.
    importcpp: "SetInnerRadiusOuterRadius", header: "vtkDiskSource.h".}
proc GetInnerRadiusMinValueOuterRadiusMinValue*(this: var vtkDiskSource): cdouble {.
    importcpp: "GetInnerRadiusMinValueOuterRadiusMinValue",
    header: "vtkDiskSource.h".}
proc GetInnerRadiusMaxValueOuterRadiusMaxValue*(this: var vtkDiskSource): cdouble {.
    importcpp: "GetInnerRadiusMaxValueOuterRadiusMaxValue",
    header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual double GetInnerRadiusOuterRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OuterRadius  of  << this -> OuterRadius ) ; return this -> OuterRadius ; } ;
## Error: expected ';'!!!

proc SetInnerRadiusOuterRadiusRadialResolution*(this: var vtkDiskSource; _arg: cint) {.
    importcpp: "SetInnerRadiusOuterRadiusRadialResolution",
    header: "vtkDiskSource.h".}
proc GetInnerRadiusMinValueOuterRadiusMinValueRadialResolutionMinValue*(
    this: var vtkDiskSource): cint {.importcpp: "GetInnerRadiusMinValueOuterRadiusMinValueRadialResolutionMinValue",
                                 header: "vtkDiskSource.h".}
proc GetInnerRadiusMaxValueOuterRadiusMaxValueRadialResolutionMaxValue*(
    this: var vtkDiskSource): cint {.importcpp: "GetInnerRadiusMaxValueOuterRadiusMaxValueRadialResolutionMaxValue",
                                 header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual int GetInnerRadiusOuterRadiusRadialResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RadialResolution  of  << this -> RadialResolution ) ; return this -> RadialResolution ; } ;
## Error: expected ';'!!!

proc SetInnerRadiusOuterRadiusRadialResolutionCircumferentialResolution*(
    this: var vtkDiskSource; _arg: cint) {.importcpp: "SetInnerRadiusOuterRadiusRadialResolutionCircumferentialResolution",
                                      header: "vtkDiskSource.h".}
proc GetInnerRadiusMinValueOuterRadiusMinValueRadialResolutionMinValueCircumferentialResolutionMinValue*(
    this: var vtkDiskSource): cint {.importcpp: "GetInnerRadiusMinValueOuterRadiusMinValueRadialResolutionMinValueCircumferentialResolutionMinValue",
                                 header: "vtkDiskSource.h".}
proc GetInnerRadiusMaxValueOuterRadiusMaxValueRadialResolutionMaxValueCircumferentialResolutionMaxValue*(
    this: var vtkDiskSource): cint {.importcpp: "GetInnerRadiusMaxValueOuterRadiusMaxValueRadialResolutionMaxValueCircumferentialResolutionMaxValue",
                                 header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual int GetInnerRadiusOuterRadiusRadialResolutionCircumferentialResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CircumferentialResolution  of  << this -> CircumferentialResolution ) ; return this -> CircumferentialResolution ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkDiskSource; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenter", header: "vtkDiskSource.h".}
proc SetCenter*(this: var vtkDiskSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetCenterNormal*(this: var vtkDiskSource; _arg1: cdouble; _arg2: cdouble;
                     _arg3: cdouble) {.importcpp: "SetCenterNormal",
                                     header: "vtkDiskSource.h".}
proc SetCenterNormal*(this: var vtkDiskSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenterNormal", header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual double * GetCenterNormal ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Normal  pointer  << this -> Normal ) ; return this -> Normal ; } VTK_WRAPEXCLUDE virtual void GetCenterNormal ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Normal [ i ] ; } } ;
## Error: expected ';'!!!

proc SetOutputPointsPrecision*(this: var vtkDiskSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkDiskSource.h".}
## !!!Ignored construct:  virtual int GetInnerRadiusOuterRadiusRadialResolutionCircumferentialResolutionOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
