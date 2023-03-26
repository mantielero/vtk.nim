## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCubeSource.h
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
##  @class   vtkCubeSource
##  @brief   create a polygonal representation of a cube
##
##  vtkCubeSource creates a cube centered at origin. The cube is represented
##  with four-sided polygons. It is possible to specify the length, width,
##  and height of the cube independently.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkCubeSource* {.importcpp: "vtkCubeSource", header: "vtkCubeSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkCubeSource* {.importc: "vtkCubeSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkCubeSource {.importcpp: "vtkCubeSource::New(@)",
                             header: "vtkCubeSource.h".}
type
  vtkCubeSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCubeSource::IsTypeOf(@)", header: "vtkCubeSource.h".}
proc IsA*(this: var vtkCubeSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkCubeSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCubeSource {.
    importcpp: "vtkCubeSource::SafeDownCast(@)", header: "vtkCubeSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCubeSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCubeSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCubeSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCubeSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCubeSource.h".}
proc SetXLength*(this: var vtkCubeSource; _arg: cdouble) {.importcpp: "SetXLength",
    header: "vtkCubeSource.h".}
proc GetXLengthMinValue*(this: var vtkCubeSource): cdouble {.
    importcpp: "GetXLengthMinValue", header: "vtkCubeSource.h".}
proc GetXLengthMaxValue*(this: var vtkCubeSource): cdouble {.
    importcpp: "GetXLengthMaxValue", header: "vtkCubeSource.h".}
## !!!Ignored construct:  virtual double GetXLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XLength  of  << this -> XLength ) ; return this -> XLength ; } ;
## Error: expected ';'!!!

proc SetXLengthYLength*(this: var vtkCubeSource; _arg: cdouble) {.
    importcpp: "SetXLengthYLength", header: "vtkCubeSource.h".}
proc GetXLengthMinValueYLengthMinValue*(this: var vtkCubeSource): cdouble {.
    importcpp: "GetXLengthMinValueYLengthMinValue", header: "vtkCubeSource.h".}
proc GetXLengthMaxValueYLengthMaxValue*(this: var vtkCubeSource): cdouble {.
    importcpp: "GetXLengthMaxValueYLengthMaxValue", header: "vtkCubeSource.h".}
## !!!Ignored construct:  virtual double GetXLengthYLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YLength  of  << this -> YLength ) ; return this -> YLength ; } ;
## Error: expected ';'!!!

proc SetXLengthYLengthZLength*(this: var vtkCubeSource; _arg: cdouble) {.
    importcpp: "SetXLengthYLengthZLength", header: "vtkCubeSource.h".}
proc GetXLengthMinValueYLengthMinValueZLengthMinValue*(this: var vtkCubeSource): cdouble {.
    importcpp: "GetXLengthMinValueYLengthMinValueZLengthMinValue",
    header: "vtkCubeSource.h".}
proc GetXLengthMaxValueYLengthMaxValueZLengthMaxValue*(this: var vtkCubeSource): cdouble {.
    importcpp: "GetXLengthMaxValueYLengthMaxValueZLengthMaxValue",
    header: "vtkCubeSource.h".}
## !!!Ignored construct:  virtual double GetXLengthYLengthZLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZLength  of  << this -> ZLength ) ; return this -> ZLength ; } ;
## Error: expected ';'!!!

proc SetCenter*(this: var vtkCubeSource; _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetCenter", header: "vtkCubeSource.h".}
proc SetCenter*(this: var vtkCubeSource; _arg: array[3, cdouble]) {.
    importcpp: "SetCenter", header: "vtkCubeSource.h".}
## !!!Ignored construct:  virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Center [ i ] ; } } ;
## Error: expected ';'!!!

proc SetBounds*(this: var vtkCubeSource; xMin: cdouble; xMax: cdouble; yMin: cdouble;
               yMax: cdouble; zMin: cdouble; zMax: cdouble) {.importcpp: "SetBounds",
    header: "vtkCubeSource.h".}
proc SetBounds*(this: var vtkCubeSource; bounds: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkCubeSource.h".}
proc GetBounds*(this: var vtkCubeSource; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkCubeSource.h".}
proc SetOutputPointsPrecision*(this: var vtkCubeSource; _arg: cint) {.
    importcpp: "SetOutputPointsPrecision", header: "vtkCubeSource.h".}
## !!!Ignored construct:  virtual int GetXLengthYLengthZLengthOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
