## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLUnstructuredDataReader.h
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
##  @class   vtkXMLUnstructuredDataReader
##  @brief   Superclass for unstructured data XML readers.
##
##  vtkXMLUnstructuredDataReader provides functionality common to all
##  unstructured data format readers.
##
##  @sa
##  vtkXMLPolyDataReader vtkXMLUnstructuredGridReader
##

import
  vtkIOXMLModule, vtkXMLDataReader

discard "forward decl of vtkCellArray"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkPointSet"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkXMLUnstructuredDataReader* {.importcpp: "vtkXMLUnstructuredDataReader",
                                 header: "vtkXMLUnstructuredDataReader.h", bycopy.} = object of vtkXMLDataReader
    vtkXMLUnstructuredDataReader* {.importc: "vtkXMLUnstructuredDataReader".}: VTK_NEWINSTANCE
    ##  The range of pieces from the file that will form the UpdatePiece.
    ##  The Points element for each piece.

  vtkXMLUnstructuredDataReaderSuperclass* = vtkXMLDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLUnstructuredDataReader::IsTypeOf(@)",
    header: "vtkXMLUnstructuredDataReader.h".}
proc IsA*(this: var vtkXMLUnstructuredDataReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLUnstructuredDataReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLUnstructuredDataReader {.
    importcpp: "vtkXMLUnstructuredDataReader::SafeDownCast(@)",
    header: "vtkXMLUnstructuredDataReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLUnstructuredDataReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLUnstructuredDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLUnstructuredDataReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLUnstructuredDataReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLUnstructuredDataReader.h".}
proc GetNumberOfPoints*(this: var vtkXMLUnstructuredDataReader): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkXMLUnstructuredDataReader.h".}
proc GetNumberOfCells*(this: var vtkXMLUnstructuredDataReader): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkXMLUnstructuredDataReader.h".}
proc GetNumberOfPieces*(this: var vtkXMLUnstructuredDataReader): vtkIdType {.
    importcpp: "GetNumberOfPieces", header: "vtkXMLUnstructuredDataReader.h".}
proc SetupUpdateExtent*(this: var vtkXMLUnstructuredDataReader; piece: cint;
                       numberOfPieces: cint; ghostLevel: cint) {.
    importcpp: "SetupUpdateExtent", header: "vtkXMLUnstructuredDataReader.h".}
proc CopyOutputInformation*(this: var vtkXMLUnstructuredDataReader;
                           outInfo: ptr vtkInformation; port: cint) {.
    importcpp: "CopyOutputInformation", header: "vtkXMLUnstructuredDataReader.h".}