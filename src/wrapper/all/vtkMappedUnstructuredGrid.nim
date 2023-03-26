## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMappedUnstructuredGrid.h
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
##  @class   vtkMappedUnstructuredGrid
##  @brief   Allows datasets with arbitrary storage
##  layouts to be used with VTK.
##
##
##  This class fulfills the vtkUnstructuredGridBase API while delegating to a
##  arbitrary implementation of the dataset topology. The purpose of
##  vtkMappedUnstructuredGrid is to allow external data structures to be used
##  directly in a VTK pipeline, e.g. for in-situ analysis of a running
##  simulation.
##
##  When introducing an external data structure into VTK, there are 3 principle
##  components of the dataset to consider:
##  - Points
##  - Cells (topology)
##  - Point/Cell attributes
##
##  Points and attributes can be handled by subclassing vtkMappedDataArray and
##  implementing that interface to adapt the external data structures into VTK.
##  The vtkMappedDataArray subclasses can then be used as the vtkPoints's Data
##  member (for points/nodes) or added directly to vtkPointData, vtkCellData, or
##  vtkFieldData for attribute information. Filters used in the pipeline will
##  need to be modified to remove calls to vtkDataArray::GetVoidPointer and use
##  a suitable vtkArrayDispatch instead.
##
##  Introducing an arbitrary topology implementation into VTK requires the use of
##  the vtkMappedUnstructuredGrid class. Unlike the data array counterpart, the
##  mapped unstructured grid is not subclassed, but rather takes an adaptor
##  class as a template argument. This is to allow cheap shallow copies of the
##  data by passing the reference-counted implementation object to new instances
##  of vtkMappedUnstructuredGrid.
##
##  The implementation class should derive from vtkObject (for reference
##  counting) and implement the usual vtkObject API requirements, such as a
##  static New() method and PrintSelf function. The following methods must also
##  be implemented:
##  - vtkIdType GetNumberOfCells()
##  - int GetCellType(vtkIdType cellId)
##  - void GetCellPoints(vtkIdType cellId, vtkIdList *ptIds)
##  - void GetFaceStream(vtkIdType cellId, vtkIdList *ptIds)
##  - void GetPointCells(vtkIdType ptId, vtkIdList *cellIds)
##  - int GetMaxCellSize()
##  - void GetIdsOfCellsOfType(int type, vtkIdTypeArray *array)
##  - int IsHomogeneous()
##  - void Allocate(vtkIdType numCells, int extSize = 1000)
##  - vtkIdType InsertNextCell(int type, vtkIdList *ptIds)
##  - vtkIdType InsertNextCell(int type, vtkIdType npts, const vtkIdType ptIds[])
##  - vtkIdType InsertNextCell(int type, vtkIdType npts, const vtkIdType ptIds[],
##                             vtkIdType nfaces, const int faces[])
##  - void ReplaceCell(vtkIdType cellId, int npts, const vtkIdType pts[])
##
##  These methods should provide the same functionality as defined in
##  vtkUnstructuredGrid. See that class's documentation for more information.
##
##  Note that since the implementation class is used as a compile-time template
##  parameter in vtkMappedUnstructuredGrid, the above methods do not need be
##  virtuals. The compiler will statically bind the calls, making dynamic vtable
##  lookups unnecessary and giving a slight performance boost.
##
##  Adapting a filter or algorithm to safely traverse the
##  vtkMappedUnstructuredGrid's topology requires removing calls the following
##  implementation-dependent vtkUnstructuredGrid methods:
##  - vtkUnstructuredGrid::GetCellTypesArray()
##  - vtkUnstructuredGrid::GetCellLocationsArray()
##  - vtkUnstructuredGrid::GetCellLinks()
##  - vtkUnstructuredGrid::GetCells()
##  Access to the values returned by these methods should be replaced by the
##  equivalent random-access lookup methods in the vtkUnstructuredGridBase API,
##  or use vtkCellIterator (see vtkDataSet::NewCellIterator) for sequential
##  access.
##
##  A custom vtkCellIterator implementation may be specified for a particular
##  vtkMappedUnstructuredGrid as the second template parameter. By default,
##  vtkMappedUnstructuredGridCellIterator will be used, which increments an
##  internal cell id counter and performs random-access lookup as-needed. More
##  efficient implementations may be used with data structures better suited for
##  sequential access, see vtkUnstructuredGridCellIterator for an example.
##
##  A set of four macros are provided to generate a concrete subclass of
##  vtkMappedUnstructuredGrid with a specified implementation, cell iterator,
##  and export declaration. They are:
##  - vtkMakeMappedUnstructuredGrid(_className, _impl)
##    - Create a subclass of vtkMappedUnstructuredGrid using _impl implementation
##      that is named _className.
##  - vtkMakeMappedUnstructuredGridWithIter(_className, _impl, _cIter)
##    - Create a subclass of vtkMappedUnstructuredGrid using _impl implementation
##      and _cIter vtkCellIterator that is named _className.
##  - vtkMakeExportedMappedUnstructuredGrid(_className, _impl, _exportDecl)
##    - Create a subclass of vtkMappedUnstructuredGrid using _impl implementation
##      that is named _className. _exportDecl is used to decorate the class
##      declaration.
##  - vtkMakeExportedMappedUnstructuredGridWithIter(_className, _impl, _cIter, _exportDecl)
##    - Create a subclass of vtkMappedUnstructuredGrid using _impl implementation
##      and _cIter vtkCellIterator that is named _className. _exportDecl is used
##      to decorate the class declaration.
##
##  To instantiate a vtkMappedUnstructuredGrid subclass created by the above
##  macro, the follow pattern is encouraged:
##
##  @code
##  MyGrid.h:
##  ----------------------------------------------------------------------
##  class MyGridImplementation : public vtkObject
##  {
##  public:
##    ... (vtkObject required API) ...
##    ... (vtkMappedUnstructuredGrid Implementation required API) ...
##    void SetImplementationDetails(...raw data from external source...);
##  };
##
##  vtkMakeMappedUnstructuredGrid(MyGrid, MyGridImplementation)
##
##  SomeSource.cxx
##  ----------------------------------------------------------------------
##  vtkNew<MyGrid> grid;
##  grid->GetImplementation()->SetImplementationDetails(...);
##  // grid is now ready to use.
##  @endcode
##
##  The vtkCPExodusIIElementBlock class provides an example of
##  vtkMappedUnstructuredGrid usage, adapting the Exodus II data structures for
##  the VTK pipeline.
##

