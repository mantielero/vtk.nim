## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkNIFTIImageHeader.h
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
##  @class   vtkNIFTIImageHeader
##  @brief   Store NIfTI header information.
##
##  This class stores the header of a NIfTI file in a VTK-friendly format.
##  By using this class, it is possible to specify the header information
##  that will be stored in a file written by the vtkNIFTIImageWriter.  Note
##  that the SForm and QForm orientation information in this class will be
##  ignored by the writer if an SForm and QForm have been explicitly set
##  via the writer's SetSForm and SetQForm methods.  Also note that all
##  info like Dim, PixDim, DataType, etc. will be ignored by the writer
##  because this information must instead be taken from the vtkImageData
##  information.  Finally, note that the vtkNIFTIImageWriter will ignore the
##  Descrip field, since it has its own SetDescription method.
##  @par Thanks:
##  This class was contributed to VTK by the Calgary Image Processing and
##  Analysis Centre (CIPAC).
##  @sa
##  vtkNIFTIImageReader, vtkNIFTIImageWriter
##

import
  vtkIOImageModule, vtkObject

discard "forward decl of nifti_1_header"
discard "forward decl of nifti_2_header"
type
  vtkNIFTIImageHeader* {.importcpp: "vtkNIFTIImageHeader",
                        header: "vtkNIFTIImageHeader.h", bycopy.} = object of vtkObject ## *
                                                                                 ##  NIFTI intent codes.
                                                                                 ##
    vtkNIFTIImageHeader* {.importc: "vtkNIFTIImageHeader".}: VTK_NEWINSTANCE
    char* {.importc: "char".}: VTK_FILEPATH

  vtkNIFTIImageHeaderIntentCodeEnum* {.size: sizeof(cint), importcpp: "vtkNIFTIImageHeader::IntentCodeEnum",
                                      header: "vtkNIFTIImageHeader.h".} = enum
    IntentNone = 0, IntentCorrel = 2, IntentTTest = 3, IntentFTest = 4, IntentZScore = 5,
    IntentChiSQ = 6, IntentBeta = 7, IntentBinom = 8, IntentGamma = 9, IntentPoisson = 10,
    IntentNormal = 11, IntentFTestNonc = 12, IntentChiSQNonc = 13, IntentLogistic = 14,
    IntentLaplace = 15, IntentUniform = 16, IntentTTestNonc = 17, IntentWeibull = 18,
    IntentChi = 19, IntentInvGauss = 20, IntentExtVal = 21, IntentPVal = 22,
    IntentLogPVal = 23, IntentLog10PVal = 24, IntentEstimate = 1001, IntentLabel = 1002,
    IntentNeuroName = 1003, IntentGenMatrix = 1004, IntentSymMatrix = 1005,
    IntentDispVect = 1006, IntentVector = 1007, IntentPointSet = 1008,
    IntentTriangle = 1009, IntentQuaternion = 1010, IntentDimless = 1011,
    IntentTimeSeries = 2001, IntentNodeIndex = 2002, IntentRGBVector = 2003,
    IntentRGBAVector = 2004, IntentShape = 2005


type
  vtkNIFTIImageHeaderXFormCodeEnum* {.size: sizeof(cint), importcpp: "vtkNIFTIImageHeader::XFormCodeEnum",
                                     header: "vtkNIFTIImageHeader.h".} = enum
    XFormUnkown = 0, XFormScannerAnat = 1, XFormAlignedAnat = 2, XFormTalairach = 3,
    XFormMNI152 = 4


type
  vtkNIFTIImageHeaderSliceCodeEnum* {.size: sizeof(cint), importcpp: "vtkNIFTIImageHeader::SliceCodeEnum",
                                     header: "vtkNIFTIImageHeader.h".} = enum
    SliceUnknown = 0, SliceSeqInc = 1, SliceSeqDec = 2, SliceAltInc = 3, SliceAltDec = 4,
    SliceAltInc2 = 5, SliceAltDec2 = 6


type
  vtkNIFTIImageHeaderUnitsXYZTEnum* {.size: sizeof(cint), importcpp: "vtkNIFTIImageHeader::UnitsXYZTEnum",
                                     header: "vtkNIFTIImageHeader.h".} = enum
    UnitsUnknown = 0, UnitsMeter = 1, UnitsMM = 2, UnitsMicron = 3, UnitsSpace = 7,
    UnitsSec = 8, UnitsMSec = 16, UnitsUSec = 24, UnitsHz = 32, UnitsPPM = 40, UnitsRads = 48,
    UnitsTime = 56


