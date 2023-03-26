## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUniformHyperTreeGridSource.h
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
##  @class   vtkUniformHyperTreeGridSource
##  @brief   Create a synthetic grid of uniform hypertrees.
##
##  This class uses input parameters, most notably a string descriptor,
##  to generate a vtkHyperTreeGrid instance representing the corresponding
##  tree-based AMR grid with uniform root cell sizes along each axis.
##
##  @sa
##  vtkHyperTreeGridSource vtkUniformHyperTreeGrid
##
##  @par Thanks:
##  This class was written by Philippe Pebay, NexGen Analytics 2017
##  This work was supported by Commissariat a l'Energie Atomique (CEA/DIF)
##  CEA, DAM, DIF, F-91297 Arpajon, France.
##

import
  vtkFiltersSourcesModule, vtkHyperTreeGridSource

type
  vtkUniformHyperTreeGridSource* {.importcpp: "vtkUniformHyperTreeGridSource",
                                  header: "vtkUniformHyperTreeGridSource.h",
                                  bycopy.} = object of vtkHyperTreeGridSource
    vtkUniformHyperTreeGridSource* {.importc: "vtkUniformHyperTreeGridSource".}: VTK_NEWINSTANCE

  vtkUniformHyperTreeGridSourceSuperclass* = vtkHyperTreeGridSource

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUniformHyperTreeGridSource::IsTypeOf(@)",
    header: "vtkUniformHyperTreeGridSource.h".}
proc IsA*(this: var vtkUniformHyperTreeGridSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUniformHyperTreeGridSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUniformHyperTreeGridSource {.
    importcpp: "vtkUniformHyperTreeGridSource::SafeDownCast(@)",
    header: "vtkUniformHyperTreeGridSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUniformHyperTreeGridSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHyperTreeGridSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUniformHyperTreeGridSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUniformHyperTreeGridSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkUniformHyperTreeGridSource; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkUniformHyperTreeGridSource.h".}
proc New*(): ptr vtkUniformHyperTreeGridSource {.
    importcpp: "vtkUniformHyperTreeGridSource::New(@)",
    header: "vtkUniformHyperTreeGridSource.h".}