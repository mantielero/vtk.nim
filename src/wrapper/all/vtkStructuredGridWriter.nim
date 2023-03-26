## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredGridWriter.h
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
##  @class   vtkStructuredGridWriter
##  @brief   write vtk structured grid data file
##
##  vtkStructuredGridWriter is a source object that writes ASCII or binary
##  structured grid data files in vtk format. See text for format details.
##
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

import
  vtkDataWriter, vtkIOLegacyModule

discard "forward decl of vtkStructuredGrid"
type
  vtkStructuredGridWriter* {.importcpp: "vtkStructuredGridWriter",
                            header: "vtkStructuredGridWriter.h", bycopy.} = object of vtkDataWriter
    vtkStructuredGridWriter* {.importc: "vtkStructuredGridWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkStructuredGridWriter {.importcpp: "vtkStructuredGridWriter::New(@)",
                                       header: "vtkStructuredGridWriter.h".}
type
  vtkStructuredGridWriterSuperclass* = vtkDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkStructuredGridWriter::IsTypeOf(@)",
    header: "vtkStructuredGridWriter.h".}
proc IsA*(this: var vtkStructuredGridWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkStructuredGridWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkStructuredGridWriter {.
    importcpp: "vtkStructuredGridWriter::SafeDownCast(@)",
    header: "vtkStructuredGridWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkStructuredGridWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredGridWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredGridWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkStructuredGridWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkStructuredGridWriter.h".}
proc GetInput*(this: var vtkStructuredGridWriter): ptr vtkStructuredGrid {.
    importcpp: "GetInput", header: "vtkStructuredGridWriter.h".}
proc GetInput*(this: var vtkStructuredGridWriter; port: cint): ptr vtkStructuredGrid {.
    importcpp: "GetInput", header: "vtkStructuredGridWriter.h".}
proc SetWriteExtent*(this: var vtkStructuredGridWriter; _arg: bool) {.
    importcpp: "SetWriteExtent", header: "vtkStructuredGridWriter.h".}
## !!!Ignored construct:  virtual bool GetWriteExtent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteExtent  of  << this -> WriteExtent ) ; return this -> WriteExtent ; } ;
## Error: expected ';'!!!

proc WriteExtentOn*(this: var vtkStructuredGridWriter) {.importcpp: "WriteExtentOn",
    header: "vtkStructuredGridWriter.h".}
proc WriteExtentOff*(this: var vtkStructuredGridWriter) {.
    importcpp: "WriteExtentOff", header: "vtkStructuredGridWriter.h".}
  ## /@}