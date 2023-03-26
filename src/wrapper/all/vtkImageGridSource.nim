## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageGridSource.h
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
##  @class   vtkImageGridSource
##  @brief   Create an image of a grid.
##
##  vtkImageGridSource produces an image of a grid.  The
##  default output type is double.
##

import
  vtkImageAlgorithm, vtkImagingSourcesModule

type
  vtkImageGridSource* {.importcpp: "vtkImageGridSource",
                       header: "vtkImageGridSource.h", bycopy.} = object of vtkImageAlgorithm
    vtkImageGridSource* {.importc: "vtkImageGridSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageGridSource {.importcpp: "vtkImageGridSource::New(@)",
                                  header: "vtkImageGridSource.h".}
type
  vtkImageGridSourceSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageGridSource::IsTypeOf(@)", header: "vtkImageGridSource.h".}
proc IsA*(this: var vtkImageGridSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageGridSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageGridSource {.
    importcpp: "vtkImageGridSource::SafeDownCast(@)",
    header: "vtkImageGridSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageGridSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageGridSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageGridSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageGridSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageGridSource.h".}
proc SetGridSpacing*(this: var vtkImageGridSource; _arg1: cint; _arg2: cint; _arg3: cint) {.
    importcpp: "SetGridSpacing", header: "vtkImageGridSource.h".}
proc SetGridSpacing*(this: var vtkImageGridSource; _arg: array[3, cint]) {.
    importcpp: "SetGridSpacing", header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual int * GetGridSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridSpacing  pointer  << this -> GridSpacing ) ; return this -> GridSpacing ; } VTK_WRAPEXCLUDE virtual void GetGridSpacing ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> GridSpacing [ 0 ] ; _arg2 = this -> GridSpacing [ 1 ] ; _arg3 = this -> GridSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridSpacing ( int _arg [ 3 ] ) { this -> GetGridSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetGridSpacingGridOrigin*(this: var vtkImageGridSource; _arg1: cint; _arg2: cint;
                              _arg3: cint) {.
    importcpp: "SetGridSpacingGridOrigin", header: "vtkImageGridSource.h".}
proc SetGridSpacingGridOrigin*(this: var vtkImageGridSource; _arg: array[3, cint]) {.
    importcpp: "SetGridSpacingGridOrigin", header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual int * GetGridSpacingGridOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << GridOrigin  pointer  << this -> GridOrigin ) ; return this -> GridOrigin ; } VTK_WRAPEXCLUDE virtual void GetGridSpacingGridOrigin ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> GridOrigin [ 0 ] ; _arg2 = this -> GridOrigin [ 1 ] ; _arg3 = this -> GridOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << GridOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridSpacingGridOrigin ( int _arg [ 3 ] ) { this -> GetGridSpacingGridOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetLineValue*(this: var vtkImageGridSource; _arg: cdouble) {.
    importcpp: "SetLineValue", header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual double GetLineValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LineValue  of  << this -> LineValue ) ; return this -> LineValue ; } ;
## Error: expected ';'!!!

proc SetLineValueFillValue*(this: var vtkImageGridSource; _arg: cdouble) {.
    importcpp: "SetLineValueFillValue", header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual double GetLineValueFillValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FillValue  of  << this -> FillValue ) ; return this -> FillValue ; } ;
## Error: expected ';'!!!

proc SetLineValueFillValueDataScalarType*(this: var vtkImageGridSource; _arg: cint) {.
    importcpp: "SetLineValueFillValueDataScalarType",
    header: "vtkImageGridSource.h".}
proc SetDataScalarTypeToDouble*(this: var vtkImageGridSource) {.
    importcpp: "SetDataScalarTypeToDouble", header: "vtkImageGridSource.h".}
proc SetDataScalarTypeToInt*(this: var vtkImageGridSource) {.
    importcpp: "SetDataScalarTypeToInt", header: "vtkImageGridSource.h".}
