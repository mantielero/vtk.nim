## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMultiBlockPLOT3DReader.h
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
##  @class   vtkMultiBlockPLOT3DReader
##  @brief   read PLOT3D data files
##
##  vtkMultiBlockPLOT3DReader is a reader object that reads PLOT3D formatted
##  files and generates structured grid(s) on output. PLOT3D is a computer
##  graphics program designed to visualize the grids and solutions of
##  computational fluid dynamics. This reader also supports the variant
##  of the PLOT3D format used by NASA's OVERFLOW CFD software, including
##  full support for all Q variables. Please see the "PLOT3D User's Manual"
##  available from NASA Ames Research Center, Moffett Field CA.
##
##  PLOT3D files consist of a grid file (also known as XYZ file), an
##  optional solution file (also known as a Q file), and an optional function
##  file that contains user created data (currently unsupported). The Q file
##  contains solution information as follows: the four parameters free stream
##  mach number (Fsmach), angle of attack (Alpha), Reynolds number (Re), and
##  total integration time (Time). This information is stored in an array
##  called Properties in the FieldData of each output (tuple 0: fsmach, tuple 1:
##  alpha, tuple 2: re, tuple 3: time). In addition, the solution file contains
##  the flow density (scalar), flow momentum (vector), and flow energy (scalar).
##
##  This reader supports a limited form of time series data which are stored
##  as a series of Q files. Using the AddFileName() method provided by the
##  superclass, one can define a file series. For other cases, for example where
##  the XYZ or function files vary over time, use vtkPlot3DMetaReader.
##
##  The reader can generate additional scalars and vectors (or "functions")
##  from this information. To use vtkMultiBlockPLOT3DReader, you must specify the
##  particular function number for the scalar and vector you want to visualize.
##  This implementation of the reader provides the following functions. The
##  scalar functions are:
##     -1  - don't read or compute any scalars
##     100 - density
##     110 - pressure
##     111 - pressure coefficient (requires Overflow file with Gamma)
##     112 - mach number (requires Overflow file with Gamma)
##     113 - sounds speed (requires Overflow file with Gamma)
##     120 - temperature
##     130 - enthalpy
##     140 - internal energy
##     144 - kinetic energy
##     153 - velocity magnitude
##     163 - stagnation energy
##     170 - entropy
##     184 - swirl
##     211 - vorticity magnitude
##
##  The vector functions are:
##     -1  - don't read or compute any vectors
##     200 - velocity
##     201 - vorticity
##     202 - momentum
##     210 - pressure gradient.
##     212 - strain rate
##
##  (Other functions are described in the PLOT3D spec, but only those listed are
##  implemented here.) Note that by default, this reader creates the density
##  scalar (100), stagnation energy (163) and momentum vector (202) as output.
##  (These are just read in from the solution file.) Please note that the validity
##  of computation is a function of this class's gas constants (R, Gamma) and the
##  equations used. They may not be suitable for your computational domain.
##
##  Additionally, you can read other data and associate it as a vtkDataArray
##  into the output's point attribute data. Use the method AddFunction()
##  to list all the functions that you'd like to read. AddFunction() accepts
##  an integer parameter that defines the function number.
##
##  @sa
##  vtkMultiBlockDataSet vtkStructuredGrid vtkPlot3DMetaReader
##

import
  vtkIOParallelModule, vtkParallelReader

discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkIntArray"
discard "forward decl of vtkMultiBlockPLOT3DReaderRecord"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkStructuredGrid"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkMultiBlockPLOT3DReaderInternals"
discard "forward decl of vtkMultiBlockDataSet"
discard "forward decl of ComputeFunctor"
discard "forward decl of ComputeTemperatureFunctor"
discard "forward decl of ComputePressureFunctor"
discard "forward decl of ComputePressureCoefficientFunctor"
discard "forward decl of ComputeMachNumberFunctor"
discard "forward decl of ComputeSoundSpeedFunctor"
discard "forward decl of ComputeEnthalpyFunctor"
discard "forward decl of ComputeKinecticEnergyFunctor"
discard "forward decl of ComputeVelocityMagnitudeFunctor"
discard "forward decl of ComputeEntropyFunctor"
discard "forward decl of ComputeSwirlFunctor"
discard "forward decl of ComputeVelocityFunctor"
discard "forward decl of ComputeVorticityMagnitudeFunctor"
discard "forward decl of ComputePressureGradientFunctor"
discard "forward decl of ComputeVorticityFunctor"
discard "forward decl of ComputeStrainRateFunctor"
type
  vtkMultiBlockPLOT3DReader* {.importcpp: "vtkMultiBlockPLOT3DReader",
                              header: "vtkMultiBlockPLOT3DReader.h", bycopy.} = object of vtkParallelReader
    vtkMultiBlockPLOT3DReader* {.importc: "vtkMultiBlockPLOT3DReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    char* {.importc: "char".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ##  parameters used in computing derived functions
    ##  named functions from meta data
    ##  functions to read that are not scalars or vectors


proc New*(): ptr vtkMultiBlockPLOT3DReader {.
    importcpp: "vtkMultiBlockPLOT3DReader::New(@)",
    header: "vtkMultiBlockPLOT3DReader.h".}
type
  vtkMultiBlockPLOT3DReaderSuperclass* = vtkParallelReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMultiBlockPLOT3DReader::IsTypeOf(@)",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc IsA*(this: var vtkMultiBlockPLOT3DReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMultiBlockPLOT3DReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMultiBlockPLOT3DReader {.
    importcpp: "vtkMultiBlockPLOT3DReader::SafeDownCast(@)",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMultiBlockPLOT3DReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkParallelReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMultiBlockPLOT3DReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMultiBlockPLOT3DReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMultiBlockPLOT3DReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMultiBlockPLOT3DReader.h".}
proc GetOutput*(this: var vtkMultiBlockPLOT3DReader): ptr vtkMultiBlockDataSet {.
    importcpp: "GetOutput", header: "vtkMultiBlockPLOT3DReader.h".}
proc GetOutput*(this: var vtkMultiBlockPLOT3DReader; a2: cint): ptr vtkMultiBlockDataSet {.
    importcpp: "GetOutput", header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  /@} /@{ *
##  Set/Get the PLOT3D geometry filename.
##  void SetFileName ( VTK_FILEPATH const char * name ) { this -> SetXYZFileName ( name ) ; } VTK_FILEPATH const char * GetFileName ( ) { return this -> GetXYZFileName ( ) ; } VTK_FILEPATH const char * GetFileName ( int i ) { return this -> vtkParallelReader :: GetFileName ( i ) ; } virtual void SetXYZFileName ( VTK_FILEPATH const char * ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetXYZFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << XYZFileName  of  << ( this -> XYZFileName ? this -> XYZFileName : (null) ) ) ; return this -> XYZFileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get the PLOT3D solution filename. This adds a filename
##  using the superclass' AddFileName() method. To read a series
##  of q files, use the AddFileName() interface directly to add
##  multiple q filenames in the appropriate order. If the files
##  are of Overflow format, the reader will read the time values
##  from the files. Otherwise, it will use an integer sequence.
##  Use a meta reader to support time values for non-Overflow file
##  sequences.
##  void SetQFileName ( VTK_FILEPATH const char * name ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  * GetQFileName ( ) ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get the PLOT3D function filename.
##  virtual void SetFunctionFileNameFunctionFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FunctionFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FunctionFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FunctionFileName && _arg && ( ! strcmp ( this -> FunctionFileName , _arg ) ) ) { return ; } delete [ ] this -> FunctionFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FunctionFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FunctionFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetXYZFileNameFunctionFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FunctionFileName  of  << ( this -> FunctionFileName ? this -> FunctionFileName : (null) ) ) ; return this -> FunctionFileName ; } ;
## Error: expected ';'!!!

proc SetAutoDetectFormat*(this: var vtkMultiBlockPLOT3DReader; _arg: vtkTypeBool) {.
    importcpp: "SetAutoDetectFormat", header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormat ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AutoDetectFormat  of  << this -> AutoDetectFormat ) ; return this -> AutoDetectFormat ; } ;
## Error: expected ';'!!!

proc AutoDetectFormatOn*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "AutoDetectFormatOn", header: "vtkMultiBlockPLOT3DReader.h".}
proc AutoDetectFormatOff*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "AutoDetectFormatOff", header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Is the file to be read written in binary format (as opposed
  ##  to ascii).
  ##
proc SetAutoDetectFormatBinaryFile*(this: var vtkMultiBlockPLOT3DReader;
                                   _arg: vtkTypeBool) {.
    importcpp: "SetAutoDetectFormatBinaryFile",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFile ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BinaryFile  of  << this -> BinaryFile ) ; return this -> BinaryFile ; } ;
## Error: expected ';'!!!

proc BinaryFileOn*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "BinaryFileOn",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc BinaryFileOff*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "BinaryFileOff", header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Does the file to be read contain information about number of
  ##  grids. In some PLOT3D files, the first value contains the number
  ##  of grids (even if there is only 1). If reading such a file,
  ##  set this to true.
  ##
