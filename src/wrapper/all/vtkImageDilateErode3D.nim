## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageDilateErode3D.h
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
##  @class   vtkImageDilateErode3D
##  @brief   Dilates one value and erodes another.
##
##  vtkImageDilateErode3D will dilate one value and erode another.
##  It uses an elliptical foot print, and only erodes/dilates on the
##  boundary of the two values.  The filter is restricted to the
##  X, Y, and Z axes for now.  It can degenerate to a 2 or 1 dimensional
##  filter by setting the kernel size to 1 for a specific axis.
##

import
  vtkImageSpatialAlgorithm, vtkImagingMorphologicalModule

discard "forward decl of vtkImageEllipsoidSource"
type
  vtkImageDilateErode3D* {.importcpp: "vtkImageDilateErode3D",
                          header: "vtkImageDilateErode3D.h", bycopy.} = object of vtkImageSpatialAlgorithm ## /@{
                                                                                                    ## *
                                                                                                    ##  Construct an instance of vtkImageDilateErode3D filter.
                                                                                                    ##  By default zero values are dilated.
                                                                                                    ##
    vtkImageDilateErode3D* {.importc: "vtkImageDilateErode3D".}: VTK_NEWINSTANCE


proc New*(): ptr vtkImageDilateErode3D {.importcpp: "vtkImageDilateErode3D::New(@)",
                                     header: "vtkImageDilateErode3D.h".}
type
  vtkImageDilateErode3DSuperclass* = vtkImageSpatialAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImageDilateErode3D::IsTypeOf(@)",
    header: "vtkImageDilateErode3D.h".}
proc IsA*(this: var vtkImageDilateErode3D; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImageDilateErode3D.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImageDilateErode3D {.
    importcpp: "vtkImageDilateErode3D::SafeDownCast(@)",
    header: "vtkImageDilateErode3D.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImageDilateErode3D :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageDilateErode3D :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageDilateErode3D :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImageDilateErode3D; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImageDilateErode3D.h".}
proc SetKernelSize*(this: var vtkImageDilateErode3D; size0: cint; size1: cint;
                   size2: cint) {.importcpp: "SetKernelSize",
                                header: "vtkImageDilateErode3D.h".}
proc SetDilateValue*(this: var vtkImageDilateErode3D; _arg: cdouble) {.
    importcpp: "SetDilateValue", header: "vtkImageDilateErode3D.h".}
## !!!Ignored construct:  virtual double GetDilateValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DilateValue  of  << this -> DilateValue ) ; return this -> DilateValue ; } ;
## Error: expected ';'!!!

proc SetDilateValueErodeValue*(this: var vtkImageDilateErode3D; _arg: cdouble) {.
    importcpp: "SetDilateValueErodeValue", header: "vtkImageDilateErode3D.h".}
## !!!Ignored construct:  virtual double GetDilateValueErodeValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ErodeValue  of  << this -> ErodeValue ) ; return this -> ErodeValue ; } ;
## Error: expected ';'!!!
