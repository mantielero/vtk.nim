## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIVExporter.h
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
##  @class   vtkIVExporter
##  @brief   export a scene into OpenInventor 2.0 format.
##
##  vtkIVExporter is a concrete subclass of vtkExporter that writes
##  OpenInventor 2.0 files.
##
##  @sa
##  vtkExporter
##

import
  vtkExporter, vtkIOExportModule

discard "forward decl of vtkLight"
discard "forward decl of vtkActor"
discard "forward decl of vtkPoints"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkIVExporter* {.importcpp: "vtkIVExporter", header: "vtkIVExporter.h", bycopy.} = object of vtkExporter
    vtkIVExporter* {.importc: "vtkIVExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkIVExporter {.importcpp: "vtkIVExporter::New(@)",
                             header: "vtkIVExporter.h".}
type
  vtkIVExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkIVExporter::IsTypeOf(@)", header: "vtkIVExporter.h".}
proc IsA*(this: var vtkIVExporter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkIVExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkIVExporter {.
    importcpp: "vtkIVExporter::SafeDownCast(@)", header: "vtkIVExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkIVExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIVExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIVExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkIVExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkIVExporter.h".}
## !!!Ignored construct:  /@{ *
##  Specify the name of the OpenInventor file to write.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!
