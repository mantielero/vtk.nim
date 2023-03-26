## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMapToColors.h
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
##  @class   vtkImageMapToColors
##  @brief   map the input image through a lookup table
##
##  The vtkImageMapToColors filter will take an input image of any valid
##  scalar type, and map the first component of the image through a
##  lookup table.  The result is an image of type VTK_UNSIGNED_CHAR.
##  If the lookup table is not set, or is set to nullptr, then the input
##  data will be passed through if it is already of type VTK_UNSIGNED_CHAR.
##
##  @sa
##  vtkLookupTable vtkScalarsToColors
##

import
  vtkImagingCoreModule, vtkThreadedImageAlgorithm

discard "forward decl of vtkScalarsToColors"
type
  vtkImageMapToColors* {.importcpp: "vtkImageMapToColors",
                        header: "vtkImageMapToColors.h", bycopy.} = object of vtkThreadedImageAlgorithm
    vtkImageMapToColors* {.importc: "vtkImageMapToColors".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageMapToColors {.importcpp: "vtkImageMapToColors::New(@)",
                                   header: "vtkImageMapToColors.h".}
type
  vtkImageMapToColorsSuperclass* = vtkThreadedImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageMapToColors::IsTypeOf(@)", header: "vtkImageMapToColors.h".}
proc IsA*(this: var vtkImageMapToColors; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageMapToColors.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageMapToColors {.
    importcpp: "vtkImageMapToColors::SafeDownCast(@)",
    header: "vtkImageMapToColors.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageMapToColors :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMapToColors :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMapToColors :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageMapToColors; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageMapToColors.h".}
proc SetLookupTable*(this: var vtkImageMapToColors; a2: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkImageMapToColors.h".}
proc GetnameLookupTable*(this: var vtkImageMapToColors): ptr vtkScalarsToColors {.
    importcpp: "GetnameLookupTable", header: "vtkImageMapToColors.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the output format, the default is RGBA.
  ##
proc SetOutputFormat*(this: var vtkImageMapToColors; _arg: cint) {.
    importcpp: "SetOutputFormat", header: "vtkImageMapToColors.h".}
## !!!Ignored construct:  virtual int GetOutputFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputFormat  of  << this -> OutputFormat ) ; return this -> OutputFormat ; } ;
## Error: expected ';'!!!

proc SetOutputFormatToRGBA*(this: var vtkImageMapToColors) {.
    importcpp: "SetOutputFormatToRGBA", header: "vtkImageMapToColors.h".}
proc SetOutputFormatToRGB*(this: var vtkImageMapToColors) {.
    importcpp: "SetOutputFormatToRGB", header: "vtkImageMapToColors.h".}
proc SetOutputFormatToLuminanceAlpha*(this: var vtkImageMapToColors) {.
    importcpp: "SetOutputFormatToLuminanceAlpha", header: "vtkImageMapToColors.h".}
proc SetOutputFormatToLuminance*(this: var vtkImageMapToColors) {.
    importcpp: "SetOutputFormatToLuminance", header: "vtkImageMapToColors.h".}
proc SetOutputFormatActiveComponent*(this: var vtkImageMapToColors; _arg: cint) {.
    importcpp: "SetOutputFormatActiveComponent", header: "vtkImageMapToColors.h".}
## !!!Ignored construct:  virtual int GetOutputFormatActiveComponent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActiveComponent  of  << this -> ActiveComponent ) ; return this -> ActiveComponent ; } ;
## Error: expected ';'!!!

proc SetOutputFormatActiveComponentPassAlphaToOutput*(
    this: var vtkImageMapToColors; _arg: vtkTypeBool) {.
    importcpp: "SetOutputFormatActiveComponentPassAlphaToOutput",
    header: "vtkImageMapToColors.h".}
proc PassAlphaToOutputOn*(this: var vtkImageMapToColors) {.
    importcpp: "PassAlphaToOutputOn", header: "vtkImageMapToColors.h".}
proc PassAlphaToOutputOff*(this: var vtkImageMapToColors) {.
    importcpp: "PassAlphaToOutputOff", header: "vtkImageMapToColors.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetOutputFormatActiveComponentPassAlphaToOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassAlphaToOutput  of  << this -> PassAlphaToOutput ) ; return this -> PassAlphaToOutput ; } ;
## Error: expected ';'!!!

proc GetMTime*(this: var vtkImageMapToColors): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImageMapToColors.h".}
proc SetNaNColor*(this: var vtkImageMapToColors; _arg1: cuchar; _arg2: cuchar;
                 _arg3: cuchar; _arg4: cuchar) {.importcpp: "SetNaNColor",
    header: "vtkImageMapToColors.h".}
proc SetNaNColor*(this: var vtkImageMapToColors; _arg: array[4, cuchar]) {.
    importcpp: "SetNaNColor", header: "vtkImageMapToColors.h".}
## !!!Ignored construct:  virtual unsigned char * GetNaNColor ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << NaNColor  pointer  << this -> NaNColor ) ; return this -> NaNColor ; } VTK_WRAPEXCLUDE virtual void GetNaNColor ( unsigned char & _arg1 , unsigned char & _arg2 , unsigned char & _arg3 , unsigned char & _arg4 ) { _arg1 = this -> NaNColor [ 0 ] ; _arg2 = this -> NaNColor [ 1 ] ; _arg3 = this -> NaNColor [ 2 ] ; _arg4 = this -> NaNColor [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << NaNColor  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetNaNColor ( unsigned char _arg [ 4 ] ) { this -> GetNaNColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!
