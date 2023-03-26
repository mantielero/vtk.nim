## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExodusIIWriter.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkExodusIIWriter
##  @brief   Write Exodus II files
##
##      This is a vtkWriter that writes it's vtkUnstructuredGrid
##      input out to an Exodus II file.  Go to http://endo.sandia.gov/SEACAS/
##      for more information about the Exodus II format.
##
##      Exodus files contain much information that is not captured
##      in a vtkUnstructuredGrid, such as time steps, information
##      lines, node sets, and side sets.  This information can be
##      stored in a vtkModelMetadata object.
##
##      The vtkExodusReader and vtkPExodusReader can create
##      a vtkModelMetadata object and embed it in a vtkUnstructuredGrid
##      in a series of field arrays.  This writer searches for these
##      field arrays and will use the metadata contained in them
##      when creating the new Exodus II file.
##
##      You can also explicitly give the vtkExodusIIWriter a
##      vtkModelMetadata object to use when writing the file.
##
##      In the absence of the information provided by vtkModelMetadata,
##      if this writer is not part of a parallel application, we will use
##      reasonable defaults for all the values in the output Exodus file.
##      If you don't provide a block ID element array, we'll create a
##      block for each cell type that appears in the unstructured grid.
##
##      However if this writer is part of a parallel application (hence
##      writing out a distributed Exodus file), then we need at the very
##      least a list of all the block IDs that appear in the file.  And
##      we need the element array of block IDs for the input unstructured grid.
##
##      In the absence of a vtkModelMetadata object, you can also provide
##      time step information which we will include in the output Exodus
##      file.
##
##  @warning
##      If the input floating point field arrays and point locations are all
##      floats or all doubles, this class will operate more efficiently.
##      Mixing floats and doubles will slow you down, because Exodus II
##      requires that we write only floats or only doubles.
##
##  @warning
##      We use the terms "point" and "node" interchangeably.
##      Also, we use the terms "element" and "cell" interchangeably.
##

import
  vtkIOExodusModule, vtkSmartPointer, vtkWriter

discard "forward decl of vtkModelMetadata"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkUnstructuredGrid"
type
  vtkExodusIIWriter* {.importcpp: "vtkExodusIIWriter",
                      header: "vtkExodusIIWriter.h", bycopy.} = object of vtkWriter
    vtkExodusIIWriter* {.importc: "vtkExodusIIWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  By BlockId, and within block ID by element variable, with variables
    ##  appearing in the same order in which they appear in OutputElementArrayNames


proc New*(): ptr vtkExodusIIWriter {.importcpp: "vtkExodusIIWriter::New(@)",
                                 header: "vtkExodusIIWriter.h".}
type
  vtkExodusIIWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkExodusIIWriter::IsTypeOf(@)", header: "vtkExodusIIWriter.h".}
proc IsA*(this: var vtkExodusIIWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkExodusIIWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkExodusIIWriter {.
    importcpp: "vtkExodusIIWriter::SafeDownCast(@)", header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkExodusIIWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExodusIIWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExodusIIWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkExodusIIWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkExodusIIWriter.h".}
proc SetModelMetadata*(this: var vtkExodusIIWriter; a2: ptr vtkModelMetadata) {.
    importcpp: "SetModelMetadata", header: "vtkExodusIIWriter.h".}
proc GetnameModelMetadata*(this: var vtkExodusIIWriter): ptr vtkModelMetadata {.
    importcpp: "GetnameModelMetadata", header: "vtkExodusIIWriter.h".}
  ## *
  ##  Name for the output file.  If writing in parallel, the number
  ##  of processes and the process rank will be appended to the name,
  ##  so each process is writing out a separate file.
  ##  If not set, this class will make up a file name.
  ##
## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetStoreDoubles*(this: var vtkExodusIIWriter; _arg: cint) {.
    importcpp: "SetStoreDoubles", header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual int GetStoreDoubles ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StoreDoubles  of  << this -> StoreDoubles ) ; return this -> StoreDoubles ; } ;
## Error: expected ';'!!!

proc SetStoreDoublesGhostLevel*(this: var vtkExodusIIWriter; _arg: cint) {.
    importcpp: "SetStoreDoublesGhostLevel", header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual int GetStoreDoublesGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ;
## Error: expected ';'!!!

proc SetStoreDoublesGhostLevelWriteOutBlockIdArray*(this: var vtkExodusIIWriter;
    _arg: vtkTypeBool) {.importcpp: "SetStoreDoublesGhostLevelWriteOutBlockIdArray",
                       header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStoreDoublesGhostLevelWriteOutBlockIdArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteOutBlockIdArray  of  << this -> WriteOutBlockIdArray ) ; return this -> WriteOutBlockIdArray ; } ;
## Error: expected ';'!!!

proc WriteOutBlockIdArrayOn*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteOutBlockIdArrayOn", header: "vtkExodusIIWriter.h".}
proc WriteOutBlockIdArrayOff*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteOutBlockIdArrayOff", header: "vtkExodusIIWriter.h".}
  ## *
  ##  By default, the integer array containing the global Node Ids
  ##  is not included when the new Exodus II file is written out.  If
  ##  you do want to include this array, set WriteOutGlobalNodeIdArray to ON.
  ##
proc SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArray*(
    this: var vtkExodusIIWriter; _arg: vtkTypeBool) {.importcpp: "SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArray",
    header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteOutGlobalNodeIdArray  of  << this -> WriteOutGlobalNodeIdArray ) ; return this -> WriteOutGlobalNodeIdArray ; } ;
