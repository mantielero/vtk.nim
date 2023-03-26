## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataSetWriter.h
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
##  @class   vtkDataSetWriter
##  @brief   write any type of vtk dataset to file
##
##  vtkDataSetWriter is an abstract class for mapper objects that write their
##  data to disk (or into a communications port). The input to this object is
##  a dataset of any type.
##

import
  vtkDataWriter, vtkIOLegacyModule

type
  vtkDataSetWriter* {.importcpp: "vtkDataSetWriter", header: "vtkDataSetWriter.h",
                     bycopy.} = object of vtkDataWriter
    vtkDataSetWriter* {.importc: "vtkDataSetWriter".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDataSetWriter {.importcpp: "vtkDataSetWriter::New(@)",
                                header: "vtkDataSetWriter.h".}
type
  vtkDataSetWriterSuperclass* = vtkDataWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDataSetWriter::IsTypeOf(@)", header: "vtkDataSetWriter.h".}
proc IsA*(this: var vtkDataSetWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkDataSetWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDataSetWriter {.
    importcpp: "vtkDataSetWriter::SafeDownCast(@)", header: "vtkDataSetWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDataSetWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDataSetWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDataSetWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDataSetWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDataSetWriter.h".}
proc GetInput*(this: var vtkDataSetWriter): ptr vtkDataSet {.importcpp: "GetInput",
    header: "vtkDataSetWriter.h".}
proc GetInput*(this: var vtkDataSetWriter; port: cint): ptr vtkDataSet {.
    importcpp: "GetInput", header: "vtkDataSetWriter.h".}