type
  vtkNIFTIImageHeaderDataTypeEnum* {.size: sizeof(cint), importcpp: "vtkNIFTIImageHeader::DataTypeEnum",
                                    header: "vtkNIFTIImageHeader.h".} = enum
    TypeUInt8 = 2, TypeInt16 = 4, TypeInt32 = 8, TypeFloat32 = 16, TypeComplex64 = 32,
    TypeFloat64 = 64, TypeRGB24 = 128, TypeInt8 = 256, TypeUInt16 = 512, TypeUInt32 = 768,
    TypeInt64 = 1024, TypeUInt64 = 1280, TypeFloat128 = 1536, TypeComplex128 = 1792,
    TypeComplex256 = 2048, TypeRGBA32 = 2304


type
  vtkNIFTIImageHeaderHeaderSizeEnum* {.size: sizeof(cint), importcpp: "vtkNIFTIImageHeader::HeaderSizeEnum",
                                      header: "vtkNIFTIImageHeader.h".} = enum
    NIFTI1HeaderSize = 348, NIFTI2HeaderSize = 540


proc New*(): ptr vtkNIFTIImageHeader {.importcpp: "vtkNIFTIImageHeader::New(@)",
                                   header: "vtkNIFTIImageHeader.h".}
type
  vtkNIFTIImageHeaderSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkNIFTIImageHeader::IsTypeOf(@)", header: "vtkNIFTIImageHeader.h".}
proc IsA*(this: var vtkNIFTIImageHeader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkNIFTIImageHeader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkNIFTIImageHeader {.
    importcpp: "vtkNIFTIImageHeader::SafeDownCast(@)",
    header: "vtkNIFTIImageHeader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkNIFTIImageHeader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkNIFTIImageHeader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkNIFTIImageHeader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkNIFTIImageHeader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkNIFTIImageHeader.h".}
proc GetMagic*(this: var vtkNIFTIImageHeader): cstring {.importcpp: "GetMagic",
    header: "vtkNIFTIImageHeader.h".}
proc GetVoxOffset*(this: var vtkNIFTIImageHeader): vtkTypeInt64 {.
    importcpp: "GetVoxOffset", header: "vtkNIFTIImageHeader.h".}
proc GetDataType*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetDataType",
    header: "vtkNIFTIImageHeader.h".}
proc GetBitPix*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetBitPix",
    header: "vtkNIFTIImageHeader.h".}
proc GetDim*(this: var vtkNIFTIImageHeader; i: cint): vtkTypeInt64 {.
    importcpp: "GetDim", header: "vtkNIFTIImageHeader.h".}
proc GetPixDim*(this: var vtkNIFTIImageHeader; i: cint): cdouble {.
    importcpp: "GetPixDim", header: "vtkNIFTIImageHeader.h".}
proc SetIntentCode*(this: var vtkNIFTIImageHeader; _arg: cint) {.
    importcpp: "SetIntentCode", header: "vtkNIFTIImageHeader.h".}
proc GetIntentCode*(this: var vtkNIFTIImageHeader): cint {.
    importcpp: "GetIntentCode", header: "vtkNIFTIImageHeader.h".}
proc SetIntentName*(this: var vtkNIFTIImageHeader; name: cstring) {.
    importcpp: "SetIntentName", header: "vtkNIFTIImageHeader.h".}
proc GetIntentName*(this: var vtkNIFTIImageHeader): cstring {.
    importcpp: "GetIntentName", header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1*(this: var vtkNIFTIImageHeader; _arg: cdouble) {.
    importcpp: "SetIntentCodeIntentP1", header: "vtkNIFTIImageHeader.h".}
proc GetIntentP1*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetIntentP1",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2*(this: var vtkNIFTIImageHeader; _arg: cdouble) {.
    importcpp: "SetIntentCodeIntentP1IntentP2", header: "vtkNIFTIImageHeader.h".}
proc GetIntentP2*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetIntentP2",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3*(this: var vtkNIFTIImageHeader;
    _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3",
                   header: "vtkNIFTIImageHeader.h".}
proc GetIntentP3*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetIntentP3",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlope*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.
    importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlope",
    header: "vtkNIFTIImageHeader.h".}
proc GetSclSlope*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetSclSlope",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInter*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.
    importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInter",
    header: "vtkNIFTIImageHeader.h".}
proc GetSclInter*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetSclInter",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMin*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.
    importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMin",
    header: "vtkNIFTIImageHeader.h".}
proc GetCalMin*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetCalMin",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMax*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMax",
    header: "vtkNIFTIImageHeader.h".}
