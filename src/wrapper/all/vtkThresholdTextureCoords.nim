## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkThresholdTextureCoords.h
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
##  @class   vtkThresholdTextureCoords
##  @brief   compute 1D, 2D, or 3D texture coordinates based on scalar threshold
##
##  vtkThresholdTextureCoords is a filter that generates texture coordinates for
##  any input dataset type given a threshold criterion. The criterion can take
##  three forms: 1) greater than a particular value (ThresholdByUpper());
##  2) less than a particular value (ThresholdByLower(); or 3) between two
##  values (ThresholdBetween(). If the threshold criterion is satisfied,
##  the "in" texture coordinate will be set (this can be specified by the
##  user). If the threshold criterion is not satisfied the "out" is set.
##
##  @warning
##  There is a texture map - texThres.vtk - that can be used in conjunction
##  with this filter. This map defines a "transparent" region for texture
##  coordinates 0<=r<0.5, and an opaque full intensity map for texture
##  coordinates 0.5<r<=1.0. There is a small transition region for r=0.5.
##
##  @sa
##  vtkThreshold vtkThresholdPoints vtkTextureMapToPlane vtkTextureMapToSphere
##  vtkTextureMapToCylinder
##

## !!!Ignored construct:  # vtkThresholdTextureCoords_h [NewLine] # vtkThresholdTextureCoords_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersTextureModule.h  For export macro [NewLine] class VTKFILTERSTEXTURE_EXPORT vtkThresholdTextureCoords : public vtkDataSetAlgorithm { public : static vtkThresholdTextureCoords * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkThresholdTextureCoords :: IsTypeOf ( type ) ; } static vtkThresholdTextureCoords * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkThresholdTextureCoords * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkThresholdTextureCoords * NewInstance ( ) const { return vtkThresholdTextureCoords :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkThresholdTextureCoords :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkThresholdTextureCoords :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Criterion is cells whose scalars are less than lower threshold.
##  void ThresholdByLower ( double lower ) ; *
##  Criterion is cells whose scalars are less than upper threshold.
##  void ThresholdByUpper ( double upper ) ; *
##  Criterion is cells whose scalars are between lower and upper thresholds.
##  void ThresholdBetween ( double lower , double upper ) ; /@{ *
##  Return the upper and lower thresholds.
##  virtual double GetUpperThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UpperThreshold  of  << this -> UpperThreshold ) ; return this -> UpperThreshold ; } ; virtual double GetUpperThresholdLowerThreshold ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LowerThreshold  of  << this -> LowerThreshold ) ; return this -> LowerThreshold ; } ; /@} /@{ *
##  Set the desired dimension of the texture map.
##  virtual void SetTextureDimension ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureDimension  to  << _arg ) ; if ( this -> TextureDimension != ( _arg < 1 ? 1 : ( _arg > 3 ? 3 : _arg ) ) ) { this -> TextureDimension = ( _arg < 1 ? 1 : ( _arg > 3 ? 3 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetTextureDimensionMinValue ( ) { return 1 ; } virtual int GetTextureDimensionMaxValue ( ) { return 3 ; } ; virtual int GetUpperThresholdLowerThresholdTextureDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureDimension  of  << this -> TextureDimension ) ; return this -> TextureDimension ; } ; /@} /@{ *
##  Set the texture coordinate value for point satisfying threshold criterion.
##  virtual void SetInTextureCoord ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << InTextureCoord  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> InTextureCoord [ 0 ] != _arg1 ) || ( this -> InTextureCoord [ 1 ] != _arg2 ) || ( this -> InTextureCoord [ 2 ] != _arg3 ) ) { this -> InTextureCoord [ 0 ] = _arg1 ; this -> InTextureCoord [ 1 ] = _arg2 ; this -> InTextureCoord [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetInTextureCoord ( const double _arg [ 3 ] ) { this -> SetInTextureCoord ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetInTextureCoord ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << InTextureCoord  pointer  << this -> InTextureCoord ) ; return this -> InTextureCoord ; } VTK_WRAPEXCLUDE virtual void GetInTextureCoord ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> InTextureCoord [ i ] ; } } ; /@} /@{ *
##  Set the texture coordinate value for point NOT satisfying threshold
##  criterion.
##  virtual void SetInTextureCoordOutTextureCoord ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutTextureCoord  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutTextureCoord [ 0 ] != _arg1 ) || ( this -> OutTextureCoord [ 1 ] != _arg2 ) || ( this -> OutTextureCoord [ 2 ] != _arg3 ) ) { this -> OutTextureCoord [ 0 ] = _arg1 ; this -> OutTextureCoord [ 1 ] = _arg2 ; this -> OutTextureCoord [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetInTextureCoordOutTextureCoord ( const double _arg [ 3 ] ) { this -> SetInTextureCoordOutTextureCoord ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetInTextureCoordOutTextureCoord ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutTextureCoord  pointer  << this -> OutTextureCoord ) ; return this -> OutTextureCoord ; } VTK_WRAPEXCLUDE virtual void GetInTextureCoordOutTextureCoord ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> OutTextureCoord [ i ] ; } } ; /@} protected : vtkThresholdTextureCoords ( ) ; ~ vtkThresholdTextureCoords ( ) override = default ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double LowerThreshold ; double UpperThreshold ; int TextureDimension ; double InTextureCoord [ 3 ] ; double OutTextureCoord [ 3 ] ; int ( vtkThresholdTextureCoords :: * ThresholdFunction ) ( double s ) ; int Lower ( double s ) { return ( s <= this -> LowerThreshold ? 1 : 0 ) ; } int Upper ( double s ) { return ( s >= this -> UpperThreshold ? 1 : 0 ) ; } int Between ( double s ) { return ( s >= this -> LowerThreshold ? ( s <= this -> UpperThreshold ? 1 : 0 ) : 0 ) ; } private : vtkThresholdTextureCoords ( const vtkThresholdTextureCoords & ) = delete ; void operator = ( const vtkThresholdTextureCoords & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
