## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRemoveHiddenData.h
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
##  @class   vtkRemoveHiddenData
##  @brief   Removes the rows/edges/vertices of
##  input data flagged by ann.
##
##
##  Output only those rows/vertices/edges of the input vtkDataObject that
##  are visible, as defined by the vtkAnnotation::HIDE() flag of the input
##  vtkAnnotationLayers.
##  Inputs:
##     Port 0 - vtkDataObject
##     Port 1 - vtkAnnotationLayers (optional)
##
##

import
  vtkInfovisCoreModule, vtkPassInputTypeAlgorithm, vtkSmartPointer

discard "forward decl of vtkExtractSelectedGraph"
discard "forward decl of vtkExtractSelectedRows"
type
  vtkRemoveHiddenData* {.importcpp: "vtkRemoveHiddenData",
                        header: "vtkRemoveHiddenData.h", bycopy.} = object of vtkPassInputTypeAlgorithm
    vtkRemoveHiddenData* {.importc: "vtkRemoveHiddenData".}: VTK_NEWINSTANCE


proc New*(): ptr vtkRemoveHiddenData {.importcpp: "vtkRemoveHiddenData::New(@)",
                                   header: "vtkRemoveHiddenData.h".}
type
  vtkRemoveHiddenDataSuperclass* = vtkPassInputTypeAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkRemoveHiddenData::IsTypeOf(@)", header: "vtkRemoveHiddenData.h".}
proc IsA*(this: var vtkRemoveHiddenData; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkRemoveHiddenData.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkRemoveHiddenData {.
    importcpp: "vtkRemoveHiddenData::SafeDownCast(@)",
    header: "vtkRemoveHiddenData.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkRemoveHiddenData :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkRemoveHiddenData :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkRemoveHiddenData :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkRemoveHiddenData; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkRemoveHiddenData.h".}