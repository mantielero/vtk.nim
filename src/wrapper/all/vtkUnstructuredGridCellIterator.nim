## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridCellIterator.h
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
##  @class   vtkUnstructuredGridCellIterator
##  @brief   Implementation of vtkCellIterator
##  specialized for vtkUnstructuredGrid.
##

## !!!Ignored construct:  # vtkUnstructuredGridCellIterator_h [NewLine] # vtkUnstructuredGridCellIterator_h [NewLine] # vtkCellArrayIterator.h  Accessing cell array # vtkCellIterator.h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkSmartPointer.h  For vtkSmartPointer [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkUnstructuredGridCellIterator : public vtkCellIterator { public : /@{ *
##  Standard methods for instantiation, type information, and printing.
##  static vtkUnstructuredGridCellIterator * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCellIterator Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCellIterator :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridCellIterator :: IsTypeOf ( type ) ; } static vtkUnstructuredGridCellIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridCellIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridCellIterator * NewInstance ( ) const { return vtkUnstructuredGridCellIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridCellIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Override superclass methods.
##  bool IsDoneWithTraversal ( ) override ; vtkIdType GetCellId ( ) override ; /@} *
##  A method used to provide random access into cells. The iterator is
##  initialized to a specific cell. This method can always be used to set
##  the starting location for forward iteration, and it is also used to
##  support random access.
##  void GoToCell ( vtkIdType cellId ) { this -> Cells -> GoToCell ( cellId ) ; } protected : vtkUnstructuredGridCellIterator ( ) ; ~ vtkUnstructuredGridCellIterator ( ) override ; void ResetToFirstCell ( ) override ; void IncrementToNextCell ( ) override ; void FetchCellType ( ) override ; void FetchPointIds ( ) override ; void FetchPoints ( ) override ; void FetchFaces ( ) override ; friend class vtkUnstructuredGrid ; void SetUnstructuredGrid ( vtkUnstructuredGrid * ug ) ; vtkSmartPointer < vtkCellArrayIterator > Cells ; vtkSmartPointer < vtkUnsignedCharArray > Types ; vtkSmartPointer < vtkIdTypeArray > FaceConn ; vtkSmartPointer < vtkIdTypeArray > FaceLocs ; vtkSmartPointer < vtkPoints > Coords ; private : vtkUnstructuredGridCellIterator ( const vtkUnstructuredGridCellIterator & ) = delete ; void operator = ( const vtkUnstructuredGridCellIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
