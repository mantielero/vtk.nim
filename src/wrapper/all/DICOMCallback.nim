## =========================================================================
##
##   Program:   DICOMParser
##   Module:    DICOMCallback.h
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

## !!!Ignored construct:  # __DICOM_CALLBACK_H_ [NewLine] # __DICOM_CALLBACK_H_ [NewLine] # _MSC_VER [NewLine] # warning ( disable : 4514 ) [NewLine] # warning ( disable : 4786 ) [NewLine] # warning ( disable : 4503 ) [NewLine] # warning ( disable : 4710 ) [NewLine] # warning ( disable : 4702 ) [NewLine] # warning ( push , 3 ) [NewLine] # [NewLine] # DICOMConfig.h [NewLine] # DICOMParser.h [NewLine]
##  Pure virtual class that specifies the interface
##  for a DICOMCallback.
##
##  The DICOMParser allows a vector of callbacks to
##  be specified for each group element tag.  When
##  a group, element with a registered callback is
##  encountered, the callback is called and passed
##  the group, element, type, data, and data length.
##  class DICOM_EXPORT DICOMCallback { public : virtual ~ DICOMCallback ( ) { } virtual void Execute ( DICOMParser * parser , doublebyte group , doublebyte element , DICOMParser :: VRTypes type , unsigned char * val , quadbyte len ) = 0 ; } ;
## Error: token expected: ; but got: [identifier]!!!

##
##  Subclass of DICOMCallback which can be used
##  with member functions.
##

type
  DICOM_EXPORTDICOMMemberCallback*[T] {.importcpp: "DICOM_EXPORT::DICOMMemberCallback<\'0>",
                                       header: "DICOMCallback.h", bycopy.} = object of DICOMCallback

  DICOM_EXPORTDICOMMemberCallbackTMemberFunctionPointer* = proc (
      parser: ptr DICOMParser; group: doublebyte; element: doublebyte; `type`: VRTypes;
      val: ptr cuchar; len: quadbyte) {.memberfuncptr.}

proc SetCallbackFunction*[T](this: var DICOM_EXPORTDICOMMemberCallback[T];
                            `object`: ptr T; memberFunction: DICOM_EXPORTDICOMMemberCallbackTMemberFunctionPointer) {.
    importcpp: "SetCallbackFunction", header: "DICOMCallback.h".}
proc Execute*[T](this: var DICOM_EXPORTDICOMMemberCallback[T];
                parser: ptr DICOMParser; group: doublebyte; element: doublebyte;
                `type`: VRTypes; val: ptr cuchar; len: quadbyte) {.
    importcpp: "Execute", header: "DICOMCallback.h".}
when defined(_MSC_VER):
  discard