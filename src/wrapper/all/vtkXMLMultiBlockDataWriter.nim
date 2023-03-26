## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLMultiBlockDataWriter.h
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
##  @class   vtkXMLMultiBlockDataWriter
##  @brief   writer for vtkMultiBlockDataSet.
##
##  vtkXMLMultiBlockDataWriter is a vtkXMLCompositeDataWriter subclass to handle
##  vtkMultiBlockDataSet.
##

import
  vtkIOXMLModule, vtkXMLCompositeDataWriter

type
  vtkXMLMultiBlockDataWriter* {.importcpp: "vtkXMLMultiBlockDataWriter",
                               header: "vtkXMLMultiBlockDataWriter.h", bycopy.} = object of vtkXMLCompositeDataWriter
    vtkXMLMultiBlockDataWriter* {.importc: "vtkXMLMultiBlockDataWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLMultiBlockDataWriter {.
    importcpp: "vtkXMLMultiBlockDataWriter::New(@)",
    header: "vtkXMLMultiBlockDataWriter.h".}
type
  vtkXMLMultiBlockDataWriterSuperclass* = vtkXMLCompositeDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLMultiBlockDataWriter::IsTypeOf(@)",
    header: "vtkXMLMultiBlockDataWriter.h".}
proc IsA*(this: var vtkXMLMultiBlockDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLMultiBlockDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLMultiBlockDataWriter {.
    importcpp: "vtkXMLMultiBlockDataWriter::SafeDownCast(@)",
    header: "vtkXMLMultiBlockDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLMultiBlockDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLCompositeDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLMultiBlockDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLMultiBlockDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLMultiBlockDataWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLMultiBlockDataWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLMultiBlockDataWriter): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLMultiBlockDataWriter.h".}