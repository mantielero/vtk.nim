## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPUniformGridAMRWriter.h
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
##  @class   vtkXMLPUniformGridAMRWriter
##  @brief   parallel writer for
##  vtkUniformGridAMR and subclasses.
##
##  vtkXMLPCompositeDataWriter writes (in parallel or serially) vtkUniformGridAMR
##  and subclasses. When running in parallel all processes are expected to have
##  the same meta-data (i.e. amr-boxes, structure, etc.) however they may now
##  have the missing data-blocks. This class extends
##  vtkXMLUniformGridAMRWriter to communicate information about data blocks
##  to the root node so that the root node can write the XML file describing the
##  structure correctly.
##

import
  vtkIOParallelXMLModule, vtkXMLUniformGridAMRWriter

discard "forward decl of vtkMultiProcessController"
type
  vtkXMLPUniformGridAMRWriter* {.importcpp: "vtkXMLPUniformGridAMRWriter",
                                header: "vtkXMLPUniformGridAMRWriter.h", bycopy.} = object of vtkXMLUniformGridAMRWriter
    vtkXMLPUniformGridAMRWriter* {.importc: "vtkXMLPUniformGridAMRWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkXMLPUniformGridAMRWriter {.
    importcpp: "vtkXMLPUniformGridAMRWriter::New(@)",
    header: "vtkXMLPUniformGridAMRWriter.h".}
type
  vtkXMLPUniformGridAMRWriterSuperclass* = vtkXMLUniformGridAMRWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPUniformGridAMRWriter::IsTypeOf(@)",
    header: "vtkXMLPUniformGridAMRWriter.h".}
proc IsA*(this: var vtkXMLPUniformGridAMRWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPUniformGridAMRWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPUniformGridAMRWriter {.
    importcpp: "vtkXMLPUniformGridAMRWriter::SafeDownCast(@)",
    header: "vtkXMLPUniformGridAMRWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPUniformGridAMRWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLUniformGridAMRWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPUniformGridAMRWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPUniformGridAMRWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPUniformGridAMRWriter; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkXMLPUniformGridAMRWriter.h".}
proc SetController*(this: var vtkXMLPUniformGridAMRWriter;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkXMLPUniformGridAMRWriter.h".}
proc GetnameController*(this: var vtkXMLPUniformGridAMRWriter): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkXMLPUniformGridAMRWriter.h".}
  ## /@}
  ## *
  ##  Set whether this instance will write the meta-file. WriteMetaFile
  ##  is set to flag only on process 0 and all other processes have
  ##  WriteMetaFile set to 0 by default.
  ##
proc SetWriteMetaFile*(this: var vtkXMLPUniformGridAMRWriter; flag: cint) {.
    importcpp: "SetWriteMetaFile", header: "vtkXMLPUniformGridAMRWriter.h".}