proc GetCalMax*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetCalMax",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDuration*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDuration",
    header: "vtkNIFTIImageHeader.h".}
proc GetSliceDuration*(this: var vtkNIFTIImageHeader): cdouble {.
    importcpp: "GetSliceDuration", header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffset*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffset",
    header: "vtkNIFTIImageHeader.h".}
proc GetTOffset*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetTOffset",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStart*(
    this: var vtkNIFTIImageHeader; _arg: vtkTypeInt64) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStart",
    header: "vtkNIFTIImageHeader.h".}
proc GetSliceStart*(this: var vtkNIFTIImageHeader): vtkTypeInt64 {.
    importcpp: "GetSliceStart", header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEnd*(
    this: var vtkNIFTIImageHeader; _arg: vtkTypeInt64) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEnd",
    header: "vtkNIFTIImageHeader.h".}
proc GetSliceEnd*(this: var vtkNIFTIImageHeader): vtkTypeInt64 {.
    importcpp: "GetSliceEnd", header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCode*(
    this: var vtkNIFTIImageHeader; _arg: cint) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCode",
    header: "vtkNIFTIImageHeader.h".}
proc GetSliceCode*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetSliceCode",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnits*(
    this: var vtkNIFTIImageHeader; _arg: cint) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnits",
    header: "vtkNIFTIImageHeader.h".}
proc GetXYZTUnits*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetXYZTUnits",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfo*(
    this: var vtkNIFTIImageHeader; _arg: cint) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfo",
    header: "vtkNIFTIImageHeader.h".}
proc GetDimInfo*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetDimInfo",
    header: "vtkNIFTIImageHeader.h".}
proc SetDescrip*(this: var vtkNIFTIImageHeader; descrip: cstring) {.
    importcpp: "SetDescrip", header: "vtkNIFTIImageHeader.h".}
proc GetDescrip*(this: var vtkNIFTIImageHeader): cstring {.importcpp: "GetDescrip",
    header: "vtkNIFTIImageHeader.h".}
## !!!Ignored construct:  *
##  Get an auxiliary file, e.g. a color table, that is associated
##  with this data.  The length of the filename must be a maximum of
##  24 characters, and it will be assumed to be in the same directory
##  as the NIFTI file.
##  void SetAuxFile ( VTK_FILEPATH const char * auxfile ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  * GetAuxFile ( ) { return this -> AuxFile ; } /@{ *
##  Get the QForm or SForm code.
##  virtual void SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  QFormCode  to  << _arg ) ; if ( this -> QFormCode != _arg ) { this -> QFormCode = _arg ; this -> Modified ( ) ; } } ;
## Error: identifier expected, but got: *!!!

proc GetQFormCode*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetQFormCode",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCode*(
    this: var vtkNIFTIImageHeader; _arg: cint) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCode",
    header: "vtkNIFTIImageHeader.h".}
proc GetSFormCode*(this: var vtkNIFTIImageHeader): cint {.importcpp: "GetSFormCode",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternB*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternB",
    header: "vtkNIFTIImageHeader.h".}
proc GetQuaternB*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetQuaternB",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternC*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternC",
    header: "vtkNIFTIImageHeader.h".}
proc GetQuaternC*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetQuaternC",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternD*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternD",
    header: "vtkNIFTIImageHeader.h".}
proc GetQuaternD*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetQuaternD",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternDQOffsetX*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternDQOffsetX",
    header: "vtkNIFTIImageHeader.h".}
proc GetQOffsetX*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetQOffsetX",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternDQOffsetXQOffsetY*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternDQOffsetXQOffsetY",
    header: "vtkNIFTIImageHeader.h".}
proc GetQOffsetY*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetQOffsetY",
    header: "vtkNIFTIImageHeader.h".}
proc SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternDQOffsetXQOffsetYQOffsetZ*(
    this: var vtkNIFTIImageHeader; _arg: cdouble) {.importcpp: "SetIntentCodeIntentP1IntentP2IntentP3SclSlopeSclInterCalMinCalMaxSliceDurationTOffsetSliceStartSliceEndSliceCodeXYZTUnitsDimInfoQFormCodeSFormCodeQuaternBQuaternCQuaternDQOffsetXQOffsetYQOffsetZ",
    header: "vtkNIFTIImageHeader.h".}
proc GetQOffsetZ*(this: var vtkNIFTIImageHeader): cdouble {.importcpp: "GetQOffsetZ",
    header: "vtkNIFTIImageHeader.h".}
