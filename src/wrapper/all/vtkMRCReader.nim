## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMRCReader.h
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
##  @class   vtkMRCReader
##  @brief   read MRC image files
##
##
##  A reader to load MRC images.  See http://bio3d.colorado.edu/imod/doc/mrc_format.txt
##  for the file format specification.
##

import
  vtkIOImageModule, vtkImageAlgorithm

discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
type
  vtkMRCReader* {.importcpp: "vtkMRCReader", header: "vtkMRCReader.h", bycopy.} = object of vtkImageAlgorithm
    vtkMRCReader* {.importc: "vtkMRCReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkMRCReader {.importcpp: "vtkMRCReader::New(@)",
                            header: "vtkMRCReader.h".}
type
  vtkMRCReaderSuperclass* = vtkImageAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMRCReader::IsTypeOf(@)", header: "vtkMRCReader.h".}
proc IsA*(this: var vtkMRCReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMRCReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMRCReader {.
    importcpp: "vtkMRCReader::SafeDownCast(@)", header: "vtkMRCReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMRCReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMRCReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMRCReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMRCReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMRCReader.h".}
## !!!Ignored construct:   .Description
##  Get/Set the file to read virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!
