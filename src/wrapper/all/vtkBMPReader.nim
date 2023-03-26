## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBMPReader.h
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
##  @class   vtkBMPReader
##  @brief   read Windows BMP files
##
##  vtkBMPReader is a source object that reads Windows BMP files.
##  This includes indexed and 24bit bitmaps
##  Usually, all BMPs are converted to 24bit RGB, but BMPs may be output
##  as 8bit images with a LookupTable if the Allow8BitBMP flag is set.
##
##  BMPReader creates structured point datasets. The dimension of the
##  dataset depends upon the number of files read. Reading a single file
##  results in a 2D image, while reading more than one file results in a
##  3D volume.
##
##  To read a volume, files must be of the form "FileName.<number>"
##  (e.g., foo.bmp.0, foo.bmp.1, ...). You must also specify the image
##  range. This range specifies the beginning and ending files to read (range
##  can be any pair of non-negative numbers).
##
##  The default behavior is to read a single file. In this case, the form
##  of the file is simply "FileName" (e.g., foo.bmp).
##
##  @sa
##  vtkBMPWriter
##

import
  vtkIOImageModule, vtkImageReader

discard "forward decl of vtkLookupTable"
type
  vtkBMPReader* {.importcpp: "vtkBMPReader", header: "vtkBMPReader.h", bycopy.} = object of vtkImageReader
    vtkBMPReader* {.importc: "vtkBMPReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkBMPReader {.importcpp: "vtkBMPReader::New(@)",
                            header: "vtkBMPReader.h".}
type
  vtkBMPReaderSuperclass* = vtkImageReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkBMPReader::IsTypeOf(@)", header: "vtkBMPReader.h".}
proc IsA*(this: var vtkBMPReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkBMPReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkBMPReader {.
    importcpp: "vtkBMPReader::SafeDownCast(@)", header: "vtkBMPReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkBMPReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBMPReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBMPReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkBMPReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkBMPReader.h".}
## !!!Ignored construct:  /@{ *
##  Returns the depth of the BMP, either 8 or 24.
##  virtual int GetDepthDepth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Depth  of  << this -> Depth ) ; return this -> Depth ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Is the given file a BMP file?
##  int CanReadFile ( VTK_FILEPATH const char * fname ) override ;
## Error: token expected: ) but got: *!!!

proc GetFileExtensions*(this: var vtkBMPReader): cstring {.
    importcpp: "GetFileExtensions", header: "vtkBMPReader.h".}
proc GetDescriptiveName*(this: var vtkBMPReader): cstring {.
    importcpp: "GetDescriptiveName", header: "vtkBMPReader.h".}
proc SetAllow8BitBMP*(this: var vtkBMPReader; _arg: vtkTypeBool) {.
    importcpp: "SetAllow8BitBMP", header: "vtkBMPReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetDepthDepthAllow8BitBMP ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Allow8BitBMP  of  << this -> Allow8BitBMP ) ; return this -> Allow8BitBMP ; } ;
## Error: expected ';'!!!

proc Allow8BitBMPOn*(this: var vtkBMPReader) {.importcpp: "Allow8BitBMPOn",
    header: "vtkBMPReader.h".}
proc Allow8BitBMPOff*(this: var vtkBMPReader) {.importcpp: "Allow8BitBMPOff",
    header: "vtkBMPReader.h".}
  ## /@}
proc GetnameLookupTable*(this: var vtkBMPReader): ptr vtkLookupTable {.
    importcpp: "GetnameLookupTable", header: "vtkBMPReader.h".}
  ## /@{
  ## *
  ##  Returns the color lut.
  ##
## !!!Ignored construct:  virtual unsigned char * GetDepthDepthAllow8BitBMPColors ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Colors  of  << this -> Colors ) ; return this -> Colors ; } ;
## Error: expected ';'!!!
