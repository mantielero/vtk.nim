## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPartitionedDataSetWriter.h
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
##  @class vtkXMLPartitionedDataSetWriter
##  @brief XML writer for vtkPartitionedDataSet
##
##  vtkXMLPartitionedDataSetWriter is a writer for vtkPartitionedDataSet.
##  vtkXMLPartitionedDataSetWriter supports distributed use-cases. Use
##  `SetController` to set the controller to use in case of distributed
##  execution. In that case, the meta-file is only written out on the root node.
##

import
  vtkIOParallelXMLModule, vtkXMLWriter2

discard "forward decl of vtkPartitionedDataSet"
type
  vtkXMLPartitionedDataSetWriter* {.importcpp: "vtkXMLPartitionedDataSetWriter",
                                   header: "vtkXMLPartitionedDataSetWriter.h",
                                   bycopy.} = object of vtkXMLWriter2
    vtkXMLPartitionedDataSetWriter* {.importc: "vtkXMLPartitionedDataSetWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPartitionedDataSetWriter {.
    importcpp: "vtkXMLPartitionedDataSetWriter::New(@)",
    header: "vtkXMLPartitionedDataSetWriter.h".}
type
  vtkXMLPartitionedDataSetWriterSuperclass* = vtkXMLWriter2

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPartitionedDataSetWriter::IsTypeOf(@)",
    header: "vtkXMLPartitionedDataSetWriter.h".}
proc IsA*(this: var vtkXMLPartitionedDataSetWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPartitionedDataSetWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPartitionedDataSetWriter {.
    importcpp: "vtkXMLPartitionedDataSetWriter::SafeDownCast(@)",
    header: "vtkXMLPartitionedDataSetWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPartitionedDataSetWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPartitionedDataSetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPartitionedDataSetWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPartitionedDataSetWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPartitionedDataSetWriter.h".}
proc SetInputData*(this: var vtkXMLPartitionedDataSetWriter;
                  pd: ptr vtkPartitionedDataSet) {.importcpp: "SetInputData",
    header: "vtkXMLPartitionedDataSetWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLPartitionedDataSetWriter): cstring {.
    importcpp: "GetDefaultFileExtension",
    header: "vtkXMLPartitionedDataSetWriter.h".}