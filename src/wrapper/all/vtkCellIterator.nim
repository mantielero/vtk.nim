## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellIterator.h
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
##  @class   vtkCellIterator
##  @brief   Efficient cell iterator for vtkDataSet topologies.
##
##
##  vtkCellIterator provides a method for traversing cells in a data set. Call
##  the vtkDataSet::NewCellIterator() method to use this class.
##
##  The cell is represented as a set of three pieces of information: The cell
##  type, the ids of the points constituting the cell, and the points themselves.
##  This iterator fetches these as needed. If only the cell type is used,
##  the type is not looked up until GetCellType is called, and the point
##  information is left uninitialized. This allows efficient screening of cells,
##  since expensive point lookups may be skipped depending on the cell type/etc.
##
##  An example usage of this class:
##  ~~~
##  void myWorkerFunction(vtkDataSet *ds)
##  {
##    vtkCellIterator *it = ds->NewCellIterator();
##    for (it->InitTraversal(); !it->IsDoneWithTraversal(); it->GoToNextCell())
##      {
##      if (it->GetCellType() != VTK_TETRA)
##        {
##        continue; // Skip non-tetrahedral cells
##        }
##
##      vtkIdList *pointIds = it->GetPointIds();
##      // Do screening on the point ids, maybe figure out scalar range and skip
##         cells that do not lie in a certain range?
##
##      vtkPoints *points = it->GetPoints();
##      // Do work using the cell points, or ...
##
##      vtkGenericCell *cell = ...;
##      it->GetCell(cell);
##      // ... do work with a vtkCell.
##      }
##    it->Delete();
##  }
##  ~~~
##
##  The example above pulls in bits of information as needed to filter out cells
##  that aren't relevant. The least expensive lookups are performed first
##  (cell type, then point ids, then points/full cell) to prevent wasted cycles
##  fetching unnecessary data. Also note that at the end of the loop, the
##  iterator must be deleted as these iterators are vtkObject subclasses.
##

## !!!Ignored construct:  # vtkCellIterator_h [NewLine] # vtkCellIterator_h [NewLine] # vtkCellType.h  For VTK_EMPTY_CELL # vtkCommonDataModelModule.h  For export macro # vtkIdList.h  For inline methods # vtkNew.h  For vtkNew # vtkObject.h [NewLine] class vtkGenericCell ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPoints"
## !!!Ignored construct:  class VTKCOMMONDATAMODEL_EXPORT vtkCellIterator : public vtkObject { public : void PrintSelf ( ostream & os , vtkIndent indent ) override ; protected : const char * GetClassNameInternal ( ) const override { return vtkCellIterator ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( vtkCellIterator , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellIterator :: IsTypeOf ( type ) ; } static vtkCellIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( vtkCellIterator ) ) { return static_cast < vtkCellIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellIterator * NewInstance ( ) const { return vtkCellIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( vtkCellIterator , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ; *
##  Reset to the first cell.
##  void InitTraversal ( ) ; *
##  Increment to next cell. Always safe to call.
##  void GoToNextCell ( ) ; *
##  Returns false while the iterator is valid. Always safe to call.
##  virtual bool IsDoneWithTraversal ( ) = 0 ; *
##  Get the current cell type (e.g. VTK_LINE, VTK_VERTEX, VTK_TETRA, etc).
##  This should only be called when IsDoneWithTraversal() returns false.
##  int GetCellType ( ) ; *
##  Get the current cell dimension (0, 1, 2, or 3). This should only be called
##  when IsDoneWithTraversal() returns false.
##  int GetCellDimension ( ) ; *
##  Get the id of the current cell.
##  virtual vtkIdType GetCellId ( ) = 0 ; *
##  Get the ids of the points in the current cell.
##  This should only be called when IsDoneWithTraversal() returns false.
##  vtkIdList * GetPointIds ( ) ; *
##  Get the points in the current cell.
##  This is usually a very expensive call, and should be avoided when possible.
##  This should only be called when IsDoneWithTraversal() returns false.
##  vtkPoints * GetPoints ( ) ; *
##  Get the faces for a polyhedral cell. This is only valid when CellType
##  is VTK_POLYHEDRON.
##  vtkIdList * GetFaces ( ) ; *
##  Write the current full cell information into the argument.
##  This is usually a very expensive call, and should be avoided when possible.
##  This should only be called when IsDoneWithTraversal() returns false.
##  void GetCell ( vtkGenericCell * cell ) ; *
##  Return the number of points in the current cell.
##  This should only be called when IsDoneWithTraversal() returns false.
##  vtkIdType GetNumberOfPoints ( ) ; *
##  Return the number of faces in the current cell.
##  This should only be called when IsDoneWithTraversal() returns false.
##  vtkIdType GetNumberOfFaces ( ) ; protected : vtkCellIterator ( ) ; ~ vtkCellIterator ( ) override ; *
##  Update internal state to point to the first cell.
##  virtual void ResetToFirstCell ( ) = 0 ; *
##  Update internal state to point to the next cell.
##  virtual void IncrementToNextCell ( ) = 0 ; *
##  Lookup the cell type in the data set and store it in this->CellType.
##  virtual void FetchCellType ( ) = 0 ; *
##  Lookup the cell point ids in the data set and store them in this->PointIds.
##  virtual void FetchPointIds ( ) = 0 ; *
##  Lookup the cell points in the data set and store them in this->Points.
##  virtual void FetchPoints ( ) = 0 ; *
##  Lookup the cell faces in the data set and store them in this->Faces.
##  Few data sets support faces, so this method has a no-op default
##  implementation. See vtkUnstructuredGrid::GetFaceStream for
##  a description of the layout that Faces should have.
##  virtual void FetchFaces ( ) { } int CellType ; vtkPoints * Points ; vtkIdList * PointIds ; vtkIdList * Faces ; private : vtkCellIterator ( const vtkCellIterator & ) = delete ; void operator = ( const vtkCellIterator & ) = delete ; enum { UninitializedFlag = 0x0 , CellTypeFlag = 0x1 , PointIdsFlag = 0x2 , PointsFlag = 0x4 , FacesFlag = 0x8 } ; void ResetCache ( ) { this -> CacheFlags = UninitializedFlag ; this -> CellType = VTK_EMPTY_CELL ; } void SetCache ( unsigned char flags ) { this -> CacheFlags |= flags ; } bool CheckCache ( unsigned char flags ) { return ( this -> CacheFlags & flags ) == flags ; } vtkNew < vtkPoints > PointsContainer ; vtkNew < vtkIdList > PointIdsContainer ; vtkNew < vtkIdList > FacesContainer ; unsigned char CacheFlags ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ------------------------------------------------------------------------------

proc InitTraversal*() {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::InitTraversal(@)",
                      header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GoToNextCell*() {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GoToNextCell(@)",
                     header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GetCellType*(): cint {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetCellType(@)",
                         header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GetPointIds*(): ptr vtkIdList {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetPointIds(@)",
                                 header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GetPoints*(): ptr VTKCOMMONDATAMODEL_EXPORTvtkPoints {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetPoints(@)",
    header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GetFaces*(): ptr vtkIdList {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetFaces(@)",
                              header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GetNumberOfPoints*(): vtkIdType {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfPoints(@)",
                                    header: "vtkCellIterator.h".}
## ------------------------------------------------------------------------------

proc GetNumberOfFaces*(): vtkIdType {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNumberOfFaces(@)",
                                   header: "vtkCellIterator.h".}