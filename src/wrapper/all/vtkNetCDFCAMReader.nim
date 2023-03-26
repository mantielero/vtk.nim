## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNetCDFCAMReader.h
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
##  @class   vtkNetCDFCAMReader
##  @brief   Read unstructured NetCDF CAM files.
##
##  Reads in a NetCDF CAM (Community Atmospheric Model) file and
##  produces and unstructured grid.  The grid is actually unstructured
##  in the X and Y directions and rectilinear in the Z direction. If we
##  read one layer we produce quad cells otherwise we produce hex
##  cells.  The reader requires 2 NetCDF files: the main file has all
##  attributes, the connectivity file has point positions and cell
##  connectivity information.
##

import
  vtkIONetCDFModule, vtkUnstructuredGridAlgorithm

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkDataArraySelection"
type
  vtkNetCDFCAMReader* {.importcpp: "vtkNetCDFCAMReader",
                       header: "vtkNetCDFCAMReader.h", bycopy.} = object of vtkUnstructuredGridAlgorithm
    vtkNetCDFCAMReader* {.importc: "vtkNetCDFCAMReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkNetCDFCAMReader {.importcpp: "vtkNetCDFCAMReader::New(@)",
                                  header: "vtkNetCDFCAMReader.h".}
type
  vtkNetCDFCAMReaderSuperclass* = vtkUnstructuredGridAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNetCDFCAMReader::IsTypeOf(@)", header: "vtkNetCDFCAMReader.h".}
proc IsA*(this: var vtkNetCDFCAMReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNetCDFCAMReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNetCDFCAMReader {.
    importcpp: "vtkNetCDFCAMReader::SafeDownCast(@)",
    header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNetCDFCAMReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNetCDFCAMReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNetCDFCAMReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkNetCDFCAMReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  *
##  Returns 1 if this file can be read and 0 if the file cannot be read.
##  Because NetCDF CAM files come in pairs and we only check one of the
##  files, the result is not definitive.  Invalid files may still return 1
##  although a valid file will never return 0.
##  static int CanReadFile ( VTK_FILEPATH const char * fileName ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  void SetFileName ( VTK_FILEPATH const char * fileName ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  void SetConnectivityFileName ( VTK_FILEPATH const char * fileName ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameConnectivityFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ConnectivityFileName  of  << ( this -> ConnectivityFileName ? this -> ConnectivityFileName : (null) ) ) ; return this -> ConnectivityFileName ; } ;
## Error: expected ';'!!!

type
  vtkNetCDFCAMReaderVerticalDimension* {.size: sizeof(cint), importcpp: "vtkNetCDFCAMReader::VerticalDimension",
                                        header: "vtkNetCDFCAMReader.h".} = enum
    VERTICAL_DIMENSION_SINGLE_LAYER, VERTICAL_DIMENSION_MIDPOINT_LAYERS,
    VERTICAL_DIMENSION_INTERFACE_LAYERS, VERTICAL_DIMENSION_COUNT


proc SetVerticalDimension*(this: var vtkNetCDFCAMReader; _arg: cint) {.
    importcpp: "SetVerticalDimension", header: "vtkNetCDFCAMReader.h".}
proc GetVerticalDimensionMinValue*(this: var vtkNetCDFCAMReader): cint {.
    importcpp: "GetVerticalDimensionMinValue", header: "vtkNetCDFCAMReader.h".}
proc GetVerticalDimensionMaxValue*(this: var vtkNetCDFCAMReader): cint {.
    importcpp: "GetVerticalDimensionMaxValue", header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  virtual int GetVerticalDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VerticalDimension  of  << this -> VerticalDimension ) ; return this -> VerticalDimension ; } ;
## Error: expected ';'!!!

proc SingleMidpointLayerOn*(this: var vtkNetCDFCAMReader) {.
    importcpp: "SingleMidpointLayerOn", header: "vtkNetCDFCAMReader.h".}
proc SingleMidpointLayerOff*(this: var vtkNetCDFCAMReader) {.
    importcpp: "SingleMidpointLayerOff", header: "vtkNetCDFCAMReader.h".}
proc SetSingleMidpointLayer*(this: var vtkNetCDFCAMReader; _arg: vtkTypeBool) {.
    importcpp: "SetSingleMidpointLayer", header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVerticalDimensionSingleMidpointLayer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SingleMidpointLayer  of  << this -> SingleMidpointLayer ) ; return this -> SingleMidpointLayer ; } ;
