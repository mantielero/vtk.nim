## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitBoolean.h
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
##  @class   vtkImplicitBoolean
##  @brief   implicit function consisting of boolean combinations of implicit functions
##
##  vtkImplicitBoolean is an implicit function consisting of boolean
##  combinations of implicit functions. The class has a list of functions
##  (FunctionList) that are combined according to a specified operator
##  (VTK_UNION or VTK_INTERSECTION or VTK_DIFFERENCE). You can use nested
##  combinations of vtkImplicitFunction's (and/or vtkImplicitBoolean) to create
##  elaborate implicit functions.  vtkImplicitBoolean is a concrete
##  implementation of vtkImplicitFunction.
##
##  The operators work as follows. The VTK_UNION operator takes the minimum
##  value of all implicit functions. The VTK_INTERSECTION operator takes the
##  maximum value of all implicit functions. The VTK_DIFFERENCE operator
##  subtracts the 2nd through last implicit functions from the first. The
##  VTK_UNION_OF_MAGNITUDES takes the minimum absolute value of the
##  implicit functions.
##

## !!!Ignored construct:  # vtkImplicitBoolean_h [NewLine] # vtkImplicitBoolean_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkImplicitFunction.h [NewLine] class vtkImplicitFunctionCollection ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkImplicitBoolean : public vtkImplicitFunction { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkImplicitFunction Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkImplicitFunction :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitBoolean :: IsTypeOf ( type ) ; } static vtkImplicitBoolean * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitBoolean * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitBoolean * NewInstance ( ) const { return vtkImplicitBoolean :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkImplicitFunction :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitBoolean :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitBoolean :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; enum OperationType { VTK_UNION = 0 , VTK_INTERSECTION , VTK_DIFFERENCE , VTK_UNION_OF_MAGNITUDES } ; *
##  Default boolean method is union.
##  static vtkImplicitBoolean * New ( ) ; /@{ *
##  Evaluate boolean combinations of implicit function using current operator.
##  using vtkImplicitFunction :: EvaluateFunction ; double EvaluateFunction ( double x [ 3 ] ) override ; /@} *
##  Evaluate gradient of boolean combination.
##  void EvaluateGradient ( double x [ 3 ] , double g [ 3 ] ) override ; *
##  Override modified time retrieval because of object dependencies.
##  vtkMTimeType GetMTime ( ) override ; *
##  Add another implicit function to the list of functions.
##  void AddFunction ( vtkImplicitFunction * in ) ; *
##  Remove a function from the list of implicit functions to boolean.
##  void RemoveFunction ( vtkImplicitFunction * in ) ; *
##  Return the collection of implicit functions.
##  vtkImplicitFunctionCollection * GetFunction ( ) { return this -> FunctionList ; } /@{ *
##  Specify the type of boolean operation.
##  virtual void SetOperationType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OperationType  to  << _arg ) ; if ( this -> OperationType != ( _arg < VTK_UNION ? VTK_UNION : ( _arg > VTK_UNION_OF_MAGNITUDES ? VTK_UNION_OF_MAGNITUDES : _arg ) ) ) { this -> OperationType = ( _arg < VTK_UNION ? VTK_UNION : ( _arg > VTK_UNION_OF_MAGNITUDES ? VTK_UNION_OF_MAGNITUDES : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetOperationTypeMinValue ( ) { return VTK_UNION ; } virtual int GetOperationTypeMaxValue ( ) { return VTK_UNION_OF_MAGNITUDES ; } ; virtual int GetOperationType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << OperationType  of  << this -> OperationType ) ; return this -> OperationType ; } ; void SetOperationTypeToUnion ( ) { this -> SetOperationType ( VTK_UNION ) ; } void SetOperationTypeToIntersection ( ) { this -> SetOperationType ( VTK_INTERSECTION ) ; } void SetOperationTypeToDifference ( ) { this -> SetOperationType ( VTK_DIFFERENCE ) ; } void SetOperationTypeToUnionOfMagnitudes ( ) { this -> SetOperationType ( VTK_UNION_OF_MAGNITUDES ) ; } const char * GetOperationTypeAsString ( ) ; /@} protected : vtkImplicitBoolean ( ) ; ~ vtkImplicitBoolean ( ) override ; vtkImplicitFunctionCollection * FunctionList ; int OperationType ; private : vtkImplicitBoolean ( const vtkImplicitBoolean & ) = delete ; void operator = ( const vtkImplicitBoolean & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## *
##  Return the boolean operation type as a descriptive character string.
##

proc GetOperationTypeAsString*(): cstring {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetOperationTypeAsString(@)",
    header: "vtkImplicitBoolean.h".}