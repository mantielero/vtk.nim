##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSLACParticleReader.h
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
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkSLACParticleReader
##
##
##
##  A reader for a data format used by Omega3p, Tau3p, and several other tools
##  used at the Standford Linear Accelerator Center (SLAC).  The underlying
##  format uses netCDF to store arrays, but also imposes some conventions
##  to store a list of particles in 3D space.
##
##  This reader supports pieces, but in actuality only loads anything in
##  piece 0.  All other pieces are empty.
##
##

import
  vtkIONetCDFModule, vtkPolyDataAlgorithm

discard "forward decl of vtkDataArraySelection"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkInformationIntegerKey"
discard "forward decl of vtkInformationObjectBaseKey"
type
  vtkSLACParticleReader* {.importcpp: "vtkSLACParticleReader",
                          header: "vtkSLACParticleReader.h", bycopy.} = object of vtkPolyDataAlgorithm
    vtkSLACParticleReader* {.importc: "vtkSLACParticleReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkSLACParticleReaderSuperclass* = vtkPolyDataAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkSLACParticleReader::IsTypeOf(@)",
    header: "vtkSLACParticleReader.h".}
proc IsA*(this: var vtkSLACParticleReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkSLACParticleReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkSLACParticleReader {.
    importcpp: "vtkSLACParticleReader::SafeDownCast(@)",
    header: "vtkSLACParticleReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkSLACParticleReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSLACParticleReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSLACParticleReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkSLACParticleReader {.importcpp: "vtkSLACParticleReader::New(@)",
                                     header: "vtkSLACParticleReader.h".}
proc PrintSelf*(this: var vtkSLACParticleReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkSLACParticleReader.h".}
## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

## !!!Ignored construct:  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  *
##  Returns true if the given file can be read by this reader.
##  static int CanReadFile ( VTK_FILEPATH const char * filename ) ;
## Error: token expected: ) but got: *!!!
