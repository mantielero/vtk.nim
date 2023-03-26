## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPartitionedDataSetCollectionWriter.h
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
##  @class vtkXMLPartitionedDataSetCollectionWriter
##  @brief writer for vtkPartitionedDataSetCollection.
##
##  vtkXMLPartitionedDataSetCollectionWriter is a writer for vtkPartitionedDataSetCollection.
##  This writer supports distributed use-cases as well. Use `SetController` to set the
##  controller to use in case of distributed execution. In that case, the meta-file is written
##  only on the root node.
##

import
  vtkIOParallelXMLModule, vtkXMLWriter2

discard "forward decl of vtkPartitionedDataSetCollection"
type
  vtkXMLPartitionedDataSetCollectionWriter* {.
      importcpp: "vtkXMLPartitionedDataSetCollectionWriter",
      header: "vtkXMLPartitionedDataSetCollectionWriter.h", bycopy.} = object of vtkXMLWriter2
    vtkXMLPartitionedDataSetCollectionWriter*
        {.importc: "vtkXMLPartitionedDataSetCollectionWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPartitionedDataSetCollectionWriter {.
    importcpp: "vtkXMLPartitionedDataSetCollectionWriter::New(@)",
    header: "vtkXMLPartitionedDataSetCollectionWriter.h".}
type
  vtkXMLPartitionedDataSetCollectionWriterSuperclass* = vtkXMLWriter2

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPartitionedDataSetCollectionWriter::IsTypeOf(@)",
    header: "vtkXMLPartitionedDataSetCollectionWriter.h".}
proc IsA*(this: var vtkXMLPartitionedDataSetCollectionWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPartitionedDataSetCollectionWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPartitionedDataSetCollectionWriter {.
    importcpp: "vtkXMLPartitionedDataSetCollectionWriter::SafeDownCast(@)",
    header: "vtkXMLPartitionedDataSetCollectionWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPartitionedDataSetCollectionWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriter2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPartitionedDataSetCollectionWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPartitionedDataSetCollectionWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPartitionedDataSetCollectionWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkXMLPartitionedDataSetCollectionWriter.h".}
proc SetInputData*(this: var vtkXMLPartitionedDataSetCollectionWriter;
                  pd: ptr vtkPartitionedDataSetCollection) {.
    importcpp: "SetInputData",
    header: "vtkXMLPartitionedDataSetCollectionWriter.h".}
proc GetDefaultFileExtension*(this: var vtkXMLPartitionedDataSetCollectionWriter): cstring {.
    importcpp: "GetDefaultFileExtension",
    header: "vtkXMLPartitionedDataSetCollectionWriter.h".}