## !!!Ignored construct:  # vtkMappedUnstructuredGrid_h [NewLine] # vtkMappedUnstructuredGrid_h [NewLine] # vtkUnstructuredGridBase.h [NewLine] # vtkMappedUnstructuredGridCellIterator.h  For default cell iterator # vtkNew.h  For vtkNew # vtkSmartPointer.h  For vtkSmartPointer [NewLine] template < class Implementation , class CellIterator = vtkMappedUnstructuredGridCellIterator < Implementation > [end of template] > [end of template] class vtkMappedUnstructuredGrid : public vtkUnstructuredGridBase { typedef vtkMappedUnstructuredGrid < Implementation , CellIterator > SelfType ; public : protected : const char * GetClassNameInternal ( ) const override { return typeid ( SelfType ) . name ( ) ; } public : typedef vtkUnstructuredGridBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 1 ; } return vtkUnstructuredGridBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> SelfType :: IsTypeOf ( type ) ; } static SelfType * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( typeid ( SelfType ) . name ( ) ) ) { return static_cast < SelfType * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE SelfType * NewInstance ( ) const { return SelfType :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( SelfType ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> SelfType :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; protected : vtkObjectBase * NewInstanceInternal ( ) const override { return SelfType :: New ( ) ; } public : ; typedef Implementation ImplementationType ; typedef CellIterator CellIteratorType ;  Virtuals from various base classes: void PrintSelf ( ostream & os , vtkIndent indent ) override ; void CopyStructure ( vtkDataSet * pd ) override ; void ShallowCopy ( vtkDataObject * src ) override ; vtkIdType GetNumberOfCells ( ) override ; using vtkDataSet :: GetCell ; vtkCell * GetCell ( vtkIdType cellId ) override ; void GetCell ( vtkIdType cellId , vtkGenericCell * cell ) override ; int GetCellType ( vtkIdType cellId ) override ; void GetCellPoints ( vtkIdType cellId , vtkIdList * ptIds ) override ; vtkCellIterator * NewCellIterator ( ) override ; void GetPointCells ( vtkIdType ptId , vtkIdList * cellIds ) override ; int GetMaxCellSize ( ) override ; void GetIdsOfCellsOfType ( int type , vtkIdTypeArray * array ) override ; int IsHomogeneous ( ) override ; void Allocate ( vtkIdType numCells , int extSize = 1000 ) override ; vtkMTimeType GetMTime ( ) override ; void SetImplementation ( ImplementationType * impl ) ; ImplementationType * GetImplementation ( ) ; protected : vtkMappedUnstructuredGrid ( ) ; ~ vtkMappedUnstructuredGrid ( ) override ;  For convenience... typedef vtkMappedUnstructuredGrid < Implementation , CellIterator > ThisType ; vtkSmartPointer < ImplementationType > Impl ; vtkIdType InternalInsertNextCell ( int type , vtkIdType npts , const vtkIdType ptIds [ ] ) override ; vtkIdType InternalInsertNextCell ( int type , vtkIdList * ptIds ) override ; vtkIdType InternalInsertNextCell ( int type , vtkIdType npts , const vtkIdType ptIds [ ] , vtkIdType nfaces , const vtkIdType faces [ ] ) override ; void InternalReplaceCell ( vtkIdType cellId , int npts , const vtkIdType pts [ ] ) override ; private : vtkMappedUnstructuredGrid ( const vtkMappedUnstructuredGrid & ) = delete ; void operator = ( const vtkMappedUnstructuredGrid & ) = delete ; vtkNew < vtkGenericCell > TempCell ; } ;
## Error: token expected: > [end of template] but got: =!!!

