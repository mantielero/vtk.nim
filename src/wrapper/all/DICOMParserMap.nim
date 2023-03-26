## =========================================================================
##
##   Program:   DICOMParser
##   Module:    DICOMParserMap.h
##   Language:  C++
##
##   Copyright (c) 2003 Matt Turek
##   All rights reserved.
##   See Copyright.txt for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================

when defined(_MSC_VER):
import
  DICOMConfig

discard "forward decl of DICOMCallback"
type
  group_element_compare* {.importcpp: "group_element_compare",
                          header: "DICOMParserMap.h", bycopy.} = object


proc `()`*(this: group_element_compare; p1: pair[doublebyte, doublebyte];
          p2: pair[doublebyte, doublebyte]): bool {.noSideEffect, importcpp: "#(@)",
    header: "DICOMParserMap.h".}
##
##  Typedef a pair of doublebytes
##

type
  DICOMMapKeyOverride* = pair[doublebyte, doublebyte]

##  DICOM_EXPIMP_TEMPLATE template struct DICOM_MAP_EXPORT dicom_stream::pair<doublebyte,
##  doublebyte>;
##
##  Subclass of a pair of doublebytes to make
##  type names shorter in the code.
##

type
  DICOMMapKey* {.importcpp: "DICOMMapKey", header: "DICOMParserMap.h", bycopy.} = object of DICOMMapKeyOverride


proc constructDICOMMapKey*(v1: doublebyte; v2: doublebyte): DICOMMapKey {.constructor,
    importcpp: "DICOMMapKey(@)", header: "DICOMParserMap.h".}
##
##  Typedef of a pair of doublebyte, vector.
##

type
  DICOMMapValueOverride* = pair[doublebyte, ptr vector[ptr DICOMCallback]]

##  DICOM_EXPIMP_TEMPLATE template struct DICOM_MAP_EXPORT dicom_stream::pair<doublebyte,
##  dicom_stream::vector<DICOMCallback*>*>;
##
##  Subclass of pair doublebyte, vector<DICOMCallback*>.
##  Makes types shorter in the code.
##

type
  DICOMMapValue* {.importcpp: "DICOMMapValue", header: "DICOMParserMap.h", bycopy.} = object of DICOMMapValueOverride


proc constructDICOMMapValue*(): DICOMMapValue {.constructor,
    importcpp: "DICOMMapValue(@)", header: "DICOMParserMap.h".}
proc constructDICOMMapValue*(v1: doublebyte; v2: ptr vector[ptr DICOMCallback]): DICOMMapValue {.
    constructor, importcpp: "DICOMMapValue(@)", header: "DICOMParserMap.h".}
##  DICOM_EXPIMP_TEMPLATE template class DICOM_MAP_EXPORT dicom_stream::map<DICOMMapKey,
##  DICOMMapValue, group_element_compare>;
##
##  Subclass of the particular map we're using.  Again,
##  makes type specifiers shorter in the code.
##

type
  DICOMParserMap* {.importcpp: "DICOMParserMap", header: "DICOMParserMap.h", bycopy.} = object of map[
      DICOMMapKey, DICOMMapValue, group_element_compare]

  DICOMTypeValue* = doublebyte

##  DICOM_EXPIMP_TEMPLATE template class  dicom_stream::map<DICOMMapKey, DICOMTypeValue,
##  group_element_compare>;

type
  DICOMImplicitTypeMap* {.importcpp: "DICOMImplicitTypeMap",
                         header: "DICOMParserMap.h", bycopy.} = object of map[
      DICOMMapKey, DICOMTypeValue, group_element_compare]


when defined(_MSC_VER):
  discard