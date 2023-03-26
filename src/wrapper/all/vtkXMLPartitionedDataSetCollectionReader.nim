## =========================================================================
##
##   Program:   ParaView
##   Module:    vtkXMLPartitionedDataSetCollectionReader.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkXMLPartitionedDataSetCollectionReader
##  @brief   Reader for partitioned dataset collections
##
##  vtkXMLPartitionedDataSetCollectionReader reads the VTK XML partitioned
##  dataset collection file format. These are meta-files that point to a list
##  of serial VTK XML files. When reading in parallel, it will distribute
##  sub-blocks among processor. If the number of sub-blocks is less than
##  the number of processors, some processors will not have any sub-blocks
##  for that block. If the number of sub-blocks is larger than the
##  number of processors, each processor will possibly have more than
##  1 sub-block.
##

import
  vtkIOXMLModule, vtkXMLCompositeDataReader

discard "forward decl of vtkMultiBlockDataSet"
type
  vtkXMLPartitionedDataSetCollectionReader* {.
      importcpp: "vtkXMLPartitionedDataSetCollectionReader",
      header: "vtkXMLPartitionedDataSetCollectionReader.h", bycopy.} = object of vtkXMLCompositeDataReader
    vtkXMLPartitionedDataSetCollectionReader*
        {.importc: "vtkXMLPartitionedDataSetCollectionReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPartitionedDataSetCollectionReader {.
    importcpp: "vtkXMLPartitionedDataSetCollectionReader::New(@)",
    header: "vtkXMLPartitionedDataSetCollectionReader.h".}
type
  vtkXMLPartitionedDataSetCollectionReaderSuperclass* = vtkXMLCompositeDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPartitionedDataSetCollectionReader::IsTypeOf(@)",
    header: "vtkXMLPartitionedDataSetCollectionReader.h".}
proc IsA*(this: var vtkXMLPartitionedDataSetCollectionReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPartitionedDataSetCollectionReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPartitionedDataSetCollectionReader {.
    importcpp: "vtkXMLPartitionedDataSetCollectionReader::SafeDownCast(@)",
    header: "vtkXMLPartitionedDataSetCollectionReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPartitionedDataSetCollectionReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLCompositeDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPartitionedDataSetCollectionReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPartitionedDataSetCollectionReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPartitionedDataSetCollectionReader; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkXMLPartitionedDataSetCollectionReader.h".}