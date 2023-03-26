## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFastSplatter.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkFastSplatter
##  @brief   A splatter optimized for splatting single kernels.
##
##
##
##  vtkFastSplatter takes any vtkPointSet as input (of which vtkPolyData and
##  vtkUnstructuredGrid inherit).  Each point in the data set is considered to be
##  an impulse.  These impulses are convolved with a given splat image.  In other
##  words, the splat image is added to the final image at every place where there
##  is an input point.
##
##  Note that point and cell data are thrown away.  If you want a sampling
##  of unstructured points consider vtkGaussianSplatter or vtkShepardMethod.
##
##  Use input port 0 for the impulse data (vtkPointSet), and input port 1 for
##  the splat image (vtkImageData)
##
##
##  @bug
##  Any point outside of the extents of the image is thrown away, even if it is
##  close enough such that it's convolution with the splat image would overlap
##  the extents.
##
##

## !!!Ignored construct:  # vtkFastSplatter_h [NewLine] # vtkFastSplatter_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] class VTKIMAGINGHYBRID_EXPORT vtkFastSplatter : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFastSplatter :: IsTypeOf ( type ) ; } static vtkFastSplatter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFastSplatter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFastSplatter * NewInstance ( ) const { return vtkFastSplatter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFastSplatter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFastSplatter :: New ( ) ; } public : ; static vtkFastSplatter * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set / get the (xmin,xmax, ymin,ymax, zmin,zmax) bounding box in which
##  the sampling is performed. If any of the (min,max) bounds values are
##  min >= max, then the bounds will be computed automatically from the input
##  data. Otherwise, the user-specified bounds will be used.
##  virtual void SetModelBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ModelBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> ModelBounds [ 0 ] != _arg1 ) || ( this -> ModelBounds [ 1 ] != _arg2 ) || ( this -> ModelBounds [ 2 ] != _arg3 ) || ( this -> ModelBounds [ 3 ] != _arg4 ) || ( this -> ModelBounds [ 4 ] != _arg5 ) || ( this -> ModelBounds [ 5 ] != _arg6 ) ) { this -> ModelBounds [ 0 ] = _arg1 ; this -> ModelBounds [ 1 ] = _arg2 ; this -> ModelBounds [ 2 ] = _arg3 ; this -> ModelBounds [ 3 ] = _arg4 ; this -> ModelBounds [ 4 ] = _arg5 ; this -> ModelBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetModelBounds ( const double _arg [ 6 ] ) { this -> SetModelBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Set/get the dimensions of the output image
##  virtual void SetOutputDimensions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputDimensions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutputDimensions [ 0 ] != _arg1 ) || ( this -> OutputDimensions [ 1 ] != _arg2 ) || ( this -> OutputDimensions [ 2 ] != _arg3 ) ) { this -> OutputDimensions [ 0 ] = _arg1 ; this -> OutputDimensions [ 1 ] = _arg2 ; this -> OutputDimensions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutputDimensions ( const int _arg [ 3 ] ) { this -> SetOutputDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetOutputDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensions  pointer  << this -> OutputDimensions ) ; return this -> OutputDimensions ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensions ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> OutputDimensions [ 0 ] ; _arg2 = this -> OutputDimensions [ 1 ] ; _arg3 = this -> OutputDimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputDimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputDimensions ( int _arg [ 3 ] ) { this -> GetOutputDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} enum { NoneLimit , ClampLimit , ScaleLimit , FreezeScaleLimit } ; /@{ *
##  Set/get the way voxel values will be limited.  If this is set to None (the
##  default), the output can have arbitrarily large values.  If set to clamp,
##  the output will be clamped to [MinValue,MaxValue].  If set to scale, the
##  output will be linearly scaled between MinValue and MaxValue.
##  virtual void SetLimitMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  LimitMode  to  << _arg ) ; if ( this -> LimitMode != _arg ) { this -> LimitMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetLimitMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LimitMode  of  << this -> LimitMode ) ; return this -> LimitMode ; } ; void SetLimitModeToNone ( ) { this -> SetLimitMode ( NoneLimit ) ; } void SetLimitModeToClamp ( ) { this -> SetLimitMode ( ClampLimit ) ; } void SetLimitModeToScale ( ) { this -> SetLimitMode ( ScaleLimit ) ; } void SetLimitModeToFreezeScale ( ) { this -> SetLimitMode ( FreezeScaleLimit ) ; } /@} /@{ *
##  See the LimitMode method.
##  virtual void SetLimitModeMinValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MinValue  to  << _arg ) ; if ( this -> MinValue != _arg ) { this -> MinValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetLimitModeMinValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinValue  of  << this -> MinValue ) ; return this -> MinValue ; } ; virtual void SetLimitModeMinValueMaxValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxValue  to  << _arg ) ; if ( this -> MaxValue != _arg ) { this -> MaxValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetLimitModeMinValueMaxValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxValue  of  << this -> MaxValue ) ; return this -> MaxValue ; } ; /@} /@{ *
##  This returns the number of points splatted (as opposed to
##  discarded for being outside the image) during the previous pass.
##  virtual int GetLimitModeMinValueMaxValueNumberOfPointsSplatted ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfPointsSplatted  of  << this -> NumberOfPointsSplatted ) ; return this -> NumberOfPointsSplatted ; } ; /@} *
##  Convenience function for connecting the splat algorithm source.
##  This is provided mainly for convenience using the filter with
##  ParaView, VTK users should prefer SetInputConnection(1, splat) instead.
##  void SetSplatConnection ( vtkAlgorithmOutput * ) ; protected : vtkFastSplatter ( ) ; ~ vtkFastSplatter ( ) override ; double ModelBounds [ 6 ] ; int OutputDimensions [ 3 ] ; int LimitMode ; double MinValue ; double MaxValue ; double FrozenScale ; vtkImageData * Buckets ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  Used internally for converting points in world space to indices in
##  the output image. double Origin [ 3 ] ; double Spacing [ 3 ] ;  This is updated every time the filter executes int NumberOfPointsSplatted ;  Used internally to track the data range.  When the limit mode is
##  set to FreezeScale, the data will be scaled as if this were the
##  range regardless of what it actually is. double LastDataMinValue ; double LastDataMaxValue ; private : vtkFastSplatter ( const vtkFastSplatter & ) = delete ; void operator = ( const vtkFastSplatter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## -----------------------------------------------------------------------------

proc vtkFastSplatterClamp*[T](array: ptr T; arraySize: vtkIdType; minValue: T;
                             maxValue: T) =
  discard

## -----------------------------------------------------------------------------

proc vtkFastSplatterScale*[T](array: ptr T; numComponents: cint; numTuples: vtkIdType;
                             minValue: T; maxValue: T; dataMinValue: ptr cdouble;
                             dataMaxValue: ptr cdouble) =
  discard

## -----------------------------------------------------------------------------

proc vtkFastSplatterFrozenScale*[T](array: ptr T; numComponents: cint;
                                   numTuples: vtkIdType; minValue: T; maxValue: T;
                                   min: cdouble; max: cdouble) =
  discard
