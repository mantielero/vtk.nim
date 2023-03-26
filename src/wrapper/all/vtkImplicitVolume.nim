## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitVolume.h
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
##  @class   vtkImplicitVolume
##  @brief   treat a volume as if it were an implicit function
##
##  vtkImplicitVolume treats a volume (e.g., structured point dataset)
##  as if it were an implicit function. This means it computes a function
##  value and gradient. vtkImplicitVolume is a concrete implementation of
##  vtkImplicitFunction.
##
##  vtkImplicitDataSet computes the function (at the point x) by performing
##  cell interpolation. That is, it finds the cell containing x, and then
##  uses the cell's interpolation functions to compute an interpolated
##  scalar value at x. (A similar approach is used to find the
##  gradient, if requested.) Points outside of the dataset are assigned
##  the value of the ivar OutValue, and the gradient value OutGradient.
##
##  @warning
##  The input volume data is only updated when GetMTime() is called.
##  Works for 3D structured points datasets, 0D-2D datasets won't work properly.
##
##  @sa
##  vtkImplicitFunction vtkImplicitDataSet vtkClipPolyData vtkCutter
##  vtkImplicitWindowFunction
##

import
  vtkCommonDataModelModule, vtkImplicitFunction

discard "forward decl of vtkIdList"
discard "forward decl of vtkImageData"
type
  vtkImplicitVolume* {.importcpp: "vtkImplicitVolume",
                      header: "vtkImplicitVolume.h", bycopy.} = object of vtkImplicitFunction
    vtkImplicitVolume* {.importc: "vtkImplicitVolume".}: VTK_NEWINSTANCE
    ##  the structured points
    ##  to replace a static

  vtkImplicitVolumeSuperclass* = vtkImplicitFunction

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkImplicitVolume::IsTypeOf(@)", header: "vtkImplicitVolume.h".}
proc IsA*(this: var vtkImplicitVolume; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkImplicitVolume.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkImplicitVolume {.
    importcpp: "vtkImplicitVolume::SafeDownCast(@)", header: "vtkImplicitVolume.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkImplicitVolume :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitVolume :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitVolume :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkImplicitVolume; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkImplicitVolume.h".}
proc New*(): ptr vtkImplicitVolume {.importcpp: "vtkImplicitVolume::New(@)",
                                 header: "vtkImplicitVolume.h".}
proc GetMTime*(this: var vtkImplicitVolume): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkImplicitVolume.h".}
## using statement

proc EvaluateFunction*(this: var vtkImplicitVolume; x: array[3, cdouble]): cdouble {.
    importcpp: "EvaluateFunction", header: "vtkImplicitVolume.h".}
proc EvaluateGradient*(this: var vtkImplicitVolume; x: array[3, cdouble];
                      n: array[3, cdouble]) {.importcpp: "EvaluateGradient",
    header: "vtkImplicitVolume.h".}
proc SetVolume*(this: var vtkImplicitVolume; a2: ptr vtkImageData) {.
    importcpp: "SetVolume", header: "vtkImplicitVolume.h".}
proc GetnameVolume*(this: var vtkImplicitVolume): ptr vtkImageData {.
    importcpp: "GetnameVolume", header: "vtkImplicitVolume.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the function value to use for points outside of the dataset.
  ##
proc SetOutValue*(this: var vtkImplicitVolume; _arg: cdouble) {.
    importcpp: "SetOutValue", header: "vtkImplicitVolume.h".}
## !!!Ignored construct:  virtual double GetOutValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutValue  of  << this -> OutValue ) ; return this -> OutValue ; } ;
## Error: expected ';'!!!

proc SetOutGradient*(this: var vtkImplicitVolume; _arg1: cdouble; _arg2: cdouble;
                    _arg3: cdouble) {.importcpp: "SetOutGradient",
                                    header: "vtkImplicitVolume.h".}
proc SetOutGradient*(this: var vtkImplicitVolume; _arg: array[3, cdouble]) {.
    importcpp: "SetOutGradient", header: "vtkImplicitVolume.h".}
## !!!Ignored construct:  virtual double * GetOutGradient ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutGradient  pointer  << this -> OutGradient ) ; return this -> OutGradient ; } VTK_WRAPEXCLUDE virtual void GetOutGradient ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutGradient [ 0 ] ; _arg2 = this -> OutGradient [ 1 ] ; _arg3 = this -> OutGradient [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutGradient  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutGradient ( double _arg [ 3 ] ) { this -> GetOutGradient ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ;
## Error: expected ';'!!!
