## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLHierarchicalBoxDataFileConverter.h
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
##  @class   vtkXMLHierarchicalBoxDataFileConverter
##  @brief   converts older *.vth, *.vthb
##  files to newer format.
##
##  vtkXMLHierarchicalBoxDataFileConverter is a utility class to convert v0.1 and
##  v1.0 of the VTK XML hierarchical file format to the v1.1. Users can then use
##  vtkXMLUniformGridAMRReader to read the dataset into VTK.
##

import
  vtkIOXMLModule, vtkObject

discard "forward decl of vtkXMLDataElement"
type
  vtkXMLHierarchicalBoxDataFileConverter* {.
      importcpp: "vtkXMLHierarchicalBoxDataFileConverter",
      header: "vtkXMLHierarchicalBoxDataFileConverter.h", bycopy.} = object of vtkObject
    vtkXMLHierarchicalBoxDataFileConverter*
        {.importc: "vtkXMLHierarchicalBoxDataFileConverter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkXMLHierarchicalBoxDataFileConverter {.
    importcpp: "vtkXMLHierarchicalBoxDataFileConverter::New(@)",
    header: "vtkXMLHierarchicalBoxDataFileConverter.h".}
type
  vtkXMLHierarchicalBoxDataFileConverterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLHierarchicalBoxDataFileConverter::IsTypeOf(@)",
    header: "vtkXMLHierarchicalBoxDataFileConverter.h".}
proc IsA*(this: var vtkXMLHierarchicalBoxDataFileConverter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLHierarchicalBoxDataFileConverter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLHierarchicalBoxDataFileConverter {.
    importcpp: "vtkXMLHierarchicalBoxDataFileConverter::SafeDownCast(@)",
    header: "vtkXMLHierarchicalBoxDataFileConverter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLHierarchicalBoxDataFileConverter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLHierarchicalBoxDataFileConverter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLHierarchicalBoxDataFileConverter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLHierarchicalBoxDataFileConverter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkXMLHierarchicalBoxDataFileConverter.h".}
## !!!Ignored construct:  /@{ *
##  Set the input filename.
##  virtual void SetInputFileNameInputFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << InputFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> InputFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> InputFileName && _arg && ( ! strcmp ( this -> InputFileName , _arg ) ) ) { return ; } delete [ ] this -> InputFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> InputFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> InputFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetInputFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << InputFileName  of  << ( this -> InputFileName ? this -> InputFileName : (null) ) ) ; return this -> InputFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set the output filename.
##  virtual void SetInputFileNameInputFileNameOutputFileNameOutputFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OutputFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> OutputFileName && _arg && ( ! strcmp ( this -> OutputFileName , _arg ) ) ) { return ; } delete [ ] this -> OutputFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OutputFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OutputFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetInputFileNameOutputFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputFileName  of  << ( this -> OutputFileName ? this -> OutputFileName : (null) ) ) ; return this -> OutputFileName ; } ;
## Error: expected ';'!!!

proc Convert*(this: var vtkXMLHierarchicalBoxDataFileConverter): bool {.
    importcpp: "Convert", header: "vtkXMLHierarchicalBoxDataFileConverter.h".}
## !!!Ignored construct:  virtual void SetInputFileNameInputFileNameOutputFileNameOutputFileNameFilePath ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePath  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePath == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePath && _arg && ( ! strcmp ( this -> FilePath , _arg ) ) ) { return ; } delete [ ] this -> FilePath ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePath = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePath = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!
