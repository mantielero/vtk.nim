## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPiecewiseControlPointsItem.h
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
##  @class   vtkPiecewiseControlPointsItem
##  @brief   Control points for
##  vtkPiecewiseFunction.
##
##  vtkPiecewiseControlPointsItem draws the control points of a vtkPiecewiseFunction.
##  @sa
##  vtkControlPointsItem
##  vtkPiecewiseFunctionItem
##  vtkCompositeTransferFunctionItem
##

## !!!Ignored construct:  # vtkPiecewiseControlPointsItem_h [NewLine] # vtkPiecewiseControlPointsItem_h [NewLine] # vtkChartsCoreModule.h  For export macro # vtkControlPointsItem.h [NewLine] class vtkPiecewiseFunction ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCHARTSCORE_EXPORT vtkPiecewiseControlPointsItem : public vtkControlPointsItem { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkControlPointsItem Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkControlPointsItem :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPiecewiseControlPointsItem :: IsTypeOf ( type ) ; } static vtkPiecewiseControlPointsItem * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPiecewiseControlPointsItem * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPiecewiseControlPointsItem * NewInstance ( ) const { return vtkPiecewiseControlPointsItem :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkControlPointsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPiecewiseControlPointsItem :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPiecewiseControlPointsItem :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Creates a piecewise control points object
##  static vtkPiecewiseControlPointsItem * New ( ) ; *
##  Set the piecewise function to draw its points
##  virtual void SetPiecewiseFunction ( vtkPiecewiseFunction * function ) ; /@{ *
##  Get the piecewise function
##  virtual vtkPiecewiseFunction * GetnamePiecewiseFunction ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PiecewiseFunction  address  << static_cast < vtkPiecewiseFunction * > ( this -> PiecewiseFunction ) ) ; return this -> PiecewiseFunction ; } ; /@} *
##  Add a point to the function. Returns the index of the point (0 based),
##  or -1 on error.
##  Subclasses should reimplement this function to do the actual work.
##  vtkIdType AddPoint ( double * newPos ) override ; *
##  Remove a point of the function. Returns the index of the point (0 based),
##  or -1 on error.
##  Subclasses should reimplement this function to do the actual work.
##  vtkIdType RemovePoint ( double * pos ) override ; protected : vtkPiecewiseControlPointsItem ( ) ; ~ vtkPiecewiseControlPointsItem ( ) override ; void emitEvent ( unsigned long event , void * params = nullptr ) override ; vtkMTimeType GetControlPointsMTime ( ) override ; vtkIdType GetNumberOfPoints ( ) const override ; void GetControlPoint ( vtkIdType index , double * point ) const override ; void SetControlPoint ( vtkIdType index , double * point ) override ; void EditPoint ( float tX , float tY ) override ; vtkPiecewiseFunction * PiecewiseFunction ; private : vtkPiecewiseControlPointsItem ( const vtkPiecewiseControlPointsItem & ) = delete ; void operator = ( const vtkPiecewiseControlPointsItem & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
