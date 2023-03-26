## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFindCellStrategy.h
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
##  @class   vtkFindCellStrategy
##  @brief   helper class to manage the vtkPointSet::FindCell() METHOD
##
##  vtkFindCellStrategy is a helper class to manage the use of locators for
##  locating cells containing a query point x[3], the so-called FindCell()
##  method. The use of vtkDataSet::FindCell() is a common operation in
##  applications such as streamline generation and probing. However, in some
##  dataset types FindCell() can be implemented very simply (e.g.,
##  vtkImageData) while in other datasets it is a complex operation requiring
##  supplemental objects like locators to perform efficiently. In particular,
##  vtkPointSet and its subclasses (like vtkUnstructuredGrid) require complex
##  strategies to efficiently implement the FindCell() operation. Subclasses
##  of the abstract vtkFindCellStrategy implement several of these strategies.
##
##  The are two key methods to this class and subclasses. The Initialize()
##  method negotiates with an input dataset to define the locator to use:
##  either a locator associated with the input dataset, or possibly an
##  alternative locator defined by the strategy (subclasses of
##  vtkFindCellStrategy do this). The second important method, FindCell()
##  mimics vtkDataSet::FindCell() and can be used in place of it.
##
##  Note that vtkFindCellStrategy is in general not thread-safe as the
##  strategies contain state used to accelerate the search process. Hence
##  if multiple threads are attempting to invoke FindCell(), each thread
##  needs to have its own instance of the vtkFindCellStrategy.
##
##  @sa
##  vtkPointSet vtkPolyData vtkStructuredGrid vtkUnstructuredGrid
##  vtkAbstractInterpolatedVelocityField vtkClosetPointStrategy
##  vtkCellLocatorStrategy vtkClosestNPointsStrategy
##

import
  vtkCommonDataModelModule, vtkObject

discard "forward decl of vtkCell"
discard "forward decl of vtkGenericCell"
discard "forward decl of vtkPointSet"
type
  vtkFindCellStrategy* {.importcpp: "vtkFindCellStrategy",
                        header: "vtkFindCellStrategy.h", bycopy.} = object of vtkObject ## /@{
                                                                                 ## *
                                                                                 ##  Standard methods for type information and printing.
                                                                                 ##
    vtkFindCellStrategy* {.importc: "vtkFindCellStrategy".}: VTK_NEWINSTANCE
    ##  vtkPointSet which this strategy is associated with
    ##  bounding box of vtkPointSet
    ##  time at which strategy was initialized

  vtkFindCellStrategySuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkFindCellStrategy::IsTypeOf(@)", header: "vtkFindCellStrategy.h".}
proc IsA*(this: var vtkFindCellStrategy; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkFindCellStrategy.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkFindCellStrategy {.
    importcpp: "vtkFindCellStrategy::SafeDownCast(@)",
    header: "vtkFindCellStrategy.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkFindCellStrategy :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFindCellStrategy :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFindCellStrategy :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkFindCellStrategy; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkFindCellStrategy.h".}
proc Initialize*(this: var vtkFindCellStrategy; ps: ptr vtkPointSet): cint {.
    importcpp: "Initialize", header: "vtkFindCellStrategy.h".}
proc FindCell*(this: var vtkFindCellStrategy; x: array[3, cdouble]; cell: ptr vtkCell;
              gencell: ptr vtkGenericCell; cellId: vtkIdType; tol2: cdouble;
              subId: var cint; pcoords: array[3, cdouble]; weights: ptr cdouble): vtkIdType {.
    importcpp: "FindCell", header: "vtkFindCellStrategy.h".}
proc FindClosestPointWithinRadius*(this: var vtkFindCellStrategy;
                                  x: array[3, cdouble]; radius: cdouble;
                                  closestPoint: array[3, cdouble];
                                  cell: ptr vtkGenericCell; cellId: var vtkIdType;
                                  subId: var cint; dist2: var cdouble;
                                  inside: var cint): vtkIdType {.
    importcpp: "FindClosestPointWithinRadius", header: "vtkFindCellStrategy.h".}
proc InsideCellBounds*(this: var vtkFindCellStrategy; x: array[3, cdouble];
                      cellId: vtkIdType): bool {.importcpp: "InsideCellBounds",
    header: "vtkFindCellStrategy.h".}
proc CopyParameters*(this: var vtkFindCellStrategy; `from`: ptr vtkFindCellStrategy) {.
    importcpp: "CopyParameters", header: "vtkFindCellStrategy.h".}