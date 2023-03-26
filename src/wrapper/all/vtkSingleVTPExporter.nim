## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSingleVTPExporter.h
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
##  @class   vtkSingleVTPExporter
##  @brief   export a scene into a single vtp file and png texture
##
##  vtkSingleVTPExporter is a concrete subclass of vtkExporter that writes
##  a .vtp file and a .png file containing the polydata and texture
##  elements of the scene.
##
##  If ActiveRenderer is specified then it exports contents of
##  ActiveRenderer. Otherwise it exports contents of all renderers.
##
##  @sa
##  vtkExporter
##

import
  vtkExporter, vtkIOExportModule

discard "forward decl of vtkActor"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkTexture"
type
  vtkSingleVTPExporter* {.importcpp: "vtkSingleVTPExporter",
                         header: "vtkSingleVTPExporter.h", bycopy.} = object of vtkExporter
    vtkSingleVTPExporter* {.importc: "vtkSingleVTPExporter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  handle repeating textures by subdividing triangles
    ##  so that they do not span mode than 0.0-1.5 of texture
    ##  range.


proc New*(): ptr vtkSingleVTPExporter {.importcpp: "vtkSingleVTPExporter::New(@)",
                                    header: "vtkSingleVTPExporter.h".}
type
  vtkSingleVTPExporterSuperclass* = vtkExporter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSingleVTPExporter::IsTypeOf(@)",
    header: "vtkSingleVTPExporter.h".}
proc IsA*(this: var vtkSingleVTPExporter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSingleVTPExporter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSingleVTPExporter {.
    importcpp: "vtkSingleVTPExporter::SafeDownCast(@)",
    header: "vtkSingleVTPExporter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSingleVTPExporter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSingleVTPExporter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSingleVTPExporter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSingleVTPExporter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSingleVTPExporter.h".}
## !!!Ignored construct:  /@{ *
##  Specify the prefix of the files to write out. The resulting filenames
##  will have .vtp and .png appended to them.
##  virtual void SetFilePrefixFilePrefix ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FilePrefix  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FilePrefix == nullptr && _arg == nullptr ) { return ; } if ( this -> FilePrefix && _arg && ( ! strcmp ( this -> FilePrefix , _arg ) ) ) { return ; } delete [ ] this -> FilePrefix ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FilePrefix = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FilePrefix = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFilePrefix ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilePrefix  of  << ( this -> FilePrefix ? this -> FilePrefix : (null) ) ) ; return this -> FilePrefix ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@}  computes the file prefix from a filename by removing
##  the .vtp extension if present. Useful for APIs that
##  are filename centric. void SetFileName ( VTK_FILEPATH const char * ) ;
## Error: token expected: ) but got: *!!!
