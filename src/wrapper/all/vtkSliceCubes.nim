## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSliceCubes.h
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
##  @class   vtkSliceCubes
##  @brief   generate isosurface(s) from volume four slices at a time
##
##  vtkSliceCubes is a special version of the marching cubes filter. Instead
##  of ingesting an entire volume at once it processes only four slices at
##  a time. This way, it can generate isosurfaces from huge volumes. Also, the
##  output of this object is written to a marching cubes triangle file. That
##  way, output triangles do not need to be held in memory.
##
##  To use vtkSliceCubes you must specify an instance of vtkVolumeReader to
##  read the data. Set this object up with the proper file prefix, image range,
##  data origin, data dimensions, header size, data mask, and swap bytes flag.
##  The vtkSliceCubes object will then take over and read slices as necessary.
##  You also will need to specify the name of an output marching cubes triangle
##  file.
##
##  @warning
##  This process object is both a source and mapper (i.e., it reads and writes
##  data to a file). This is different than the other marching cubes objects
##  (and most process objects in the system). It's specialized to handle very
##  large data.
##
##  @warning
##  This object only extracts a single isosurface. This compares with the other
##  contouring objects in vtk that generate multiple surfaces.
##
##  @warning
##  To read the output file use vtkMCubesReader.
##
##  @sa
##  vtkMarchingCubes vtkContourFilter vtkMCubesReader vtkDividingCubes vtkVolumeReader
##

import
  vtkImagingHybridModule, vtkObject

discard "forward decl of vtkVolumeReader"
type
  vtkSliceCubes* {.importcpp: "vtkSliceCubes", header: "vtkSliceCubes.h", bycopy.} = object of vtkObject
    vtkSliceCubes* {.importc: "vtkSliceCubes".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH


proc New*(): ptr vtkSliceCubes {.importcpp: "vtkSliceCubes::New(@)",
                             header: "vtkSliceCubes.h".}
type
  vtkSliceCubesSuperclass* = vtkObject

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSliceCubes::IsTypeOf(@)", header: "vtkSliceCubes.h".}
proc IsA*(this: var vtkSliceCubes; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkSliceCubes.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSliceCubes {.
    importcpp: "vtkSliceCubes::SafeDownCast(@)", header: "vtkSliceCubes.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSliceCubes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSliceCubes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSliceCubes :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkSliceCubes; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSliceCubes.h".}
proc Write*(this: var vtkSliceCubes) {.importcpp: "Write", header: "vtkSliceCubes.h".}
proc Update*(this: var vtkSliceCubes) {.importcpp: "Update", header: "vtkSliceCubes.h".}
proc SetReader*(this: var vtkSliceCubes; a2: ptr vtkVolumeReader) {.
    importcpp: "SetReader", header: "vtkSliceCubes.h".}
proc GetnameReader*(this: var vtkSliceCubes): ptr vtkVolumeReader {.
    importcpp: "GetnameReader", header: "vtkSliceCubes.h".}
  ## /@}
  ## /@{
  ## *
  ##  Specify file name of marching cubes output file.
  ##
## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc SetValue*(this: var vtkSliceCubes; _arg: cdouble) {.importcpp: "SetValue",
    header: "vtkSliceCubes.h".}
## !!!Ignored construct:  virtual double GetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  /@} /@{ *
##  Specify file name of marching cubes limits file. The limits file
##  speeds up subsequent reading of output triangle file.
##  virtual void SetFileNameLimitsFileNameLimitsFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LimitsFileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LimitsFileName == nullptr && _arg == nullptr ) { return ; } if ( this -> LimitsFileName && _arg && ( ! strcmp ( this -> LimitsFileName , _arg ) ) ) { return ; } delete [ ] this -> LimitsFileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LimitsFileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LimitsFileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileNameLimitsFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << LimitsFileName  of  << ( this -> LimitsFileName ? this -> LimitsFileName : (null) ) ) ; return this -> LimitsFileName ; } ;
## Error: expected ';'!!!
