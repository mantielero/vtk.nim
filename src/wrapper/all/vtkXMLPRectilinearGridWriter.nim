## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPRectilinearGridWriter.h
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
##  @class   vtkXMLPRectilinearGridWriter
##  @brief   Write PVTK XML RectilinearGrid files.
##
##  vtkXMLPRectilinearGridWriter writes the PVTK XML RectilinearGrid
##  file format.  One rectilinear grid input can be written into a
##  parallel file format with any number of pieces spread across files.
##  The standard extension for this writer's file format is "pvtr".
##  This writer uses vtkXMLRectilinearGridWriter to write the
##  individual piece files.
##
##  @sa
##  vtkXMLRectilinearGridWriter
##

import
  vtkIOParallelXMLModule, vtkXMLPStructuredDataWriter

discard "forward decl of vtkRectilinearGrid"
type
  vtkXMLPRectilinearGridWriter* {.importcpp: "vtkXMLPRectilinearGridWriter",
                                 header: "vtkXMLPRectilinearGridWriter.h", bycopy.} = object of vtkXMLPStructuredDataWriter
    vtkXMLPRectilinearGridWriter* {.importc: "vtkXMLPRectilinearGridWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPRectilinearGridWriter {.
    importcpp: "vtkXMLPRectilinearGridWriter::New(@)",
    header: "vtkXMLPRectilinearGridWriter.h".}
type
  vtkXMLPRectilinearGridWriterSuperclass* = vtkXMLPStructuredDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPRectilinearGridWriter::IsTypeOf(@)",
    header: "vtkXMLPRectilinearGridWriter.h".}
proc IsA*(this: var vtkXMLPRectilinearGridWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPRectilinearGridWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPRectilinearGridWriter {.
    importcpp: "vtkXMLPRectilinearGridWriter::SafeDownCast(@)",
    header: "vtkXMLPRectilinearGridWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPRectilinearGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPStructuredDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPRectilinearGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPRectilinearGridWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPRectilinearGridWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPRectilinearGridWriter.h".}
proc GetInput*(this: var vtkXMLPRectilinearGridWriter): ptr vtkRectilinearGrid {.
    importcpp: "GetInput", header: "vtkXMLPRectilinearGridWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLPRectilinearGridWriter): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLPRectilinearGridWriter.h".}