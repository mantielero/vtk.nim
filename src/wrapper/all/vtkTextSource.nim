## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTextSource.h
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
##  @class   vtkTextSource
##  @brief   create polygonal text
##
##  vtkTextSource converts a text string into polygons.  This way you can
##  insert text into your renderings. It uses the 9x15 font from X Windows.
##  You can specify if you want the background to be drawn or not. The
##  characters are formed by scan converting the raster font into
##  quadrilaterals. Colors are assigned to the letters using scalar data.
##  To set the color of the characters with the source's actor property, set
##  BackingOff on the text source and ScalarVisibilityOff on the associated
##  vtkPolyDataMapper. Then, the color can be set using the associated actor's
##  property.
##
##  vtkVectorText generates higher quality polygonal representations of
##  characters.
##
##  @sa
##  vtkVectorText
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkTextSource* {.importcpp: "vtkTextSource", header: "vtkTextSource.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkTextSource* {.importc: "vtkTextSource".}: VTK_NEWINSTANCE

  vtkTextSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTextSource::IsTypeOf(@)", header: "vtkTextSource.h".}
proc IsA*(this: var vtkTextSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTextSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTextSource {.
    importcpp: "vtkTextSource::SafeDownCast(@)", header: "vtkTextSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTextSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTextSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTextSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTextSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTextSource.h".}
proc New*(): ptr vtkTextSource {.importcpp: "vtkTextSource::New(@)",
                             header: "vtkTextSource.h".}
proc SetText*(this: var vtkTextSource; _arg: cstring) {.importcpp: "SetText",
    header: "vtkTextSource.h".}
proc GetText*(this: var vtkTextSource): cstring {.importcpp: "GetText",
    header: "vtkTextSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Controls whether or not a background is drawn with the text.
  ##
proc SetBacking*(this: var vtkTextSource; _arg: vtkTypeBool) {.
    importcpp: "SetBacking", header: "vtkTextSource.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetBacking ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Backing  of  << this -> Backing ) ; return this -> Backing ; } ;
## Error: expected ';'!!!

proc BackingOn*(this: var vtkTextSource) {.importcpp: "BackingOn",
                                       header: "vtkTextSource.h".}
proc BackingOff*(this: var vtkTextSource) {.importcpp: "BackingOff",
                                        header: "vtkTextSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the foreground color. Default is white (1,1,1). ALpha is always 1.
  ##
proc SetForegroundColor*(this: var vtkTextSource; _arg1: cdouble; _arg2: cdouble;
                        _arg3: cdouble) {.importcpp: "SetForegroundColor",
                                        header: "vtkTextSource.h".}
proc SetForegroundColor*(this: var vtkTextSource; _arg: array[3, cdouble]) {.
    importcpp: "SetForegroundColor", header: "vtkTextSource.h".}
## !!!Ignored construct:  virtual double * GetForegroundColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ForegroundColor  pointer  << this -> ForegroundColor ) ; return this -> ForegroundColor ; } VTK_WRAPEXCLUDE virtual void GetForegroundColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> ForegroundColor [ i ] ; } } ;
## Error: expected ';'!!!

proc SetForegroundColorBackgroundColor*(this: var vtkTextSource; _arg1: cdouble;
                                       _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetForegroundColorBackgroundColor", header: "vtkTextSource.h".}
proc SetForegroundColorBackgroundColor*(this: var vtkTextSource;
                                       _arg: array[3, cdouble]) {.
    importcpp: "SetForegroundColorBackgroundColor", header: "vtkTextSource.h".}
## !!!Ignored construct:  virtual double * GetForegroundColorBackgroundColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundColor  pointer  << this -> BackgroundColor ) ; return this -> BackgroundColor ; } VTK_WRAPEXCLUDE virtual void GetForegroundColorBackgroundColor ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> BackgroundColor [ i ] ; } } ;
## Error: expected ';'!!!

proc SetBackingOutputPointsPrecision*(this: var vtkTextSource; _arg: cint) {.
    importcpp: "SetBackingOutputPointsPrecision", header: "vtkTextSource.h".}
## !!!Ignored construct:  virtual int GetBackingOutputPointsPrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputPointsPrecision  of  << this -> OutputPointsPrecision ) ; return this -> OutputPointsPrecision ; } ;
## Error: expected ';'!!!
