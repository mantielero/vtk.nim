## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmfReader.h
##   Language:  C++
##
##   Copyright (c) 1993-2002 Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXdmfReader
##  @brief   Reads <tt>eXtensible Data Model and Format</tt> files
##
##  vtkXdmfReader reads XDMF data files so that they can be visualized using
##  VTK. The output data produced by this reader depends on the number of grids
##  in the data file. If the data file has a single domain with a single grid,
##  then the output type is a vtkDataSet subclass of the appropriate type,
##  otherwise it's a vtkMultiBlockDataSet.
##
##  Refer to vtkDataReader which provides many methods for controlling the
##  reading of the data file.
##  @warning
##  Uses the XDMF API (http://www.xdmf.org)
##  @sa
##  vtkDataReader
##

import
  vtkDataObjectAlgorithm, vtkIOXdmf2Module

discard "forward decl of vtkXdmfArraySelection"
discard "forward decl of vtkXdmfDocument"
discard "forward decl of vtkGraph"
discard "forward decl of vtkCharArray"
type
  vtkXdmfReader* {.importcpp: "vtkXdmfReader", header: "vtkXdmfReader.h", bycopy.} = object of vtkDataObjectAlgorithm ## *
                                                                                                            ##  Prepares the XdmfDocument.
                                                                                                            ##
    vtkXdmfReader* {.importc: "vtkXdmfReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  char* ActiveDomainName;
    ##  Until RequestInformation() is called, the active domain is not set
    ##  correctly. If SetGridStatus() etc. are called before that happens, then we
    ##  have no place to save the user choices. So we cache them in these temporary
    ##  caches. These are passed on to the actual vtkXdmfArraySelection instances
    ##  used by the active vtkXdmfDomain in RequestInformation().
    ##  Note that these are only used until the first domain is setup, once that
    ##  happens, the information set in these is passed to the domain and these
    ##  are cleared and no longer used, until the active domain becomes invalid
    ##  again.


proc New*(): ptr vtkXdmfReader {.importcpp: "vtkXdmfReader::New(@)",
                             header: "vtkXdmfReader.h".}
type
  vtkXdmfReaderSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXdmfReader::IsTypeOf(@)", header: "vtkXdmfReader.h".}
proc IsA*(this: var vtkXdmfReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXdmfReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXdmfReader {.
    importcpp: "vtkXdmfReader::SafeDownCast(@)", header: "vtkXdmfReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXdmfReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXdmfReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXdmfReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXdmfReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXdmfReader.h".}
proc SetDomainName*(this: var vtkXdmfReader; _arg: cstring) {.
    importcpp: "SetDomainName", header: "vtkXdmfReader.h".}
proc GetDomainName*(this: var vtkXdmfReader): cstring {.importcpp: "GetDomainName",
    header: "vtkXdmfReader.h".}
  ## /@}
  ## // Description:
  ## // Returns the name for the active domain. Note that this may be different
  ## // from what GetDomainName() returns if DomainName is nullptr or invalid.
  ##  vtkGetStringMacro(ActiveDomainName);
  ## /@{
  ## *
  ##  Name of the file to read.
  ##
## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc GetNumberOfPointArrays*(this: var vtkXdmfReader): cint {.
    importcpp: "GetNumberOfPointArrays", header: "vtkXdmfReader.h".}
proc GetPointArrayName*(this: var vtkXdmfReader; index: cint): cstring {.
    importcpp: "GetPointArrayName", header: "vtkXdmfReader.h".}
proc GetPointArrayStatus*(this: var vtkXdmfReader; name: cstring): cint {.
    importcpp: "GetPointArrayStatus", header: "vtkXdmfReader.h".}
proc SetPointArrayStatus*(this: var vtkXdmfReader; name: cstring; status: cint) {.
    importcpp: "SetPointArrayStatus", header: "vtkXdmfReader.h".}
proc GetNumberOfCellArrays*(this: var vtkXdmfReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkXdmfReader.h".}
proc GetCellArrayName*(this: var vtkXdmfReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkXdmfReader.h".}
proc SetCellArrayStatus*(this: var vtkXdmfReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkXdmfReader.h".}
proc GetCellArrayStatus*(this: var vtkXdmfReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkXdmfReader.h".}
proc GetNumberOfGrids*(this: var vtkXdmfReader): cint {.
    importcpp: "GetNumberOfGrids", header: "vtkXdmfReader.h".}
proc GetGridName*(this: var vtkXdmfReader; index: cint): cstring {.
    importcpp: "GetGridName", header: "vtkXdmfReader.h".}
proc SetGridStatus*(this: var vtkXdmfReader; gridname: cstring; status: cint) {.
    importcpp: "SetGridStatus", header: "vtkXdmfReader.h".}
proc GetGridStatus*(this: var vtkXdmfReader; gridname: cstring): cint {.
    importcpp: "GetGridStatus", header: "vtkXdmfReader.h".}
proc GetNumberOfSets*(this: var vtkXdmfReader): cint {.importcpp: "GetNumberOfSets",
    header: "vtkXdmfReader.h".}
proc GetSetName*(this: var vtkXdmfReader; index: cint): cstring {.
    importcpp: "GetSetName", header: "vtkXdmfReader.h".}
proc SetSetStatus*(this: var vtkXdmfReader; gridname: cstring; status: cint) {.
    importcpp: "SetSetStatus", header: "vtkXdmfReader.h".}
proc GetSetStatus*(this: var vtkXdmfReader; gridname: cstring): cint {.
    importcpp: "GetSetStatus", header: "vtkXdmfReader.h".}
proc GetNumberOfSetArrays*(this: var vtkXdmfReader): cint {.
    importcpp: "GetNumberOfSetArrays", header: "vtkXdmfReader.h".}
proc GetSetArrayName*(this: var vtkXdmfReader; index: cint): cstring {.
    importcpp: "GetSetArrayName", header: "vtkXdmfReader.h".}
proc GetSetArrayStatus*(this: var vtkXdmfReader; name: cstring): cint {.
    importcpp: "GetSetArrayStatus", header: "vtkXdmfReader.h".}
proc GetNumberOfGridArrays*(this: var vtkXdmfReader): cint {.
    importcpp: "GetNumberOfGridArrays", header: "vtkXdmfReader.h".}
proc GetGridArrayName*(this: var vtkXdmfReader; index: cint): cstring {.
    importcpp: "GetGridArrayName", header: "vtkXdmfReader.h".}
proc GetGridArrayStatus*(this: var vtkXdmfReader; name: cstring): cint {.
    importcpp: "GetGridArrayStatus", header: "vtkXdmfReader.h".}
proc SetStride*(this: var vtkXdmfReader; _arg1: cint; _arg2: cint; _arg3: cint) {.
    importcpp: "SetStride", header: "vtkXdmfReader.h".}
proc SetStride*(this: var vtkXdmfReader; _arg: array[3, cint]) {.
    importcpp: "SetStride", header: "vtkXdmfReader.h".}
## !!!Ignored construct:  virtual int * GetStride ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Stride  pointer  << this -> Stride ) ; return this -> Stride ; } VTK_WRAPEXCLUDE virtual void GetStride ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> Stride [ 0 ] ; _arg2 = this -> Stride [ 1 ] ; _arg3 = this -> Stride [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Stride  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetStride ( int _arg [ 3 ] ) { this -> GetStride ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} *
##  Determine if the file can be read with this reader.
##  virtual int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  /@{ *
##  Every time the SIL is updated a this will return a different value.
##  virtual int GetSILUpdateStampSILUpdateStamp ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SILUpdateStamp  of  << this -> SILUpdateStamp ) ; return this -> SILUpdateStamp ; } ;
## Error: expected ';'!!!

proc GetSIL*(this: var vtkXdmfReader): ptr vtkGraph {.importcpp: "GetSIL",
    header: "vtkXdmfReader.h".}
type
  vtkXdmfReaderXdmfDataSetTopoGeoPath* {.importcpp: "vtkXdmfReader::XdmfDataSetTopoGeoPath",
                                        header: "vtkXdmfReader.h", bycopy.} = object
    dataset* {.importc: "dataset".}: ptr vtkDataSet
    topologyPath* {.importc: "topologyPath".}: string
    geometryPath* {.importc: "geometryPath".}: string


proc constructvtkXdmfReaderXdmfDataSetTopoGeoPath*(): vtkXdmfReaderXdmfDataSetTopoGeoPath {.
    constructor, importcpp: "vtkXdmfReader::XdmfDataSetTopoGeoPath(@)",
    header: "vtkXdmfReader.h".}
type
  vtkXdmfReaderXdmfReaderCachedData* = map[cint,
      vtkXdmfReaderXdmfDataSetTopoGeoPath]

proc GetDataSetCache*(this: var vtkXdmfReader): var vtkXdmfReaderXdmfReaderCachedData {.
    importcpp: "GetDataSetCache", header: "vtkXdmfReader.h".}
proc SetReadFromInputString*(this: var vtkXdmfReader; _arg: bool) {.
    importcpp: "SetReadFromInputString", header: "vtkXdmfReader.h".}
## !!!Ignored construct:  virtual bool GetSILUpdateStampSILUpdateStampReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ;
## Error: expected ';'!!!

proc ReadFromInputStringOn*(this: var vtkXdmfReader) {.
    importcpp: "ReadFromInputStringOn", header: "vtkXdmfReader.h".}
proc ReadFromInputStringOff*(this: var vtkXdmfReader) {.
    importcpp: "ReadFromInputStringOff", header: "vtkXdmfReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the vtkCharArray to be used  when reading from a string.
  ##  If set, this array has precedence over InputString.
  ##  Use this instead of InputString to avoid the extra memory copy.
  ##  It should be noted that if the underlying char* is owned by the
  ##  user ( vtkCharArray::SetArray(array, 1); ) and is deleted before
  ##  the reader, bad things will happen during a pipeline update.
  ##
proc SetInputArray*(this: var vtkXdmfReader; a2: ptr vtkCharArray) {.
    importcpp: "SetInputArray", header: "vtkXdmfReader.h".}
proc GetnameInputArray*(this: var vtkXdmfReader): ptr vtkCharArray {.
    importcpp: "GetnameInputArray", header: "vtkXdmfReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the InputString for use when reading from a character array.
  ##  Optionally include the length for binary strings. Note that a copy
  ##  of the string is made and stored. If this causes exceedingly large
  ##  memory consumption, consider using InputArray instead.
  ##
proc SetInputString*(this: var vtkXdmfReader; `in`: cstring) {.
    importcpp: "SetInputString", header: "vtkXdmfReader.h".}
proc GetDomainNameInputString*(this: var vtkXdmfReader): cstring {.
    importcpp: "GetDomainNameInputString", header: "vtkXdmfReader.h".}
proc SetInputString*(this: var vtkXdmfReader; `in`: cstring; len: cint) {.
    importcpp: "SetInputString", header: "vtkXdmfReader.h".}
## !!!Ignored construct:  virtual int GetSILUpdateStampSILUpdateStampReadFromInputStringInputStringLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputStringLength  of  << this -> InputStringLength ) ; return this -> InputStringLength ; } ;
## Error: expected ';'!!!

proc SetBinaryInputString*(this: var vtkXdmfReader; a2: cstring; len: cint) {.
    importcpp: "SetBinaryInputString", header: "vtkXdmfReader.h".}
proc SetInputString*(this: var vtkXdmfReader; input: string) {.
    importcpp: "SetInputString", header: "vtkXdmfReader.h".}