## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMotionFXCFGReader.h
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

import
  vtkIOMotionFXModule, vtkMultiBlockDataSetAlgorithm

## *
##  @class vtkMotionFXCFGReader
##  @brief reader for MotionFX motion definitions cfg files.
##
##  MotionFX files comprise of `motion`s for a collection of STL files. The
##  motions define the transformations to apply to STL geometry to emulate
##  motion like translation, rotation, planetary motion, etc.
##
##  This reader reads such a CFG file and produces a temporal output for the time
##  range defined in the file. The resolution of time can be controlled using the
##  `SetTimeResolution` method. The output is a multiblock dataset with blocks
##  for each of bodies, identified by an STL file, in the cfg file.
##
##  The reader uses PEGTL (https://github.com/taocpp/PEGTL)
##  to define and parse the grammar for the CFG file.
##

type
  vtkMotionFXCFGReader* {.importcpp: "vtkMotionFXCFGReader",
                         header: "vtkMotionFXCFGReader.h", bycopy.} = object of vtkMultiBlockDataSetAlgorithm
    vtkMotionFXCFGReader* {.importc: "vtkMotionFXCFGReader".}: VTK_NEWINSTANCE
    char* {.importc: "char".}: VTK_FILEPATH


proc New*(): ptr vtkMotionFXCFGReader {.importcpp: "vtkMotionFXCFGReader::New(@)",
                                    header: "vtkMotionFXCFGReader.h".}
type
  vtkMotionFXCFGReaderSuperclass* = vtkMultiBlockDataSetAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMotionFXCFGReader::IsTypeOf(@)",
    header: "vtkMotionFXCFGReader.h".}
proc IsA*(this: var vtkMotionFXCFGReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMotionFXCFGReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMotionFXCFGReader {.
    importcpp: "vtkMotionFXCFGReader::SafeDownCast(@)",
    header: "vtkMotionFXCFGReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMotionFXCFGReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMultiBlockDataSetAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMotionFXCFGReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMotionFXCFGReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkMotionFXCFGReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMotionFXCFGReader.h".}
## !!!Ignored construct:  /@{ *
##  Get/Set the filename.
##  void SetFileName ( VTK_FILEPATH const char * fname ) ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  * GetFileName ( ) const { return this -> FileName . empty ( ) ? nullptr : this -> FileName . c_str ( ) ; } /@} /@{ *
##  Get/Set the time resolution for timesteps produced by the reader.
##  virtual void SetTimeResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TimeResolution  to  << _arg ) ; if ( this -> TimeResolution != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> TimeResolution = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetTimeResolutionMinValue ( ) { return 1 ; } virtual int GetTimeResolutionMaxValue ( ) { return VTK_INT_MAX ; } ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  virtual int GetTimeResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TimeResolution  of  << this -> TimeResolution ) ; return this -> TimeResolution ; } ;
## Error: expected ';'!!!
