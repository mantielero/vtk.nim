## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkROIStencilSource.h
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
##  @class   vtkROIStencilSource
##  @brief   create simple mask shapes
##
##  vtkROIStencilSource will create an image stencil with a
##  simple shape like a box, a sphere, or a cylinder.  Its output can
##  be used with vtkImageStecil or other vtk classes that apply
##  a stencil to an image.
##  @sa
##  vtkImplicitFunctionToImageStencil vtkLassoStencilSource
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

import
  vtkImageStencilSource, vtkImagingStencilModule

type
  vtkROIStencilSource* {.importcpp: "vtkROIStencilSource",
                        header: "vtkROIStencilSource.h", bycopy.} = object of vtkImageStencilSource
    vtkROIStencilSource* {.importc: "vtkROIStencilSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkROIStencilSource {.importcpp: "vtkROIStencilSource::New(@)",
                                   header: "vtkROIStencilSource.h".}
type
  vtkROIStencilSourceSuperclass* = vtkImageStencilSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkROIStencilSource::IsTypeOf(@)", header: "vtkROIStencilSource.h".}
proc IsA*(this: var vtkROIStencilSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkROIStencilSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkROIStencilSource {.
    importcpp: "vtkROIStencilSource::SafeDownCast(@)",
    header: "vtkROIStencilSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkROIStencilSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageStencilSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkROIStencilSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkROIStencilSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkROIStencilSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkROIStencilSource.h".}
const
  vtkROIStencilSourceBOX* = 0
  vtkROIStencilSourceELLIPSOID* = 1
  vtkROIStencilSourceCYLINDERX* = 2
  vtkROIStencilSourceCYLINDERY* = 3
  vtkROIStencilSourceCYLINDERZ* = 4

## !!!Ignored construct:  /@{ *
##  The shape of the region of interest.  Cylinders can be oriented
##  along the X, Y, or Z axes.  The default shape is "Box".
##  virtual int GetShapeShape ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Shape  of  << this -> Shape ) ; return this -> Shape ; } ;
## Error: expected ';'!!!

proc SetShape*(this: var vtkROIStencilSource; _arg: cint) {.importcpp: "SetShape",
    header: "vtkROIStencilSource.h".}
proc GetShapeMinValue*(this: var vtkROIStencilSource): cint {.
    importcpp: "GetShapeMinValue", header: "vtkROIStencilSource.h".}
proc GetShapeMaxValue*(this: var vtkROIStencilSource): cint {.
    importcpp: "GetShapeMaxValue", header: "vtkROIStencilSource.h".}
proc SetShapeToBox*(this: var vtkROIStencilSource) {.importcpp: "SetShapeToBox",
    header: "vtkROIStencilSource.h".}
proc SetShapeToEllipsoid*(this: var vtkROIStencilSource) {.
    importcpp: "SetShapeToEllipsoid", header: "vtkROIStencilSource.h".}
proc SetShapeToCylinderX*(this: var vtkROIStencilSource) {.
    importcpp: "SetShapeToCylinderX", header: "vtkROIStencilSource.h".}
proc SetShapeToCylinderY*(this: var vtkROIStencilSource) {.
    importcpp: "SetShapeToCylinderY", header: "vtkROIStencilSource.h".}
proc SetShapeToCylinderZ*(this: var vtkROIStencilSource) {.
    importcpp: "SetShapeToCylinderZ", header: "vtkROIStencilSource.h".}
proc GetShapeAsString*(this: var vtkROIStencilSource): cstring {.
    importcpp: "GetShapeAsString", header: "vtkROIStencilSource.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set the bounds of the region of interest.  The bounds take
##  the spacing and origin into account.
##  virtual double * GetBoundsBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBoundsBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> Bounds [ 0 ] ; _arg2 = this -> Bounds [ 1 ] ; _arg3 = this -> Bounds [ 2 ] ; _arg4 = this -> Bounds [ 3 ] ; _arg5 = this -> Bounds [ 4 ] ; _arg6 = this -> Bounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBoundsBounds ( double _arg [ 6 ] ) { this -> GetBoundsBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ;
## Error: expected ';'!!!

proc SetBounds*(this: var vtkROIStencilSource; _arg1: cdouble; _arg2: cdouble;
               _arg3: cdouble; _arg4: cdouble; _arg5: cdouble; _arg6: cdouble) {.
    importcpp: "SetBounds", header: "vtkROIStencilSource.h".}
proc SetBounds*(this: var vtkROIStencilSource; _arg: array[6, cdouble]) {.
    importcpp: "SetBounds", header: "vtkROIStencilSource.h".}
  ## /@}