## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageBSplineCoefficients.h
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
##  @class   vtkImageBSplineCoefficients
##  @brief   convert image to b-spline knots
##
##  vtkImageBSplineCoefficients prepares an image for b-spline
##  interpolation by converting the image values into b-spline
##  knot coefficients.  It is a necessary pre-filtering step
##  before applying b-spline interpolation with vtkImageReslice.
##
##  This class is based on code provided by Philippe Thevenaz of
##  EPFL, Lausanne, Switzerland.  Please acknowledge his contribution
##  by citing the following paper:
##  [1] P. Thevenaz, T. Blu, M. Unser, "Interpolation Revisited,"
##      IEEE Transactions on Medical Imaging 19(7):739-758, 2000.
##
##  The clamped boundary condition (which is the default) is taken
##  from code presented in the following paper:
##  [2] D. Ruijters, P. Thevenaz,
##      "GPU Prefilter for Accurate Cubic B-spline Interpolation,"
##      The Computer Journal, doi: 10.1093/comjnl/bxq086, 2010.
##
##  @par Thanks:
##  This class was written by David Gobbi at the Seaman Family MR Research
##  Centre, Foothills Medical Centre, Calgary, Alberta.
##  DG Gobbi and YP Starreveld,
##  "Uniform B-Splines for the VTK Imaging Pipeline,"
##  VTK Journal, 2011,
##  http://hdl.handle.net/10380/3252
##

