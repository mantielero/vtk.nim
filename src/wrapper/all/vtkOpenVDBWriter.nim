## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOpenVDBWriter.h
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
##  @class   vtkOpenVDBWriter
##  @brief   OpenVDB writer for vtkImageData or vtkPointSet
##  Writes a vtkImageData or vtkPointSet as a VDB file.
##

import
  vtkIOOpenVDBModule, vtkSmartPointer, vtkWriter

discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkImageData"
discard "forward decl of vtkMultiProcessController"
discard "forward decl of vtkOpenVDBWriterInternals"
discard "forward decl of vtkPointSet"
discard "forward decl of vtkScalarsToColors"
discard "forward decl of vtkUnsignedCharArray"
type
  vtkOpenVDBWriter* {.importcpp: "vtkOpenVDBWriter", header: "vtkOpenVDBWriter.h",
                     bycopy.} = object of vtkWriter
    vtkOpenVDBWriter* {.importc: "vtkOpenVDBWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    ## @{
    ## *
    ##  Whether or not to write out all time steps.
    ##  The default is to not write out all time steps.
    ##
    ## @}
    ## @{
    ## *
    ##  For outputting the Lookup Table in the VDB file.
    ##  Copying what's done in vtkPLYWriter.
    ##
    ## @}
    ## @}


proc New*(): ptr vtkOpenVDBWriter {.importcpp: "vtkOpenVDBWriter::New(@)",
                                header: "vtkOpenVDBWriter.h".}
type
  vtkOpenVDBWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkOpenVDBWriter::IsTypeOf(@)", header: "vtkOpenVDBWriter.h".}
proc IsA*(this: var vtkOpenVDBWriter; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkOpenVDBWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkOpenVDBWriter {.
    importcpp: "vtkOpenVDBWriter::SafeDownCast(@)", header: "vtkOpenVDBWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkOpenVDBWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOpenVDBWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOpenVDBWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkOpenVDBWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkOpenVDBWriter.h".}
## !!!Ignored construct:  @{ *
##  Get/Set the filename for the file.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetWriteAllTimeSteps*(this: var vtkOpenVDBWriter; _arg: bool) {.
    importcpp: "SetWriteAllTimeSteps", header: "vtkOpenVDBWriter.h".}
## !!!Ignored construct:  virtual bool GetWriteAllTimeSteps ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << WriteAllTimeSteps  of  << this -> WriteAllTimeSteps ) ; return this -> WriteAllTimeSteps ; } ;
## Error: expected ';'!!!

proc SetLookupTable*(this: var vtkOpenVDBWriter; a2: ptr vtkScalarsToColors) {.
    importcpp: "SetLookupTable", header: "vtkOpenVDBWriter.h".}
proc GetnameLookupTable*(this: var vtkOpenVDBWriter): ptr vtkScalarsToColors {.
    importcpp: "GetnameLookupTable", header: "vtkOpenVDBWriter.h".}
  ## @}
  ## @{
  ## *
  ##  Enable coloring channel output based on LookupTable. The output
  ##  channel will be named 'color'.
  ##
proc SetWriteAllTimeStepsEnableColoring*(this: var vtkOpenVDBWriter; _arg: bool) {.
    importcpp: "SetWriteAllTimeStepsEnableColoring", header: "vtkOpenVDBWriter.h".}
## !!!Ignored construct:  virtual bool GetWriteAllTimeStepsEnableColoring ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableColoring  of  << this -> EnableColoring ) ; return this -> EnableColoring ; } ;
## Error: expected ';'!!!

proc SetWriteAllTimeStepsEnableColoringEnableAlpha*(this: var vtkOpenVDBWriter;
    _arg: bool) {.importcpp: "SetWriteAllTimeStepsEnableColoringEnableAlpha",
                header: "vtkOpenVDBWriter.h".}
## !!!Ignored construct:  virtual bool GetWriteAllTimeStepsEnableColoringEnableAlpha ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << EnableAlpha  of  << this -> EnableAlpha ) ; return this -> EnableAlpha ; } ;
## Error: expected ';'!!!

proc SetController*(this: var vtkOpenVDBWriter; a2: ptr vtkMultiProcessController) {.
    importcpp: "SetController", header: "vtkOpenVDBWriter.h".}
proc GetnameLookupTableController*(this: var vtkOpenVDBWriter): ptr vtkMultiProcessController {.
    importcpp: "GetnameLookupTableController", header: "vtkOpenVDBWriter.h".}
  ## @}