## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPhyloXMLTreeReader.h
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
##  @class   vtkPhyloXMLTreeReader
##  @brief   read vtkTree from PhyloXML formatted file
##
##  vtkPhyloXMLTreeReader is a source object that reads PhyloXML tree format
##  files.
##  The output of this reader is a single vtkTree data object.
##
##
##  @warning
##  This reader does not implement the entire PhyloXML specification.
##  It currently only supports the following tags:
##  phylogeny, name, description, confidence, property, clade, branch_length,
##  color, red, green, and blue.
##  This reader also only supports a single phylogeny per file.
##
##  @sa
##  vtkTree vtkXMLReader vtkPhyloXMLTreeWriter
##

import
  vtkIOInfovisModule, vtkSmartPointer, vtkXMLReader

discard "forward decl of vtkBitArray"
discard "forward decl of vtkMutableDirectedGraph"
discard "forward decl of vtkTree"
discard "forward decl of vtkXMLDataElement"
type
  vtkPhyloXMLTreeReader* {.importcpp: "vtkPhyloXMLTreeReader",
                          header: "vtkPhyloXMLTreeReader.h", bycopy.} = object of vtkXMLReader
    vtkPhyloXMLTreeReader* {.importc: "vtkPhyloXMLTreeReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPhyloXMLTreeReader {.importcpp: "vtkPhyloXMLTreeReader::New(@)",
                                     header: "vtkPhyloXMLTreeReader.h".}
type
  vtkPhyloXMLTreeReaderSuperclass* = vtkXMLReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPhyloXMLTreeReader::IsTypeOf(@)",
    header: "vtkPhyloXMLTreeReader.h".}
proc IsA*(this: var vtkPhyloXMLTreeReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPhyloXMLTreeReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPhyloXMLTreeReader {.
    importcpp: "vtkPhyloXMLTreeReader::SafeDownCast(@)",
    header: "vtkPhyloXMLTreeReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPhyloXMLTreeReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPhyloXMLTreeReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPhyloXMLTreeReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPhyloXMLTreeReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPhyloXMLTreeReader.h".}
proc GetOutput*(this: var vtkPhyloXMLTreeReader): ptr vtkTree {.
    importcpp: "GetOutput", header: "vtkPhyloXMLTreeReader.h".}
proc GetOutput*(this: var vtkPhyloXMLTreeReader; idx: cint): ptr vtkTree {.
    importcpp: "GetOutput", header: "vtkPhyloXMLTreeReader.h".}