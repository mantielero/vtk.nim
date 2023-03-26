## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTIFFWriter.h
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
##  @class   vtkTIFFWriter
##  @brief   write out image data as a TIFF file
##
##  vtkTIFFWriter writes image data as a TIFF data file. Data can be written
##  uncompressed or compressed. Several forms of compression are supported
##  including packed bits, JPEG, deflation, and LZW. (Note: LZW compression
##  is currently under patent in the US and is disabled until the patent
##  expires. However, the mechanism for supporting this compression is available
##  for those with a valid license or to whom the patent does not apply.)
##

import
  vtkIOImageModule, vtkImageWriter

type
  vtkTIFFWriter* {.importcpp: "vtkTIFFWriter", header: "vtkTIFFWriter.h", bycopy.} = object of vtkImageWriter
    vtkTIFFWriter* {.importc: "vtkTIFFWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTIFFWriter {.importcpp: "vtkTIFFWriter::New(@)",
                             header: "vtkTIFFWriter.h".}
type
  vtkTIFFWriterSuperclass* = vtkImageWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTIFFWriter::IsTypeOf(@)", header: "vtkTIFFWriter.h".}
proc IsA*(this: var vtkTIFFWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTIFFWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTIFFWriter {.
    importcpp: "vtkTIFFWriter::SafeDownCast(@)", header: "vtkTIFFWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTIFFWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTIFFWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTIFFWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTIFFWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTIFFWriter.h".}
proc Write*(this: var vtkTIFFWriter) {.importcpp: "Write", header: "vtkTIFFWriter.h".}
const                         ##  Compression types
  vtkTIFFWriterNoCompression* = 0
  vtkTIFFWriterPackBits* = 1
  vtkTIFFWriterJPEG* = 2
  vtkTIFFWriterDeflate* = 3
  vtkTIFFWriterLZW* = 4

proc SetCompression*(this: var vtkTIFFWriter; _arg: cint) {.
    importcpp: "SetCompression", header: "vtkTIFFWriter.h".}
proc GetCompressionMinValue*(this: var vtkTIFFWriter): cint {.
    importcpp: "GetCompressionMinValue", header: "vtkTIFFWriter.h".}
proc GetCompressionMaxValue*(this: var vtkTIFFWriter): cint {.
    importcpp: "GetCompressionMaxValue", header: "vtkTIFFWriter.h".}
## !!!Ignored construct:  virtual int GetCompression ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Compression  of  << this -> Compression ) ; return this -> Compression ; } ;
## Error: expected ';'!!!

proc SetCompressionToNoCompression*(this: var vtkTIFFWriter) {.
    importcpp: "SetCompressionToNoCompression", header: "vtkTIFFWriter.h".}
proc SetCompressionToPackBits*(this: var vtkTIFFWriter) {.
    importcpp: "SetCompressionToPackBits", header: "vtkTIFFWriter.h".}
proc SetCompressionToJPEG*(this: var vtkTIFFWriter) {.
    importcpp: "SetCompressionToJPEG", header: "vtkTIFFWriter.h".}
proc SetCompressionToDeflate*(this: var vtkTIFFWriter) {.
    importcpp: "SetCompressionToDeflate", header: "vtkTIFFWriter.h".}
proc SetCompressionToLZW*(this: var vtkTIFFWriter) {.
    importcpp: "SetCompressionToLZW", header: "vtkTIFFWriter.h".}