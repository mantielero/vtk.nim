## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPLYReader.h
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
##  @class   vtkPLYReader
##  @brief   read Stanford University PLY polygonal file format
##
##  vtkPLYReader is a source object that reads polygonal data in
##  Stanford University PLY file format (see
##  http://graphics.stanford.edu/data/3Dscanrep). It requires that
##  the elements "vertex" and "face" are defined. The "vertex" element
##  must have the properties "x", "y", and "z". The "face" element must
##  have the property "vertex_indices" defined. Optionally, if the "face"
##  element has the properties "intensity" and/or the triplet "red",
##  "green", "blue", and optionally "alpha"; these are read and added as scalars
##  to the output data.
##  If the "face" element has the property "texcoord" a new TCoords
##  point array is created and points are duplicated if they have 2 or
##  more different texture coordinates. Points are duplicated only if
##  DuplicatePointsForFaceTexture is true (default).
##  This creates a polygonal data that can be textured without
##  artifacts. If unique points are required use a vtkCleanPolyData
##  filter after this reader or use this reader with DuplicatePointsForFaceTexture
##  set to false.
##
##  @sa
##  vtkPLYWriter, vtkCleanPolyData
##

import
  vtkAbstractPolyDataReader, vtkIOPLYModule

discard "forward decl of vtkStringArray"
type
  vtkPLYReader* {.importcpp: "vtkPLYReader", header: "vtkPLYReader.h", bycopy.} = object of vtkAbstractPolyDataReader
    vtkPLYReader* {.importc: "vtkPLYReader".}: VTK_NEWINSTANCE
    ##  Whether this object is reading from a string or a file.
    ##  Default is 0: read from file.
    ##  The input string.

  vtkPLYReaderSuperclass* = vtkAbstractPolyDataReader

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkPLYReader::IsTypeOf(@)", header: "vtkPLYReader.h".}
proc IsA*(this: var vtkPLYReader; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkPLYReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkPLYReader {.
    importcpp: "vtkPLYReader::SafeDownCast(@)", header: "vtkPLYReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkPLYReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAbstractPolyDataReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPLYReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPLYReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkPLYReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkPLYReader.h".}
proc New*(): ptr vtkPLYReader {.importcpp: "vtkPLYReader::New(@)",
                            header: "vtkPLYReader.h".}
## !!!Ignored construct:  *
##  A simple, non-exhaustive check to see if a file is a valid ply file.
##  static int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!

proc GetnameComments*(this: var vtkPLYReader): ptr vtkStringArray {.
    importcpp: "GetnameComments", header: "vtkPLYReader.h".}
  ## *
  ##  Tolerance used to detect different texture coordinates for shared
  ##  points for faces.
  ##
## !!!Ignored construct:  virtual float GetFaceTextureTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FaceTextureTolerance  of  << this -> FaceTextureTolerance ) ; return this -> FaceTextureTolerance ; } ;
## Error: expected ';'!!!

proc SetFaceTextureTolerance*(this: var vtkPLYReader; _arg: cfloat) {.
    importcpp: "SetFaceTextureTolerance", header: "vtkPLYReader.h".}
  ## /@{
  ## *
  ##  Enable reading from an InputString instead of the default, a file.
  ##  Note that reading from an input stream would be more flexible (enabling
  ##  other kind of streams) and possibly more efficient because we don't need
  ##  to save the whole stream to a string. However a stream interface
  ##  does not translate well to python and the string interface satisfies
  ##  our current needs. So we leave the stream interface for future work.
  ##
proc SetFaceTextureToleranceReadFromInputString*(this: var vtkPLYReader; _arg: bool) {.
    importcpp: "SetFaceTextureToleranceReadFromInputString",
    header: "vtkPLYReader.h".}
## !!!Ignored construct:  virtual bool GetFaceTextureToleranceReadFromInputString ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ReadFromInputString  of  << this -> ReadFromInputString ) ; return this -> ReadFromInputString ; } ;
## Error: expected ';'!!!

proc ReadFromInputStringOn*(this: var vtkPLYReader) {.
    importcpp: "ReadFromInputStringOn", header: "vtkPLYReader.h".}
proc ReadFromInputStringOff*(this: var vtkPLYReader) {.
    importcpp: "ReadFromInputStringOff", header: "vtkPLYReader.h".}
proc SetInputString*(this: var vtkPLYReader; s: string) {.importcpp: "SetInputString",
    header: "vtkPLYReader.h".}
## !!!Ignored construct:  /@} *
##  If true (default) and the "face" element has the property "texcoord" duplicate
##  face points if they have 2 or more different texture coordinates.
##  Otherwise, each texture coordinate for a face point overwrites previously set
##  texture coordinates for that point.
##  virtual bool GetFaceTextureToleranceReadFromInputStringDuplicatePointsForFaceTextureDuplicatePointsForFaceTexture ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DuplicatePointsForFaceTexture  of  << this -> DuplicatePointsForFaceTexture ) ; return this -> DuplicatePointsForFaceTexture ; } ;
## Error: expected ';'!!!

proc SetFaceTextureToleranceReadFromInputStringDuplicatePointsForFaceTexture*(
    this: var vtkPLYReader; _arg: bool) {.importcpp: "SetFaceTextureToleranceReadFromInputStringDuplicatePointsForFaceTexture",
                                     header: "vtkPLYReader.h".}