proc SetSRowX*(this: var vtkNIFTIImageHeader; _arg1: cdouble; _arg2: cdouble;
              _arg3: cdouble; _arg4: cdouble) {.importcpp: "SetSRowX",
    header: "vtkNIFTIImageHeader.h".}
proc SetSRowX*(this: var vtkNIFTIImageHeader; _arg: array[4, cdouble]) {.
    importcpp: "SetSRowX", header: "vtkNIFTIImageHeader.h".}
## !!!Ignored construct:  virtual double * GetSRowX ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SRowX  pointer  << this -> SRowX ) ; return this -> SRowX ; } VTK_WRAPEXCLUDE virtual void GetSRowX ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> SRowX [ 0 ] ; _arg2 = this -> SRowX [ 1 ] ; _arg3 = this -> SRowX [ 2 ] ; _arg4 = this -> SRowX [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SRowX  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSRowX ( double _arg [ 4 ] ) { this -> GetSRowX ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetSRowXSRowY*(this: var vtkNIFTIImageHeader; _arg1: cdouble; _arg2: cdouble;
                   _arg3: cdouble; _arg4: cdouble) {.importcpp: "SetSRowXSRowY",
    header: "vtkNIFTIImageHeader.h".}
proc SetSRowXSRowY*(this: var vtkNIFTIImageHeader; _arg: array[4, cdouble]) {.
    importcpp: "SetSRowXSRowY", header: "vtkNIFTIImageHeader.h".}
## !!!Ignored construct:  virtual double * GetSRowXSRowY ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SRowY  pointer  << this -> SRowY ) ; return this -> SRowY ; } VTK_WRAPEXCLUDE virtual void GetSRowXSRowY ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> SRowY [ 0 ] ; _arg2 = this -> SRowY [ 1 ] ; _arg3 = this -> SRowY [ 2 ] ; _arg4 = this -> SRowY [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SRowY  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSRowXSRowY ( double _arg [ 4 ] ) { this -> GetSRowXSRowY ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc SetSRowXSRowYSRowZ*(this: var vtkNIFTIImageHeader; _arg1: cdouble;
                        _arg2: cdouble; _arg3: cdouble; _arg4: cdouble) {.
    importcpp: "SetSRowXSRowYSRowZ", header: "vtkNIFTIImageHeader.h".}
proc SetSRowXSRowYSRowZ*(this: var vtkNIFTIImageHeader; _arg: array[4, cdouble]) {.
    importcpp: "SetSRowXSRowYSRowZ", header: "vtkNIFTIImageHeader.h".}
## !!!Ignored construct:  virtual double * GetSRowXSRowYSRowZ ( ) VTK_SIZEHINT ( 4 ) { vtkDebugWithObjectMacro ( this , <<  returning  << SRowZ  pointer  << this -> SRowZ ) ; return this -> SRowZ ; } VTK_WRAPEXCLUDE virtual void GetSRowXSRowYSRowZ ( double & _arg1 , double & _arg2 , double & _arg3 , double & _arg4 ) { _arg1 = this -> SRowZ [ 0 ] ; _arg2 = this -> SRowZ [ 1 ] ; _arg3 = this -> SRowZ [ 2 ] ; _arg4 = this -> SRowZ [ 3 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << SRowZ  = ( << _arg1 << , << _arg2 << , << _arg3 << , << _arg4 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetSRowXSRowYSRowZ ( double _arg [ 4 ] ) { this -> GetSRowXSRowYSRowZ ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] , _arg [ 3 ] ) ; } ;
## Error: expected ';'!!!

proc Initialize*(this: var vtkNIFTIImageHeader) {.importcpp: "Initialize",
    header: "vtkNIFTIImageHeader.h".}
proc DeepCopy*(this: var vtkNIFTIImageHeader; o: ptr vtkNIFTIImageHeader) {.
    importcpp: "DeepCopy", header: "vtkNIFTIImageHeader.h".}
proc SetHeader*(this: var vtkNIFTIImageHeader; hdr: ptr nifti_1_header) {.
    importcpp: "SetHeader", header: "vtkNIFTIImageHeader.h".}
proc GetHeader*(this: var vtkNIFTIImageHeader; hdr: ptr nifti_1_header) {.
    importcpp: "GetHeader", header: "vtkNIFTIImageHeader.h".}
proc SetHeader*(this: var vtkNIFTIImageHeader; hdr: ptr nifti_2_header) {.
    importcpp: "SetHeader", header: "vtkNIFTIImageHeader.h".}
proc GetHeader*(this: var vtkNIFTIImageHeader; hdr: ptr nifti_2_header) {.
    importcpp: "GetHeader", header: "vtkNIFTIImageHeader.h".}