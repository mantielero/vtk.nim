## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageMagnify.h
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
##  @class   vtkImageMagnify
##  @brief   magnify an image by an integer value
##
##  vtkImageMagnify maps each pixel of the input onto a nxmx... region
##  of the output.  Location (0,0,...) remains in the same place. The
##  magnification occurs via pixel replication, or if Interpolate is on,
##  by bilinear interpolation. Initially, interpolation is off and magnification
##  factors are set to 1 in all directions.
##

## !!!Ignored construct:  # vtkImageMagnify_h [NewLine] # vtkImageMagnify_h [NewLine] # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageMagnify : public vtkThreadedImageAlgorithm { public : static vtkImageMagnify * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageMagnify :: IsTypeOf ( type ) ; } static vtkImageMagnify * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageMagnify * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageMagnify * NewInstance ( ) const { return vtkImageMagnify :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageMagnify :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageMagnify :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the integer magnification factors in the i-j-k directions.
##  Initially, factors are set to 1 in all directions.
##  virtual void SetMagnificationFactors ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << MagnificationFactors  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> MagnificationFactors [ 0 ] != _arg1 ) || ( this -> MagnificationFactors [ 1 ] != _arg2 ) || ( this -> MagnificationFactors [ 2 ] != _arg3 ) ) { this -> MagnificationFactors [ 0 ] = _arg1 ; this -> MagnificationFactors [ 1 ] = _arg2 ; this -> MagnificationFactors [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetMagnificationFactors ( const int _arg [ 3 ] ) { this -> SetMagnificationFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetMagnificationFactors ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFactors  pointer  << this -> MagnificationFactors ) ; return this -> MagnificationFactors ; } VTK_WRAPEXCLUDE virtual void GetMagnificationFactors ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> MagnificationFactors [ 0 ] ; _arg2 = this -> MagnificationFactors [ 1 ] ; _arg3 = this -> MagnificationFactors [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << MagnificationFactors  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetMagnificationFactors ( int _arg [ 3 ] ) { this -> GetMagnificationFactors ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Turn interpolation on and off (pixel replication is used when off).
##  Initially, interpolation is off.
##  virtual void SetInterpolate ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Interpolate  to  << _arg ) ; if ( this -> Interpolate != _arg ) { this -> Interpolate = _arg ; this -> Modified ( ) ; } } ; virtual vtkTypeBool GetInterpolate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Interpolate  of  << this -> Interpolate ) ; return this -> Interpolate ; } ; virtual void InterpolateOn ( ) { this -> SetInterpolate ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void InterpolateOff ( ) { this -> SetInterpolate ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; /@} protected : vtkImageMagnify ( ) ; ~ vtkImageMagnify ( ) override = default ; int MagnificationFactors [ 3 ] ; vtkTypeBool Interpolate ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedRequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , vtkImageData * * * inData , vtkImageData * * outData , int outExt [ 6 ] , int id ) override ; void InternalRequestUpdateExtent ( int * inExt , int * outExt ) ; private : vtkImageMagnify ( const vtkImageMagnify & ) = delete ; void operator = ( const vtkImageMagnify & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
