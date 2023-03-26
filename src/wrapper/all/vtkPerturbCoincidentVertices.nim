## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPerturbCoincidentVertices.h
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
##   Copyright 2009 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkPerturbCoincidentVertices
##  @brief   Perturbs vertices that are coincident.
##
##
##  This filter perturbs vertices in a graph that have coincident coordinates.
##  In particular this happens all the time with graphs that are georeferenced,
##  so we need a nice scheme to perturb the vertices so that when the user
##  zooms in the vertices can be distiquished.
##

import
  vtkGraphAlgorithm, vtkInfovisLayoutModule, vtkSmartPointer

discard "forward decl of vtkCoincidentPoints"
discard "forward decl of vtkDataSet"
type
  vtkPerturbCoincidentVertices* {.importcpp: "vtkPerturbCoincidentVertices",
                                 header: "vtkPerturbCoincidentVertices.h", bycopy.} = object of vtkGraphAlgorithm ##  This class might have more than one method of coincident resolution
    vtkPerturbCoincidentVertices* {.importc: "vtkPerturbCoincidentVertices".}: VTK_NEWINSTANCE


proc New*(): ptr vtkPerturbCoincidentVertices {.
    importcpp: "vtkPerturbCoincidentVertices::New(@)",
    header: "vtkPerturbCoincidentVertices.h".}
type
  vtkPerturbCoincidentVerticesSuperclass* = vtkGraphAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPerturbCoincidentVertices::IsTypeOf(@)",
    header: "vtkPerturbCoincidentVertices.h".}
proc IsA*(this: var vtkPerturbCoincidentVertices; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkPerturbCoincidentVertices.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPerturbCoincidentVertices {.
    importcpp: "vtkPerturbCoincidentVertices::SafeDownCast(@)",
    header: "vtkPerturbCoincidentVertices.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPerturbCoincidentVertices :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkGraphAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPerturbCoincidentVertices :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPerturbCoincidentVertices :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPerturbCoincidentVertices; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkPerturbCoincidentVertices.h".}
proc SetPerturbFactor*(this: var vtkPerturbCoincidentVertices; _arg: cdouble) {.
    importcpp: "SetPerturbFactor", header: "vtkPerturbCoincidentVertices.h".}
## !!!Ignored construct:  virtual double GetPerturbFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PerturbFactor  of  << this -> PerturbFactor ) ; return this -> PerturbFactor ; } ;
## Error: expected ';'!!!
