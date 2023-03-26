## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkDiagonalMatrixSource.h
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
##  @class   vtkDiagonalMatrixSource
##  @brief   generates a sparse or dense square matrix
##  with user-specified values for the diagonal, superdiagonal, and subdiagonal.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayDataAlgorithm, vtkFiltersSourcesModule

discard "forward decl of vtkArray"
type
  vtkDiagonalMatrixSource* {.importcpp: "vtkDiagonalMatrixSource",
                            header: "vtkDiagonalMatrixSource.h", bycopy.} = object of vtkArrayDataAlgorithm
    vtkDiagonalMatrixSource* {.importc: "vtkDiagonalMatrixSource".}: VTK_NEWINSTANCE


proc New*(): ptr vtkDiagonalMatrixSource {.importcpp: "vtkDiagonalMatrixSource::New(@)",
                                       header: "vtkDiagonalMatrixSource.h".}
type
  vtkDiagonalMatrixSourceSuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkDiagonalMatrixSource::IsTypeOf(@)",
    header: "vtkDiagonalMatrixSource.h".}
proc IsA*(this: var vtkDiagonalMatrixSource; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkDiagonalMatrixSource.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkDiagonalMatrixSource {.
    importcpp: "vtkDiagonalMatrixSource::SafeDownCast(@)",
    header: "vtkDiagonalMatrixSource.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkDiagonalMatrixSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkDiagonalMatrixSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkDiagonalMatrixSource :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkDiagonalMatrixSource; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkDiagonalMatrixSource.h".}
type
  vtkDiagonalMatrixSourceStorageType* {.size: sizeof(cint), importcpp: "vtkDiagonalMatrixSource::StorageType",
                                       header: "vtkDiagonalMatrixSource.h".} = enum
    DENSE, SPARSE


## !!!Ignored construct:  virtual int GetArrayType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ArrayType  of  << this -> ArrayType ) ; return this -> ArrayType ; } ;
## Error: expected ';'!!!

proc SetArrayType*(this: var vtkDiagonalMatrixSource; _arg: cint) {.
    importcpp: "SetArrayType", header: "vtkDiagonalMatrixSource.h".}
  ## /@{
  ## *
  ##  Stores the extents of the output matrix (which is square)
  ##
## !!!Ignored construct:  virtual vtkIdType GetArrayTypeExtents ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Extents  of  << this -> Extents ) ; return this -> Extents ; } ;
## Error: expected ';'!!!

proc SetArrayTypeExtents*(this: var vtkDiagonalMatrixSource; _arg: vtkIdType) {.
    importcpp: "SetArrayTypeExtents", header: "vtkDiagonalMatrixSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores the value that will be assigned to diagonal elements (default: 1)
  ##
## !!!Ignored construct:  virtual double GetArrayTypeExtentsDiagonal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Diagonal  of  << this -> Diagonal ) ; return this -> Diagonal ; } ;
## Error: expected ';'!!!

proc SetArrayTypeExtentsDiagonal*(this: var vtkDiagonalMatrixSource; _arg: cdouble) {.
    importcpp: "SetArrayTypeExtentsDiagonal", header: "vtkDiagonalMatrixSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores the value that will be assigned to superdiagonal elements (default: 0)
  ##
## !!!Ignored construct:  virtual double GetArrayTypeExtentsDiagonalSuperDiagonal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SuperDiagonal  of  << this -> SuperDiagonal ) ; return this -> SuperDiagonal ; } ;
## Error: expected ';'!!!

proc SetArrayTypeExtentsDiagonalSuperDiagonal*(this: var vtkDiagonalMatrixSource;
    _arg: cdouble) {.importcpp: "SetArrayTypeExtentsDiagonalSuperDiagonal",
                   header: "vtkDiagonalMatrixSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Stores the value that will be assigned to subdiagonal elements (default: 0)
  ##
## !!!Ignored construct:  virtual double GetArrayTypeExtentsDiagonalSuperDiagonalSubDiagonal ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubDiagonal  of  << this -> SubDiagonal ) ; return this -> SubDiagonal ; } ;
## Error: expected ';'!!!

proc SetArrayTypeExtentsDiagonalSuperDiagonalSubDiagonal*(
    this: var vtkDiagonalMatrixSource; _arg: cdouble) {.
    importcpp: "SetArrayTypeExtentsDiagonalSuperDiagonalSubDiagonal",
    header: "vtkDiagonalMatrixSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Controls the output matrix row dimension label.
  ##  Default: "rows"
  ##
proc GetRowLabel*(this: var vtkDiagonalMatrixSource): cstring {.
    importcpp: "GetRowLabel", header: "vtkDiagonalMatrixSource.h".}
proc SetRowLabel*(this: var vtkDiagonalMatrixSource; _arg: cstring) {.
    importcpp: "SetRowLabel", header: "vtkDiagonalMatrixSource.h".}
  ## /@}
  ## /@{
  ## *
  ##  Controls the output matrix column dimension label.
  ##  Default: "columns"
  ##
proc GetRowLabelColumnLabel*(this: var vtkDiagonalMatrixSource): cstring {.
    importcpp: "GetRowLabelColumnLabel", header: "vtkDiagonalMatrixSource.h".}
proc SetRowLabelColumnLabel*(this: var vtkDiagonalMatrixSource; _arg: cstring) {.
    importcpp: "SetRowLabelColumnLabel", header: "vtkDiagonalMatrixSource.h".}
  ## /@}