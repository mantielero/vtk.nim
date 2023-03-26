## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSTLReader.h
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
##  @class   vtkSTLReader
##  @brief   read ASCII or binary stereo lithography files
##
##  vtkSTLReader is a source object that reads ASCII or binary stereo
##  lithography files (.stl files). The FileName must be specified to
##  vtkSTLReader. The object automatically detects whether the file is
##  ASCII or binary.
##
##  .stl files are quite inefficient since they duplicate vertex
##  definitions. By setting the Merging boolean you can control whether the
##  point data is merged after reading. Merging is performed by default,
##  however, merging requires a large amount of temporary storage since a
##  3D hash table must be constructed.
##
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  vtkSTLWriter uses VAX or PC byte ordering and swaps bytes on other systems.
##

import
  vtkAbstractPolyDataReader, vtkIOGeometryModule

discard "forward decl of vtkCellArray"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkIncrementalPointLocator"
discard "forward decl of vtkPoints"
type
  vtkSTLReader* {.importcpp: "vtkSTLReader", header: "vtkSTLReader.h", bycopy.} = object of vtkAbstractPolyDataReader
    vtkSTLReader* {.importc: "vtkSTLReader".}: VTK_NEWINSTANCE

  vtkSTLReaderSuperclass* = vtkAbstractPolyDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSTLReader::IsTypeOf(@)", header: "vtkSTLReader.h".}
proc IsA*(this: var vtkSTLReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSTLReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSTLReader {.
    importcpp: "vtkSTLReader::SafeDownCast(@)", header: "vtkSTLReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSTLReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSTLReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSTLReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSTLReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSTLReader.h".}
proc New*(): ptr vtkSTLReader {.importcpp: "vtkSTLReader::New(@)",
                            header: "vtkSTLReader.h".}
proc GetMTime*(this: var vtkSTLReader): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkSTLReader.h".}
proc SetMerging*(this: var vtkSTLReader; _arg: vtkTypeBool) {.importcpp: "SetMerging",
    header: "vtkSTLReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMerging ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Merging  of  << this -> Merging ) ; return this -> Merging ; } ;
## Error: expected ';'!!!

proc MergingOn*(this: var vtkSTLReader) {.importcpp: "MergingOn",
                                      header: "vtkSTLReader.h".}
proc MergingOff*(this: var vtkSTLReader) {.importcpp: "MergingOff",
                                       header: "vtkSTLReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Turn on/off tagging of solids with scalars.
  ##
proc SetMergingScalarTags*(this: var vtkSTLReader; _arg: vtkTypeBool) {.
    importcpp: "SetMergingScalarTags", header: "vtkSTLReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetMergingScalarTags ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarTags  of  << this -> ScalarTags ) ; return this -> ScalarTags ; } ;
## Error: expected ';'!!!

proc ScalarTagsOn*(this: var vtkSTLReader) {.importcpp: "ScalarTagsOn",
    header: "vtkSTLReader.h".}
proc ScalarTagsOff*(this: var vtkSTLReader) {.importcpp: "ScalarTagsOff",
    header: "vtkSTLReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify a spatial locator for merging points. By
  ##  default an instance of vtkMergePoints is used.
  ##
proc SetLocator*(this: var vtkSTLReader; locator: ptr vtkIncrementalPointLocator) {.
    importcpp: "SetLocator", header: "vtkSTLReader.h".}
proc GetnameLocator*(this: var vtkSTLReader): ptr vtkIncrementalPointLocator {.
    importcpp: "GetnameLocator", header: "vtkSTLReader.h".}
  ## /@}
  ## *
  ##  Get header string.
  ##  If an ASCII STL file contains multiple solids then
  ##  headers are separated by newline character.
  ##  If a binary STL file is read, the first zero-terminated
  ##  string is stored in this header, the full header is available
  ##  by using GetBinaryHeader().
  ##  \sa GetBinaryHeader()
  ##
proc GetHeader*(this: var vtkSTLReader): cstring {.importcpp: "GetHeader",
    header: "vtkSTLReader.h".}
  ## *
  ##  Get binary file header string.
  ##  If ASCII STL file is read then BinaryHeader is not set,
  ##  and the header can be retrieved using.GetHeader() instead.
  ##  \sa GetHeader()
  ##
proc GetnameLocatorBinaryHeader*(this: var vtkSTLReader): ptr vtkUnsignedCharArray {.
    importcpp: "GetnameLocatorBinaryHeader", header: "vtkSTLReader.h".}