## Error: expected ';'!!!

proc WriteOutGlobalNodeIdArrayOn*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteOutGlobalNodeIdArrayOn", header: "vtkExodusIIWriter.h".}
proc WriteOutGlobalNodeIdArrayOff*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteOutGlobalNodeIdArrayOff", header: "vtkExodusIIWriter.h".}
  ## *
  ##  By default, the integer array containing the global Element Ids
  ##  is not included when the new Exodus II file is written out.  If you
  ##  do want to include this array, set WriteOutGlobalElementIdArray to ON.
  ##
proc SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArray*(
    this: var vtkExodusIIWriter; _arg: vtkTypeBool) {.importcpp: "SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArray",
    header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteOutGlobalElementIdArray  of  << this -> WriteOutGlobalElementIdArray ) ; return this -> WriteOutGlobalElementIdArray ; } ;
## Error: expected ';'!!!

proc WriteOutGlobalElementIdArrayOn*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteOutGlobalElementIdArrayOn", header: "vtkExodusIIWriter.h".}
proc WriteOutGlobalElementIdArrayOff*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteOutGlobalElementIdArrayOff", header: "vtkExodusIIWriter.h".}
  ## *
  ##  When WriteAllTimeSteps is turned ON, the writer is executed once for
  ##  each timestep available from the reader.
  ##
proc SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArrayWriteAllTimeSteps*(
    this: var vtkExodusIIWriter; _arg: vtkTypeBool) {.importcpp: "SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArrayWriteAllTimeSteps",
    header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArrayWriteAllTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteAllTimeSteps  of  << this -> WriteAllTimeSteps ) ; return this -> WriteAllTimeSteps ; } ;
## Error: expected ';'!!!

proc WriteAllTimeStepsOn*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteAllTimeStepsOn", header: "vtkExodusIIWriter.h".}
proc WriteAllTimeStepsOff*(this: var vtkExodusIIWriter) {.
    importcpp: "WriteAllTimeStepsOff", header: "vtkExodusIIWriter.h".}
proc SetBlockIdArrayName*(this: var vtkExodusIIWriter; _arg: cstring) {.
    importcpp: "SetBlockIdArrayName", header: "vtkExodusIIWriter.h".}
proc GetBlockIdArrayName*(this: var vtkExodusIIWriter): cstring {.
    importcpp: "GetBlockIdArrayName", header: "vtkExodusIIWriter.h".}
  ## *
  ##  In certain cases we know that metadata doesn't exist and
  ##  we want to ignore that warning.
  ##
proc SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArrayWriteAllTimeStepsIgnoreMetaDataWarning*(
    this: var vtkExodusIIWriter; _arg: bool) {.importcpp: "SetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArrayWriteAllTimeStepsIgnoreMetaDataWarning",
    header: "vtkExodusIIWriter.h".}
## !!!Ignored construct:  virtual bool GetStoreDoublesGhostLevelWriteOutBlockIdArrayWriteOutGlobalNodeIdArrayWriteOutGlobalElementIdArrayWriteAllTimeStepsIgnoreMetaDataWarning ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreMetaDataWarning  of  << this -> IgnoreMetaDataWarning ) ; return this -> IgnoreMetaDataWarning ; } ;
## Error: expected ';'!!!

proc IgnoreMetaDataWarningOn*(this: var vtkExodusIIWriter) {.
    importcpp: "IgnoreMetaDataWarningOn", header: "vtkExodusIIWriter.h".}
proc IgnoreMetaDataWarningOff*(this: var vtkExodusIIWriter) {.
    importcpp: "IgnoreMetaDataWarningOff", header: "vtkExodusIIWriter.h".}