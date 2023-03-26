## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArrowSource.h
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
##  @class   vtkArrowSource
##  @brief   Appends a cylinder to a cone to form an arrow.
##
##  vtkArrowSource was intended to be used as the source for a glyph.
##  The shaft base is always at (0,0,0). The arrow tip is always at (1,0,0). If
##  "Invert" is true, then the ends are flipped i.e. tip is at (0,0,0) while
##  base is at (1, 0, 0).
##  The resolution of the cone and shaft can be set and default to 6.
##  The radius of the cone and shaft can be set and default to 0.03 and 0.1.
##  The length of the tip can also be set, and defaults to 0.35.
##

import
  vtkFiltersSourcesModule, vtkPolyDataAlgorithm

type
  vtkArrowSource* {.importcpp: "vtkArrowSource", header: "vtkArrowSource.h", bycopy.} = object of vtkPolyDataAlgorithm ## *
                                                                                                             ##  Construct cone with angle of 45 degrees.
                                                                                                             ##
    vtkArrowSource* {.importc: "vtkArrowSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkArrowSource {.importcpp: "vtkArrowSource::New(@)",
                              header: "vtkArrowSource.h".}
type
  vtkArrowSourceSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkArrowSource::IsTypeOf(@)", header: "vtkArrowSource.h".}
