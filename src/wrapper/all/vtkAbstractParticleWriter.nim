## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAbstractParticleWriter.h
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
##  @class   vtkAbstractParticleWriter
##  @brief   abstract class to write particle data to file
##
##  vtkAbstractParticleWriter is an abstract class which is used by
##  vtkParticleTracerBase to write particles out during simulations.
##  This class is abstract and provides a TimeStep and FileName.
##  Subclasses of this should provide the necessary IO.
##
##  @warning
##  See vtkWriter
##
##  @sa
##  vtkParticleTracerBase
##

import
  vtkIOCoreModule, vtkWriter

type
  vtkAbstractParticleWriter* {.importcpp: "vtkAbstractParticleWriter",
                              header: "vtkAbstractParticleWriter.h", bycopy.} = object of vtkWriter
    vtkAbstractParticleWriter* {.importc: "vtkAbstractParticleWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkAbstractParticleWriterSuperclass* = vtkWriter

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkAbstractParticleWriter::IsTypeOf(@)",
    header: "vtkAbstractParticleWriter.h".}
proc IsA*(this: var vtkAbstractParticleWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkAbstractParticleWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkAbstractParticleWriter {.
    importcpp: "vtkAbstractParticleWriter::SafeDownCast(@)",
    header: "vtkAbstractParticleWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkAbstractParticleWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAbstractParticleWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAbstractParticleWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkAbstractParticleWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkAbstractParticleWriter.h".}
proc SetTimeStep*(this: var vtkAbstractParticleWriter; _arg: cint) {.
    importcpp: "SetTimeStep", header: "vtkAbstractParticleWriter.h".}
## !!!Ignored construct:  virtual int GetTimeStep ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeStep  of  << this -> TimeStep ) ; return this -> TimeStep ; } ;
## Error: expected ';'!!!

proc SetTimeStepTimeValue*(this: var vtkAbstractParticleWriter; _arg: cdouble) {.
    importcpp: "SetTimeStepTimeValue", header: "vtkAbstractParticleWriter.h".}
## !!!Ignored construct:  virtual double GetTimeStepTimeValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeValue  of  << this -> TimeValue ) ; return this -> TimeValue ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/get the FileName that is being written to
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetTimeStepTimeValueCollectiveIO*(this: var vtkAbstractParticleWriter;
                                      _arg: cint) {.
    importcpp: "SetTimeStepTimeValueCollectiveIO",
    header: "vtkAbstractParticleWriter.h".}
## !!!Ignored construct:  virtual int GetTimeStepTimeValueCollectiveIO ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CollectiveIO  of  << this -> CollectiveIO ) ; return this -> CollectiveIO ; } ;
## Error: expected ';'!!!

proc SetWriteModeToCollective*(this: var vtkAbstractParticleWriter) {.
    importcpp: "SetWriteModeToCollective", header: "vtkAbstractParticleWriter.h".}
proc SetWriteModeToIndependent*(this: var vtkAbstractParticleWriter) {.
    importcpp: "SetWriteModeToIndependent", header: "vtkAbstractParticleWriter.h".}
proc CloseFile*(this: var vtkAbstractParticleWriter) {.importcpp: "CloseFile",
    header: "vtkAbstractParticleWriter.h".}