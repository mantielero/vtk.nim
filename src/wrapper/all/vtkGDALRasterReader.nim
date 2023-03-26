## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGDALRasterReader.h
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
##  @class   vtkGDALRasterReader
##  @brief   Read raster file formats using GDAL.
##
##  vtkGDALRasterReader is a source object that reads raster files and
##  uses GDAL as the underlying library for the task. GDAL library is
##  required for this reader. The output of the reader is a
##  vtkUniformGrid (vtkImageData with blanking) with cell data.
##  The reader currently supports only north up images. Flips along
##  X or Y direction are also supported. Arbitrary affine geotransforms or
##  GCPs are not supported. See GDAL Data Model for more information
##  https://www.gdal.org/gdal_datamodel.html
##
##
##
##  @sa
##  vtkUniformGrid, vtkImageData
##

##  C++ includes

type
  vtkGDALRasterReader* {.importcpp: "vtkGDALRasterReader",
                        header: "vtkGDALRasterReader.h", bycopy.} = object of vtkImageReader2
    vtkGDALRasterReader* {.importc: "vtkGDALRasterReader".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGDALRasterReader {.importcpp: "vtkGDALRasterReader::New(@)",
                                   header: "vtkGDALRasterReader.h".}
type
  vtkGDALRasterReaderSuperclass* = vtkImageReader2

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGDALRasterReader::IsTypeOf(@)", header: "vtkGDALRasterReader.h".}
proc IsA*(this: var vtkGDALRasterReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGDALRasterReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGDALRasterReader {.
    importcpp: "vtkGDALRasterReader::SafeDownCast(@)",
    header: "vtkGDALRasterReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGDALRasterReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReader2 :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGDALRasterReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGDALRasterReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGDALRasterReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGDALRasterReader.h".}
proc constructvtkGDALRasterReader*(): vtkGDALRasterReader {.constructor,
    importcpp: "vtkGDALRasterReader(@)", header: "vtkGDALRasterReader.h".}
proc destroyvtkGDALRasterReader*(this: var vtkGDALRasterReader) {.
    importcpp: "#.~vtkGDALRasterReader()", header: "vtkGDALRasterReader.h".}
## !!!Ignored construct:  *
##  Is this file supported
##  int CanReadFile ( VTK_FILEPATH const char * fname ) override ;
## Error: token expected: ) but got: *!!!

proc GetProjectionString*(this: vtkGDALRasterReader): cstring {.noSideEffect,
    importcpp: "GetProjectionString", header: "vtkGDALRasterReader.h".}
proc GetProjectionWKT*(this: vtkGDALRasterReader): cstring {.noSideEffect,
    importcpp: "GetProjectionWKT", header: "vtkGDALRasterReader.h".}
proc GetGeoCornerPoints*(this: var vtkGDALRasterReader): ptr cdouble {.
    importcpp: "GetGeoCornerPoints", header: "vtkGDALRasterReader.h".}
proc SetCollateBands*(this: var vtkGDALRasterReader; _arg: bool) {.
    importcpp: "SetCollateBands", header: "vtkGDALRasterReader.h".}
## !!!Ignored construct:  virtual bool GetCollateBands ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CollateBands  of  << this -> CollateBands ) ; return this -> CollateBands ; } ;
## Error: expected ';'!!!

proc CollateBandsOn*(this: var vtkGDALRasterReader) {.importcpp: "CollateBandsOn",
    header: "vtkGDALRasterReader.h".}
proc CollateBandsOff*(this: var vtkGDALRasterReader) {.importcpp: "CollateBandsOff",
    header: "vtkGDALRasterReader.h".}
  ## /@{
  ## *
  ##  Set desired width and height of the image
  ##
proc SetTargetDimensions*(this: var vtkGDALRasterReader; _arg1: cint; _arg2: cint) {.
    importcpp: "SetTargetDimensions", header: "vtkGDALRasterReader.h".}
proc SetTargetDimensions*(this: var vtkGDALRasterReader; _arg: array[2, cint]) {.
    importcpp: "SetTargetDimensions", header: "vtkGDALRasterReader.h".}
## !!!Ignored construct:  virtual int * GetTargetDimensions ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << TargetDimensions  pointer  << this -> TargetDimensions ) ; return this -> TargetDimensions ; } VTK_WRAPEXCLUDE virtual void GetTargetDimensions ( int & _arg1 , int & _arg2 ) { _arg1 = this -> TargetDimensions [ 0 ] ; _arg2 = this -> TargetDimensions [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << TargetDimensions  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetTargetDimensions ( int _arg [ 2 ] ) { this -> GetTargetDimensions ( _arg [ 0 ] , _arg [ 1 ] ) ; } ;
## Error: expected ';'!!!

proc GetRasterDimensions*(this: var vtkGDALRasterReader): ptr cint {.
    importcpp: "GetRasterDimensions", header: "vtkGDALRasterReader.h".}
proc GetMetaData*(this: var vtkGDALRasterReader): vector[string] {.
    importcpp: "GetMetaData", header: "vtkGDALRasterReader.h".}
proc GetInvalidValue*(this: var vtkGDALRasterReader; bandIndex: csize_t = 0;
                     hasNoData: ptr cint = nil): cdouble {.
    importcpp: "GetInvalidValue", header: "vtkGDALRasterReader.h".}
proc GetDomainMetaData*(this: var vtkGDALRasterReader; domain: string): vector[string] {.
    importcpp: "GetDomainMetaData", header: "vtkGDALRasterReader.h".}
proc GetDriverShortName*(this: var vtkGDALRasterReader): string {.
    importcpp: "GetDriverShortName", header: "vtkGDALRasterReader.h".}
proc GetDriverLongName*(this: var vtkGDALRasterReader): string {.
    importcpp: "GetDriverLongName", header: "vtkGDALRasterReader.h".}
proc GetNumberOfCells*(this: var vtkGDALRasterReader): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkGDALRasterReader.h".}
proc GetNumberOfCellArrays*(this: var vtkGDALRasterReader): cint {.
    importcpp: "GetNumberOfCellArrays", header: "vtkGDALRasterReader.h".}
proc GetCellArrayName*(this: var vtkGDALRasterReader; index: cint): cstring {.
    importcpp: "GetCellArrayName", header: "vtkGDALRasterReader.h".}
proc GetCellArrayStatus*(this: var vtkGDALRasterReader; name: cstring): cint {.
    importcpp: "GetCellArrayStatus", header: "vtkGDALRasterReader.h".}
proc SetCellArrayStatus*(this: var vtkGDALRasterReader; name: cstring; status: cint) {.
    importcpp: "SetCellArrayStatus", header: "vtkGDALRasterReader.h".}
proc DisableAllCellArrays*(this: var vtkGDALRasterReader) {.
    importcpp: "DisableAllCellArrays", header: "vtkGDALRasterReader.h".}
proc EnableAllCellArrays*(this: var vtkGDALRasterReader) {.
    importcpp: "EnableAllCellArrays", header: "vtkGDALRasterReader.h".}