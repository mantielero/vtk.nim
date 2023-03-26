## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSlabReslice.h
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
##  @class   vtkImageSlabReslice
##  @brief   Thick slab reformat through data.
##
##  This class derives from vtkImageResliceBase. Much like vtkImageReslice, it
##  reslices the data. It is multi-threaded. It takes a three dimensional image
##  as input and produces a two dimensional thick MPR along some direction.
##  <p> The class reslices the thick slab using a blending function. Supported
##  blending functions are Minimum Intensity blend through the slab, maximum
##  intensity blend and a Mean (average) intensity of values across the slab.
##  <p> The user can adjust the thickness of the slab by using the method
##  SetSlabThickness. The distance between sample points used for blending
##  across the thickness of the slab is controlled by the method
##  SetSlabResolution. These two methods determine the number of slices used
##  across the slab for blending, which is computed as
##  {(2 x (int)(0.5 x SlabThickness/SlabResolution)) + 1}. This value may
##  be queried via GetNumBlendSamplePoints() and is always >= 1.
##  <p> Much like vtkImageReslice, the reslice axes direction cosines may be
##  set via the methods SetResliceAxes or SetResliceAxesDirectionCosines. The
##  output spacing is controlled by SetOutputSpacing and the output origin is
##  controlled by SetOutputOrigin. The default value to be set on pixels that
##  lie outside the volume when reformatting is controlled by
##  SetBackgroundColor or SetBackgroundLevel. The SetResliceAxesOrigin()
##  method can also be used to provide an (x,y,z) point that the slice will
##  pass through.
##  @sa
##  vtkImageReslice
##

## !!!Ignored construct:  # vtkImageSlabReslice_h [NewLine] # vtkImageSlabReslice_h [NewLine] # vtkImageReslice.h [NewLine] # vtkImagingGeneralModule.h  For export macro [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageSlabReslice : public vtkImageReslice { public : static vtkImageSlabReslice * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageReslice Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageReslice :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageSlabReslice :: IsTypeOf ( type ) ; } static vtkImageSlabReslice * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageSlabReslice * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageSlabReslice * NewInstance ( ) const { return vtkImageSlabReslice :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSlabReslice :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSlabReslice :: New ( ) ; } public : ; *
##  Printself method.
##  void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the blend mode. Default is MIP (ie Max)
##  virtual void SetBlendMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BlendMode  to  << _arg ) ; if ( this -> BlendMode != _arg ) { this -> BlendMode = _arg ; this -> Modified ( ) ; } } ; virtual int GetBlendMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BlendMode  of  << this -> BlendMode ) ; return this -> BlendMode ; } ; void SetBlendModeToMin ( ) { this -> SetBlendMode ( VTK_IMAGE_SLAB_MIN ) ; } void SetBlendModeToMax ( ) { this -> SetBlendMode ( VTK_IMAGE_SLAB_MAX ) ; } void SetBlendModeToMean ( ) { this -> SetBlendMode ( VTK_IMAGE_SLAB_MEAN ) ; } /@} /@{ *
##  Number of sample points used across the slab cross-section. If equal to
##  1, this ends up being a thin reslice through the data a.k.a.
##  vtkImageReslice
##  virtual int GetBlendModeNumBlendSamplePoints ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumBlendSamplePoints  of  << this -> NumBlendSamplePoints ) ; return this -> NumBlendSamplePoints ; } ; /@} /@{ *
##  SlabThickness of slab in world coords. SlabThickness must be non-zero and
##  positive.
##  virtual void SetBlendModeSlabThickness ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SlabThickness  to  << _arg ) ; if ( this -> SlabThickness != _arg ) { this -> SlabThickness = _arg ; this -> Modified ( ) ; } } ; virtual double GetBlendModeNumBlendSamplePointsSlabThickness ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabThickness  of  << this -> SlabThickness ) ; return this -> SlabThickness ; } ; /@} /@{ *
##  Spacing between slabs in world units. (Number of Slices, ie samples to
##  blend is computed from SlabThickness and SlabResolution).
##  virtual void SetBlendModeSlabThicknessSlabResolution ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SlabResolution  to  << _arg ) ; if ( this -> SlabResolution != _arg ) { this -> SlabResolution = _arg ; this -> Modified ( ) ; } } ; virtual double GetBlendModeNumBlendSamplePointsSlabThicknessSlabResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SlabResolution  of  << this -> SlabResolution ) ; return this -> SlabResolution ; } ; /@} protected : vtkImageSlabReslice ( ) ; ~ vtkImageSlabReslice ( ) override ; *
##  This method simply calls the superclass method. In addition, it also
##  precomputes the NumBlendSamplePoints based on the SlabThickness and
##  SlabResolution.
##  int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int BlendMode ;  can be MIN, MIP, MAX double SlabThickness ; double SlabResolution ; int NumBlendSamplePoints ; private : vtkImageSlabReslice ( const vtkImageSlabReslice & ) = delete ; void operator = ( const vtkImageSlabReslice & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
