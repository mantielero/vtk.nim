## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericDataSet.h
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
##  @class   vtkGenericDataSet
##  @brief   defines dataset interface
##
##  In VTK, spatial-temporal data is defined in terms of a dataset. The
##  dataset consists of geometry (e.g., points), topology (e.g., cells), and
##  attributes (e.g., scalars, vectors, etc.) vtkGenericDataSet is an abstract
##  class defining this abstraction.
##
##  Since vtkGenericDataSet provides a general interface to manipulate data,
##  algorithms that process it tend to be slower than those specialized for a
##  particular data type. For this reason, there are concrete, non-abstract
##  subclasses that represent and provide access to data more efficiently.
##  Note that filters to process this dataset type are currently found in the
##  VTK/GenericFiltering/ subdirectory.
##
##  Unlike the vtkDataSet class, vtkGenericDataSet provides a more flexible
##  interface including support for iterators. vtkGenericDataSet is also
##  designed to interface VTK to external simulation packages without the
##  penalty of copying memory (see VTK/GenericFiltering/README.html) for
##  more information. Thus vtkGenericDataSet plays a central role in the
##  adaptor framework.
##
##  Please note that this class introduces the concepts of "boundary cells".
##  This refers to the boundaries of a cell (e.g., face of a tetrahedron)
##  which may in turn be represented as a cell. Boundary cells are derivative
##  topological features of cells, and are therefore never explicitly
##  represented in the dataset. Often in visualization algorithms, looping
##  over boundaries (edges or faces) is employed, while the actual dataset
##  cells may not traversed. Thus there are methods to loop over these
##  boundary cells.
##
##  Finally, as a point of clarification, points are not the same as vertices.
##  Vertices refer to points, and points specify a position is space. Vertices
##  are a type of 0-D cell. Also, the concept of a DOFNode, which is where
##  coefficients for higher-order cells are kept, is a new concept introduced
##  by the adaptor framework (see vtkGenericAdaptorCell for more information).
##
##  @sa
##  vtkGenericAdaptorCell vtkDataSet
##

import
  vtkCommonDataModelModule, vtkDataObject

discard "forward decl of vtkCellTypes"
discard "forward decl of vtkGenericCellIterator"
discard "forward decl of vtkGenericAttributeCollection"
discard "forward decl of vtkGenericCellTessellator"
discard "forward decl of vtkGenericPointIterator"
type
  vtkGenericDataSet* {.importcpp: "vtkGenericDataSet",
                      header: "vtkGenericDataSet.h", bycopy.} = object of vtkDataObject ## /@{
                                                                                 ## *
                                                                                 ##  Standard VTK type and print macros.
                                                                                 ##
                                                                                 ## *
                                                                                 ##  Constructor with uninitialized bounds (1,-1, 1,-1, 1,-1),
                                                                                 ##  empty attribute collection and default tessellator.
                                                                                 ##
    vtkGenericDataSet* {.importc: "vtkGenericDataSet".}: VTK_NEWINSTANCE
    virtual* {.importc: "virtual".}: VTK_NEWINSTANCE
    virtual* {.importc: "virtual".}: VTK_NEWINSTANCE
    virtual* {.importc: "virtual".}: VTK_NEWINSTANCE
    ##  Main helper class to tessellate a higher order cell into linear ones.
    ##  (xmin,xmax, ymin,ymax, zmin,zmax) geometric bounds
    ##  Center of the geometric bounding box
    ##  Time at which bounds, center, etc. computed

  vtkGenericDataSetSuperclass* = vtkDataObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkGenericDataSet::IsTypeOf(@)", header: "vtkGenericDataSet.h".}
