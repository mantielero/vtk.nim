## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMedian3D.h
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
##  @class   vtkImageMedian3D
##  @brief   Median Filter
##
##  vtkImageMedian3D a Median filter that replaces each pixel with the
##  median value from a rectangular neighborhood around that pixel.
##  Neighborhoods can be no more than 3 dimensional.  Setting one
##  axis of the neighborhood kernelSize to 1 changes the filter
##  into a 2D median.
##

import
  vtkImageSpatialAlgorithm, vtkImagingGeneralModule

type
  vtkImageMedian3D* {.importcpp: "vtkImageMedian3D", header: "vtkImageMedian3D.h",
                     bycopy.} = object of vtkImageSpatialAlgorithm
    vtkImageMedian3D* {.importc: "vtkImageMedian3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageMedian3D {.importcpp: "vtkImageMedian3D::New(@)",
                                header: "vtkImageMedian3D.h".}
type
  vtkImageMedian3DSuperclass* = vtkImageSpatialAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageMedian3D::IsTypeOf(@)", header: "vtkImageMedian3D.h".}
proc IsA*(this: var vtkImageMedian3D; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkImageMedian3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageMedian3D {.
    importcpp: "vtkImageMedian3D::SafeDownCast(@)", header: "vtkImageMedian3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageMedian3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMedian3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMedian3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageMedian3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageMedian3D.h".}
proc SetKernelSize*(this: var vtkImageMedian3D; size0: cint; size1: cint; size2: cint) {.
    importcpp: "SetKernelSize", header: "vtkImageMedian3D.h".}
## !!!Ignored construct:  /@{ *
##  Return the number of elements in the median mask
##  virtual int GetNumberOfElementsNumberOfElements ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfElements  of  << this -> NumberOfElements ) ; return this -> NumberOfElements ; } ;
## Error: expected ';'!!!
