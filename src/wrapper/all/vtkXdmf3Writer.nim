## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmf3Writer.h
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
##  @class   vtkXdmf3Writer
##  @brief   write eXtensible Data Model and Format files
##
##  vtkXdmf3Writer converts vtkDataObjects to XDMF format. This is intended to
##  replace vtkXdmfWriter, which is not up to date with the capabilities of the
##  newer XDMF3 library. This writer understands VTK's composite data types and
##  produces full trees in the output XDMF files.
##

import
  vtkIOXdmf3Module, vtkDataObjectAlgorithm

discard "forward decl of vtkDoubleArray"
type
  vtkXdmf3Writer* {.importcpp: "vtkXdmf3Writer", header: "vtkXdmf3Writer.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkXdmf3Writer* {.importc: "vtkXdmf3Writer".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkXdmf3Writer {.importcpp: "vtkXdmf3Writer::New(@)",
                              header: "vtkXdmf3Writer.h".}
type
  vtkXdmf3WriterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXdmf3Writer::IsTypeOf(@)", header: "vtkXdmf3Writer.h".}
proc IsA*(this: var vtkXdmf3Writer; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXdmf3Writer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXdmf3Writer {.
    importcpp: "vtkXdmf3Writer::SafeDownCast(@)", header: "vtkXdmf3Writer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXdmf3Writer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXdmf3Writer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXdmf3Writer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXdmf3Writer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXdmf3Writer.h".}
proc SetInputData*(this: var vtkXdmf3Writer; dobj: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkXdmf3Writer.h".}
## !!!Ignored construct:  /@{ *
##  Set or get the file name of the xdmf file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetGhostLevel*(this: var vtkXdmf3Writer; a2: cint) {.importcpp: "SetGhostLevel",
    header: "vtkXdmf3Writer.h".}
proc GetGhostLevel*(this: var vtkXdmf3Writer): cint {.importcpp: "GetGhostLevel",
    header: "vtkXdmf3Writer.h".}
proc Write*(this: var vtkXdmf3Writer): cint {.importcpp: "Write",
    header: "vtkXdmf3Writer.h".}
proc SetLightDataLimit*(this: var vtkXdmf3Writer; _arg: cuint) {.
    importcpp: "SetLightDataLimit", header: "vtkXdmf3Writer.h".}
## !!!Ignored construct:  virtual unsigned int GetLightDataLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightDataLimit  of  << this -> LightDataLimit ) ; return this -> LightDataLimit ; } ;
## Error: expected ';'!!!

proc SetLightDataLimitWriteAllTimeSteps*(this: var vtkXdmf3Writer; _arg: bool) {.
    importcpp: "SetLightDataLimitWriteAllTimeSteps", header: "vtkXdmf3Writer.h".}
## !!!Ignored construct:  virtual bool GetLightDataLimitWriteAllTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteAllTimeSteps  of  << this -> WriteAllTimeSteps ) ; return this -> WriteAllTimeSteps ; } ;
## Error: expected ';'!!!

proc WriteAllTimeStepsOn*(this: var vtkXdmf3Writer) {.
    importcpp: "WriteAllTimeStepsOn", header: "vtkXdmf3Writer.h".}
proc WriteAllTimeStepsOff*(this: var vtkXdmf3Writer) {.
    importcpp: "WriteAllTimeStepsOff", header: "vtkXdmf3Writer.h".}
  ## /@}