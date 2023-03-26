## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkFieldDataSerializer.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkFieldDataSerializer
##
##
##   A concrete instance of vtkObject which provides functionality for
##   serializing and de-serializing field data, primarily used for the purpose
##   of preparing the data for transfer over MPI or other communication
##   mechanism.
##
##  @sa
##  vtkFieldData vtkPointData vtkCellData vtkMultiProcessStream
##

import
  vtkObject, vtkParallelCoreModule

##  Forward declarations

discard "forward decl of vtkIdList"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkStringArray"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkMultiProcessStream"
type
  vtkFieldDataSerializer* {.importcpp: "vtkFieldDataSerializer",
                           header: "vtkFieldDataSerializer.h", bycopy.} = object of vtkObject
    vtkFieldDataSerializer* {.importc: "vtkFieldDataSerializer".}: VTK_NEWINSTANCE


proc New*(): ptr vtkFieldDataSerializer {.importcpp: "vtkFieldDataSerializer::New(@)",
                                      header: "vtkFieldDataSerializer.h".}
type
  vtkFieldDataSerializerSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFieldDataSerializer::IsTypeOf(@)",
    header: "vtkFieldDataSerializer.h".}
proc IsA*(this: var vtkFieldDataSerializer; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFieldDataSerializer.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFieldDataSerializer {.
    importcpp: "vtkFieldDataSerializer::SafeDownCast(@)",
    header: "vtkFieldDataSerializer.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFieldDataSerializer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFieldDataSerializer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFieldDataSerializer :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFieldDataSerializer; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFieldDataSerializer.h".}
proc SerializeMetaData*(fieldData: ptr vtkFieldData;
                       bytestream: var vtkMultiProcessStream) {.
    importcpp: "vtkFieldDataSerializer::SerializeMetaData(@)",
    header: "vtkFieldDataSerializer.h".}
proc DeserializeMetaData*(bytestream: var vtkMultiProcessStream;
                         names: ptr vtkStringArray; datatypes: ptr vtkIntArray;
                         dimensions: ptr vtkIntArray) {.
    importcpp: "vtkFieldDataSerializer::DeserializeMetaData(@)",
    header: "vtkFieldDataSerializer.h".}
proc Serialize*(fieldData: ptr vtkFieldData; bytestream: var vtkMultiProcessStream) {.
    importcpp: "vtkFieldDataSerializer::Serialize(@)",
    header: "vtkFieldDataSerializer.h".}
proc SerializeTuples*(tupleIds: ptr vtkIdList; fieldData: ptr vtkFieldData;
                     bytestream: var vtkMultiProcessStream) {.
    importcpp: "vtkFieldDataSerializer::SerializeTuples(@)",
    header: "vtkFieldDataSerializer.h".}
proc SerializeSubExtent*(subext: array[6, cint]; gridExtent: array[6, cint];
                        fieldData: ptr vtkFieldData;
                        bytestream: var vtkMultiProcessStream) {.
    importcpp: "vtkFieldDataSerializer::SerializeSubExtent(@)",
    header: "vtkFieldDataSerializer.h".}
proc DeSerializeToSubExtent*(subext: array[6, cint]; gridExtent: array[6, cint];
                            fieldData: ptr vtkFieldData;
                            bytestream: var vtkMultiProcessStream) {.
    importcpp: "vtkFieldDataSerializer::DeSerializeToSubExtent(@)",
    header: "vtkFieldDataSerializer.h".}
proc Deserialize*(bytestream: var vtkMultiProcessStream; fieldData: ptr vtkFieldData) {.
    importcpp: "vtkFieldDataSerializer::Deserialize(@)",
    header: "vtkFieldDataSerializer.h".}