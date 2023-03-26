## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLinearContourLineInterpolator.h
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
##  @class   vtkLinearContourLineInterpolator
##  @brief   Interpolates supplied nodes with line segments
##
##  The line interpolator interpolates supplied nodes (see InterpolateLine)
##  with line segments. The fineness of the curve may be controlled using
##  SetMaximumCurveError and SetMaximumNumberOfLineSegments.
##
##  @sa
##  vtkContourLineInterpolator
##

## !!!Ignored construct:  # vtkLinearContourLineInterpolator_h [NewLine] # vtkLinearContourLineInterpolator_h [NewLine] # vtkContourLineInterpolator.h [NewLine] # vtkInteractionWidgetsModule.h  For export macro [NewLine] class VTKINTERACTIONWIDGETS_EXPORT vtkLinearContourLineInterpolator : public vtkContourLineInterpolator { public : *
##  Instantiate this class.
##  static vtkLinearContourLineInterpolator * New ( ) ; /@{ *
##  Standard methods for instances of this class.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkContourLineInterpolator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkContourLineInterpolator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLinearContourLineInterpolator :: IsTypeOf ( type ) ; } static vtkLinearContourLineInterpolator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLinearContourLineInterpolator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLinearContourLineInterpolator * NewInstance ( ) const { return vtkLinearContourLineInterpolator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLinearContourLineInterpolator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLinearContourLineInterpolator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} int InterpolateLine ( vtkRenderer * ren , vtkContourRepresentation * rep , int idx1 , int idx2 ) override ; protected : vtkLinearContourLineInterpolator ( ) ; ~ vtkLinearContourLineInterpolator ( ) override ; private : vtkLinearContourLineInterpolator ( const vtkLinearContourLineInterpolator & ) = delete ; void operator = ( const vtkLinearContourLineInterpolator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
