## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLImageDataReader.h
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
##  @class   vtkXMLImageDataReader
##  @brief   Read VTK XML ImageData files.
##
##  vtkXMLImageDataReader reads the VTK XML ImageData file format.  One
##  image data file can be read to produce one output.  Streaming is
##  supported.  The standard extension for this reader's file format is
##  "vti".  This reader is also used to read a single piece of the
##  parallel file format.
##
##  @sa
##  vtkXMLPImageDataReader
##

import
  vtkIOXMLModule, vtkXMLStructuredDataReader

discard "forward decl of vtkImageData"
type
  vtkXMLImageDataReader* {.importcpp: "vtkXMLImageDataReader",
                          header: "vtkXMLImageDataReader.h", bycopy.} = object of vtkXMLStructuredDataReader
    vtkXMLImageDataReader* {.importc: "vtkXMLImageDataReader".}: VTK_NEWINSTANCE

  vtkXMLImageDataReaderSuperclass* = vtkXMLStructuredDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLImageDataReader::IsTypeOf(@)",
    header: "vtkXMLImageDataReader.h".}
proc IsA*(this: var vtkXMLImageDataReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLImageDataReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLImageDataReader {.
    importcpp: "vtkXMLImageDataReader::SafeDownCast(@)",
    header: "vtkXMLImageDataReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLImageDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLStructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLImageDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLImageDataReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLImageDataReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLImageDataReader.h".}
proc New*(): ptr vtkXMLImageDataReader {.importcpp: "vtkXMLImageDataReader::New(@)",
                                     header: "vtkXMLImageDataReader.h".}
proc GetOutput*(this: var vtkXMLImageDataReader): ptr vtkImageData {.
    importcpp: "GetOutput", header: "vtkXMLImageDataReader.h".}
proc GetOutput*(this: var vtkXMLImageDataReader; idx: cint): ptr vtkImageData {.
    importcpp: "GetOutput", header: "vtkXMLImageDataReader.h".}
proc CopyOutputInformation*(this: var vtkXMLImageDataReader;
                           outInfo: ptr vtkInformation; port: cint) {.
    importcpp: "CopyOutputInformation", header: "vtkXMLImageDataReader.h".}