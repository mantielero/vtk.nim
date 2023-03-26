## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformationInformationVectorKey.h
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
##  @class   vtkInformationInformationVectorKey
##  @brief   Key for vtkInformation vectors.
##
##  vtkInformationInformationVectorKey is used to represent keys in
##  vtkInformation for vectors of other vtkInformation objects.
##

import
  vtkCommonCoreModule, vtkInformationKey, vtkCommonInformationKeyManager

discard "forward decl of vtkInformationVector"
type
  vtkInformationInformationVectorKey* {.importcpp: "vtkInformationInformationVectorKey", header: "vtkInformationInformationVectorKey.h",
                                       bycopy.} = object of vtkInformationKey
    vtkInformationInformationVectorKey* {.
        importc: "vtkInformationInformationVectorKey".}: VTK_NEWINSTANCE

  vtkInformationInformationVectorKeySuperclass* = vtkInformationKey

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformationInformationVectorKey::IsTypeOf(@)",
    header: "vtkInformationInformationVectorKey.h".}
proc IsA*(this: var vtkInformationInformationVectorKey; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkInformationInformationVectorKey.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformationInformationVectorKey {.
    importcpp: "vtkInformationInformationVectorKey::SafeDownCast(@)",
    header: "vtkInformationInformationVectorKey.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformationInformationVectorKey :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkInformationKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformationInformationVectorKey :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformationInformationVectorKey :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformationInformationVectorKey; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkInformationInformationVectorKey.h".}
proc constructvtkInformationInformationVectorKey*(name: cstring; location: cstring): vtkInformationInformationVectorKey {.
    constructor, importcpp: "vtkInformationInformationVectorKey(@)",
    header: "vtkInformationInformationVectorKey.h".}
proc destroyvtkInformationInformationVectorKey*(
    this: var vtkInformationInformationVectorKey) {.
    importcpp: "#.~vtkInformationInformationVectorKey()",
    header: "vtkInformationInformationVectorKey.h".}
proc Set*(this: var vtkInformationInformationVectorKey; info: ptr vtkInformation;
         a3: ptr vtkInformationVector) {.importcpp: "Set", header: "vtkInformationInformationVectorKey.h".}
proc Get*(this: var vtkInformationInformationVectorKey; info: ptr vtkInformation): ptr vtkInformationVector {.
    importcpp: "Get", header: "vtkInformationInformationVectorKey.h".}
proc ShallowCopy*(this: var vtkInformationInformationVectorKey;
                 `from`: ptr vtkInformation; to: ptr vtkInformation) {.
    importcpp: "ShallowCopy", header: "vtkInformationInformationVectorKey.h".}
proc DeepCopy*(this: var vtkInformationInformationVectorKey;
              `from`: ptr vtkInformation; to: ptr vtkInformation) {.
    importcpp: "DeepCopy", header: "vtkInformationInformationVectorKey.h".}
proc Report*(this: var vtkInformationInformationVectorKey; info: ptr vtkInformation;
            collector: ptr vtkGarbageCollector) {.importcpp: "Report",
    header: "vtkInformationInformationVectorKey.h".}