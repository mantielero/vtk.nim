## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGDALRasterReprojection.h
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
##  @class   vtkGDALRasterReprojection
##
##

##  VTK Includes

import
  vtkGeovisGDALModule, vtkObject

discard "forward decl of GDALDataset"
type
  vtkGDALRasterReprojection* {.importcpp: "vtkGDALRasterReprojection",
                              header: "vtkGDALRasterReprojection.h", bycopy.} = object of vtkObject
    vtkGDALRasterReprojection* {.importc: "vtkGDALRasterReprojection".}: VTK_NEWINSTANCE


proc New*(): ptr vtkGDALRasterReprojection {.
    importcpp: "vtkGDALRasterReprojection::New(@)",
    header: "vtkGDALRasterReprojection.h".}
type
  vtkGDALRasterReprojectionSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGDALRasterReprojection::IsTypeOf(@)",
    header: "vtkGDALRasterReprojection.h".}
proc IsA*(this: var vtkGDALRasterReprojection; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGDALRasterReprojection.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGDALRasterReprojection {.
    importcpp: "vtkGDALRasterReprojection::SafeDownCast(@)",
    header: "vtkGDALRasterReprojection.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGDALRasterReprojection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGDALRasterReprojection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGDALRasterReprojection :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGDALRasterReprojection; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGDALRasterReprojection.h".}
proc SetMaxError*(this: var vtkGDALRasterReprojection; _arg: cdouble) {.
    importcpp: "SetMaxError", header: "vtkGDALRasterReprojection.h".}
proc GetMaxErrorMinValue*(this: var vtkGDALRasterReprojection): cdouble {.
    importcpp: "GetMaxErrorMinValue", header: "vtkGDALRasterReprojection.h".}
proc GetMaxErrorMaxValue*(this: var vtkGDALRasterReprojection): cdouble {.
    importcpp: "GetMaxErrorMaxValue", header: "vtkGDALRasterReprojection.h".}
  ## /@}
  ## /@{
  ## *
  ##  Pixel resampling algorithm, between 0 and 6
  ##  0 = Nearest Neighbor (default)
  ##  1 = Bilinear
  ##  2 = Cubic
  ##  3 = CubicSpline
  ##  4 = Lanczos
  ##  5 = Average (GDAL 1.10)
  ##  6 = Mode    (GDAL 1.10)
  ##
proc SetMaxErrorResamplingAlgorithm*(this: var vtkGDALRasterReprojection; _arg: cint) {.
    importcpp: "SetMaxErrorResamplingAlgorithm",
    header: "vtkGDALRasterReprojection.h".}
proc GetMaxErrorMinValueResamplingAlgorithmMinValue*(
    this: var vtkGDALRasterReprojection): cint {.
    importcpp: "GetMaxErrorMinValueResamplingAlgorithmMinValue",
    header: "vtkGDALRasterReprojection.h".}
proc GetMaxErrorMaxValueResamplingAlgorithmMaxValue*(
    this: var vtkGDALRasterReprojection): cint {.
    importcpp: "GetMaxErrorMaxValueResamplingAlgorithmMaxValue",
    header: "vtkGDALRasterReprojection.h".}
  ## /@}
  ## *
  ##  Suggest image dimensions for specified projection
  ##  Internally calls GDALSuggestedWarpOutput()
  ##  The outputProjection parameter can be either the full "well known text"
  ##  definition, or shorter commonly-used names such as "EPSG:4326" or
  ##  "WGS84".
  ##  Returns boolean indicating if computed dimensions are valid.
  ##
proc SuggestOutputDimensions*(this: var vtkGDALRasterReprojection;
                             inputDataset: ptr GDALDataset;
                             outputProjection: cstring;
                             geoTransform: array[6, cdouble]; nPixels: ptr cint;
                             nLines: ptr cint; maxError: cdouble = 0.0): bool {.
    importcpp: "SuggestOutputDimensions", header: "vtkGDALRasterReprojection.h".}
proc Reproject*(this: var vtkGDALRasterReprojection; input: ptr GDALDataset;
               output: ptr GDALDataset): bool {.importcpp: "Reproject",
    header: "vtkGDALRasterReprojection.h".}