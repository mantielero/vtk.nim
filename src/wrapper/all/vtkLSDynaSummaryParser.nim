## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLSDynaSummaryParser.h
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
##  @class   vtkLSDynaSummaryParser
##  @brief   This is a helper class used by vtkLSDynaReader to read XML files.
##
##  @sa
##  vtkLSDynaReader
##

import
  vtkIOLSDynaModule, vtkStdString, vtkXMLParser

discard "forward decl of LSDynaMetaData"
type
  vtkLSDynaSummaryParser* {.importcpp: "vtkLSDynaSummaryParser",
                           header: "vtkLSDynaSummaryParser.h", bycopy.} = object of vtkXMLParser
    vtkLSDynaSummaryParser* {.importc: "vtkLSDynaSummaryParser".}: VTK_NEWINSTANCE
    MetaData* {.importc: "MetaData".}: ptr LSDynaMetaData

  vtkLSDynaSummaryParserSuperclass* = vtkXMLParser

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLSDynaSummaryParser::IsTypeOf(@)",
    header: "vtkLSDynaSummaryParser.h".}
proc IsA*(this: var vtkLSDynaSummaryParser; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLSDynaSummaryParser.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLSDynaSummaryParser {.
    importcpp: "vtkLSDynaSummaryParser::SafeDownCast(@)",
    header: "vtkLSDynaSummaryParser.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLSDynaSummaryParser :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLSDynaSummaryParser :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLSDynaSummaryParser :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkLSDynaSummaryParser {.importcpp: "vtkLSDynaSummaryParser::New(@)",
                                      header: "vtkLSDynaSummaryParser.h".}
proc PrintSelf*(this: var vtkLSDynaSummaryParser; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLSDynaSummaryParser.h".}