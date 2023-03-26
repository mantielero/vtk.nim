## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMappedUnstructuredGridCellIterator.h
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
##  @class   vtkMappedUnstructuredGridCellIterator
##  @brief   Default cell iterator for
##  vtkMappedUnstructuredGrid.
##
##
##  This class is used by default for vtkMappedUnstructedGrid instances. It
##  uses random access for data lookups. Custom vtkCellIterator implementations
##  should be used instead when random-access is inefficient.
##

import
  vtkCellIterator, vtkSmartPointer

discard "forward decl of vtkMappedUnstructuredGrid"
type
  vtkMappedUnstructuredGridCellIterator*[Implementation] {.
      importcpp: "vtkMappedUnstructuredGridCellIterator<\'0>",
      header: "vtkMappedUnstructuredGridCellIterator.h", bycopy.} = object of vtkCellIterator
    vtkMappedUnstructuredGridCellIterator*
        {.importc: "vtkMappedUnstructuredGridCellIterator".}: VTK_NEWINSTANCE

  vtkMappedUnstructuredGridCellIteratorSuperclass* = vtkCellIterator

proc IsTypeOf*[Implementation](`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMappedUnstructuredGridCellIterator::IsTypeOf(@)",
    header: "vtkMappedUnstructuredGridCellIterator.h".}
proc IsA*[Implementation](this: var vtkMappedUnstructuredGridCellIterator[
    Implementation]; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkMappedUnstructuredGridCellIterator.h".}
proc SafeDownCast*[Implementation](o: ptr vtkObjectBase): ptr vtkMappedUnstructuredGridCellIterator[
    Implementation] {.importcpp: "vtkMappedUnstructuredGridCellIterator::SafeDownCast(@)",
                     header: "vtkMappedUnstructuredGridCellIterator.h".}
## !!!Ignored construct:  < Implementation > * NewInstance ( ) const { return vtkMappedUnstructuredGridCellIterator < Implementation > :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( typeid ( vtkMappedUnstructuredGridCellIterator < Implementation > ) . name ( ) , type ) ) { return 0 ; } return 1 + vtkCellIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMappedUnstructuredGridCellIterator < Implementation > :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : ;
## Error: identifier expected, but got: <!!!

type
  vtkMappedUnstructuredGridCellIteratorImplementationType*[Implementation] = Implementation
  vtkMappedUnstructuredGridCellIteratorThisType* = vtkMappedUnstructuredGridCellIterator[
      vtkMappedUnstructuredGridCellIteratorImplementationType]

proc New*[Implementation](): ptr vtkMappedUnstructuredGridCellIterator[
    vtkMappedUnstructuredGridCellIteratorImplementationType] {.
    importcpp: "vtkMappedUnstructuredGridCellIterator::New(@)",
    header: "vtkMappedUnstructuredGridCellIterator.h".}
proc PrintSelf*[Implementation](this: var vtkMappedUnstructuredGridCellIterator[
    Implementation]; os: var ostream; indent: vtkIndent) {.importcpp: "PrintSelf",
    header: "vtkMappedUnstructuredGridCellIterator.h".}
proc SetMappedUnstructuredGrid*[Implementation](
    this: var vtkMappedUnstructuredGridCellIterator[Implementation]; grid: ptr vtkMappedUnstructuredGrid[
    vtkMappedUnstructuredGridCellIteratorImplementationType,
    vtkMappedUnstructuredGridCellIteratorThisType]) {.
    importcpp: "SetMappedUnstructuredGrid",
    header: "vtkMappedUnstructuredGridCellIterator.h".}
proc IsDoneWithTraversal*[Implementation](
    this: var vtkMappedUnstructuredGridCellIterator[Implementation]): bool {.
    importcpp: "IsDoneWithTraversal",
    header: "vtkMappedUnstructuredGridCellIterator.h".}
proc GetCellId*[Implementation](this: var vtkMappedUnstructuredGridCellIterator[
    Implementation]): vtkIdType {.importcpp: "GetCellId", header: "vtkMappedUnstructuredGridCellIterator.h".}
import
  vtkMappedUnstructuredGridCellIterator

##  VTK-HeaderTest-Exclude: vtkMappedUnstructuredGridCellIterator.h
