## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDataObjectTreeInternals.h
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
##  @class   vtkDataObjectTreeInternals
##
##

import
  vtkDataObject, vtkInformation, vtkSmartPointer

## -----------------------------------------------------------------------------
##  Item in the VectorOfDataObjects.

type
  vtkDataObjectTreeItem* {.importcpp: "vtkDataObjectTreeItem",
                          header: "vtkDataObjectTreeInternals.h", bycopy.} = object
    DataObject* {.importc: "DataObject".}: vtkSmartPointer[vtkDataObject]
    MetaData* {.importc: "MetaData".}: vtkSmartPointer[vtkInformation]


proc constructvtkDataObjectTreeItem*(dobj: ptr vtkDataObject = nil;
                                    info: ptr vtkInformation = nil): vtkDataObjectTreeItem {.
    constructor, importcpp: "vtkDataObjectTreeItem(@)",
    header: "vtkDataObjectTreeInternals.h".}
## -----------------------------------------------------------------------------

type
  vtkDataObjectTreeInternals* {.importcpp: "vtkDataObjectTreeInternals",
                               header: "vtkDataObjectTreeInternals.h", bycopy.} = object
    Children* {.importc: "Children".}: vtkDataObjectTreeInternalsVectorOfDataObjects

  vtkDataObjectTreeInternalsVectorOfDataObjects* = vector[vtkDataObjectTreeItem]
  vtkDataObjectTreeInternalsIterator* = `iterator`
  vtkDataObjectTreeInternalsReverseIterator* = reverse_iterator

## -----------------------------------------------------------------------------

type
  vtkDataObjectTreeIndex* {.importcpp: "vtkDataObjectTreeIndex",
                           header: "vtkDataObjectTreeInternals.h", bycopy.} = object of vector[
      cuint]


##  VTK-HeaderTest-Exclude: vtkDataObjectTreeInternals.h
