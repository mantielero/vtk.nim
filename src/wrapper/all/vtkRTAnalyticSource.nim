## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRTAnalyticSource.h
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
##  @class   vtkRTAnalyticSource
##  @brief   Create an image for regression testing
##
##  vtkRTAnalyticSource just produces images with pixel values determined
##  by a Maximum*Gaussian*XMag*sin(XFreq*x)*sin(YFreq*y)*cos(ZFreq*z)
##  Values are float scalars on point data with name "RTData".
##

## !!!Ignored construct:  # vtkRTAnalyticSource_h [NewLine] # vtkRTAnalyticSource_h [NewLine] # vtkImageAlgorithm.h [NewLine] # vtkImagingCoreModule.h  For export macro [NewLine] class VTKIMAGINGCORE_EXPORT vtkRTAnalyticSource : public vtkImageAlgorithm { public : static vtkRTAnalyticSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkRTAnalyticSource :: IsTypeOf ( type ) ; } static vtkRTAnalyticSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkRTAnalyticSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkRTAnalyticSource * NewInstance ( ) const { return vtkRTAnalyticSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRTAnalyticSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRTAnalyticSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the extent of the whole output image. Initial value is
##  {-10,10,-10,10,-10,10}
##  void SetWholeExtent ( int xMinx , int xMax , int yMin , int yMax , int zMin , int zMax ) ; virtual int * GetWholeExtent ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  pointer  << this -> WholeExtent ) ; return this -> WholeExtent ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int & _arg1 , int & _arg2 , int & _arg3 , int & _arg4 , int & _arg5 , int & _arg6 ) { _arg1 = this -> WholeExtent [ 0 ] ; _arg2 = this -> WholeExtent [ 1 ] ; _arg3 = this -> WholeExtent [ 2 ] ; _arg4 = this -> WholeExtent [ 3 ] ; _arg5 = this -> WholeExtent [ 4 ] ; _arg6 = this -> WholeExtent [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << WholeExtent  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetWholeExtent ( int _arg [ 6 ] ) { this -> GetWholeExtent ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Set/Get the center of function. Initial value is {0.0,0.0,0.0}
##  virtual void SetCenter ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Center  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Center [ 0 ] != _arg1 ) || ( this -> Center [ 1 ] != _arg2 ) || ( this -> Center [ 2 ] != _arg3 ) ) { this -> Center [ 0 ] = _arg1 ; this -> Center [ 1 ] = _arg2 ; this -> Center [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetCenter ( const double _arg [ 3 ] ) { this -> SetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetCenter ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Center  pointer  << this -> Center ) ; return this -> Center ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Center [ 0 ] ; _arg2 = this -> Center [ 1 ] ; _arg3 = this -> Center [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Center  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetCenter ( double _arg [ 3 ] ) { this -> GetCenter ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set/Get the Maximum value of the function. Initial value is 255.0.
##  virtual void SetMaximum ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Maximum  to  << _arg ) ; if ( this -> Maximum != _arg ) { this -> Maximum = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Maximum  of  << this -> Maximum ) ; return this -> Maximum ; } ; /@} /@{ *
##  Set/Get the standard deviation of the function. Initial value is 0.5.
##  virtual void SetMaximumStandardDeviation ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  StandardDeviation  to  << _arg ) ; if ( this -> StandardDeviation != _arg ) { this -> StandardDeviation = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviation ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << StandardDeviation  of  << this -> StandardDeviation ) ; return this -> StandardDeviation ; } ; /@} /@{ *
##  Set/Get the natural frequency in x. Initial value is 60.
##  virtual void SetMaximumStandardDeviationXFreq ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  XFreq  to  << _arg ) ; if ( this -> XFreq != _arg ) { this -> XFreq = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviationXFreq ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XFreq  of  << this -> XFreq ) ; return this -> XFreq ; } ; /@} /@{ *
##  Set/Get the natural frequency in y. Initial value is 30.
##  virtual void SetMaximumStandardDeviationXFreqYFreq ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  YFreq  to  << _arg ) ; if ( this -> YFreq != _arg ) { this -> YFreq = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviationXFreqYFreq ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YFreq  of  << this -> YFreq ) ; return this -> YFreq ; } ; /@} /@{ *
##  Set/Get the natural frequency in z. Initial value is 40.
##  virtual void SetMaximumStandardDeviationXFreqYFreqZFreq ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ZFreq  to  << _arg ) ; if ( this -> ZFreq != _arg ) { this -> ZFreq = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviationXFreqYFreqZFreq ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZFreq  of  << this -> ZFreq ) ; return this -> ZFreq ; } ; /@} /@{ *
##  Set/Get the magnitude in x. Initial value is 10.
##  virtual void SetMaximumStandardDeviationXFreqYFreqZFreqXMag ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  XMag  to  << _arg ) ; if ( this -> XMag != _arg ) { this -> XMag = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviationXFreqYFreqZFreqXMag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XMag  of  << this -> XMag ) ; return this -> XMag ; } ; /@} /@{ *
##  Set/Get the magnitude in y. Initial value is 18.
##  virtual void SetMaximumStandardDeviationXFreqYFreqZFreqXMagYMag ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  YMag  to  << _arg ) ; if ( this -> YMag != _arg ) { this -> YMag = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviationXFreqYFreqZFreqXMagYMag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << YMag  of  << this -> YMag ) ; return this -> YMag ; } ; /@} /@{ *
##  Set/Get the magnitude in z. Initial value is 5.
##  virtual void SetMaximumStandardDeviationXFreqYFreqZFreqXMagYMagZMag ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ZMag  to  << _arg ) ; if ( this -> ZMag != _arg ) { this -> ZMag = _arg ; this -> Modified ( ) ; } } ; virtual double GetMaximumStandardDeviationXFreqYFreqZFreqXMagYMagZMag ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ZMag  of  << this -> ZMag ) ; return this -> ZMag ; } ; /@} /@{ *
##  Set/Get the sub-sample rate. Initial value is 1.
##  virtual void SetMaximumStandardDeviationXFreqYFreqZFreqXMagYMagZMagSubsampleRate ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SubsampleRate  to  << _arg ) ; if ( this -> SubsampleRate != _arg ) { this -> SubsampleRate = _arg ; this -> Modified ( ) ; } } ; virtual int GetMaximumStandardDeviationXFreqYFreqZFreqXMagYMagZMagSubsampleRate ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubsampleRate  of  << this -> SubsampleRate ) ; return this -> SubsampleRate ; } ; /@} protected : *
##  Default constructor. Initial values are:
##  Maximum=255.0, Center[3]={0.0,0.0,0.0}, WholeExtent={-10,10,-10,10,-10,10}
##  StandardDeviation=0.5, XFreq=60, XMag=10, YFreq=30, YMag=18, ZFreq=40,
##  ZMag=5, SubsampleRate=1
##  vtkRTAnalyticSource ( ) ; *
##  Destructor.
##  ~ vtkRTAnalyticSource ( ) override = default ; double XFreq ; double YFreq ; double ZFreq ; double XMag ; double YMag ; double ZMag ; double StandardDeviation ; int WholeExtent [ 6 ] ; double Center [ 3 ] ; double Maximum ; int SubsampleRate ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; void ExecuteDataWithInformation ( vtkDataObject * data , vtkInformation * outInfo ) override ; private : vtkRTAnalyticSource ( const vtkRTAnalyticSource & ) = delete ; void operator = ( const vtkRTAnalyticSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
