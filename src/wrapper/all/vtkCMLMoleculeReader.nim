## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCMLMoleculeReader.h
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
##  @class   vtkCMLMoleculeReader
##  @brief   Read a CML file and output a
##  vtkMolecule object
##
##

import
  vtkIOChemistryModule, vtkMoleculeAlgorithm

discard "forward decl of vtkMolecule"
type
  vtkCMLMoleculeReader* {.importcpp: "vtkCMLMoleculeReader",
                         header: "vtkCMLMoleculeReader.h", bycopy.} = object of vtkMoleculeAlgorithm
    vtkCMLMoleculeReader* {.importc: "vtkCMLMoleculeReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkCMLMoleculeReader {.importcpp: "vtkCMLMoleculeReader::New(@)",
                                    header: "vtkCMLMoleculeReader.h".}
type
  vtkCMLMoleculeReaderSuperclass* = vtkMoleculeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkCMLMoleculeReader::IsTypeOf(@)",
    header: "vtkCMLMoleculeReader.h".}
proc IsA*(this: var vtkCMLMoleculeReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkCMLMoleculeReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkCMLMoleculeReader {.
    importcpp: "vtkCMLMoleculeReader::SafeDownCast(@)",
    header: "vtkCMLMoleculeReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkCMLMoleculeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMoleculeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCMLMoleculeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCMLMoleculeReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkCMLMoleculeReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkCMLMoleculeReader.h".}
proc GetOutput*(this: var vtkCMLMoleculeReader): ptr vtkMolecule {.
    importcpp: "GetOutput", header: "vtkCMLMoleculeReader.h".}
proc SetOutput*(this: var vtkCMLMoleculeReader; a2: ptr vtkMolecule) {.
    importcpp: "SetOutput", header: "vtkCMLMoleculeReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set the name of the CML file
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!
