## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkJSONDataSetWriter.h
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
##  @class   vtkJSONDataSetWriter
##  @brief   write vtkDataSet using a vtkArchiver with a JSON meta file along
##           with all the binary arrays written as standalone binary files.
##           The generated format can be used by vtk.js using the reader below
##           https://kitware.github.io/vtk-js/examples/HttpDataSetReader.html
##
##  vtkJSONDataSetWriter writes vtkImageData / vtkPolyData into a set of files
##  representing each arrays that compose the dataset along with a JSON meta file
##  that describe what they are and how they should be assembled into an actual
##  vtkDataSet.
##
##
##  @warning
##  This writer assume LittleEndian by default. Additional work should be done to
##  properly
##  handle endianness.
##
##
##  @sa
##  vtkArchiver
##

import
  vtkIOExportModule, vtkWriter

discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkArchiver"
type
  vtkJSONDataSetWriter* {.importcpp: "vtkJSONDataSetWriter",
                         header: "vtkJSONDataSetWriter.h", bycopy.} = object of vtkWriter
    vtkJSONDataSetWriter* {.importc: "vtkJSONDataSetWriter".}: VTK_NEWINSTANCE


## using statement

proc ComputeMD5*(content: ptr cuchar; size: cint; hash: var string) {.
    importcpp: "vtkJSONDataSetWriter::ComputeMD5(@)",
    header: "vtkJSONDataSetWriter.h".}
proc GetShortType*(input: ptr vtkDataArray; needConversion: var bool): string {.
    importcpp: "vtkJSONDataSetWriter::GetShortType(@)",
    header: "vtkJSONDataSetWriter.h".}
proc GetUID*(a1: ptr vtkDataArray; needConversion: var bool): string {.
    importcpp: "vtkJSONDataSetWriter::GetUID(@)", header: "vtkJSONDataSetWriter.h".}
proc GetValidString*(this: var vtkJSONDataSetWriter; a2: cstring): string {.
    importcpp: "GetValidString", header: "vtkJSONDataSetWriter.h".}
## !!!Ignored construct:  /@} /@{ *
##  Write the contents of the vtkDataArray to disk based on the filePath
##  provided without any extra information. Just the raw data will be
##  written.
##
##  If vtkDataArray is a Uint64 or Int64, the data will be converted
##  to Uint32 or Int32 before being written.
##  bool WriteArrayContents ( vtkDataArray * , VTK_FILEPATH const char * relativeFilePath ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  /@} /@{ *
##  For backwards compatiblity, this static method writes a data array's
##  contents directly to a file.
##  static bool WriteArrayAsRAW ( vtkDataArray * , VTK_FILEPATH const char * filePath ) ;
## Error: token expected: ) but got: *!!!

proc New*(): ptr vtkJSONDataSetWriter {.importcpp: "vtkJSONDataSetWriter::New(@)",
                                    header: "vtkJSONDataSetWriter.h".}
type
  vtkJSONDataSetWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkJSONDataSetWriter::IsTypeOf(@)",
    header: "vtkJSONDataSetWriter.h".}
proc IsA*(this: var vtkJSONDataSetWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkJSONDataSetWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkJSONDataSetWriter {.
    importcpp: "vtkJSONDataSetWriter::SafeDownCast(@)",
    header: "vtkJSONDataSetWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkJSONDataSetWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkJSONDataSetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkJSONDataSetWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkJSONDataSetWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkJSONDataSetWriter.h".}
proc GetInput*(this: var vtkJSONDataSetWriter): ptr vtkDataSet {.
    importcpp: "GetInput", header: "vtkJSONDataSetWriter.h".}
proc GetInput*(this: var vtkJSONDataSetWriter; port: cint): ptr vtkDataSet {.
    importcpp: "GetInput", header: "vtkJSONDataSetWriter.h".}
proc SetArchiver*(this: var vtkJSONDataSetWriter; a2: ptr vtkArchiver) {.
    importcpp: "SetArchiver", header: "vtkJSONDataSetWriter.h".}
proc GetnameArchiver*(this: var vtkJSONDataSetWriter): ptr vtkArchiver {.
    importcpp: "GetnameArchiver", header: "vtkJSONDataSetWriter.h".}
  ## /@}
proc Write*(this: var vtkJSONDataSetWriter; a2: ptr vtkDataSet) {.importcpp: "Write",
    header: "vtkJSONDataSetWriter.h".}
proc IsDataSetValid*(this: var vtkJSONDataSetWriter): bool {.
    importcpp: "IsDataSetValid", header: "vtkJSONDataSetWriter.h".}