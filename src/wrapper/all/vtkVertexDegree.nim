## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVertexDegree.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkVertexDegree
##  @brief   Adds an attribute array with the degree of each vertex
##
##
##  Adds an attribute array with the degree of each vertex. By default the name
##  of the array will be "VertexDegree", but that can be changed by calling
##  SetOutputArrayName("foo");
##

import
  vtkGraphAlgorithm, vtkInfovisCoreModule

type
  vtkVertexDegree* {.importcpp: "vtkVertexDegree", header: "vtkVertexDegree.h",
                    bycopy.} = object of vtkGraphAlgorithm
    vtkVertexDegree* {.importc: "vtkVertexDegree".}: VTK_NEWINSTANCE


proc New*(): ptr vtkVertexDegree {.importcpp: "vtkVertexDegree::New(@)",
                               header: "vtkVertexDegree.h".}
type
  vtkVertexDegreeSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVertexDegree::IsTypeOf(@)", header: "vtkVertexDegree.h".}
proc IsA*(this: var vtkVertexDegree; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVertexDegree.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVertexDegree {.
    importcpp: "vtkVertexDegree::SafeDownCast(@)", header: "vtkVertexDegree.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVertexDegree :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVertexDegree :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVertexDegree :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVertexDegree; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVertexDegree.h".}
proc SetOutputArrayName*(this: var vtkVertexDegree; _arg: cstring) {.
    importcpp: "SetOutputArrayName", header: "vtkVertexDegree.h".}
  ## /@}