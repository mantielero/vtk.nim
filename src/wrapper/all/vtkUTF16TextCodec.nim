## =========================================================================
##
## Program:   Visualization Toolkit
## Module:    vtkUTF16TextCodec.h
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
##  @class   vtkUTF16TextCodec
##  @brief   Class to read/write ascii text.
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
##  vtkUTF16TextCodecFactory
##
##

import
  vtkIOCoreModule, vtkTextCodec

type
  vtkUTF16TextCodec* {.importcpp: "vtkUTF16TextCodec",
                      header: "vtkUTF16TextCodec.h", bycopy.} = object of vtkTextCodec
    vtkUTF16TextCodec* {.importc: "vtkUTF16TextCodec".}: VTK_NEWINSTANCE

  vtkUTF16TextCodecSuperclass* = vtkTextCodec

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkUTF16TextCodec::IsTypeOf(@)", header: "vtkUTF16TextCodec.h".}
proc IsA*(this: var vtkUTF16TextCodec; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkUTF16TextCodec.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkUTF16TextCodec {.
    importcpp: "vtkUTF16TextCodec::SafeDownCast(@)", header: "vtkUTF16TextCodec.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkUTF16TextCodec :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkTextCodec :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUTF16TextCodec :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUTF16TextCodec :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkUTF16TextCodec {.importcpp: "vtkUTF16TextCodec::New(@)",
                                 header: "vtkUTF16TextCodec.h".}
proc PrintSelf*(this: var vtkUTF16TextCodec; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkUTF16TextCodec.h".}
proc Name*(this: var vtkUTF16TextCodec): cstring {.importcpp: "Name",
    header: "vtkUTF16TextCodec.h".}
proc CanHandle*(this: var vtkUTF16TextCodec; NameString: cstring): bool {.
    importcpp: "CanHandle", header: "vtkUTF16TextCodec.h".}
proc SetBigEndian*(this: var vtkUTF16TextCodec; a2: bool) {.importcpp: "SetBigEndian",
    header: "vtkUTF16TextCodec.h".}
proc FindEndianness*(this: var vtkUTF16TextCodec; InputStream: var istream) {.
    importcpp: "FindEndianness", header: "vtkUTF16TextCodec.h".}
proc ToUnicode*(this: var vtkUTF16TextCodec; InputStream: var istream;
               output: var OutputIterator) {.importcpp: "ToUnicode",
    header: "vtkUTF16TextCodec.h".}
proc NextUTF32CodePoint*(this: var vtkUTF16TextCodec; inputStream: var istream): vtkTypeUInt32 {.
    importcpp: "NextUTF32CodePoint", header: "vtkUTF16TextCodec.h".}