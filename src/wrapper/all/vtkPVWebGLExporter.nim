## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPVWebGLExporter.h
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

import
  vtkExporter, vtkWebGLExporterModule

type
  vtkPVWebGLExporter* {.importcpp: "vtkPVWebGLExporter",
                       header: "vtkPVWebGLExporter.h", bycopy.} = object of vtkExporter
    vtkPVWebGLExporter* {.importc: "vtkPVWebGLExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkPVWebGLExporter {.importcpp: "vtkPVWebGLExporter::New(@)",
                                  header: "vtkPVWebGLExporter.h".}
type
  vtkPVWebGLExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPVWebGLExporter::IsTypeOf(@)", header: "vtkPVWebGLExporter.h".}
proc IsA*(this: var vtkPVWebGLExporter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPVWebGLExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPVWebGLExporter {.
    importcpp: "vtkPVWebGLExporter::SafeDownCast(@)",
    header: "vtkPVWebGLExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPVWebGLExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPVWebGLExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPVWebGLExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPVWebGLExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPVWebGLExporter.h".}
## !!!Ignored construct:   Description:
##  Specify the name of the VRML file to write. virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!
