## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkLZ4DataCompressor.h
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
##  @class   vtkLZ4DataCompressor
##  @brief   Data compression using LZ4.
##
##  vtkLZ4DataCompressor provides a concrete vtkDataCompressor class
##  using LZ4 for compressing and uncompressing data.
##

import
  vtkDataCompressor, vtkIOCoreModule

type
  vtkLZ4DataCompressor* {.importcpp: "vtkLZ4DataCompressor",
                         header: "vtkLZ4DataCompressor.h", bycopy.} = object of vtkDataCompressor
    vtkLZ4DataCompressor* {.importc: "vtkLZ4DataCompressor".}: VTK_NEWINSTANCE
    ##  Compression method required by vtkDataCompressor.

  vtkLZ4DataCompressorSuperclass* = vtkDataCompressor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkLZ4DataCompressor::IsTypeOf(@)",
    header: "vtkLZ4DataCompressor.h".}
proc IsA*(this: var vtkLZ4DataCompressor; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkLZ4DataCompressor.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkLZ4DataCompressor {.
    importcpp: "vtkLZ4DataCompressor::SafeDownCast(@)",
    header: "vtkLZ4DataCompressor.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkLZ4DataCompressor :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkDataCompressor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkLZ4DataCompressor :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkLZ4DataCompressor :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkLZ4DataCompressor; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkLZ4DataCompressor.h".}
proc New*(): ptr vtkLZ4DataCompressor {.importcpp: "vtkLZ4DataCompressor::New(@)",
                                    header: "vtkLZ4DataCompressor.h".}
proc GetMaximumCompressionSpace*(this: var vtkLZ4DataCompressor; size: csize_t): csize_t {.
    importcpp: "GetMaximumCompressionSpace", header: "vtkLZ4DataCompressor.h".}
proc GetCompressionLevel*(this: var vtkLZ4DataCompressor): cint {.
    importcpp: "GetCompressionLevel", header: "vtkLZ4DataCompressor.h".}
proc SetCompressionLevel*(this: var vtkLZ4DataCompressor; compressionLevel: cint) {.
    importcpp: "SetCompressionLevel", header: "vtkLZ4DataCompressor.h".}
proc SetAccelerationLevel*(this: var vtkLZ4DataCompressor; _arg: cint) {.
    importcpp: "SetAccelerationLevel", header: "vtkLZ4DataCompressor.h".}
proc GetAccelerationLevelMinValue*(this: var vtkLZ4DataCompressor): cint {.
    importcpp: "GetAccelerationLevelMinValue", header: "vtkLZ4DataCompressor.h".}
proc GetAccelerationLevelMaxValue*(this: var vtkLZ4DataCompressor): cint {.
    importcpp: "GetAccelerationLevelMaxValue", header: "vtkLZ4DataCompressor.h".}
## !!!Ignored construct:  virtual int GetAccelerationLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AccelerationLevel  of  << this -> AccelerationLevel ) ; return this -> AccelerationLevel ; } ;
## Error: expected ';'!!!
