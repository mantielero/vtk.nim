## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLDataSetWriter.h
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
##  @class   vtkXMLDataSetWriter
##  @brief   Write any type of VTK XML file.
##
##  vtkXMLDataSetWriter is a wrapper around the VTK XML file format
##  writers.  Given an input vtkDataSet, the correct writer is
##  automatically selected based on the type of input.
##
##  @sa
##  vtkXMLImageDataWriter vtkXMLStructuredGridWriter
##  vtkXMLRectilinearGridWriter vtkXMLPolyDataWriter
##  vtkXMLUnstructuredGridWriter
##

import
  vtkIOXMLModule, vtkXMLDataObjectWriter

discard "forward decl of vtkCallbackCommand"
type
  vtkXMLDataSetWriter* {.importcpp: "vtkXMLDataSetWriter",
                        header: "vtkXMLDataSetWriter.h", bycopy.} = object of vtkXMLDataObjectWriter
    vtkXMLDataSetWriter* {.importc: "vtkXMLDataSetWriter".}: VTK_NEWINSTANCE

  vtkXMLDataSetWriterSuperclass* = vtkXMLDataObjectWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLDataSetWriter::IsTypeOf(@)", header: "vtkXMLDataSetWriter.h".}
proc IsA*(this: var vtkXMLDataSetWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLDataSetWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLDataSetWriter {.
    importcpp: "vtkXMLDataSetWriter::SafeDownCast(@)",
    header: "vtkXMLDataSetWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLDataSetWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLDataSetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLDataSetWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkXMLDataSetWriter {.importcpp: "vtkXMLDataSetWriter::New(@)",
                                   header: "vtkXMLDataSetWriter.h".}
proc PrintSelf*(this: var vtkXMLDataSetWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLDataSetWriter.h".}