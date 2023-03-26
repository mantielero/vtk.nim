## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPHierarchicalBoxDataWriter.h
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
##  @class   vtkXMLPHierarchicalBoxDataWriter
##  @brief   parallel writer for
##  vtkHierarchicalBoxDataSet for backwards compatibility.
##
##  vtkXMLPHierarchicalBoxDataWriter is an empty subclass of
##  vtkXMLPUniformGridAMRWriter for backwards compatibility.
##

import
  vtkIOParallelXMLModule, vtkXMLPUniformGridAMRWriter

type
  vtkXMLPHierarchicalBoxDataWriter* {.importcpp: "vtkXMLPHierarchicalBoxDataWriter", header: "vtkXMLPHierarchicalBoxDataWriter.h",
                                     bycopy.} = object of vtkXMLPUniformGridAMRWriter
    vtkXMLPHierarchicalBoxDataWriter* {.importc: "vtkXMLPHierarchicalBoxDataWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPHierarchicalBoxDataWriter {.
    importcpp: "vtkXMLPHierarchicalBoxDataWriter::New(@)",
    header: "vtkXMLPHierarchicalBoxDataWriter.h".}
type
  vtkXMLPHierarchicalBoxDataWriterSuperclass* = vtkXMLPUniformGridAMRWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPHierarchicalBoxDataWriter::IsTypeOf(@)",
    header: "vtkXMLPHierarchicalBoxDataWriter.h".}
proc IsA*(this: var vtkXMLPHierarchicalBoxDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPHierarchicalBoxDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPHierarchicalBoxDataWriter {.
    importcpp: "vtkXMLPHierarchicalBoxDataWriter::SafeDownCast(@)",
    header: "vtkXMLPHierarchicalBoxDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPHierarchicalBoxDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPUniformGridAMRWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPHierarchicalBoxDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPHierarchicalBoxDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPHierarchicalBoxDataWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPHierarchicalBoxDataWriter.h".}