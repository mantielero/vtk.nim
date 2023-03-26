## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInteractorEventRecorder.h
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
##  @class   vtkInteractorEventRecorder
##  @brief   record and play VTK events passing through a vtkRenderWindowInteractor
##
##
##  vtkInteractorEventRecorder records all VTK events invoked from a
##  vtkRenderWindowInteractor. The events are recorded to a
##  file. vtkInteractorEventRecorder can also be used to play those events
##  back and invoke them on an vtkRenderWindowInteractor. (Note: the events
##  can also be played back from a file or string.)
##
##  Event client data can be recorded as args and will be provided on replay.
##  The following event current support data to be recorded:
##   - DropFilesEvents: record a string array
##
##  The format of the event file is simple. It is:
##   EventName X Y ctrl shift keycode repeatCount keySym dataType [dataNum] [dataVal] [dataVal]
##  The format also allows "#" comments.
##  dataType is defined as follows:
##   - 0 -> None
##   - 1 -> StringArray
##
##  @sa
##  vtkInteractorObserver vtkCallback
##

import
  vtkDeprecation, vtkInteractorObserver, vtkRenderingCoreModule

discard "forward decl of vtkStringArray"
type
  vtkInteractorEventRecorder* {.importcpp: "vtkInteractorEventRecorder",
                               header: "vtkInteractorEventRecorder.h", bycopy.} = object of vtkInteractorObserver
    vtkInteractorEventRecorder* {.importc: "vtkInteractorEventRecorder".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  listens to delete events
    ##  control whether to read from string
    ##  for reading and writing
    ##  methods for processing events


proc New*(): ptr vtkInteractorEventRecorder {.
    importcpp: "vtkInteractorEventRecorder::New(@)",
    header: "vtkInteractorEventRecorder.h".}
type
  vtkInteractorEventRecorderSuperclass* = vtkInteractorObserver

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInteractorEventRecorder::IsTypeOf(@)",
    header: "vtkInteractorEventRecorder.h".}
proc IsA*(this: var vtkInteractorEventRecorder; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInteractorEventRecorder.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInteractorEventRecorder {.
    importcpp: "vtkInteractorEventRecorder::SafeDownCast(@)",
    header: "vtkInteractorEventRecorder.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInteractorEventRecorder :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInteractorObserver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInteractorEventRecorder :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInteractorEventRecorder :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInteractorEventRecorder; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkInteractorEventRecorder.h".}
## !!!Ignored construct:   enumeration of data type enum class vtkEventDataType : int { None = 0 , StringArray } ;
## Error: token expected: ; but got: :!!!

proc SetEnabled*(this: var vtkInteractorEventRecorder; a2: cint) {.
    importcpp: "SetEnabled", header: "vtkInteractorEventRecorder.h".}
proc SetInteractor*(this: var vtkInteractorEventRecorder;
                   iren: ptr vtkRenderWindowInteractor) {.
    importcpp: "SetInteractor", header: "vtkInteractorEventRecorder.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the name of a file events should be written to/from.
##  Will be ignored once record/play has been called.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc Record*(this: var vtkInteractorEventRecorder) {.importcpp: "Record",
    header: "vtkInteractorEventRecorder.h".}
proc Play*(this: var vtkInteractorEventRecorder) {.importcpp: "Play",
    header: "vtkInteractorEventRecorder.h".}
proc Stop*(this: var vtkInteractorEventRecorder) {.importcpp: "Stop",
    header: "vtkInteractorEventRecorder.h".}
proc Clear*(this: var vtkInteractorEventRecorder) {.importcpp: "Clear",
    header: "vtkInteractorEventRecorder.h".}
proc Rewind*(this: var vtkInteractorEventRecorder) {.importcpp: "Rewind",
    header: "vtkInteractorEventRecorder.h".}
proc SetReadFromInputString*(this: var vtkInteractorEventRecorder; _arg: vtkTypeBool) {.
    importcpp: "SetReadFromInputString", header: "vtkInteractorEventRecorder.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ;
## Error: expected ';'!!!

proc ReadFromInputStringOn*(this: var vtkInteractorEventRecorder) {.
    importcpp: "ReadFromInputStringOn", header: "vtkInteractorEventRecorder.h".}
proc ReadFromInputStringOff*(this: var vtkInteractorEventRecorder) {.
    importcpp: "ReadFromInputStringOff", header: "vtkInteractorEventRecorder.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/Get the string to read from.
  ##
proc SetInputString*(this: var vtkInteractorEventRecorder; _arg: cstring) {.
    importcpp: "SetInputString", header: "vtkInteractorEventRecorder.h".}
proc GetInputString*(this: var vtkInteractorEventRecorder): cstring {.
    importcpp: "GetInputString", header: "vtkInteractorEventRecorder.h".}
  ## /@}
## !!!Ignored construct:  VTK_DEPRECATED_IN_9_2_0 ( This method was not used at all and has been replaced by ReadEvent(const std::string&) ) virtual void ReadEvent ( ) { } ;
## Error: identifier expected, but got: This method was not used at all and has been replaced by ReadEvent(const std::string&)!!!
