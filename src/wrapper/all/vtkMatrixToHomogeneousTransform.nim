## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMatrixToHomogeneousTransform.h
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
##  @class   vtkMatrixToHomogeneousTransform
##  @brief   convert a matrix to a transform
##
##  This is a very simple class which allows a vtkMatrix4x4 to be used in
##  place of a vtkHomogeneousTransform or vtkAbstractTransform.  For example,
##  if you use it as a proxy between a matrix and vtkTransformPolyDataFilter
##  then any modifications to the matrix will automatically be reflected in
##  the output of the filter.
##  @sa
##  vtkPerspectiveTransform vtkMatrix4x4 vtkMatrixToLinearTransform
##

import
  vtkCommonTransformsModule, vtkHomogeneousTransform

discard "forward decl of vtkMatrix4x4"
type
  vtkMatrixToHomogeneousTransform* {.importcpp: "vtkMatrixToHomogeneousTransform", header: "vtkMatrixToHomogeneousTransform.h",
                                    bycopy.} = object of vtkHomogeneousTransform
    vtkMatrixToHomogeneousTransform* {.importc: "vtkMatrixToHomogeneousTransform".}: VTK_NEWINSTANCE


proc New*(): ptr vtkMatrixToHomogeneousTransform {.
    importcpp: "vtkMatrixToHomogeneousTransform::New(@)",
    header: "vtkMatrixToHomogeneousTransform.h".}
type
  vtkMatrixToHomogeneousTransformSuperclass* = vtkHomogeneousTransform

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMatrixToHomogeneousTransform::IsTypeOf(@)",
    header: "vtkMatrixToHomogeneousTransform.h".}
proc IsA*(this: var vtkMatrixToHomogeneousTransform; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMatrixToHomogeneousTransform.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMatrixToHomogeneousTransform {.
    importcpp: "vtkMatrixToHomogeneousTransform::SafeDownCast(@)",
    header: "vtkMatrixToHomogeneousTransform.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMatrixToHomogeneousTransform :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkHomogeneousTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMatrixToHomogeneousTransform :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMatrixToHomogeneousTransform :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMatrixToHomogeneousTransform; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf",
                                  header: "vtkMatrixToHomogeneousTransform.h".}
proc SetInput*(this: var vtkMatrixToHomogeneousTransform; a2: ptr vtkMatrix4x4) {.
    importcpp: "SetInput", header: "vtkMatrixToHomogeneousTransform.h".}
proc GetnameInput*(this: var vtkMatrixToHomogeneousTransform): ptr vtkMatrix4x4 {.
    importcpp: "GetnameInput", header: "vtkMatrixToHomogeneousTransform.h".}
  ## *
  ##  The input matrix is left as-is, but the transformation matrix
  ##  is inverted.
  ##
proc Inverse*(this: var vtkMatrixToHomogeneousTransform) {.importcpp: "Inverse",
    header: "vtkMatrixToHomogeneousTransform.h".}
proc GetMTime*(this: var vtkMatrixToHomogeneousTransform): vtkMTimeType {.
    importcpp: "GetMTime", header: "vtkMatrixToHomogeneousTransform.h".}
proc MakeTransform*(this: var vtkMatrixToHomogeneousTransform): ptr vtkAbstractTransform {.
    importcpp: "MakeTransform", header: "vtkMatrixToHomogeneousTransform.h".}