## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkHDRReader.h
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
##  @class   vtkHDRReader
##  @brief   read Radiance HDR files
##
##  vtkHDRReader is a source object that reads Radiance HDR files.
##  HDR files are converted into 32 bit images.
##

import
  vtkIOImageModule, vtkImageReader

type
  vtkHDRReader* {.importcpp: "vtkHDRReader", header: "vtkHDRReader.h", bycopy.} = object of vtkImageReader
    vtkHDRReader* {.importc: "vtkHDRReader".}: VTK_NEWINSTANCE
    ## *
    ##  If true, the X axis has been flipped.
    ##
    ## *
    ##  If true, the Y axis is the X, and the height and width has been swapped.
    ##


proc New*(): ptr vtkHDRReader {.importcpp: "vtkHDRReader::New(@)",
                            header: "vtkHDRReader.h".}
type
  vtkHDRReaderSuperclass* = vtkImageReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkHDRReader::IsTypeOf(@)", header: "vtkHDRReader.h".}
proc IsA*(this: var vtkHDRReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkHDRReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkHDRReader {.
    importcpp: "vtkHDRReader::SafeDownCast(@)", header: "vtkHDRReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkHDRReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkHDRReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkHDRReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkHDRReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkHDRReader.h".}
type
  vtkHDRReaderFormatType* {.size: sizeof(cint),
                           importcpp: "vtkHDRReader::FormatType",
                           header: "vtkHDRReader.h".} = enum
    FORMAT_32BIT_RLE_RGBE = 0, FORMAT_32BIT_RLE_XYZE


## !!!Ignored construct:  /@{ *
##  Format is either 32-bit_rle_rgbe or 32-bit_rle_xyze.
##  virtual int GetFormatFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Format  of  << this -> Format ) ; return this -> Format ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get gamma correction.
##  Default value is 1.0.
##  virtual double GetFormatFormatGammaGamma ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Gamma  of  << this -> Gamma ) ; return this -> Gamma ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get exposure.
##  Default value is 1.0.
##  virtual double GetFormatFormatGammaGammaExposureExposure ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Exposure  of  << this -> Exposure ) ; return this -> Exposure ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Get pixel aspect, the ratio of height by the width of a pixel.
##  Default value is 1.0.
##  virtual double GetFormatFormatGammaGammaExposureExposurePixelAspectPixelAspect ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PixelAspect  of  << this -> PixelAspect ) ; return this -> PixelAspect ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Is the given file a HDR file?
##  int CanReadFile ( VTK_FILEPATH const char * fname ) override ;
## Error: token expected: ) but got: *!!!

proc GetFileExtensions*(this: var vtkHDRReader): cstring {.
    importcpp: "GetFileExtensions", header: "vtkHDRReader.h".}
proc GetDescriptiveName*(this: var vtkHDRReader): cstring {.
    importcpp: "GetDescriptiveName", header: "vtkHDRReader.h".}