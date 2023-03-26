## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageAccumulate.h
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
##  @class   vtkImageAccumulate
##  @brief   Generalized histograms up to 3 dimensions.
##
##  vtkImageAccumulate - This filter divides component space into
##  discrete bins.  It then counts the number of pixels associated
##  with each bin.
##  The dimensionality of the output depends on how many components the
##  input pixels have. An input images with N components per pixels will
##  result in an N-dimensional histogram, where N can be 1, 2, or 3.
##  The input can be any type, but the output is always int.
##  Some statistics are computed on the pixel values at the same time.
##  The SetStencil and ReverseStencil functions allow the statistics to be
##  computed on an arbitrary portion of the input data.
##  See the documentation for vtkImageStencilData for more information.
##
##  This filter also supports ignoring pixels with value equal to 0. Using this
##  option with vtkImageMask may result in results being slightly off since 0
##  could be a valid value from your input.
##
##

## !!!Ignored construct:  # vtkImageAccumulate_h [NewLine] # vtkImageAccumulate_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingStatisticsModule.h  For export macro [NewLine] class vtkImageStencilData ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKIMAGINGSTATISTICS_EXPORT vtkImageAccumulate : public vtkImageAlgorithm { public : static vtkImageAccumulate * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageAccumulate :: IsTypeOf ( type ) ; } static vtkImageAccumulate * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageAccumulate * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageAccumulate * NewInstance ( ) const { return vtkImageAccumulate :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageAccumulate :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageAccumulate :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get - The component spacing is the dimension of each bin.
##  This ends up being the spacing of the output "image".
##  If the number of input scalar components are less than three,
##  then some of these spacing values are ignored.
##  For a 1D histogram with 10 bins spanning the values 1000 to 2000,
##  this spacing should be set to 100, 0, 0.
##  Initial value is (1.0,1.0,1.0).
##  virtual void SetComponentSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ComponentSpacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ComponentSpacing [ 0 ] != _arg1 ) || ( this -> ComponentSpacing [ 1 ] != _arg2 ) || ( this -> ComponentSpacing [ 2 ] != _arg3 ) ) { this -> ComponentSpacing [ 0 ] = _arg1 ; this -> ComponentSpacing [ 1 ] = _arg2 ; this -> ComponentSpacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetComponentSpacing ( const double _arg [ 3 ] ) { this -> SetComponentSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetComponentSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ComponentSpacing  pointer  << this -> ComponentSpacing ) ; return this -> ComponentSpacing ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ComponentSpacing [ 0 ] ; _arg2 = this -> ComponentSpacing [ 1 ] ; _arg3 = this -> ComponentSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ComponentSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacing ( double _arg [ 3 ] ) { this -> GetComponentSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get - The component origin is the location of bin (0, 0, 0).
##  Note that if the Component extent does not include the value (0,0,0),
##  then this origin bin will not actually be in the output.
##  The origin of the output ends up being the same as the componenet origin.
##  For a 1D histogram with 10 bins spanning the values 1000 to 2000,
##  this origin should be set to 1000, 0, 0.
##  Initial value is (0.0,0.0,0.0).
##  virtual void SetComponentSpacingComponentOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ComponentOrigin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ComponentOrigin [ 0 ] != _arg1 ) || ( this -> ComponentOrigin [ 1 ] != _arg2 ) || ( this -> ComponentOrigin [ 2 ] != _arg3 ) ) { this -> ComponentOrigin [ 0 ] = _arg1 ; this -> ComponentOrigin [ 1 ] = _arg2 ; this -> ComponentOrigin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetComponentSpacingComponentOrigin ( const double _arg [ 3 ] ) { this -> SetComponentSpacingComponentOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetComponentSpacingComponentOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ComponentOrigin  pointer  << this -> ComponentOrigin ) ; return this -> ComponentOrigin ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ComponentOrigin [ 0 ] ; _arg2 = this -> ComponentOrigin [ 1 ] ; _arg3 = this -> ComponentOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ComponentOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOrigin ( double _arg [ 3 ] ) { this -> GetComponentSpacingComponentOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get - The component extent sets the number/extent of the bins.
##  For a 1D histogram with 10 bins spanning the values 1000 to 2000,
##  this extent should be set to 0, 9, 0, 0, 0, 0.
##  The extent specifies inclusive min/max values.
##  This implies that the top extent should be set to the number of bins - 1.
##  Initial value is (0,255,0,0,0,0)
##  void SetComponentExtent ( int extent [ 6 ] ) ; void SetComponentExtent ( int minX , int maxX , int minY , int maxY , int minZ , int maxZ ) ; void GetComponentExtent ( int extent [ 6 ] ) ; int * GetComponentExtent ( ) VTK_SIZEHINT ( 6 ) { return this -> ComponentExtent ; } /@} /@{ *
##  Use a stencil to specify which voxels to accumulate.
##  Backcompatible methods.
##  It set and get the stencil on input port 1.
##  Initial value is nullptr.
##  void SetStencilData ( vtkImageStencilData * stencil ) ; vtkImageStencilData * GetStencil ( ) ; /@} /@{ *
##  Reverse the stencil. Initial value is false.
##  virtual void SetReverseStencil ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ReverseStencil  to  << _arg ) ; if ( this -> ReverseStencil != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> ReverseStencil = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetReverseStencilMinValue ( ) { return 0 ; } virtual vtkTypeBool GetReverseStencilMaxValue ( ) { return 1 ; } ; virtual void ReverseStencilOn ( ) { this -> SetReverseStencil ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void ReverseStencilOff ( ) { this -> SetReverseStencil ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetReverseStencil ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReverseStencil  of  << this -> ReverseStencil ) ; return this -> ReverseStencil ; } ; /@} /@{ *
##  Get the statistics information for the data.
##  The values only make sense after the execution of the filter.
##  Initial values are 0.
##  virtual double * GetComponentSpacingComponentOriginMin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Min  pointer  << this -> Min ) ; return this -> Min ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Min [ 0 ] ; _arg2 = this -> Min [ 1 ] ; _arg3 = this -> Min [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Min  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMin ( double _arg [ 3 ] ) { this -> GetComponentSpacingComponentOriginMin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetComponentSpacingComponentOriginMinMax ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Max  pointer  << this -> Max ) ; return this -> Max ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMinMax ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Max [ 0 ] ; _arg2 = this -> Max [ 1 ] ; _arg3 = this -> Max [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Max  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMinMax ( double _arg [ 3 ] ) { this -> GetComponentSpacingComponentOriginMinMax ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetComponentSpacingComponentOriginMinMaxMean ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Mean  pointer  << this -> Mean ) ; return this -> Mean ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMinMaxMean ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Mean [ 0 ] ; _arg2 = this -> Mean [ 1 ] ; _arg3 = this -> Mean [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Mean  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMinMaxMean ( double _arg [ 3 ] ) { this -> GetComponentSpacingComponentOriginMinMaxMean ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetComponentSpacingComponentOriginMinMaxMeanStandardDeviation ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviation  pointer  << this -> StandardDeviation ) ; return this -> StandardDeviation ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMinMaxMeanStandardDeviation ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> StandardDeviation [ 0 ] ; _arg2 = this -> StandardDeviation [ 1 ] ; _arg3 = this -> StandardDeviation [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviation  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetComponentSpacingComponentOriginMinMaxMeanStandardDeviation ( double _arg [ 3 ] ) { this -> GetComponentSpacingComponentOriginMinMaxMeanStandardDeviation ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual vtkIdType GetReverseStencilVoxelCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VoxelCount  of  << this -> VoxelCount ) ; return this -> VoxelCount ; } ; /@} /@{ *
##  Should the data with value 0 be ignored? Initial value is false.
##  virtual void SetReverseStencilIgnoreZero ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << IgnoreZero  to  << _arg ) ; if ( this -> IgnoreZero != ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ) { this -> IgnoreZero = ( _arg < 0 ? 0 : ( _arg > 1 ? 1 : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkTypeBool GetReverseStencilMinValueIgnoreZeroMinValue ( ) { return 0 ; } virtual vtkTypeBool GetReverseStencilMaxValueIgnoreZeroMaxValue ( ) { return 1 ; } ; virtual vtkTypeBool GetReverseStencilVoxelCountIgnoreZero ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IgnoreZero  of  << this -> IgnoreZero ) ; return this -> IgnoreZero ; } ; virtual void IgnoreZeroOn ( ) { this -> SetReverseStencilIgnoreZero ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void IgnoreZeroOff ( ) { this -> SetReverseStencilIgnoreZero ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImageAccumulate ( ) ; ~ vtkImageAccumulate ( ) override ; double ComponentSpacing [ 3 ] ; double ComponentOrigin [ 3 ] ; int ComponentExtent [ 6 ] ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; vtkTypeBool IgnoreZero ; double Min [ 3 ] ; double Max [ 3 ] ; double Mean [ 3 ] ; double StandardDeviation [ 3 ] ; vtkIdType VoxelCount ; vtkTypeBool ReverseStencil ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; private : vtkImageAccumulate ( const vtkImageAccumulate & ) = delete ; void operator = ( const vtkImageAccumulate & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
