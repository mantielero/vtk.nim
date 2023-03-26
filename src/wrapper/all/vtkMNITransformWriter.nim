## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMNITransformWriter.h
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
##  @class   vtkMNITransformWriter
##  @brief   A writer for MNI transformation files.
##
##  The MNI .xfm file format is used to store geometrical
##  transformations.  Three kinds of transformations are supported by
##  the file format: affine, thin-plate spline, and grid transformations.
##  This file format was developed at the McConnell Brain Imaging Centre
##  at the Montreal Neurological Institute and is used by their software.
##  @sa
##  vtkMINCImageWriter vtkMNITransformReader
##  @par Thanks:
##  Thanks to David Gobbi for writing this class and Atamai Inc. for
##  contributing it to VTK.
##

import
  vtkAlgorithm, vtkIOMINCModule

discard "forward decl of vtkAbstractTransform"
discard "forward decl of vtkHomogeneousTransform"
discard "forward decl of vtkThinPlateSplineTransform"
discard "forward decl of vtkGridTransform"
discard "forward decl of vtkCollection"
type
  vtkMNITransformWriter* {.importcpp: "vtkMNITransformWriter",
                          header: "vtkMNITransformWriter.h", bycopy.} = object of vtkAlgorithm
    vtkMNITransformWriter* {.importc: "vtkMNITransformWriter".}: VTK_NEWINSTANCE
    VTK_FUTURE_CONST* {.importc: "VTK_FUTURE_CONST".}: VTK_FILEPATH

  vtkMNITransformWriterSuperclass* = vtkAlgorithm

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkMNITransformWriter::IsTypeOf(@)",
    header: "vtkMNITransformWriter.h".}
proc IsA*(this: var vtkMNITransformWriter; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkMNITransformWriter.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkMNITransformWriter {.
    importcpp: "vtkMNITransformWriter::SafeDownCast(@)",
    header: "vtkMNITransformWriter.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkMNITransformWriter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMNITransformWriter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMNITransformWriter :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc New*(): ptr vtkMNITransformWriter {.importcpp: "vtkMNITransformWriter::New(@)",
                                     header: "vtkMNITransformWriter.h".}
proc PrintSelf*(this: var vtkMNITransformWriter; os: var ostream; indent: vtkIndent) {.
    importcpp: "PrintSelf", header: "vtkMNITransformWriter.h".}
## !!!Ignored construct:  /@{ *
##  Set the file name.
##  virtual void SetFileNameFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ;
## Error: token expected: ) but got: *!!!

## !!!Ignored construct:  char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ;
## Error: expected ';'!!!

proc GetFileExtensions*(this: var vtkMNITransformWriter): cstring {.
    importcpp: "GetFileExtensions", header: "vtkMNITransformWriter.h".}
proc GetDescriptiveName*(this: var vtkMNITransformWriter): cstring {.
    importcpp: "GetDescriptiveName", header: "vtkMNITransformWriter.h".}
proc SetTransform*(this: var vtkMNITransformWriter;
                  transform: ptr vtkAbstractTransform) {.importcpp: "SetTransform",
    header: "vtkMNITransformWriter.h".}
proc GetTransform*(this: var vtkMNITransformWriter): ptr vtkAbstractTransform {.
    importcpp: "GetTransform", header: "vtkMNITransformWriter.h".}
proc AddTransform*(this: var vtkMNITransformWriter;
                  transform: ptr vtkAbstractTransform) {.importcpp: "AddTransform",
    header: "vtkMNITransformWriter.h".}
proc GetNumberOfTransforms*(this: var vtkMNITransformWriter): cint {.
    importcpp: "GetNumberOfTransforms", header: "vtkMNITransformWriter.h".}
proc SetComments*(this: var vtkMNITransformWriter; _arg: cstring) {.
    importcpp: "SetComments", header: "vtkMNITransformWriter.h".}
proc GetComments*(this: var vtkMNITransformWriter): cstring {.
    importcpp: "GetComments", header: "vtkMNITransformWriter.h".}
  ## /@}
  ## *
  ##  Write the file.
  ##
proc Write*(this: var vtkMNITransformWriter) {.importcpp: "Write",
    header: "vtkMNITransformWriter.h".}