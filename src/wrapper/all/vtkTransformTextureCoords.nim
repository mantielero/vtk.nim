## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformTextureCoords.h
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
##  @class   vtkTransformTextureCoords
##  @brief   transform (scale, rotate, translate) texture coordinates
##
##  vtkTransformTextureCoords is a filter that operates on texture
##  coordinates. It ingests any type of dataset, and outputs a dataset of the
##  same type. The filter lets you scale, translate, and rotate texture
##  coordinates. For example, by using the Scale ivar, you can shift
##  texture coordinates that range from (0->1) to range from (0->10) (useful
##  for repeated patterns).
##
##  The filter operates on texture coordinates of dimension 1->3. The texture
##  coordinates are referred to as r-s-t. If the texture map is two dimensional,
##  the t-coordinate (and operations on the t-coordinate) are ignored.
##
##  @sa
##  vtkTextureMapToPlane  vtkTextureMapToCylinder
##  vtkTextureMapToSphere vtkThresholdTextureCoords vtkTexture
##

## !!!Ignored construct:  # vtkTransformTextureCoords_h [NewLine] # vtkTransformTextureCoords_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersTextureModule.h  For export macro [NewLine] class VTKFILTERSTEXTURE_EXPORT vtkTransformTextureCoords : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTransformTextureCoords :: IsTypeOf ( type ) ; } static vtkTransformTextureCoords * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTransformTextureCoords * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTransformTextureCoords * NewInstance ( ) const { return vtkTransformTextureCoords :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformTextureCoords :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformTextureCoords :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create instance with Origin (0.5,0.5,0.5); Position (0,0,0); and Scale
##  set to (1,1,1). Rotation of the texture coordinates is turned off.
##  static vtkTransformTextureCoords * New ( ) ; /@{ *
##  Set/Get the position of the texture map. Setting the position translates
##  the texture map by the amount specified.
##  virtual void SetPosition ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Position  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Position [ 0 ] != _arg1 ) || ( this -> Position [ 1 ] != _arg2 ) || ( this -> Position [ 2 ] != _arg3 ) ) { this -> Position [ 0 ] = _arg1 ; this -> Position [ 1 ] = _arg2 ; this -> Position [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPosition ( const double _arg [ 3 ] ) { this -> SetPosition ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPosition ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Position  pointer  << this -> Position ) ; return this -> Position ; } VTK_WRAPEXCLUDE virtual void GetPosition ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Position [ i ] ; } } ; /@} /@{ *
##  Incrementally change the position of the texture map (i.e., does a
##  translate or shift of the texture coordinates).
##  void AddPosition ( double deltaR , double deltaS , double deltaT ) ; void AddPosition ( double deltaPosition [ 3 ] ) ; /@} /@{ *
##  Set/Get the scale of the texture map. Scaling in performed independently
##  on the r, s and t axes.
##  virtual void SetPositionScale ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Scale  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Scale [ 0 ] != _arg1 ) || ( this -> Scale [ 1 ] != _arg2 ) || ( this -> Scale [ 2 ] != _arg3 ) ) { this -> Scale [ 0 ] = _arg1 ; this -> Scale [ 1 ] = _arg2 ; this -> Scale [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPositionScale ( const double _arg [ 3 ] ) { this -> SetPositionScale ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPositionScale ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Scale  pointer  << this -> Scale ) ; return this -> Scale ; } VTK_WRAPEXCLUDE virtual void GetPositionScale ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Scale [ i ] ; } } ; /@} /@{ *
##  Set/Get the origin of the texture map. This is the point about which the
##  texture map is flipped (e.g., rotated). Since a typical texture map ranges
##  from (0,1) in the r-s-t coordinates, the default origin is set at
##  (0.5,0.5,0.5).
##  virtual void SetPositionScaleOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Origin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Origin [ 0 ] != _arg1 ) || ( this -> Origin [ 1 ] != _arg2 ) || ( this -> Origin [ 2 ] != _arg3 ) ) { this -> Origin [ 0 ] = _arg1 ; this -> Origin [ 1 ] = _arg2 ; this -> Origin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPositionScaleOrigin ( const double _arg [ 3 ] ) { this -> SetPositionScaleOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPositionScaleOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Origin  pointer  << this -> Origin ) ; return this -> Origin ; } VTK_WRAPEXCLUDE virtual void GetPositionScaleOrigin ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Origin [ i ] ; } } ; /@} /@{ *
##  Boolean indicates whether the texture map should be flipped around the
##  s-axis. Note that the flips occur around the texture origin.
##  virtual void SetFlipR ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipR  to  << _arg ) ; if ( this -> FlipR != _arg ) { this -> FlipR = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFlipR ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipR  of  << this -> FlipR ) ; return this -> FlipR ; } ; virtual void FlipROn ( ) { this -> SetFlipR ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipROff ( ) { this -> SetFlipR ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Boolean indicates whether the texture map should be flipped around the
##  s-axis. Note that the flips occur around the texture origin.
##  virtual void SetFlipRFlipS ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipS  to  << _arg ) ; if ( this -> FlipS != _arg ) { this -> FlipS = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFlipRFlipS ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipS  of  << this -> FlipS ) ; return this -> FlipS ; } ; virtual void FlipSOn ( ) { this -> SetFlipRFlipS ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipSOff ( ) { this -> SetFlipRFlipS ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} /@{ *
##  Boolean indicates whether the texture map should be flipped around the
##  t-axis. Note that the flips occur around the texture origin.
##  virtual void SetFlipRFlipSFlipT ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipT  to  << _arg ) ; if ( this -> FlipT != _arg ) { this -> FlipT = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFlipRFlipSFlipT ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipT  of  << this -> FlipT ) ; return this -> FlipT ; } ; virtual void FlipTOn ( ) { this -> SetFlipRFlipSFlipT ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipTOff ( ) { this -> SetFlipRFlipSFlipT ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkTransformTextureCoords ( ) ; ~ vtkTransformTextureCoords ( ) override = default ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; double Origin [ 3 ] ;  point around which map rotates double Position [ 3 ] ;  controls translation of map double Scale [ 3 ] ;  scales the texture map vtkTypeBool FlipR ;  boolean indicates whether to flip texture around r-axis vtkTypeBool FlipS ;  boolean indicates whether to flip texture around s-axis vtkTypeBool FlipT ;  boolean indicates whether to flip texture around t-axis private : vtkTransformTextureCoords ( const vtkTransformTextureCoords & ) = delete ; void operator = ( const vtkTransformTextureCoords & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
