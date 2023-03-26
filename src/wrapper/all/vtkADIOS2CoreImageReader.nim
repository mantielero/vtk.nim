## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkADIOS2CoreImageReader.h
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
##  @class   vtkADIOS2CoreImageReader
##  @brief   Read ADIOS2 bp files.
##
##  vtkADIOS2CoreImageReader reads ADIOS2 bp data files so that they can be processed
##  or visualized using VTK as vtkImageDatas.
##  When processing data, the assumption is that the all variables share the same number
##  of blocks. If the the data has multiple time steps, the user can specify the name of
##  the time array then reader will use it to calculate the number of time steps.
##  By default we flips the dimensions as vtk data array uses column major order whereas
##  adios2 uses row major order. Check IsColumnMajor flag for more details.
##  This reader can be launched either in serial or parallel.
##  // TODO: Expose attribute info in PV GUI.
##

import
  vtkDataObjectAlgorithm, vtkSetGet, vtkSmartPointer, vtkIOADIOS2Module

discard "forward decl of vtkCellArray"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataObject"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkStringArray"
type
  vtkADIOS2CoreImageReader* {.importcpp: "vtkADIOS2CoreImageReader",
                             header: "vtkADIOS2CoreImageReader.h", bycopy.} = object of vtkDataObjectAlgorithm
    vtkADIOS2CoreImageReader* {.importc: "vtkADIOS2CoreImageReader".}: VTK_NEWINSTANCE

  vtkADIOS2CoreImageReaderVarType* {.size: sizeof(cint), importcpp: "vtkADIOS2CoreImageReader::VarType",
                                    header: "vtkADIOS2CoreImageReader.h".} = enum
    PointData, CellData


type
  Params* = map[string, string]
  StringToParams* = map[string, Params]
  InquireVariablesType* = vector[pair[string, vtkADIOS2CoreImageReaderVarType]]

proc New*(): ptr vtkADIOS2CoreImageReader {.importcpp: "vtkADIOS2CoreImageReader::New(@)",
                                        header: "vtkADIOS2CoreImageReader.h".}
type
  vtkADIOS2CoreImageReaderSuperclass* = vtkDataObjectAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkADIOS2CoreImageReader::IsTypeOf(@)",
    header: "vtkADIOS2CoreImageReader.h".}
proc IsA*(this: var vtkADIOS2CoreImageReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkADIOS2CoreImageReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkADIOS2CoreImageReader {.
    importcpp: "vtkADIOS2CoreImageReader::SafeDownCast(@)",
    header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkADIOS2CoreImageReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObjectAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkADIOS2CoreImageReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkADIOS2CoreImageReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkADIOS2CoreImageReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  *
##  Test whether or not a given file should even be attempted for use with this
##  reader.
##  int CanReadFile ( VTK_FILEPATH const std :: string & name ) ;
## Error: token expected: ) but got: ::!!!

## !!!Ignored construct:  virtual int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

proc SetFileName*(this: var vtkADIOS2CoreImageReader; _arg: string) {.
    importcpp: "SetFileName", header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual std :: string GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << this -> FileName ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} void SetFileName ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

proc SetOrigin*(this: var vtkADIOS2CoreImageReader; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble) {.importcpp: "SetOrigin",
                               header: "vtkADIOS2CoreImageReader.h".}
proc SetOrigin*(this: var vtkADIOS2CoreImageReader; _arg: array[3, cdouble]) {.
    importcpp: "SetOrigin", header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual double * GetOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Origin [ 0 ] ; _arg2 = this -> Origin [ 1 ] ; _arg3 = this -> Origin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Origin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOrigin ( double _arg [ 3 ] ) { this -> GetOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc SetOriginSpacing*(this: var vtkADIOS2CoreImageReader; _arg1: cdouble;
                      _arg2: cdouble; _arg3: cdouble) {.
    importcpp: "SetOriginSpacing", header: "vtkADIOS2CoreImageReader.h".}
proc SetOriginSpacing*(this: var vtkADIOS2CoreImageReader; _arg: array[3, cdouble]) {.
    importcpp: "SetOriginSpacing", header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual double * GetOriginSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  pointer  << this -> Spacing ) ; return this -> Spacing ; } VTK_WRAPEXCLUDE virtual void GetOriginSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Spacing [ 0 ] ; _arg2 = this -> Spacing [ 1 ] ; _arg3 = this -> Spacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOriginSpacing ( double _arg [ 3 ] ) { this -> GetOriginSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!

proc GetAllDimensionArrays*(this: var vtkADIOS2CoreImageReader): ptr vtkStringArray {.
    importcpp: "GetAllDimensionArrays", header: "vtkADIOS2CoreImageReader.h".}
proc SetFileNameDimensionArray*(this: var vtkADIOS2CoreImageReader; _arg: string) {.
    importcpp: "SetFileNameDimensionArray", header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual std :: string GetFileNameDimensionArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DimensionArray  of  << this -> DimensionArray ) ; return this -> DimensionArray ; } ;
## Error: expected ';'!!!

proc SetFileNameDimensionArrayDimensionArrayAsCell*(
    this: var vtkADIOS2CoreImageReader; _arg: bool) {.
    importcpp: "SetFileNameDimensionArrayDimensionArrayAsCell",
    header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual bool GetFileNameDimensionArrayDimensionArrayAsCell ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DimensionArrayAsCell  of  << this -> DimensionArrayAsCell ) ; return this -> DimensionArrayAsCell ; } ;
## Error: expected ';'!!!

proc DimensionArrayAsCellOn*(this: var vtkADIOS2CoreImageReader) {.
    importcpp: "DimensionArrayAsCellOn", header: "vtkADIOS2CoreImageReader.h".}
proc DimensionArrayAsCellOff*(this: var vtkADIOS2CoreImageReader) {.
    importcpp: "DimensionArrayAsCellOff", header: "vtkADIOS2CoreImageReader.h".}
  ## /@}
proc GetAllTimeStepArrays*(this: var vtkADIOS2CoreImageReader): ptr vtkStringArray {.
    importcpp: "GetAllTimeStepArrays", header: "vtkADIOS2CoreImageReader.h".}
proc SetFileNameDimensionArrayDimensionArrayAsCellTimeStepArray*(
    this: var vtkADIOS2CoreImageReader; _arg: string) {.
    importcpp: "SetFileNameDimensionArrayDimensionArrayAsCellTimeStepArray",
    header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual std :: string GetFileNameDimensionArrayDimensionArrayAsCellTimeStepArray ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStepArray  of  << this -> TimeStepArray ) ; return this -> TimeStepArray ; } ;
## Error: expected ';'!!!

proc GetNumberOfArrays*(this: var vtkADIOS2CoreImageReader): cint {.
    importcpp: "GetNumberOfArrays", header: "vtkADIOS2CoreImageReader.h".}
proc GetArrayName*(this: var vtkADIOS2CoreImageReader; index: cint): cstring {.
    importcpp: "GetArrayName", header: "vtkADIOS2CoreImageReader.h".}
proc SetArrayStatus*(this: var vtkADIOS2CoreImageReader; name: cstring; status: cint) {.
    importcpp: "SetArrayStatus", header: "vtkADIOS2CoreImageReader.h".}
proc GetArrayStatus*(this: var vtkADIOS2CoreImageReader; name: cstring): cint {.
    importcpp: "GetArrayStatus", header: "vtkADIOS2CoreImageReader.h".}
proc SetFileNameDimensionArrayDimensionArrayAsCellTimeStepArrayIsColumnMajor*(
    this: var vtkADIOS2CoreImageReader; _arg: bool) {.importcpp: "SetFileNameDimensionArrayDimensionArrayAsCellTimeStepArrayIsColumnMajor",
    header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:  virtual bool GetFileNameDimensionArrayDimensionArrayAsCellTimeStepArrayIsColumnMajor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IsColumnMajor  of  << this -> IsColumnMajor ) ; return this -> IsColumnMajor ; } ;
