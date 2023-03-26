## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLHierarchicalBoxDataWriter.h
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
##  @class   vtkXMLHierarchicalBoxDataWriter
##  @brief   writer for vtkHierarchicalBoxDataSet
##  for backwards compatibility.
##
##  vtkXMLHierarchicalBoxDataWriter is an empty subclass of
##  vtkXMLUniformGridAMRWriter for writing vtkUniformGridAMR datasets in
##  VTK-XML format.
##

import
  vtkXMLUniformGridAMRWriter

type
  vtkXMLHierarchicalBoxDataWriter* {.importcpp: "vtkXMLHierarchicalBoxDataWriter", header: "vtkXMLHierarchicalBoxDataWriter.h",
                                    bycopy.} = object of vtkXMLUniformGridAMRWriter
    vtkXMLHierarchicalBoxDataWriter* {.importc: "vtkXMLHierarchicalBoxDataWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLHierarchicalBoxDataWriter {.
    importcpp: "vtkXMLHierarchicalBoxDataWriter::New(@)",
    header: "vtkXMLHierarchicalBoxDataWriter.h".}
type
  vtkXMLHierarchicalBoxDataWriterSuperclass* = vtkXMLUniformGridAMRWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLHierarchicalBoxDataWriter::IsTypeOf(@)",
    header: "vtkXMLHierarchicalBoxDataWriter.h".}
proc IsA*(this: var vtkXMLHierarchicalBoxDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLHierarchicalBoxDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLHierarchicalBoxDataWriter {.
    importcpp: "vtkXMLHierarchicalBoxDataWriter::SafeDownCast(@)",
    header: "vtkXMLHierarchicalBoxDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLHierarchicalBoxDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLUniformGridAMRWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLHierarchicalBoxDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLHierarchicalBoxDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLHierarchicalBoxDataWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLHierarchicalBoxDataWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLHierarchicalBoxDataWriter): cstring {.
    importcpp: "GetDefaultFileExtension",
    header: "vtkXMLHierarchicalBoxDataWriter.h".}