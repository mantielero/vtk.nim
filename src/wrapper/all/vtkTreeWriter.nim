## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTreeWriter.h
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
##  @class   vtkTreeWriter
##  @brief   write vtkTree data to a file
##
##  vtkTreeWriter is a sink object that writes ASCII or binary
##  vtkTree data files in vtk format. See text for format details.
##  @warning
##  Binary files written on one system may not be readable on other systems.
##

import
  vtkDataWriter, vtkIOLegacyModule

discard "forward decl of vtkTree"
type
  vtkTreeWriter* {.importcpp: "vtkTreeWriter", header: "vtkTreeWriter.h", bycopy.} = object of vtkDataWriter
    vtkTreeWriter* {.importc: "vtkTreeWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTreeWriter {.importcpp: "vtkTreeWriter::New(@)",
                             header: "vtkTreeWriter.h".}
type
  vtkTreeWriterSuperclass* = vtkDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTreeWriter::IsTypeOf(@)", header: "vtkTreeWriter.h".}
proc IsA*(this: var vtkTreeWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkTreeWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTreeWriter {.
    importcpp: "vtkTreeWriter::SafeDownCast(@)", header: "vtkTreeWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTreeWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTreeWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTreeWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTreeWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTreeWriter.h".}
proc GetInput*(this: var vtkTreeWriter): ptr vtkTree {.importcpp: "GetInput",
    header: "vtkTreeWriter.h".}
proc GetInput*(this: var vtkTreeWriter; port: cint): ptr vtkTree {.
    importcpp: "GetInput", header: "vtkTreeWriter.h".}