## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkBSplineTransform.h
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
##  @class   vtkBSplineTransform
##  @brief   a cubic b-spline deformation transformation
##
##  vtkBSplineTransform computes a cubic b-spline transformation from a
##  grid of b-spline coefficients.
##  @warning
##  The inverse grid transform is calculated using an iterative method,
##  and is several times more expensive than the forward transform.
##  @sa
##  vtkGeneralTransform vtkTransformToGrid vtkImageBSplineCoefficients
##  @par Thanks:
##  This class was written by David Gobbi at the Seaman Family MR Research
##  Centre, Foothills Medical Centre, Calgary, Alberta.
##  DG Gobbi and YP Starreveld,
##  "Uniform B-Splines for the VTK Imaging Pipeline,"
##  VTK Journal, 2011,
##  http://hdl.handle.net/10380/3252
##

## !!!Ignored construct:  # vtkBSplineTransform_h [NewLine] # vtkBSplineTransform_h [NewLine] # vtkFiltersHybridModule.h  For export macro # vtkWarpTransform.h [NewLine] class vtkAlgorithmOutput ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkBSplineTransformConnectionHolder"
discard "forward decl of vtkImageData"
const
  VTK_BSPLINE_EDGE* = 0
  VTK_BSPLINE_ZERO* = 1
  VTK_BSPLINE_ZERO_AT_BORDER* = 2

## !!!Ignored construct:  class VTKFILTERSHYBRID_EXPORT vtkBSplineTransform : public vtkWarpTransform { public : static vtkBSplineTransform * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkWarpTransform Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkWarpTransform :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkBSplineTransform :: IsTypeOf ( type ) ; } static vtkBSplineTransform * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkBSplineTransform * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkBSplineTransform * NewInstance ( ) const { return vtkBSplineTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWarpTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkBSplineTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkBSplineTransform :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set/Get the coefficient grid for the b-spline transform.
##  The vtkBSplineTransform class will never modify the data.
##  Note that SetCoefficientData() does not setup a pipeline
##  connection whereas SetCoefficientConnection does.
##  virtual void SetCoefficientConnection ( vtkAlgorithmOutput * ) ; virtual void SetCoefficientData ( vtkImageData * ) ; virtual vtkImageData * GetCoefficientData ( ) ; /@} /@{ *
##  Set/Get a scale to apply to the transformation.
##  virtual void SetDisplacementScale ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DisplacementScale  to  << _arg ) ; if ( this -> DisplacementScale != _arg ) { this -> DisplacementScale = _arg ; this -> Modified ( ) ; } } ; virtual double GetDisplacementScale ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DisplacementScale  of  << this -> DisplacementScale ) ; return this -> DisplacementScale ; } ; /@} /@{ *
##  Set/Get the border mode, to alter behavior at the edge of the grid.
##  The Edge mode allows the displacement to converge to the edge
##  coefficient past the boundary, which is similar to the behavior of
##  the vtkGridTransform. The Zero mode allows the displacement to
##  smoothly converge to zero two node-spacings past the boundary,
##  which is useful when you want to create a localized transform.
##  The ZeroAtBorder mode sacrifices smoothness to further localize
##  the transform to just one node-spacing past the boundary.
##  virtual void SetBorderMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BorderMode  to  << _arg ) ; if ( this -> BorderMode != ( _arg < VTK_BSPLINE_EDGE ? VTK_BSPLINE_EDGE : ( _arg > VTK_BSPLINE_ZERO_AT_BORDER ? VTK_BSPLINE_ZERO_AT_BORDER : _arg ) ) ) { this -> BorderMode = ( _arg < VTK_BSPLINE_EDGE ? VTK_BSPLINE_EDGE : ( _arg > VTK_BSPLINE_ZERO_AT_BORDER ? VTK_BSPLINE_ZERO_AT_BORDER : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBorderModeMinValue ( ) { return VTK_BSPLINE_EDGE ; } virtual int GetBorderModeMaxValue ( ) { return VTK_BSPLINE_ZERO_AT_BORDER ; } ; void SetBorderModeToEdge ( ) { this -> SetBorderMode ( VTK_BSPLINE_EDGE ) ; } void SetBorderModeToZero ( ) { this -> SetBorderMode ( VTK_BSPLINE_ZERO ) ; } void SetBorderModeToZeroAtBorder ( ) { this -> SetBorderMode ( VTK_BSPLINE_ZERO_AT_BORDER ) ; } virtual int GetDisplacementScaleBorderMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BorderMode  of  << this -> BorderMode ) ; return this -> BorderMode ; } ; const char * GetBorderModeAsString ( ) ; /@} *
##  Make another transform of the same type.
##  vtkAbstractTransform * MakeTransform ( ) override ; *
##  Get the MTime.
##  vtkMTimeType GetMTime ( ) override ; protected : vtkBSplineTransform ( ) ; ~ vtkBSplineTransform ( ) override ; *
##  Update the displacement grid.
##  void InternalUpdate ( ) override ; *
##  Copy this transform from another of the same type.
##  void InternalDeepCopy ( vtkAbstractTransform * transform ) override ; /@{ *
##  Internal functions for calculating the transformation.
##  void ForwardTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void ForwardTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; /@} void ForwardTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void ForwardTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; void InverseTransformPoint ( const float in [ 3 ] , float out [ 3 ] ) override ; void InverseTransformPoint ( const double in [ 3 ] , double out [ 3 ] ) override ; void InverseTransformDerivative ( const float in [ 3 ] , float out [ 3 ] , float derivative [ 3 ] [ 3 ] ) override ; void InverseTransformDerivative ( const double in [ 3 ] , double out [ 3 ] , double derivative [ 3 ] [ 3 ] ) override ; void ( * CalculateSpline ) ( const double point [ 3 ] , double displacement [ 3 ] , double derivatives [ 3 ] [ 3 ] , void * gridPtr , int inExt [ 6 ] , vtkIdType inInc [ 3 ] , int borderMode ) ; double DisplacementScale ; int BorderMode ; void * GridPointer ; double GridSpacing [ 3 ] ; double GridOrigin [ 3 ] ; int GridExtent [ 6 ] ; vtkIdType GridIncrements [ 3 ] ; private : vtkBSplineTransform ( const vtkBSplineTransform & ) = delete ; void operator = ( const vtkBSplineTransform & ) = delete ; vtkBSplineTransformConnectionHolder * ConnectionHolder ; } ;
## Error: token expected: ; but got: [identifier]!!!
