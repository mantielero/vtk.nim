## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMNITransformReader.h
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
## =========================================================================
##
## Copyright (c) 2006 Atamai, Inc.
##
## Use, modification and redistribution of the software, in source or
## binary forms, are permitted provided that the following terms and
## conditions are met:
##
## 1) Redistribution of the source code, in verbatim or modified
##    form, must retain the above copyright notice, this license,
##    the following disclaimer, and any notices that refer to this
##    license and/or the following disclaimer.
##
## 2) Redistribution in binary form must include the above copyright
##    notice, a copy of this license and the following disclaimer
##    in the documentation or with other materials provided with the
##    distribution.
##
## 3) Modified copies of the source code must be clearly marked as such,
##    and must not be misrepresented as verbatim copies of the source code.
##
## THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE SOFTWARE "AS IS"
## WITHOUT EXPRESSED OR IMPLIED WARRANTY INCLUDING, BUT NOT LIMITED TO,
## THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
## PURPOSE.  IN NO EVENT SHALL ANY COPYRIGHT HOLDER OR OTHER PARTY WHO MAY
## MODIFY AND/OR REDISTRIBUTE THE SOFTWARE UNDER THE TERMS OF THIS LICENSE
## BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES
## (INCLUDING, BUT NOT LIMITED TO, LOSS OF DATA OR DATA BECOMING INACCURATE
## OR LOSS OF PROFIT OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF
## THE USE OR INABILITY TO USE THE SOFTWARE, EVEN IF ADVISED OF THE
## POSSIBILITY OF SUCH DAMAGES.
##
## =========================================================================
## *
##  @class   vtkMNITransformReader
##  @brief   A reader for MNI transformation files.
##
##  The MNI .xfm file format is used to store geometrical
##  transformations.  Three kinds of transformations are supported by
##  the file format: affine, thin-plate spline, and grid transformations.
##  This file format was developed at the McConnell Brain Imaging Centre
##  at the Montreal Neurological Institute and is used by their software.
##  @sa
##  vtkMINCImageReader vtkMNITransformWriter
##  @par Thanks:
##  Thanks to David Gobbi for writing this class and Atamai Inc. for
##  contributing it to VTK.
##

import
  vtkAlgorithm, vtkIOMINCModule

discard "forward decl of vtkAbstractTransform"
discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkCollection"
type
  vtkMNITransformReader* {.importcpp: "vtkMNITransformReader",
                          header: "vtkMNITransformReader.h", bycopy.} = object of vtkAlgorithm
    vtkMNITransformReader* {.importc: "vtkMNITransformReader".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkMNITransformReaderSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMNITransformReader::IsTypeOf(@)",
    header: "vtkMNITransformReader.h".}
proc IsA*(this: var vtkMNITransformReader; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMNITransformReader.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMNITransformReader {.
    importcpp: "vtkMNITransformReader::SafeDownCast(@)",
    header: "vtkMNITransformReader.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMNITransformReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMNITransformReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMNITransformReader :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkMNITransformReader {.importcpp: "vtkMNITransformReader::New(@)",
                                     header: "vtkMNITransformReader.h".}
proc PrintSelf*(this: var vtkMNITransformReader; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMNITransformReader.h".}
## !!!Ignored construct:  /@{ *
##  Set the file name.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc GetFileExtensions*(this: var vtkMNITransformReader): cstring {.
    importcpp: "GetFileExtensions", header: "vtkMNITransformReader.h".}
proc GetDescriptiveName*(this: var vtkMNITransformReader): cstring {.
    importcpp: "GetDescriptiveName", header: "vtkMNITransformReader.h".}
## !!!Ignored construct:  *
##  Test whether the specified file can be read.
##  virtual int CanReadFile ( VTK_FILEPATH const char * name ) ;
## Error: token expected: ) but got: *!!!

proc GetNumberOfTransforms*(this: var vtkMNITransformReader): cint {.
    importcpp: "GetNumberOfTransforms", header: "vtkMNITransformReader.h".}
proc GetNthTransform*(this: var vtkMNITransformReader; i: cint): ptr vtkAbstractTransform {.
    importcpp: "GetNthTransform", header: "vtkMNITransformReader.h".}
proc GetTransform*(this: var vtkMNITransformReader): ptr vtkAbstractTransform {.
    importcpp: "GetTransform", header: "vtkMNITransformReader.h".}
proc GetComments*(this: var vtkMNITransformReader): cstring {.
    importcpp: "GetComments", header: "vtkMNITransformReader.h".}