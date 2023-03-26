## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGeoJSONReader.h
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
##  @class   vtkGeoJSONReader
##  @brief   Convert Geo JSON format to vtkPolyData
##
##  Outputs a vtkPolyData from the input
##  Geo JSON Data (http://www.geojson.org)
##

##  VTK Includes

import
  vtkIOGeoJSONModule, vtkPolyDataAlgorithm

discard "forward decl of vtkPolyData"
type
  vtkGeoJSONReader* {.importcpp: "vtkGeoJSONReader", header: "vtkGeoJSONReader.h",
                     bycopy.} = object of vtkPolyDataAlgorithm
    vtkGeoJSONReader* {.importc: "vtkGeoJSONReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## /@}


proc New*(): ptr vtkGeoJSONReader {.importcpp: "vtkGeoJSONReader::New(@)",
                                header: "vtkGeoJSONReader.h".}
type
  vtkGeoJSONReaderSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGeoJSONReader::IsTypeOf(@)", header: "vtkGeoJSONReader.h".}
proc IsA*(this: var vtkGeoJSONReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkGeoJSONReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGeoJSONReader {.
    importcpp: "vtkGeoJSONReader::SafeDownCast(@)", header: "vtkGeoJSONReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGeoJSONReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGeoJSONReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGeoJSONReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGeoJSONReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGeoJSONReader.h".}
## !!!Ignored construct:  /@{ *
##  Accessor for name of the file that will be opened on WriteData
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetStringInput*(this: var vtkGeoJSONReader; _arg: cstring) {.
    importcpp: "SetStringInput", header: "vtkGeoJSONReader.h".}
proc GetStringInput*(this: var vtkGeoJSONReader): cstring {.
    importcpp: "GetStringInput", header: "vtkGeoJSONReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether to use StringInput instead of reading input from file
  ##  The default is off
  ##
proc SetStringInputMode*(this: var vtkGeoJSONReader; _arg: bool) {.
    importcpp: "SetStringInputMode", header: "vtkGeoJSONReader.h".}
## !!!Ignored construct:  virtual bool GetStringInputMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StringInputMode  of  << this -> StringInputMode ) ; return this -> StringInputMode ; } ;
## Error: expected ';'!!!

proc StringInputModeOn*(this: var vtkGeoJSONReader) {.
    importcpp: "StringInputModeOn", header: "vtkGeoJSONReader.h".}
proc StringInputModeOff*(this: var vtkGeoJSONReader) {.
    importcpp: "StringInputModeOff", header: "vtkGeoJSONReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get whether to convert all output polygons to triangles.
  ##  Note that if OutinePolygons mode is on, then no output polygons
  ##  are generated, and in that case, this option is not relevant.
  ##  The default is off.
  ##
proc SetStringInputModeTriangulatePolygons*(this: var vtkGeoJSONReader; _arg: bool) {.
    importcpp: "SetStringInputModeTriangulatePolygons",
    header: "vtkGeoJSONReader.h".}
## !!!Ignored construct:  virtual bool GetStringInputModeTriangulatePolygons ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TriangulatePolygons  of  << this -> TriangulatePolygons ) ; return this -> TriangulatePolygons ; } ;
## Error: expected ';'!!!

proc TriangulatePolygonsOn*(this: var vtkGeoJSONReader) {.
    importcpp: "TriangulatePolygonsOn", header: "vtkGeoJSONReader.h".}
proc TriangulatePolygonsOff*(this: var vtkGeoJSONReader) {.
    importcpp: "TriangulatePolygonsOff", header: "vtkGeoJSONReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get option to generate the border outlining each polygon,
  ##  so that the output cells for polygons are vtkPolyLine instances.
  ##  The default is off.
  ##
proc SetStringInputModeTriangulatePolygonsOutlinePolygons*(
    this: var vtkGeoJSONReader; _arg: bool) {.
    importcpp: "SetStringInputModeTriangulatePolygonsOutlinePolygons",
    header: "vtkGeoJSONReader.h".}
## !!!Ignored construct:  virtual bool GetStringInputModeTriangulatePolygonsOutlinePolygons ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutlinePolygons  of  << this -> OutlinePolygons ) ; return this -> OutlinePolygons ; } ;
## Error: expected ';'!!!

proc OutlinePolygonsOn*(this: var vtkGeoJSONReader) {.
    importcpp: "OutlinePolygonsOn", header: "vtkGeoJSONReader.h".}
proc OutlinePolygonsOff*(this: var vtkGeoJSONReader) {.
    importcpp: "OutlinePolygonsOff", header: "vtkGeoJSONReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get name of data array for serialized GeoJSON "properties" node.
  ##  If specified, data will be stored as vtkCellData/vtkStringArray.
  ##
proc SetStringInputSerializedPropertiesArrayName*(this: var vtkGeoJSONReader;
    _arg: cstring) {.importcpp: "SetStringInputSerializedPropertiesArrayName",
                   header: "vtkGeoJSONReader.h".}
proc GetStringInputSerializedPropertiesArrayName*(this: var vtkGeoJSONReader): cstring {.
    importcpp: "GetStringInputSerializedPropertiesArrayName",
    header: "vtkGeoJSONReader.h".}
  ## /@}
  ## *
  ##  Specify feature property to read in with geometry objects
  ##  Note that defaultValue specifies both type & value
  ##
proc AddFeatureProperty*(this: var vtkGeoJSONReader; name: cstring;
                        typeAndDefaultValue: var vtkVariant) {.
    importcpp: "AddFeatureProperty", header: "vtkGeoJSONReader.h".}