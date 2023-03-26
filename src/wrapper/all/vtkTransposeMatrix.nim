## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransposeMatrix.h
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
##  @class   vtkTransposeMatrix
##  @brief   Computes the transpose of an input matrix.
##
##  @par Thanks:
##  Developed by Timothy M. Shead (tshead@sandia.gov) at Sandia National Laboratories.
##

import
  vtkArrayDataAlgorithm, vtkInfovisCoreModule

type
  vtkTransposeMatrix* {.importcpp: "vtkTransposeMatrix",
                       header: "vtkTransposeMatrix.h", bycopy.} = object of vtkArrayDataAlgorithm
    vtkTransposeMatrix* {.importc: "vtkTransposeMatrix".}: VTK_NEWINSTANCE


proc New*(): ptr vtkTransposeMatrix {.importcpp: "vtkTransposeMatrix::New(@)",
                                  header: "vtkTransposeMatrix.h".}
type
  vtkTransposeMatrixSuperclass* = vtkArrayDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkTransposeMatrix::IsTypeOf(@)", header: "vtkTransposeMatrix.h".}
proc IsA*(this: var vtkTransposeMatrix; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkTransposeMatrix.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkTransposeMatrix {.
    importcpp: "vtkTransposeMatrix::SafeDownCast(@)",
    header: "vtkTransposeMatrix.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkTransposeMatrix :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArrayDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransposeMatrix :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransposeMatrix :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkTransposeMatrix; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkTransposeMatrix.h".}