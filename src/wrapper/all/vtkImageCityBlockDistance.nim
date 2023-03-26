## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageCityBlockDistance.h
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
##  @class   vtkImageCityBlockDistance
##  @brief   1,2 or 3D distance map.
##
##  vtkImageCityBlockDistance creates a distance map using the city block
##  (Manhatten) distance measure.  The input is a mask.  Zero values are
##  considered boundaries.  The output pixel is the minimum of the input pixel
##  and the distance to a boundary (or neighbor value + 1 unit).
##  distance values are calculated in pixels.
##  The filter works by taking 6 passes (for 3d distance map): 2 along each
##  axis (forward and backward). Each pass keeps a running minimum distance.
##  For some reason, I preserve the sign if the distance.  If the input
##  mask is initially negative, the output distances will be negative.
##  Distances maps can have inside (negative regions)
##  and outsides (positive regions).
##

import
  vtkImageDecomposeFilter, vtkImagingGeneralModule

type
  vtkImageCityBlockDistance* {.importcpp: "vtkImageCityBlockDistance",
                              header: "vtkImageCityBlockDistance.h", bycopy.} = object of vtkImageDecomposeFilter
    vtkImageCityBlockDistance* {.importc: "vtkImageCityBlockDistance".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageCityBlockDistance {.
    importcpp: "vtkImageCityBlockDistance::New(@)",
    header: "vtkImageCityBlockDistance.h".}
type
  vtkImageCityBlockDistanceSuperclass* = vtkImageDecomposeFilter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageCityBlockDistance::IsTypeOf(@)",
    header: "vtkImageCityBlockDistance.h".}
proc IsA*(this: var vtkImageCityBlockDistance; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageCityBlockDistance.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageCityBlockDistance {.
    importcpp: "vtkImageCityBlockDistance::SafeDownCast(@)",
    header: "vtkImageCityBlockDistance.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageCityBlockDistance :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageDecomposeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageCityBlockDistance :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageCityBlockDistance :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageCityBlockDistance; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageCityBlockDistance.h".}