proc IsA*(this: var vtkArrowSource; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkArrowSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkArrowSource {.
    importcpp: "vtkArrowSource::SafeDownCast(@)", header: "vtkArrowSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkArrowSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkArrowSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkArrowSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkArrowSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkArrowSource.h".}
proc SetTipLength*(this: var vtkArrowSource; _arg: cdouble) {.
    importcpp: "SetTipLength", header: "vtkArrowSource.h".}
proc GetTipLengthMinValue*(this: var vtkArrowSource): cdouble {.
    importcpp: "GetTipLengthMinValue", header: "vtkArrowSource.h".}
proc GetTipLengthMaxValue*(this: var vtkArrowSource): cdouble {.
    importcpp: "GetTipLengthMaxValue", header: "vtkArrowSource.h".}
## !!!Ignored construct:  virtual double GetTipLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TipLength  of  << this -> TipLength ) ; return this -> TipLength ; } ;
## Error: expected ';'!!!

proc SetTipLengthTipRadius*(this: var vtkArrowSource; _arg: cdouble) {.
    importcpp: "SetTipLengthTipRadius", header: "vtkArrowSource.h".}
proc GetTipLengthMinValueTipRadiusMinValue*(this: var vtkArrowSource): cdouble {.
    importcpp: "GetTipLengthMinValueTipRadiusMinValue", header: "vtkArrowSource.h".}
proc GetTipLengthMaxValueTipRadiusMaxValue*(this: var vtkArrowSource): cdouble {.
    importcpp: "GetTipLengthMaxValueTipRadiusMaxValue", header: "vtkArrowSource.h".}
## !!!Ignored construct:  virtual double GetTipLengthTipRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TipRadius  of  << this -> TipRadius ) ; return this -> TipRadius ; } ;
## Error: expected ';'!!!

proc SetTipLengthTipRadiusTipResolution*(this: var vtkArrowSource; _arg: cint) {.
    importcpp: "SetTipLengthTipRadiusTipResolution", header: "vtkArrowSource.h".}
proc GetTipLengthMinValueTipRadiusMinValueTipResolutionMinValue*(
    this: var vtkArrowSource): cint {.importcpp: "GetTipLengthMinValueTipRadiusMinValueTipResolutionMinValue",
                                  header: "vtkArrowSource.h".}
proc GetTipLengthMaxValueTipRadiusMaxValueTipResolutionMaxValue*(
    this: var vtkArrowSource): cint {.importcpp: "GetTipLengthMaxValueTipRadiusMaxValueTipResolutionMaxValue",
                                  header: "vtkArrowSource.h".}
## !!!Ignored construct:  virtual int GetTipLengthTipRadiusTipResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TipResolution  of  << this -> TipResolution ) ; return this -> TipResolution ; } ;
## Error: expected ';'!!!

proc SetTipLengthTipRadiusTipResolutionShaftRadius*(this: var vtkArrowSource;
    _arg: cdouble) {.importcpp: "SetTipLengthTipRadiusTipResolutionShaftRadius",
                   header: "vtkArrowSource.h".}
proc GetTipLengthMinValueTipRadiusMinValueTipResolutionMinValueShaftRadiusMinValue*(
    this: var vtkArrowSource): cdouble {.importcpp: "GetTipLengthMinValueTipRadiusMinValueTipResolutionMinValueShaftRadiusMinValue",
                                     header: "vtkArrowSource.h".}
proc GetTipLengthMaxValueTipRadiusMaxValueTipResolutionMaxValueShaftRadiusMaxValue*(
    this: var vtkArrowSource): cdouble {.importcpp: "GetTipLengthMaxValueTipRadiusMaxValueTipResolutionMaxValueShaftRadiusMaxValue",
                                     header: "vtkArrowSource.h".}
## !!!Ignored construct:  virtual double GetTipLengthTipRadiusTipResolutionShaftRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShaftRadius  of  << this -> ShaftRadius ) ; return this -> ShaftRadius ; } ;
## Error: expected ';'!!!

proc SetTipLengthTipRadiusTipResolutionShaftRadiusShaftResolution*(
    this: var vtkArrowSource; _arg: cint) {.importcpp: "SetTipLengthTipRadiusTipResolutionShaftRadiusShaftResolution",
                                       header: "vtkArrowSource.h".}
proc GetTipLengthMinValueTipRadiusMinValueTipResolutionMinValueShaftRadiusMinValueShaftResolutionMinValue*(
    this: var vtkArrowSource): cint {.importcpp: "GetTipLengthMinValueTipRadiusMinValueTipResolutionMinValueShaftRadiusMinValueShaftResolutionMinValue",
                                  header: "vtkArrowSource.h".}
proc GetTipLengthMaxValueTipRadiusMaxValueTipResolutionMaxValueShaftRadiusMaxValueShaftResolutionMaxValue*(
    this: var vtkArrowSource): cint {.importcpp: "GetTipLengthMaxValueTipRadiusMaxValueTipResolutionMaxValueShaftRadiusMaxValueShaftResolutionMaxValue",
                                  header: "vtkArrowSource.h".}
## !!!Ignored construct:  virtual int GetTipLengthTipRadiusTipResolutionShaftRadiusShaftResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ShaftResolution  of  << this -> ShaftResolution ) ; return this -> ShaftResolution ; } ;
## Error: expected ';'!!!

proc InvertOn*(this: var vtkArrowSource) {.importcpp: "InvertOn",
                                       header: "vtkArrowSource.h".}
proc InvertOff*(this: var vtkArrowSource) {.importcpp: "InvertOff",
                                        header: "vtkArrowSource.h".}
proc SetInvert*(this: var vtkArrowSource; _arg: bool) {.importcpp: "SetInvert",
    header: "vtkArrowSource.h".}
## !!!Ignored construct:  virtual bool GetTipLengthTipRadiusTipResolutionShaftRadiusShaftResolutionInvert ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Invert  of  << this -> Invert ) ; return this -> Invert ; } ;
## Error: expected ';'!!!

type
  vtkArrowSourceArrowOrigins* {.size: sizeof(cint),
                               importcpp: "vtkArrowSource::ArrowOrigins",
                               header: "vtkArrowSource.h".} = enum
    Default = 0, Center = 1


proc SetArrowOrigin*(this: var vtkArrowSource; _arg: vtkArrowSourceArrowOrigins) {.
    importcpp: "SetArrowOrigin", header: "vtkArrowSource.h".}
proc GetArrowOrigin*(this: vtkArrowSource): vtkArrowSourceArrowOrigins {.
    noSideEffect, importcpp: "GetArrowOrigin", header: "vtkArrowSource.h".}
  ## /@}
proc SetArrowOriginToDefault*(this: var vtkArrowSource) {.
    importcpp: "SetArrowOriginToDefault", header: "vtkArrowSource.h".}
proc SetArrowOriginToCenter*(this: var vtkArrowSource) {.
    importcpp: "SetArrowOriginToCenter", header: "vtkArrowSource.h".}
proc GetArrowOriginAsString*(this: vtkArrowSource): string {.noSideEffect,
    importcpp: "GetArrowOriginAsString", header: "vtkArrowSource.h".}