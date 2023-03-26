## =========================================================================
##
##  Program:   Visualization Toolkit
##  Module:    vtkAMRGaussianPulseSource.h
##
##  Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##  All rights reserved.
##  See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##  This software is distributed WITHOUT ANY WARRANTY; without even
##  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##  PURPOSE.  See the above copyright notice for more information.
##
##  =========================================================================
## *
##  @class   vtkAMRGaussianPulseSource
##
##
##   A source that generates sample AMR data with gaussian pulse field. The user
##   can control the refinement ratio as well as the pulse attributes such as
##   the pulse origin, length and amplitude.
##
##  @sa
##   vtkOverlappingAMR
##

## !!!Ignored construct:  # vtkAMRGaussianPulseSource_h [NewLine] # vtkAMRGaussianPulseSource_h [NewLine] # vtkFiltersAMRModule.h  For export macro # vtkOverlappingAMRAlgorithm.h [NewLine] # < cmath >  For std::exp [NewLine] class vtkOverlappingAMR ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUniformGrid"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
## !!!Ignored construct:  class VTKFILTERSAMR_EXPORT vtkAMRGaussianPulseSource : public vtkOverlappingAMRAlgorithm { public : static vtkAMRGaussianPulseSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkOverlappingAMRAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkOverlappingAMRAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAMRGaussianPulseSource :: IsTypeOf ( type ) ; } static vtkAMRGaussianPulseSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAMRGaussianPulseSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAMRGaussianPulseSource * NewInstance ( ) const { return vtkAMRGaussianPulseSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkOverlappingAMRAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAMRGaussianPulseSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAMRGaussianPulseSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Sets the dimension of the AMR dataset to generate
##  virtual void SetDimension ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Dimension  to  << _arg ) ; if ( this -> Dimension != _arg ) { this -> Dimension = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Sets the number of levels to generate
##  virtual void SetDimensionNumberOfLevels ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  NumberOfLevels  to  << _arg ) ; if ( this -> NumberOfLevels != _arg ) { this -> NumberOfLevels = _arg ; this -> Modified ( ) ; } } ; /@} *
##  Set the refinement ratio
##  void SetRefinementRatio ( int r ) { this -> RefinmentRatio = r ; this -> Modified ( ) ; } /@{ *
##  Set the root spacing
##  void SetRootSpacing ( double h0 ) { this -> RootSpacing [ 0 ] = this -> RootSpacing [ 1 ] = this -> RootSpacing [ 2 ] = h0 ; this -> Modified ( ) ; } /@} /@{ *
##  Set & Get macro for the pulse origin
##  virtual void SetPulseOrigin ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << PulseOrigin  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> PulseOrigin [ 0 ] != _arg1 ) || ( this -> PulseOrigin [ 1 ] != _arg2 ) || ( this -> PulseOrigin [ 2 ] != _arg3 ) ) { this -> PulseOrigin [ 0 ] = _arg1 ; this -> PulseOrigin [ 1 ] = _arg2 ; this -> PulseOrigin [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPulseOrigin ( const double _arg [ 3 ] ) { this -> SetPulseOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPulseOrigin ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PulseOrigin  pointer  << this -> PulseOrigin ) ; return this -> PulseOrigin ; } VTK_WRAPEXCLUDE virtual void GetPulseOrigin ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PulseOrigin [ 0 ] ; _arg2 = this -> PulseOrigin [ 1 ] ; _arg3 = this -> PulseOrigin [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PulseOrigin  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPulseOrigin ( double _arg [ 3 ] ) { this -> GetPulseOrigin ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; void SetXPulseOrigin ( double f ) { this -> PulseOrigin [ 0 ] = f ; this -> Modified ( ) ; } void SetYPulseOrigin ( double f ) { this -> PulseOrigin [ 1 ] = f ; this -> Modified ( ) ; } void SetZPulseOrigin ( double f ) { this -> PulseOrigin [ 2 ] = f ; this -> Modified ( ) ; } /@} /@{ *
##  Set & Get macro for the pulse width
##  virtual void SetPulseOriginPulseWidth ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << PulseWidth  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> PulseWidth [ 0 ] != _arg1 ) || ( this -> PulseWidth [ 1 ] != _arg2 ) || ( this -> PulseWidth [ 2 ] != _arg3 ) ) { this -> PulseWidth [ 0 ] = _arg1 ; this -> PulseWidth [ 1 ] = _arg2 ; this -> PulseWidth [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetPulseOriginPulseWidth ( const double _arg [ 3 ] ) { this -> SetPulseOriginPulseWidth ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetPulseOriginPulseWidth ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << PulseWidth  pointer  << this -> PulseWidth ) ; return this -> PulseWidth ; } VTK_WRAPEXCLUDE virtual void GetPulseOriginPulseWidth ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> PulseWidth [ 0 ] ; _arg2 = this -> PulseWidth [ 1 ] ; _arg3 = this -> PulseWidth [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << PulseWidth  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetPulseOriginPulseWidth ( double _arg [ 3 ] ) { this -> GetPulseOriginPulseWidth ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; void SetXPulseWidth ( double f ) { this -> PulseWidth [ 0 ] = f ; this -> Modified ( ) ; } void SetYPulseWidth ( double f ) { this -> PulseWidth [ 1 ] = f ; this -> Modified ( ) ; } void SetZPulseWidth ( double f ) { this -> PulseWidth [ 2 ] = f ; this -> Modified ( ) ; } /@} /@{ *
##  Set & Get macro for the pulse amplitude
##  virtual void SetDimensionNumberOfLevelsPulseAmplitude ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PulseAmplitude  to  << _arg ) ; if ( this -> PulseAmplitude != _arg ) { this -> PulseAmplitude = _arg ; this -> Modified ( ) ; } } ; virtual double GetPulseAmplitude ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PulseAmplitude  of  << this -> PulseAmplitude ) ; return this -> PulseAmplitude ; } ; /@} protected : vtkAMRGaussianPulseSource ( ) ; ~ vtkAMRGaussianPulseSource ( ) override ; *
##  This is called by the superclass.
##  This is the method you should override.
##  int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; /@{ *
##  Computes the gaussian pulse at the given location based on the user
##  supplied parameters for pulse width and origin.
##  double ComputePulseAt ( const double x , const double y , const double z ) { double xyz [ 3 ] ; xyz [ 0 ] = x ; xyz [ 1 ] = y ; xyz [ 2 ] = z ; return ( this -> ComputePulseAt ( xyz ) ) ; } double ComputePulseAt ( double pt [ 3 ] ) { double pulse = 0.0 ; double r = 0.0 ; for ( int i = 0 ; i < this -> Dimension ; ++ i ) { double d = pt [ i ] - this -> PulseOrigin [ i ] ; double d2 = d * d ; double L2 = this -> PulseWidth [ i ] * this -> PulseWidth [ i ] ; r += d2 / L2 ; } pulse = this -> PulseAmplitude * std :: exp ( - r ) ; return ( pulse ) ; } /@} *
##  Given the cell index w.r.t. to a uniform grid, this method computes the
##  cartesian coordinates of the centroid of the cell.
##  void ComputeCellCenter ( vtkUniformGrid * grid , vtkIdType cellIdx , double centroid [ 3 ] ) ; *
##  Generates a pulse field for the given uniform grid
##  void GeneratePulseField ( vtkUniformGrid * grid ) ; *
##  Constructs a uniform grid path with the given origin/spacing and node
##  dimensions. The return grid serves as the root grid for the domain.
##  vtkUniformGrid * GetGrid ( double origin [ 3 ] , double h [ 3 ] , int ndim [ 3 ] ) ; *
##  Constructs a refined patch from the given parent grid.
##  vtkUniformGrid * RefinePatch ( vtkUniformGrid * parent , int patchExtent [ 6 ] ) ; /@{ *
##  Generate 2-D or 3-D DataSet
##  void Generate2DDataSet ( vtkOverlappingAMR * amr ) ; void Generate3DDataSet ( vtkOverlappingAMR * amr ) ; /@} double RootSpacing [ 3 ] ; double PulseOrigin [ 3 ] ; double PulseWidth [ 3 ] ; double PulseAmplitude ; int RefinmentRatio ; int Dimension ; int NumberOfLevels ; private : vtkAMRGaussianPulseSource ( const vtkAMRGaussianPulseSource & ) = delete ; void operator = ( const vtkAMRGaussianPulseSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
