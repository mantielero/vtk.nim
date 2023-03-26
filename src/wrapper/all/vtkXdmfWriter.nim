## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXdmfWriter.h
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
##  @class   vtkXdmfWriter
##  @brief   write eXtensible Data Model and Format files
##
##  vtkXdmfWriter converts vtkDataObjects to XDMF format. This is intended to
##  replace vtkXdmfWriter, which is not up to date with the capabilities of the
##  newer XDMF2 library. This writer understands VTK's composite data types and
##  produces full trees in the output XDMF files.
##

import
  vtkIOXdmf2Module, vtkDataObjectAlgorithm

discard "forward decl of vtkExecutive"
discard "forward decl of vtkCompositeDataSet"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkXdmfWriterDomainMemoryHandler"
discard "forward decl of XdmfArray"
discard "forward decl of XdmfDOM"
discard "forward decl of XdmfElement"
discard "forward decl of XdmfGrid"
discard "forward decl of XdmfGeometry"
discard "forward decl of XdmfTopology"
type
  vtkXdmfWriter* {.importcpp: "vtkXdmfWriter", header: "vtkXdmfWriter.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkXdmfWriter* {.importc: "vtkXdmfWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkXdmfWriter {.importcpp: "vtkXdmfWriter::New(@)",
                             header: "vtkXdmfWriter.h".}
type
  vtkXdmfWriterSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXdmfWriter::IsTypeOf(@)", header: "vtkXdmfWriter.h".}
proc IsA*(this: var vtkXdmfWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXdmfWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXdmfWriter {.
    importcpp: "vtkXdmfWriter::SafeDownCast(@)", header: "vtkXdmfWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXdmfWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXdmfWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXdmfWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXdmfWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXdmfWriter.h".}
proc SetInputData*(this: var vtkXdmfWriter; dobj: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkXdmfWriter.h".}
## !!!Ignored construct:  /@{ *
##  Set or get the file name of the xdmf file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set or get the file name of the hdf5 file.
##  Note that if the File name is not specified, then the group name is ignore
##  virtual void SetFileNameFileNameHeavyDataFileNameHeavyDataFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << HeavyDataFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> HeavyDataFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> HeavyDataFileName && _arg && ( ! strcmp ( this -> HeavyDataFileName , _arg ) ) ) { return ; } delete [ ] this -> HeavyDataFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> HeavyDataFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> HeavyDataFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameHeavyDataFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HeavyDataFileName  of  << ( this -> HeavyDataFileName ? this -> HeavyDataFileName : (null) ) ) ; return this -> HeavyDataFileName ; } ;
## Error: expected ';'!!!

proc SetHeavyDataGroupName*(this: var vtkXdmfWriter; _arg: cstring) {.
    importcpp: "SetHeavyDataGroupName", header: "vtkXdmfWriter.h".}
proc GetHeavyDataGroupName*(this: var vtkXdmfWriter): cstring {.
    importcpp: "GetHeavyDataGroupName", header: "vtkXdmfWriter.h".}
  ## /@}
  ## *
  ##  Write data to output. Method executes subclasses WriteData() method, as
  ##  well as StartMethod() and EndMethod() methods.
  ##  Returns 1 on success and 0 on failure.
  ##
proc Write*(this: var vtkXdmfWriter): cint {.importcpp: "Write",
                                        header: "vtkXdmfWriter.h".}
proc SetLightDataLimit*(this: var vtkXdmfWriter; _arg: cint) {.
    importcpp: "SetLightDataLimit", header: "vtkXdmfWriter.h".}
## !!!Ignored construct:  virtual int GetLightDataLimit ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LightDataLimit  of  << this -> LightDataLimit ) ; return this -> LightDataLimit ; } ;
## Error: expected ';'!!!

proc SetLightDataLimitWriteAllTimeSteps*(this: var vtkXdmfWriter; _arg: cint) {.
    importcpp: "SetLightDataLimitWriteAllTimeSteps", header: "vtkXdmfWriter.h".}
## !!!Ignored construct:  virtual int GetLightDataLimitWriteAllTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteAllTimeSteps  of  << this -> WriteAllTimeSteps ) ; return this -> WriteAllTimeSteps ; } ;
## Error: expected ';'!!!

proc WriteAllTimeStepsOn*(this: var vtkXdmfWriter) {.
    importcpp: "WriteAllTimeStepsOn", header: "vtkXdmfWriter.h".}
proc WriteAllTimeStepsOff*(this: var vtkXdmfWriter) {.
    importcpp: "WriteAllTimeStepsOff", header: "vtkXdmfWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set of get the flag that specify if input mesh is static over time.
  ##  If so, the mesh topology and geometry heavy data will be written only once.
  ##  Default if FALSE.
  ##  Note: this mode requires that all data is dumped in the heavy data file.
  ##
proc SetLightDataLimitWriteAllTimeStepsMeshStaticOverTime*(
    this: var vtkXdmfWriter; _arg: bool) {.importcpp: "SetLightDataLimitWriteAllTimeStepsMeshStaticOverTime",
                                      header: "vtkXdmfWriter.h".}
## !!!Ignored construct:  virtual bool GetLightDataLimitWriteAllTimeStepsMeshStaticOverTime ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MeshStaticOverTime  of  << this -> MeshStaticOverTime ) ; return this -> MeshStaticOverTime ; } ;
## Error: expected ';'!!!

proc MeshStaticOverTimeOn*(this: var vtkXdmfWriter) {.
    importcpp: "MeshStaticOverTimeOn", header: "vtkXdmfWriter.h".}
proc MeshStaticOverTimeOff*(this: var vtkXdmfWriter) {.
    importcpp: "MeshStaticOverTimeOff", header: "vtkXdmfWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  Called in parallel runs to identify the portion this process is responsible for
  ##  TODO: respect this
  ##
proc SetLightDataLimitWriteAllTimeStepsMeshStaticOverTimePiece*(
    this: var vtkXdmfWriter; _arg: cint) {.importcpp: "SetLightDataLimitWriteAllTimeStepsMeshStaticOverTimePiece",
                                      header: "vtkXdmfWriter.h".}
proc SetLightDataLimitWriteAllTimeStepsMeshStaticOverTimePieceNumberOfPieces*(
    this: var vtkXdmfWriter; _arg: cint) {.importcpp: "SetLightDataLimitWriteAllTimeStepsMeshStaticOverTimePieceNumberOfPieces",
                                      header: "vtkXdmfWriter.h".}
  ## /@}
  ##  TODO: control choice of heavy data format (xml, hdf5, sql, raw)
  ##  TODO: These controls are available in vtkXdmfWriter, but are not used here.
  ##  GridsOnly
  ##  Append to Domain