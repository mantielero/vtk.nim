## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThinPlateSplineTransform.h
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
##  @class   vtkThinPlateSplineTransform
##  @brief   a nonlinear warp transformation
##
##  vtkThinPlateSplineTransform describes a nonlinear warp transform defined
##  by a set of source and target landmarks. Any point on the mesh close to a
##  source landmark will be moved to a place close to the corresponding target
##  landmark. The points in between are interpolated smoothly using
##  Bookstein's Thin Plate Spline algorithm.
##
##  To obtain a correct TPS warp, use the R2LogR kernel if your data is 2D, and
##  the R kernel if your data is 3D. Or you can specify your own RBF. (Hence this
##  class is more general than a pure TPS transform.)
##  @warning
##  1) The inverse transform is calculated using an iterative method,
##  and is several times more expensive than the forward transform.
##  2) Whenever you add, subtract, or set points you must call Modified()
##  on the vtkPoints object, or the transformation might not update.
##  3) Collinear point configurations (except those that lie in the XY plane)
##  result in an unstable transformation. Forward transform can be computed
##  for any configuration by disabling bulk transform regularization.
##  @sa
##  vtkGridTransform vtkGeneralTransform
##

import
  vtkCommonTransformsModule, vtkWarpTransform

const
  VTK_RBF_CUSTOM* = 0
  VTK_RBF_R* = 1
  VTK_RBF_R2LOGR* = 2

type
  vtkThinPlateSplineTransform* {.importcpp: "vtkThinPlateSplineTransform",
                                header: "vtkThinPlateSplineTransform.h", bycopy.} = object of vtkWarpTransform
    vtkThinPlateSplineTransform* {.importc: "vtkThinPlateSplineTransform".}: VTK_NEWINSTANCE
    ##  the radial basis function to use

  vtkThinPlateSplineTransformSuperclass* = vtkWarpTransform

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkThinPlateSplineTransform::IsTypeOf(@)",
    header: "vtkThinPlateSplineTransform.h".}
