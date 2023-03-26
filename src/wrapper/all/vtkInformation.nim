## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkInformation.h
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
##  @class   vtkInformation
##  @brief   Store vtkAlgorithm input/output information.
##
##  vtkInformation represents information and/or data for one input or
##  one output of a vtkAlgorithm.  It maps from keys to values of
##  several data types.  Instances of this class are collected in
##  vtkInformationVector instances and passed to
##  vtkAlgorithm::ProcessRequest calls.  The information and
##  data referenced by the instance on a particular input or output
##  define the request made to the vtkAlgorithm instance.
##

import
  vtkCommonCoreModule, vtkObject

discard "forward decl of vtkDataObject"
discard "forward decl of vtkExecutive"
discard "forward decl of vtkInformationDataObjectKey"
discard "forward decl of vtkInformationDoubleKey"
discard "forward decl of vtkInformationDoubleVectorKey"
discard "forward decl of vtkInformationExecutivePortKey"
discard "forward decl of vtkInformationExecutivePortVectorKey"
discard "forward decl of vtkInformationIdTypeKey"
discard "forward decl of vtkInformationInformationKey"
discard "forward decl of vtkInformationInformationVectorKey"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationIntegerPointerKey"
discard "forward decl of vtkInformationIntegerVectorKey"
discard "forward decl of vtkInformationInternals"
discard "forward decl of vtkInformationKey"
discard "forward decl of vtkInformationKeyToInformationFriendship"
discard "forward decl of vtkInformationKeyVectorKey"
discard "forward decl of vtkInformationObjectBaseKey"
discard "forward decl of vtkInformationObjectBaseVectorKey"
discard "forward decl of vtkInformationRequestKey"
discard "forward decl of vtkInformationStringKey"
discard "forward decl of vtkInformationStringVectorKey"
discard "forward decl of vtkInformationUnsignedLongKey"
discard "forward decl of vtkInformationVariantKey"
discard "forward decl of vtkInformationVariantVectorKey"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkVariant"
type
  vtkInformation* {.importcpp: "vtkInformation", header: "vtkInformation.h", bycopy.} = object of vtkObject
    vtkInformation* {.importc: "vtkInformation".}: VTK_NEWINSTANCE
    VTK_WRAP_EXTERN* {.importc: "VTK_WRAP_EXTERN".}: vtkDataObject
    ##  Garbage collection support.


proc New*(): ptr vtkInformation {.importcpp: "vtkInformation::New(@)",
                              header: "vtkInformation.h".}
type
  vtkInformationSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkInformation::IsTypeOf(@)", header: "vtkInformation.h".}
