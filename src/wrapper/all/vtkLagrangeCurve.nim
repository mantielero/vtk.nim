## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLagrangeCurve.h
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
##  .NAME vtkLagrangeCurve
##  .SECTION Description
##  .SECTION See Also

## !!!Ignored construct:  # vtkLagrangeCurve_h [NewLine] # vtkLagrangeCurve_h [NewLine] # vtkCellType.h  For GetCellType. # vtkCommonDataModelModule.h  For export macro # vtkHigherOrderCurve.h [NewLine] # vtkNew.h  For member variable. # vtkSmartPointer.h  For member variable. [NewLine] class vtkCellData ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkLine"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkVector3d"
discard "forward decl of vtkVector3i"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkLagrangeCurve : public vtkHigherOrderCurve { public : static vtkLagrangeCurve * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkHigherOrderCurve Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkHigherOrderCurve :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkLagrangeCurve :: IsTypeOf ( type ) ; } static vtkLagrangeCurve * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkLagrangeCurve * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkLagrangeCurve * NewInstance ( ) const { return vtkLagrangeCurve :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHigherOrderCurve :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLagrangeCurve :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLagrangeCurve :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; int GetCellType ( ) override { return VTK_LAGRANGE_CURVE ; } void InterpolateFunctions ( const double pcoords [ 3 ] , double * weights ) override ; void InterpolateDerivs ( const double pcoords [ 3 ] , double * derivs ) override ; protected : vtkLine * GetApproximateLine ( int subId , vtkDataArray * scalarsIn = nullptr , vtkDataArray * scalarsOut = nullptr ) override ; vtkLagrangeCurve ( ) ; ~ vtkLagrangeCurve ( ) override ; private : vtkLagrangeCurve ( const vtkLagrangeCurve & ) = delete ; void operator = ( const vtkLagrangeCurve & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
