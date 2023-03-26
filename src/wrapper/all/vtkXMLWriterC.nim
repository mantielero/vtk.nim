## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLWriterC.h
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

import
  vtkIOXMLModule, vtkType

##  For scalar and vtkDataObject type enumerations.
## *
##  vtkXMLWriterC is an opaque structure holding the state of an
##  individual writer object.  It can be used to write VTK XML files.
##

type
  vtkXMLWriterC* = vtkXMLWriterC_s

## *
##  Create a new instance of vtkXMLWriterC.  Returns the object or nullptr
##  on failure.
##

proc vtkXMLWriterC_New*(): ptr vtkXMLWriterC {.importcpp: "vtkXMLWriterC_New(@)",
    header: "vtkXMLWriterC.h".}
## *
##  Delete the writer object.
##
##  This should not be called between Start and Stop calls.
##

proc vtkXMLWriterC_Delete*(self: ptr vtkXMLWriterC) {.
    importcpp: "vtkXMLWriterC_Delete(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the VTK data object type that will be written.  This
##  initializes an empty data object of the given type.
##
##  This must be set before setting geometry or data information can
##  can be set only once per writer object.
##

proc vtkXMLWriterC_SetDataObjectType*(self: ptr vtkXMLWriterC; objType: cint) {.
    importcpp: "vtkXMLWriterC_SetDataObjectType(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the VTK writer data mode to either:
##  - Ascii
##  - Binary
##  - Appended (default)
##
##  This may be used only after SetDataObjectType has been called.
##

proc vtkXMLWriterC_SetDataModeType*(self: ptr vtkXMLWriterC; datamodetype: cint) {.
    importcpp: "vtkXMLWriterC_SetDataModeType(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the extent of a structured data set.
##
##  This may be used only after SetDataObjectType has been called with
##  a structured data object type.
##

proc vtkXMLWriterC_SetExtent*(self: ptr vtkXMLWriterC; extent: array[6, cint]) {.
    importcpp: "vtkXMLWriterC_SetExtent(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the points of a point data set.  For structured data, the
##  number of points must match number of points indicated by the
##  extent.
##
##  Use dataType to specify the scalar type used in the given array.
##  The data array must have numPoints*3 entries specifying 3-D points.
##
##  This may not be used for data objects with implicit points.  It may
##  not be called before SetDataObjectType or between Start and Stop
##  calls.
##

proc vtkXMLWriterC_SetPoints*(self: ptr vtkXMLWriterC; dataType: cint; data: pointer;
                             numPoints: vtkIdType) {.
    importcpp: "vtkXMLWriterC_SetPoints(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the origin of an image data set.
##
##  This may only be used for image data.  It may not be called before
##  SetDataObjectType or between Start and Stop calls.
##

proc vtkXMLWriterC_SetOrigin*(self: ptr vtkXMLWriterC; origin: array[3, cdouble]) {.
    importcpp: "vtkXMLWriterC_SetOrigin(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the spacing of an image data set.
##
##  This may only be used for image data.  It may not be called before
##  SetDataObjectType or between Start and Stop calls.
##

proc vtkXMLWriterC_SetSpacing*(self: ptr vtkXMLWriterC; spacing: array[3, cdouble]) {.
    importcpp: "vtkXMLWriterC_SetSpacing(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the coordinates along one axis of a rectilinear grid data set.
##
##  Specify axis 0 for X, 1 for Y, and 2 for Z.  Use dataType to
##  specify the scalar type used in the given data array.  Use
##  numCoordinates to specify the number of such values in the array.
##  The number of values must match that specified by the extent for
##  the given axis.
##
##  This may only be used for rectilinear grids.  It may not be called
##  before SetDataObjectType or between Start and Stop calls.
##

proc vtkXMLWriterC_SetCoordinates*(self: ptr vtkXMLWriterC; axis: cint;
                                  dataType: cint; data: pointer;
                                  numCoordinates: vtkIdType) {.
    importcpp: "vtkXMLWriterC_SetCoordinates(@)", header: "vtkXMLWriterC.h".}
## *
##  Set a cell array on the data object to be written.  All cells must
##  have the same type.
##
##  For unstructured grid data objects, the cellType can be any type.
##  For polygonal data objects, the cellType must be VTK_VERTEX,
##  VTK_POLY_VERTEX, VTK_LINE, VTK_POLY_LINE, VTK_TRIANGLE,
##  VTK_TRIANGLE_STRIP, or cyclically connected simple cell type such
##  as VTK_POLYGON.
##
##  The cells array must have cellsSize entries.  Each cell uses N+1
##  entries where N is the number of points in the cell.  The layout of
##  the array for each cell is "[N,id1,id2,...,idN]".  The total number
##  of cells must be ncells.
##
##  This may only be used for unstructured grid and polygonal data
##  types.  It may not be called before SetDataObjectType or between
##  Start and Stop calls.
##

proc vtkXMLWriterC_SetCellsWithType*(self: ptr vtkXMLWriterC; cellType: cint;
                                    ncells: vtkIdType; cells: ptr vtkIdType;
                                    cellsSize: vtkIdType) {.
    importcpp: "vtkXMLWriterC_SetCellsWithType(@)", header: "vtkXMLWriterC.h".}
## *
##  Set a cell array on the data object to be written.  Each cell can
##  have its own type.
##
##  The cellTypes array specifies the type of each cell, and has ncells
##  entries.  The cells array must have cellsSize entries.  Each cell
##  uses N+1 entries where N is the number of points in the cell.  The
##  layout of the array for each cell is "[N,id1,id2,...,idN]".  The
##  total number of cells must be ncells.
##
##  This may only be used for unstructured grid data objects.  It may
##  not be called before SetDataObjectType or between Start and Stop
##  calls.
##

proc vtkXMLWriterC_SetCellsWithTypes*(self: ptr vtkXMLWriterC; cellTypes: ptr cint;
                                     ncells: vtkIdType; cells: ptr vtkIdType;
                                     cellsSize: vtkIdType) {.
    importcpp: "vtkXMLWriterC_SetCellsWithTypes(@)", header: "vtkXMLWriterC.h".}
## *
##  Set a point or cell data array by name.
##
##  The name of the array is required and should describe the purpose
##  of the data.  Use dataType to specify the scalar type used in the
##  given data array.  Use numTuples to specify the number of tuples
##  and numComponents to specify the number of scalar components in
##  each tuple.
##
##  The data array must have exactly numTuples*numComponents entries.
##  For SetPointData, numTuples must be equal to the number of points
##  indicated by SetExtent and/or SetPoints.  For SetCellData,
##  numTuples must be equal to the total number of cells set by
##  SetCells.
##
##  The role can be one of "SCALARS", "VECTORS", "NORMALS", "TENSORS",
##  or "TCOORDS" and specifies that the array should be designated as
##  the active array for the named role.  Other values for role are
##  ignored.
##
##  This may be used for all data types.  It may not be called before
##  SetDataObjectType but may be called between Start and Stop calls.
##

proc vtkXMLWriterC_SetPointData*(self: ptr vtkXMLWriterC; name: cstring;
                                dataType: cint; data: pointer; numTuples: vtkIdType;
                                numComponents: cint; role: cstring) {.
    importcpp: "vtkXMLWriterC_SetPointData(@)", header: "vtkXMLWriterC.h".}
proc vtkXMLWriterC_SetCellData*(self: ptr vtkXMLWriterC; name: cstring;
                               dataType: cint; data: pointer; numTuples: vtkIdType;
                               numComponents: cint; role: cstring) {.
    importcpp: "vtkXMLWriterC_SetCellData(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the name of the file into which the data are to be written.
##
##  This may be used for all data types.  It may not be called before
##  SetDataObjectType or between Start and Stop calls.
##

proc vtkXMLWriterC_SetFileName*(self: ptr vtkXMLWriterC; fileName: cstring) {.
    importcpp: "vtkXMLWriterC_SetFileName(@)", header: "vtkXMLWriterC.h".}
## *
##  Write the data to a file immediately.  This is not used when
##  writing time-series data.  Returns 1 for success and 0 for failure.
##
##  This may only be called after SetFileName and SetDataObjectType.
##

proc vtkXMLWriterC_Write*(self: ptr vtkXMLWriterC): cint {.
    importcpp: "vtkXMLWriterC_Write(@)", header: "vtkXMLWriterC.h".}
## *
##  Set the number of time steps that will be written between upcoming
##  Start and Stop calls.  This is used when writing time-series data.
##
##  This may be used for all data types.  It may not be called before
##  SetDataObjectType or between Start and Stop calls.
##

proc vtkXMLWriterC_SetNumberOfTimeSteps*(self: ptr vtkXMLWriterC; numTimeSteps: cint) {.
    importcpp: "vtkXMLWriterC_SetNumberOfTimeSteps(@)", header: "vtkXMLWriterC.h".}
## *
##  Start writing a time-series to the output file.
##
##  This may only be called after SetFileName, SetDataObjectType, and
##  SetNumberOfTimeSteps.  It may not be called a second time until
##  after an intervening call to Stop.
##

proc vtkXMLWriterC_Start*(self: ptr vtkXMLWriterC) {.
    importcpp: "vtkXMLWriterC_Start(@)", header: "vtkXMLWriterC.h".}
## *
##  Write one time step of a time-series to the output file.  The
##  current data set by SetPointData and SetCellData will be written.
##
##  Use timeValue to specify the time associated with the time step
##  being written.
##
##  This may only be called after Start has been called.  It should be
##  called NumberOfTimeSteps times before calling Stop.
##

proc vtkXMLWriterC_WriteNextTimeStep*(self: ptr vtkXMLWriterC; timeValue: cdouble) {.
    importcpp: "vtkXMLWriterC_WriteNextTimeStep(@)", header: "vtkXMLWriterC.h".}
## *
##  Stop writing a time-series to the output file.
##
##  This may only be called after Start and NumberOfTimeSteps calls to
##  WriteNextTimeStep.
##

proc vtkXMLWriterC_Stop*(self: ptr vtkXMLWriterC) {.
    importcpp: "vtkXMLWriterC_Stop(@)", header: "vtkXMLWriterC.h".}
##  VTK-HeaderTest-Exclude: vtkXMLWriterC.h
