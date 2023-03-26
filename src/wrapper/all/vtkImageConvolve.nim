## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageConvolve.h
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
##  @class   vtkImageConvolve
##  @brief   Convolution of an image with a kernel.
##
##  vtkImageConvolve convolves the image with a 3D NxNxN kernel or a
##  2D NxN kernel.  The output image is cropped to the same size as
##  the input.
##

## !!!Ignored construct:  # vtkImageConvolve_h [NewLine] # vtkImageConvolve_h [NewLine] # vtkImagingGeneralModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageConvolve : public vtkThreadedImageAlgorithm { public : /@{ *
##  Construct an instance of vtkImageConvolve filter.
##  static vtkImageConvolve * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageConvolve :: IsTypeOf ( type ) ; } static vtkImageConvolve * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageConvolve * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageConvolve * NewInstance ( ) const { return vtkImageConvolve :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageConvolve :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageConvolve :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Get the kernel size
##  virtual int * GetKernelSize ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << KernelSize  pointer  << this -> KernelSize ) ; return this -> KernelSize ; } VTK_WRAPEXCLUDE virtual void GetKernelSize ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> KernelSize [ 0 ] ; _arg2 = this -> KernelSize [ 1 ] ; _arg3 = this -> KernelSize [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << KernelSize  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetKernelSize ( int _arg [ 3 ] ) { this -> GetKernelSize ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set the kernel to be a given 3x3 or 5x5 or 7x7 kernel.
##  void SetKernel3x3 ( const double kernel [ 9 ] ) ; void SetKernel5x5 ( const double kernel [ 25 ] ) ; /@} void SetKernel7x7 ( const double kernel [ 49 ] ) ; /@{ *
##  Return an array that contains the kernel.
##  double * GetKernel3x3 ( ) VTK_SIZEHINT ( 9 ) ; void GetKernel3x3 ( double kernel [ 9 ] ) ; double * GetKernel5x5 ( ) VTK_SIZEHINT ( 25 ) ; void GetKernel5x5 ( double kernel [ 25 ] ) ; /@} double * GetKernel7x7 ( ) VTK_SIZEHINT ( 49 ) ; void GetKernel7x7 ( double kernel [ 49 ] ) ; *
##  Set the kernel to be a 3x3x3 or 5x5x5 or 7x7x7 kernel.
##  void SetKernel3x3x3 ( const double kernel [ 27 ] ) ; void SetKernel5x5x5 ( const double kernel [ 125 ] ) ; void SetKernel7x7x7 ( const double kernel [ 343 ] ) ; /@{ *
##  Return an array that contains the kernel
##  double * GetKernel3x3x3 ( ) VTK_SIZEHINT ( 27 ) ; void GetKernel3x3x3 ( double kernel [ 27 ] ) ; /@} double * GetKernel5x5x5 ( ) VTK_SIZEHINT ( 125 ) ; void GetKernel5x5x5 ( double kernel [ 125 ] ) ; double * GetKernel7x7x7 ( ) VTK_SIZEHINT ( 343 ) ; void GetKernel7x7x7 ( double kernel [ 343 ] ) ; protected : vtkImageConvolve ( ) ; ~ vtkImageConvolve ( ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int id ) override ; void GetKernel ( double * kernel ) ; double * GetKernel ( ) ; void SetKernel ( const double * kernel , int sizeX , int sizeY , int sizeZ ) ; int KernelSize [ 3 ] ; double Kernel [ 343 ] ; private : vtkImageConvolve ( const vtkImageConvolve & ) = delete ; void operator = ( const vtkImageConvolve & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