proc SetDataScalarTypeToShort*(this: var vtkImageGridSource) {.
    importcpp: "SetDataScalarTypeToShort", header: "vtkImageGridSource.h".}
proc SetDataScalarTypeToUnsignedShort*(this: var vtkImageGridSource) {.
    importcpp: "SetDataScalarTypeToUnsignedShort", header: "vtkImageGridSource.h".}
proc SetDataScalarTypeToUnsignedChar*(this: var vtkImageGridSource) {.
    importcpp: "SetDataScalarTypeToUnsignedChar", header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual int GetLineValueFillValueDataScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DataScalarType  of  << this -> DataScalarType ) ; return this -> DataScalarType ; } ;
## Error: expected ';'!!!

proc GetDataScalarTypeAsString*(this: var vtkImageGridSource): cstring {.
    importcpp: "GetDataScalarTypeAsString", header: "vtkImageGridSource.h".}
proc SetDataExtent*(this: var vtkImageGridSource; _arg1: cint; _arg2: cint; _arg3: cint;
                   _arg4: cint; _arg5: cint; _arg6: cint) {.
    importcpp: "SetDataExtent", header: "vtkImageGridSource.h".}
proc SetDataExtent*(this: var vtkImageGridSource; _arg: array[6, cint]) {.
    importcpp: "SetDataExtent", header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual int * GetDataExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataExtent  pointer  << this -> DataExtent ) ; return this -> DataExtent ; } VTK_WRAPEXCLUDE virtual void GetDataExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> DataExtent [ 0 ] ; _arg2 = this -> DataExtent [ 1 ] ; _arg3 = this -> DataExtent [ 2 ] ; _arg4 = this -> DataExtent [ 3 ] ; _arg5 = this -> DataExtent [ 4 ] ; _arg6 = this -> DataExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetDataExtent ( int _arg [ 6 ] ) { this -> GetDataExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetGridSpacingGridOriginDataSpacing*(this: var vtkImageGridSource;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetGridSpacingGridOriginDataSpacing",
    header: "vtkImageGridSource.h".}
proc SetGridSpacingGridOriginDataSpacing*(this: var vtkImageGridSource;
    _arg: array[3, cdouble]) {.importcpp: "SetGridSpacingGridOriginDataSpacing",
                            header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual double * GetGridSpacingGridOriginDataSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  pointer  << this -> DataSpacing ) ; return this -> DataSpacing ; } VTK_WRAPEXCLUDE virtual void GetGridSpacingGridOriginDataSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataSpacing [ 0 ] ; _arg2 = this -> DataSpacing [ 1 ] ; _arg3 = this -> DataSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridSpacingGridOriginDataSpacing ( double _arg [ 3 ] ) { this -> GetGridSpacingGridOriginDataSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetGridSpacingGridOriginDataSpacingDataOrigin*(this: var vtkImageGridSource;
    _arg1: cdouble; _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetGridSpacingGridOriginDataSpacingDataOrigin",
    header: "vtkImageGridSource.h".}
proc SetGridSpacingGridOriginDataSpacingDataOrigin*(this: var vtkImageGridSource;
    _arg: array[3, cdouble]) {.importcpp: "SetGridSpacingGridOriginDataSpacingDataOrigin",
                            header: "vtkImageGridSource.h".}
## !!!Ignored construct:  virtual double * GetGridSpacingGridOriginDataSpacingDataOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  pointer  << this -> DataOrigin ) ; return this -> DataOrigin ; } VTK_WRAPEXCLUDE virtual void GetGridSpacingGridOriginDataSpacingDataOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> DataOrigin [ 0 ] ; _arg2 = this -> DataOrigin [ 1 ] ; _arg3 = this -> DataOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << DataOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetGridSpacingGridOriginDataSpacingDataOrigin ( double _arg [ 3 ] ) { this -> GetGridSpacingGridOriginDataSpacingDataOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