import
  vtkMappedUnstructuredGrid

##  We need to fake the superclass for the wrappers, otherwise they will choke on
##  the template:

## !!!Ignored construct:  # __VTK_WRAP__ [NewLine] # vtkMakeExportedMappedUnstructuredGrid ( _className , _impl , _exportDecl ) class _exportDecl _className : public vtkMappedUnstructuredGrid < _impl > { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMappedUnstructuredGrid < _impl > Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMappedUnstructuredGrid < _impl > :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> _className :: IsTypeOf ( type ) ; } static _className * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < _className * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE _className * NewInstance ( ) const { return _className :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMappedUnstructuredGrid < _impl > :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> _className :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return _className :: New ( ) ; } public : ; static _className * New ( ) ; protected : _className ( ) { _impl * i = _impl :: New ( ) ; this -> SetImplementation ( i ) ; i -> Delete ( ) ; } ~ _className ( ) override { } private : _className ( const _className & ) ; void operator = ( const _className & ) ; } [NewLine] # vtkMakeExportedMappedUnstructuredGridWithIter ( _className , _impl , _cIter , _exportDecl ) class _exportDecl _className : public vtkMappedUnstructuredGrid < _impl , _cIter > { public : typedef vtkMappedUnstructuredGrid < _impl , _cIter > SelfType ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef SelfType Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return SelfType :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> _className :: IsTypeOf ( type ) ; } static _className * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < _className * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE _className * NewInstance ( ) const { return _className :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + SelfType :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> _className :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return _className :: New ( ) ; } public : ; static _className * New ( ) ; protected : _className ( ) { _impl * i = _impl :: New ( ) ; this -> SetImplementation ( i ) ; i -> Delete ( ) ; } ~ _className ( ) override { } private : _className ( const _className & ) ; void operator = ( const _className & ) ; } [NewLine] #  __VTK_WRAP__ [NewLine] # vtkMakeExportedMappedUnstructuredGrid ( _className , _impl , _exportDecl ) class _exportDecl _className : public vtkUnstructuredGridBase { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> _className :: IsTypeOf ( type ) ; } static _className * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < _className * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE _className * NewInstance ( ) const { return _className :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> _className :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return _className :: New ( ) ; } public : ; static _className * New ( ) ; protected : _className ( ) { } ~ _className ( ) override { } private : _className ( const _className & ) ; void operator = ( const _className & ) ; } [NewLine] # vtkMakeExportedMappedUnstructuredGridWithIter ( _className , _impl , _cIter , _exportDecl ) class _exportDecl _className : public vtkUnstructuredGridBase { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridBase Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridBase :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> _className :: IsTypeOf ( type ) ; } static _className * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < _className * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE _className * NewInstance ( ) const { return _className :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> _className :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return _className :: New ( ) ; } public : ; static _className * New ( ) ; protected : _className ( ) { } ~ _className ( ) override { } private : _className ( const _className & ) ; void operator = ( const _className & ) ; } [NewLine] #  __VTK_WRAP__ [NewLine] # vtkMakeMappedUnstructuredGrid ( _className , _impl ) vtkMakeExportedMappedUnstructuredGrid ( _className , _impl , ) [NewLine] # vtkMakeMappedUnstructuredGridWithIter ( _className , _impl , _cIter ) vtkMakeExportedMappedUnstructuredGridWithIter ( _className , _impl , _cIter , ) [NewLine] #  vtkMappedUnstructuredGrid_h [NewLine]  VTK-HeaderTest-Exclude: vtkMappedUnstructuredGrid.h
## Error: token expected: ; but got: [identifier]!!!