proc IsA*(this: var vtkThinPlateSplineTransform; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkThinPlateSplineTransform.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkThinPlateSplineTransform {.
    importcpp: "vtkThinPlateSplineTransform::SafeDownCast(@)",
    header: "vtkThinPlateSplineTransform.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkThinPlateSplineTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThinPlateSplineTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThinPlateSplineTransform :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkThinPlateSplineTransform; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkThinPlateSplineTransform.h".}
proc New*(): ptr vtkThinPlateSplineTransform {.
    importcpp: "vtkThinPlateSplineTransform::New(@)",
    header: "vtkThinPlateSplineTransform.h".}
## !!!Ignored construct:  /@{ *
##  Specify the 'stiffness' of the spline. The default is 1.0.
##  virtual double GetSigmaSigma ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Sigma  of  << this -> Sigma ) ; return this -> Sigma ; } ;
## Error: expected ';'!!!

proc SetSigma*(this: var vtkThinPlateSplineTransform; _arg: cdouble) {.
    importcpp: "SetSigma", header: "vtkThinPlateSplineTransform.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify the radial basis function to use.  The default is
  ##  R2LogR which is appropriate for 2D. Use |R| (SetBasisToR)
  ##  if your data is 3D. Alternatively specify your own basis function,
  ##  however this will mean that the transform will no longer be a true
  ##  thin-plate spline.
  ##
proc SetBasis*(this: var vtkThinPlateSplineTransform; basis: cint) {.
    importcpp: "SetBasis", header: "vtkThinPlateSplineTransform.h".}
## !!!Ignored construct:  virtual int GetSigmaSigmaBasis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Basis  of  << this -> Basis ) ; return this -> Basis ; } ;
## Error: expected ';'!!!

proc SetBasisToR*(this: var vtkThinPlateSplineTransform) {.importcpp: "SetBasisToR",
    header: "vtkThinPlateSplineTransform.h".}
proc SetBasisToR2LogR*(this: var vtkThinPlateSplineTransform) {.
    importcpp: "SetBasisToR2LogR", header: "vtkThinPlateSplineTransform.h".}
proc GetBasisAsString*(this: var vtkThinPlateSplineTransform): cstring {.
    importcpp: "GetBasisAsString", header: "vtkThinPlateSplineTransform.h".}
proc SetBasisFunction*(this: var vtkThinPlateSplineTransform;
                      U: proc (r: cdouble): cdouble) {.importcpp: "SetBasisFunction",
    header: "vtkThinPlateSplineTransform.h".}
proc SetBasisDerivative*(this: var vtkThinPlateSplineTransform;
                        dUdr: proc (r: cdouble; dU: var cdouble): cdouble) {.
    importcpp: "SetBasisDerivative", header: "vtkThinPlateSplineTransform.h".}
proc SetSourceLandmarks*(this: var vtkThinPlateSplineTransform;
                        source: ptr vtkPoints) {.importcpp: "SetSourceLandmarks",
    header: "vtkThinPlateSplineTransform.h".}
proc GetnameSourceLandmarks*(this: var vtkThinPlateSplineTransform): ptr vtkPoints {.
    importcpp: "GetnameSourceLandmarks", header: "vtkThinPlateSplineTransform.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the target landmarks for the warp.  If you add or change the
  ##  vtkPoints object, you must call Modified() on it or the transformation
  ##  might not update.
  ##
proc SetTargetLandmarks*(this: var vtkThinPlateSplineTransform;
                        target: ptr vtkPoints) {.importcpp: "SetTargetLandmarks",
    header: "vtkThinPlateSplineTransform.h".}
proc GetnameSourceLandmarksTargetLandmarks*(this: var vtkThinPlateSplineTransform): ptr vtkPoints {.
    importcpp: "GetnameSourceLandmarksTargetLandmarks",
    header: "vtkThinPlateSplineTransform.h".}
  ## /@}
  ## *
  ##  Get the MTime.
  ##
proc GetMTime*(this: var vtkThinPlateSplineTransform): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkThinPlateSplineTransform.h".}
proc MakeTransform*(this: var vtkThinPlateSplineTransform): ptr vtkAbstractTransform {.
    importcpp: "MakeTransform", header: "vtkThinPlateSplineTransform.h".}
## !!!Ignored construct:  /@{ *
##  Get/set whether the bulk linear transformation matrix is regularized.
##
##  If regularization is enabled: If all landmark points are on the
##  XY plane then forward and inverse transforms are computed correctly.
##  For other coplanar configurations, both forward an inverse transform
##  computation is unstable.
##
##  If regularization is disabled: Forward transform is computed correctly
##  for all point configurations. Inverse transform computation is unstable
##  if source and/or target points are coplanar.
##
##  If landmarks points are not coplanar then this setting has no effect.
##
##  The default is true.
##  virtual bool GetSigmaSigmaBasisRegularizeBulkTransformRegularizeBulkTransform ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RegularizeBulkTransform  of  << this -> RegularizeBulkTransform ) ; return this -> RegularizeBulkTransform ; } ;
## Error: expected ';'!!!

proc SetSigmaRegularizeBulkTransform*(this: var vtkThinPlateSplineTransform;
                                     _arg: bool) {.
    importcpp: "SetSigmaRegularizeBulkTransform",
    header: "vtkThinPlateSplineTransform.h".}
proc RegularizeBulkTransformOn*(this: var vtkThinPlateSplineTransform) {.
    importcpp: "RegularizeBulkTransformOn",
    header: "vtkThinPlateSplineTransform.h".}
proc RegularizeBulkTransformOff*(this: var vtkThinPlateSplineTransform) {.
    importcpp: "RegularizeBulkTransformOff",
    header: "vtkThinPlateSplineTransform.h".}
  ## /@}