## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPHyperTreeGridWriter.h
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
##  @class   vtkXMLPHyperTreeGridWriter
##  @brief   Write PVTK XML HyperTreeGrid files.
##
##  vtkXMLPHyperTreeGridWriter writes the PVTK XML HyperTreeGrid
##  file format.  One hypertree grid input can be written into a
##  parallel file format with any number of pieces spread across files.
##  The standard extension for this writer's file format is "phtg".
##  This writer uses vtkXMLHyperTreeGridWriter to write the
##  individual piece files.
##
##  @sa
##  vtkXMLHyperTreeGridWriter
##

import
  vtkXMLPDataObjectWriter

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkHyperTreeGrid"
discard "forward decl of vtkXMLHyperTreeGridWriter"
discard "forward decl of vtkXMLPDataObjectWriter"
type
  vtkXMLPHyperTreeGridWriter* {.importcpp: "vtkXMLPHyperTreeGridWriter",
                               header: "vtkXMLPHyperTreeGridWriter.h", bycopy.} = object of vtkXMLPDataObjectWriter
    vtkXMLPHyperTreeGridWriter* {.importc: "vtkXMLPHyperTreeGridWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPHyperTreeGridWriter {.
    importcpp: "vtkXMLPHyperTreeGridWriter::New(@)",
    header: "vtkXMLPHyperTreeGridWriter.h".}
type
  vtkXMLPHyperTreeGridWriterSuperclass* = vtkXMLPDataObjectWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPHyperTreeGridWriter::IsTypeOf(@)",
    header: "vtkXMLPHyperTreeGridWriter.h".}
proc IsA*(this: var vtkXMLPHyperTreeGridWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPHyperTreeGridWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPHyperTreeGridWriter {.
    importcpp: "vtkXMLPHyperTreeGridWriter::SafeDownCast(@)",
    header: "vtkXMLPHyperTreeGridWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPHyperTreeGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPHyperTreeGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPHyperTreeGridWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPHyperTreeGridWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPHyperTreeGridWriter.h".}
proc GetInput*(this: var vtkXMLPHyperTreeGridWriter): ptr vtkHyperTreeGrid {.
    importcpp: "GetInput", header: "vtkXMLPHyperTreeGridWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLPHyperTreeGridWriter): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLPHyperTreeGridWriter.h".}