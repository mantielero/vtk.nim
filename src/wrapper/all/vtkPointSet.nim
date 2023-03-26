## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPointSet.h
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
##  @class   vtkPointSet
##  @brief   concrete class for storing a set of points
##
##  vtkPointSet is an concrete class representing a set of points
##  that specifies the interface for
##  datasets that explicitly use "point" arrays to represent geometry.
##  For example, vtkPolyData, vtkUnstructuredGrid, and vtkStructuredGrid
##  require point arrays to specify point positions, while vtkImageData
##  represents point positions implicitly (and hence is not a subclass
##  of vtkImageData).
##
##  Note: The vtkPolyData and vtkUnstructuredGrid datasets (derived classes of
##  vtkPointSet) are often used in geometric computation (e.g.,
##  vtkDelaunay2D).  In most cases during filter execution the output geometry
##  and/or topology is created once and provided as output; however in a very
##  few cases the underlying geometry/topology may be created and then
##  incrementally modified. This has implications on the use of supporting
##  classes like locators and cell links topological structures which may be
##  required to support incremental editing operations. Consequently, there is
##  a flag, Editable, that controls whether the dataset can be incrementally
##  edited after it is initially created. By default, and for performance
##  reasons, vtkPointSet derived classes are created as non-editable.  The few
##  methods that require incremental editing capabilities are documented in
##  derived classes.
##
##  Another important feature of vtkPointSet classes is the use of an internal
##  locator to speed up certain operations like FindCell(). Depending on the
##  application and desired performance, different locators (either a cell or
##  point locator) of different locator types may be used, along with different
##  strategies for using the locators to perform various operations. See
##  the class vtkFindCellStrategy for more information
##
##  @sa
##  vtkPolyData vtkStructuredGrid vtkUnstructuredGrid vtkFindCellStrategy
##

## !!!Ignored construct:  # vtkPointSet_h [NewLine] # vtkPointSet_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkDataSet.h [NewLine] # vtkCellTypes.h  For GetCellType # vtkEmptyCell.h  For GetCell # vtkGenericCell.h  For GetCell # vtkPoints.h  Needed for inline methods [NewLine] class vtkAbstractPointLocator ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkAbstractCellLocator"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkPointSet : public vtkDataSet { public : *
##  Standard instantiation method.
##  static vtkPointSet * New ( ) ; static vtkPointSet * ExtendedNew ( ) ; /@{ *
##  Standard methods for type information and printing.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkDataSet Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkDataSet :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPointSet :: IsTypeOf ( type ) ; } static vtkPointSet * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPointSet * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPointSet * NewInstance ( ) const { return vtkPointSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPointSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPointSet :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify whether this dataset is editable after creation. Meaning, once
##  the points and cells are defined, can the dataset be incrementally
##  modified. By default, this dataset is non-editable (i.e., "static")
##  after construction. The reason for this is performance: cell links and
##  locators can be built (and destroyed) much faster is it is known that
##  the data is static (see vtkStaticCellLinks, vtkStaticPointLocator,
##  vtkStaticCellLocator).
##  virtual void SetEditable ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Editable  to  << _arg ) ; if ( this -> Editable != _arg ) { this -> Editable = _arg ; this -> Modified ( ) ; } } ; virtual bool GetEditable ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Editable  of  << this -> Editable ) ; return this -> Editable ; } ; virtual void EditableOn ( ) { this -> SetEditable ( static_cast < bool > ( 1 ) ) ; } virtual void EditableOff ( ) { this -> SetEditable ( static_cast < bool > ( 0 ) ) ; } ; /@} *
##  Reset to an empty state and free any memory.
##  void Initialize ( ) override ; *
##  Copy the geometric structure of an input point set object.
##  void CopyStructure ( vtkDataSet * pd ) override ; /@{ *
##  See vtkDataSet for additional information.
##  vtkIdType GetNumberOfPoints ( ) override ; void GetPoint ( vtkIdType ptId , double x [ 3 ] ) override { this -> Points -> GetPoint ( ptId , x ) ; } vtkIdType FindPoint ( double x [ 3 ] ) override ; vtkIdType FindPoint ( double x , double y , double z ) { return this -> vtkDataSet :: FindPoint ( x , y , z ) ; } vtkIdType FindCell ( double x [ 3 ] , vtkCell * cell , vtkIdType cellId , double tol2 , int & subId , double pcoords [ 3 ] , double * weights ) override ; vtkIdType FindCell ( double x [ 3 ] , vtkCell * cell , vtkGenericCell * gencell , vtkIdType cellId , double tol2 , int & subId , double pcoords [ 3 ] , double * weights ) override ; /@} /@{ *
##  This method always returns 0, as there are no cells in a `vtkPointSet`.
##  vtkIdType GetNumberOfCells ( ) override { return 0 ; } int GetMaxCellSize ( ) override { return 0 ; } /@} using Superclass :: GetCell ; *
##  This method always return a `vtkEmptyCell`, as there is no cell in a
##  `vtkPointSet`.
##  vtkCell * GetCell ( vtkIdType ) override { return this -> EmptyCell ; } /@{ *
##  This method resets parameter idList, as there is no cell in a `vtkPointSet`.
##  using vtkDataSet :: GetCellPoints ; void GetCellPoints ( vtkIdType , vtkIdList * idList ) override { idList -> Reset ( ) ; } void GetPointCells ( vtkIdType , vtkIdList * idList ) override { idList -> Reset ( ) ; } /@} *
##  This method sets cell to be an empty cell.
##  void GetCell ( vtkIdType , vtkGenericCell * cell ) override { cell -> SetCellTypeToEmptyCell ( ) ; } *
##  This method always returns `VTK_EMPTY_CELL`, as there is no cell in a
##  `vtkPointSet`.
##  int GetCellType ( vtkIdType ) override { return VTK_EMPTY_CELL ; } *
##  This method always returns 1, as all cells are point in a pure
##  `vtkPointSet`.
##  vtkIdType GetCellSize ( vtkIdType ) override { return 1 ; } *
##  See vtkDataSet for additional information.
##  WARNING: Just don't use this error-prone method, the returned pointer
##  and its values are only valid as long as another method invocation is not
##  performed. Prefer GetPoint() with the return value in argument.
##  double * GetPoint ( vtkIdType ptId ) VTK_SIZEHINT ( 3 ) override { return this -> Points -> GetPoint ( ptId ) ; } *
##  Return an iterator that traverses the cells in this data set.
##  vtkCellIterator * NewCellIterator ( ) override ; /@{ *
##  Build the internal point locator . In a multi-threaded environment, call
##  this method in a single thread before using FindCell() or FindPoint().
##  void BuildPointLocator ( ) ; void BuildLocator ( ) { this -> BuildPointLocator ( ) ; } /@} *
##  Build the cell locator. In a multi-threaded environment,
##  call this method in a single thread before using FindCell().
##  void BuildCellLocator ( ) ; /@{ *
##  Set / get an instance of vtkAbstractPointLocator which is used to
##  support the FindPoint() and FindCell() methods. By default a
##  vtkStaticPointLocator is used, unless the class is set as Editable, in
##  which case a vtkPointLocator is used.
##  virtual void SetPointLocator ( vtkAbstractPointLocator * ) ; virtual vtkAbstractPointLocator * GetnamePointLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  PointLocator  address  << static_cast < vtkAbstractPointLocator * > ( this -> PointLocator ) ) ; return this -> PointLocator ; } ; /@} /@{ *
##  Set / get an instance of vtkAbstractCellLocator which may be used
##  when a vtkCellLocatorStrategy is used during a FindCell() operation.
##  virtual void SetCellLocator ( vtkAbstractCellLocator * ) ; virtual vtkAbstractCellLocator * GetnamePointLocatorCellLocator ( ) { vtkDebugWithObjectMacro ( this , <<  returning  CellLocator  address  << static_cast < vtkAbstractCellLocator * > ( this -> CellLocator ) ) ; return this -> CellLocator ; } ; /@} *
##  Get MTime which also considers its vtkPoints MTime.
##  vtkMTimeType GetMTime ( ) override ; *
##  Compute the (X, Y, Z)  bounds of the data.
##  void ComputeBounds ( ) override ; *
##  Reclaim any unused memory.
##  void Squeeze ( ) override ; /@{ *
##  Specify point array to define point coordinates.
##  virtual void SetPoints ( vtkPoints * ) ; virtual vtkPoints * GetnamePointLocatorCellLocatorPoints ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Points  address  << static_cast < vtkPoints * > ( this -> Points ) ) ; return this -> Points ; } ; /@} *
##  Return the actual size of the data in kibibytes (1024 bytes). This number
##  is valid only after the pipeline has updated. The memory size
##  returned is guaranteed to be greater than or equal to the
##  memory required to represent the data (e.g., extra space in
##  arrays, etc. are not included in the return value). THIS METHOD
##  IS THREAD SAFE.
##  unsigned long GetActualMemorySize ( ) override ; /@{ *
##  Shallow and Deep copy.
##  void ShallowCopy ( vtkDataObject * src ) override ; void DeepCopy ( vtkDataObject * src ) override ; /@} /@{ *
##  Overwritten to handle the data/locator loop
##  bool UsesGarbageCollector ( ) const override { return true ; } /@} /@{ *
##  Retrieve an instance of this class from an information object.
##  static vtkPointSet * GetData ( vtkInformation * info ) ; static vtkPointSet * GetData ( vtkInformationVector * v , int i = 0 ) ; /@} protected : vtkPointSet ( ) ; ~ vtkPointSet ( ) override ; bool Editable ; vtkPoints * Points ; vtkAbstractPointLocator * PointLocator ; vtkAbstractCellLocator * CellLocator ; void ReportReferences ( vtkGarbageCollector * ) override ; private : void Cleanup ( ) ; vtkEmptyCell * EmptyCell ; vtkPointSet ( const vtkPointSet & ) = delete ; void operator = ( const vtkPointSet & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetNumberOfPoints*(): vtkIdType {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfPoints(@)",
                                    header: "vtkPointSet.h".}