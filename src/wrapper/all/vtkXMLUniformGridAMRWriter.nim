## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLUniformGridAMRWriter.h
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
##  @class   vtkXMLUniformGridAMRWriter
##  @brief   writer for vtkUniformGridAMR.
##
##  vtkXMLUniformGridAMRWriter is a vtkXMLCompositeDataWriter subclass to
##  handle vtkUniformGridAMR datasets (including vtkNonOverlappingAMR and
##  vtkOverlappingAMR).
##

import
  vtkIOXMLModule, vtkXMLCompositeDataWriter

type
  vtkXMLUniformGridAMRWriter* {.importcpp: "vtkXMLUniformGridAMRWriter",
                               header: "vtkXMLUniformGridAMRWriter.h", bycopy.} = object of vtkXMLCompositeDataWriter
    vtkXMLUniformGridAMRWriter* {.importc: "vtkXMLUniformGridAMRWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLUniformGridAMRWriter {.
    importcpp: "vtkXMLUniformGridAMRWriter::New(@)",
    header: "vtkXMLUniformGridAMRWriter.h".}
type
  vtkXMLUniformGridAMRWriterSuperclass* = vtkXMLCompositeDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLUniformGridAMRWriter::IsTypeOf(@)",
    header: "vtkXMLUniformGridAMRWriter.h".}
proc IsA*(this: var vtkXMLUniformGridAMRWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLUniformGridAMRWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLUniformGridAMRWriter {.
    importcpp: "vtkXMLUniformGridAMRWriter::SafeDownCast(@)",
    header: "vtkXMLUniformGridAMRWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLUniformGridAMRWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLCompositeDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLUniformGridAMRWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLUniformGridAMRWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLUniformGridAMRWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLUniformGridAMRWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLUniformGridAMRWriter): cstring {.
    importcpp: "GetDefaultFileExtension", header: "vtkXMLUniformGridAMRWriter.h".}