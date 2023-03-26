## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitDataSet.h
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
##  @class   vtkImplicitDataSet
##  @brief   treat a dataset as if it were an implicit function
##
##  vtkImplicitDataSet treats any type of dataset as if it were an
##  implicit function. This means it computes a function value and
##  gradient. vtkImplicitDataSet is a concrete implementation of
##  vtkImplicitFunction.
##
##  vtkImplicitDataSet computes the function (at the point x) by performing
##  cell interpolation. That is, it finds the cell containing x, and then
##  uses the cell's interpolation functions to compute an interpolated
##  scalar value at x. (A similar approach is used to find the
##  gradient, if requested.) Points outside of the dataset are assigned
##  the value of the ivar OutValue, and the gradient value OutGradient.
##
##  @warning
##  Any type of dataset can be used as an implicit function as long as it
##  has scalar data associated with it.
##
##  @sa
##  vtkImplicitFunction vtkImplicitVolume vtkClipPolyData vtkCutter
##  vtkImplicitWindowFunction
##

## !!!Ignored construct:  # vtkImplicitDataSet_h [NewLine] # vtkImplicitDataSet_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkImplicitDataSet : public vtkImplicitFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitDataSet :: IsTypeOf ( type ) ; } static vtkImplicitDataSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitDataSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitDataSet * NewInstance ( ) const { return vtkImplicitDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitDataSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct an vtkImplicitDataSet with no initial dataset; the OutValue
##  set to a large negative number; and the OutGradient set to (0,0,1).
##  static vtkImplicitDataSet * New ( ) ; *
##  Return the MTime also considering the DataSet dependency.
##  vtkMTimeType GetMTime ( ) override ; /@{ *
##  Evaluate the implicit function. This returns the interpolated scalar value
##  at x[3].
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate implicit function gradient.
##  void EvaluateGradient ( double x [ 3 ] , double n [ 3 ] ) override ; /@{ *
##  Set / get the dataset used for the implicit function evaluation.
##  virtual void SetDataSet ( vtkDataSet * ) ; virtual vtkDataSet * GetnameDataSet ( ) { vtkDebugWithObjectMacro ( this , <<  returning  DataSet  address  << static_cast < vtkDataSet * > ( this -> DataSet ) ) ; return this -> DataSet ; } ; /@} /@{ *
##  Set / get the function value to use for points outside of the dataset.
##  virtual void SetOutValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  OutValue  to  << _arg ) ; if ( this -> OutValue != _arg ) { this -> OutValue = _arg ; this -> Modified ( ) ; } } ; virtual double GetOutValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OutValue  of  << this -> OutValue ) ; return this -> OutValue ; } ; /@} /@{ *
##  Set / get the function gradient to use for points outside of the dataset.
##  virtual void SetOutGradient ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << OutGradient  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> OutGradient [ 0 ] != _arg1 ) || ( this -> OutGradient [ 1 ] != _arg2 ) || ( this -> OutGradient [ 2 ] != _arg3 ) ) { this -> OutGradient [ 0 ] = _arg1 ; this -> OutGradient [ 1 ] = _arg2 ; this -> OutGradient [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetOutGradient ( const double _arg [ 3 ] ) { this -> SetOutGradient ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetOutGradient ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << OutGradient  pointer  << this -> OutGradient ) ; return this -> OutGradient ; } VTK_WRAPEXCLUDE virtual void GetOutGradient ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> OutGradient [ 0 ] ; _arg2 = this -> OutGradient [ 1 ] ; _arg3 = this -> OutGradient [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << OutGradient  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetOutGradient ( double _arg [ 3 ] ) { this -> GetOutGradient ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkImplicitDataSet ( ) ; ~ vtkImplicitDataSet ( ) override ; void ReportReferences ( vtkGarbageCollector * ) override ; vtkDataSet * DataSet ; double OutValue ; double OutGradient [ 3 ] ; double * Weights ;  used to compute interpolation weights int Size ;  keeps track of length of weights array private : vtkImplicitDataSet ( const vtkImplicitDataSet & ) = delete ; void operator = ( const vtkImplicitDataSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
