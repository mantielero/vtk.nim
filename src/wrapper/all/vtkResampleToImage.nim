## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkResampleToImage.h
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
##  @class   vtkResampleToImage
##  @brief   sample dataset on a uniform grid
##
##  vtkPResampleToImage is a filter that resamples the input dataset on
##  a uniform grid. It internally uses vtkProbeFilter to do the probing.
##  @sa
##  vtkProbeFilter
##

## !!!Ignored construct:  # vtkResampleToImage_h [NewLine] # vtkResampleToImage_h [NewLine] # vtkAlgorithm.h [NewLine] # vtkFiltersCoreModule.h  For export macro # vtkNew.h  For vtkCompositeDataProbeFilter member variable [NewLine] class vtkDataObject ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkImageData"
## !!!Ignored construct:  class VTKFILTERSCORE_EXPORT vtkResampleToImage : public vtkAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkResampleToImage :: IsTypeOf ( type ) ; } static vtkResampleToImage * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkResampleToImage * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkResampleToImage * NewInstance ( ) const { return vtkResampleToImage :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkResampleToImage :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkResampleToImage :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkResampleToImage * New ( ) ; /@{ *
##  Set/Get if the filter should use Input bounds to sub-sample the data.
##  By default it is set to 1.
##  virtual void SetUseInputBounds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseInputBounds  to  << _arg ) ; if ( this -> UseInputBounds != _arg ) { this -> UseInputBounds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseInputBounds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseInputBounds  of  << this -> UseInputBounds ) ; return this -> UseInputBounds ; } ; virtual void UseInputBoundsOn ( ) { this -> SetUseInputBounds ( static_cast < bool > ( 1 ) ) ; } virtual void UseInputBoundsOff ( ) { this -> SetUseInputBounds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get sampling bounds. If (UseInputBounds == 1) then the sampling
##  bounds won't be used.
##  virtual void SetSamplingBounds ( double _arg1 , double _arg2 , double _arg3 , double _arg4 , double _arg5 , double _arg6 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SamplingBounds  to ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; if ( ( this -> SamplingBounds [ 0 ] != _arg1 ) || ( this -> SamplingBounds [ 1 ] != _arg2 ) || ( this -> SamplingBounds [ 2 ] != _arg3 ) || ( this -> SamplingBounds [ 3 ] != _arg4 ) || ( this -> SamplingBounds [ 4 ] != _arg5 ) || ( this -> SamplingBounds [ 5 ] != _arg6 ) ) { this -> SamplingBounds [ 0 ] = _arg1 ; this -> SamplingBounds [ 1 ] = _arg2 ; this -> SamplingBounds [ 2 ] = _arg3 ; this -> SamplingBounds [ 3 ] = _arg4 ; this -> SamplingBounds [ 4 ] = _arg5 ; this -> SamplingBounds [ 5 ] = _arg6 ; this -> Modified ( ) ; } } virtual void SetSamplingBounds ( const double _arg [ 6 ] ) { this -> SetSamplingBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; virtual double * GetSamplingBounds ( ) VTK_SIZEHINT ( 6 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SamplingBounds  pointer  << this -> SamplingBounds ) ; return this -> SamplingBounds ; } VTK_WRAPEXCLUDE virtual void GetSamplingBounds ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 , double & _arg5 , double & _arg6 ) { _arg1 = this -> SamplingBounds [ 0 ] ; _arg2 = this -> SamplingBounds [ 1 ] ; _arg3 = this -> SamplingBounds [ 2 ] ; _arg4 = this -> SamplingBounds [ 3 ] ; _arg5 = this -> SamplingBounds [ 4 ] ; _arg6 = this -> SamplingBounds [ 5 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SamplingBounds  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << , << _arg5 << , << _arg6 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSamplingBounds ( double _arg [ 6 ] ) { this -> GetSamplingBounds ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] , _arg [ 4 ] , _arg [ 5 ] ) ; } ; /@} /@{ *
##  Set/Get sampling dimension along each axis. Default will be [10,10,10]
##  virtual void SetSamplingDimensions ( int _arg1 , int _arg2 , int _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << SamplingDimensions  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> SamplingDimensions [ 0 ] != _arg1 ) || ( this -> SamplingDimensions [ 1 ] != _arg2 ) || ( this -> SamplingDimensions [ 2 ] != _arg3 ) ) { this -> SamplingDimensions [ 0 ] = _arg1 ; this -> SamplingDimensions [ 1 ] = _arg2 ; this -> SamplingDimensions [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSamplingDimensions ( const int _arg [ 3 ] ) { this -> SetSamplingDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual int * GetSamplingDimensions ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SamplingDimensions  pointer  << this -> SamplingDimensions ) ; return this -> SamplingDimensions ; } VTK_WRAPEXCLUDE virtual void GetSamplingDimensions ( int & _arg1 , int & _arg2 , int & _arg3 ) { _arg1 = this -> SamplingDimensions [ 0 ] ; _arg2 = this -> SamplingDimensions [ 1 ] ; _arg3 = this -> SamplingDimensions [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SamplingDimensions  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSamplingDimensions ( int _arg [ 3 ] ) { this -> GetSamplingDimensions ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} *
##  Get the output data for this algorithm.
##  vtkImageData * GetOutput ( ) ; *
##  Get the name of the valid-points mask array.
##  const char * GetMaskArrayName ( ) const ; protected : vtkResampleToImage ( ) ; ~ vtkResampleToImage ( ) override ;  Usual data generation method vtkTypeBool ProcessRequest ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; virtual int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; virtual int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; virtual int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) ; int FillInputPortInformation ( int , vtkInformation * ) override ; int FillOutputPortInformation ( int , vtkInformation * ) override ; *
##  Resample input vtkDataObject to a vtkImageData with the specified bounds
##  and extent.
##  void PerformResampling ( vtkDataObject * input , const double samplingBounds [ 6 ] , bool computeProbingExtent , const double inputBounds [ 6 ] , vtkImageData * output ) ; *
##  Mark invalid points and cells of vtkImageData as hidden
##  void SetBlankPointsAndCells ( vtkImageData * data ) ; *
##  Helper function to compute the bounds of the given vtkDataSet or
##  vtkCompositeDataSet
##  static void ComputeDataBounds ( vtkDataObject * data , double bounds [ 6 ] ) ; bool UseInputBounds ; double SamplingBounds [ 6 ] ; int SamplingDimensions [ 3 ] ; private : vtkResampleToImage ( const vtkResampleToImage & ) = delete ; void operator = ( const vtkResampleToImage & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
