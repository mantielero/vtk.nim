## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSimplePointsReader.h
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
##  @class   vtkSimplePointsReader
##  @brief   Read a list of points from a file.
##
##  vtkSimplePointsReader is a source object that reads a list of
##  points from a file.  Each point is specified by three
##  floating-point values in ASCII format.  There is one point per line
##  of the file.  A vertex cell is created for each point in the
##  output.  This reader is meant as an example of how to write a
##  reader in VTK.
##

import
  vtkIOLegacyModule, vtkPolyDataAlgorithm

type
  vtkSimplePointsReader* {.importcpp: "vtkSimplePointsReader",
                          header: "vtkSimplePointsReader.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkSimplePointsReader* {.importc: "vtkSimplePointsReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkSimplePointsReader {.importcpp: "vtkSimplePointsReader::New(@)",
                                     header: "vtkSimplePointsReader.h".}
type
  vtkSimplePointsReaderSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSimplePointsReader::IsTypeOf(@)",
    header: "vtkSimplePointsReader.h".}
proc IsA*(this: var vtkSimplePointsReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSimplePointsReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSimplePointsReader {.
    importcpp: "vtkSimplePointsReader::SafeDownCast(@)",
    header: "vtkSimplePointsReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSimplePointsReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSimplePointsReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSimplePointsReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSimplePointsReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSimplePointsReader.h".}
## !!!Ignored construct:  /@{ *
##  Set/Get the name of the file from which to read points.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!
