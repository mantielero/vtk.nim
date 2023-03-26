## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkXMLWriter.h
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
##  @class   vtkXMLWriter
##  @brief   Superclass for VTK's XML file writers.
##
##  vtkXMLWriter provides methods implementing most of the
##  functionality needed to write VTK XML file formats.  Concrete
##  subclasses provide actual writer implementations calling upon this
##  functionality.
##
##  @par Thanks
##  CompressionLevel getters/setters exposed by Quincy Wofford
##  (qwofford@lanl.gov) and John Patchett (patchett@lanl.gov),
##  Los Alamos National Laboratory (2017)
##

import
  vtkIOXMLModule, vtkXMLWriterBase

discard "forward decl of vtkAbstractArray"
discard "forward decl of vtkArrayIterator"
discard "forward decl of vtkArrayIteratorTemplate"
discard "forward decl of vtkCellData"
discard "forward decl of vtkDataArray"
discard "forward decl of vtkDataCompressor"
discard "forward decl of vtkDataSet"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkOutputStream"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkFieldData"
discard "forward decl of vtkXMLDataHeader"
discard "forward decl of vtkStdString"
discard "forward decl of OffsetsManager"
discard "forward decl of OffsetsManagerGroup"
discard "forward decl of OffsetsManagerArray"
type
  vtkXMLWriter* {.importcpp: "vtkXMLWriter", header: "vtkXMLWriter.h", bycopy.} = object of vtkXMLWriterBase
    vtkXMLWriter* {.importc: "vtkXMLWriter".}: VTK_NEWINSTANCE
    ##  The stream position at which appended data starts.
    ##  appended data offsets for field data
    ##  one per array
    ##  We need a 32 bit signed integer type to which vtkIdType will be
    ##  converted if Int32 is specified for the IdType parameter to this
    ##  writer.
    ##  The byte swapping buffer.
    ##  Compression information.
    ##  The output stream used to write binary and appended data.  May
    ##  transparently encode the data.
    ##  Allow subclasses to set the data stream.
    ##  This shallows copy input field data to the passed field data and
    ##  then adds any additional field arrays. For example, TimeValue.
    ##  Dummy boolean var to start/stop the continue executing:
    ##  when using the Start/Stop/WriteNextTime API
    ##  can only be -1 = invalid, 0 = stop, 1 = start
    ##  one per piece / per timestep

  vtkXMLWriterSuperclass* = vtkXMLWriterBase

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkXMLWriter::IsTypeOf(@)", header: "vtkXMLWriter.h".}
proc IsA*(this: var vtkXMLWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkXMLWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkXMLWriter {.
    importcpp: "vtkXMLWriter::SafeDownCast(@)", header: "vtkXMLWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkXMLWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkXMLWriterBase :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkXMLWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkXMLWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkXMLWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkXMLWriter.h".}
proc SetInputData*(this: var vtkXMLWriter; a2: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkXMLWriter.h".}
proc SetInputData*(this: var vtkXMLWriter; a2: cint; a3: ptr vtkDataObject) {.
    importcpp: "SetInputData", header: "vtkXMLWriter.h".}
proc GetInput*(this: var vtkXMLWriter; port: cint): ptr vtkDataObject {.
    importcpp: "GetInput", header: "vtkXMLWriter.h".}
proc GetInput*(this: var vtkXMLWriter): ptr vtkDataObject {.importcpp: "GetInput",
    header: "vtkXMLWriter.h".}
proc ProcessRequest*(this: var vtkXMLWriter; request: ptr vtkInformation;
                    inputVector: ptr ptr vtkInformationVector;
                    outputVector: ptr vtkInformationVector): vtkTypeBool {.
    importcpp: "ProcessRequest", header: "vtkXMLWriter.h".}
## !!!Ignored construct:  /@{ *
##  Set the number of time steps
##  virtual int GetNumberOfTimeStepsNumberOfTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfTimeSteps  of  << this -> NumberOfTimeSteps ) ; return this -> NumberOfTimeSteps ; } ;
## Error: expected ';'!!!

proc SetNumberOfTimeSteps*(this: var vtkXMLWriter; _arg: cint) {.
    importcpp: "SetNumberOfTimeSteps", header: "vtkXMLWriter.h".}
  ## /@}
  ## /@{
  ## *
  ##  API to interface an outside the VTK pipeline control
  ##
proc Start*(this: var vtkXMLWriter) {.importcpp: "Start", header: "vtkXMLWriter.h".}
proc Stop*(this: var vtkXMLWriter) {.importcpp: "Stop", header: "vtkXMLWriter.h".}
proc WriteNextTime*(this: var vtkXMLWriter; time: cdouble) {.
    importcpp: "WriteNextTime", header: "vtkXMLWriter.h".}
## !!!Ignored construct:  # VTK_SIZEOF_SHORT == 4 [NewLine] typedef short Int32IdType ;
## Error: identifier expected, but got: #!!!
