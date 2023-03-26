## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSetCellIterator.h
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
##  @class   vtkPointSetCellIterator
##  @brief   Implementation of vtkCellIterator using
##  vtkPointSet API.
##

## !!!Ignored construct:  # vtkPointSetCellIterator_h [NewLine] # vtkPointSetCellIterator_h [NewLine] # vtkCellIterator.h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkSmartPointer.h  For vtkSmartPointer [NewLine] class vtkPoints ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkPointSetCellIterator : public vtkCellIterator { public : static vtkPointSetCellIterator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCellIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCellIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointSetCellIterator :: IsTypeOf ( type ) ; } static vtkPointSetCellIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointSetCellIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointSetCellIterator * NewInstance ( ) const { return vtkPointSetCellIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSetCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSetCellIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; bool IsDoneWithTraversal ( ) override ; vtkIdType GetCellId ( ) override ; protected : vtkPointSetCellIterator ( ) ; ~ vtkPointSetCellIterator ( ) override ; void ResetToFirstCell ( ) override ; void IncrementToNextCell ( ) override ; void FetchCellType ( ) override ; void FetchPointIds ( ) override ; void FetchPoints ( ) override ; friend class vtkPointSet ; void SetPointSet ( vtkPointSet * ds ) ; vtkSmartPointer < vtkPointSet > PointSet ; vtkSmartPointer < vtkPoints > PointSetPoints ; vtkIdType CellId ; private : vtkPointSetCellIterator ( const vtkPointSetCellIterator & ) = delete ; void operator = ( const vtkPointSetCellIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
