## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageStencilSource.h
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
##  @class   vtkImageStencilSource
##  @brief   generate an image stencil
##
##  vtkImageStencilSource is a superclass for filters that generate image
##  stencils.  Given a clipping object such as a vtkImplicitFunction, it
##  will set up a list of clipping extents for each x-row through the
##  image data.  The extents for each x-row can be retrieved via the
##  GetNextExtent() method after the extent lists have been built
##  with the BuildExtents() method.  For large images, using clipping
##  extents is much more memory efficient (and slightly more time-efficient)
##  than building a mask.  This class can be subclassed to allow clipping
##  with objects other than vtkImplicitFunction.
##  @sa
##  vtkImplicitFunction vtkImageStencil vtkPolyDataToImageStencil
##

## !!!Ignored construct:  # vtkImageStencilSource_h [NewLine] # vtkImageStencilSource_h [NewLine] # vtkImageStencilAlgorithm.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class vtkImageStencilData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
## !!!Ignored construct:  class VTKIMAGINGCORE_EXPORT vtkImageStencilSource : public vtkImageStencilAlgorithm { public : static vtkImageStencilSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageStencilAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageStencilAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageStencilSource :: IsTypeOf ( type ) ; } static vtkImageStencilSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageStencilSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageStencilSource * NewInstance ( ) const { return vtkImageStencilSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageStencilAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageStencilSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageStencilSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set a vtkImageData that has the Spacing, Origin, and
##  WholeExtent that will be used for the stencil.  This
##  input should be set to the image that you wish to
##  apply the stencil to.  If you use this method, then
##  any values set with the SetOutputSpacing, SetOutputOrigin,
##  and SetOutputWholeExtent methods will be ignored.
##  virtual void SetInformationInput ( vtkImageData * ) ; virtual vtkImageData * GetnameInformationInput ( ) { vtkDebugWithObjectMacro ( this , <<  returning  InformationInput  address  << static_cast < vtkImageData * > ( this -> InformationInput ) ) ; return this -> InformationInput ; } ; /@} /@{ *
##  Set the Origin to be used for the stencil.  It should be
##  set to the Origin of the image you intend to apply the
##  stencil to. The default value is (0,0,0).
##  virtual void SetOutputOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputOrigin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutputOrigin [ 0 ] != _arg1 ) || ( this -> OutputOrigin [ 1 ] != _arg2 ) || ( this -> OutputOrigin [ 2 ] != _arg3 ) ) { this -> OutputOrigin [ 0 ] = _arg1 ; this -> OutputOrigin [ 1 ] = _arg2 ; this -> OutputOrigin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutputOrigin ( const double _arg [ 3 ] ) { this -> SetOutputOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOutputOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputOrigin  pointer  << this -> OutputOrigin ) ; return this -> OutputOrigin ; } VTK_WRAPEXCLUDE virtual void GetOutputOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutputOrigin [ 0 ] ; _arg2 = this -> OutputOrigin [ 1 ] ; _arg3 = this -> OutputOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputOrigin ( double _arg [ 3 ] ) { this -> GetOutputOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set the Spacing to be used for the stencil. It should be
##  set to the Spacing of the image you intend to apply the
##  stencil to. The default value is (1,1,1)
##  virtual void SetOutputOriginOutputSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputSpacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutputSpacing [ 0 ] != _arg1 ) || ( this -> OutputSpacing [ 1 ] != _arg2 ) || ( this -> OutputSpacing [ 2 ] != _arg3 ) ) { this -> OutputSpacing [ 0 ] = _arg1 ; this -> OutputSpacing [ 1 ] = _arg2 ; this -> OutputSpacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutputOriginOutputSpacing ( const double _arg [ 3 ] ) { this -> SetOutputOriginOutputSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOutputOriginOutputSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputSpacing  pointer  << this -> OutputSpacing ) ; return this -> OutputSpacing ; } VTK_WRAPEXCLUDE virtual void GetOutputOriginOutputSpacing ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutputSpacing [ 0 ] ; _arg2 = this -> OutputSpacing [ 1 ] ; _arg3 = this -> OutputSpacing [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputSpacing  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputOriginOutputSpacing ( double _arg [ 3 ] ) { this -> GetOutputOriginOutputSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set the whole extent for the stencil (anything outside
##  this extent will be considered to be "outside" the stencil).
##  virtual void SetOutputWholeExtent ( int _arg1 , int _arg2 , int _arg3 , int _arg4 , int _arg5 , int _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputWholeExtent  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> OutputWholeExtent [ 0 ] != _arg1 ) || ( this -> OutputWholeExtent [ 1 ] != _arg2 ) || ( this -> OutputWholeExtent [ 2 ] != _arg3 ) || ( this -> OutputWholeExtent [ 3 ] != _arg4 ) || ( this -> OutputWholeExtent [ 4 ] != _arg5 ) || ( this -> OutputWholeExtent [ 5 ] != _arg6 ) ) { this -> OutputWholeExtent [ 0 ] = _arg1 ; this -> OutputWholeExtent [ 1 ] = _arg2 ; this -> OutputWholeExtent [ 2 ] = _arg3 ; this -> OutputWholeExtent [ 3 ] = _arg4 ; this -> OutputWholeExtent [ 4 ] = _arg5 ; this -> OutputWholeExtent [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetOutputWholeExtent ( const int _arg [ 6 ] ) { this -> SetOutputWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual int * GetOutputWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutputWholeExtent  pointer  << this -> OutputWholeExtent ) ; return this -> OutputWholeExtent ; } VTK_WRAPEXCLUDE virtual void GetOutputWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> OutputWholeExtent [ 0 ] ; _arg2 = this -> OutputWholeExtent [ 1 ] ; _arg3 = this -> OutputWholeExtent [ 2 ] ; _arg4 = this -> OutputWholeExtent [ 3 ] ; _arg5 = this -> OutputWholeExtent [ 4 ] ; _arg6 = this -> OutputWholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutputWholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutputWholeExtent ( int _arg [ 6 ] ) { this -> GetOutputWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} *
##  Report object referenced by instances of this class.
##  void ReportReferences ( vtkGarbageCollector * ) override ; protected : vtkImageStencilSource ( ) ; ~ vtkImageStencilSource ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; vtkImageData * InformationInput ; int OutputWholeExtent [ 6 ] ; double OutputOrigin [ 3 ] ; double OutputSpacing [ 3 ] ; private : vtkImageStencilSource ( const vtkImageStencilSource & ) = delete ; void operator = ( const vtkImageStencilSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
