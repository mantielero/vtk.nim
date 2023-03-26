## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGDALRasterConverter.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##    This software is distributed WITHOUT ANY WARRANTY; without even
##    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##    PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class vtkGDALRasterConverter
##  @brief Convert between VTK image representation and GDAL datasets
##
##  vtkGDALRasterConverter is an internal implementation class used to convert
##  between VTK and GDAL data formats.
##
##  @sa vtkRasterReprojectionFilter
##

import
  vtkGeovisGDALModule, vtkObject

##  Forward declarations

discard "forward decl of GDALDataset"
discard "forward decl of vtkImageData"
discard "forward decl of vtkUniformGrid"
type
  vtkGDALRasterConverter* {.importcpp: "vtkGDALRasterConverter",
                           header: "vtkGDALRasterConverter.h", bycopy.} = object of vtkObject
    vtkGDALRasterConverter* {.importc: "vtkGDALRasterConverter".}: VTK_NEWINSTANCE
    ## *
    ##  Copies vtkImageData contents to GDALDataset
    ##  GDALDataset must be initialized to same dimensions as vtk image.
    ##


proc New*(): ptr vtkGDALRasterConverter {.importcpp: "vtkGDALRasterConverter::New(@)",
                                      header: "vtkGDALRasterConverter.h".}
type
  vtkGDALRasterConverterSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGDALRasterConverter::IsTypeOf(@)",
    header: "vtkGDALRasterConverter.h".}
proc IsA*(this: var vtkGDALRasterConverter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGDALRasterConverter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGDALRasterConverter {.
    importcpp: "vtkGDALRasterConverter::SafeDownCast(@)",
    header: "vtkGDALRasterConverter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGDALRasterConverter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGDALRasterConverter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGDALRasterConverter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGDALRasterConverter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGDALRasterConverter.h".}
proc SetNoDataValue*(this: var vtkGDALRasterConverter; _arg: cdouble) {.
    importcpp: "SetNoDataValue", header: "vtkGDALRasterConverter.h".}
## !!!Ignored construct:  virtual double GetNoDataValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NoDataValue  of  << this -> NoDataValue ) ; return this -> NoDataValue ; } ;
## Error: expected ';'!!!

proc CreateGDALDataset*(this: var vtkGDALRasterConverter; xDim: cint; yDim: cint;
                       vtkDataType: cint; numberOfBands: cint): ptr GDALDataset {.
    importcpp: "CreateGDALDataset", header: "vtkGDALRasterConverter.h".}
proc CreateGDALDataset*(this: var vtkGDALRasterConverter; data: ptr vtkImageData;
                       mapProjection: cstring; flipAxis: array[3, cint]): ptr GDALDataset {.
    importcpp: "CreateGDALDataset", header: "vtkGDALRasterConverter.h".}
proc CopyBandInfo*(this: var vtkGDALRasterConverter; src: ptr GDALDataset;
                  dest: ptr GDALDataset) {.importcpp: "CopyBandInfo",
                                        header: "vtkGDALRasterConverter.h".}
proc CreateVTKUniformGrid*(this: var vtkGDALRasterConverter; input: ptr GDALDataset): ptr vtkUniformGrid {.
    importcpp: "CreateVTKUniformGrid", header: "vtkGDALRasterConverter.h".}
proc SetGDALProjection*(this: var vtkGDALRasterConverter; dataset: ptr GDALDataset;
                       projectionString: cstring) {.
    importcpp: "SetGDALProjection", header: "vtkGDALRasterConverter.h".}
proc SetGDALGeoTransform*(this: var vtkGDALRasterConverter;
                         dataset: ptr GDALDataset; origin: array[2, cdouble];
                         spacing: array[2, cdouble]; flipAxis: array[2, cint]) {.
    importcpp: "SetGDALGeoTransform", header: "vtkGDALRasterConverter.h".}
proc CopyNoDataValues*(this: var vtkGDALRasterConverter; src: ptr GDALDataset;
                      dest: ptr GDALDataset) {.importcpp: "CopyNoDataValues",
    header: "vtkGDALRasterConverter.h".}
## !!!Ignored construct:  *
##  Write GDALDataset to tiff file
##  void WriteTifFile ( GDALDataset * dataset , VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

proc FindDataRange*(this: var vtkGDALRasterConverter; dataset: ptr GDALDataset;
                   bandId: cint; minValue: ptr cdouble; maxValue: ptr cdouble): bool {.
    importcpp: "FindDataRange", header: "vtkGDALRasterConverter.h".}