proc IsA*(this: var vtkGenericDataSet; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkGenericDataSet.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkGenericDataSet {.
    importcpp: "vtkGenericDataSet::SafeDownCast(@)", header: "vtkGenericDataSet.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkGenericDataSet :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericDataSet :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericDataSet :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkGenericDataSet; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkGenericDataSet.h".}
proc GetNumberOfPoints*(this: var vtkGenericDataSet): vtkIdType {.
    importcpp: "GetNumberOfPoints", header: "vtkGenericDataSet.h".}
proc GetNumberOfCells*(this: var vtkGenericDataSet; dim: cint = -1): vtkIdType {.
    importcpp: "GetNumberOfCells", header: "vtkGenericDataSet.h".}
proc GetNumberOfElements*(this: var vtkGenericDataSet; `type`: cint): vtkIdType {.
    importcpp: "GetNumberOfElements", header: "vtkGenericDataSet.h".}
proc GetCellDimension*(this: var vtkGenericDataSet): cint {.
    importcpp: "GetCellDimension", header: "vtkGenericDataSet.h".}
proc GetCellTypes*(this: var vtkGenericDataSet; types: ptr vtkCellTypes) {.
    importcpp: "GetCellTypes", header: "vtkGenericDataSet.h".}
proc NewCellIterator*(this: var vtkGenericDataSet; dim: cint = -1): ptr vtkGenericCellIterator {.
    importcpp: "NewCellIterator", header: "vtkGenericDataSet.h".}
proc NewBoundaryIterator*(this: var vtkGenericDataSet; dim: cint = -1;
                         exteriorOnly: cint = 0): ptr vtkGenericCellIterator {.
    importcpp: "NewBoundaryIterator", header: "vtkGenericDataSet.h".}
proc NewPointIterator*(this: var vtkGenericDataSet): ptr vtkGenericPointIterator {.
    importcpp: "NewPointIterator", header: "vtkGenericDataSet.h".}
proc FindCell*(this: var vtkGenericDataSet; x: array[3, cdouble];
              cell: ptr vtkGenericCellIterator; tol2: cdouble; subId: var cint;
              pcoords: array[3, cdouble]): cint {.importcpp: "FindCell",
    header: "vtkGenericDataSet.h".}
proc FindPoint*(this: var vtkGenericDataSet; x: array[3, cdouble];
               p: ptr vtkGenericPointIterator) {.importcpp: "FindPoint",
    header: "vtkGenericDataSet.h".}
proc GetMTime*(this: var vtkGenericDataSet): vtkMTimeType {.importcpp: "GetMTime",
    header: "vtkGenericDataSet.h".}
proc ComputeBounds*(this: var vtkGenericDataSet) {.importcpp: "ComputeBounds",
    header: "vtkGenericDataSet.h".}
proc GetBounds*(this: var vtkGenericDataSet): ptr cdouble {.importcpp: "GetBounds",
    header: "vtkGenericDataSet.h".}
proc GetBounds*(this: var vtkGenericDataSet; bounds: array[6, cdouble]) {.
    importcpp: "GetBounds", header: "vtkGenericDataSet.h".}
proc GetCenter*(this: var vtkGenericDataSet): ptr cdouble {.importcpp: "GetCenter",
    header: "vtkGenericDataSet.h".}
proc GetCenter*(this: var vtkGenericDataSet; center: array[3, cdouble]) {.
    importcpp: "GetCenter", header: "vtkGenericDataSet.h".}
proc GetLength*(this: var vtkGenericDataSet): cdouble {.importcpp: "GetLength",
    header: "vtkGenericDataSet.h".}
proc GetnameAttributes*(this: var vtkGenericDataSet): ptr vtkGenericAttributeCollection {.
    importcpp: "GetnameAttributes", header: "vtkGenericDataSet.h".}
  ## /@}
  ## *
  ##  Returns the attributes of the data object of the specified
  ##  attribute type. The type may be:
  ##  <ul>
  ##  <li>POINT  - Defined in vtkDataSet subclasses.
  ##  <li>CELL   - Defined in vtkDataSet subclasses.
  ##  <li>VERTEX - Defined in vtkGraph subclasses.
  ##  <li>EDGE   - Defined in vtkGraph subclasses.
  ##  <li>ROW    - Defined in vtkTable.
  ##  </ul>
  ##  The other attribute type, FIELD, will return nullptr since
  ##  field data is stored as a vtkFieldData instance, not a
  ##  vtkDataSetAttributes instance. To retrieve field data, use
  ##  GetAttributesAsFieldData.
  ##
proc GetAttributes*(this: var vtkGenericDataSet; `type`: cint): ptr vtkDataSetAttributes {.
    importcpp: "GetAttributes", header: "vtkGenericDataSet.h".}
proc SetTessellator*(this: var vtkGenericDataSet;
                    tessellator: ptr vtkGenericCellTessellator) {.
    importcpp: "SetTessellator", header: "vtkGenericDataSet.h".}
proc GetnameAttributesTessellator*(this: var vtkGenericDataSet): ptr vtkGenericCellTessellator {.
    importcpp: "GetnameAttributesTessellator", header: "vtkGenericDataSet.h".}
  ## /@}
  ## *
  ##  Actual size of the data in kibibytes (1024 bytes); only valid after the pipeline has
  ##  updated. It is guaranteed to be greater than or equal to the memory
  ##  required to represent the data.
  ##
proc GetActualMemorySize*(this: var vtkGenericDataSet): culong {.
    importcpp: "GetActualMemorySize", header: "vtkGenericDataSet.h".}
proc GetDataObjectType*(this: var vtkGenericDataSet): cint {.
    importcpp: "GetDataObjectType", header: "vtkGenericDataSet.h".}
proc GetEstimatedSize*(this: var vtkGenericDataSet): vtkIdType {.
    importcpp: "GetEstimatedSize", header: "vtkGenericDataSet.h".}
proc GetData*(info: ptr vtkInformation): ptr vtkGenericDataSet {.
    importcpp: "vtkGenericDataSet::GetData(@)", header: "vtkGenericDataSet.h".}
proc GetData*(v: ptr vtkInformationVector; i: cint = 0): ptr vtkGenericDataSet {.
    importcpp: "vtkGenericDataSet::GetData(@)", header: "vtkGenericDataSet.h".}