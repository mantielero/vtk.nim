## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVoxelModeller.h
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
##  @class   vtkVoxelModeller
##  @brief   convert an arbitrary dataset to a voxel representation
##
##  vtkVoxelModeller is a filter that converts an arbitrary data set to a
##  structured point (i.e., voxel) representation. It is very similar to
##  vtkImplicitModeller, except that it doesn't record distance; instead it
##  records occupancy. By default it supports a compact output of 0/1
##  VTK_BIT. Other vtk scalar types can be specified. The Foreground and
##  Background values of the output can also be specified.
##  NOTE: Not all vtk filters/readers/writers support the VTK_BIT
##  scalar type. You may want to use VTK_CHAR as an alternative.
##  @sa
##  vtkImplicitModeller
##

## !!!Ignored construct:  # vtkVoxelModeller_h [NewLine] # vtkVoxelModeller_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingHybridModule.h  For export macro [NewLine] class VTKIMAGINGHYBRID_EXPORT vtkVoxelModeller : public vtkImageAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVoxelModeller :: IsTypeOf ( type ) ; } static vtkVoxelModeller * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVoxelModeller * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVoxelModeller * NewInstance ( ) const { return vtkVoxelModeller :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVoxelModeller :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVoxelModeller :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct an instance of vtkVoxelModeller with its sample dimensions
##  set to (50,50,50), and so that the model bounds are
##  automatically computed from its input. The maximum distance is set to
##  examine the whole grid. This could be made much faster, and probably
##  will be in the future.
##  static vtkVoxelModeller * New ( ) ; *
##  Compute the ModelBounds based on the input geometry.
##  double ComputeModelBounds ( double origin [ 3 ] , double spacing [ 3 ] ) ; /@{ *
##  Set the i-j-k dimensions on which to sample the distance function.
##  Default is (50, 50, 50)
##  void SetSampleDimensions ( int i , int j , int k ) ; void SetSampleDimensions ( int dim [ 3 ] ) ; virtual int * GetSampleDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SampleDimensions  pointer  << this -> SampleDimensions ) ; return this -> SampleDimensions ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensions ( int data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> SampleDimensions [ i ] ; } } ; /@} /@{ *
##  Specify distance away from surface of input geometry to sample. Smaller
##  values make large increases in performance. Default is 1.0.
##  virtual void SetMaximumDistance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumDistance  to  << _arg ) ; if ( this -> MaximumDistance != ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> MaximumDistance = ( _arg < 0.0 ? 0.0 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumDistanceMinValue ( ) { return 0.0 ; } virtual double GetMaximumDistanceMaxValue ( ) { return 1.0 ; } ; virtual double GetMaximumDistance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumDistance  of  << this -> MaximumDistance ) ; return this -> MaximumDistance ; } ; /@} /@{ *
##  Specify the position in space to perform the voxelization.
##  Default is (0, 0, 0, 0, 0, 0)
##  void SetModelBounds ( const double bounds [ 6 ] ) ; void SetModelBounds ( double xmin , double xmax , double ymin , double ymax , double zmin , double zmax ) ; virtual double * GetSampleDimensionsModelBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ModelBounds  pointer  << this -> ModelBounds ) ; return this -> ModelBounds ; } VTK_WRAPEXCLUDE virtual void GetSampleDimensionsModelBounds ( double data [ 6 ] ) { for ( int i = 0 ; i < 6 ; i ++ ) { data [ i ] = this -> ModelBounds [ i ] ; } } ; /@} /@{ *
##  Control the scalar type of the output image. The default is
##  VTK_BIT.
##  NOTE: Not all filters/readers/writers support the VTK_BIT
##  scalar type. You may want to use VTK_CHAR as an alternative.
##  virtual void SetScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ScalarType  to  << _arg ) ; if ( this -> ScalarType != _arg ) { this -> ScalarType = _arg ; this -> Modified ( ) ; } } ; void SetScalarTypeToFloat ( ) { this -> SetScalarType ( VTK_FLOAT ) ; } void SetScalarTypeToDouble ( ) { this -> SetScalarType ( VTK_DOUBLE ) ; } void SetScalarTypeToInt ( ) { this -> SetScalarType ( VTK_INT ) ; } void SetScalarTypeToUnsignedInt ( ) { this -> SetScalarType ( VTK_UNSIGNED_INT ) ; } void SetScalarTypeToLong ( ) { this -> SetScalarType ( VTK_LONG ) ; } void SetScalarTypeToUnsignedLong ( ) { this -> SetScalarType ( VTK_UNSIGNED_LONG ) ; } void SetScalarTypeToShort ( ) { this -> SetScalarType ( VTK_SHORT ) ; } void SetScalarTypeToUnsignedShort ( ) { this -> SetScalarType ( VTK_UNSIGNED_SHORT ) ; } void SetScalarTypeToUnsignedChar ( ) { this -> SetScalarType ( VTK_UNSIGNED_CHAR ) ; } void SetScalarTypeToChar ( ) { this -> SetScalarType ( VTK_CHAR ) ; } void SetScalarTypeToBit ( ) { this -> SetScalarType ( VTK_BIT ) ; } virtual int GetMaximumDistanceScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarType  of  << this -> ScalarType ) ; return this -> ScalarType ; } ; /@} /@{ *
##  Set the Foreground/Background values of the output. The
##  Foreground value is set when a voxel is occupied. The Background
##  value is set when a voxel is not occupied.
##  The default ForegroundValue is 1. The default BackgroundValue is
##  0.
##  virtual void SetScalarTypeForegroundValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ForegroundValue  to  << _arg ) ; if ( this -> ForegroundValue != _arg ) { this -> ForegroundValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumDistanceScalarTypeForegroundValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForegroundValue  of  << this -> ForegroundValue ) ; return this -> ForegroundValue ; } ; virtual void SetScalarTypeForegroundValueBackgroundValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BackgroundValue  to  << _arg ) ; if ( this -> BackgroundValue != _arg ) { this -> BackgroundValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumDistanceScalarTypeForegroundValueBackgroundValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BackgroundValue  of  << this -> BackgroundValue ) ; return this -> BackgroundValue ; } ; /@} protected : vtkVoxelModeller ( ) ; ~ vtkVoxelModeller ( ) override = default ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ;  see vtkAlgorithm for details int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;  see algorithm for more info int FillInputPortInformation ( int port , vtkInformation * info ) override ; int SampleDimensions [ 3 ] ; double MaximumDistance ; double ModelBounds [ 6 ] ; double ForegroundValue ; double BackgroundValue ; int ScalarType ; private : vtkVoxelModeller ( const vtkVoxelModeller & ) = delete ; void operator = ( const vtkVoxelModeller & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