## Error: expected ';'!!!

proc SetSingleMidpointLayerMidpointLayerIndex*(this: var vtkNetCDFCAMReader;
    _arg: cint) {.importcpp: "SetSingleMidpointLayerMidpointLayerIndex",
                header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  virtual int GetVerticalDimensionSingleMidpointLayerMidpointLayerIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MidpointLayerIndex  of  << this -> MidpointLayerIndex ) ; return this -> MidpointLayerIndex ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int * GetMidpointLayersRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MidpointLayersRange  pointer  << this -> MidpointLayersRange ) ; return this -> MidpointLayersRange ; } VTK_WRAPEXCLUDE virtual void GetMidpointLayersRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> MidpointLayersRange [ 0 ] ; _arg2 = this -> MidpointLayersRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MidpointLayersRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMidpointLayersRange ( int _arg [ 2 ] ) { this -> GetMidpointLayersRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc SingleInterfaceLayerOn*(this: var vtkNetCDFCAMReader) {.
    importcpp: "SingleInterfaceLayerOn", header: "vtkNetCDFCAMReader.h".}
proc SingleInterfaceLayerOff*(this: var vtkNetCDFCAMReader) {.
    importcpp: "SingleInterfaceLayerOff", header: "vtkNetCDFCAMReader.h".}
proc SetSingleMidpointLayerMidpointLayerIndexSingleInterfaceLayer*(
    this: var vtkNetCDFCAMReader; _arg: vtkTypeBool) {.
    importcpp: "SetSingleMidpointLayerMidpointLayerIndexSingleInterfaceLayer",
    header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetVerticalDimensionSingleMidpointLayerMidpointLayerIndexSingleInterfaceLayer ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SingleInterfaceLayer  of  << this -> SingleInterfaceLayer ) ; return this -> SingleInterfaceLayer ; } ;
## Error: expected ';'!!!

proc SetSingleMidpointLayerMidpointLayerIndexSingleInterfaceLayerInterfaceLayerIndex*(
    this: var vtkNetCDFCAMReader; _arg: cint) {.importcpp: "SetSingleMidpointLayerMidpointLayerIndexSingleInterfaceLayerInterfaceLayerIndex",
    header: "vtkNetCDFCAMReader.h".}
## !!!Ignored construct:  virtual int GetVerticalDimensionSingleMidpointLayerMidpointLayerIndexSingleInterfaceLayerInterfaceLayerIndex ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InterfaceLayerIndex  of  << this -> InterfaceLayerIndex ) ; return this -> InterfaceLayerIndex ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual int * GetMidpointLayersRangeInterfaceLayersRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InterfaceLayersRange  pointer  << this -> InterfaceLayersRange ) ; return this -> InterfaceLayersRange ; } VTK_WRAPEXCLUDE virtual void GetMidpointLayersRangeInterfaceLayersRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> InterfaceLayersRange [ 0 ] ; _arg2 = this -> InterfaceLayersRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << InterfaceLayersRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMidpointLayersRangeInterfaceLayersRange ( int _arg [ 2 ] ) { this -> GetMidpointLayersRangeInterfaceLayersRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetNumberOfPointArrays*(this: var vtkNetCDFCAMReader): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkNetCDFCAMReader.h".}
proc GetPointArrayName*(this: var vtkNetCDFCAMReader; index: cint): cstring {.
    importcpp: "GetPointArrayName", header: "vtkNetCDFCAMReader.h".}
proc GetPointArrayStatus*(this: var vtkNetCDFCAMReader; name: cstring): cint {.
    importcpp: "GetPointArrayStatus", header: "vtkNetCDFCAMReader.h".}
proc SetPointArrayStatus*(this: var vtkNetCDFCAMReader; name: cstring; status: cint) {.
    importcpp: "SetPointArrayStatus", header: "vtkNetCDFCAMReader.h".}
proc DisableAllPointArrays*(this: var vtkNetCDFCAMReader) {.
    importcpp: "DisableAllPointArrays", header: "vtkNetCDFCAMReader.h".}
proc EnableAllPointArrays*(this: var vtkNetCDFCAMReader) {.
    importcpp: "EnableAllPointArrays", header: "vtkNetCDFCAMReader.h".}