proc IsA*(this: var vtkInformation; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkInformation.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkInformation {.
    importcpp: "vtkInformation::SafeDownCast(@)", header: "vtkInformation.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkInformation :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkInformation :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkInformation :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkInformation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkInformation.h".}
proc PrintKeys*(this: var vtkInformation; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintKeys", header: "vtkInformation.h".}
proc Modified*(this: var vtkInformation) {.importcpp: "Modified",
                                       header: "vtkInformation.h".}
proc Modified*(this: var vtkInformation; key: ptr vtkInformationKey) {.
    importcpp: "Modified", header: "vtkInformation.h".}
proc Clear*(this: var vtkInformation) {.importcpp: "Clear", header: "vtkInformation.h".}
proc GetNumberOfKeys*(this: var vtkInformation): cint {.importcpp: "GetNumberOfKeys",
    header: "vtkInformation.h".}
proc Copy*(this: var vtkInformation; `from`: ptr vtkInformation; deep: cint = 0) {.
    importcpp: "Copy", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; `from`: ptr vtkInformation; deep: cint = 0) {.
    importcpp: "Append", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationKey; deep: cint = 0) {.importcpp: "CopyEntry",
    header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationDataObjectKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationDoubleVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationVariantKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationVariantVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationInformationKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationInformationVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationIntegerKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationIntegerVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationObjectBaseVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationRequestKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationStringKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationStringVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntry*(this: var vtkInformation; `from`: ptr vtkInformation;
               key: ptr vtkInformationUnsignedLongKey; deep: cint = 0) {.
    importcpp: "CopyEntry", header: "vtkInformation.h".}
proc CopyEntries*(this: var vtkInformation; `from`: ptr vtkInformation;
                 key: ptr vtkInformationKeyVectorKey; deep: cint = 0) {.
    importcpp: "CopyEntries", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationRequestKey) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationRequestKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationRequestKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationIntegerKey; value: cint) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIntegerKey): cint {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationIntegerKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationIntegerKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationIdTypeKey; value: vtkIdType) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIdTypeKey): vtkIdType {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationIdTypeKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationIdTypeKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationDoubleKey; value: cdouble) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationDoubleKey): cdouble {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationDoubleKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationDoubleKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationVariantKey;
         value: vtkVariant) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationVariantKey): vtkVariant {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationVariantKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationVariantKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey;
            value: cint) {.importcpp: "Append", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey;
         value: ptr cint; length: cint) {.importcpp: "Set", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey;
         value1: cint; value2: cint; value3: cint) {.importcpp: "Set",
    header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey;
         value1: cint; value2: cint; value3: cint; value4: cint; value5: cint;
         value6: cint) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey): ptr cint {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey; idx: cint): cint {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey;
         value: ptr cint) {.importcpp: "Get", header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationIntegerVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey;
            value: cstring) {.importcpp: "Append", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey;
         value: cstring; idx: cint = 0) {.importcpp: "Set", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey;
            value: string) {.importcpp: "Append", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey;
         value: string; idx: cint = 0) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey;
         idx: cint = 0): cstring {.importcpp: "Get", header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationStringVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationIntegerPointerKey;
         value: ptr cint; length: cint) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIntegerPointerKey): ptr cint {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationIntegerPointerKey;
         value: ptr cint) {.importcpp: "Get", header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationIntegerPointerKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationIntegerPointerKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationIntegerPointerKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationUnsignedLongKey;
         value: culong) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationUnsignedLongKey): culong {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationUnsignedLongKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationUnsignedLongKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey;
            value: cdouble) {.importcpp: "Append", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey;
         value: ptr cdouble; length: cint) {.importcpp: "Set",
                                        header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey;
         value1: cdouble; value2: cdouble; value3: cdouble) {.importcpp: "Set",
    header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey;
         value1: cdouble; value2: cdouble; value3: cdouble; value4: cdouble;
         value5: cdouble; value6: cdouble) {.importcpp: "Set",
    header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey): ptr cdouble {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey; idx: cint): cdouble {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey;
         value: ptr cdouble) {.importcpp: "Get", header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationDoubleVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey;
            value: vtkVariant) {.importcpp: "Append", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey;
         value: ptr vtkVariant; length: cint) {.importcpp: "Set",
    header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey;
         value1: vtkVariant; value2: vtkVariant; value3: vtkVariant) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey;
         value1: vtkVariant; value2: vtkVariant; value3: vtkVariant;
         value4: vtkVariant; value5: vtkVariant; value6: vtkVariant) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey): ptr vtkVariant {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey; idx: cint): vtkVariant {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey;
         value: ptr vtkVariant) {.importcpp: "Get", header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationVariantVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationKey) {.importcpp: "AppendUnique",
    header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
         value: ptr ptr vtkInformationKey; length: cint) {.importcpp: "Set",
    header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationKey) {.importcpp: "Remove",
    header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey): ptr ptr vtkInformationKey {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey; idx: cint): ptr vtkInformationKey {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
         value: ptr ptr vtkInformationKey) {.importcpp: "Get",
    header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationDataObjectKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationDoubleKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationDoubleVectorKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationInformationKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationInformationVectorKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationIntegerKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationIntegerVectorKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationStringKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationStringVectorKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationObjectBaseKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
            value: ptr vtkInformationUnsignedLongKey) {.importcpp: "Append",
    header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationDataObjectKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationDoubleKey) {.importcpp: "AppendUnique",
    header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationDoubleVectorKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationInformationKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationInformationVectorKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationIntegerKey) {.importcpp: "AppendUnique",
    header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationIntegerVectorKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationStringKey) {.importcpp: "AppendUnique",
    header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationStringVectorKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationObjectBaseKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc AppendUnique*(this: var vtkInformation; key: ptr vtkInformationKeyVectorKey;
                  value: ptr vtkInformationUnsignedLongKey) {.
    importcpp: "AppendUnique", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationStringKey; a3: cstring) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationStringKey; a3: string) {.
    importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationStringKey): cstring {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationStringKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationStringKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationInformationKey;
         a3: ptr vtkInformation) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationInformationKey): ptr vtkInformation {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationInformationKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationInformationKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationInformationVectorKey;
         a3: ptr vtkInformationVector) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationInformationVectorKey): ptr vtkInformationVector {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationInformationVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationInformationVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationObjectBaseKey;
         a3: ptr vtkObjectBase) {.importcpp: "Set", header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationObjectBaseKey): ptr vtkObjectBase {.
    importcpp: "Get", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationObjectBaseKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationObjectBaseKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc Append*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey;
            data: ptr vtkObjectBase) {.importcpp: "Append",
                                    header: "vtkInformation.h".}
proc Set*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey;
         value: ptr vtkObjectBase; idx: cint = 0) {.importcpp: "Set",
    header: "vtkInformation.h".}
proc Get*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey;
         idx: cint = 0): ptr vtkObjectBase {.importcpp: "Get",
                                       header: "vtkInformation.h".}
proc Length*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey): cint {.
    importcpp: "Length", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey;
            objectToRemove: ptr vtkObjectBase) {.importcpp: "Remove",
    header: "vtkInformation.h".}
proc Remove*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey;
            indexToRemove: cint) {.importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationObjectBaseVectorKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
## !!!Ignored construct:  /@} /@{ *
##  Get/Set an entry storing a vtkDataObject instance.
##  void Set ( vtkInformationDataObjectKey * key , vtkDataObject VTK_WRAP_EXTERN * ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  * Get ( vtkInformationDataObjectKey * key ) ;
## Error: identifier expected, but got: *!!!

proc Remove*(this: var vtkInformation; key: ptr vtkInformationDataObjectKey) {.
    importcpp: "Remove", header: "vtkInformation.h".}
proc Has*(this: var vtkInformation; key: ptr vtkInformationDataObjectKey): cint {.
    importcpp: "Has", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationDataObjectKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationDoubleKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationDoubleVectorKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationInformationKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationInformationVectorKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationIntegerKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationIntegerVectorKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationRequestKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationStringKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationStringVectorKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationUnsignedLongKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationVariantKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc GetKey*(key: ptr vtkInformationVariantVectorKey): ptr vtkInformationKey {.
    importcpp: "vtkInformation::GetKey(@)", header: "vtkInformation.h".}
proc UsesGarbageCollector*(this: vtkInformation): bool {.noSideEffect,
    importcpp: "UsesGarbageCollector", header: "vtkInformation.h".}
proc SetRequest*(this: var vtkInformation; request: ptr vtkInformationRequestKey) {.
    importcpp: "SetRequest", header: "vtkInformation.h".}
proc GetRequest*(this: var vtkInformation): ptr vtkInformationRequestKey {.
    importcpp: "GetRequest", header: "vtkInformation.h".}