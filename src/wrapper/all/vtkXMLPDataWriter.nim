## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLPDataWriter.h
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
##  @class   vtkXMLPDataWriter
##  @brief   Write data in a parallel XML format.
##
##  vtkXMLPDataWriter is the superclass for all XML parallel data set
##  writers.  It provides functionality needed for writing parallel
##  formats, such as the selection of which writer writes the summary
##  file and what range of pieces are assigned to each serial writer.
##

import
  vtkIOParallelXMLModule, vtkXMLPDataObjectWriter

discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkMultiProcessController"
type
  vtkXMLPDataWriter* {.importcpp: "vtkXMLPDataWriter",
                      header: "vtkXMLPDataWriter.h", bycopy.} = object of vtkXMLPDataObjectWriter
    vtkXMLPDataWriter* {.importc: "vtkXMLPDataWriter".}: VTK_NEWINSTANCE

  vtkXMLPDataWriterSuperclass* = vtkXMLPDataObjectWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLPDataWriter::IsTypeOf(@)", header: "vtkXMLPDataWriter.h".}
proc IsA*(this: var vtkXMLPDataWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkXMLPDataWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLPDataWriter {.
    importcpp: "vtkXMLPDataWriter::SafeDownCast(@)", header: "vtkXMLPDataWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLPDataWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLPDataObjectWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLPDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLPDataWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLPDataWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLPDataWriter.h".}