proc SetAutoDetectFormatBinaryFileMultiGrid*(this: var vtkMultiBlockPLOT3DReader;
    _arg: vtkTypeBool) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGrid",
                       header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFileMultiGrid ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MultiGrid  of  << this -> MultiGrid ) ; return this -> MultiGrid ; } ;
## Error: expected ';'!!!

proc MultiGridOn*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "MultiGridOn",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc MultiGridOff*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "MultiGridOff",
    header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Were the arrays written with leading and trailing byte counts ?
  ##  Usually, files written by a fortran program will contain these
  ##  byte counts whereas the ones written by C/C++ won't.
  ##
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCount*(
    this: var vtkMultiBlockPLOT3DReader; _arg: vtkTypeBool) {.
    importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCount",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFileMultiGridHasByteCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HasByteCount  of  << this -> HasByteCount ) ; return this -> HasByteCount ; } ;
## Error: expected ';'!!!

proc HasByteCountOn*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "HasByteCountOn", header: "vtkMultiBlockPLOT3DReader.h".}
proc HasByteCountOff*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "HasByteCountOff", header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Is there iblanking (point visibility) information in the file.
  ##  If there is iblanking arrays, these will be read and assigned
  ##  to the PointVisibility array of the output.
  ##
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlanking*(
    this: var vtkMultiBlockPLOT3DReader; _arg: vtkTypeBool) {.
    importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlanking",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlanking ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IBlanking  of  << this -> IBlanking ) ; return this -> IBlanking ; } ;
## Error: expected ';'!!!

proc IBlankingOn*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "IBlankingOn",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc IBlankingOff*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "IBlankingOff",
    header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  If only two-dimensional data was written to the file,
  ##  turn this on.
  ##
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometry*(
    this: var vtkMultiBlockPLOT3DReader; _arg: vtkTypeBool) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometry",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometry ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TwoDimensionalGeometry  of  << this -> TwoDimensionalGeometry ) ; return this -> TwoDimensionalGeometry ; } ;
## Error: expected ';'!!!

proc TwoDimensionalGeometryOn*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "TwoDimensionalGeometryOn", header: "vtkMultiBlockPLOT3DReader.h".}
proc TwoDimensionalGeometryOff*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "TwoDimensionalGeometryOff", header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Is this file in double precision or single precision.
  ##  This only matters for binary files.
  ##  Default is single.
  ##
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecision*(
    this: var vtkMultiBlockPLOT3DReader; _arg: vtkTypeBool) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecision",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecision ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DoublePrecision  of  << this -> DoublePrecision ) ; return this -> DoublePrecision ; } ;
## Error: expected ';'!!!

proc DoublePrecisionOn*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "DoublePrecisionOn", header: "vtkMultiBlockPLOT3DReader.h".}
proc DoublePrecisionOff*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "DoublePrecisionOff", header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Try to read a binary file even if the file length seems to be
  ##  inconsistent with the header information. Use this with caution,
  ##  if the file length is not the same as calculated from the header.
  ##  either the file is corrupt or the settings are wrong.
  ##
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceRead*(
    this: var vtkMultiBlockPLOT3DReader; _arg: vtkTypeBool) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceRead",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual vtkTypeBool GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceRead ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ForceRead  of  << this -> ForceRead ) ; return this -> ForceRead ; } ;
## Error: expected ';'!!!

proc ForceReadOn*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "ForceReadOn",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc ForceReadOff*(this: var vtkMultiBlockPLOT3DReader) {.importcpp: "ForceReadOff",
    header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set the byte order of the file (remember, more Unix workstations
  ##  write big endian whereas PCs write little endian). Default is
  ##  big endian (since most older PLOT3D files were written by
  ##  workstations).
  ##
proc SetByteOrderToBigEndian*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "SetByteOrderToBigEndian", header: "vtkMultiBlockPLOT3DReader.h".}
proc SetByteOrderToLittleEndian*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "SetByteOrderToLittleEndian", header: "vtkMultiBlockPLOT3DReader.h".}
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrder*(
    this: var vtkMultiBlockPLOT3DReader; _arg: cint) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrder",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual int GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrder ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ByteOrder  of  << this -> ByteOrder ) ; return this -> ByteOrder ; } ;
## Error: expected ';'!!!

proc GetByteOrderAsString*(this: var vtkMultiBlockPLOT3DReader): cstring {.
    importcpp: "GetByteOrderAsString", header: "vtkMultiBlockPLOT3DReader.h".}
proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderR*(
    this: var vtkMultiBlockPLOT3DReader; _arg: cdouble) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderR",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual double GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderR ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << R  of  << this -> R ) ; return this -> R ; } ;
## Error: expected ';'!!!

proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGamma*(
    this: var vtkMultiBlockPLOT3DReader; _arg: cdouble) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGamma",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual double GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGamma ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Gamma  of  << this -> Gamma ) ; return this -> Gamma ; } ;
## Error: expected ';'!!!

proc SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGammaPreserveIntermediateFunctions*(
    this: var vtkMultiBlockPLOT3DReader; _arg: bool) {.importcpp: "SetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGammaPreserveIntermediateFunctions",
    header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual bool GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGammaPreserveIntermediateFunctions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PreserveIntermediateFunctions  of  << this -> PreserveIntermediateFunctions ) ; return this -> PreserveIntermediateFunctions ; } ;
## Error: expected ';'!!!

proc PreserveIntermediateFunctionsOn*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "PreserveIntermediateFunctionsOn",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc PreserveIntermediateFunctionsOff*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "PreserveIntermediateFunctionsOff",
    header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@{
  ## *
  ##  Specify the scalar function to extract. If ==(-1), then no scalar
  ##  function is extracted.
  ##
proc SetScalarFunctionNumber*(this: var vtkMultiBlockPLOT3DReader; num: cint) {.
    importcpp: "SetScalarFunctionNumber", header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual int GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGammaPreserveIntermediateFunctionsScalarFunctionNumber ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScalarFunctionNumber  of  << this -> ScalarFunctionNumber ) ; return this -> ScalarFunctionNumber ; } ;
## Error: expected ';'!!!

proc SetVectorFunctionNumber*(this: var vtkMultiBlockPLOT3DReader; num: cint) {.
    importcpp: "SetVectorFunctionNumber", header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  virtual int GetAutoDetectFormatBinaryFileMultiGridHasByteCountIBlankingTwoDimensionalGeometryDoublePrecisionForceReadByteOrderRGammaPreserveIntermediateFunctionsScalarFunctionNumberVectorFunctionNumber ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << VectorFunctionNumber  of  << this -> VectorFunctionNumber ) ; return this -> VectorFunctionNumber ; } ;
## Error: expected ';'!!!

proc AddFunction*(this: var vtkMultiBlockPLOT3DReader; functionNumber: cint) {.
    importcpp: "AddFunction", header: "vtkMultiBlockPLOT3DReader.h".}
proc RemoveFunction*(this: var vtkMultiBlockPLOT3DReader; a2: cint) {.
    importcpp: "RemoveFunction", header: "vtkMultiBlockPLOT3DReader.h".}
proc RemoveAllFunctions*(this: var vtkMultiBlockPLOT3DReader) {.
    importcpp: "RemoveAllFunctions", header: "vtkMultiBlockPLOT3DReader.h".}
## !!!Ignored construct:  /@} *
##  Return 1 if the reader can read the given file name. Only meaningful
##  for binary files.
##  virtual int CanReadBinaryFile ( VTK_FILEPATH const char * fname ) ;
## Error: token expected: ) but got: *!!!

proc SetController*(this: var vtkMultiBlockPLOT3DReader;
                   c: ptr vtkMultiProcessController) {.importcpp: "SetController",
    header: "vtkMultiBlockPLOT3DReader.h".}
proc GetnameController*(this: var vtkMultiBlockPLOT3DReader): ptr vtkMultiProcessController {.
    importcpp: "GetnameController", header: "vtkMultiBlockPLOT3DReader.h".}
  ## /@}
proc AddFunctionName*(this: var vtkMultiBlockPLOT3DReader; name: string) {.
    importcpp: "AddFunctionName", header: "vtkMultiBlockPLOT3DReader.h".}
const
  vtkMultiBlockPLOT3DReaderFILE_BIG_ENDIAN* = 0
  vtkMultiBlockPLOT3DReaderFILE_LITTLE_ENDIAN* = 1

proc ReadMetaData*(this: var vtkMultiBlockPLOT3DReader; metadata: ptr vtkInformation): cint {.
    importcpp: "ReadMetaData", header: "vtkMultiBlockPLOT3DReader.h".}
proc ReadMesh*(this: var vtkMultiBlockPLOT3DReader; piece: cint; npieces: cint;
              nghosts: cint; timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadMesh", header: "vtkMultiBlockPLOT3DReader.h".}
proc ReadPoints*(this: var vtkMultiBlockPLOT3DReader; piece: cint; npieces: cint;
                nghosts: cint; timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadPoints", header: "vtkMultiBlockPLOT3DReader.h".}
proc ReadArrays*(this: var vtkMultiBlockPLOT3DReader; piece: cint; npieces: cint;
                nghosts: cint; timestep: cint; output: ptr vtkDataObject): cint {.
    importcpp: "ReadArrays", header: "vtkMultiBlockPLOT3DReader.h".}