## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEnSightWriter.h
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
##  @class   vtkEnSightWriter
##  @brief   write vtk unstructured grid data as an EnSight file
##
##  vtkEnSightWriter is a source object that writes binary
##  unstructured grid data files in EnSight format. See EnSight Manual for
##  format details
##
##  @warning
##  Binary files written on one system may not be readable on other systems.
##  Be sure to specify the endian-ness of the file when reading it into EnSight
##

import
  vtkIOParallelModule, vtkWriter

discard "forward decl of vtkUnstructuredGrid"
type
  vtkEnSightWriter* {.importcpp: "vtkEnSightWriter", header: "vtkEnSightWriter.h",
                     bycopy.} = object of vtkWriter
    vtkEnSightWriter* {.importc: "vtkEnSightWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkEnSightWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkEnSightWriter::IsTypeOf(@)", header: "vtkEnSightWriter.h".}
proc IsA*(this: var vtkEnSightWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkEnSightWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkEnSightWriter {.
    importcpp: "vtkEnSightWriter::SafeDownCast(@)", header: "vtkEnSightWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkEnSightWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEnSightWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEnSightWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkEnSightWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkEnSightWriter.h".}
proc New*(): ptr vtkEnSightWriter {.importcpp: "vtkEnSightWriter::New(@)",
                                header: "vtkEnSightWriter.h".}
proc SetProcessNumber*(this: var vtkEnSightWriter; _arg: cint) {.
    importcpp: "SetProcessNumber", header: "vtkEnSightWriter.h".}
## !!!Ignored construct:  virtual int GetProcessNumber ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ProcessNumber  of  << this -> ProcessNumber ) ; return this -> ProcessNumber ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify path of EnSight data files to write.
##  virtual void SetPathPath ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Path  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> Path == nullptr && _arg == nullptr ) { return ; } if ( this -> Path && _arg && ( ! strcmp ( this -> Path , _arg ) ) ) { return ; } delete [ ] this -> Path ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> Path = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> Path = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetPath ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Path  of  << ( this -> Path ? this -> Path : (null) ) ) ; return this -> Path ; } ;
## Error: expected ';'!!!

proc SetBaseName*(this: var vtkEnSightWriter; _arg: cstring) {.
    importcpp: "SetBaseName", header: "vtkEnSightWriter.h".}
proc GetBaseName*(this: var vtkEnSightWriter): cstring {.importcpp: "GetBaseName",
    header: "vtkEnSightWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the path and base name of the output files.
  ##
## !!!Ignored construct:  virtual void SetPathPathFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetPathFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetProcessNumberTimeStep*(this: var vtkEnSightWriter; _arg: cint) {.
    importcpp: "SetProcessNumberTimeStep", header: "vtkEnSightWriter.h".}
## !!!Ignored construct:  virtual int GetProcessNumberTimeStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStep  of  << this -> TimeStep ) ; return this -> TimeStep ; } ;
## Error: expected ';'!!!

proc SetProcessNumberTimeStepGhostLevel*(this: var vtkEnSightWriter; _arg: cint) {.
    importcpp: "SetProcessNumberTimeStepGhostLevel", header: "vtkEnSightWriter.h".}
## !!!Ignored construct:  virtual int GetProcessNumberTimeStepGhostLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GhostLevel  of  << this -> GhostLevel ) ; return this -> GhostLevel ; } ;
## Error: expected ';'!!!

proc SetProcessNumberTimeStepGhostLevelTransientGeometry*(
    this: var vtkEnSightWriter; _arg: bool) {.
    importcpp: "SetProcessNumberTimeStepGhostLevelTransientGeometry",
    header: "vtkEnSightWriter.h".}
## !!!Ignored construct:  virtual bool GetProcessNumberTimeStepGhostLevelTransientGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TransientGeometry  of  << this -> TransientGeometry ) ; return this -> TransientGeometry ; } ;
## Error: expected ';'!!!

proc SetProcessNumberTimeStepGhostLevelTransientGeometryNumberOfBlocks*(
    this: var vtkEnSightWriter; _arg: cint) {.importcpp: "SetProcessNumberTimeStepGhostLevelTransientGeometryNumberOfBlocks",
    header: "vtkEnSightWriter.h".}
## !!!Ignored construct:  virtual int GetProcessNumberTimeStepGhostLevelTransientGeometryNumberOfBlocks ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfBlocks  of  << this -> NumberOfBlocks ) ; return this -> NumberOfBlocks ; } ;
## Error: expected ';'!!!

proc SetBlockIDs*(this: var vtkEnSightWriter; val: ptr cint) {.
    importcpp: "SetBlockIDs", header: "vtkEnSightWriter.h".}
proc GetBlockIDs*(this: var vtkEnSightWriter): ptr cint {.importcpp: "GetBlockIDs",
    header: "vtkEnSightWriter.h".}
proc SetInputData*(this: var vtkEnSightWriter; input: ptr vtkUnstructuredGrid) {.
    importcpp: "SetInputData", header: "vtkEnSightWriter.h".}
proc GetInput*(this: var vtkEnSightWriter): ptr vtkUnstructuredGrid {.
    importcpp: "GetInput", header: "vtkEnSightWriter.h".}
proc WriteCaseFile*(this: var vtkEnSightWriter; TotalTimeSteps: cint) {.
    importcpp: "WriteCaseFile", header: "vtkEnSightWriter.h".}
proc WriteSOSCaseFile*(this: var vtkEnSightWriter; NumProcs: cint) {.
    importcpp: "WriteSOSCaseFile", header: "vtkEnSightWriter.h".}