## Error: expected ';'!!!

proc IsColumnMajorOn*(this: var vtkADIOS2CoreImageReader) {.
    importcpp: "IsColumnMajorOn", header: "vtkADIOS2CoreImageReader.h".}
proc IsColumnMajorOff*(this: var vtkADIOS2CoreImageReader) {.
    importcpp: "IsColumnMajorOff", header: "vtkADIOS2CoreImageReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Get/Set the active scalar on each image block
  ##
proc SetActiveScalar*(this: var vtkADIOS2CoreImageReader;
                     inqVars: pair[string, vtkADIOS2CoreImageReaderVarType]) {.
    importcpp: "SetActiveScalar", header: "vtkADIOS2CoreImageReader.h".}
proc GetActiveScalar*(this: var vtkADIOS2CoreImageReader): var pair[string,
    vtkADIOS2CoreImageReaderVarType] {.importcpp: "GetActiveScalar",
                                      header: "vtkADIOS2CoreImageReader.h".}
proc GetActiveScalar*(this: vtkADIOS2CoreImageReader): pair[string,
    vtkADIOS2CoreImageReaderVarType] {.noSideEffect, importcpp: "GetActiveScalar",
                                      header: "vtkADIOS2CoreImageReader.h".}
proc GetAvilableVariables*(this: var vtkADIOS2CoreImageReader): var StringToParams {.
    importcpp: "GetAvilableVariables", header: "vtkADIOS2CoreImageReader.h".}
proc GetAvilableVariables*(this: vtkADIOS2CoreImageReader): StringToParams {.
    noSideEffect, importcpp: "GetAvilableVariables",
    header: "vtkADIOS2CoreImageReader.h".}
proc GetAvailableAttributes*(this: var vtkADIOS2CoreImageReader): var StringToParams {.
    importcpp: "GetAvailableAttributes", header: "vtkADIOS2CoreImageReader.h".}
proc GetAvailableAttributes*(this: vtkADIOS2CoreImageReader): StringToParams {.
    noSideEffect, importcpp: "GetAvailableAttributes",
    header: "vtkADIOS2CoreImageReader.h".}
proc SetController*(this: var vtkADIOS2CoreImageReader;
                   a2: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkADIOS2CoreImageReader.h".}
proc ProcessRequest*(this: var vtkADIOS2CoreImageReader; a2: ptr vtkInformation;
                    a3: ptr ptr vtkInformationVector; a4: ptr vtkInformationVector): cint {.
    importcpp: "ProcessRequest", header: "vtkADIOS2CoreImageReader.h".}
## !!!Ignored construct:   Helper function for ReadImageBlocks to populate vtk data array from adios variable template < typename T , template < typename ... > class U > [end of template] vtkSmartPointer < vtkAbstractArray > PopulateDataArrayFromVar ( const std :: string & varName , size_t blockIndex ) ;
## Error: token expected: > [end of template] but got: [identifier]!!!
