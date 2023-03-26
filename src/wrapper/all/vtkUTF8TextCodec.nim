## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkUTF8TextCodec.h
##
## Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
## All rights reserved.
## See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
## This software is distributed WITHOUT ANY WARRANTY; without even
## the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
## PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## -------------------------------------------------------------------------
##   Copyright 2008 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
##   the U.S. Government retains certain rights in this software.
## -------------------------------------------------------------------------
## *
##  @class   vtkUTF8TextCodec
##  @brief   Class to read/write UTF-8 text
##
##
##  A virtual class interface for codecs that readers/writers can rely on
##
##  @par Thanks:
##  Thanks to Tim Shed from Sandia National Laboratories for his work
##  on the concepts and to Marcus Hanwell and Jeff Baumes of Kitware for
##  keeping me out of the weeds
##
##  @sa
##  vtkUTF8TextCodecFactory
##
##

import
  vtkIOCoreModule, vtkTextCodec

type
  vtkUTF8TextCodec* {.importcpp: "vtkUTF8TextCodec", header: "vtkUTF8TextCodec.h",
                     bycopy.} = object of vtkTextCodec
    vtkUTF8TextCodec* {.importc: "vtkUTF8TextCodec".}: VTK_NEWINSTANCE

  vtkUTF8TextCodecSuperclass* = vtkTextCodec

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUTF8TextCodec::IsTypeOf(@)", header: "vtkUTF8TextCodec.h".}
proc IsA*(this: var vtkUTF8TextCodec; `type`: cstring): vtkTypeBool {.importcpp: "IsA",
    header: "vtkUTF8TextCodec.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUTF8TextCodec {.
    importcpp: "vtkUTF8TextCodec::SafeDownCast(@)", header: "vtkUTF8TextCodec.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUTF8TextCodec :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTextCodec :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUTF8TextCodec :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUTF8TextCodec :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkUTF8TextCodec {.importcpp: "vtkUTF8TextCodec::New(@)",
                                header: "vtkUTF8TextCodec.h".}
proc PrintSelf*(this: var vtkUTF8TextCodec; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUTF8TextCodec.h".}
proc Name*(this: var vtkUTF8TextCodec): cstring {.importcpp: "Name",
    header: "vtkUTF8TextCodec.h".}
proc ToUnicode*(this: var vtkUTF8TextCodec; InputStream: var istream;
               output: var OutputIterator) {.importcpp: "ToUnicode",
    header: "vtkUTF8TextCodec.h".}
proc NextUTF32CodePoint*(this: var vtkUTF8TextCodec; inputStream: var istream): vtkTypeUInt32 {.
    importcpp: "NextUTF32CodePoint", header: "vtkUTF8TextCodec.h".}