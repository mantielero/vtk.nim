## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNormalizeMatrixVectors.h
##
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
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
##  @class   vtkNormalizeMatrixVectors
##  @brief   given a sparse input matrix, produces
##  a sparse output matrix with each vector normalized to unit length with respect
##  to a p-norm (default p=2).
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayDataAlgorithm, vtkFiltersGeneralModule

type
  vtkNormalizeMatrixVectors* {.importcpp: "vtkNormalizeMatrixVectors",
                              header: "vtkNormalizeMatrixVectors.h", bycopy.} = object of vtkArrayDataAlgorithm
    vtkNormalizeMatrixVectors* {.importc: "vtkNormalizeMatrixVectors".}: VTK_NEWINSTANCE


proc New*(): ptr vtkNormalizeMatrixVectors {.
    importcpp: "vtkNormalizeMatrixVectors::New(@)",
    header: "vtkNormalizeMatrixVectors.h".}
type
  vtkNormalizeMatrixVectorsSuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNormalizeMatrixVectors::IsTypeOf(@)",
    header: "vtkNormalizeMatrixVectors.h".}
proc IsA*(this: var vtkNormalizeMatrixVectors; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNormalizeMatrixVectors.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNormalizeMatrixVectors {.
    importcpp: "vtkNormalizeMatrixVectors::SafeDownCast(@)",
    header: "vtkNormalizeMatrixVectors.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNormalizeMatrixVectors :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNormalizeMatrixVectors :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNormalizeMatrixVectors :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkNormalizeMatrixVectors; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNormalizeMatrixVectors.h".}
## !!!Ignored construct:  /@{ *
##  Controls whether to normalize row-vectors or column-vectors.  0 = rows, 1 = columns.
##  virtual int GetVectorDimensionVectorDimension ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorDimension  of  << this -> VectorDimension ) ; return this -> VectorDimension ; } ;
## Error: expected ';'!!!

proc SetVectorDimension*(this: var vtkNormalizeMatrixVectors; _arg: cint) {.
    importcpp: "SetVectorDimension", header: "vtkNormalizeMatrixVectors.h".}
  ## /@}
  ## /@{
  ## *
  ##  Value of p in p-norm normalization, subject to p >= 1.  Default is p=2 (Euclidean norm).
  ##
## !!!Ignored construct:  virtual double GetVectorDimensionVectorDimensionPValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PValue  of  << this -> PValue ) ; return this -> PValue ; } ;
## Error: expected ';'!!!

proc SetVectorDimensionPValue*(this: var vtkNormalizeMatrixVectors; _arg: cdouble) {.
    importcpp: "SetVectorDimensionPValue", header: "vtkNormalizeMatrixVectors.h".}
  ## /@}