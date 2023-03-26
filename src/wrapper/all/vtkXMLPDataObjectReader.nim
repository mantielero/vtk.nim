## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPDataObjectReader.h
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
##  @class   vtkXMLPDataObjectReader
##  @brief   Superclass for PVTK XML file readers.
##
##  vtkXMLPDataObjectReader provides functionality common to all PVTK XML
##  file readers. Concrete subclasses call upon this functionality when needed.
##

import
  vtkIOXMLModule, vtkXMLReader

type
  vtkXMLPDataObjectReader* {.importcpp: "vtkXMLPDataObjectReader",
                            header: "vtkXMLPDataObjectReader.h", bycopy.} = object of vtkXMLReader
    vtkXMLPDataObjectReader* {.importc: "vtkXMLPDataObjectReader".}: VTK_NEWINSTANCE
    ## *
    ##  The piece currently being read.
    ##
    ## *
    ##  The path to the input file without the file name.
    ##
    ## /@{
    ## *
    ##  Information per-piece.
    ##
    ## /@}

  vtkXMLPDataObjectReaderSuperclass* = vtkXMLReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPDataObjectReader::IsTypeOf(@)",
    header: "vtkXMLPDataObjectReader.h".}
proc IsA*(this: var vtkXMLPDataObjectReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPDataObjectReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPDataObjectReader {.
    importcpp: "vtkXMLPDataObjectReader::SafeDownCast(@)",
    header: "vtkXMLPDataObjectReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPDataObjectReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPDataObjectReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPDataObjectReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPDataObjectReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLPDataObjectReader.h".}
## !!!Ignored construct:  *
##  Get the number of pieces from the summary file being read.
##  virtual int GetNumberOfPiecesNumberOfPieces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPieces  of  << this -> NumberOfPieces ) ; return this -> NumberOfPieces ; } ;
## Error: expected ';'!!!
