## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageResliceToColors.h
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
##  @class   vtkImageResliceToColors
##  @brief   Reslice and produce color scalars.
##
##  vtkImageResliceToColors is an extension of vtkImageReslice that
##  produces color scalars.  It should be provided with a lookup table
##  that defines the output colors and the desired range of input values
##  to map to those colors.  If the input has multiple components, then
##  you should use the SetVectorMode() method of the lookup table to
##  specify how the vectors will be colored.  If no lookup table is
##  provided, then the input must already be color scalars, but they
##  will be converted to the specified output format.
##  @sa
##  vtkImageMapToColors
##

import
  vtkImageReslice, vtkImagingCoreModule

discard "forward decl of vtkScalarsToColors"
type
  vtkImageResliceToColors* {.importcpp: "vtkImageResliceToColors",
                            header: "vtkImageResliceToColors.h", bycopy.} = object of vtkImageReslice
    vtkImageResliceToColors* {.importc: "vtkImageResliceToColors".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageResliceToColors {.importcpp: "vtkImageResliceToColors::New(@)",
                                       header: "vtkImageResliceToColors.h".}
type
  vtkImageResliceToColorsSuperclass* = vtkImageReslice

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageResliceToColors::IsTypeOf(@)",
    header: "vtkImageResliceToColors.h".}
proc IsA*(this: var vtkImageResliceToColors; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageResliceToColors.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageResliceToColors {.
    importcpp: "vtkImageResliceToColors::SafeDownCast(@)",
    header: "vtkImageResliceToColors.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageResliceToColors :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageResliceToColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageResliceToColors :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageResliceToColors; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageResliceToColors.h".}
proc SetLookupTable*(this: var vtkImageResliceToColors;
                    table: ptr vtkScalarsToColors) {.importcpp: "SetLookupTable",
    header: "vtkImageResliceToColors.h".}
proc GetnameLookupTable*(this: var vtkImageResliceToColors): ptr vtkScalarsToColors {.
    importcpp: "GetnameLookupTable", header: "vtkImageResliceToColors.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the output format, the default is RGBA.
  ##
proc SetOutputFormat*(this: var vtkImageResliceToColors; _arg: cint) {.
    importcpp: "SetOutputFormat", header: "vtkImageResliceToColors.h".}
proc GetOutputFormatMinValue*(this: var vtkImageResliceToColors): cint {.
    importcpp: "GetOutputFormatMinValue", header: "vtkImageResliceToColors.h".}
proc GetOutputFormatMaxValue*(this: var vtkImageResliceToColors): cint {.
    importcpp: "GetOutputFormatMaxValue", header: "vtkImageResliceToColors.h".}
## !!!Ignored construct:  virtual int GetOutputFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputFormat  of  << this -> OutputFormat ) ; return this -> OutputFormat ; } ;
## Error: expected ';'!!!

proc SetOutputFormatToRGBA*(this: var vtkImageResliceToColors) {.
    importcpp: "SetOutputFormatToRGBA", header: "vtkImageResliceToColors.h".}
proc SetOutputFormatToRGB*(this: var vtkImageResliceToColors) {.
    importcpp: "SetOutputFormatToRGB", header: "vtkImageResliceToColors.h".}
proc SetOutputFormatToLuminanceAlpha*(this: var vtkImageResliceToColors) {.
    importcpp: "SetOutputFormatToLuminanceAlpha",
    header: "vtkImageResliceToColors.h".}
proc SetOutputFormatToLuminance*(this: var vtkImageResliceToColors) {.
    importcpp: "SetOutputFormatToLuminance", header: "vtkImageResliceToColors.h".}
proc SetBypass*(this: var vtkImageResliceToColors; bypass: cint) {.
    importcpp: "SetBypass", header: "vtkImageResliceToColors.h".}
proc BypassOn*(this: var vtkImageResliceToColors) {.importcpp: "BypassOn",
    header: "vtkImageResliceToColors.h".}
proc BypassOff*(this: var vtkImageResliceToColors) {.importcpp: "BypassOff",
    header: "vtkImageResliceToColors.h".}
proc GetBypass*(this: var vtkImageResliceToColors): cint {.importcpp: "GetBypass",
    header: "vtkImageResliceToColors.h".}
proc GetMTime*(this: var vtkImageResliceToColors): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkImageResliceToColors.h".}