## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSlab.h
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
##  @class   vtkImageSlab
##  @brief   combine image slices to form a slab image
##
##  vtkImageSlab will combine all of the slices of an image to
##  create a single slice.  The slices can be combined with the
##  following operations: averaging, summation, minimum, maximum.
##  If you require an arbitrary angle of projection, you can use
##  vtkImageReslice.
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

## !!!Ignored construct:  # vtkImageSlab_h [NewLine] # vtkImageSlab_h [NewLine] # vtkImagingGeneralModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageSlab : public vtkThreadedImageAlgorithm { public : static vtkImageSlab * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageSlab :: IsTypeOf ( type ) ; } static vtkImageSlab * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageSlab * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageSlab * NewInstance ( ) const { return vtkImageSlab :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSlab :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSlab :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the slice direction: zero for x, 1 for y, 2 for z.
##  The default is the Z direction.
##  virtual void SetOrientation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Orientation  to  << _arg ) ; if ( this -> Orientation != ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ) { this -> Orientation = ( _arg < 0 ? 0 : ( _arg > 2 ? 2 : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOrientationMinValue ( ) { return 0 ; } virtual int GetOrientationMaxValue ( ) { return 2 ; } ; void SetOrientationToX ( ) { this -> SetOrientation ( 0 ) ; } void SetOrientationToY ( ) { this -> SetOrientation ( 1 ) ; } void SetOrientationToZ ( ) { this -> SetOrientation ( 2 ) ; } virtual int GetOrientation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Orientation  of  << this -> Orientation ) ; return this -> Orientation ; } ; /@} /@{ *
##  Set the range of slices to combine. The default is to project
##  through all slices.
##  virtual void SetSliceRange ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SliceRange  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> SliceRange [ 0 ] != _arg1 ) || ( this -> SliceRange [ 1 ] != _arg2 ) ) { this -> SliceRange [ 0 ] = _arg1 ; this -> SliceRange [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetSliceRange ( const int _arg [ 2 ] ) { this -> SetSliceRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetSliceRange ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SliceRange  pointer  << this -> SliceRange ) ; return this -> SliceRange ; } VTK_WRAPEXCLUDE virtual void GetSliceRange ( int & _arg1 , int & _arg2 ) { _arg1 = this -> SliceRange [ 0 ] ; _arg2 = this -> SliceRange [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SliceRange  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSliceRange ( int _arg [ 2 ] ) { this -> GetSliceRange ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@} /@{ *
##  Set the operation to use when combining slices.  The choices are
##  "Mean", "Sum", "Min", "Max".  The default is "Mean".
##  virtual void SetOrientationOperation ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Operation  to  << _arg ) ; if ( this -> Operation != ( _arg < VTK_IMAGE_SLAB_MIN ? VTK_IMAGE_SLAB_MIN : ( _arg > VTK_IMAGE_SLAB_SUM ? VTK_IMAGE_SLAB_SUM : _arg ) ) ) { this -> Operation = ( _arg < VTK_IMAGE_SLAB_MIN ? VTK_IMAGE_SLAB_MIN : ( _arg > VTK_IMAGE_SLAB_SUM ? VTK_IMAGE_SLAB_SUM : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOrientationMinValueOperationMinValue ( ) { return VTK_IMAGE_SLAB_MIN ; } virtual int GetOrientationMaxValueOperationMaxValue ( ) { return VTK_IMAGE_SLAB_SUM ; } ; void SetOperationToMin ( ) { this -> SetOperation ( VTK_IMAGE_SLAB_MIN ) ; } void SetOperationToMax ( ) { this -> SetOperation ( VTK_IMAGE_SLAB_MAX ) ; } void SetOperationToMean ( ) { this -> SetOperation ( VTK_IMAGE_SLAB_MEAN ) ; } void SetOperationToSum ( ) { this -> SetOperation ( VTK_IMAGE_SLAB_SUM ) ; } virtual int GetOrientationOperation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Operation  of  << this -> Operation ) ; return this -> Operation ; } ; const char * GetOperationAsString ( ) ; /@} /@{ *
##  Use trapezoid integration for slab computation.  This weighs the
##  first and last slices by half when doing sum and mean, as compared
##  to the default midpoint integration that weighs all slices equally.
##  It is off by default.
##  virtual void SetTrapezoidIntegration ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  TrapezoidIntegration  to  << _arg ) ; if ( this -> TrapezoidIntegration != _arg ) { this -> TrapezoidIntegration = _arg ; this -> Modified ( ) ; } } ; virtual void TrapezoidIntegrationOn ( ) { this -> SetTrapezoidIntegration ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void TrapezoidIntegrationOff ( ) { this -> SetTrapezoidIntegration ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetOrientationOperationTrapezoidIntegration ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TrapezoidIntegration  of  << this -> TrapezoidIntegration ) ; return this -> TrapezoidIntegration ; } ; /@} /@{ *
##  Turn on multi-slice output.  Each slice of the output will be
##  a projection through the specified range of input slices, e.g.
##  if the SliceRange is [0,3] then slice 'i' of the output will
##  be a projection through slices 'i' through '3+i' of the input.
##  This flag is off by default.
##  virtual void SetTrapezoidIntegrationMultiSliceOutput ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MultiSliceOutput  to  << _arg ) ; if ( this -> MultiSliceOutput != _arg ) { this -> MultiSliceOutput = _arg ; this -> Modified ( ) ; } } ; virtual void MultiSliceOutputOn ( ) { this -> SetTrapezoidIntegrationMultiSliceOutput ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void MultiSliceOutputOff ( ) { this -> SetTrapezoidIntegrationMultiSliceOutput ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetOrientationOperationTrapezoidIntegrationMultiSliceOutput ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MultiSliceOutput  of  << this -> MultiSliceOutput ) ; return this -> MultiSliceOutput ; } ; /@} /@{ *
##  Set the output scalar type to float or double, to avoid
##  potential overflow when doing a summation operation.
##  The default is to use the scalar type of the input data,
##  and clamp the output to the range of the input scalar type.
##  void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } void SetOutputScalarTypeToInputScalarType ( ) { this -> SetOutputScalarType ( 0 ) ; } virtual int GetOrientationOperationTrapezoidIntegrationMultiSliceOutputOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; /@} protected : vtkImageSlab ( ) ; ~ vtkImageSlab ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int ext [ 6 ] , int id ) override ; virtual void SetTrapezoidIntegrationMultiSliceOutputOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != _arg ) { this -> OutputScalarType = _arg ; this -> Modified ( ) ; } } ; int Operation ; int Orientation ; int SliceRange [ 2 ] ; int OutputScalarType ; vtkTypeBool MultiSliceOutput ; vtkTypeBool TrapezoidIntegration ; private : vtkImageSlab ( const vtkImageSlab & ) = delete ; void operator = ( const vtkImageSlab & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
