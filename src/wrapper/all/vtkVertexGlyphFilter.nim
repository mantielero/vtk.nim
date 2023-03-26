## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVertexGlyphFilter.h
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
##  @class   vtkVertexGlyphFilter
##  @brief   Make a vtkPolyData with a vertex on each point.
##
##
##
##  This filter throws away all of the cells in the input and replaces them with
##  a vertex on each point.  The intended use of this filter is roughly
##  equivalent to the vtkGlyph3D filter, except this filter is specifically for
##  data that has many vertices, making the rendered result faster and less
##  cluttered than the glyph filter. This filter may take a graph or point set
##  as input.
##
##

import
  vtkFiltersGeneralModule, vtkPolyDataAlgorithm

type
  vtkVertexGlyphFilter* {.importcpp: "vtkVertexGlyphFilter",
                         header: "vtkVertexGlyphFilter.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkVertexGlyphFilter* {.importc: "vtkVertexGlyphFilter".}: VTK_NEWINSTANCE

  vtkVertexGlyphFilterSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVertexGlyphFilter::IsTypeOf(@)",
    header: "vtkVertexGlyphFilter.h".}
proc IsA*(this: var vtkVertexGlyphFilter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkVertexGlyphFilter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVertexGlyphFilter {.
    importcpp: "vtkVertexGlyphFilter::SafeDownCast(@)",
    header: "vtkVertexGlyphFilter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVertexGlyphFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVertexGlyphFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVertexGlyphFilter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVertexGlyphFilter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVertexGlyphFilter.h".}
proc New*(): ptr vtkVertexGlyphFilter {.importcpp: "vtkVertexGlyphFilter::New(@)",
                                    header: "vtkVertexGlyphFilter.h".}