## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitTextureCoords.h
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
##  @class   vtkImplicitTextureCoords
##  @brief   generate 1D, 2D, or 3D texture coordinates based on implicit function(s)
##
##  vtkImplicitTextureCoords is a filter to generate 1D, 2D, or 3D texture
##  coordinates from one, two, or three implicit functions, respectively.
##  In combinations with a vtkBooleanTexture map (or another texture map of
##  your own creation), the texture coordinates can be used to highlight
## (via color or intensity) or cut (via transparency) dataset geometry without
##  any complex geometric processing. (Note: the texture coordinates are
##  referred to as r-s-t coordinates.)
##
##  The texture coordinates are automatically normalized to lie between (0,1).
##  Thus, no matter what the implicit functions evaluate to, the resulting
##  texture coordinates lie between (0,1), with the zero implicit function
##  value mapped to the 0.5 texture coordinates value. Depending upon the
##  maximum negative/positive implicit function values, the full (0,1) range
##  may not be occupied (i.e., the positive/negative ranges are mapped using
##  the same scale factor).
##
##  A boolean variable InvertTexture is available to flip the texture
##  coordinates around 0.5 (value 1.0 becomes 0.0, 0.25->0.75). This is
##  equivalent to flipping the texture map (but a whole lot easier).
##
##  @warning
##  You can use the transformation capabilities of vtkImplicitFunction to
##  orient, translate, and scale the implicit functions. Also, the dimension of
##  the texture coordinates is implicitly defined by the number of implicit
##  functions defined.
##
##  @sa
##  vtkImplicitFunction vtkTexture vtkBooleanTexture vtkTransformTexture
##

## !!!Ignored construct:  # vtkImplicitTextureCoords_h [NewLine] # vtkImplicitTextureCoords_h [NewLine] # vtkDataSetAlgorithm.h [NewLine] # vtkFiltersTextureModule.h  For export macro [NewLine] class vtkImplicitFunction ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSTEXTURE_EXPORT vtkImplicitTextureCoords : public vtkDataSetAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSetAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSetAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitTextureCoords :: IsTypeOf ( type ) ; } static vtkImplicitTextureCoords * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitTextureCoords * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitTextureCoords * NewInstance ( ) const { return vtkImplicitTextureCoords :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitTextureCoords :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitTextureCoords :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Create object with texture dimension=2 and no r-s-t implicit functions
##  defined and FlipTexture turned off.
##  static vtkImplicitTextureCoords * New ( ) ; /@{ *
##  Specify an implicit function to compute the r texture coordinate.
##  virtual void SetRFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameRFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  RFunction  address  << static_cast < vtkImplicitFunction * > ( this -> RFunction ) ) ; return this -> RFunction ; } ; /@} /@{ *
##  Specify an implicit function to compute the s texture coordinate.
##  virtual void SetSFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameRFunctionSFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  SFunction  address  << static_cast < vtkImplicitFunction * > ( this -> SFunction ) ) ; return this -> SFunction ; } ; /@} /@{ *
##  Specify an implicit function to compute the t texture coordinate.
##  virtual void SetTFunction ( vtkImplicitFunction * ) ; virtual vtkImplicitFunction * GetnameRFunctionSFunctionTFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  TFunction  address  << static_cast < vtkImplicitFunction * > ( this -> TFunction ) ) ; return this -> TFunction ; } ; /@} /@{ *
##  If enabled, this will flip the sense of inside and outside the implicit
##  function (i.e., a rotation around the r-s-t=0.5 axis).
##  virtual void SetFlipTexture ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipTexture  to  << _arg ) ; if ( this -> FlipTexture != _arg ) { this -> FlipTexture = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFlipTexture ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipTexture  of  << this -> FlipTexture ) ; return this -> FlipTexture ; } ; virtual void FlipTextureOn ( ) { this -> SetFlipTexture ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipTextureOff ( ) { this -> SetFlipTexture ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImplicitTextureCoords ( ) ; ~ vtkImplicitTextureCoords ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkImplicitFunction * RFunction ; vtkImplicitFunction * SFunction ; vtkImplicitFunction * TFunction ; vtkTypeBool FlipTexture ; private : vtkImplicitTextureCoords ( const vtkImplicitTextureCoords & ) = delete ; void operator = ( const vtkImplicitTextureCoords & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
