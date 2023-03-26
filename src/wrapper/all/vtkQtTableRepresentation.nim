## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkQtTableRepresentation.h
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
## ----------------------------------------------------------------------------
##  Copyright (c) Sandia Corporation
##  See Copyright.txt or http://www.paraview.org/HTML/Copyright.html for details.
## ----------------------------------------------------------------------------
## *
##  @class   vtkQtTableRepresentation
##  @brief   set up a vtkTable in a Qt model
##
##
##
##  This class is a wrapper around vtkQtTableModelAdapter.  It
##  performs the following functions:
##
##  <ul>
##  <li>Keep track of the key column, first data column, and last data column.
##      Populate the appropriate ivars on the Qt adapter.
##  <li>Assign colors to each of the data series using a vtkLookupTable.
##      A default lookup table is provided or the user can supply one
##      using SetColorTable().
##  </ul>
##
##  The user must supply the following items:
##  <ul>
##  <li>the name of the column that contains the series names,
##  <li>the names of the first and last data columns
##      (this range should not contain the key column), and
##  <li>(optionally) a vtkLookupTable to use when assigning colors.
##  </ul>
##
##
##  @warning
##  Call SetInputConnection with a table connection
##  BEFORE the representation is added to a view or strange things
##  may happen, including segfaults.
##

import
  vtkDataRepresentation, vtkViewsQtModule

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkLookupTable"
discard "forward decl of vtkQtTableModelAdapter"
type
  vtkQtTableRepresentation* {.importcpp: "vtkQtTableRepresentation",
                             header: "vtkQtTableRepresentation.h", bycopy.} = object of vtkDataRepresentation
    vtkQtTableRepresentation* {.importc: "vtkQtTableRepresentation".}: VTK_NEWINSTANCE
    ## *
    ##  Prepare the input connections to this representation.
    ##

  vtkQtTableRepresentationSuperclass* = vtkDataRepresentation

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkQtTableRepresentation::IsTypeOf(@)",
    header: "vtkQtTableRepresentation.h".}
proc IsA*(this: var vtkQtTableRepresentation; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkQtTableRepresentation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkQtTableRepresentation {.
    importcpp: "vtkQtTableRepresentation::SafeDownCast(@)",
    header: "vtkQtTableRepresentation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkQtTableRepresentation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkQtTableRepresentation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkQtTableRepresentation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkQtTableRepresentation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkQtTableRepresentation.h".}
proc SetColorTable*(this: var vtkQtTableRepresentation; t: ptr vtkLookupTable) {.
    importcpp: "SetColorTable", header: "vtkQtTableRepresentation.h".}
proc GetnameColorTable*(this: var vtkQtTableRepresentation): ptr vtkLookupTable {.
    importcpp: "GetnameColorTable", header: "vtkQtTableRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the name of the column that contains series names.  This
  ##  must be called BEFORE the representation is added to a view.
  ##
proc SetKeyColumn*(this: var vtkQtTableRepresentation; col: cstring) {.
    importcpp: "SetKeyColumn", header: "vtkQtTableRepresentation.h".}
proc GetKeyColumn*(this: var vtkQtTableRepresentation): cstring {.
    importcpp: "GetKeyColumn", header: "vtkQtTableRepresentation.h".}
proc SetFirstDataColumn*(this: var vtkQtTableRepresentation; _arg: cstring) {.
    importcpp: "SetFirstDataColumn", header: "vtkQtTableRepresentation.h".}
proc GetFirstDataColumn*(this: var vtkQtTableRepresentation): cstring {.
    importcpp: "GetFirstDataColumn", header: "vtkQtTableRepresentation.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the name of the last data column.  This must be called
  ##  BEFORE the representation is added to a view.
  ##
proc SetFirstDataColumnLastDataColumn*(this: var vtkQtTableRepresentation;
                                      _arg: cstring) {.
    importcpp: "SetFirstDataColumnLastDataColumn",
    header: "vtkQtTableRepresentation.h".}
proc GetFirstDataColumnLastDataColumn*(this: var vtkQtTableRepresentation): cstring {.
    importcpp: "GetFirstDataColumnLastDataColumn",
    header: "vtkQtTableRepresentation.h".}
  ## /@}