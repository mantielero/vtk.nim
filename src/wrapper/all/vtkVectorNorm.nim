## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVectorNorm.h
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
##  @class   vtkVectorNorm
##  @brief   generate scalars from Euclidean norm of vectors
##
##  vtkVectorNorm is a filter that generates scalar values by computing
##  Euclidean norm of vector triplets. Scalars can be normalized
##  0<=s<=1 if desired.
##
##  Note that this filter operates on point or cell attribute data, or
##  both.  By default, the filter operates on both point and cell data
##  if vector point and cell data, respectively, are available from the
##  input. Alternatively, you can choose to generate scalar norm values
##  for just cell or point data.
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##

const
  VTK_ATTRIBUTE_MODE_DEFAULT* = 0
  VTK_ATTRIBUTE_MODE_USE_POINT_DATA* = 1
  VTK_ATTRIBUTE_MODE_USE_CELL_DATA* = 2

import
  vtkDataSetAlgorithm, vtkFiltersCoreModule

type
  vtkVectorNorm* {.importcpp: "vtkVectorNorm", header: "vtkVectorNorm.h", bycopy.} = object of vtkDataSetAlgorithm
    vtkVectorNorm* {.importc: "vtkVectorNorm".}: VTK_NEWINSTANCE
    ##  normalize 0<=n<=1 if true.
    ##  control whether to use point or cell data, or both

  vtkVectorNormSuperclass* = vtkDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkVectorNorm::IsTypeOf(@)", header: "vtkVectorNorm.h".}
proc IsA*(this: var vtkVectorNorm; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkVectorNorm.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkVectorNorm {.
    importcpp: "vtkVectorNorm::SafeDownCast(@)", header: "vtkVectorNorm.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkVectorNorm :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVectorNorm :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVectorNorm :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkVectorNorm; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkVectorNorm.h".}
proc New*(): ptr vtkVectorNorm {.importcpp: "vtkVectorNorm::New(@)",
                             header: "vtkVectorNorm.h".}
proc SetNormalize*(this: var vtkVectorNorm; _arg: vtkTypeBool) {.
    importcpp: "SetNormalize", header: "vtkVectorNorm.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetNormalize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Normalize  of  << this -> Normalize ) ; return this -> Normalize ; } ;
## Error: expected ';'!!!

proc NormalizeOn*(this: var vtkVectorNorm) {.importcpp: "NormalizeOn",
    header: "vtkVectorNorm.h".}
proc NormalizeOff*(this: var vtkVectorNorm) {.importcpp: "NormalizeOff",
    header: "vtkVectorNorm.h".}
  ## /@{
  ## *
  ##  Control how the filter works to generate scalar data from the
  ##  input vector data. By default, (AttributeModeToDefault) the
  ##  filter will generate the scalar norm for point and cell data (if
  ##  vector data present in the input). Alternatively, you can
  ##  explicitly set the filter to generate point data
  ##  (AttributeModeToUsePointData) or cell data
  ##  (AttributeModeToUseCellData).
  ##
proc SetNormalizeAttributeMode*(this: var vtkVectorNorm; _arg: cint) {.
    importcpp: "SetNormalizeAttributeMode", header: "vtkVectorNorm.h".}
## !!!Ignored construct:  virtual int GetNormalizeAttributeMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AttributeMode  of  << this -> AttributeMode ) ; return this -> AttributeMode ; } ;
## Error: expected ';'!!!

proc SetAttributeModeToDefault*(this: var vtkVectorNorm) {.
    importcpp: "SetAttributeModeToDefault", header: "vtkVectorNorm.h".}
proc SetAttributeModeToUsePointData*(this: var vtkVectorNorm) {.
    importcpp: "SetAttributeModeToUsePointData", header: "vtkVectorNorm.h".}
proc SetAttributeModeToUseCellData*(this: var vtkVectorNorm) {.
    importcpp: "SetAttributeModeToUseCellData", header: "vtkVectorNorm.h".}
proc GetAttributeModeAsString*(this: var vtkVectorNorm): cstring {.
    importcpp: "GetAttributeModeAsString", header: "vtkVectorNorm.h".}