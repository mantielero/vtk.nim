## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFileOutputWindow.h
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
##  @class   vtkFileOutputWindow
##  @brief   File Specific output window class
##
##  Writes debug/warning/error output to a log file instead of the console.
##  To use this class, instantiate it and then call SetInstance(this).
##
##

import
  vtkCommonCoreModule, vtkOutputWindow

type
  vtkFileOutputWindow* {.importcpp: "vtkFileOutputWindow",
                        header: "vtkFileOutputWindow.h", bycopy.} = object of vtkOutputWindow
    vtkFileOutputWindow* {.importc: "vtkFileOutputWindow".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkFileOutputWindowSuperclass* = vtkOutputWindow

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFileOutputWindow::IsTypeOf(@)", header: "vtkFileOutputWindow.h".}
proc IsA*(this: var vtkFileOutputWindow; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFileOutputWindow.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFileOutputWindow {.
    importcpp: "vtkFileOutputWindow::SafeDownCast(@)",
    header: "vtkFileOutputWindow.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFileOutputWindow :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOutputWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFileOutputWindow :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFileOutputWindow :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkFileOutputWindow {.importcpp: "vtkFileOutputWindow::New(@)",
                                   header: "vtkFileOutputWindow.h".}
proc PrintSelf*(this: var vtkFileOutputWindow; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFileOutputWindow.h".}
proc DisplayText*(this: var vtkFileOutputWindow; a2: cstring) {.
    importcpp: "DisplayText", header: "vtkFileOutputWindow.h".}
## !!!Ignored construct:  /@{ *
##  Sets the name for the log file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetFlush*(this: var vtkFileOutputWindow; _arg: vtkTypeBool) {.
    importcpp: "SetFlush", header: "vtkFileOutputWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFlush ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Flush  of  << this -> Flush ) ; return this -> Flush ; } ;
## Error: expected ';'!!!

proc FlushOn*(this: var vtkFileOutputWindow) {.importcpp: "FlushOn",
    header: "vtkFileOutputWindow.h".}
proc FlushOff*(this: var vtkFileOutputWindow) {.importcpp: "FlushOff",
    header: "vtkFileOutputWindow.h".}
  ## /@}
  ## /@{
  ## *
  ##  Setting append will cause the log file to be
  ##  opened in append mode.  Otherwise, if the log file exists,
  ##  it will be overwritten each time the vtkFileOutputWindow
  ##  is created.
  ##
proc SetFlushAppend*(this: var vtkFileOutputWindow; _arg: vtkTypeBool) {.
    importcpp: "SetFlushAppend", header: "vtkFileOutputWindow.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetFlushAppend ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Append  of  << this -> Append ) ; return this -> Append ; } ;
## Error: expected ';'!!!

proc AppendOn*(this: var vtkFileOutputWindow) {.importcpp: "AppendOn",
    header: "vtkFileOutputWindow.h".}
proc AppendOff*(this: var vtkFileOutputWindow) {.importcpp: "AppendOff",
    header: "vtkFileOutputWindow.h".}
  ## /@}