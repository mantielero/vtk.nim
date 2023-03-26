## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageFlip.h
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
##  @class   vtkImageFlip
##  @brief   This flips an axis of an image. Right becomes left ...
##
##  vtkImageFlip will reflect the data along the filtered axis.  This filter is
##  actually a thin wrapper around vtkImageReslice.
##

## !!!Ignored construct:  # vtkImageFlip_h [NewLine] # vtkImageFlip_h [NewLine] # vtkImageReslice.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageFlip : public vtkImageReslice { public : static vtkImageFlip * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReslice Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReslice :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageFlip :: IsTypeOf ( type ) ; } static vtkImageFlip * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageFlip * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageFlip * NewInstance ( ) const { return vtkImageFlip :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageFlip :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageFlip :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify which axis will be flipped.  This must be an integer
##  between 0 (for x) and 2 (for z). Initial value is 0.
##  virtual void SetFilteredAxis ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FilteredAxis  to  << _arg ) ; if ( this -> FilteredAxis != _arg ) { this -> FilteredAxis = _arg ; this -> Modified ( ) ; } } ; virtual int GetFilteredAxis ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FilteredAxis  of  << this -> FilteredAxis ) ; return this -> FilteredAxis ; } ; /@} /@{ *
##  By default the image will be flipped about its center, and the
##  Origin, Spacing and Extent of the output will be identical to
##  the input.  However, if you have a coordinate system associated
##  with the image and you want to use the flip to convert +ve values
##  along one axis to -ve values (and vice versa) then you actually
##  want to flip the image about coordinate (0,0,0) instead of about
##  the center of the image.  This method will adjust the Origin of
##  the output such that the flip occurs about (0,0,0).  Note that
##  this method only changes the Origin (and hence the coordinate system)
##  the output data: the actual pixel values are the same whether or not
##  this method is used.  Also note that the Origin in this method name
##  refers to (0,0,0) in the coordinate system associated with the image,
##  it does not refer to the Origin ivar that is associated with a
##  vtkImageData.
##  virtual void SetFilteredAxisFlipAboutOrigin ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FlipAboutOrigin  to  << _arg ) ; if ( this -> FlipAboutOrigin != _arg ) { this -> FlipAboutOrigin = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFilteredAxisFlipAboutOrigin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FlipAboutOrigin  of  << this -> FlipAboutOrigin ) ; return this -> FlipAboutOrigin ; } ; virtual void FlipAboutOriginOn ( ) { this -> SetFlipAboutOrigin ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void FlipAboutOriginOff ( ) { this -> SetFlipAboutOrigin ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} *
##  Keep the mis-named Axes variations around for compatibility with old
##  scripts. Axis is singular, not plural...
##  void SetFilteredAxes ( int axis ) { this -> SetFilteredAxis ( axis ) ; } int GetFilteredAxes ( ) { return this -> GetFilteredAxis ( ) ; } /@{ *
##  PreserveImageExtentOff wasn't covered by test scripts and its
##  implementation was broken.  It is deprecated now and it has
##  no effect (i.e. the ImageExtent is always preserved).
##  virtual void SetFilteredAxisFlipAboutOriginPreserveImageExtent ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PreserveImageExtent  to  << _arg ) ; if ( this -> PreserveImageExtent != _arg ) { this -> PreserveImageExtent = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetFilteredAxisFlipAboutOriginPreserveImageExtent ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveImageExtent  of  << this -> PreserveImageExtent ) ; return this -> PreserveImageExtent ; } ; virtual void PreserveImageExtentOn ( ) { this -> SetFlipAboutOriginPreserveImageExtent ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void PreserveImageExtentOff ( ) { this -> SetFlipAboutOriginPreserveImageExtent ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImageFlip ( ) ; ~ vtkImageFlip ( ) override = default ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FilteredAxis ; vtkTypeBool FlipAboutOrigin ; vtkTypeBool PreserveImageExtent ; private : vtkImageFlip ( const vtkImageFlip & ) = delete ; void operator = ( const vtkImageFlip & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
