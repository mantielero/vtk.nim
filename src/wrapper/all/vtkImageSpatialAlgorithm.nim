## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSpatialAlgorithm.h
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
##  @class   vtkImageSpatialAlgorithm
##  @brief   Filters that operate on pixel neighborhoods.
##
##  vtkImageSpatialAlgorithm is a super class for filters that operate on an
##  input neighborhood for each output pixel. It handles even sized
##  neighborhoods, but their can be a half pixel shift associated with
##  processing.  This superclass has some logic for handling boundaries.  It
##  can split regions into boundary and non-boundary pieces and call different
##  execute methods.
##

## !!!Ignored construct:  # vtkImageSpatialAlgorithm_h [NewLine] # vtkImageSpatialAlgorithm_h [NewLine] # vtkImagingGeneralModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGGENERAL_EXPORT vtkImageSpatialAlgorithm : public vtkThreadedImageAlgorithm { public : static vtkImageSpatialAlgorithm * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageSpatialAlgorithm :: IsTypeOf ( type ) ; } static vtkImageSpatialAlgorithm * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageSpatialAlgorithm * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageSpatialAlgorithm * NewInstance ( ) const { return vtkImageSpatialAlgorithm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSpatialAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSpatialAlgorithm :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get the Kernel size.
##  virtual int * GetKernelSize ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << KernelSize  pointer  << this -> KernelSize ) ; return this -> KernelSize ; } VTK_WRAPEXCLUDE virtual void GetKernelSize ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> KernelSize [ 0 ] ; _arg2 = this -> KernelSize [ 1 ] ; _arg3 = this -> KernelSize [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << KernelSize  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetKernelSize ( int _arg [ 3 ] ) { this -> GetKernelSize ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Get the Kernel middle.
##  virtual int * GetKernelSizeKernelMiddle ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << KernelMiddle  pointer  << this -> KernelMiddle ) ; return this -> KernelMiddle ; } VTK_WRAPEXCLUDE virtual void GetKernelSizeKernelMiddle ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> KernelMiddle [ 0 ] ; _arg2 = this -> KernelMiddle [ 1 ] ; _arg3 = this -> KernelMiddle [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << KernelMiddle  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetKernelSizeKernelMiddle ( int _arg [ 3 ] ) { this -> GetKernelSizeKernelMiddle ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkImageSpatialAlgorithm ( ) ; ~ vtkImageSpatialAlgorithm ( ) override = default ; int KernelSize [ 3 ] ; int KernelMiddle [ 3 ] ;  Index of kernel origin int HandleBoundaries ;  Output shrinks if boundaries aren't handled int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ComputeOutputWholeExtent ( int extent [ 6 ] , int handleBoundaries ) ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void InternalRequestUpdateExtent ( int * extent , int * inExtent , int * wholeExtent ) ; private : vtkImageSpatialAlgorithm ( const vtkImageSpatialAlgorithm & ) = delete ; void operator = ( const vtkImageSpatialAlgorithm & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