## !!!Ignored construct:  # vtkImageBSplineCoefficients_h [NewLine] # vtkImageBSplineCoefficients_h [NewLine] # vtkImageBSplineInterpolator.h  for constants # vtkImagingCoreModule.h  For export macro # vtkThreadedImageAlgorithm.h [NewLine] class VTKIMAGINGCORE_EXPORT vtkImageBSplineCoefficients : public vtkThreadedImageAlgorithm { public : static vtkImageBSplineCoefficients * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkThreadedImageAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkThreadedImageAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageBSplineCoefficients :: IsTypeOf ( type ) ; } static vtkImageBSplineCoefficients * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageBSplineCoefficients * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageBSplineCoefficients * NewInstance ( ) const { return vtkImageBSplineCoefficients :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkThreadedImageAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageBSplineCoefficients :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageBSplineCoefficients :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the degree of the spline polynomial.  The default value is 3,
##  and the maximum is 9.
##  virtual void SetSplineDegree ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << SplineDegree  to  << _arg ) ; if ( this -> SplineDegree != ( _arg < 0 ? 0 : ( _arg > VTK_IMAGE_BSPLINE_DEGREE_MAX ? VTK_IMAGE_BSPLINE_DEGREE_MAX : _arg ) ) ) { this -> SplineDegree = ( _arg < 0 ? 0 : ( _arg > VTK_IMAGE_BSPLINE_DEGREE_MAX ? VTK_IMAGE_BSPLINE_DEGREE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSplineDegreeMinValue ( ) { return 0 ; } virtual int GetSplineDegreeMaxValue ( ) { return VTK_IMAGE_BSPLINE_DEGREE_MAX ; } ; virtual int GetSplineDegree ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SplineDegree  of  << this -> SplineDegree ) ; return this -> SplineDegree ; } ; /@} /@{ *
##  Set the border mode.  The filter that is used to create the
##  coefficients must repeat the image somehow to make a theoritically
##  infinite input.  The default is to clamp values that are off the
##  edge of the image, to the value at the closest point on the edge.
##  The other ways of virtually extending the image are to produce
##  mirrored copies, which results in optimal smoothness at the boundary,
##  or to repeat the image, which results in a cyclic or periodic spline.
##  virtual void SetSplineDegreeBorderMode ( vtkImageBorderMode _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BorderMode  to  << _arg ) ; if ( this -> BorderMode != ( _arg < VTK_IMAGE_BORDER_CLAMP ? VTK_IMAGE_BORDER_CLAMP : ( _arg > VTK_IMAGE_BORDER_MIRROR ? VTK_IMAGE_BORDER_MIRROR : _arg ) ) ) { this -> BorderMode = ( _arg < VTK_IMAGE_BORDER_CLAMP ? VTK_IMAGE_BORDER_CLAMP : ( _arg > VTK_IMAGE_BORDER_MIRROR ? VTK_IMAGE_BORDER_MIRROR : _arg ) ) ; this -> Modified ( ) ; } } virtual vtkImageBorderMode GetSplineDegreeMinValueBorderModeMinValue ( ) { return VTK_IMAGE_BORDER_CLAMP ; } virtual vtkImageBorderMode GetSplineDegreeMaxValueBorderModeMaxValue ( ) { return VTK_IMAGE_BORDER_MIRROR ; } ; void SetBorderModeToClamp ( ) { this -> SetBorderMode ( VTK_IMAGE_BORDER_CLAMP ) ; } void SetBorderModeToRepeat ( ) { this -> SetBorderMode ( VTK_IMAGE_BORDER_REPEAT ) ; } void SetBorderModeToMirror ( ) { this -> SetBorderMode ( VTK_IMAGE_BORDER_MIRROR ) ; } virtual vtkImageBorderMode GetSplineDegreeBorderMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BorderMode  of  << this -> BorderMode ) ; return this -> BorderMode ; } ; const char * GetBorderModeAsString ( ) ; /@} /@{ *
##  Set the scalar type of the output.  Default is float.
##  Floating-point output is used to avoid overflow, since the
##  range of the output values is larger than the input values.
##  virtual void SetSplineDegreeBorderModeOutputScalarType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutputScalarType  to  << _arg ) ; if ( this -> OutputScalarType != ( _arg < VTK_FLOAT ? VTK_FLOAT : ( _arg > VTK_DOUBLE ? VTK_DOUBLE : _arg ) ) ) { this -> OutputScalarType = ( _arg < VTK_FLOAT ? VTK_FLOAT : ( _arg > VTK_DOUBLE ? VTK_DOUBLE : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetSplineDegreeMinValueBorderModeMinValueOutputScalarTypeMinValue ( ) { return VTK_FLOAT ; } virtual int GetSplineDegreeMaxValueBorderModeMaxValueOutputScalarTypeMaxValue ( ) { return VTK_DOUBLE ; } ; virtual int GetSplineDegreeBorderModeOutputScalarType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutputScalarType  of  << this -> OutputScalarType ) ; return this -> OutputScalarType ; } ; void SetOutputScalarTypeToFloat ( ) { this -> SetOutputScalarType ( VTK_FLOAT ) ; } void SetOutputScalarTypeToDouble ( ) { this -> SetOutputScalarType ( VTK_DOUBLE ) ; } const char * GetOutputScalarTypeAsString ( ) ; /@} /@{ *
##  Bypass the filter, do not do any processing.  If this is on,
##  then the output data will reference the input data directly,
##  and the output type will be the same as the input type.  This
##  is useful a downstream filter sometimes uses b-spline interpolation
##  and sometimes uses other forms of interpolation.
##  virtual void SetBypass ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Bypass  to  << _arg ) ; if ( this -> Bypass != _arg ) { this -> Bypass = _arg ; this -> Modified ( ) ; } } ; virtual void BypassOn ( ) { this -> SetBypass ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void BypassOff ( ) { this -> SetBypass ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetSplineDegreeBorderModeOutputScalarTypeBypass ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Bypass  of  << this -> Bypass ) ; return this -> Bypass ; } ; /@} *
##  Check a point against the image bounds.  Return 0 if out of bounds,
##  and 1 if inside bounds.  Calling Evaluate on a point outside the
##  bounds will not generate an error, but the value returned will
##  depend on the BorderMode.
##  int CheckBounds ( const double point [ 3 ] ) ; /@{ *
##  Interpolate a value from the image.  You must call Update() before
##  calling this method for the first time.  The first signature can
##  return multiple components, while the second signature is for use
##  on single-component images.
##  void Evaluate ( const double point [ 3 ] , double * value ) ; double Evaluate ( double x , double y , double z ) ; double Evaluate ( const double point [ 3 ] ) { return this -> Evaluate ( point [ 0 ] , point [ 1 ] , point [ 2 ] ) ; } /@} protected : vtkImageBSplineCoefficients ( ) ; ~ vtkImageBSplineCoefficients ( ) override ; void AllocateOutputData ( vtkImageData * out , vtkInformation * outInfo , int * uExtent ) override ; vtkImageData * AllocateOutputData ( vtkDataObject * out , vtkInformation * outInfo ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void ThreadedExecute ( vtkImageData * inData , vtkImageData * outData , int outExt [ 6 ] , int threadId ) override ; int SplineDegree ; vtkImageBorderMode BorderMode ; int OutputScalarType ; vtkTypeBool Bypass ; int DataWasPassed ; int Iteration ; private : vtkImageBSplineCoefficients ( const vtkImageBSplineCoefficients & ) = delete ; void operator = ( const vtkImageBSplineCoefficients & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
